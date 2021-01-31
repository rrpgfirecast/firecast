require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmBase()
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
    obj:setName("frmBase");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
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
    obj.label1:setWidth(75);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(80);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(75);
    obj.label2:setHeight(25);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Aptidão");
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(80);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setWidth(150);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("aptidao");
    obj.comboBox1:setItems({'Alquimista', 'Arcanista', 'Caçador', 'Bestial', 'Cavaleiro', 'Monge', 'Necromante', 'Xamã', 'Atirador', 'Cigano', 'Hoplita', 'Shinobi', 'Executor', 'Invocador', 'Paladino', 'Harmonista'});
    obj.comboBox1:setValues({'1', '2', '3', '13', '4', '5', '6', '7', '8', '9', '10', '11', '12', '14', '15', '16'});
    obj.comboBox1:setName("comboBox1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(225);
    obj.label3:setTop(5);
    obj.label3:setWidth(75);
    obj.label3:setHeight(25);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("Nível");
    obj.label3:setName("label3");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(300);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(300);
    obj.label4:setTop(5);
    obj.label4:setWidth(50);
    obj.label4:setHeight(25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setField("nivel");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(225);
    obj.label5:setTop(30);
    obj.label5:setWidth(75);
    obj.label5:setHeight(25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("Rank");
    obj.label5:setName("label5");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setLeft(300);
    obj.rectangle3:setTop(30);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(300);
    obj.label6:setTop(30);
    obj.label6:setWidth(50);
    obj.label6:setHeight(25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setField("rank");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(345);
    obj.label7:setTop(5);
    obj.label7:setWidth(100);
    obj.label7:setHeight(25);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setText("Experiência");
    obj.label7:setName("label7");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(440);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("experiencia");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(345);
    obj.label8:setTop(30);
    obj.label8:setWidth(100);
    obj.label8:setHeight(25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("Prestígio");
    obj.label8:setName("label8");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(440);
    obj.edit3:setTop(30);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("progresso");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setLeft(480);
    obj.label9:setTop(5);
    obj.label9:setWidth(75);
    obj.label9:setHeight(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setText("Mergo");
    obj.label9:setName("label9");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(545);
    obj.edit4:setTop(5);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("mergo");
    obj.edit4:setName("edit4");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle1);
    obj.label10:setLeft(480);
    obj.label10:setTop(30);
    obj.label10:setWidth(75);
    obj.label10:setHeight(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Aruman");
    obj.label10:setName("label10");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(545);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("pecas");
    obj.edit5:setName("edit5");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setField("nivel");
    obj.dataLink1:setName("dataLink1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(605);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(305);
    obj.rectangle4:setHeight(305);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

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

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(65);
    obj.rectangle5:setWidth(285);
    obj.rectangle5:setHeight(240);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle5);
    obj.label11:setLeft(0);
    obj.label11:setTop(5);
    obj.label11:setWidth(285);
    obj.label11:setHeight(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setText("Atributos Básicos");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle5);
    obj.label12:setLeft(75);
    obj.label12:setTop(30);
    obj.label12:setWidth(40);
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("Natural");
    obj.label12:setFontSize(11);
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle5);
    obj.label13:setLeft(115);
    obj.label13:setTop(30);
    obj.label13:setWidth(40);
    obj.label13:setHeight(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setText("Adic.");
    obj.label13:setFontSize(11);
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle5);
    obj.label14:setLeft(155);
    obj.label14:setTop(30);
    obj.label14:setWidth(40);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setText("Total");
    obj.label14:setFontSize(11);
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle5);
    obj.label15:setLeft(195);
    obj.label15:setTop(30);
    obj.label15:setWidth(40);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setText("Perícia");
    obj.label15:setFontSize(11);
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle5);
    obj.label16:setLeft(235);
    obj.label16:setTop(30);
    obj.label16:setWidth(40);
    obj.label16:setHeight(25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setText("Act");
    obj.label16:setFontSize(11);
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle5);
    obj.label17:setLeft(0);
    obj.label17:setTop(55);
    obj.label17:setWidth(75);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setText("Agilidade");
    obj.label17:setFontSize(13);
    obj.label17:setName("label17");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle5);
    obj.edit6:setLeft(75);
    obj.edit6:setTop(55);
    obj.edit6:setWidth(40);
    obj.edit6:setHeight(25);
    obj.edit6:setField("agilidade_nivel");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle5);
    obj.edit7:setLeft(115);
    obj.edit7:setTop(55);
    obj.edit7:setWidth(40);
    obj.edit7:setHeight(25);
    obj.edit7:setField("agilidade_outros");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle5);
    obj.rectangle6:setLeft(155);
    obj.rectangle6:setTop(55);
    obj.rectangle6:setWidth(40);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle5);
    obj.label18:setLeft(155);
    obj.label18:setTop(55);
    obj.label18:setWidth(40);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setField("agilidade_total");
    obj.label18:setName("label18");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle5);
    obj.rectangle7:setLeft(195);
    obj.rectangle7:setTop(55);
    obj.rectangle7:setWidth(40);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle5);
    obj.label19:setLeft(195);
    obj.label19:setTop(55);
    obj.label19:setWidth(40);
    obj.label19:setHeight(25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setField("agilidade_pericia");
    obj.label19:setName("label19");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle5);
    obj.rectangle8:setLeft(235);
    obj.rectangle8:setTop(55);
    obj.rectangle8:setWidth(40);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle5);
    obj.label20:setLeft(235);
    obj.label20:setTop(55);
    obj.label20:setWidth(40);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setField("agilidade_act");
    obj.label20:setName("label20");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle5);
    obj.dataLink2:setFields({'agilidade_nivel', 'agilidade_outros', 'equip_arma_act','equip_arma2_act','equip_equipamento_act','equip_vestimenta_act'});
    obj.dataLink2:setName("dataLink2");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle5);
    obj.label21:setLeft(0);
    obj.label21:setTop(80);
    obj.label21:setWidth(75);
    obj.label21:setHeight(25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setText("Constituição");
    obj.label21:setFontSize(11);
    obj.label21:setName("label21");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle5);
    obj.edit8:setLeft(75);
    obj.edit8:setTop(80);
    obj.edit8:setWidth(40);
    obj.edit8:setHeight(25);
    obj.edit8:setField("cac_nivel");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle5);
    obj.edit9:setLeft(115);
    obj.edit9:setTop(80);
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(25);
    obj.edit9:setField("cac_outros");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle5);
    obj.rectangle9:setLeft(155);
    obj.rectangle9:setTop(80);
    obj.rectangle9:setWidth(40);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle5);
    obj.label22:setLeft(155);
    obj.label22:setTop(80);
    obj.label22:setWidth(40);
    obj.label22:setHeight(25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setField("cac_total");
    obj.label22:setName("label22");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.rectangle5);
    obj.rectangle10:setLeft(195);
    obj.rectangle10:setTop(80);
    obj.rectangle10:setWidth(40);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle5);
    obj.label23:setLeft(195);
    obj.label23:setTop(80);
    obj.label23:setWidth(40);
    obj.label23:setHeight(25);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setField("cac_pericia");
    obj.label23:setName("label23");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.rectangle5);
    obj.rectangle11:setLeft(235);
    obj.rectangle11:setTop(80);
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle5);
    obj.label24:setLeft(235);
    obj.label24:setTop(80);
    obj.label24:setWidth(40);
    obj.label24:setHeight(25);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setField("cac_act");
    obj.label24:setName("label24");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle5);
    obj.dataLink3:setFields({'cac_nivel', 'cac_outros', 'equip_arma_act','equip_arma2_act','equip_equipamento_act','equip_vestimenta_act'});
    obj.dataLink3:setName("dataLink3");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle5);
    obj.label25:setLeft(0);
    obj.label25:setTop(105);
    obj.label25:setWidth(75);
    obj.label25:setHeight(25);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setText("Destreza");
    obj.label25:setFontSize(13);
    obj.label25:setName("label25");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle5);
    obj.edit10:setLeft(75);
    obj.edit10:setTop(105);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(25);
    obj.edit10:setField("manuseio_nivel");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle5);
    obj.edit11:setLeft(115);
    obj.edit11:setTop(105);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(25);
    obj.edit11:setField("manuseio_outros");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle5);
    obj.rectangle12:setLeft(155);
    obj.rectangle12:setTop(105);
    obj.rectangle12:setWidth(40);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle5);
    obj.label26:setLeft(155);
    obj.label26:setTop(105);
    obj.label26:setWidth(40);
    obj.label26:setHeight(25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setField("manuseio_total");
    obj.label26:setName("label26");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.rectangle5);
    obj.rectangle13:setLeft(195);
    obj.rectangle13:setTop(105);
    obj.rectangle13:setWidth(40);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle5);
    obj.label27:setLeft(195);
    obj.label27:setTop(105);
    obj.label27:setWidth(40);
    obj.label27:setHeight(25);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setField("manuseio_pericia");
    obj.label27:setName("label27");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.rectangle5);
    obj.rectangle14:setLeft(235);
    obj.rectangle14:setTop(105);
    obj.rectangle14:setWidth(40);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle5);
    obj.label28:setLeft(235);
    obj.label28:setTop(105);
    obj.label28:setWidth(40);
    obj.label28:setHeight(25);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setField("manuseio_act");
    obj.label28:setName("label28");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle5);
    obj.dataLink4:setFields({'manuseio_nivel', 'manuseio_outros', 'equip_arma_act','equip_arma2_act','equip_equipamento_act','equip_vestimenta_act'});
    obj.dataLink4:setName("dataLink4");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle5);
    obj.label29:setLeft(0);
    obj.label29:setTop(130);
    obj.label29:setWidth(75);
    obj.label29:setHeight(25);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setText("Foco");
    obj.label29:setFontSize(13);
    obj.label29:setName("label29");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle5);
    obj.edit12:setLeft(75);
    obj.edit12:setTop(130);
    obj.edit12:setWidth(40);
    obj.edit12:setHeight(25);
    obj.edit12:setField("pontaria_nivel");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle5);
    obj.edit13:setLeft(115);
    obj.edit13:setTop(130);
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(25);
    obj.edit13:setField("pontaria_outros");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.rectangle5);
    obj.rectangle15:setLeft(155);
    obj.rectangle15:setTop(130);
    obj.rectangle15:setWidth(40);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle5);
    obj.label30:setLeft(155);
    obj.label30:setTop(130);
    obj.label30:setWidth(40);
    obj.label30:setHeight(25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setField("pontaria_total");
    obj.label30:setName("label30");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.rectangle5);
    obj.rectangle16:setLeft(195);
    obj.rectangle16:setTop(130);
    obj.rectangle16:setWidth(40);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle5);
    obj.label31:setLeft(195);
    obj.label31:setTop(130);
    obj.label31:setWidth(40);
    obj.label31:setHeight(25);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setField("pontaria_pericia");
    obj.label31:setName("label31");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.rectangle5);
    obj.rectangle17:setLeft(235);
    obj.rectangle17:setTop(130);
    obj.rectangle17:setWidth(40);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle5);
    obj.label32:setLeft(235);
    obj.label32:setTop(130);
    obj.label32:setWidth(40);
    obj.label32:setHeight(25);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setField("pontaria_act");
    obj.label32:setName("label32");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle5);
    obj.dataLink5:setFields({'pontaria_nivel', 'pontaria_outros', 'equip_arma_act','equip_arma2_act','equip_equipamento_act','equip_vestimenta_act'});
    obj.dataLink5:setName("dataLink5");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle5);
    obj.label33:setLeft(0);
    obj.label33:setTop(155);
    obj.label33:setWidth(75);
    obj.label33:setHeight(25);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setText("Reverberação");
    obj.label33:setFontSize(11);
    obj.label33:setName("label33");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle5);
    obj.edit14:setLeft(75);
    obj.edit14:setTop(155);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(25);
    obj.edit14:setField("paranormalidade_nivel");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle5);
    obj.edit15:setLeft(115);
    obj.edit15:setTop(155);
    obj.edit15:setWidth(40);
    obj.edit15:setHeight(25);
    obj.edit15:setField("paranormalidade_outros");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.rectangle5);
    obj.rectangle18:setLeft(155);
    obj.rectangle18:setTop(155);
    obj.rectangle18:setWidth(40);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle5);
    obj.label34:setLeft(155);
    obj.label34:setTop(155);
    obj.label34:setWidth(40);
    obj.label34:setHeight(25);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setField("paranormalidade_total");
    obj.label34:setName("label34");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.rectangle5);
    obj.rectangle19:setLeft(195);
    obj.rectangle19:setTop(155);
    obj.rectangle19:setWidth(40);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle5);
    obj.label35:setLeft(195);
    obj.label35:setTop(155);
    obj.label35:setWidth(40);
    obj.label35:setHeight(25);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setField("paranormalidade_pericia");
    obj.label35:setName("label35");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.rectangle5);
    obj.rectangle20:setLeft(235);
    obj.rectangle20:setTop(155);
    obj.rectangle20:setWidth(40);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle5);
    obj.label36:setLeft(235);
    obj.label36:setTop(155);
    obj.label36:setWidth(40);
    obj.label36:setHeight(25);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setField("paranormalidade_act");
    obj.label36:setName("label36");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle5);
    obj.dataLink6:setFields({'paranormalidade_nivel', 'paranormalidade_outros', 'equip_arma_act','equip_arma2_act','equip_equipamento_act','equip_vestimenta_act'});
    obj.dataLink6:setName("dataLink6");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle5);
    obj.label37:setLeft(0);
    obj.label37:setTop(180);
    obj.label37:setWidth(75);
    obj.label37:setHeight(25);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setText("Sorte");
    obj.label37:setFontSize(13);
    obj.label37:setName("label37");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle5);
    obj.edit16:setLeft(75);
    obj.edit16:setTop(180);
    obj.edit16:setWidth(40);
    obj.edit16:setHeight(25);
    obj.edit16:setField("sorte_nivel");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle5);
    obj.edit17:setLeft(115);
    obj.edit17:setTop(180);
    obj.edit17:setWidth(40);
    obj.edit17:setHeight(25);
    obj.edit17:setField("sorte_outros");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle5);
    obj.rectangle21:setLeft(155);
    obj.rectangle21:setTop(180);
    obj.rectangle21:setWidth(40);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle5);
    obj.label38:setLeft(155);
    obj.label38:setTop(180);
    obj.label38:setWidth(40);
    obj.label38:setHeight(25);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setField("sorte_total");
    obj.label38:setName("label38");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.rectangle5);
    obj.rectangle22:setLeft(195);
    obj.rectangle22:setTop(180);
    obj.rectangle22:setWidth(40);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle5);
    obj.label39:setLeft(195);
    obj.label39:setTop(180);
    obj.label39:setWidth(40);
    obj.label39:setHeight(25);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setField("sorte_pericia");
    obj.label39:setName("label39");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.rectangle5);
    obj.rectangle23:setLeft(235);
    obj.rectangle23:setTop(180);
    obj.rectangle23:setWidth(40);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle5);
    obj.label40:setLeft(235);
    obj.label40:setTop(180);
    obj.label40:setWidth(40);
    obj.label40:setHeight(25);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setField("sorte_act");
    obj.label40:setName("label40");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle5);
    obj.dataLink7:setFields({'sorte_nivel', 'sorte_outros', 'equip_arma_act','equip_arma2_act','equip_equipamento_act','equip_vestimenta_act'});
    obj.dataLink7:setName("dataLink7");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.rectangle5);
    obj.rectangle24:setLeft(15);
    obj.rectangle24:setTop(210);
    obj.rectangle24:setWidth(50);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.atr_max = GUI.fromHandle(_obj_newObject("label"));
    obj.atr_max:setParent(obj.rectangle5);
    obj.atr_max:setLeft(15);
    obj.atr_max:setTop(210);
    obj.atr_max:setWidth(50);
    obj.atr_max:setHeight(25);
    obj.atr_max:setHorzTextAlign("center");
    obj.atr_max:setField("atr_max");
    obj.atr_max:setName("atr_max");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle5);
    obj.rectangle25:setLeft(75);
    obj.rectangle25:setTop(210);
    obj.rectangle25:setWidth(50);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle5);
    obj.label41:setLeft(75);
    obj.label41:setTop(210);
    obj.label41:setWidth(50);
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setField("sum_nivel");
    obj.label41:setName("label41");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle5);
    obj.dataLink8:setFields({'atr_max','sum_nivel'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle5);
    obj.dataLink9:setFields({'agilidade_nivel', 'cac_nivel', 'manuseio_nivel', 'pontaria_nivel', 'paranormalidade_nivel', 'sorte_nivel'});
    obj.dataLink9:setName("dataLink9");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(290);
    obj.layout1:setTop(65);
    obj.layout1:setWidth(310);
    obj.layout1:setHeight(240);
    obj.layout1:setName("layout1");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout1);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout1);
    obj.label42:setLeft(5);
    obj.label42:setTop(1);
    obj.label42:setWidth(300);
    obj.label42:setHeight(20);
    obj.label42:setText("Características");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout1);
    obj.label43:setLeft(5);
    obj.label43:setTop(25);
    obj.label43:setWidth(110);
    obj.label43:setHeight(20);
    obj.label43:setText("Carisma/Charme");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout1);
    obj.edit18:setLeft(115);
    obj.edit18:setTop(25);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setField("carac_p_1");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout1);
    obj.label44:setLeft(185);
    obj.label44:setTop(25);
    obj.label44:setWidth(110);
    obj.label44:setHeight(20);
    obj.label44:setText("Emotividade");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout1);
    obj.edit19:setLeft(155);
    obj.edit19:setTop(25);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setField("carac_n_1");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout1);
    obj.label45:setLeft(5);
    obj.label45:setTop(50);
    obj.label45:setWidth(110);
    obj.label45:setHeight(20);
    obj.label45:setText("Força de Vontade");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout1);
    obj.edit20:setLeft(115);
    obj.edit20:setTop(50);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setField("carac_p_2");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout1);
    obj.label46:setLeft(185);
    obj.label46:setTop(50);
    obj.label46:setWidth(110);
    obj.label46:setHeight(20);
    obj.label46:setText("Trauma/Medo");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout1);
    obj.edit21:setLeft(155);
    obj.edit21:setTop(50);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setField("carac_n_2");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout1);
    obj.label47:setLeft(5);
    obj.label47:setTop(75);
    obj.label47:setWidth(110);
    obj.label47:setHeight(20);
    obj.label47:setText("Intelecto");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout1);
    obj.edit22:setLeft(115);
    obj.edit22:setTop(75);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setField("carac_p_3");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout1);
    obj.label48:setLeft(185);
    obj.label48:setTop(75);
    obj.label48:setWidth(110);
    obj.label48:setHeight(20);
    obj.label48:setText("Materialismo");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout1);
    obj.edit23:setLeft(155);
    obj.edit23:setTop(75);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setField("carac_n_3");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout1);
    obj.label49:setLeft(5);
    obj.label49:setTop(100);
    obj.label49:setWidth(110);
    obj.label49:setHeight(20);
    obj.label49:setText("Intuição");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout1);
    obj.edit24:setLeft(115);
    obj.edit24:setTop(100);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setField("carac_p_4");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout1);
    obj.label50:setLeft(185);
    obj.label50:setTop(100);
    obj.label50:setWidth(110);
    obj.label50:setHeight(20);
    obj.label50:setText("Impulsividade");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout1);
    obj.edit25:setLeft(155);
    obj.edit25:setTop(100);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setField("carac_n_4");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout1);
    obj.label51:setLeft(5);
    obj.label51:setTop(125);
    obj.label51:setWidth(110);
    obj.label51:setHeight(20);
    obj.label51:setText("Discernimento");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout1);
    obj.edit26:setLeft(115);
    obj.edit26:setTop(125);
    obj.edit26:setWidth(30);
    obj.edit26:setHeight(25);
    obj.edit26:setField("carac_p_5");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout1);
    obj.label52:setLeft(185);
    obj.label52:setTop(125);
    obj.label52:setWidth(110);
    obj.label52:setHeight(20);
    obj.label52:setText("Desatenção");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout1);
    obj.edit27:setLeft(155);
    obj.edit27:setTop(125);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setField("carac_n_5");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout1);
    obj.label53:setLeft(5);
    obj.label53:setTop(150);
    obj.label53:setWidth(110);
    obj.label53:setHeight(20);
    obj.label53:setText("Fleuma");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout1);
    obj.edit28:setLeft(115);
    obj.edit28:setTop(150);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setField("carac_p_6");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout1);
    obj.label54:setLeft(185);
    obj.label54:setTop(150);
    obj.label54:setWidth(110);
    obj.label54:setHeight(20);
    obj.label54:setText("Irritação/Orgulho");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout1);
    obj.edit29:setLeft(155);
    obj.edit29:setTop(150);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setField("carac_n_6");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout1);
    obj.rectangle27:setLeft(115);
    obj.rectangle27:setTop(175);
    obj.rectangle27:setWidth(30);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout1);
    obj.label55:setLeft(115);
    obj.label55:setTop(175);
    obj.label55:setWidth(30);
    obj.label55:setHeight(25);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setField("carac_gasto");
    obj.label55:setName("label55");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout1);
    obj.edit30:setLeft(155);
    obj.edit30:setTop(175);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setField("carac_extra");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout1);
    obj.rectangle28:setLeft(185);
    obj.rectangle28:setTop(175);
    obj.rectangle28:setWidth(30);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.carac_total = GUI.fromHandle(_obj_newObject("label"));
    obj.carac_total:setParent(obj.layout1);
    obj.carac_total:setLeft(185);
    obj.carac_total:setTop(175);
    obj.carac_total:setWidth(30);
    obj.carac_total:setHeight(25);
    obj.carac_total:setHorzTextAlign("center");
    obj.carac_total:setField("carac_total");
    obj.carac_total:setFontColor("green");
    obj.carac_total:setName("carac_total");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout1);
    obj.label56:setLeft(45);
    obj.label56:setTop(205);
    obj.label56:setWidth(100);
    obj.label56:setHeight(25);
    obj.label56:setText("Carma");
    obj.label56:setName("label56");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout1);
    obj.comboBox2:setLeft(100);
    obj.comboBox2:setTop(205);
    obj.comboBox2:setWidth(200);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("carma");
    obj.comboBox2:setItems({'Divino','Virtuoso','Humano','Herege','Demoníaco'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout1);
    obj.dataLink10:setFields({'carac_p_1','carac_p_2','carac_p_3','carac_p_4','carac_p_5','carac_p_6'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout1);
    obj.dataLink11:setFields({'carac_n_1','carac_n_2','carac_n_3','carac_n_4','carac_n_5','carac_n_6'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout1);
    obj.dataLink12:setFields({'nivel','carac_penalidade', 'carac_extra'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout1);
    obj.dataLink13:setFields({'carac_gasto','carac_total'});
    obj.dataLink13:setName("dataLink13");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.scrollBox1);
    obj.rectangle29:setLeft(0);
    obj.rectangle29:setTop(310);
    obj.rectangle29:setWidth(285);
    obj.rectangle29:setHeight(105);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle29);
    obj.label57:setLeft(0);
    obj.label57:setTop(0);
    obj.label57:setWidth(285);
    obj.label57:setHeight(20);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setText("Integridade");
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle29);
    obj.label58:setLeft(0);
    obj.label58:setTop(25);
    obj.label58:setWidth(75);
    obj.label58:setHeight(25);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setText("Vida");
    obj.label58:setName("label58");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.rectangle29);
    obj.rectangle30:setLeft(75);
    obj.rectangle30:setTop(25);
    obj.rectangle30:setWidth(50);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle29);
    obj.label59:setLeft(75);
    obj.label59:setTop(25);
    obj.label59:setWidth(50);
    obj.label59:setHeight(25);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setField("vidaBase");
    obj.label59:setName("label59");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle29);
    obj.edit31:setLeft(125);
    obj.edit31:setTop(25);
    obj.edit31:setWidth(80);
    obj.edit31:setHeight(25);
    obj.edit31:setField("vidaCompensacao");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.rectangle29);
    obj.rectangle31:setLeft(205);
    obj.rectangle31:setTop(25);
    obj.rectangle31:setWidth(75);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle29);
    obj.label60:setLeft(205);
    obj.label60:setTop(25);
    obj.label60:setWidth(75);
    obj.label60:setHeight(25);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setField("vidaAtual");
    obj.label60:setName("label60");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectangle29);
    obj.dataLink14:setFields({'vidaBase','vidaCompensacao'});
    obj.dataLink14:setName("dataLink14");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle29);
    obj.label61:setLeft(0);
    obj.label61:setTop(50);
    obj.label61:setWidth(75);
    obj.label61:setHeight(25);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setText("Fadiga");
    obj.label61:setName("label61");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.rectangle29);
    obj.rectangle32:setLeft(75);
    obj.rectangle32:setTop(50);
    obj.rectangle32:setWidth(50);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle29);
    obj.label62:setLeft(75);
    obj.label62:setTop(50);
    obj.label62:setWidth(50);
    obj.label62:setHeight(25);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setField("fadigaBase");
    obj.label62:setName("label62");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle29);
    obj.edit32:setLeft(125);
    obj.edit32:setTop(50);
    obj.edit32:setWidth(80);
    obj.edit32:setHeight(25);
    obj.edit32:setField("fadigaCompensacao");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.rectangle29);
    obj.rectangle33:setLeft(205);
    obj.rectangle33:setTop(50);
    obj.rectangle33:setWidth(75);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle29);
    obj.label63:setLeft(205);
    obj.label63:setTop(50);
    obj.label63:setWidth(75);
    obj.label63:setHeight(25);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setField("fadigaAtual");
    obj.label63:setName("label63");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectangle29);
    obj.dataLink15:setFields({'fadigaBase','fadigaCompensacao'});
    obj.dataLink15:setName("dataLink15");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle29);
    obj.label64:setLeft(0);
    obj.label64:setTop(75);
    obj.label64:setWidth(75);
    obj.label64:setHeight(25);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setText("Imersão");
    obj.label64:setName("label64");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.rectangle29);
    obj.rectangle34:setLeft(75);
    obj.rectangle34:setTop(75);
    obj.rectangle34:setWidth(50);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle29);
    obj.label65:setLeft(75);
    obj.label65:setTop(75);
    obj.label65:setWidth(50);
    obj.label65:setHeight(25);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setField("imersaoBase");
    obj.label65:setName("label65");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle29);
    obj.edit33:setLeft(125);
    obj.edit33:setTop(75);
    obj.edit33:setWidth(80);
    obj.edit33:setHeight(25);
    obj.edit33:setField("imersaoCompensacao");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.rectangle29);
    obj.rectangle35:setLeft(205);
    obj.rectangle35:setTop(75);
    obj.rectangle35:setWidth(75);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle29);
    obj.label66:setLeft(205);
    obj.label66:setTop(75);
    obj.label66:setWidth(75);
    obj.label66:setHeight(25);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setField("imersaoAtual");
    obj.label66:setName("label66");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle29);
    obj.dataLink16:setFields({'imersaoBase','imersaoCompensacao'});
    obj.dataLink16:setName("dataLink16");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.scrollBox1);
    obj.rectangle36:setLeft(0);
    obj.rectangle36:setTop(420);
    obj.rectangle36:setWidth(285);
    obj.rectangle36:setHeight(260);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle36);
    obj.label67:setLeft(0);
    obj.label67:setTop(0);
    obj.label67:setWidth(285);
    obj.label67:setHeight(20);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setText("Beneficios");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle36);
    obj.label68:setLeft(0);
    obj.label68:setTop(25);
    obj.label68:setWidth(75);
    obj.label68:setHeight(25);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setText("Ultimato");
    obj.label68:setName("label68");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle36);
    obj.edit34:setLeft(75);
    obj.edit34:setTop(25);
    obj.edit34:setWidth(200);
    obj.edit34:setHeight(25);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setField("ultimato");
    obj.edit34:setName("edit34");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle36);
    obj.label69:setLeft(0);
    obj.label69:setTop(50);
    obj.label69:setWidth(75);
    obj.label69:setHeight(25);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setText("Sentinela");
    obj.label69:setName("label69");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle36);
    obj.edit35:setLeft(75);
    obj.edit35:setTop(50);
    obj.edit35:setWidth(200);
    obj.edit35:setHeight(25);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setField("sentinela");
    obj.edit35:setName("edit35");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle36);
    obj.label70:setLeft(0);
    obj.label70:setTop(75);
    obj.label70:setWidth(75);
    obj.label70:setHeight(25);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setText("Bençãos");
    obj.label70:setName("label70");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle36);
    obj.textEditor1:setLeft(75);
    obj.textEditor1:setTop(75);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(180);
    obj.textEditor1:setField("bencaos_feiticos");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.scrollBox1);
    obj.rectangle37:setLeft(290);
    obj.rectangle37:setTop(310);
    obj.rectangle37:setWidth(620);
    obj.rectangle37:setHeight(370);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle37);
    obj.label71:setAlign("top");
    obj.label71:setHeight(20);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setText("Tabela de Status de Combate");
    obj.label71:setName("label71");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle37);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(310);
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(20);
    obj.layout3:setName("layout3");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout3);
    obj.label72:setWidth(310);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setText("Poderes");
    obj.label72:setName("label72");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout3);
    obj.label73:setLeft(230);
    obj.label73:setWidth(37.5);
    obj.label73:setHeight(20);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setText("Pri");
    obj.label73:setName("label73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout3);
    obj.label74:setLeft(267.5);
    obj.label74:setWidth(37.5);
    obj.label74:setHeight(20);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setText("Sec");
    obj.label74:setName("label74");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout4);
    obj.label75:setLeft(5);
    obj.label75:setWidth(100);
    obj.label75:setHeight(25);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setText("Poder Físico");
    obj.label75:setFontSize(13);
    obj.label75:setName("label75");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout4);
    obj.rectangle38:setLeft(105);
    obj.rectangle38:setWidth(50);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout4);
    obj.label76:setLeft(105);
    obj.label76:setWidth(50);
    obj.label76:setHeight(25);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setField("poderFisicoBase");
    obj.label76:setName("label76");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout4);
    obj.edit36:setLeft(155);
    obj.edit36:setWidth(37.5);
    obj.edit36:setHeight(25);
    obj.edit36:setField("poderFisicoAdicional1");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout4);
    obj.edit37:setLeft(192.5);
    obj.edit37:setWidth(37.5);
    obj.edit37:setHeight(25);
    obj.edit37:setField("poderFisicoAdicional2");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout4);
    obj.rectangle39:setLeft(230);
    obj.rectangle39:setWidth(37.5);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout4);
    obj.label77:setLeft(230);
    obj.label77:setWidth(37.5);
    obj.label77:setHeight(25);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setField("poderFisicoTotal1");
    obj.label77:setName("label77");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout4);
    obj.rectangle40:setLeft(267.5);
    obj.rectangle40:setWidth(37.5);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout4);
    obj.label78:setLeft(267.5);
    obj.label78:setWidth(37.5);
    obj.label78:setHeight(25);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setField("poderFisicoTotal2");
    obj.label78:setName("label78");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout2);
    obj.dataLink17:setFields({'poderFisicoBase','poderFisicoAdicional1','poderFisicoBase2','poderFisicoAdicional2'});
    obj.dataLink17:setName("dataLink17");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout5);
    obj.label79:setLeft(5);
    obj.label79:setWidth(100);
    obj.label79:setHeight(25);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setText("Poder Paranormal");
    obj.label79:setFontSize(11);
    obj.label79:setName("label79");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout5);
    obj.rectangle41:setLeft(105);
    obj.rectangle41:setWidth(50);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout5);
    obj.label80:setLeft(105);
    obj.label80:setWidth(50);
    obj.label80:setHeight(25);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setField("poderParanormalBase");
    obj.label80:setName("label80");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout5);
    obj.edit38:setLeft(155);
    obj.edit38:setWidth(37.5);
    obj.edit38:setHeight(25);
    obj.edit38:setField("poderParanormalAdicional1");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout5);
    obj.edit39:setLeft(192.5);
    obj.edit39:setWidth(37.5);
    obj.edit39:setHeight(25);
    obj.edit39:setField("poderParanormalAdicional2");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout5);
    obj.rectangle42:setLeft(230);
    obj.rectangle42:setWidth(37.5);
    obj.rectangle42:setHeight(25);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout5);
    obj.label81:setLeft(230);
    obj.label81:setWidth(37.5);
    obj.label81:setHeight(25);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setField("poderParanormalTotal1");
    obj.label81:setName("label81");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout5);
    obj.rectangle43:setLeft(267.5);
    obj.rectangle43:setWidth(37.5);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout5);
    obj.label82:setLeft(267.5);
    obj.label82:setWidth(37.5);
    obj.label82:setHeight(25);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setField("poderParanormalTotal2");
    obj.label82:setName("label82");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout2);
    obj.dataLink18:setFields({'poderParanormalBase','poderParanormalAdicional1','poderParanormalBase2','poderParanormalAdicional2'});
    obj.dataLink18:setName("dataLink18");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout6);
    obj.label83:setLeft(5);
    obj.label83:setWidth(100);
    obj.label83:setHeight(25);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setText("Poder de Projétil");
    obj.label83:setFontSize(11);
    obj.label83:setName("label83");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout6);
    obj.rectangle44:setLeft(105);
    obj.rectangle44:setWidth(50);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout6);
    obj.label84:setLeft(105);
    obj.label84:setWidth(50);
    obj.label84:setHeight(25);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setField("poderProjetilBase");
    obj.label84:setName("label84");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout6);
    obj.edit40:setLeft(155);
    obj.edit40:setWidth(37.5);
    obj.edit40:setHeight(25);
    obj.edit40:setField("poderProjetilAdicional1");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout6);
    obj.edit41:setLeft(192.5);
    obj.edit41:setWidth(37.5);
    obj.edit41:setHeight(25);
    obj.edit41:setField("poderProjetilAdicional2");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout6);
    obj.rectangle45:setLeft(230);
    obj.rectangle45:setWidth(37.5);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout6);
    obj.label85:setLeft(230);
    obj.label85:setWidth(37.5);
    obj.label85:setHeight(25);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setField("poderProjetilTotal1");
    obj.label85:setName("label85");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout6);
    obj.rectangle46:setLeft(267.5);
    obj.rectangle46:setWidth(37.5);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout6);
    obj.label86:setLeft(267.5);
    obj.label86:setWidth(37.5);
    obj.label86:setHeight(25);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setField("poderProjetilTotal2");
    obj.label86:setName("label86");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout2);
    obj.dataLink19:setFields({'poderProjetilBase','poderProjetilAdicional1','poderProjetilBase2','poderProjetilAdicional2'});
    obj.dataLink19:setName("dataLink19");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout2);
    obj.label87:setAlign("top");
    obj.label87:setHeight(20);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setText("Atribuições");
    obj.label87:setName("label87");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout7);
    obj.label88:setLeft(5);
    obj.label88:setWidth(100);
    obj.label88:setHeight(25);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setText("Estamina");
    obj.label88:setFontSize(13);
    obj.label88:setName("label88");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout7);
    obj.rectangle47:setLeft(105);
    obj.rectangle47:setWidth(50);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout7);
    obj.label89:setLeft(105);
    obj.label89:setWidth(50);
    obj.label89:setHeight(25);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setField("ptsInstantaneaBase");
    obj.label89:setName("label89");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout7);
    obj.edit42:setLeft(155);
    obj.edit42:setWidth(75);
    obj.edit42:setHeight(25);
    obj.edit42:setField("ptsInstantaneaAdicional");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout7);
    obj.rectangle48:setLeft(230);
    obj.rectangle48:setWidth(37.5);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout7);
    obj.label90:setLeft(230);
    obj.label90:setWidth(37.5);
    obj.label90:setHeight(25);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setField("ptsInstantaneaTotal1");
    obj.label90:setName("label90");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout7);
    obj.rectangle49:setLeft(267.5);
    obj.rectangle49:setWidth(37.5);
    obj.rectangle49:setHeight(25);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout7);
    obj.label91:setLeft(267.5);
    obj.label91:setWidth(37.5);
    obj.label91:setHeight(25);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setField("ptsInstantaneaTotal2");
    obj.label91:setName("label91");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout2);
    obj.dataLink20:setFields({'ptsInstantaneaBase','ptsInstantaneaAdicional'});
    obj.dataLink20:setName("dataLink20");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout8);
    obj.label92:setLeft(5);
    obj.label92:setWidth(100);
    obj.label92:setHeight(25);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setText("Reg. de Vida");
    obj.label92:setFontSize(13);
    obj.label92:setName("label92");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout8);
    obj.rectangle50:setLeft(105);
    obj.rectangle50:setWidth(50);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout8);
    obj.label93:setLeft(105);
    obj.label93:setWidth(50);
    obj.label93:setHeight(25);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setField("regVidaBase");
    obj.label93:setName("label93");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout8);
    obj.edit43:setLeft(155);
    obj.edit43:setWidth(75);
    obj.edit43:setHeight(25);
    obj.edit43:setField("regVidaAdicional");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout8);
    obj.rectangle51:setLeft(230);
    obj.rectangle51:setWidth(37.5);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout8);
    obj.label94:setLeft(230);
    obj.label94:setWidth(37.5);
    obj.label94:setHeight(25);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setField("regVidaTotal1");
    obj.label94:setName("label94");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout8);
    obj.rectangle52:setLeft(267.5);
    obj.rectangle52:setWidth(37.5);
    obj.rectangle52:setHeight(25);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout8);
    obj.label95:setLeft(267.5);
    obj.label95:setWidth(37.5);
    obj.label95:setHeight(25);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setField("regVidaTotal2");
    obj.label95:setName("label95");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout2);
    obj.dataLink21:setFields({'regVidaBase','regVidaAdicional'});
    obj.dataLink21:setName("dataLink21");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout2);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout9);
    obj.label96:setLeft(5);
    obj.label96:setWidth(100);
    obj.label96:setHeight(25);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setText("Reg. de Fadiga");
    obj.label96:setFontSize(13);
    obj.label96:setName("label96");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout9);
    obj.rectangle53:setLeft(105);
    obj.rectangle53:setWidth(50);
    obj.rectangle53:setHeight(25);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setName("rectangle53");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout9);
    obj.label97:setLeft(105);
    obj.label97:setWidth(50);
    obj.label97:setHeight(25);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setField("regFadigaBase");
    obj.label97:setName("label97");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout9);
    obj.edit44:setLeft(155);
    obj.edit44:setWidth(75);
    obj.edit44:setHeight(25);
    obj.edit44:setField("regFadigaAdicional");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout9);
    obj.rectangle54:setLeft(230);
    obj.rectangle54:setWidth(37.5);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout9);
    obj.label98:setLeft(230);
    obj.label98:setWidth(37.5);
    obj.label98:setHeight(25);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setField("regFadigaTotal1");
    obj.label98:setName("label98");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout9);
    obj.rectangle55:setLeft(267.5);
    obj.rectangle55:setWidth(37.5);
    obj.rectangle55:setHeight(25);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout9);
    obj.label99:setLeft(267.5);
    obj.label99:setWidth(37.5);
    obj.label99:setHeight(25);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setField("regFadigaTotal2");
    obj.label99:setName("label99");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout2);
    obj.dataLink22:setFields({'regFadigaBase','regFadigaAdicional'});
    obj.dataLink22:setName("dataLink22");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout2);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout10);
    obj.label100:setLeft(5);
    obj.label100:setWidth(100);
    obj.label100:setHeight(25);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setText("Chance de Crítico");
    obj.label100:setFontSize(11);
    obj.label100:setName("label100");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout10);
    obj.rectangle56:setLeft(105);
    obj.rectangle56:setWidth(50);
    obj.rectangle56:setHeight(25);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout10);
    obj.label101:setLeft(105);
    obj.label101:setWidth(50);
    obj.label101:setHeight(25);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setField("criticoBase");
    obj.label101:setName("label101");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout10);
    obj.edit45:setLeft(155);
    obj.edit45:setWidth(75);
    obj.edit45:setHeight(25);
    obj.edit45:setField("criticoAdicional");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout10);
    obj.rectangle57:setLeft(230);
    obj.rectangle57:setWidth(37.5);
    obj.rectangle57:setHeight(25);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout10);
    obj.label102:setLeft(230);
    obj.label102:setWidth(37.5);
    obj.label102:setHeight(25);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setField("criticoTotal1");
    obj.label102:setName("label102");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout10);
    obj.rectangle58:setLeft(267.5);
    obj.rectangle58:setWidth(37.5);
    obj.rectangle58:setHeight(25);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout10);
    obj.label103:setLeft(267.5);
    obj.label103:setWidth(37.5);
    obj.label103:setHeight(25);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setField("criticoTotal2");
    obj.label103:setName("label103");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout2);
    obj.dataLink23:setFields({'criticoBase','criticoAdicional'});
    obj.dataLink23:setName("dataLink23");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout2);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout11);
    obj.label104:setLeft(5);
    obj.label104:setWidth(100);
    obj.label104:setHeight(25);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setText("Amplificação");
    obj.label104:setFontSize(13);
    obj.label104:setName("label104");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout11);
    obj.rectangle59:setLeft(105);
    obj.rectangle59:setWidth(50);
    obj.rectangle59:setHeight(25);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout11);
    obj.label105:setLeft(105);
    obj.label105:setWidth(50);
    obj.label105:setHeight(25);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setField("amplificacaoBase");
    obj.label105:setName("label105");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout11);
    obj.edit46:setLeft(155);
    obj.edit46:setWidth(75);
    obj.edit46:setHeight(25);
    obj.edit46:setField("amplificacaoAdicional");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout11);
    obj.rectangle60:setLeft(230);
    obj.rectangle60:setWidth(37.5);
    obj.rectangle60:setHeight(25);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setStrokeColor("white");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout11);
    obj.label106:setLeft(230);
    obj.label106:setWidth(37.5);
    obj.label106:setHeight(25);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setField("amplificacaoTotal1");
    obj.label106:setName("label106");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout11);
    obj.rectangle61:setLeft(267.5);
    obj.rectangle61:setWidth(37.5);
    obj.rectangle61:setHeight(25);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setStrokeColor("white");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setName("rectangle61");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout11);
    obj.label107:setLeft(267.5);
    obj.label107:setWidth(37.5);
    obj.label107:setHeight(25);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setField("amplificacaoTotal2");
    obj.label107:setName("label107");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout2);
    obj.dataLink24:setFields({'amplificacaoBase','amplificacaoAdicional'});
    obj.dataLink24:setName("dataLink24");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout2);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout12);
    obj.label108:setLeft(5);
    obj.label108:setWidth(100);
    obj.label108:setHeight(25);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setText("Precisão");
    obj.label108:setFontSize(13);
    obj.label108:setName("label108");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout12);
    obj.rectangle62:setLeft(105);
    obj.rectangle62:setWidth(50);
    obj.rectangle62:setHeight(25);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setStrokeColor("white");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setName("rectangle62");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout12);
    obj.label109:setLeft(105);
    obj.label109:setWidth(50);
    obj.label109:setHeight(25);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setField("negacaoBase");
    obj.label109:setName("label109");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout12);
    obj.edit47:setLeft(155);
    obj.edit47:setWidth(75);
    obj.edit47:setHeight(25);
    obj.edit47:setField("negacaoAdicional");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout12);
    obj.rectangle63:setLeft(230);
    obj.rectangle63:setWidth(37.5);
    obj.rectangle63:setHeight(25);
    obj.rectangle63:setColor("black");
    obj.rectangle63:setStrokeColor("white");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setName("rectangle63");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout12);
    obj.label110:setLeft(230);
    obj.label110:setWidth(37.5);
    obj.label110:setHeight(25);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setField("negacaoTotal1");
    obj.label110:setName("label110");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout12);
    obj.rectangle64:setLeft(267.5);
    obj.rectangle64:setWidth(37.5);
    obj.rectangle64:setHeight(25);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setName("rectangle64");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout12);
    obj.label111:setLeft(267.5);
    obj.label111:setWidth(37.5);
    obj.label111:setHeight(25);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setField("negacaoTotal2");
    obj.label111:setName("label111");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout2);
    obj.dataLink25:setFields({'negacaoBase','negacaoAdicional'});
    obj.dataLink25:setName("dataLink25");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout2);
    obj.label112:setAlign("top");
    obj.label112:setHeight(20);
    obj.label112:setHorzTextAlign("center");
    obj.label112:setText("Defesa");
    obj.label112:setName("label112");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout2);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout13);
    obj.label113:setLeft(5);
    obj.label113:setWidth(100);
    obj.label113:setHeight(25);
    obj.label113:setHorzTextAlign("center");
    obj.label113:setText("Bloq. Físico");
    obj.label113:setFontSize(13);
    obj.label113:setName("label113");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout13);
    obj.rectangle65:setLeft(105);
    obj.rectangle65:setWidth(50);
    obj.rectangle65:setHeight(25);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setName("rectangle65");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout13);
    obj.label114:setLeft(105);
    obj.label114:setWidth(50);
    obj.label114:setHeight(25);
    obj.label114:setHorzTextAlign("center");
    obj.label114:setField("bloqueioFisBase");
    obj.label114:setName("label114");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout13);
    obj.edit48:setLeft(155);
    obj.edit48:setWidth(75);
    obj.edit48:setHeight(25);
    obj.edit48:setField("bloqueioFisAdicional");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout13);
    obj.rectangle66:setLeft(230);
    obj.rectangle66:setWidth(37.5);
    obj.rectangle66:setHeight(25);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setStrokeColor("white");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setName("rectangle66");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout13);
    obj.label115:setLeft(230);
    obj.label115:setWidth(37.5);
    obj.label115:setHeight(25);
    obj.label115:setHorzTextAlign("center");
    obj.label115:setField("bloqueioFisTotal1");
    obj.label115:setName("label115");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout13);
    obj.rectangle67:setLeft(267.5);
    obj.rectangle67:setWidth(37.5);
    obj.rectangle67:setHeight(25);
    obj.rectangle67:setColor("black");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setName("rectangle67");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout13);
    obj.label116:setLeft(267.5);
    obj.label116:setWidth(37.5);
    obj.label116:setHeight(25);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setField("bloqueioFisTotal2");
    obj.label116:setName("label116");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout2);
    obj.dataLink26:setFields({'bloqueioFisBase','bloqueioFisAdicional'});
    obj.dataLink26:setName("dataLink26");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout14);
    obj.label117:setLeft(5);
    obj.label117:setWidth(100);
    obj.label117:setHeight(25);
    obj.label117:setHorzTextAlign("center");
    obj.label117:setText("Bloq. Paranormal");
    obj.label117:setFontSize(13);
    obj.label117:setName("label117");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout14);
    obj.rectangle68:setLeft(105);
    obj.rectangle68:setWidth(50);
    obj.rectangle68:setHeight(25);
    obj.rectangle68:setColor("black");
    obj.rectangle68:setStrokeColor("white");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setName("rectangle68");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout14);
    obj.label118:setLeft(105);
    obj.label118:setWidth(50);
    obj.label118:setHeight(25);
    obj.label118:setHorzTextAlign("center");
    obj.label118:setField("bloqueioParBase");
    obj.label118:setName("label118");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout14);
    obj.edit49:setLeft(155);
    obj.edit49:setWidth(75);
    obj.edit49:setHeight(25);
    obj.edit49:setField("bloqueioParAdicional");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout14);
    obj.rectangle69:setLeft(230);
    obj.rectangle69:setWidth(37.5);
    obj.rectangle69:setHeight(25);
    obj.rectangle69:setColor("black");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout14);
    obj.label119:setLeft(230);
    obj.label119:setWidth(37.5);
    obj.label119:setHeight(25);
    obj.label119:setHorzTextAlign("center");
    obj.label119:setField("bloqueioParTotal1");
    obj.label119:setName("label119");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout14);
    obj.rectangle70:setLeft(267.5);
    obj.rectangle70:setWidth(37.5);
    obj.rectangle70:setHeight(25);
    obj.rectangle70:setColor("black");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setName("rectangle70");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout14);
    obj.label120:setLeft(267.5);
    obj.label120:setWidth(37.5);
    obj.label120:setHeight(25);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setField("bloqueioParTotal2");
    obj.label120:setName("label120");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout2);
    obj.dataLink27:setFields({'bloqueioParBase','bloqueioParAdicional'});
    obj.dataLink27:setName("dataLink27");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle37);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(310);
    obj.layout15:setName("layout15");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout15);
    obj.label121:setAlign("top");
    obj.label121:setHeight(20);
    obj.label121:setHorzTextAlign("center");
    obj.label121:setText("Redutores");
    obj.label121:setName("label121");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout16);
    obj.label122:setLeft(5);
    obj.label122:setWidth(100);
    obj.label122:setHeight(25);
    obj.label122:setHorzTextAlign("center");
    obj.label122:setText("Físico");
    obj.label122:setFontSize(13);
    obj.label122:setName("label122");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout16);
    obj.rectangle71:setLeft(105);
    obj.rectangle71:setWidth(50);
    obj.rectangle71:setHeight(25);
    obj.rectangle71:setColor("black");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout16);
    obj.label123:setLeft(105);
    obj.label123:setWidth(50);
    obj.label123:setHeight(25);
    obj.label123:setHorzTextAlign("center");
    obj.label123:setField("fisicoBase");
    obj.label123:setName("label123");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout16);
    obj.edit50:setLeft(155);
    obj.edit50:setWidth(75);
    obj.edit50:setHeight(25);
    obj.edit50:setField("fisicoAdicional");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setType("number");
    obj.edit50:setName("edit50");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout16);
    obj.rectangle72:setLeft(230);
    obj.rectangle72:setWidth(37.5);
    obj.rectangle72:setHeight(25);
    obj.rectangle72:setColor("black");
    obj.rectangle72:setStrokeColor("white");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setName("rectangle72");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout16);
    obj.label124:setLeft(230);
    obj.label124:setWidth(37.5);
    obj.label124:setHeight(25);
    obj.label124:setHorzTextAlign("center");
    obj.label124:setField("fisicoTotal1");
    obj.label124:setName("label124");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout16);
    obj.rectangle73:setLeft(267.5);
    obj.rectangle73:setWidth(37.5);
    obj.rectangle73:setHeight(25);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout16);
    obj.label125:setLeft(267.5);
    obj.label125:setWidth(37.5);
    obj.label125:setHeight(25);
    obj.label125:setHorzTextAlign("center");
    obj.label125:setField("fisicoTotal2");
    obj.label125:setName("label125");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout15);
    obj.dataLink28:setFields({'fisicoBase','fisicoAdicional'});
    obj.dataLink28:setName("dataLink28");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout17);
    obj.label126:setLeft(5);
    obj.label126:setWidth(100);
    obj.label126:setHeight(25);
    obj.label126:setHorzTextAlign("center");
    obj.label126:setText("Paranormal");
    obj.label126:setFontSize(13);
    obj.label126:setName("label126");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout17);
    obj.rectangle74:setLeft(105);
    obj.rectangle74:setWidth(50);
    obj.rectangle74:setHeight(25);
    obj.rectangle74:setColor("black");
    obj.rectangle74:setStrokeColor("white");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setName("rectangle74");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout17);
    obj.label127:setLeft(105);
    obj.label127:setWidth(50);
    obj.label127:setHeight(25);
    obj.label127:setHorzTextAlign("center");
    obj.label127:setField("paranormalBase");
    obj.label127:setName("label127");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout17);
    obj.edit51:setLeft(155);
    obj.edit51:setWidth(75);
    obj.edit51:setHeight(25);
    obj.edit51:setField("paranormalAdicional");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout17);
    obj.rectangle75:setLeft(230);
    obj.rectangle75:setWidth(37.5);
    obj.rectangle75:setHeight(25);
    obj.rectangle75:setColor("black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout17);
    obj.label128:setLeft(230);
    obj.label128:setWidth(37.5);
    obj.label128:setHeight(25);
    obj.label128:setHorzTextAlign("center");
    obj.label128:setField("paranormalTotal1");
    obj.label128:setName("label128");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout17);
    obj.rectangle76:setLeft(267.5);
    obj.rectangle76:setWidth(37.5);
    obj.rectangle76:setHeight(25);
    obj.rectangle76:setColor("black");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setName("rectangle76");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout17);
    obj.label129:setLeft(267.5);
    obj.label129:setWidth(37.5);
    obj.label129:setHeight(25);
    obj.label129:setHorzTextAlign("center");
    obj.label129:setField("paranormalTotal2");
    obj.label129:setName("label129");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout15);
    obj.dataLink29:setFields({'paranormalBase','paranormalAdicional'});
    obj.dataLink29:setName("dataLink29");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout15);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout18);
    obj.label130:setLeft(5);
    obj.label130:setWidth(100);
    obj.label130:setHeight(25);
    obj.label130:setHorzTextAlign("center");
    obj.label130:setText("Projétil");
    obj.label130:setFontSize(13);
    obj.label130:setName("label130");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout18);
    obj.rectangle77:setLeft(105);
    obj.rectangle77:setWidth(50);
    obj.rectangle77:setHeight(25);
    obj.rectangle77:setColor("black");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setName("rectangle77");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout18);
    obj.label131:setLeft(105);
    obj.label131:setWidth(50);
    obj.label131:setHeight(25);
    obj.label131:setHorzTextAlign("center");
    obj.label131:setField("projetilBase");
    obj.label131:setName("label131");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout18);
    obj.edit52:setLeft(155);
    obj.edit52:setWidth(75);
    obj.edit52:setHeight(25);
    obj.edit52:setField("projetilAdicional");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout18);
    obj.rectangle78:setLeft(230);
    obj.rectangle78:setWidth(37.5);
    obj.rectangle78:setHeight(25);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setName("rectangle78");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout18);
    obj.label132:setLeft(230);
    obj.label132:setWidth(37.5);
    obj.label132:setHeight(25);
    obj.label132:setHorzTextAlign("center");
    obj.label132:setField("projetilTotal1");
    obj.label132:setName("label132");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout18);
    obj.rectangle79:setLeft(267.5);
    obj.rectangle79:setWidth(37.5);
    obj.rectangle79:setHeight(25);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setStrokeColor("white");
    obj.rectangle79:setStrokeSize(1);
    obj.rectangle79:setName("rectangle79");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout18);
    obj.label133:setLeft(267.5);
    obj.label133:setWidth(37.5);
    obj.label133:setHeight(25);
    obj.label133:setHorzTextAlign("center");
    obj.label133:setField("projetilTotal2");
    obj.label133:setName("label133");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout15);
    obj.dataLink30:setFields({'projetilBase','projetilAdicional'});
    obj.dataLink30:setName("dataLink30");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout15);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout19);
    obj.label134:setLeft(5);
    obj.label134:setWidth(100);
    obj.label134:setHeight(25);
    obj.label134:setHorzTextAlign("center");
    obj.label134:setText("Corrosivo");
    obj.label134:setFontSize(13);
    obj.label134:setName("label134");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout19);
    obj.rectangle80:setLeft(105);
    obj.rectangle80:setWidth(50);
    obj.rectangle80:setHeight(25);
    obj.rectangle80:setColor("black");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setName("rectangle80");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout19);
    obj.label135:setLeft(105);
    obj.label135:setWidth(50);
    obj.label135:setHeight(25);
    obj.label135:setHorzTextAlign("center");
    obj.label135:setField("corrosivoBase");
    obj.label135:setName("label135");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout19);
    obj.edit53:setLeft(155);
    obj.edit53:setWidth(75);
    obj.edit53:setHeight(25);
    obj.edit53:setField("corrosivoAdicional");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setType("number");
    obj.edit53:setName("edit53");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout19);
    obj.rectangle81:setLeft(230);
    obj.rectangle81:setWidth(37.5);
    obj.rectangle81:setHeight(25);
    obj.rectangle81:setColor("black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setName("rectangle81");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout19);
    obj.label136:setLeft(230);
    obj.label136:setWidth(37.5);
    obj.label136:setHeight(25);
    obj.label136:setHorzTextAlign("center");
    obj.label136:setField("corrosivoTotal1");
    obj.label136:setName("label136");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout19);
    obj.rectangle82:setLeft(267.5);
    obj.rectangle82:setWidth(37.5);
    obj.rectangle82:setHeight(25);
    obj.rectangle82:setColor("black");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setName("rectangle82");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout19);
    obj.label137:setLeft(267.5);
    obj.label137:setWidth(37.5);
    obj.label137:setHeight(25);
    obj.label137:setHorzTextAlign("center");
    obj.label137:setField("corrosivoTotal2");
    obj.label137:setName("label137");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout15);
    obj.dataLink31:setFields({'corrosivoBase','corrosivoAdicional'});
    obj.dataLink31:setName("dataLink31");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout15);
    obj.label138:setAlign("top");
    obj.label138:setHeight(20);
    obj.label138:setHorzTextAlign("center");
    obj.label138:setText("Resistências");
    obj.label138:setName("label138");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout15);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout20);
    obj.label139:setLeft(5);
    obj.label139:setWidth(100);
    obj.label139:setHeight(25);
    obj.label139:setHorzTextAlign("center");
    obj.label139:setText("Impelimento");
    obj.label139:setFontSize(13);
    obj.label139:setName("label139");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout20);
    obj.rectangle83:setLeft(105);
    obj.rectangle83:setWidth(50);
    obj.rectangle83:setHeight(25);
    obj.rectangle83:setColor("black");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setName("rectangle83");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout20);
    obj.label140:setLeft(105);
    obj.label140:setWidth(50);
    obj.label140:setHeight(25);
    obj.label140:setHorzTextAlign("center");
    obj.label140:setField("impelimentoBase");
    obj.label140:setName("label140");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout20);
    obj.edit54:setLeft(155);
    obj.edit54:setWidth(75);
    obj.edit54:setHeight(25);
    obj.edit54:setField("impelimentoAdicional");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout20);
    obj.rectangle84:setLeft(230);
    obj.rectangle84:setWidth(37.5);
    obj.rectangle84:setHeight(25);
    obj.rectangle84:setColor("black");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setName("rectangle84");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout20);
    obj.label141:setLeft(230);
    obj.label141:setWidth(37.5);
    obj.label141:setHeight(25);
    obj.label141:setHorzTextAlign("center");
    obj.label141:setField("impelimentoTotal1");
    obj.label141:setName("label141");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout20);
    obj.rectangle85:setLeft(267.5);
    obj.rectangle85:setWidth(37.5);
    obj.rectangle85:setHeight(25);
    obj.rectangle85:setColor("black");
    obj.rectangle85:setStrokeColor("white");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setName("rectangle85");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout20);
    obj.label142:setLeft(267.5);
    obj.label142:setWidth(37.5);
    obj.label142:setHeight(25);
    obj.label142:setHorzTextAlign("center");
    obj.label142:setField("impelimentoTotal2");
    obj.label142:setName("label142");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout15);
    obj.dataLink32:setFields({'impelimentoBase','impelimentoAdicional'});
    obj.dataLink32:setName("dataLink32");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout15);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout21);
    obj.label143:setLeft(5);
    obj.label143:setWidth(100);
    obj.label143:setHeight(25);
    obj.label143:setHorzTextAlign("center");
    obj.label143:setText("Sangramento");
    obj.label143:setFontSize(13);
    obj.label143:setName("label143");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout21);
    obj.rectangle86:setLeft(105);
    obj.rectangle86:setWidth(50);
    obj.rectangle86:setHeight(25);
    obj.rectangle86:setColor("black");
    obj.rectangle86:setStrokeColor("white");
    obj.rectangle86:setStrokeSize(1);
    obj.rectangle86:setName("rectangle86");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout21);
    obj.label144:setLeft(105);
    obj.label144:setWidth(50);
    obj.label144:setHeight(25);
    obj.label144:setHorzTextAlign("center");
    obj.label144:setField("sangramentoBase");
    obj.label144:setName("label144");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout21);
    obj.edit55:setLeft(155);
    obj.edit55:setWidth(75);
    obj.edit55:setHeight(25);
    obj.edit55:setField("sangramentoAdicional");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setType("number");
    obj.edit55:setName("edit55");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout21);
    obj.rectangle87:setLeft(230);
    obj.rectangle87:setWidth(37.5);
    obj.rectangle87:setHeight(25);
    obj.rectangle87:setColor("black");
    obj.rectangle87:setStrokeColor("white");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setName("rectangle87");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout21);
    obj.label145:setLeft(230);
    obj.label145:setWidth(37.5);
    obj.label145:setHeight(25);
    obj.label145:setHorzTextAlign("center");
    obj.label145:setField("sangramentoTotal1");
    obj.label145:setName("label145");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout21);
    obj.rectangle88:setLeft(267.5);
    obj.rectangle88:setWidth(37.5);
    obj.rectangle88:setHeight(25);
    obj.rectangle88:setColor("black");
    obj.rectangle88:setStrokeColor("white");
    obj.rectangle88:setStrokeSize(1);
    obj.rectangle88:setName("rectangle88");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout21);
    obj.label146:setLeft(267.5);
    obj.label146:setWidth(37.5);
    obj.label146:setHeight(25);
    obj.label146:setHorzTextAlign("center");
    obj.label146:setField("sangramentoTotal2");
    obj.label146:setName("label146");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout15);
    obj.dataLink33:setFields({'sangramentoBase','sangramentoAdicional'});
    obj.dataLink33:setName("dataLink33");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout15);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout22);
    obj.label147:setLeft(5);
    obj.label147:setWidth(100);
    obj.label147:setHeight(25);
    obj.label147:setHorzTextAlign("center");
    obj.label147:setText("Fragilização");
    obj.label147:setFontSize(13);
    obj.label147:setName("label147");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout22);
    obj.rectangle89:setLeft(105);
    obj.rectangle89:setWidth(50);
    obj.rectangle89:setHeight(25);
    obj.rectangle89:setColor("black");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setName("rectangle89");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout22);
    obj.label148:setLeft(105);
    obj.label148:setWidth(50);
    obj.label148:setHeight(25);
    obj.label148:setHorzTextAlign("center");
    obj.label148:setField("fragilizacaoBase");
    obj.label148:setName("label148");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout22);
    obj.edit56:setLeft(155);
    obj.edit56:setWidth(75);
    obj.edit56:setHeight(25);
    obj.edit56:setField("fragilizacaoAdicional");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setType("number");
    obj.edit56:setName("edit56");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout22);
    obj.rectangle90:setLeft(230);
    obj.rectangle90:setWidth(37.5);
    obj.rectangle90:setHeight(25);
    obj.rectangle90:setColor("black");
    obj.rectangle90:setStrokeColor("white");
    obj.rectangle90:setStrokeSize(1);
    obj.rectangle90:setName("rectangle90");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout22);
    obj.label149:setLeft(230);
    obj.label149:setWidth(37.5);
    obj.label149:setHeight(25);
    obj.label149:setHorzTextAlign("center");
    obj.label149:setField("fragilizacaoTotal1");
    obj.label149:setName("label149");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout22);
    obj.rectangle91:setLeft(267.5);
    obj.rectangle91:setWidth(37.5);
    obj.rectangle91:setHeight(25);
    obj.rectangle91:setColor("black");
    obj.rectangle91:setStrokeColor("white");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setName("rectangle91");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout22);
    obj.label150:setLeft(267.5);
    obj.label150:setWidth(37.5);
    obj.label150:setHeight(25);
    obj.label150:setHorzTextAlign("center");
    obj.label150:setField("fragilizacaoTotal2");
    obj.label150:setName("label150");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout15);
    obj.dataLink34:setFields({'fragilizacaoBase','fragilizacaoAdicional'});
    obj.dataLink34:setName("dataLink34");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout15);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout23);
    obj.label151:setLeft(5);
    obj.label151:setWidth(100);
    obj.label151:setHeight(25);
    obj.label151:setHorzTextAlign("center");
    obj.label151:setText("Aturdido");
    obj.label151:setFontSize(13);
    obj.label151:setName("label151");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout23);
    obj.rectangle92:setLeft(105);
    obj.rectangle92:setWidth(50);
    obj.rectangle92:setHeight(25);
    obj.rectangle92:setColor("black");
    obj.rectangle92:setStrokeColor("white");
    obj.rectangle92:setStrokeSize(1);
    obj.rectangle92:setName("rectangle92");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout23);
    obj.label152:setLeft(105);
    obj.label152:setWidth(50);
    obj.label152:setHeight(25);
    obj.label152:setHorzTextAlign("center");
    obj.label152:setField("atordoamentoBase");
    obj.label152:setName("label152");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout23);
    obj.edit57:setLeft(155);
    obj.edit57:setWidth(75);
    obj.edit57:setHeight(25);
    obj.edit57:setField("atordoamentoAdicional");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setType("number");
    obj.edit57:setName("edit57");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout23);
    obj.rectangle93:setLeft(230);
    obj.rectangle93:setWidth(37.5);
    obj.rectangle93:setHeight(25);
    obj.rectangle93:setColor("black");
    obj.rectangle93:setStrokeColor("white");
    obj.rectangle93:setStrokeSize(1);
    obj.rectangle93:setName("rectangle93");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout23);
    obj.label153:setLeft(230);
    obj.label153:setWidth(37.5);
    obj.label153:setHeight(25);
    obj.label153:setHorzTextAlign("center");
    obj.label153:setField("atordoamentoTotal1");
    obj.label153:setName("label153");

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout23);
    obj.rectangle94:setLeft(267.5);
    obj.rectangle94:setWidth(37.5);
    obj.rectangle94:setHeight(25);
    obj.rectangle94:setColor("black");
    obj.rectangle94:setStrokeColor("white");
    obj.rectangle94:setStrokeSize(1);
    obj.rectangle94:setName("rectangle94");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout23);
    obj.label154:setLeft(267.5);
    obj.label154:setWidth(37.5);
    obj.label154:setHeight(25);
    obj.label154:setHorzTextAlign("center");
    obj.label154:setField("atordoamentoTotal2");
    obj.label154:setName("label154");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout15);
    obj.dataLink35:setFields({'atordoamentoBase','atordoamentoAdicional'});
    obj.dataLink35:setName("dataLink35");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout15);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout24);
    obj.label155:setLeft(5);
    obj.label155:setWidth(100);
    obj.label155:setHeight(25);
    obj.label155:setHorzTextAlign("center");
    obj.label155:setText("Provocação");
    obj.label155:setFontSize(13);
    obj.label155:setName("label155");

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout24);
    obj.rectangle95:setLeft(105);
    obj.rectangle95:setWidth(50);
    obj.rectangle95:setHeight(25);
    obj.rectangle95:setColor("black");
    obj.rectangle95:setStrokeColor("white");
    obj.rectangle95:setStrokeSize(1);
    obj.rectangle95:setName("rectangle95");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout24);
    obj.label156:setLeft(105);
    obj.label156:setWidth(50);
    obj.label156:setHeight(25);
    obj.label156:setHorzTextAlign("center");
    obj.label156:setField("provocacaoBase");
    obj.label156:setName("label156");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout24);
    obj.edit58:setLeft(155);
    obj.edit58:setWidth(75);
    obj.edit58:setHeight(25);
    obj.edit58:setField("provocacaoAdicional");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setType("number");
    obj.edit58:setName("edit58");

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout24);
    obj.rectangle96:setLeft(230);
    obj.rectangle96:setWidth(37.5);
    obj.rectangle96:setHeight(25);
    obj.rectangle96:setColor("black");
    obj.rectangle96:setStrokeColor("white");
    obj.rectangle96:setStrokeSize(1);
    obj.rectangle96:setName("rectangle96");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout24);
    obj.label157:setLeft(230);
    obj.label157:setWidth(37.5);
    obj.label157:setHeight(25);
    obj.label157:setHorzTextAlign("center");
    obj.label157:setField("provocacaoTotal1");
    obj.label157:setName("label157");

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout24);
    obj.rectangle97:setLeft(267.5);
    obj.rectangle97:setWidth(37.5);
    obj.rectangle97:setHeight(25);
    obj.rectangle97:setColor("black");
    obj.rectangle97:setStrokeColor("white");
    obj.rectangle97:setStrokeSize(1);
    obj.rectangle97:setName("rectangle97");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout24);
    obj.label158:setLeft(267.5);
    obj.label158:setWidth(37.5);
    obj.label158:setHeight(25);
    obj.label158:setHorzTextAlign("center");
    obj.label158:setField("provocacaoTotal2");
    obj.label158:setName("label158");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout15);
    obj.dataLink36:setFields({'provocacaoBase','provocacaoAdicional'});
    obj.dataLink36:setName("dataLink36");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout15);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout25);
    obj.label159:setLeft(5);
    obj.label159:setWidth(100);
    obj.label159:setHeight(25);
    obj.label159:setHorzTextAlign("center");
    obj.label159:setText("Silenciamento");
    obj.label159:setFontSize(13);
    obj.label159:setName("label159");

    obj.rectangle98 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout25);
    obj.rectangle98:setLeft(105);
    obj.rectangle98:setWidth(50);
    obj.rectangle98:setHeight(25);
    obj.rectangle98:setColor("black");
    obj.rectangle98:setStrokeColor("white");
    obj.rectangle98:setStrokeSize(1);
    obj.rectangle98:setName("rectangle98");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout25);
    obj.label160:setLeft(105);
    obj.label160:setWidth(50);
    obj.label160:setHeight(25);
    obj.label160:setHorzTextAlign("center");
    obj.label160:setField("silenciadoBase");
    obj.label160:setName("label160");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout25);
    obj.edit59:setLeft(155);
    obj.edit59:setWidth(75);
    obj.edit59:setHeight(25);
    obj.edit59:setField("silenciadoAdicional");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setType("number");
    obj.edit59:setName("edit59");

    obj.rectangle99 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout25);
    obj.rectangle99:setLeft(230);
    obj.rectangle99:setWidth(37.5);
    obj.rectangle99:setHeight(25);
    obj.rectangle99:setColor("black");
    obj.rectangle99:setStrokeColor("white");
    obj.rectangle99:setStrokeSize(1);
    obj.rectangle99:setName("rectangle99");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout25);
    obj.label161:setLeft(230);
    obj.label161:setWidth(37.5);
    obj.label161:setHeight(25);
    obj.label161:setHorzTextAlign("center");
    obj.label161:setField("silenciadoTotal1");
    obj.label161:setName("label161");

    obj.rectangle100 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout25);
    obj.rectangle100:setLeft(267.5);
    obj.rectangle100:setWidth(37.5);
    obj.rectangle100:setHeight(25);
    obj.rectangle100:setColor("black");
    obj.rectangle100:setStrokeColor("white");
    obj.rectangle100:setStrokeSize(1);
    obj.rectangle100:setName("rectangle100");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout25);
    obj.label162:setLeft(267.5);
    obj.label162:setWidth(37.5);
    obj.label162:setHeight(25);
    obj.label162:setHorzTextAlign("center");
    obj.label162:setField("silenciadoTotal2");
    obj.label162:setName("label162");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout15);
    obj.dataLink37:setFields({'silenciadoBase','silenciadoAdicional'});
    obj.dataLink37:setName("dataLink37");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout15);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout26);
    obj.label163:setLeft(5);
    obj.label163:setWidth(100);
    obj.label163:setHeight(25);
    obj.label163:setHorzTextAlign("center");
    obj.label163:setText("Envenenamento");
    obj.label163:setFontSize(13);
    obj.label163:setName("label163");

    obj.rectangle101 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout26);
    obj.rectangle101:setLeft(105);
    obj.rectangle101:setWidth(50);
    obj.rectangle101:setHeight(25);
    obj.rectangle101:setColor("black");
    obj.rectangle101:setStrokeColor("white");
    obj.rectangle101:setStrokeSize(1);
    obj.rectangle101:setName("rectangle101");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout26);
    obj.label164:setLeft(105);
    obj.label164:setWidth(50);
    obj.label164:setHeight(25);
    obj.label164:setHorzTextAlign("center");
    obj.label164:setField("envenenamentoBase");
    obj.label164:setName("label164");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout26);
    obj.edit60:setLeft(155);
    obj.edit60:setWidth(75);
    obj.edit60:setHeight(25);
    obj.edit60:setField("envenenamentoAdicional");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");

    obj.rectangle102 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.layout26);
    obj.rectangle102:setLeft(230);
    obj.rectangle102:setWidth(37.5);
    obj.rectangle102:setHeight(25);
    obj.rectangle102:setColor("black");
    obj.rectangle102:setStrokeColor("white");
    obj.rectangle102:setStrokeSize(1);
    obj.rectangle102:setName("rectangle102");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout26);
    obj.label165:setLeft(230);
    obj.label165:setWidth(37.5);
    obj.label165:setHeight(25);
    obj.label165:setHorzTextAlign("center");
    obj.label165:setField("envenenamentoTotal1");
    obj.label165:setName("label165");

    obj.rectangle103 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout26);
    obj.rectangle103:setLeft(267.5);
    obj.rectangle103:setWidth(37.5);
    obj.rectangle103:setHeight(25);
    obj.rectangle103:setColor("black");
    obj.rectangle103:setStrokeColor("white");
    obj.rectangle103:setStrokeSize(1);
    obj.rectangle103:setName("rectangle103");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout26);
    obj.label166:setLeft(267.5);
    obj.label166:setWidth(37.5);
    obj.label166:setHeight(25);
    obj.label166:setHorzTextAlign("center");
    obj.label166:setField("envenenamentoTotal2");
    obj.label166:setName("label166");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout15);
    obj.dataLink38:setFields({'envenenamentoBase','envenenamentoAdicional'});
    obj.dataLink38:setName("dataLink38");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout15);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout27);
    obj.label167:setLeft(5);
    obj.label167:setWidth(100);
    obj.label167:setHeight(25);
    obj.label167:setHorzTextAlign("center");
    obj.label167:setText("Incendiado");
    obj.label167:setFontSize(13);
    obj.label167:setName("label167");

    obj.rectangle104 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.layout27);
    obj.rectangle104:setLeft(105);
    obj.rectangle104:setWidth(50);
    obj.rectangle104:setHeight(25);
    obj.rectangle104:setColor("black");
    obj.rectangle104:setStrokeColor("white");
    obj.rectangle104:setStrokeSize(1);
    obj.rectangle104:setName("rectangle104");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout27);
    obj.label168:setLeft(105);
    obj.label168:setWidth(50);
    obj.label168:setHeight(25);
    obj.label168:setHorzTextAlign("center");
    obj.label168:setField("incendiadoBase");
    obj.label168:setName("label168");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout27);
    obj.edit61:setLeft(155);
    obj.edit61:setWidth(75);
    obj.edit61:setHeight(25);
    obj.edit61:setField("incendiadoAdicional");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setType("number");
    obj.edit61:setName("edit61");

    obj.rectangle105 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.layout27);
    obj.rectangle105:setLeft(230);
    obj.rectangle105:setWidth(37.5);
    obj.rectangle105:setHeight(25);
    obj.rectangle105:setColor("black");
    obj.rectangle105:setStrokeColor("white");
    obj.rectangle105:setStrokeSize(1);
    obj.rectangle105:setName("rectangle105");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout27);
    obj.label169:setLeft(230);
    obj.label169:setWidth(37.5);
    obj.label169:setHeight(25);
    obj.label169:setHorzTextAlign("center");
    obj.label169:setField("incendiadoTotal1");
    obj.label169:setName("label169");

    obj.rectangle106 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.layout27);
    obj.rectangle106:setLeft(267.5);
    obj.rectangle106:setWidth(37.5);
    obj.rectangle106:setHeight(25);
    obj.rectangle106:setColor("black");
    obj.rectangle106:setStrokeColor("white");
    obj.rectangle106:setStrokeSize(1);
    obj.rectangle106:setName("rectangle106");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout27);
    obj.label170:setLeft(267.5);
    obj.label170:setWidth(37.5);
    obj.label170:setHeight(25);
    obj.label170:setHorzTextAlign("center");
    obj.label170:setField("incendiadoTotal2");
    obj.label170:setName("label170");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout15);
    obj.dataLink39:setFields({'incendiadoBase','incendiadoAdicional'});
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.rectangle37);
    obj.dataLink40:setFields({'nivel', 'cac_total', 'paranormalidade_total', 'agilidade_total', 'sorte_total', 'manuseio_total', 'pontaria_total', 'cac_nivel', 'paranormalidade_nivel', 'manuseio_nivel', 'bloqueioFisAdicional', 'bloqueioParAdicional'});
    obj.dataLink40:setName("dataLink40");

    obj.rectangle107 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle107:setParent(obj.scrollBox1);
    obj.rectangle107:setLeft(915);
    obj.rectangle107:setTop(0);
    obj.rectangle107:setWidth(465);
    obj.rectangle107:setHeight(680);
    obj.rectangle107:setColor("black");
    obj.rectangle107:setStrokeColor("white");
    obj.rectangle107:setStrokeSize(1);
    obj.rectangle107:setName("rectangle107");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.rectangle107);
    obj.label171:setLeft(0);
    obj.label171:setTop(5);
    obj.label171:setWidth(210);
    obj.label171:setHeight(25);
    obj.label171:setHorzTextAlign("trailing");
    obj.label171:setText("Habilidades");
    obj.label171:setName("label171");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.rectangle107);
    obj.label172:setLeft(405);
    obj.label172:setTop(5);
    obj.label172:setWidth(50);
    obj.label172:setHeight(25);
    obj.label172:setHorzTextAlign("center");
    obj.label172:setText("Estágio");
    obj.label172:setFontSize(11);
    obj.label172:setName("label172");

    obj.rectangle108 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle108:setParent(obj.rectangle107);
    obj.rectangle108:setLeft(215);
    obj.rectangle108:setTop(5);
    obj.rectangle108:setWidth(50);
    obj.rectangle108:setHeight(25);
    obj.rectangle108:setColor("black");
    obj.rectangle108:setStrokeColor("white");
    obj.rectangle108:setStrokeSize(1);
    obj.rectangle108:setName("rectangle108");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.rectangle107);
    obj.label173:setLeft(215);
    obj.label173:setTop(5);
    obj.label173:setWidth(50);
    obj.label173:setHeight(25);
    obj.label173:setHorzTextAlign("center");
    obj.label173:setField("habilidadesNivel");
    obj.label173:setName("label173");

    obj.rectangle109 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle109:setParent(obj.rectangle107);
    obj.rectangle109:setLeft(270);
    obj.rectangle109:setTop(5);
    obj.rectangle109:setWidth(50);
    obj.rectangle109:setHeight(25);
    obj.rectangle109:setColor("black");
    obj.rectangle109:setStrokeColor("white");
    obj.rectangle109:setStrokeSize(1);
    obj.rectangle109:setName("rectangle109");

    obj.habilidadesDisponivel = GUI.fromHandle(_obj_newObject("label"));
    obj.habilidadesDisponivel:setParent(obj.rectangle107);
    obj.habilidadesDisponivel:setLeft(270);
    obj.habilidadesDisponivel:setTop(5);
    obj.habilidadesDisponivel:setWidth(50);
    obj.habilidadesDisponivel:setHeight(25);
    obj.habilidadesDisponivel:setHorzTextAlign("center");
    obj.habilidadesDisponivel:setField("habilidadesDisponivel");
    obj.habilidadesDisponivel:setName("habilidadesDisponivel");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.rectangle107);
    obj.dataLink41:setFields({'habilidadesNivel','habilidadesDisponivel'});
    obj.dataLink41:setName("dataLink41");

    obj.rclHabilidades = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidades:setParent(obj.rectangle107);
    obj.rclHabilidades:setLeft(5);
    obj.rclHabilidades:setTop(30);
    obj.rclHabilidades:setWidth(455);
    obj.rclHabilidades:setHeight(645);
    obj.rclHabilidades:setName("rclHabilidades");
    obj.rclHabilidades:setField("listaDeHabilidades");
    obj.rclHabilidades:setTemplateForm("frmAbilities");
    obj.rclHabilidades:setLayout("vertical");
    obj.rclHabilidades:setMinQt(5);

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

    obj._e_event1 = obj.edit3:addEventListener("onChange",
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

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nivel = (tonumber(sheet.nivel) or 0);
            					sheet.vidaBase = 560 + (nivel * 40);
            					sheet.fadigaBase = 90 + (nivel * 10);
            					sheet.imersaoBase = 90 + (nivel * 10);
            					sheet.atr_max = 44 + (nivel * 4);
            					sheet.habilidadesDisponivel = math.min(nivel*2 + 1, 25);
        end, obj);

    obj._e_event3 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event4 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.agilidade_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.agilidade_outros) or 0);
            				sheet.agilidade_total = total;
            				local act = (tonumber(sheet.equip_arma_act) or 0) + 
            							(tonumber(sheet.equip_arma2_act) or 0) + 
            							(tonumber(sheet.equip_equipamento_act) or 0) + 
            							(tonumber(sheet.equip_vestimenta_act) or 0);
            				local txt = "D (+0)";
            				
            				if total > 43 then
            					txt = "S (+8)";
            					act = act + 4;
            				elseif total > 29 then
            					txt = "A (+6)";
            					act = act + 6;
            				elseif total > 17 then
            					txt = "B (+4)";
            					act = act + 8;
            				elseif total > 7 then
            					txt = "C (+2)";
            					act = act + 10;
            				else
            					act = act + 12;
            				end;
            
            				sheet.agilidade_act = act;
            				sheet.agilidade_pericia = txt;
        end, obj);

    obj._e_event5 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.cac_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.cac_outros) or 0);
            				sheet.cac_total = total;
            				local act = (tonumber(sheet.equip_arma_act) or 0) + 
            							(tonumber(sheet.equip_arma2_act) or 0) + 
            							(tonumber(sheet.equip_equipamento_act) or 0) + 
            							(tonumber(sheet.equip_vestimenta_act) or 0);
            				local txt = "D (+0)";
            				
            				if total > 43 then
            					txt = "S (+8)";
            					act = act + 4;
            				elseif total > 29 then
            					txt = "A (+6)";
            					act = act + 6;
            				elseif total > 17 then
            					txt = "B (+4)";
            					act = act + 8;
            				elseif total > 7 then
            					txt = "C (+2)";
            					act = act + 10;
            				else
            					act = act + 12;
            				end;
            
            				sheet.cac_act = act;
            				sheet.cac_pericia = txt;
        end, obj);

    obj._e_event6 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.manuseio_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.manuseio_outros) or 0);
            				sheet.manuseio_total = total;
            				local act = (tonumber(sheet.equip_arma_act) or 0) + 
            							(tonumber(sheet.equip_arma2_act) or 0) + 
            							(tonumber(sheet.equip_equipamento_act) or 0) + 
            							(tonumber(sheet.equip_vestimenta_act) or 0);
            				local txt = "D (+0)";
            				
            				if total > 43 then
            					txt = "S (+8)";
            					act = act + 4;
            				elseif total > 29 then
            					txt = "A (+6)";
            					act = act + 6;
            				elseif total > 17 then
            					txt = "B (+4)";
            					act = act + 8;
            				elseif total > 7 then
            					txt = "C (+2)";
            					act = act + 10;
            				else
            					act = act + 12;
            				end;
            
            				sheet.manuseio_act = act;
            				sheet.manuseio_pericia = txt;
        end, obj);

    obj._e_event7 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.pontaria_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.pontaria_outros) or 0);
            				sheet.pontaria_total = total;
            				local act = (tonumber(sheet.equip_arma_act) or 0) + 
            							(tonumber(sheet.equip_arma2_act) or 0) + 
            							(tonumber(sheet.equip_equipamento_act) or 0) + 
            							(tonumber(sheet.equip_vestimenta_act) or 0);
            				local txt = "D (+0)";
            				
            				if total > 43 then
            					txt = "S (+8)";
            					act = act + 4;
            				elseif total > 29 then
            					txt = "A (+6)";
            					act = act + 6;
            				elseif total > 17 then
            					txt = "B (+4)";
            					act = act + 8;
            				elseif total > 7 then
            					txt = "C (+2)";
            					act = act + 10;
            				else
            					act = act + 12;
            				end;
            
            				sheet.pontaria_act = act;
            				sheet.pontaria_pericia = txt;
        end, obj);

    obj._e_event8 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.paranormalidade_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.paranormalidade_outros) or 0);
            				sheet.paranormalidade_total = total;
            				local act = (tonumber(sheet.equip_arma_act) or 0) + 
            							(tonumber(sheet.equip_arma2_act) or 0) + 
            							(tonumber(sheet.equip_equipamento_act) or 0) + 
            							(tonumber(sheet.equip_vestimenta_act) or 0);
            				local txt = "D (+0)";
            				
            				if total > 43 then
            					txt = "S (+8)";
            					act = act + 4;
            				elseif total > 29 then
            					txt = "A (+6)";
            					act = act + 6;
            				elseif total > 17 then
            					txt = "B (+4)";
            					act = act + 8;
            				elseif total > 7 then
            					txt = "C (+2)";
            					act = act + 10;
            				else
            					act = act + 12;
            				end;
            
            				sheet.paranormalidade_act = act;
            				sheet.paranormalidade_pericia = txt;
        end, obj);

    obj._e_event9 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.sorte_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.sorte_outros) or 0);
            				sheet.sorte_total = total;
            				local act = (tonumber(sheet.equip_arma_act) or 0) + 
            							(tonumber(sheet.equip_arma2_act) or 0) + 
            							(tonumber(sheet.equip_equipamento_act) or 0) + 
            							(tonumber(sheet.equip_vestimenta_act) or 0);
            				local txt = "D (+0)";
            				
            				if total > 43 then
            					txt = "S (+8)";
            					act = act + 4;
            				elseif total > 29 then
            					txt = "A (+6)";
            					act = act + 6;
            				elseif total > 17 then
            					txt = "B (+4)";
            					act = act + 8;
            				elseif total > 7 then
            					txt = "C (+2)";
            					act = act + 10;
            				else
            					act = act + 12;
            				end;
            
            				sheet.sorte_act = act;
            				sheet.sorte_pericia = txt;
        end, obj);

    obj._e_event10 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					
            					local max = tonumber(sheet.atr_max) or 0;
            					local gastos = tonumber(sheet.sum_nivel) or 0;
            					if max > gastos then
            						self.atr_max.fontColor = "#00FF00";
            					elseif max < gastos then
            						self.atr_max.fontColor = "#FF0000";
            					else
            						self.atr_max.fontColor = "#FFFFFF";
            					end;
        end, obj);

    obj._e_event11 = obj.dataLink9:addEventListener("onChange",
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

    obj._e_event12 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local gasto = (tonumber(sheet.carac_p_1) or 0) +
            									(tonumber(sheet.carac_p_2) or 0) +
            									(tonumber(sheet.carac_p_3) or 0) +
            									(tonumber(sheet.carac_p_4) or 0) +
            									(tonumber(sheet.carac_p_5) or 0) +
            									(tonumber(sheet.carac_p_6) or 0);
            					sheet.carac_gasto = gasto;
        end, obj);

    obj._e_event13 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local penalidade = (tonumber(sheet.carac_n_1) or 0) +
            									(tonumber(sheet.carac_n_2) or 0) +
            									(tonumber(sheet.carac_n_3) or 0) +
            									(tonumber(sheet.carac_n_4) or 0) +
            									(tonumber(sheet.carac_n_5) or 0) +
            									(tonumber(sheet.carac_n_6) or 0);
            					sheet.carac_penalidade = penalidade;
        end, obj);

    obj._e_event14 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nivel = (tonumber(sheet.nivel) or 0);
            					local pen = (sheet.carac_penalidade) or 0;
            					local extra = (sheet.carac_extra) or 0;
            
            					sheet.carac_total = nivel - 1 + pen + extra;
        end, obj);

    obj._e_event15 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local gasto = tonumber(sheet.carac_gasto) or 0;
            					local total = tonumber(sheet.carac_total) or 0;
            
            					if gasto > total then
            						self.carac_total.fontColor = "#FF0000";
            					elseif gasto==total then
            						self.carac_total.fontColor = "#FFFFFF";
            					else 
            						self.carac_total.fontColor = "#00FF00";
            					end;
        end, obj);

    obj._e_event16 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local vida = 	(tonumber(sheet.vidaBase) or 0) + 
            									(tonumber(sheet.vidaCompensacao) or 0);
            				sheet.vidaAtual = vida;
        end, obj);

    obj._e_event17 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local fadiga = 	(tonumber(sheet.fadigaBase) or 0) + 
            									(tonumber(sheet.fadigaCompensacao) or 0);
            				sheet.fadigaAtual = fadiga;
        end, obj);

    obj._e_event18 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local imersao = 	(tonumber(sheet.imersaoBase) or 0) + 
            									(tonumber(sheet.imersaoCompensacao) or 0);
            				sheet.imersaoAtual = imersao;
        end, obj);

    obj._e_event19 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local poderFisico1 = 	(tonumber(sheet.poderFisicoBase) or 0) + 
            									(tonumber(sheet.poderFisicoAdicional1) or 0);
            				local poderFisico2 = 	(tonumber(sheet.poderFisicoBase) or 0) + 
            									(tonumber(sheet.poderFisicoAdicional2) or 0);
            				local postFormat = true;
            				if postFormat then
            					sheet.poderFisicoTotal1 = poderFisico1 .. "";
            					sheet.poderFisicoTotal2 = poderFisico2 .. "";
            				else
            					sheet.poderFisicoTotal1 = "" .. poderFisico1;
            					sheet.poderFisicoTotal2 = "" .. poderFisico2;
            				end;
        end, obj);

    obj._e_event20 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local poderParanormal1 = 	(tonumber(sheet.poderParanormalBase) or 0) + 
            									(tonumber(sheet.poderParanormalAdicional1) or 0);
            				local poderParanormal2 = 	(tonumber(sheet.poderParanormalBase) or 0) + 
            									(tonumber(sheet.poderParanormalAdicional2) or 0);
            				local postFormat = true;
            				if postFormat then
            					sheet.poderParanormalTotal1 = poderParanormal1 .. "";
            					sheet.poderParanormalTotal2 = poderParanormal2 .. "";
            				else
            					sheet.poderParanormalTotal1 = "" .. poderParanormal1;
            					sheet.poderParanormalTotal2 = "" .. poderParanormal2;
            				end;
        end, obj);

    obj._e_event21 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local poderProjetil1 = 	(tonumber(sheet.poderProjetilBase) or 0) + 
            									(tonumber(sheet.poderProjetilAdicional1) or 0);
            				local poderProjetil2 = 	(tonumber(sheet.poderProjetilBase) or 0) + 
            									(tonumber(sheet.poderProjetilAdicional2) or 0);
            				local postFormat = true;
            				if postFormat then
            					sheet.poderProjetilTotal1 = poderProjetil1 .. "";
            					sheet.poderProjetilTotal2 = poderProjetil2 .. "";
            				else
            					sheet.poderProjetilTotal1 = "" .. poderProjetil1;
            					sheet.poderProjetilTotal2 = "" .. poderProjetil2;
            				end;
        end, obj);

    obj._e_event22 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local ptsInstantanea1 = 	(tonumber(sheet.ptsInstantaneaBase) or 0) + 
            									(tonumber(sheet.ptsInstantaneaAdicional) or 0);
            				sheet.ptsInstantaneaTotal1 = ptsInstantanea1;
            
            				local ptsInstantanea2 = 	math.floor(ptsInstantanea1/4);
            
            				local postFormat = true;
            				if postFormat then
            					sheet.ptsInstantaneaTotal2 = ptsInstantanea2 .. "";
            				else
            					sheet.ptsInstantaneaTotal2 = "" .. ptsInstantanea2;
            				end;
        end, obj);

    obj._e_event23 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local regVida1 = 	(tonumber(sheet.regVidaBase) or 0) + 
            									(tonumber(sheet.regVidaAdicional) or 0);
            				sheet.regVidaTotal1 = regVida1;
            
            				local regVida2 = 	math.floor(regVida1/2);
            
            				local postFormat = true;
            				if postFormat then
            					sheet.regVidaTotal2 = regVida2 .. "%";
            				else
            					sheet.regVidaTotal2 = "%" .. regVida2;
            				end;
        end, obj);

    obj._e_event24 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local regFadiga1 = 	(tonumber(sheet.regFadigaBase) or 0) + 
            									(tonumber(sheet.regFadigaAdicional) or 0);
            				sheet.regFadigaTotal1 = regFadiga1;
            
            				local regFadiga2 = 	math.floor(regFadiga1/2);
            
            				local postFormat = true;
            				if postFormat then
            					sheet.regFadigaTotal2 = regFadiga2 .. "%";
            				else
            					sheet.regFadigaTotal2 = "%" .. regFadiga2;
            				end;
        end, obj);

    obj._e_event25 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local critico1 = 	(tonumber(sheet.criticoBase) or 0) + 
            									(tonumber(sheet.criticoAdicional) or 0);
            				sheet.criticoTotal1 = critico1;
            
            				local critico2 = 	math.floor(critico1/5);
            
            				local postFormat = false;
            				if postFormat then
            					sheet.criticoTotal2 = critico2 .. "≤";
            				else
            					sheet.criticoTotal2 = "≤" .. critico2;
            				end;
        end, obj);

    obj._e_event26 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local amplificacao1 = 	(tonumber(sheet.amplificacaoBase) or 0) + 
            									(tonumber(sheet.amplificacaoAdicional) or 0);
            				sheet.amplificacaoTotal1 = amplificacao1;
            
            				local amplificacao2 = 	math.floor(amplificacao1/1);
            
            				local postFormat = true;
            				if postFormat then
            					sheet.amplificacaoTotal2 = amplificacao2 .. "%";
            				else
            					sheet.amplificacaoTotal2 = "%" .. amplificacao2;
            				end;
        end, obj);

    obj._e_event27 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local negacao1 = 	(tonumber(sheet.negacaoBase) or 0) + 
            									(tonumber(sheet.negacaoAdicional) or 0);
            				sheet.negacaoTotal1 = negacao1;
            
            				local txt = "D";
            				
            				if negacao1 > 43 then
            					txt = "S";
            				elseif negacao1 > 29 then
            					txt = "A";
            				elseif negacao1 > 17 then
            					txt = "B";
            				elseif negacao1 > 7 then
            					txt = "C";
            				end;
            
            				sheet.negacaoTotal2 = txt;
        end, obj);

    obj._e_event28 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local bloqueioFis1 = 	(tonumber(sheet.bloqueioFisBase) or 0) + 
            									(tonumber(sheet.bloqueioFisAdicional) or 0);
            				sheet.bloqueioFisTotal1 = bloqueioFis1;
        end, obj);

    obj._e_event29 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local bloqueioPar1 = 	(tonumber(sheet.bloqueioParBase) or 0) + 
            									(tonumber(sheet.bloqueioParAdicional) or 0);
            				sheet.bloqueioParTotal1 = bloqueioPar1;
        end, obj);

    obj._e_event30 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local fisico1 = 	(tonumber(sheet.fisicoBase) or 0) + 
            									(tonumber(sheet.fisicoAdicional) or 0);
            				sheet.fisicoTotal1 = fisico1;
            
            				local txt = "D";
            				
            				if fisico1 > 43 then
            					txt = "S";
            				elseif fisico1 > 29 then
            					txt = "A";
            				elseif fisico1 > 17 then
            					txt = "B";
            				elseif fisico1 > 7 then
            					txt = "C";
            				end;
            
            				sheet.fisicoTotal2 = txt;
        end, obj);

    obj._e_event31 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local paranormal1 = 	(tonumber(sheet.paranormalBase) or 0) + 
            									(tonumber(sheet.paranormalAdicional) or 0);
            				sheet.paranormalTotal1 = paranormal1;
            
            				local txt = "D";
            				
            				if paranormal1 > 43 then
            					txt = "S";
            				elseif paranormal1 > 29 then
            					txt = "A";
            				elseif paranormal1 > 17 then
            					txt = "B";
            				elseif paranormal1 > 7 then
            					txt = "C";
            				end;
            
            				sheet.paranormalTotal2 = txt;
        end, obj);

    obj._e_event32 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local projetil1 = 	(tonumber(sheet.projetilBase) or 0) + 
            									(tonumber(sheet.projetilAdicional) or 0);
            				sheet.projetilTotal1 = projetil1;
            
            				local txt = "D";
            				
            				if projetil1 > 43 then
            					txt = "S";
            				elseif projetil1 > 29 then
            					txt = "A";
            				elseif projetil1 > 17 then
            					txt = "B";
            				elseif projetil1 > 7 then
            					txt = "C";
            				end;
            
            				sheet.projetilTotal2 = txt;
        end, obj);

    obj._e_event33 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local corrosivo1 = 	(tonumber(sheet.corrosivoBase) or 0) + 
            									(tonumber(sheet.corrosivoAdicional) or 0);
            				sheet.corrosivoTotal1 = corrosivo1;
            
            				local txt = "D";
            				
            				if corrosivo1 > 43 then
            					txt = "S";
            				elseif corrosivo1 > 29 then
            					txt = "A";
            				elseif corrosivo1 > 17 then
            					txt = "B";
            				elseif corrosivo1 > 7 then
            					txt = "C";
            				end;
            
            				sheet.corrosivoTotal2 = txt;
        end, obj);

    obj._e_event34 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local impelimento1 = 	(tonumber(sheet.impelimentoBase) or 0) + 
            									(tonumber(sheet.impelimentoAdicional) or 0);
            				sheet.impelimentoTotal1 = impelimento1;
            
            				local txt = "30tm";
            				
            				if impelimento1 > 43 then
            					txt = "16tm";
            				elseif impelimento1 > 29 then
            					txt = "21tm";
            				elseif impelimento1 > 17 then
            					txt = "24tm";
            				elseif impelimento1 > 7 then
            					txt = "27tm";
            				end;
            
            				sheet.impelimentoTotal2 = txt;
        end, obj);

    obj._e_event35 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local sangramento1 = 	(tonumber(sheet.sangramentoBase) or 0) + 
            									(tonumber(sheet.sangramentoAdicional) or 0);
            				sheet.sangramentoTotal1 = sangramento1;
            
            				local txt = "50tm";
            				
            				if sangramento1 > 43 then
            					txt = "28tm";
            				elseif sangramento1 > 29 then
            					txt = "35tm";
            				elseif sangramento1 > 17 then
            					txt = "41tm";
            				elseif sangramento1 > 7 then
            					txt = "46tm";
            				end;
            
            				sheet.sangramentoTotal2 = txt;
        end, obj);

    obj._e_event36 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local fragilizacao1 = 	(tonumber(sheet.fragilizacaoBase) or 0) + 
            									(tonumber(sheet.fragilizacaoAdicional) or 0);
            				sheet.fragilizacaoTotal1 = fragilizacao1;
            
            				local txt = "30tm";
            				
            				if fragilizacao1 > 43 then
            					txt = "16tm";
            				elseif fragilizacao1 > 29 then
            					txt = "21tm";
            				elseif fragilizacao1 > 17 then
            					txt = "24tm";
            				elseif fragilizacao1 > 7 then
            					txt = "27tm";
            				end;
            
            				sheet.fragilizacaoTotal2 = txt;
        end, obj);

    obj._e_event37 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local atordoamento1 = 	(tonumber(sheet.atordoamentoBase) or 0) + 
            									(tonumber(sheet.atordoamentoAdicional) or 0);
            				sheet.atordoamentoTotal1 = atordoamento1;
            
            				local txt = "40tm";
            				
            				if atordoamento1 > 43 then
            					txt = "22tm";
            				elseif atordoamento1 > 29 then
            					txt = "28tm";
            				elseif atordoamento1 > 17 then
            					txt = "32tm";
            				elseif atordoamento1 > 7 then
            					txt = "36tm";
            				end;
            
            				sheet.atordoamentoTotal2 = txt;
        end, obj);

    obj._e_event38 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local provocacao1 = 	(tonumber(sheet.provocacaoBase) or 0) + 
            									(tonumber(sheet.provocacaoAdicional) or 0);
            				sheet.provocacaoTotal1 = provocacao1;
            
            				local txt = "30tm";
            				
            				if provocacao1 > 43 then
            					txt = "16tm";
            				elseif provocacao1 > 29 then
            					txt = "21tm";
            				elseif provocacao1 > 17 then
            					txt = "24tm";
            				elseif provocacao1 > 7 then
            					txt = "27tm";
            				end;
            
            				sheet.provocacaoTotal2 = txt;
        end, obj);

    obj._e_event39 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local silenciado1 = 	(tonumber(sheet.silenciadoBase) or 0) + 
            									(tonumber(sheet.silenciadoAdicional) or 0);
            				sheet.silenciadoTotal1 = silenciado1;
            
            				local txt = "40tm";
            				
            				if silenciado1 > 43 then
            					txt = "22tm";
            				elseif silenciado1 > 29 then
            					txt = "28tm";
            				elseif silenciado1 > 17 then
            					txt = "32tm";
            				elseif silenciado1 > 7 then
            					txt = "36tm";
            				end;
            
            				sheet.silenciadoTotal2 = txt;
        end, obj);

    obj._e_event40 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local envenenamento1 = 	(tonumber(sheet.envenenamentoBase) or 0) + 
            									(tonumber(sheet.envenenamentoAdicional) or 0);
            				sheet.envenenamentoTotal1 = envenenamento1;
            
            				local txt = "50tm";
            				
            				if envenenamento1 > 43 then
            					txt = "28tm";
            				elseif envenenamento1 > 29 then
            					txt = "35tm";
            				elseif envenenamento1 > 17 then
            					txt = "41tm";
            				elseif envenenamento1 > 7 then
            					txt = "46tm";
            				end;
            
            				sheet.envenenamentoTotal2 = txt;
        end, obj);

    obj._e_event41 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local incendiado1 = 	(tonumber(sheet.incendiadoBase) or 0) + 
            									(tonumber(sheet.incendiadoAdicional) or 0);
            				sheet.incendiadoTotal1 = incendiado1;
            
            				local txt = "50tm";
            				
            				if incendiado1 > 43 then
            					txt = "28tm";
            				elseif incendiado1 > 29 then
            					txt = "35tm";
            				elseif incendiado1 > 17 then
            					txt = "41tm";
            				elseif incendiado1 > 7 then
            					txt = "46tm";
            				end;
            
            				sheet.incendiadoTotal2 = txt;
        end, obj);

    obj._e_event42 = obj.dataLink40:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local cac = (tonumber(sheet.cac_total) or 0); -- constituição
            					local reverberacao = (tonumber(sheet.paranormalidade_total) or 0); -- reverberação
            					local agilidade = (tonumber(sheet.agilidade_total) or 0);
            					local sorte = (tonumber(sheet.sorte_total) or 0);
            					local destreza = (tonumber(sheet.manuseio_total) or 0);
            					local foco = (tonumber(sheet.pontaria_total) or 0); -- foco
            
            					local agilidadeBase = (tonumber(sheet.agilidade_nivel) or 0);
            
            					-- PODER
            					local aux = agilidade * 2 + cac * 4 + destreza * 3 + sorte * 2;
            					if (tonumber(sheet.cac_nivel) or 0) > 7 then 
            						aux = aux  + foco * 4;
            					end;
            					sheet.poderFisicoBase = aux;
            
            					aux = destreza * 3 + reverberacao * 4 + sorte * 2;
            					if (tonumber(sheet.paranormalidade_nivel) or 0) > 7 then 
            						aux = aux  + foco * 5;
            					end;
            					sheet.poderParanormalBase = aux;
            
            					aux = destreza * 4 + sorte * 3;
            					if (tonumber(sheet.manuseio_nivel) or 0) > 7 then 
            						aux = aux  + foco * 5;
            					end;
            					sheet.poderProjetilBase = aux;
            
            					-- STATUS DE COMBATE
            
            					sheet.regVidaBase = 60 + math.floor(cac/3)*2;
            					sheet.regFadigaBase = 60 + math.floor(reverberacao/3)*2;
            
            					sheet.ptsInstantaneaBase = 56 + math.floor(agilidade/3)*3;
            					sheet.criticoBase = 5 + math.floor(sorte/3) * 4;
            					sheet.amplificacaoBase = math.floor(destreza/3)*5;
            					sheet.negacaoBase = math.floor(foco/3)*2;
            
            					-- DEFESA
            
            					sheet.bloqueioFisBase = 1;
            					if cac > 43 then
            						sheet.bloqueioFisBase = 5;
            					elseif cac > 29 then
            						sheet.bloqueioFisBase = 4;
            					elseif cac > 17 then
            						sheet.bloqueioFisBase = 3;
            					elseif cac > 7 then
            						sheet.bloqueioFisBase = 2;
            					end;
            					aux = (21 - sheet.bloqueioFisBase - (tonumber(sheet.bloqueioFisAdicional) or 0));
            					sheet.bloqueioFisTotal2 = "≥" .. aux;
            
            					sheet.bloqueioParBase = 1;
            					if reverberacao > 43 then
            						sheet.bloqueioParBase = 5;
            					elseif reverberacao > 29 then
            						sheet.bloqueioParBase = 4;
            					elseif reverberacao > 17 then
            						sheet.bloqueioParBase = 3;
            					elseif reverberacao > 7 then
            						sheet.bloqueioParBase = 2;
            					end;
            					aux = (21 - sheet.bloqueioParBase - (tonumber(sheet.bloqueioParAdicional) or 0));
            					sheet.bloqueioParTotal2 = "≥" .. aux;
            
            					-- REDUTORES
            
            					sheet.fisicoBase = math.floor(cac/3)*2;
            					sheet.paranormalBase = math.floor(reverberacao/3)*2;
            					sheet.projetilBase = math.floor(sorte/3)*2;
            					sheet.corrosivoBase = math.floor(destreza/3)*2;
            
            					-- RESISTENCIAS
            
            					sheet.impelimentoBase = math.floor(cac/3)*2;
            					sheet.sangramentoBase = math.floor(cac/3)*2;
            					sheet.fragilizacaoBase = math.floor(destreza/3)*2;
            					sheet.atordoamentoBase = math.floor(destreza/3)*2;
            					sheet.provocacaoBase = math.floor(reverberacao/3)*2;
            					sheet.silenciadoBase = math.floor(reverberacao/3)*2;
            					sheet.envenenamentoBase = math.floor(sorte/3)*2;
            					sheet.incendiadoBase = math.floor(sorte/3)*2;
        end, obj);

    obj._e_event43 = obj.dataLink41:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local gasto = tonumber(sheet.habilidadesNivel) or 0;
            					local total = tonumber(sheet.habilidadesDisponivel) or 0;
            
            					if gasto > total then
            						self.habilidadesDisponivel.fontColor = "#FF0000";
            					elseif gasto==total then
            						self.habilidadesDisponivel.fontColor = "#FFFFFF";
            					else 
            						self.habilidadesDisponivel.fontColor = "#00FF00";
            					end;
        end, obj);

    obj._e_event44 = obj.rclHabilidades:addEventListener("onEndEnumeration",
        function (_)
            if sheet== nil then return end;
            					
            					local objetos = NDB.getChildNodes(sheet.listaDeHabilidades);
            					if objetos[1].nivel == nil then
            						objetos[1].nivel = 1;
            					end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.atr_max ~= nil then self.atr_max:destroy(); self.atr_max = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.rclHabilidades ~= nil then self.rclHabilidades:destroy(); self.rclHabilidades = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.rectangle107 ~= nil then self.rectangle107:destroy(); self.rectangle107 = nil; end;
        if self.rectangle108 ~= nil then self.rectangle108:destroy(); self.rectangle108 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle109 ~= nil then self.rectangle109:destroy(); self.rectangle109 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.habilidadesDisponivel ~= nil then self.habilidadesDisponivel:destroy(); self.habilidadesDisponivel = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.carac_total ~= nil then self.carac_total:destroy(); self.carac_total = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmBase()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmBase();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmBase = {
    newEditor = newfrmBase, 
    new = newfrmBase, 
    name = "frmBase", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmBase = _frmBase;
Firecast.registrarForm(_frmBase);

return _frmBase;
