require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTemplateDescription()
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
    obj:setName("frmTemplateDescription");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(1205);
    obj.rectangle1:setHeight(105);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(3);
    obj.label1:setTop(1);
    obj.label1:setWidth(100);
    obj.label1:setHeight(20);
    obj.label1:setText("DESCRIÇÃO");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(10);
    obj.label2:setTop(25);
    obj.label2:setWidth(90);
    obj.label2:setHeight(20);
    obj.label2:setText("TAMANHO");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(25);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("tamanho");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(10);
    obj.label3:setTop(50);
    obj.label3:setWidth(90);
    obj.label3:setHeight(20);
    obj.label3:setText("ALTURA");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(100);
    obj.edit2:setTop(50);
    obj.edit2:setWidth(200);
    obj.edit2:setHeight(25);
    obj.edit2:setField("altura");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(10);
    obj.label4:setTop(75);
    obj.label4:setWidth(90);
    obj.label4:setHeight(20);
    obj.label4:setText("PESO");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(100);
    obj.edit3:setTop(75);
    obj.edit3:setWidth(200);
    obj.edit3:setHeight(25);
    obj.edit3:setField("peso");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setName("edit3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(310);
    obj.label5:setTop(25);
    obj.label5:setWidth(90);
    obj.label5:setHeight(20);
    obj.label5:setText("IDADE");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(400);
    obj.edit4:setTop(25);
    obj.edit4:setWidth(200);
    obj.edit4:setHeight(25);
    obj.edit4:setField("idade");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(310);
    obj.label6:setTop(50);
    obj.label6:setWidth(90);
    obj.label6:setHeight(20);
    obj.label6:setText("SEXO");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(400);
    obj.edit5:setTop(50);
    obj.edit5:setWidth(200);
    obj.edit5:setHeight(25);
    obj.edit5:setField("sexo");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(310);
    obj.label7:setTop(75);
    obj.label7:setWidth(90);
    obj.label7:setHeight(20);
    obj.label7:setText("OUTROS");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setLeft(400);
    obj.edit6:setTop(75);
    obj.edit6:setWidth(200);
    obj.edit6:setHeight(25);
    obj.edit6:setField("aparenciaOutros");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(610);
    obj.label8:setTop(25);
    obj.label8:setWidth(90);
    obj.label8:setHeight(20);
    obj.label8:setText("OLHOS");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setLeft(700);
    obj.edit7:setTop(25);
    obj.edit7:setWidth(200);
    obj.edit7:setHeight(25);
    obj.edit7:setField("aparenciaOlhos");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setName("edit7");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setLeft(610);
    obj.label9:setTop(50);
    obj.label9:setWidth(90);
    obj.label9:setHeight(20);
    obj.label9:setText("PELE");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setLeft(700);
    obj.edit8:setTop(50);
    obj.edit8:setWidth(200);
    obj.edit8:setHeight(25);
    obj.edit8:setField("pele");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle1);
    obj.label10:setLeft(610);
    obj.label10:setTop(75);
    obj.label10:setWidth(90);
    obj.label10:setHeight(20);
    obj.label10:setText("CABELO");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setLeft(700);
    obj.edit9:setTop(75);
    obj.edit9:setWidth(200);
    obj.edit9:setHeight(25);
    obj.edit9:setField("cabelo");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle1);
    obj.label11:setLeft(910);
    obj.label11:setTop(25);
    obj.label11:setWidth(90);
    obj.label11:setHeight(20);
    obj.label11:setText("TATOO");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setLeft(1000);
    obj.edit10:setTop(25);
    obj.edit10:setWidth(200);
    obj.edit10:setHeight(25);
    obj.edit10:setField("plano");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle1);
    obj.label12:setLeft(910);
    obj.label12:setTop(50);
    obj.label12:setWidth(90);
    obj.label12:setHeight(20);
    obj.label12:setText("CICATRIZES");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setLeft(1000);
    obj.edit11:setTop(50);
    obj.edit11:setWidth(200);
    obj.edit11:setHeight(25);
    obj.edit11:setField("regiao");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setName("edit11");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle1);
    obj.label13:setLeft(910);
    obj.label13:setTop(75);
    obj.label13:setWidth(90);
    obj.label13:setHeight(20);
    obj.label13:setText("ETNIA");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle1);
    obj.edit12:setLeft(1000);
    obj.edit12:setTop(75);
    obj.edit12:setWidth(200);
    obj.edit12:setHeight(25);
    obj.edit12:setField("reino");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setName("edit12");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(110);
    obj.layout1:setWidth(375);
    obj.layout1:setHeight(255);
    obj.layout1:setName("layout1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout1);
    obj.label14:setLeft(5);
    obj.label14:setTop(1);
    obj.label14:setWidth(150);
    obj.label14:setHeight(20);
    obj.label14:setText("CARACTERÍSTICAS");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout1);
    obj.label15:setLeft(5);
    obj.label15:setTop(25);
    obj.label15:setWidth(150);
    obj.label15:setHeight(20);
    obj.label15:setText("Carisma/Charme");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout1);
    obj.edit13:setLeft(155);
    obj.edit13:setTop(25);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setField("carac_p_1");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout1);
    obj.label16:setLeft(190);
    obj.label16:setTop(25);
    obj.label16:setWidth(150);
    obj.label16:setHeight(20);
    obj.label16:setText("Cobiça/Ganancia");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout1);
    obj.edit14:setLeft(340);
    obj.edit14:setTop(25);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setField("carac_n_1");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout1);
    obj.label17:setLeft(5);
    obj.label17:setTop(50);
    obj.label17:setWidth(150);
    obj.label17:setHeight(20);
    obj.label17:setText("Força de Vontade");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout1);
    obj.edit15:setLeft(155);
    obj.edit15:setTop(50);
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(25);
    obj.edit15:setField("carac_p_2");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout1);
    obj.label18:setLeft(190);
    obj.label18:setTop(50);
    obj.label18:setWidth(150);
    obj.label18:setHeight(20);
    obj.label18:setText("Emotividade");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout1);
    obj.edit16:setLeft(340);
    obj.edit16:setTop(50);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setField("carac_n_2");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout1);
    obj.label19:setLeft(5);
    obj.label19:setTop(75);
    obj.label19:setWidth(150);
    obj.label19:setHeight(20);
    obj.label19:setText("Intelecto");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout1);
    obj.edit17:setLeft(155);
    obj.edit17:setTop(75);
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(25);
    obj.edit17:setField("carac_p_3");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout1);
    obj.label20:setLeft(190);
    obj.label20:setTop(75);
    obj.label20:setWidth(150);
    obj.label20:setHeight(20);
    obj.label20:setText("Vício");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout1);
    obj.edit18:setLeft(340);
    obj.edit18:setTop(75);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setField("carac_n_3");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout1);
    obj.label21:setLeft(5);
    obj.label21:setTop(100);
    obj.label21:setWidth(150);
    obj.label21:setHeight(20);
    obj.label21:setText("Discernimento");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout1);
    obj.edit19:setLeft(155);
    obj.edit19:setTop(100);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setField("carac_p_4");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout1);
    obj.label22:setLeft(190);
    obj.label22:setTop(100);
    obj.label22:setWidth(150);
    obj.label22:setHeight(20);
    obj.label22:setText("Maldição");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout1);
    obj.edit20:setLeft(340);
    obj.edit20:setTop(100);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setField("carac_n_4");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout1);
    obj.label23:setLeft(5);
    obj.label23:setTop(125);
    obj.label23:setWidth(150);
    obj.label23:setHeight(20);
    obj.label23:setText("Percepção");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout1);
    obj.edit21:setLeft(155);
    obj.edit21:setTop(125);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setField("carac_p_5");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout1);
    obj.label24:setLeft(190);
    obj.label24:setTop(125);
    obj.label24:setWidth(150);
    obj.label24:setHeight(20);
    obj.label24:setText("Azar");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout1);
    obj.edit22:setLeft(340);
    obj.edit22:setTop(125);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setField("carac_n_5");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout1);
    obj.label25:setLeft(5);
    obj.label25:setTop(150);
    obj.label25:setWidth(150);
    obj.label25:setHeight(20);
    obj.label25:setText("Intimidação");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout1);
    obj.edit23:setLeft(155);
    obj.edit23:setTop(150);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setField("carac_p_6");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout1);
    obj.label26:setLeft(190);
    obj.label26:setTop(150);
    obj.label26:setWidth(150);
    obj.label26:setHeight(20);
    obj.label26:setText("Mitomania");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout1);
    obj.edit24:setLeft(340);
    obj.edit24:setTop(150);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setField("carac_n_6");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout1);
    obj.label27:setLeft(5);
    obj.label27:setTop(175);
    obj.label27:setWidth(150);
    obj.label27:setHeight(20);
    obj.label27:setText("Boa Memória");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout1);
    obj.edit25:setLeft(155);
    obj.edit25:setTop(175);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setField("carac_p_7");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout1);
    obj.label28:setLeft(190);
    obj.label28:setTop(175);
    obj.label28:setWidth(150);
    obj.label28:setHeight(20);
    obj.label28:setText("Trauma/Medo");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout1);
    obj.edit26:setLeft(340);
    obj.edit26:setTop(175);
    obj.edit26:setWidth(30);
    obj.edit26:setHeight(25);
    obj.edit26:setField("carac_n_7");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout1);
    obj.label29:setLeft(5);
    obj.label29:setTop(200);
    obj.label29:setWidth(150);
    obj.label29:setHeight(20);
    obj.label29:setText("Fleuma");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout1);
    obj.edit27:setLeft(155);
    obj.edit27:setTop(200);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setField("carac_p_8");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout1);
    obj.label30:setLeft(190);
    obj.label30:setTop(200);
    obj.label30:setWidth(150);
    obj.label30:setHeight(20);
    obj.label30:setText("Irritação/Orgulho");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout1);
    obj.edit28:setLeft(340);
    obj.edit28:setTop(200);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setField("carac_n_8");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setLeft(155);
    obj.rectangle3:setTop(225);
    obj.rectangle3:setWidth(30);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout1);
    obj.label31:setLeft(155);
    obj.label31:setTop(225);
    obj.label31:setWidth(30);
    obj.label31:setHeight(25);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setField("carac_gasto");
    obj.label31:setName("label31");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout1);
    obj.edit29:setLeft(185);
    obj.edit29:setTop(225);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setField("carac_extra");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout1);
    obj.rectangle4:setLeft(215);
    obj.rectangle4:setTop(225);
    obj.rectangle4:setWidth(30);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.carac_total = GUI.fromHandle(_obj_newObject("label"));
    obj.carac_total:setParent(obj.layout1);
    obj.carac_total:setLeft(215);
    obj.carac_total:setTop(225);
    obj.carac_total:setWidth(30);
    obj.carac_total:setHeight(25);
    obj.carac_total:setHorzTextAlign("center");
    obj.carac_total:setField("carac_total");
    obj.carac_total:setFontColor("green");
    obj.carac_total:setName("carac_total");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setFields({'carac_p_1','carac_p_2','carac_p_3','carac_p_4','carac_p_5','carac_p_6','carac_p_7','carac_p_8'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setFields({'carac_n_1','carac_n_2','carac_n_3','carac_n_4','carac_n_5','carac_n_6','carac_n_7','carac_n_8'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout1);
    obj.dataLink3:setFields({'nivel','carac_penalidade', 'carac_extra'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout1);
    obj.dataLink4:setFields({'carac_gasto','carac_total'});
    obj.dataLink4:setName("dataLink4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(370);
    obj.rectangle5:setWidth(375);
    obj.rectangle5:setHeight(35);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle5);
    obj.label32:setLeft(55);
    obj.label32:setTop(5);
    obj.label32:setWidth(100);
    obj.label32:setHeight(25);
    obj.label32:setText("Carma");
    obj.label32:setName("label32");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle5);
    obj.comboBox1:setLeft(110);
    obj.comboBox1:setTop(5);
    obj.comboBox1:setWidth(200);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("carma");
    obj.comboBox1:setItems({'Divino 2','Divino 1','Humano','Demoníaco 1','Demoníaco 2'});
    obj.comboBox1:setName("comboBox1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(410);
    obj.layout2:setWidth(375);
    obj.layout2:setHeight(195);
    obj.layout2:setName("layout2");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout2);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout2);
    obj.label33:setLeft(5);
    obj.label33:setTop(1);
    obj.label33:setWidth(100);
    obj.label33:setHeight(20);
    obj.label33:setText("PERSONALIDADE");
    obj.label33:setName("label33");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout2);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(365);
    obj.textEditor1:setHeight(165);
    obj.textEditor1:setField("personalidade");
    obj.textEditor1:setName("textEditor1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(380);
    obj.layout3:setTop(110);
    obj.layout3:setWidth(825);
    obj.layout3:setHeight(495);
    obj.layout3:setName("layout3");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout3);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout3);
    obj.label34:setLeft(5);
    obj.label34:setTop(1);
    obj.label34:setWidth(100);
    obj.label34:setHeight(20);
    obj.label34:setText("PRE-MORTEM");
    obj.label34:setName("label34");

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

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local gasto = (tonumber(sheet.carac_p_1) or 0) +
            									(tonumber(sheet.carac_p_2) or 0) +
            									(tonumber(sheet.carac_p_3) or 0) +
            									(tonumber(sheet.carac_p_4) or 0) +
            									(tonumber(sheet.carac_p_5) or 0) +
            									(tonumber(sheet.carac_p_6) or 0) +
            									(tonumber(sheet.carac_p_7) or 0) +
            									(tonumber(sheet.carac_p_8) or 0);
            					sheet.carac_gasto = gasto;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local penalidade = (tonumber(sheet.carac_n_1) or 0) +
            									(tonumber(sheet.carac_n_2) or 0) +
            									(tonumber(sheet.carac_n_3) or 0) +
            									(tonumber(sheet.carac_n_4) or 0) +
            									(tonumber(sheet.carac_n_5) or 0) +
            									(tonumber(sheet.carac_n_6) or 0) +
            									(tonumber(sheet.carac_n_7) or 0) +
            									(tonumber(sheet.carac_n_8) or 0);
            					sheet.carac_penalidade = penalidade;
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nivel = (tonumber(sheet.nivel) or 0);
            					local pen = (sheet.carac_penalidade) or 0;
            					local extra = (sheet.carac_extra) or 0;
            
            					sheet.carac_total = 15 + nivel + pen + extra;
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
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

    function obj:_releaseEvents()
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
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.carac_total ~= nil then self.carac_total:destroy(); self.carac_total = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTemplateDescription()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTemplateDescription();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTemplateDescription = {
    newEditor = newfrmTemplateDescription, 
    new = newfrmTemplateDescription, 
    name = "frmTemplateDescription", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmTemplateDescription = _frmTemplateDescription;
Firecast.registrarForm(_frmTemplateDescription);

return _frmTemplateDescription;
