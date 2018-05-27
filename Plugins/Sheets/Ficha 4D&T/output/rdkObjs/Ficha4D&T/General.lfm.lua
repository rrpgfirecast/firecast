require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGeneral()
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
    obj:setName("frmGeneral");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(660);
    obj.rectangle1:setHeight(60);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(105);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(255);
    obj.label2:setTop(5);
    obj.label2:setWidth(100);
    obj.label2:setHeight(25);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Jogador");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(355);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(150);
    obj.edit2:setHeight(25);
    obj.edit2:setField("jogador");
    obj.edit2:setName("edit2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(505);
    obj.label3:setTop(5);
    obj.label3:setWidth(75);
    obj.label3:setHeight(25);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("Escala");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(580);
    obj.edit3:setTop(5);
    obj.edit3:setWidth(75);
    obj.edit3:setHeight(25);
    obj.edit3:setField("escala");
    obj.edit3:setName("edit3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(5);
    obj.label4:setTop(30);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("Raça");
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(105);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(150);
    obj.edit4:setHeight(25);
    obj.edit4:setField("raca");
    obj.edit4:setName("edit4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(255);
    obj.label5:setTop(30);
    obj.label5:setWidth(100);
    obj.label5:setHeight(25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("Classe");
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(355);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(150);
    obj.edit5:setHeight(25);
    obj.edit5:setField("classe");
    obj.edit5:setName("edit5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(505);
    obj.label6:setTop(30);
    obj.label6:setWidth(75);
    obj.label6:setHeight(25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setText("Nível");
    obj.label6:setName("label6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setLeft(580);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(75);
    obj.edit6:setHeight(25);
    obj.edit6:setField("nivel");
    obj.edit6:setName("edit6");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(65);
    obj.rectangle2:setWidth(160);
    obj.rectangle2:setHeight(185);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle2);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(160);
    obj.label7:setHeight(25);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setText("HABILIDADES");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle2);
    obj.label8:setLeft(5);
    obj.label8:setTop(30);
    obj.label8:setWidth(50);
    obj.label8:setHeight(25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("FOR");
    obj.label8:setName("label8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle2);
    obj.edit7:setLeft(55);
    obj.edit7:setTop(30);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("valor_for");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle2);
    obj.rectangle3:setLeft(105);
    obj.rectangle3:setTop(30);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle2);
    obj.label9:setLeft(105);
    obj.label9:setTop(30);
    obj.label9:setWidth(50);
    obj.label9:setHeight(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setField("mod_for");
    obj.label9:setName("label9");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle2);
    obj.dataLink1:setFields({'valor_for'});
    obj.dataLink1:setName("dataLink1");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle2);
    obj.label10:setLeft(5);
    obj.label10:setTop(55);
    obj.label10:setWidth(50);
    obj.label10:setHeight(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("DES");
    obj.label10:setName("label10");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle2);
    obj.edit8:setLeft(55);
    obj.edit8:setTop(55);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("valor_des");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle2);
    obj.rectangle4:setLeft(105);
    obj.rectangle4:setTop(55);
    obj.rectangle4:setWidth(50);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle2);
    obj.label11:setLeft(105);
    obj.label11:setTop(55);
    obj.label11:setWidth(50);
    obj.label11:setHeight(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setField("mod_des");
    obj.label11:setName("label11");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle2);
    obj.dataLink2:setFields({'valor_des'});
    obj.dataLink2:setName("dataLink2");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle2);
    obj.label12:setLeft(5);
    obj.label12:setTop(80);
    obj.label12:setWidth(50);
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("CON");
    obj.label12:setName("label12");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle2);
    obj.edit9:setLeft(55);
    obj.edit9:setTop(80);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("valor_con");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle2);
    obj.rectangle5:setLeft(105);
    obj.rectangle5:setTop(80);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle2);
    obj.label13:setLeft(105);
    obj.label13:setTop(80);
    obj.label13:setWidth(50);
    obj.label13:setHeight(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setField("mod_con");
    obj.label13:setName("label13");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle2);
    obj.dataLink3:setFields({'valor_con'});
    obj.dataLink3:setName("dataLink3");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle2);
    obj.label14:setLeft(5);
    obj.label14:setTop(105);
    obj.label14:setWidth(50);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setText("INT");
    obj.label14:setName("label14");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle2);
    obj.edit10:setLeft(55);
    obj.edit10:setTop(105);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("valor_int");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle2);
    obj.rectangle6:setLeft(105);
    obj.rectangle6:setTop(105);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle2);
    obj.label15:setLeft(105);
    obj.label15:setTop(105);
    obj.label15:setWidth(50);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setField("mod_int");
    obj.label15:setName("label15");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle2);
    obj.dataLink4:setFields({'valor_int'});
    obj.dataLink4:setName("dataLink4");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle2);
    obj.label16:setLeft(5);
    obj.label16:setTop(130);
    obj.label16:setWidth(50);
    obj.label16:setHeight(25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setText("SAB");
    obj.label16:setName("label16");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle2);
    obj.edit11:setLeft(55);
    obj.edit11:setTop(130);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("valor_sab");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle2);
    obj.rectangle7:setLeft(105);
    obj.rectangle7:setTop(130);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle2);
    obj.label17:setLeft(105);
    obj.label17:setTop(130);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setField("mod_sab");
    obj.label17:setName("label17");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle2);
    obj.dataLink5:setFields({'valor_sab'});
    obj.dataLink5:setName("dataLink5");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle2);
    obj.label18:setLeft(5);
    obj.label18:setTop(155);
    obj.label18:setWidth(50);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setText("CAR");
    obj.label18:setName("label18");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle2);
    obj.edit12:setLeft(55);
    obj.edit12:setTop(155);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("valor_car");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle2);
    obj.rectangle8:setLeft(105);
    obj.rectangle8:setTop(155);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle2);
    obj.label19:setLeft(105);
    obj.label19:setTop(155);
    obj.label19:setWidth(50);
    obj.label19:setHeight(25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setField("mod_car");
    obj.label19:setName("label19");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle2);
    obj.dataLink6:setFields({'valor_car'});
    obj.dataLink6:setName("dataLink6");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.scrollBox1);
    obj.rectangle9:setLeft(165);
    obj.rectangle9:setTop(65);
    obj.rectangle9:setWidth(310);
    obj.rectangle9:setHeight(185);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle9);
    obj.label20:setLeft(0);
    obj.label20:setTop(5);
    obj.label20:setWidth(310);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setText("RESISTÊNCIAS");
    obj.label20:setName("label20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle9);
    obj.label21:setLeft(105);
    obj.label21:setTop(30);
    obj.label21:setWidth(50);
    obj.label21:setHeight(25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontSize(11);
    obj.label21:setText("Total");
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle9);
    obj.label22:setLeft(155);
    obj.label22:setTop(30);
    obj.label22:setWidth(50);
    obj.label22:setHeight(25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setFontSize(11);
    obj.label22:setText("Base");
    obj.label22:setName("label22");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle9);
    obj.label23:setLeft(205);
    obj.label23:setTop(30);
    obj.label23:setWidth(50);
    obj.label23:setHeight(25);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontSize(11);
    obj.label23:setText("Modif.");
    obj.label23:setName("label23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle9);
    obj.label24:setLeft(255);
    obj.label24:setTop(30);
    obj.label24:setWidth(50);
    obj.label24:setHeight(25);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setFontSize(11);
    obj.label24:setText("Outros");
    obj.label24:setName("label24");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle9);
    obj.label25:setLeft(5);
    obj.label25:setTop(55);
    obj.label25:setWidth(100);
    obj.label25:setHeight(25);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setText("Fortitude");
    obj.label25:setName("label25");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.rectangle9);
    obj.rectangle10:setLeft(105);
    obj.rectangle10:setTop(55);
    obj.rectangle10:setWidth(50);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle9);
    obj.label26:setLeft(105);
    obj.label26:setTop(55);
    obj.label26:setWidth(50);
    obj.label26:setHeight(25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setField("total_fortitude");
    obj.label26:setName("label26");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle9);
    obj.edit13:setLeft(155);
    obj.edit13:setTop(55);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("base_fortitude");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle9);
    obj.edit14:setLeft(205);
    obj.edit14:setTop(55);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setField("mod_fortitude");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle9);
    obj.edit15:setLeft(255);
    obj.edit15:setTop(55);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("tr_outros_fortitude");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle9);
    obj.dataLink7:setFields({'base_fortitude', 'mod_fortitude', 'tr_outros_fortitude'});
    obj.dataLink7:setName("dataLink7");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle9);
    obj.label27:setLeft(5);
    obj.label27:setTop(80);
    obj.label27:setWidth(100);
    obj.label27:setHeight(25);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setText("Reflexos");
    obj.label27:setName("label27");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.rectangle9);
    obj.rectangle11:setLeft(105);
    obj.rectangle11:setTop(80);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle9);
    obj.label28:setLeft(105);
    obj.label28:setTop(80);
    obj.label28:setWidth(50);
    obj.label28:setHeight(25);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setField("total_reflexos");
    obj.label28:setName("label28");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle9);
    obj.edit16:setLeft(155);
    obj.edit16:setTop(80);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("base_reflexos");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle9);
    obj.edit17:setLeft(205);
    obj.edit17:setTop(80);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setField("mod_reflexos");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle9);
    obj.edit18:setLeft(255);
    obj.edit18:setTop(80);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setField("tr_outros_reflexos");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle9);
    obj.dataLink8:setFields({'base_reflexos', 'mod_reflexos', 'tr_outros_reflexos'});
    obj.dataLink8:setName("dataLink8");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle9);
    obj.label29:setLeft(5);
    obj.label29:setTop(105);
    obj.label29:setWidth(100);
    obj.label29:setHeight(25);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setText("Vontade");
    obj.label29:setName("label29");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle9);
    obj.rectangle12:setLeft(105);
    obj.rectangle12:setTop(105);
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle9);
    obj.label30:setLeft(105);
    obj.label30:setTop(105);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setField("total_vontade");
    obj.label30:setName("label30");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle9);
    obj.edit19:setLeft(155);
    obj.edit19:setTop(105);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(25);
    obj.edit19:setField("base_vontade");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle9);
    obj.edit20:setLeft(205);
    obj.edit20:setTop(105);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(25);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setField("mod_vontade");
    obj.edit20:setName("edit20");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle9);
    obj.edit21:setLeft(255);
    obj.edit21:setTop(105);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(25);
    obj.edit21:setField("tr_outros_vontade");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle9);
    obj.dataLink9:setFields({'base_vontade', 'mod_vontade', 'tr_outros_vontade'});
    obj.dataLink9:setName("dataLink9");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox1);
    obj.rectangle13:setLeft(480);
    obj.rectangle13:setTop(65);
    obj.rectangle13:setWidth(110);
    obj.rectangle13:setHeight(185);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle13);
    obj.label31:setLeft(0);
    obj.label31:setTop(5);
    obj.label31:setWidth(50);
    obj.label31:setHeight(25);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setText("CA");
    obj.label31:setName("label31");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.rectangle13);
    obj.rectangle14:setLeft(50);
    obj.rectangle14:setTop(5);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle13);
    obj.label32:setLeft(50);
    obj.label32:setTop(5);
    obj.label32:setWidth(50);
    obj.label32:setHeight(25);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setField("ca");
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle13);
    obj.label33:setLeft(0);
    obj.label33:setTop(30);
    obj.label33:setWidth(50);
    obj.label33:setHeight(25);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setText("DES");
    obj.label33:setName("label33");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.rectangle13);
    obj.rectangle15:setLeft(50);
    obj.rectangle15:setTop(30);
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle13);
    obj.label34:setLeft(50);
    obj.label34:setTop(30);
    obj.label34:setWidth(50);
    obj.label34:setHeight(25);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setField("mod_des");
    obj.label34:setName("label34");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle13);
    obj.label35:setLeft(0);
    obj.label35:setTop(55);
    obj.label35:setWidth(50);
    obj.label35:setHeight(25);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setText("ARM");
    obj.label35:setName("label35");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.rectangle13);
    obj.rectangle16:setLeft(50);
    obj.rectangle16:setTop(55);
    obj.rectangle16:setWidth(50);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle13);
    obj.label36:setLeft(50);
    obj.label36:setTop(55);
    obj.label36:setWidth(50);
    obj.label36:setHeight(25);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setField("ca_armadura");
    obj.label36:setName("label36");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle13);
    obj.label37:setLeft(0);
    obj.label37:setTop(80);
    obj.label37:setWidth(50);
    obj.label37:setHeight(25);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setText("ESC");
    obj.label37:setName("label37");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.rectangle13);
    obj.rectangle17:setLeft(50);
    obj.rectangle17:setTop(80);
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle13);
    obj.label38:setLeft(50);
    obj.label38:setTop(80);
    obj.label38:setWidth(50);
    obj.label38:setHeight(25);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setField("ca_escudo");
    obj.label38:setName("label38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle13);
    obj.label39:setLeft(0);
    obj.label39:setTop(105);
    obj.label39:setWidth(50);
    obj.label39:setHeight(25);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setText("NAT");
    obj.label39:setName("label39");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle13);
    obj.edit22:setLeft(50);
    obj.edit22:setTop(105);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setField("ca_natural");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle13);
    obj.label40:setLeft(0);
    obj.label40:setTop(130);
    obj.label40:setWidth(50);
    obj.label40:setHeight(25);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setText("OUT");
    obj.label40:setName("label40");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle13);
    obj.edit23:setLeft(50);
    obj.edit23:setTop(130);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setField("ca_outros");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle13);
    obj.dataLink10:setFields({'mod_des', 'ca_armadura', 'ca_escudo', 'ca_natural', 'ca_outros'});
    obj.dataLink10:setName("dataLink10");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.scrollBox1);
    obj.rectangle18:setLeft(595);
    obj.rectangle18:setTop(65);
    obj.rectangle18:setWidth(110);
    obj.rectangle18:setHeight(85);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setName("rectangle18");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle18);
    obj.label41:setLeft(0);
    obj.label41:setTop(5);
    obj.label41:setWidth(50);
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setText("PVs");
    obj.label41:setName("label41");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle18);
    obj.edit24:setLeft(50);
    obj.edit24:setTop(5);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setField("pvs");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle18);
    obj.label42:setLeft(0);
    obj.label42:setTop(30);
    obj.label42:setWidth(50);
    obj.label42:setHeight(25);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setText("DVs");
    obj.label42:setName("label42");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangle18);
    obj.edit25:setLeft(50);
    obj.edit25:setTop(30);
    obj.edit25:setWidth(50);
    obj.edit25:setHeight(25);
    obj.edit25:setField("dvs");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle18);
    obj.label43:setLeft(0);
    obj.label43:setTop(55);
    obj.label43:setWidth(50);
    obj.label43:setHeight(25);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setText("CON");
    obj.label43:setName("label43");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.rectangle18);
    obj.rectangle19:setLeft(50);
    obj.rectangle19:setTop(55);
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle18);
    obj.label44:setLeft(50);
    obj.label44:setTop(55);
    obj.label44:setWidth(50);
    obj.label44:setHeight(25);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setField("mod_con");
    obj.label44:setName("label44");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.scrollBox1);
    obj.rectangle20:setLeft(595);
    obj.rectangle20:setTop(155);
    obj.rectangle20:setWidth(110);
    obj.rectangle20:setHeight(85);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setName("rectangle20");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle20);
    obj.label45:setLeft(0);
    obj.label45:setTop(5);
    obj.label45:setWidth(50);
    obj.label45:setHeight(25);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setText("INI");
    obj.label45:setName("label45");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle20);
    obj.rectangle21:setLeft(50);
    obj.rectangle21:setTop(5);
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle20);
    obj.label46:setLeft(50);
    obj.label46:setTop(5);
    obj.label46:setWidth(50);
    obj.label46:setHeight(25);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setField("iniciativa");
    obj.label46:setName("label46");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle20);
    obj.label47:setLeft(0);
    obj.label47:setTop(30);
    obj.label47:setWidth(50);
    obj.label47:setHeight(25);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setText("DES");
    obj.label47:setName("label47");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.rectangle20);
    obj.rectangle22:setLeft(50);
    obj.rectangle22:setTop(30);
    obj.rectangle22:setWidth(50);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle20);
    obj.label48:setLeft(50);
    obj.label48:setTop(30);
    obj.label48:setWidth(50);
    obj.label48:setHeight(25);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setField("mod_des");
    obj.label48:setName("label48");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle20);
    obj.label49:setLeft(0);
    obj.label49:setTop(55);
    obj.label49:setWidth(50);
    obj.label49:setHeight(25);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setText("OUT");
    obj.label49:setName("label49");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle20);
    obj.edit26:setLeft(50);
    obj.edit26:setTop(55);
    obj.edit26:setWidth(50);
    obj.edit26:setHeight(25);
    obj.edit26:setField("iniciativa_outros");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle20);
    obj.dataLink11:setFields({'mod_des', 'iniciativa_outros'});
    obj.dataLink11:setName("dataLink11");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.scrollBox1);
    obj.rectangle23:setLeft(0);
    obj.rectangle23:setTop(255);
    obj.rectangle23:setWidth(362);
    obj.rectangle23:setHeight(362);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(1);
    obj.image1:setTop(256);
    obj.image1:setWidth(360);
    obj.image1:setHeight(360);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.scrollBox1);
    obj.rectangle24:setLeft(370);
    obj.rectangle24:setTop(255);
    obj.rectangle24:setWidth(240);
    obj.rectangle24:setHeight(300);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setName("rectangle24");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle24);
    obj.button1:setLeft(5);
    obj.button1:setTop(5);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle24);
    obj.label50:setLeft(0);
    obj.label50:setTop(5);
    obj.label50:setWidth(240);
    obj.label50:setHeight(25);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setText("TALENTOS E DEFEITOS");
    obj.label50:setName("label50");

    obj.rclTalentos = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclTalentos:setParent(obj.rectangle24);
    obj.rclTalentos:setLeft(0);
    obj.rclTalentos:setTop(30);
    obj.rclTalentos:setWidth(240);
    obj.rclTalentos:setHeight(260);
    obj.rclTalentos:setName("rclTalentos");
    obj.rclTalentos:setField("listaDeTalentos");
    obj.rclTalentos:setTemplateForm("frmRecordListForm");
    obj.rclTalentos:setLayout("vertical");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.scrollBox1);
    obj.rectangle25:setLeft(615);
    obj.rectangle25:setTop(255);
    obj.rectangle25:setWidth(240);
    obj.rectangle25:setHeight(300);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setName("rectangle25");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle25);
    obj.button2:setLeft(5);
    obj.button2:setTop(5);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setName("button2");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle25);
    obj.label51:setLeft(0);
    obj.label51:setTop(5);
    obj.label51:setWidth(240);
    obj.label51:setHeight(25);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setText("MAGIAS");
    obj.label51:setName("label51");

    obj.rclMagias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.rectangle25);
    obj.rclMagias:setLeft(0);
    obj.rclMagias:setTop(30);
    obj.rclMagias:setWidth(240);
    obj.rclMagias:setHeight(260);
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("listaDeMagias");
    obj.rclMagias:setTemplateForm("frmRecordListForm");
    obj.rclMagias:setLayout("vertical");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            				local valor = tonumber(sheet.valor_for) or 0;
            				local mod = math.floor((valor - 10)/2);
            				sheet.mod_for = mod;
            
            				updateAtributes(1);
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            				local valor = tonumber(sheet.valor_des) or 0;
            				local mod = math.floor((valor - 10)/2);
            				sheet.mod_des = mod;
            
            				updateAtributes(2);
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            				local valor = tonumber(sheet.valor_con) or 0;
            				local mod = math.floor((valor - 10)/2);
            				sheet.mod_con = mod;
            
            				updateAtributes(3);
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            				local valor = tonumber(sheet.valor_int) or 0;
            				local mod = math.floor((valor - 10)/2);
            				sheet.mod_int = mod;
            
            				updateAtributes(4);
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            				local valor = tonumber(sheet.valor_sab) or 0;
            				local mod = math.floor((valor - 10)/2);
            				sheet.mod_sab = mod;
            
            				updateAtributes(5);
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            				local valor = tonumber(sheet.valor_car) or 0;
            				local mod = math.floor((valor - 10)/2);
            				sheet.mod_car = mod;
            
            				updateAtributes(6);
        end, obj);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.base_fortitude) or 0) +
            								(tonumber(sheet.mod_fortitude) or 0) +
            								(tonumber(sheet.tr_outros_fortitude) or 0);
            				sheet.total_fortitude = total;
        end, obj);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.base_reflexos) or 0) +
            								(tonumber(sheet.mod_reflexos) or 0) +
            								(tonumber(sheet.tr_outros_reflexos) or 0);
            				sheet.total_reflexos = total;
        end, obj);

    obj._e_event8 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.base_vontade) or 0) +
            								(tonumber(sheet.mod_vontade) or 0) +
            								(tonumber(sheet.tr_outros_vontade) or 0);
            				sheet.total_vontade = total;
        end, obj);

    obj._e_event9 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            					sheet.ca = (tonumber(sheet.mod_des) or 0) + 
            								(tonumber(sheet.ca_armadura) or 0) + 
            								(tonumber(sheet.ca_escudo) or 0) + 
            								(tonumber(sheet.ca_natural) or 0) + 
            								(tonumber(sheet.ca_outros) or 0) + 10;
        end, obj);

    obj._e_event10 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            					sheet.iniciativa = (tonumber(sheet.mod_des) or 0) + 
            										(tonumber(sheet.iniciativa_outros) or 0);
        end, obj);

    obj._e_event11 = obj.image1:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event12 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclTalentos:append();
        end, obj);

    obj._e_event13 = obj.rclTalentos:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event14 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclMagias:append();
        end, obj);

    obj._e_event15 = obj.rclMagias:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
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

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.rclTalentos ~= nil then self.rclTalentos:destroy(); self.rclTalentos = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGeneral = {
    newEditor = newfrmGeneral, 
    new = newfrmGeneral, 
    name = "frmGeneral", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGeneral = _frmGeneral;
rrpg.registrarForm(_frmGeneral);

return _frmGeneral;
