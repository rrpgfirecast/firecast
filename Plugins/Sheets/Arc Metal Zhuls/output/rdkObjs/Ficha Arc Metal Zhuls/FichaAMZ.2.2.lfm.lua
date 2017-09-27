require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmAMZ2_2()
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
    obj:setName("frmAMZ2_2");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(270);
    obj.layout1:setHeight(255);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(270);
    obj.label1:setHeight(20);
    obj.label1:setText("Geral");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(260);
    obj.layout2:setHeight(50);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(110);
    obj.label2:setHeight(20);
    obj.label2:setText("Modelo");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setLeft(110);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(150);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("modelo_nome");
    obj.comboBox1:setItems({'Inicial', 'Godlike', 'Zeus-Tester'});
    obj.comboBox1:setName("comboBox1");

    obj.modelo_tipo_edit = gui.fromHandle(_obj_newObject("edit"));
    obj.modelo_tipo_edit:setParent(obj.layout2);
    obj.modelo_tipo_edit:setLeft(110);
    obj.modelo_tipo_edit:setTop(25);
    obj.modelo_tipo_edit:setWidth(150);
    obj.modelo_tipo_edit:setHeight(25);
    obj.modelo_tipo_edit:setField("modelo_tipo");
    obj.modelo_tipo_edit:setName("modelo_tipo_edit");
    obj.modelo_tipo_edit:setVisible(false);

    obj.modelo_tipo_comboBox = gui.fromHandle(_obj_newObject("comboBox"));
    obj.modelo_tipo_comboBox:setParent(obj.layout2);
    obj.modelo_tipo_comboBox:setLeft(110);
    obj.modelo_tipo_comboBox:setTop(25);
    obj.modelo_tipo_comboBox:setWidth(150);
    obj.modelo_tipo_comboBox:setHeight(25);
    obj.modelo_tipo_comboBox:setField("modelo_tipo");
    obj.modelo_tipo_comboBox:setName("modelo_tipo_comboBox");
    obj.modelo_tipo_comboBox:setItems({'Bruiser', 'Trickster', 'Gunner', 'Elemental', 'Support'});
    obj.modelo_tipo_comboBox:setVisible(false);

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(5);
    obj.layout3:setTop(75);
    obj.layout3:setWidth(260);
    obj.layout3:setHeight(75);
    obj.layout3:setName("layout3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(110);
    obj.label3:setTop(5);
    obj.label3:setWidth(50);
    obj.label3:setHeight(20);
    obj.label3:setText("Inicial");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setLeft(160);
    obj.label4:setTop(5);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setText("Evolução");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontSize(11);
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setLeft(210);
    obj.label5:setTop(5);
    obj.label5:setWidth(50);
    obj.label5:setHeight(20);
    obj.label5:setText("Total");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setLeft(0);
    obj.label6:setTop(25);
    obj.label6:setWidth(110);
    obj.label6:setHeight(20);
    obj.label6:setText("HP");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setLeft(110);
    obj.edit1:setTop(25);
    obj.edit1:setWidth(50);
    obj.edit1:setHeight(25);
    obj.edit1:setField("hp_inicial");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(160);
    obj.edit2:setTop(25);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("hp_evolucao");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setLeft(210);
    obj.edit3:setTop(25);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("hp_total");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setLeft(0);
    obj.label7:setTop(50);
    obj.label7:setWidth(110);
    obj.label7:setHeight(20);
    obj.label7:setText("Energia");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setLeft(110);
    obj.edit4:setTop(50);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("energia_inicial");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout3);
    obj.edit5:setLeft(160);
    obj.edit5:setTop(50);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("energia_evolucao");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setLeft(210);
    obj.edit6:setTop(50);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("energia_total");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(150);
    obj.layout4:setWidth(260);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8:setLeft(0);
    obj.label8:setTop(0);
    obj.label8:setWidth(110);
    obj.label8:setHeight(20);
    obj.label8:setText("Nível");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout4);
    obj.edit7:setLeft(110);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(150);
    obj.edit7:setHeight(25);
    obj.edit7:setField("nivel_zhul");
    obj.edit7:setName("edit7");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(175);
    obj.layout5:setWidth(260);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout5);
    obj.label9:setLeft(0);
    obj.label9:setTop(0);
    obj.label9:setWidth(260);
    obj.label9:setHeight(20);
    obj.label9:setText("Informações de Resistência");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(5);
    obj.layout6:setTop(200);
    obj.layout6:setWidth(260);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout6);
    obj.label10:setLeft(0);
    obj.label10:setTop(0);
    obj.label10:setWidth(55);
    obj.label10:setHeight(20);
    obj.label10:setText("10%");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout6);
    obj.edit8:setLeft(55);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(75);
    obj.edit8:setHeight(25);
    obj.edit8:setField("res_10");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout6);
    obj.label11:setLeft(130);
    obj.label11:setTop(0);
    obj.label11:setWidth(55);
    obj.label11:setHeight(20);
    obj.label11:setText("30%");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout6);
    obj.edit9:setLeft(185);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(75);
    obj.edit9:setHeight(25);
    obj.edit9:setField("res_30");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(5);
    obj.layout7:setTop(225);
    obj.layout7:setWidth(260);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout7);
    obj.label12:setLeft(0);
    obj.label12:setTop(0);
    obj.label12:setWidth(55);
    obj.label12:setHeight(20);
    obj.label12:setText("50%");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout7);
    obj.edit10:setLeft(55);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(75);
    obj.edit10:setHeight(25);
    obj.edit10:setField("res_50");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout7);
    obj.label13:setLeft(130);
    obj.label13:setTop(0);
    obj.label13:setWidth(55);
    obj.label13:setHeight(20);
    obj.label13:setText("80%");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout7);
    obj.edit11:setLeft(185);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(75);
    obj.edit11:setHeight(25);
    obj.edit11:setField("res_80");
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(265);
    obj.layout8:setWidth(270);
    obj.layout8:setHeight(255);
    obj.layout8:setName("layout8");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout8);
    obj.label14:setLeft(0);
    obj.label14:setTop(0);
    obj.label14:setWidth(270);
    obj.label14:setHeight(20);
    obj.label14:setText("Pontos de Personagem (PPs)");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(25);
    obj.layout9:setWidth(260);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout9);
    obj.label15:setLeft(0);
    obj.label15:setTop(0);
    obj.label15:setWidth(110);
    obj.label15:setHeight(20);
    obj.label15:setText("Total");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout9);
    obj.edit12:setLeft(110);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(150);
    obj.edit12:setHeight(25);
    obj.edit12:setField("pps_total");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(50);
    obj.layout10:setWidth(260);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout10);
    obj.label16:setLeft(0);
    obj.label16:setTop(0);
    obj.label16:setWidth(110);
    obj.label16:setHeight(20);
    obj.label16:setText("Gastos - Allei");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout10);
    obj.edit13:setLeft(110);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(150);
    obj.edit13:setHeight(25);
    obj.edit13:setField("pps_gastos_zhul");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(75);
    obj.layout11:setWidth(260);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout11);
    obj.label17:setLeft(0);
    obj.label17:setTop(0);
    obj.label17:setWidth(110);
    obj.label17:setHeight(20);
    obj.label17:setText("Saldo Total");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout11);
    obj.rectangle3:setLeft(110);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(150);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout11);
    obj.label18:setLeft(110);
    obj.label18:setTop(0);
    obj.label18:setWidth(150);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setField("pps_saldo");
    obj.label18:setName("label18");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(100);
    obj.layout12:setWidth(260);
    obj.layout12:setHeight(150);
    obj.layout12:setName("layout12");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout12);
    obj.label19:setLeft(0);
    obj.label19:setTop(0);
    obj.label19:setWidth(260);
    obj.label19:setHeight(20);
    obj.label19:setText("Balanço de PPs");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout12);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(260);
    obj.textEditor1:setHeight(125);
    obj.textEditor1:setField("pps_dist_zhul");
    obj.textEditor1:setName("textEditor1");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox1);
    obj.layout13:setLeft(280);
    obj.layout13:setTop(0);
    obj.layout13:setWidth(320);
    obj.layout13:setHeight(155);
    obj.layout13:setName("layout13");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout13);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout13);
    obj.label20:setLeft(0);
    obj.label20:setTop(0);
    obj.label20:setWidth(320);
    obj.label20:setHeight(20);
    obj.label20:setText("Atributos");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(25);
    obj.layout14:setWidth(310);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout14);
    obj.label21:setLeft(110);
    obj.label21:setTop(5);
    obj.label21:setWidth(50);
    obj.label21:setHeight(20);
    obj.label21:setText("Inicial");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout14);
    obj.label22:setLeft(160);
    obj.label22:setTop(5);
    obj.label22:setWidth(50);
    obj.label22:setHeight(20);
    obj.label22:setText("Modelo");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout14);
    obj.label23:setLeft(210);
    obj.label23:setTop(5);
    obj.label23:setWidth(50);
    obj.label23:setHeight(20);
    obj.label23:setText("Evolução");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontSize(11);
    obj.label23:setName("label23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout14);
    obj.label24:setLeft(260);
    obj.label24:setTop(5);
    obj.label24:setWidth(50);
    obj.label24:setHeight(20);
    obj.label24:setText("Total");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout13);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(50);
    obj.layout15:setWidth(310);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout15);
    obj.label25:setLeft(0);
    obj.label25:setTop(0);
    obj.label25:setWidth(110);
    obj.label25:setHeight(20);
    obj.label25:setText("Força (FOR)");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setFontSize(13);
    obj.label25:setName("label25");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout15);
    obj.edit14:setLeft(110);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("atr_inicial_for");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout15);
    obj.edit15:setLeft(160);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("atr_dom_for");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout15);
    obj.edit16:setLeft(210);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("atr_evolucao_for");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout15);
    obj.rectangle5:setLeft(260);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout15);
    obj.label26:setLeft(260);
    obj.label26:setTop(0);
    obj.label26:setWidth(50);
    obj.label26:setHeight(25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setField("atr_total_for");
    obj.label26:setName("label26");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout15);
    obj.dataLink1:setFields({'atr_inicial_for', 'atr_dom_for', 'atr_evolucao_for'});
    obj.dataLink1:setName("dataLink1");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout13);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(75);
    obj.layout16:setWidth(310);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout16);
    obj.label27:setLeft(0);
    obj.label27:setTop(0);
    obj.label27:setWidth(110);
    obj.label27:setHeight(20);
    obj.label27:setText("Velocidade (VEL)");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setFontSize(13);
    obj.label27:setName("label27");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout16);
    obj.edit17:setLeft(110);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("atr_inicial_vel");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout16);
    obj.edit18:setLeft(160);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setField("atr_dom_vel");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout16);
    obj.edit19:setLeft(210);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(25);
    obj.edit19:setField("atr_evolucao_vel");
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout16);
    obj.rectangle6:setLeft(260);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout16);
    obj.label28:setLeft(260);
    obj.label28:setTop(0);
    obj.label28:setWidth(50);
    obj.label28:setHeight(25);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setField("atr_total_vel");
    obj.label28:setName("label28");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout16);
    obj.dataLink2:setFields({'atr_inicial_vel', 'atr_dom_vel', 'atr_evolucao_vel'});
    obj.dataLink2:setName("dataLink2");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout13);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(100);
    obj.layout17:setWidth(310);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout17);
    obj.label29:setLeft(0);
    obj.label29:setTop(0);
    obj.label29:setWidth(110);
    obj.label29:setHeight(20);
    obj.label29:setText("Maquinário (MAQ)");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setFontSize(13);
    obj.label29:setName("label29");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout17);
    obj.edit20:setLeft(110);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(25);
    obj.edit20:setField("atr_inicial_maq");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout17);
    obj.edit21:setLeft(160);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(25);
    obj.edit21:setField("atr_dom_maq");
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout17);
    obj.edit22:setLeft(210);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setField("atr_evolucao_maq");
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout17);
    obj.rectangle7:setLeft(260);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout17);
    obj.label30:setLeft(260);
    obj.label30:setTop(0);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setField("atr_total_maq");
    obj.label30:setName("label30");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout17);
    obj.dataLink3:setFields({'atr_inicial_maq', 'atr_dom_maq', 'atr_evolucao_maq'});
    obj.dataLink3:setName("dataLink3");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout13);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(125);
    obj.layout18:setWidth(310);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout18);
    obj.label31:setLeft(0);
    obj.label31:setTop(0);
    obj.label31:setWidth(110);
    obj.label31:setHeight(20);
    obj.label31:setText("Construção Elemental (CE)");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setFontSize(9);
    obj.label31:setName("label31");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout18);
    obj.edit23:setLeft(110);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setField("atr_inicial_ce");
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout18);
    obj.edit24:setLeft(160);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setField("atr_dom_ce");
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout18);
    obj.edit25:setLeft(210);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(50);
    obj.edit25:setHeight(25);
    obj.edit25:setField("atr_evolucao_ce");
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout18);
    obj.rectangle8:setLeft(260);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout18);
    obj.label32:setLeft(260);
    obj.label32:setTop(0);
    obj.label32:setWidth(50);
    obj.label32:setHeight(25);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setField("atr_total_ce");
    obj.label32:setName("label32");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout18);
    obj.dataLink4:setFields({'atr_inicial_ce', 'atr_dom_ce', 'atr_evolucao_ce'});
    obj.dataLink4:setName("dataLink4");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox1);
    obj.layout19:setLeft(610);
    obj.layout19:setTop(0);
    obj.layout19:setWidth(320);
    obj.layout19:setHeight(155);
    obj.layout19:setName("layout19");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout19);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setXradius(5);
    obj.rectangle9:setYradius(5);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setName("rectangle9");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout19);
    obj.label33:setLeft(0);
    obj.label33:setTop(0);
    obj.label33:setWidth(320);
    obj.label33:setHeight(20);
    obj.label33:setText("Talentos");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setLeft(5);
    obj.layout20:setTop(25);
    obj.layout20:setWidth(310);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout20);
    obj.label34:setLeft(110);
    obj.label34:setTop(5);
    obj.label34:setWidth(50);
    obj.label34:setHeight(20);
    obj.label34:setText("Natural");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout20);
    obj.label35:setLeft(160);
    obj.label35:setTop(5);
    obj.label35:setWidth(50);
    obj.label35:setHeight(20);
    obj.label35:setText("Modelo");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout20);
    obj.label36:setLeft(210);
    obj.label36:setTop(5);
    obj.label36:setWidth(50);
    obj.label36:setHeight(20);
    obj.label36:setText("Evolução");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setFontSize(11);
    obj.label36:setName("label36");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout20);
    obj.label37:setLeft(260);
    obj.label37:setTop(5);
    obj.label37:setWidth(50);
    obj.label37:setHeight(20);
    obj.label37:setText("Total");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout19);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(50);
    obj.layout21:setWidth(310);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout21);
    obj.label38:setLeft(0);
    obj.label38:setTop(0);
    obj.label38:setWidth(110);
    obj.label38:setHeight(20);
    obj.label38:setText("Poder de Fogo (PF)");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setFontSize(13);
    obj.label38:setName("label38");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout21);
    obj.edit26:setLeft(110);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(50);
    obj.edit26:setHeight(25);
    obj.edit26:setField("atr_inicial_pf");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout21);
    obj.edit27:setLeft(160);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setField("atr_dom_pf");
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout21);
    obj.edit28:setLeft(210);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(50);
    obj.edit28:setHeight(25);
    obj.edit28:setField("atr_evolucao_pf");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout21);
    obj.rectangle10:setLeft(260);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(50);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout21);
    obj.label39:setLeft(260);
    obj.label39:setTop(0);
    obj.label39:setWidth(50);
    obj.label39:setHeight(25);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setField("atr_total_pf");
    obj.label39:setName("label39");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout21);
    obj.dataLink5:setFields({'atr_inicial_pf', 'atr_dom_pf', 'atr_evolucao_pf'});
    obj.dataLink5:setName("dataLink5");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout19);
    obj.layout22:setLeft(5);
    obj.layout22:setTop(75);
    obj.layout22:setWidth(310);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout22);
    obj.label40:setLeft(0);
    obj.label40:setTop(0);
    obj.label40:setWidth(110);
    obj.label40:setHeight(20);
    obj.label40:setText("Agilidade (AGI)");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setFontSize(13);
    obj.label40:setName("label40");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout22);
    obj.edit29:setLeft(110);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(25);
    obj.edit29:setField("atr_inicial_agi");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout22);
    obj.edit30:setLeft(160);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(50);
    obj.edit30:setHeight(25);
    obj.edit30:setField("atr_dom_agi");
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout22);
    obj.edit31:setLeft(210);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(50);
    obj.edit31:setHeight(25);
    obj.edit31:setField("atr_evolucao_agi");
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout22);
    obj.rectangle11:setLeft(260);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout22);
    obj.label41:setLeft(260);
    obj.label41:setTop(0);
    obj.label41:setWidth(50);
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setField("atr_total_agi");
    obj.label41:setName("label41");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout22);
    obj.dataLink6:setFields({'atr_inicial_agi', 'atr_dom_agi', 'atr_evolucao_agi'});
    obj.dataLink6:setName("dataLink6");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout19);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(100);
    obj.layout23:setWidth(310);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout23);
    obj.label42:setLeft(0);
    obj.label42:setTop(0);
    obj.label42:setWidth(110);
    obj.label42:setHeight(20);
    obj.label42:setText("Resistência (RES)");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setFontSize(13);
    obj.label42:setName("label42");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout23);
    obj.edit32:setLeft(110);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(25);
    obj.edit32:setField("atr_inicial_res");
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout23);
    obj.edit33:setLeft(160);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(50);
    obj.edit33:setHeight(25);
    obj.edit33:setField("atr_dom_res");
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout23);
    obj.edit34:setLeft(210);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(50);
    obj.edit34:setHeight(25);
    obj.edit34:setField("atr_evolucao_res");
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout23);
    obj.rectangle12:setLeft(260);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout23);
    obj.label43:setLeft(260);
    obj.label43:setTop(0);
    obj.label43:setWidth(50);
    obj.label43:setHeight(25);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setField("atr_total_res");
    obj.label43:setName("label43");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout23);
    obj.dataLink7:setFields({'atr_inicial_res', 'atr_dom_res', 'atr_evolucao_res'});
    obj.dataLink7:setName("dataLink7");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout19);
    obj.layout24:setLeft(5);
    obj.layout24:setTop(125);
    obj.layout24:setWidth(310);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout24);
    obj.label44:setLeft(0);
    obj.label44:setTop(0);
    obj.label44:setWidth(110);
    obj.label44:setHeight(20);
    obj.label44:setText("Voo");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setFontSize(13);
    obj.label44:setName("label44");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout24);
    obj.edit35:setLeft(110);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(50);
    obj.edit35:setHeight(25);
    obj.edit35:setField("atr_inicial_voo");
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout24);
    obj.edit36:setLeft(160);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(50);
    obj.edit36:setHeight(25);
    obj.edit36:setField("atr_dom_voo");
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout24);
    obj.edit37:setLeft(210);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(50);
    obj.edit37:setHeight(25);
    obj.edit37:setField("atr_evolucao_voo");
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout24);
    obj.rectangle13:setLeft(260);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout24);
    obj.label45:setLeft(260);
    obj.label45:setTop(0);
    obj.label45:setWidth(50);
    obj.label45:setHeight(25);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setField("atr_total_voo");
    obj.label45:setName("label45");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout24);
    obj.dataLink8:setFields({'atr_inicial_voo', 'atr_dom_voo', 'atr_evolucao_voo'});
    obj.dataLink8:setName("dataLink8");

    obj._e_event0 = obj.comboBox1:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            							if sheet.modelo_nome == "Inicial" then
            								self.modelo_tipo_edit.visible = false;
            								self.modelo_tipo_comboBox.visible = true;
            							elseif sheet.modelo_nome == nil or sheet.modelo_nome == "" then
            								self.modelo_tipo_edit.visible = false;
            								self.modelo_tipo_comboBox.visible = false;
            							else
            								self.modelo_tipo_edit.visible = true;
            								self.modelo_tipo_comboBox.visible = false;
            							end;
            						end;
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_for) or 0) +
            									(tonumber(sheet.atr_dom_for) or 0) +
            									(tonumber(sheet.atr_evolucao_for) or 0);
            					sheet.atr_total_for = total;
            				end;
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_vel) or 0) +
            									(tonumber(sheet.atr_dom_vel) or 0) +
            									(tonumber(sheet.atr_evolucao_vel) or 0);
            					sheet.atr_total_vel = total;
            				end;
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_maq) or 0) +
            									(tonumber(sheet.atr_dom_maq) or 0) +
            									(tonumber(sheet.atr_evolucao_maq) or 0);
            					sheet.atr_total_maq = total;
            				end;
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_ce) or 0) +
            									(tonumber(sheet.atr_dom_ce) or 0) +
            									(tonumber(sheet.atr_evolucao_ce) or 0);
            					sheet.atr_total_ce = total;
            				end;
        end, obj);

    obj._e_event5 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_pf) or 0) +
            									(tonumber(sheet.atr_dom_pf) or 0) +
            									(tonumber(sheet.atr_evolucao_pf) or 0);
            					sheet.atr_total_pf = total;
            				end;
        end, obj);

    obj._e_event6 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_agi) or 0) +
            									(tonumber(sheet.atr_dom_agi) or 0) +
            									(tonumber(sheet.atr_evolucao_agi) or 0);
            					sheet.atr_total_agi = total;
            				end;
        end, obj);

    obj._e_event7 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_res) or 0) +
            									(tonumber(sheet.atr_dom_res) or 0) +
            									(tonumber(sheet.atr_evolucao_res) or 0);
            					sheet.atr_total_res = total;
            				end;
        end, obj);

    obj._e_event8 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_voo) or 0) +
            									(tonumber(sheet.atr_dom_voo) or 0) +
            									(tonumber(sheet.atr_evolucao_voo) or 0);
            					sheet.atr_total_voo = total;
            				end;
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

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.modelo_tipo_edit ~= nil then self.modelo_tipo_edit:destroy(); self.modelo_tipo_edit = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.modelo_tipo_comboBox ~= nil then self.modelo_tipo_comboBox:destroy(); self.modelo_tipo_comboBox = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAMZ2_2 = {
    newEditor = newfrmAMZ2_2, 
    new = newfrmAMZ2_2, 
    name = "frmAMZ2_2", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAMZ2_2 = _frmAMZ2_2;
rrpg.registrarForm(_frmAMZ2_2);

return _frmAMZ2_2;
