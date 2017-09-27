require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmAMZ1_2()
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
    obj:setName("frmAMZ1_2");
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
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(110);
    obj.label2:setHeight(20);
    obj.label2:setText("Dom");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setLeft(110);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(150);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("dom");
    obj.comboBox1:setItems({'Fisico-Corporal', 'Sensibilidade Elevada', 'Mental-Lógico', 'Intrapessoal', 'Visual-Espacial'});
    obj.comboBox1:setName("comboBox1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(5);
    obj.layout3:setTop(50);
    obj.layout3:setWidth(260);
    obj.layout3:setHeight(50);
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
    obj.label6:setText("Perseverança");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setLeft(110);
    obj.edit1:setTop(25);
    obj.edit1:setWidth(50);
    obj.edit1:setHeight(25);
    obj.edit1:setField("pers_inicial");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(160);
    obj.edit2:setTop(25);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("pers_evolucao");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setLeft(210);
    obj.edit3:setTop(25);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("pers_total");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(100);
    obj.layout4:setWidth(260);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout4);
    obj.label7:setLeft(0);
    obj.label7:setTop(0);
    obj.label7:setWidth(110);
    obj.label7:setHeight(20);
    obj.label7:setText("Nível");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setLeft(110);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(150);
    obj.edit4:setHeight(25);
    obj.edit4:setField("nivel");
    obj.edit4:setName("edit4");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(125);
    obj.layout5:setWidth(260);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout5);
    obj.label8:setLeft(0);
    obj.label8:setTop(0);
    obj.label8:setWidth(110);
    obj.label8:setHeight(20);
    obj.label8:setText("Experiência");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setLeft(110);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(150);
    obj.edit5:setHeight(25);
    obj.edit5:setField("experiencia");
    obj.edit5:setName("edit5");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(5);
    obj.layout6:setTop(150);
    obj.layout6:setWidth(260);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout6);
    obj.label9:setLeft(0);
    obj.label9:setTop(0);
    obj.label9:setWidth(110);
    obj.label9:setHeight(20);
    obj.label9:setText("Haks");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setLeft(110);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(150);
    obj.edit6:setHeight(25);
    obj.edit6:setField("haks");
    obj.edit6:setName("edit6");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(5);
    obj.layout7:setTop(175);
    obj.layout7:setWidth(260);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout7);
    obj.label10:setLeft(0);
    obj.label10:setTop(0);
    obj.label10:setWidth(110);
    obj.label10:setHeight(20);
    obj.label10:setText("Zhuls");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout7);
    obj.rectangle2:setLeft(110);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(150);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout7);
    obj.label11:setLeft(112);
    obj.label11:setTop(0);
    obj.label11:setWidth(146);
    obj.label11:setHeight(25);
    obj.label11:setField("zhuls");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(200);
    obj.layout8:setWidth(260);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout8);
    obj.label12:setLeft(0);
    obj.label12:setTop(0);
    obj.label12:setWidth(110);
    obj.label12:setHeight(20);
    obj.label12:setText("Modelo");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout8);
    obj.rectangle3:setLeft(110);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(75);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout8);
    obj.label13:setLeft(112);
    obj.label13:setTop(0);
    obj.label13:setWidth(71);
    obj.label13:setHeight(25);
    obj.label13:setField("modelo_nome");
    obj.label13:setFontSize(12);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout8);
    obj.rectangle4:setLeft(185);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(75);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout8);
    obj.label14:setLeft(187);
    obj.label14:setTop(0);
    obj.label14:setWidth(71);
    obj.label14:setHeight(25);
    obj.label14:setField("modelo_tipo");
    obj.label14:setFontSize(12);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(225);
    obj.layout9:setWidth(260);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout9);
    obj.label15:setLeft(0);
    obj.label15:setTop(0);
    obj.label15:setWidth(110);
    obj.label15:setHeight(20);
    obj.label15:setText("Device");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setLeft(110);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(150);
    obj.edit7:setHeight(25);
    obj.edit7:setField("device");
    obj.edit7:setName("edit7");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox1);
    obj.layout10:setLeft(280);
    obj.layout10:setTop(0);
    obj.layout10:setWidth(320);
    obj.layout10:setHeight(180);
    obj.layout10:setName("layout10");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout10);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setXradius(5);
    obj.rectangle5:setYradius(5);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setName("rectangle5");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout10);
    obj.label16:setLeft(0);
    obj.label16:setTop(0);
    obj.label16:setWidth(320);
    obj.label16:setHeight(20);
    obj.label16:setText("Atributos");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(25);
    obj.layout11:setWidth(310);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout11);
    obj.label17:setLeft(110);
    obj.label17:setTop(5);
    obj.label17:setWidth(50);
    obj.label17:setHeight(20);
    obj.label17:setText("Inicial");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout11);
    obj.label18:setLeft(160);
    obj.label18:setTop(5);
    obj.label18:setWidth(50);
    obj.label18:setHeight(20);
    obj.label18:setText("Dom");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout11);
    obj.label19:setLeft(210);
    obj.label19:setTop(5);
    obj.label19:setWidth(50);
    obj.label19:setHeight(20);
    obj.label19:setText("Evolução");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setFontSize(11);
    obj.label19:setName("label19");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout11);
    obj.label20:setLeft(260);
    obj.label20:setTop(5);
    obj.label20:setWidth(50);
    obj.label20:setHeight(20);
    obj.label20:setText("Total");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout10);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(50);
    obj.layout12:setWidth(310);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout12);
    obj.label21:setLeft(0);
    obj.label21:setTop(0);
    obj.label21:setWidth(110);
    obj.label21:setHeight(20);
    obj.label21:setText("Destreza (DES)");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontSize(13);
    obj.label21:setName("label21");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout12);
    obj.edit8:setLeft(110);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("atr_inicial_des");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout12);
    obj.edit9:setLeft(160);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("atr_dom_des");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout12);
    obj.edit10:setLeft(210);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("atr_evolucao_des");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout12);
    obj.rectangle6:setLeft(260);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout12);
    obj.label22:setLeft(260);
    obj.label22:setTop(0);
    obj.label22:setWidth(50);
    obj.label22:setHeight(25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setField("atr_total_des");
    obj.label22:setName("label22");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout12);
    obj.dataLink1:setFields({'atr_inicial_des', 'atr_dom_des', 'atr_evolucao_des'});
    obj.dataLink1:setName("dataLink1");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout10);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(75);
    obj.layout13:setWidth(310);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout13);
    obj.label23:setLeft(0);
    obj.label23:setTop(0);
    obj.label23:setWidth(110);
    obj.label23:setHeight(20);
    obj.label23:setText("Percepção (PER)");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontSize(13);
    obj.label23:setName("label23");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout13);
    obj.edit11:setLeft(110);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("atr_inicial_per");
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout13);
    obj.edit12:setLeft(160);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("atr_dom_per");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setLeft(210);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("atr_evolucao_per");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout13);
    obj.rectangle7:setLeft(260);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout13);
    obj.label24:setLeft(260);
    obj.label24:setTop(0);
    obj.label24:setWidth(50);
    obj.label24:setHeight(25);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setField("atr_total_per");
    obj.label24:setName("label24");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout13);
    obj.dataLink2:setFields({'atr_inicial_per', 'atr_dom_per', 'atr_evolucao_per'});
    obj.dataLink2:setName("dataLink2");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout10);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(100);
    obj.layout14:setWidth(310);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout14);
    obj.label25:setLeft(0);
    obj.label25:setTop(0);
    obj.label25:setWidth(110);
    obj.label25:setHeight(20);
    obj.label25:setText("Inteligência (INT)");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setFontSize(13);
    obj.label25:setName("label25");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout14);
    obj.edit14:setLeft(110);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("atr_inicial_int");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout14);
    obj.edit15:setLeft(160);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("atr_dom_int");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout14);
    obj.edit16:setLeft(210);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("atr_evolucao_int");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout14);
    obj.rectangle8:setLeft(260);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout14);
    obj.label26:setLeft(260);
    obj.label26:setTop(0);
    obj.label26:setWidth(50);
    obj.label26:setHeight(25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setField("atr_total_int");
    obj.label26:setName("label26");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout14);
    obj.dataLink3:setFields({'atr_inicial_int', 'atr_dom_int', 'atr_evolucao_int'});
    obj.dataLink3:setName("dataLink3");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout10);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(125);
    obj.layout15:setWidth(310);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout15);
    obj.label27:setLeft(0);
    obj.label27:setTop(0);
    obj.label27:setWidth(110);
    obj.label27:setHeight(20);
    obj.label27:setText("Concentração (CON)");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setFontSize(12);
    obj.label27:setName("label27");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout15);
    obj.edit17:setLeft(110);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("atr_inicial_con");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout15);
    obj.edit18:setLeft(160);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setField("atr_dom_con");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout15);
    obj.edit19:setLeft(210);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(25);
    obj.edit19:setField("atr_evolucao_con");
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout15);
    obj.rectangle9:setLeft(260);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout15);
    obj.label28:setLeft(260);
    obj.label28:setTop(0);
    obj.label28:setWidth(50);
    obj.label28:setHeight(25);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setField("atr_total_con");
    obj.label28:setName("label28");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout15);
    obj.dataLink4:setFields({'atr_inicial_con', 'atr_dom_con', 'atr_evolucao_con'});
    obj.dataLink4:setName("dataLink4");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout10);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(150);
    obj.layout16:setWidth(310);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout16);
    obj.label29:setLeft(0);
    obj.label29:setTop(0);
    obj.label29:setWidth(110);
    obj.label29:setHeight(20);
    obj.label29:setText("Força de Vontade (FV)");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setFontSize(11);
    obj.label29:setName("label29");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout16);
    obj.edit20:setLeft(110);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(25);
    obj.edit20:setField("atr_inicial_fv");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout16);
    obj.edit21:setLeft(160);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(25);
    obj.edit21:setField("atr_dom_fv");
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout16);
    obj.edit22:setLeft(210);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setField("atr_evolucao_fv");
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout16);
    obj.rectangle10:setLeft(260);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(50);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout16);
    obj.label30:setLeft(260);
    obj.label30:setTop(0);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setField("atr_total_fv");
    obj.label30:setName("label30");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout16);
    obj.dataLink5:setFields({'atr_inicial_fv', 'atr_dom_fv', 'atr_evolucao_fv'});
    obj.dataLink5:setName("dataLink5");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox1);
    obj.layout17:setLeft(610);
    obj.layout17:setTop(0);
    obj.layout17:setWidth(320);
    obj.layout17:setHeight(180);
    obj.layout17:setName("layout17");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout17);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setXradius(5);
    obj.rectangle11:setYradius(5);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setName("rectangle11");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout17);
    obj.label31:setLeft(0);
    obj.label31:setTop(0);
    obj.label31:setWidth(320);
    obj.label31:setHeight(20);
    obj.label31:setText("Talentos");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(25);
    obj.layout18:setWidth(310);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout18);
    obj.label32:setLeft(110);
    obj.label32:setTop(5);
    obj.label32:setWidth(50);
    obj.label32:setHeight(20);
    obj.label32:setText("Natural");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout18);
    obj.label33:setLeft(160);
    obj.label33:setTop(5);
    obj.label33:setWidth(50);
    obj.label33:setHeight(20);
    obj.label33:setText("Dom");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout18);
    obj.label34:setLeft(210);
    obj.label34:setTop(5);
    obj.label34:setWidth(50);
    obj.label34:setHeight(20);
    obj.label34:setText("Evolução");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setFontSize(11);
    obj.label34:setName("label34");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout18);
    obj.label35:setLeft(260);
    obj.label35:setTop(5);
    obj.label35:setWidth(50);
    obj.label35:setHeight(20);
    obj.label35:setText("Total");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout17);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(50);
    obj.layout19:setWidth(310);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout19);
    obj.label36:setLeft(0);
    obj.label36:setTop(0);
    obj.label36:setWidth(110);
    obj.label36:setHeight(20);
    obj.label36:setText("Mira (MIR)");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setFontSize(13);
    obj.label36:setName("label36");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout19);
    obj.edit23:setLeft(110);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setField("atr_inicial_mir");
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout19);
    obj.edit24:setLeft(160);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setField("atr_dom_mir");
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout19);
    obj.edit25:setLeft(210);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(50);
    obj.edit25:setHeight(25);
    obj.edit25:setField("atr_evolucao_mir");
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout19);
    obj.rectangle12:setLeft(260);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout19);
    obj.label37:setLeft(260);
    obj.label37:setTop(0);
    obj.label37:setWidth(50);
    obj.label37:setHeight(25);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setField("atr_total_mir");
    obj.label37:setName("label37");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout19);
    obj.dataLink6:setFields({'atr_inicial_mir', 'atr_dom_mir', 'atr_evolucao_mir'});
    obj.dataLink6:setName("dataLink6");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout17);
    obj.layout20:setLeft(5);
    obj.layout20:setTop(75);
    obj.layout20:setWidth(310);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout20);
    obj.label38:setLeft(0);
    obj.label38:setTop(0);
    obj.label38:setWidth(110);
    obj.label38:setHeight(20);
    obj.label38:setText("Raciocínio (RAC)");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setFontSize(13);
    obj.label38:setName("label38");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout20);
    obj.edit26:setLeft(110);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(50);
    obj.edit26:setHeight(25);
    obj.edit26:setField("atr_inicial_rac");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout20);
    obj.edit27:setLeft(160);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setField("atr_dom_rac");
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout20);
    obj.edit28:setLeft(210);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(50);
    obj.edit28:setHeight(25);
    obj.edit28:setField("atr_evolucao_rac");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout20);
    obj.rectangle13:setLeft(260);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout20);
    obj.label39:setLeft(260);
    obj.label39:setTop(0);
    obj.label39:setWidth(50);
    obj.label39:setHeight(25);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setField("atr_total_rac");
    obj.label39:setName("label39");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout20);
    obj.dataLink7:setFields({'atr_inicial_rac', 'atr_dom_rac', 'atr_evolucao_rac'});
    obj.dataLink7:setName("dataLink7");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout17);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(100);
    obj.layout21:setWidth(310);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout21);
    obj.label40:setLeft(0);
    obj.label40:setTop(0);
    obj.label40:setWidth(110);
    obj.label40:setHeight(20);
    obj.label40:setText("Reflexo (REF)");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setFontSize(13);
    obj.label40:setName("label40");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout21);
    obj.edit29:setLeft(110);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(25);
    obj.edit29:setField("atr_inicial_ref");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout21);
    obj.edit30:setLeft(160);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(50);
    obj.edit30:setHeight(25);
    obj.edit30:setField("atr_dom_ref");
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout21);
    obj.edit31:setLeft(210);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(50);
    obj.edit31:setHeight(25);
    obj.edit31:setField("atr_evolucao_ref");
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout21);
    obj.rectangle14:setLeft(260);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout21);
    obj.label41:setLeft(260);
    obj.label41:setTop(0);
    obj.label41:setWidth(50);
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setField("atr_total_ref");
    obj.label41:setName("label41");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout21);
    obj.dataLink8:setFields({'atr_inicial_ref', 'atr_dom_ref', 'atr_evolucao_ref'});
    obj.dataLink8:setName("dataLink8");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout17);
    obj.layout22:setLeft(5);
    obj.layout22:setTop(125);
    obj.layout22:setWidth(310);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout22);
    obj.label42:setLeft(0);
    obj.label42:setTop(0);
    obj.label42:setWidth(110);
    obj.label42:setHeight(20);
    obj.label42:setText("Habilidade (HAB)");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setFontSize(13);
    obj.label42:setName("label42");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout22);
    obj.edit32:setLeft(110);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(25);
    obj.edit32:setField("atr_inicial_hab");
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout22);
    obj.edit33:setLeft(160);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(50);
    obj.edit33:setHeight(25);
    obj.edit33:setField("atr_dom_hab");
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout22);
    obj.edit34:setLeft(210);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(50);
    obj.edit34:setHeight(25);
    obj.edit34:setField("atr_evolucao_hab");
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout22);
    obj.rectangle15:setLeft(260);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout22);
    obj.label43:setLeft(260);
    obj.label43:setTop(0);
    obj.label43:setWidth(50);
    obj.label43:setHeight(25);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setField("atr_total_hab");
    obj.label43:setName("label43");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout22);
    obj.dataLink9:setFields({'atr_inicial_hab', 'atr_dom_hab', 'atr_evolucao_hab'});
    obj.dataLink9:setName("dataLink9");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox1);
    obj.layout23:setLeft(0);
    obj.layout23:setTop(260);
    obj.layout23:setWidth(270);
    obj.layout23:setHeight(255);
    obj.layout23:setName("layout23");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout23);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("black");
    obj.rectangle16:setXradius(5);
    obj.rectangle16:setYradius(5);
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setName("rectangle16");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout23);
    obj.label44:setLeft(0);
    obj.label44:setTop(0);
    obj.label44:setWidth(270);
    obj.label44:setHeight(20);
    obj.label44:setText("Pontos de Personagem (PPs)");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24:setLeft(5);
    obj.layout24:setTop(25);
    obj.layout24:setWidth(260);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout24);
    obj.label45:setLeft(0);
    obj.label45:setTop(0);
    obj.label45:setWidth(110);
    obj.label45:setHeight(20);
    obj.label45:setText("Total");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout24);
    obj.edit35:setLeft(110);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(150);
    obj.edit35:setHeight(25);
    obj.edit35:setField("pps_total");
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout23);
    obj.layout25:setLeft(5);
    obj.layout25:setTop(50);
    obj.layout25:setWidth(260);
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout25);
    obj.label46:setLeft(0);
    obj.label46:setTop(0);
    obj.label46:setWidth(110);
    obj.label46:setHeight(20);
    obj.label46:setText("Gastos - Allei");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout25);
    obj.edit36:setLeft(110);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(150);
    obj.edit36:setHeight(25);
    obj.edit36:setField("pps_gastos_allei");
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout23);
    obj.layout26:setLeft(5);
    obj.layout26:setTop(75);
    obj.layout26:setWidth(260);
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout26);
    obj.label47:setLeft(0);
    obj.label47:setTop(0);
    obj.label47:setWidth(110);
    obj.label47:setHeight(20);
    obj.label47:setText("Saldo Total");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout26);
    obj.rectangle17:setLeft(110);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setWidth(150);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout26);
    obj.label48:setLeft(110);
    obj.label48:setTop(0);
    obj.label48:setWidth(150);
    obj.label48:setHeight(25);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setField("pps_saldo");
    obj.label48:setName("label48");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout23);
    obj.layout27:setLeft(5);
    obj.layout27:setTop(100);
    obj.layout27:setWidth(260);
    obj.layout27:setHeight(150);
    obj.layout27:setName("layout27");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout27);
    obj.label49:setLeft(0);
    obj.label49:setTop(0);
    obj.label49:setWidth(260);
    obj.label49:setHeight(20);
    obj.label49:setText("Balanço de PPs");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout27);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(260);
    obj.textEditor1:setHeight(125);
    obj.textEditor1:setField("pps_dist_allei");
    obj.textEditor1:setName("textEditor1");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout23);
    obj.dataLink10:setFields({'pps_total', 'pps_gastos_allei', 'pps_gastos_zhul'});
    obj.dataLink10:setName("dataLink10");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox1);
    obj.layout28:setLeft(280);
    obj.layout28:setTop(190);
    obj.layout28:setWidth(630);
    obj.layout28:setHeight(325);
    obj.layout28:setName("layout28");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout28);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setXradius(5);
    obj.rectangle18:setYradius(5);
    obj.rectangle18:setCornerType("round");
    obj.rectangle18:setName("rectangle18");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout28);
    obj.label50:setLeft(0);
    obj.label50:setTop(0);
    obj.label50:setWidth(630);
    obj.label50:setHeight(20);
    obj.label50:setText("Academia Mentis Allei");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout28);
    obj.layout29:setLeft(10);
    obj.layout29:setTop(25);
    obj.layout29:setWidth(150);
    obj.layout29:setHeight(180);
    obj.layout29:setName("layout29");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout29);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("#191919");
    obj.rectangle19:setXradius(5);
    obj.rectangle19:setYradius(5);
    obj.rectangle19:setCornerType("round");
    obj.rectangle19:setName("rectangle19");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout29);
    obj.label51:setLeft(0);
    obj.label51:setTop(0);
    obj.label51:setWidth(150);
    obj.label51:setHeight(20);
    obj.label51:setText("Turmas");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout29);
    obj.layout30:setLeft(0);
    obj.layout30:setTop(25);
    obj.layout30:setWidth(150);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout30);
    obj.label52:setLeft(0);
    obj.label52:setTop(0);
    obj.label52:setWidth(30);
    obj.label52:setHeight(20);
    obj.label52:setText("Inicial");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setFontSize(11);
    obj.label52:setName("label52");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout30);
    obj.label53:setLeft(30);
    obj.label53:setTop(0);
    obj.label53:setWidth(30);
    obj.label53:setHeight(20);
    obj.label53:setText("Atual");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setFontSize(11);
    obj.label53:setName("label53");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout30);
    obj.label54:setLeft(60);
    obj.label54:setTop(0);
    obj.label54:setWidth(90);
    obj.label54:setHeight(20);
    obj.label54:setText("Nome");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout29);
    obj.layout31:setLeft(0);
    obj.layout31:setTop(50);
    obj.layout31:setWidth(150);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.radioButton1 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.layout31);
    obj.radioButton1:setLeft(5);
    obj.radioButton1:setTop(0);
    obj.radioButton1:setWidth(20);
    obj.radioButton1:setHeight(20);
    obj.radioButton1:setField("turma_inicial_drav");
    obj.radioButton1:setGroupName("turma_inicial");
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.layout31);
    obj.radioButton2:setLeft(35);
    obj.radioButton2:setTop(0);
    obj.radioButton2:setWidth(20);
    obj.radioButton2:setHeight(20);
    obj.radioButton2:setField("turma_atual_drav");
    obj.radioButton2:setGroupName("turma_atual");
    obj.radioButton2:setName("radioButton2");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout31);
    obj.label55:setLeft(60);
    obj.label55:setTop(0);
    obj.label55:setWidth(90);
    obj.label55:setHeight(20);
    obj.label55:setText("Drav");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout29);
    obj.layout32:setLeft(0);
    obj.layout32:setTop(75);
    obj.layout32:setWidth(150);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.radioButton3 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.layout32);
    obj.radioButton3:setLeft(5);
    obj.radioButton3:setTop(0);
    obj.radioButton3:setWidth(20);
    obj.radioButton3:setHeight(20);
    obj.radioButton3:setField("turma_inicial_guillion");
    obj.radioButton3:setGroupName("turma_inicial");
    obj.radioButton3:setName("radioButton3");

    obj.radioButton4 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.layout32);
    obj.radioButton4:setLeft(35);
    obj.radioButton4:setTop(0);
    obj.radioButton4:setWidth(20);
    obj.radioButton4:setHeight(20);
    obj.radioButton4:setField("turma_atual_guillion");
    obj.radioButton4:setGroupName("turma_atual");
    obj.radioButton4:setName("radioButton4");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout32);
    obj.label56:setLeft(60);
    obj.label56:setTop(0);
    obj.label56:setWidth(90);
    obj.label56:setHeight(20);
    obj.label56:setText("Guillion");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout29);
    obj.layout33:setLeft(0);
    obj.layout33:setTop(100);
    obj.layout33:setWidth(150);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.radioButton5 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.layout33);
    obj.radioButton5:setLeft(5);
    obj.radioButton5:setTop(0);
    obj.radioButton5:setWidth(20);
    obj.radioButton5:setHeight(20);
    obj.radioButton5:setField("turma_inicial_dante");
    obj.radioButton5:setGroupName("turma_inicial");
    obj.radioButton5:setName("radioButton5");

    obj.radioButton6 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton6:setParent(obj.layout33);
    obj.radioButton6:setLeft(35);
    obj.radioButton6:setTop(0);
    obj.radioButton6:setWidth(20);
    obj.radioButton6:setHeight(20);
    obj.radioButton6:setField("turma_atual_dante");
    obj.radioButton6:setGroupName("turma_atual");
    obj.radioButton6:setName("radioButton6");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout33);
    obj.label57:setLeft(60);
    obj.label57:setTop(0);
    obj.label57:setWidth(90);
    obj.label57:setHeight(20);
    obj.label57:setText("Dante");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout29);
    obj.layout34:setLeft(0);
    obj.layout34:setTop(125);
    obj.layout34:setWidth(150);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.radioButton7 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton7:setParent(obj.layout34);
    obj.radioButton7:setLeft(5);
    obj.radioButton7:setTop(0);
    obj.radioButton7:setWidth(20);
    obj.radioButton7:setHeight(20);
    obj.radioButton7:setField("turma_inicial_god");
    obj.radioButton7:setGroupName("turma_inicial");
    obj.radioButton7:setName("radioButton7");

    obj.radioButton8 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton8:setParent(obj.layout34);
    obj.radioButton8:setLeft(35);
    obj.radioButton8:setTop(0);
    obj.radioButton8:setWidth(20);
    obj.radioButton8:setHeight(20);
    obj.radioButton8:setField("turma_atual_god");
    obj.radioButton8:setGroupName("turma_atual");
    obj.radioButton8:setName("radioButton8");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout34);
    obj.label58:setLeft(60);
    obj.label58:setTop(0);
    obj.label58:setWidth(90);
    obj.label58:setHeight(20);
    obj.label58:setText("God");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout29);
    obj.layout35:setLeft(0);
    obj.layout35:setTop(150);
    obj.layout35:setWidth(150);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.radioButton9 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton9:setParent(obj.layout35);
    obj.radioButton9:setLeft(5);
    obj.radioButton9:setTop(0);
    obj.radioButton9:setWidth(20);
    obj.radioButton9:setHeight(20);
    obj.radioButton9:setField("turma_inicial_zeus");
    obj.radioButton9:setGroupName("turma_inicial");
    obj.radioButton9:setName("radioButton9");

    obj.radioButton10 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton10:setParent(obj.layout35);
    obj.radioButton10:setLeft(35);
    obj.radioButton10:setTop(0);
    obj.radioButton10:setWidth(20);
    obj.radioButton10:setHeight(20);
    obj.radioButton10:setField("turma_atual_zeus");
    obj.radioButton10:setGroupName("turma_atual");
    obj.radioButton10:setName("radioButton10");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout35);
    obj.label59:setLeft(60);
    obj.label59:setTop(0);
    obj.label59:setWidth(90);
    obj.label59:setHeight(20);
    obj.label59:setText("Zeus");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout28);
    obj.layout36:setLeft(170);
    obj.layout36:setTop(25);
    obj.layout36:setWidth(240);
    obj.layout36:setHeight(290);
    obj.layout36:setName("layout36");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout36);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("#191919");
    obj.rectangle20:setXradius(5);
    obj.rectangle20:setYradius(5);
    obj.rectangle20:setCornerType("round");
    obj.rectangle20:setName("rectangle20");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout36);
    obj.label60:setLeft(0);
    obj.label60:setTop(0);
    obj.label60:setWidth(240);
    obj.label60:setHeight(20);
    obj.label60:setText("Missões");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout36);
    obj.layout37:setLeft(40);
    obj.layout37:setTop(25);
    obj.layout37:setWidth(160);
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout37);
    obj.label61:setLeft(0);
    obj.label61:setTop(0);
    obj.label61:setWidth(110);
    obj.label61:setHeight(20);
    obj.label61:setText("Nº Total de Missões");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setFontSize(11);
    obj.label61:setName("label61");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout37);
    obj.edit37:setLeft(110);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(50);
    obj.edit37:setHeight(25);
    obj.edit37:setField("missoes_num");
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout36);
    obj.layout38:setLeft(0);
    obj.layout38:setTop(50);
    obj.layout38:setWidth(240);
    obj.layout38:setHeight(235);
    obj.layout38:setName("layout38");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout38);
    obj.label62:setLeft(5);
    obj.label62:setTop(0);
    obj.label62:setWidth(30);
    obj.label62:setHeight(20);
    obj.label62:setText("Nº");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setFontSize(11);
    obj.label62:setName("label62");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout38);
    obj.label63:setLeft(35);
    obj.label63:setTop(0);
    obj.label63:setWidth(150);
    obj.label63:setHeight(20);
    obj.label63:setText("Relatório");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setFontSize(11);
    obj.label63:setName("label63");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout38);
    obj.button1:setLeft(185);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.rclListaDasMissoes = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasMissoes:setParent(obj.layout38);
    obj.rclListaDasMissoes:setName("rclListaDasMissoes");
    obj.rclListaDasMissoes:setField("campoDasMissoes");
    obj.rclListaDasMissoes:setTemplateForm("frmAMZ1_2_1");
    obj.rclListaDasMissoes:setLeft(5);
    obj.rclListaDasMissoes:setTop(25);
    obj.rclListaDasMissoes:setWidth(230);
    obj.rclListaDasMissoes:setHeight(205);
    obj.rclListaDasMissoes:setLayout("vertical");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout28);
    obj.layout39:setLeft(420);
    obj.layout39:setTop(25);
    obj.layout39:setWidth(200);
    obj.layout39:setHeight(190);
    obj.layout39:setName("layout39");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout39);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("#191919");
    obj.rectangle21:setXradius(5);
    obj.rectangle21:setYradius(5);
    obj.rectangle21:setCornerType("round");
    obj.rectangle21:setName("rectangle21");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout39);
    obj.label64:setLeft(0);
    obj.label64:setTop(0);
    obj.label64:setWidth(200);
    obj.label64:setHeight(20);
    obj.label64:setText("Atividades Extra-Curriculares");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout39);
    obj.layout40:setLeft(0);
    obj.layout40:setTop(25);
    obj.layout40:setWidth(200);
    obj.layout40:setHeight(100);
    obj.layout40:setName("layout40");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout40);
    obj.label65:setLeft(0);
    obj.label65:setTop(0);
    obj.label65:setWidth(200);
    obj.label65:setHeight(20);
    obj.label65:setText("Participações em Eventos");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setFontSize(11);
    obj.label65:setName("label65");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout40);
    obj.label66:setLeft(0);
    obj.label66:setTop(25);
    obj.label66:setWidth(125);
    obj.label66:setHeight(20);
    obj.label66:setText("Nº de Participações");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setFontSize(11);
    obj.label66:setName("label66");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout40);
    obj.edit38:setLeft(125);
    obj.edit38:setTop(25);
    obj.edit38:setWidth(50);
    obj.edit38:setHeight(25);
    obj.edit38:setField("eventos_num");
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout40);
    obj.label67:setLeft(0);
    obj.label67:setTop(50);
    obj.label67:setWidth(125);
    obj.label67:setHeight(20);
    obj.label67:setText("Nº de Vitorias");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setFontSize(11);
    obj.label67:setName("label67");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout40);
    obj.edit39:setLeft(125);
    obj.edit39:setTop(50);
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(25);
    obj.edit39:setField("eventos_vitorias");
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout40);
    obj.label68:setLeft(0);
    obj.label68:setTop(75);
    obj.label68:setWidth(125);
    obj.label68:setHeight(20);
    obj.label68:setText("Nº de Vezes Campeão");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setFontSize(11);
    obj.label68:setName("label68");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout40);
    obj.edit40:setLeft(125);
    obj.edit40:setTop(75);
    obj.edit40:setWidth(50);
    obj.edit40:setHeight(25);
    obj.edit40:setField("eventos_campeao");
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout39);
    obj.layout41:setLeft(0);
    obj.layout41:setTop(135);
    obj.layout41:setWidth(200);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout41);
    obj.label69:setLeft(0);
    obj.label69:setTop(0);
    obj.label69:setWidth(125);
    obj.label69:setHeight(20);
    obj.label69:setText("Batalhas Oficiais");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setFontSize(11);
    obj.label69:setName("label69");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout41);
    obj.edit41:setLeft(125);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(50);
    obj.edit41:setHeight(25);
    obj.edit41:setField("eventos_batalhas");
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout39);
    obj.layout42:setLeft(0);
    obj.layout42:setTop(160);
    obj.layout42:setWidth(200);
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout42);
    obj.label70:setLeft(0);
    obj.label70:setTop(0);
    obj.label70:setWidth(125);
    obj.label70:setHeight(20);
    obj.label70:setText("Combate de Treinos");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setFontSize(11);
    obj.label70:setName("label70");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout42);
    obj.edit42:setLeft(125);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(50);
    obj.edit42:setHeight(25);
    obj.edit42:setField("eventos_treinos");
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_des) or 0) +
            									(tonumber(sheet.atr_dom_des) or 0) +
            									(tonumber(sheet.atr_evolucao_des) or 0);
            					sheet.atr_total_des = total;
            				end;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_per) or 0) +
            									(tonumber(sheet.atr_dom_per) or 0) +
            									(tonumber(sheet.atr_evolucao_per) or 0);
            					sheet.atr_total_per = total;
            				end;
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_int) or 0) +
            									(tonumber(sheet.atr_dom_int) or 0) +
            									(tonumber(sheet.atr_evolucao_int) or 0);
            					sheet.atr_total_int = total;
            				end;
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_con) or 0) +
            									(tonumber(sheet.atr_dom_con) or 0) +
            									(tonumber(sheet.atr_evolucao_con) or 0);
            					sheet.atr_total_con = total;
            				end;
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_fv) or 0) +
            									(tonumber(sheet.atr_dom_fv) or 0) +
            									(tonumber(sheet.atr_evolucao_fv) or 0);
            					sheet.atr_total_fv = total;
            				end;
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_mir) or 0) +
            									(tonumber(sheet.atr_dom_mir) or 0) +
            									(tonumber(sheet.atr_evolucao_mir) or 0);
            					sheet.atr_total_mir = total;
            				end;
        end, obj);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_rac) or 0) +
            									(tonumber(sheet.atr_dom_rac) or 0) +
            									(tonumber(sheet.atr_evolucao_rac) or 0);
            					sheet.atr_total_rac = total;
            				end;
        end, obj);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_ref) or 0) +
            									(tonumber(sheet.atr_dom_ref) or 0) +
            									(tonumber(sheet.atr_evolucao_ref) or 0);
            					sheet.atr_total_ref = total;
            				end;
        end, obj);

    obj._e_event8 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					local total = 	(tonumber(sheet.atr_inicial_hab) or 0) +
            									(tonumber(sheet.atr_dom_hab) or 0) +
            									(tonumber(sheet.atr_evolucao_hab) or 0);
            					sheet.atr_total_hab = total;
            				end;
        end, obj);

    obj._e_event9 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						local total = 	(tonumber(sheet.pps_total) or 0) -
            										(tonumber(sheet.pps_gastos_allei) or 0) -
            										(tonumber(sheet.pps_gastos_zhul) or 0);
            						sheet.pps_saldo = total;
            					end;
        end, obj);

    obj._e_event10 = obj.button1:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            								local node = self.rclListaDasMissoes:append();
            								local nodes = ndb.getChildNodes(sheet.campoDasMissoes);  
            								node.num = #nodes;
            							end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.radioButton10 ~= nil then self.radioButton10:destroy(); self.radioButton10 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.rclListaDasMissoes ~= nil then self.rclListaDasMissoes:destroy(); self.rclListaDasMissoes = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.radioButton9 ~= nil then self.radioButton9:destroy(); self.radioButton9 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAMZ1_2 = {
    newEditor = newfrmAMZ1_2, 
    new = newfrmAMZ1_2, 
    name = "frmAMZ1_2", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAMZ1_2 = _frmAMZ1_2;
rrpg.registrarForm(_frmAMZ1_2);

return _frmAMZ1_2;
