require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmTemplate()
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
    obj:setName("frmTemplate");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.4DeT");
    obj:setTitle("Ficha 4D&T");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.frmGeneral = gui.fromHandle(_obj_newObject("form"));
    obj.frmGeneral:setParent(obj.tab1);
    obj.frmGeneral:setName("frmGeneral");
    obj.frmGeneral:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmGeneral);
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

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Perícias");
    obj.tab2:setName("tab2");

    obj.frmSkills = gui.fromHandle(_obj_newObject("form"));
    obj.frmSkills:setParent(obj.tab2);
    obj.frmSkills:setName("frmSkills");
    obj.frmSkills:setAlign("client");


		local skills = {};
		skills[1] = {};
		skills[2] = {};
		skills[3] = {};
		skills[4] = {};
		skills[5] = {};
		skills[6] = {};
		skills[7] = {};
		skills[8] = {};
		skills[9] = {};
		skills[10] = {};
		skills[11] = {};
		skills[12] = {};
		skills[13] = {};
		skills[14] = {};
		skills[15] = {};
		skills[16] = {};
		skills[17] = {};
		skills[18] = {};
		skills[19] = {};
		skills[20] = {};
		skills[21] = {};
		skills[22] = {};
		skills[23] = {};
		skills[24] = {};
		skills[25] = {};
		skills[26] = {};
		skills[27] = {};
		skills[28] = {};
		skills[29] = {};
		skills[30] = {};
		skills[31] = {};
		skills[32] = {};
		skills[33] = {};
		skills[34] = {};
		skills[35] = {};
		skills[36] = {};
		skills[37] = {};
		skills[38] = {};
		skills[39] = {};
		skills[40] = {};
		skills[41] = {};
		skills[42] = {};
		skills[43] = {};
		skills[44] = {};
		skills[45] = {};
		skills[46] = {};
		skills[47] = {};
		skills[48] = {};
		skills[49] = {};
		skills[50] = {};
		skills[51] = {};
		skills[52] = {};
		skills[53] = {};
		skills[54] = {};
		skills[55] = {};
		skills[1].nome = "Abrir Fechaduras ";
		skills[1].chave = "2";
		skills[2].nome = "Acrobacia ";
		skills[2].chave = "2";
		skills[3].nome = "Adestrar Animais ";
		skills[3].chave = "6";
		skills[4].nome = "Arte da Fuga ";
		skills[4].chave = "2";
		skills[5].nome = "Atuação ";
		skills[5].chave = "6";
		skills[6].nome = "Avaliação ";
		skills[6].chave = "4";
		skills[7].nome = "Blefar ";
		skills[7].chave = "6";
		skills[8].nome = "Cavalgar ";
		skills[8].chave = "2";
		skills[9].nome = "Concentração ";
		skills[9].chave = "3";
		skills[10].nome = "Conhecimento Arcano ";
		skills[10].chave = "4";
		skills[11].nome = "Conhecimento Arte ";
		skills[11].chave = "4";
		skills[12].nome = "Conhecimento Atualidades ";
		skills[12].chave = "4";
		skills[13].nome = "Conhecimento Ciências Comportamentais ";
		skills[13].chave = "4";
		skills[14].nome = "Conhecimento Ciências Físicas ";
		skills[14].chave = "4";
		skills[15].nome = "Conhecimento Ciências Naturais ";
		skills[15].chave = "4";
		skills[16].nome = "Conhecimento Civil ";
		skills[16].chave = "4";
		skills[17].nome = "Conhecimento Cultura Popular ";
		skills[17].chave = "4";
		skills[18].nome = "Conhecimento Estratégia ";
		skills[18].chave = "4";
		skills[19].nome = "Conhecimento História ";
		skills[19].chave = "4";
		skills[20].nome = "Conhecimento Manha ";
		skills[20].chave = "4";
		skills[21].nome = "Conhecimento Negócios ";
		skills[21].chave = "4";
		skills[22].nome = "Conhecimento Tecnologia ";
		skills[22].chave = "4";
		skills[23].nome = "Conhecimento Teologia e Filosofia ";
		skills[23].chave = "4";
		skills[24].nome = "Cura ";
		skills[24].chave = "5";
		skills[25].nome = "Decifrar Escrita ";
		skills[25].chave = "4";
		skills[26].nome = "Demolição ";
		skills[26].chave = "4";
		skills[27].nome = "Diplomacia ";
		skills[27].chave = "6";
		skills[28].nome = "Disfarce ";
		skills[28].chave = "6";
		skills[29].nome = "Equilíbrio ";
		skills[29].chave = "2";
		skills[30].nome = "Escalar ";
		skills[30].chave = "1";
		skills[31].nome = "Esconder-se ";
		skills[31].chave = "2";
		skills[32].nome = "Falar Idioma ";
		skills[32].chave = "4";
		skills[33].nome = "Furtividade ";
		skills[33].chave = "2";
		skills[34].nome = "Identificar Magia ";
		skills[34].chave = "4";
		skills[35].nome = "Intimidar ";
		skills[35].chave = "6";
		skills[36].nome = "Investigar ";
		skills[36].chave = "4";
		skills[37].nome = "Jogos ";
		skills[37].chave = "5";
		skills[38].nome = "Natação ";
		skills[38].chave = "1";
		skills[39].nome = "Navegação ";
		skills[39].chave = "4";
		skills[40].nome = "Observar ";
		skills[40].chave = "5";
		skills[41].nome = "Obter Informações ";
		skills[41].chave = "6";
		skills[42].nome = "Ofícios ";
		skills[42].chave = "4";
		skills[43].nome = "Operar Mecanismo ";
		skills[43].chave = "4";
		skills[44].nome = "Ouvir ";
		skills[44].chave = "5";
		skills[45].nome = "Pesquisa ";
		skills[45].chave = "4";
		skills[46].nome = "Pilotar ";
		skills[46].chave = "2";
		skills[47].nome = "Prestidigitação ";
		skills[47].chave = "2";
		skills[48].nome = "Procurar ";
		skills[48].chave = "4";
		skills[49].nome = "Profissão ";
		skills[49].chave = "5";
		skills[50].nome = "Reparos ";
		skills[50].chave = "4";
		skills[51].nome = "Saltar ";
		skills[51].chave = "1";
		skills[52].nome = "Sentir Motivação ";
		skills[52].chave = "5";
		skills[53].nome = "Sobrevivência ";
		skills[53].chave = "5";
		skills[54].nome = "Usar Computador ";
		skills[54].chave = "4";
		skills[55].nome = "Usar Cordas ";
		skills[55].chave = "2";

		local function updateAtributes(num)
			local atr = "" .. num;
			local mod = 0;
			
			if num == 1 then
				mod = tonumber(sheet.mod_for) or 0;
			elseif num == 2 then
				mod = tonumber(sheet.mod_des) or 0;
			elseif num == 3 then
				mod = tonumber(sheet.mod_con) or 0;
			elseif num == 4 then
				mod = tonumber(sheet.mod_int) or 0;
			elseif num == 5 then
				mod = tonumber(sheet.mod_sab) or 0;
			elseif num == 6 then
				mod = tonumber(sheet.mod_car) or 0;
			end;

			local nodes = ndb.getChildNodes(sheet.listaDePericias); 
			for i=1, #nodes, 1 do
				if nodes[i].chave == atr then
					nodes[i].atributo = mod;
				end;
			end
		end;

		local function defaultSkills()
			local nodes = ndb.getChildNodes(sheet.listaDePericias); 
			for i=1, #nodes, 1 do
				ndb.deleteNode(nodes[i]);
			end

			for i=1, 55, 1 do
				local pericia = self.rclPericias:append();
				pericia.nome = skills[i].nome;
				pericia.chave = skills[i].chave;
			end;

			self.rclPericias:sort();
		end;
	


    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmSkills);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.scrollBox2);
    obj.rectangle26:setLeft(0);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(880);
    obj.rectangle26:setHeight(600);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setName("rectangle26");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle26);
    obj.button3:setLeft(5);
    obj.button3:setTop(5);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("+");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle26);
    obj.button4:setLeft(30);
    obj.button4:setTop(5);
    obj.button4:setWidth(50);
    obj.button4:setHeight(25);
    obj.button4:setText("Todas");
    obj.button4:setName("button4");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle26);
    obj.label52:setLeft(215);
    obj.label52:setTop(5);
    obj.label52:setWidth(50);
    obj.label52:setHeight(25);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setText("Total");
    obj.label52:setFontSize(13);
    obj.label52:setName("label52");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle26);
    obj.label53:setLeft(275);
    obj.label53:setTop(5);
    obj.label53:setWidth(40);
    obj.label53:setHeight(25);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setText("Mod");
    obj.label53:setFontSize(13);
    obj.label53:setName("label53");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle26);
    obj.label54:setLeft(315);
    obj.label54:setTop(5);
    obj.label54:setWidth(40);
    obj.label54:setHeight(25);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setText("Grad");
    obj.label54:setFontSize(13);
    obj.label54:setName("label54");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle26);
    obj.label55:setLeft(355);
    obj.label55:setTop(5);
    obj.label55:setWidth(40);
    obj.label55:setHeight(25);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setText("Outros");
    obj.label55:setFontSize(10);
    obj.label55:setName("label55");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle26);
    obj.label56:setLeft(640);
    obj.label56:setTop(5);
    obj.label56:setWidth(50);
    obj.label56:setHeight(25);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setText("Total");
    obj.label56:setFontSize(13);
    obj.label56:setName("label56");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle26);
    obj.label57:setLeft(700);
    obj.label57:setTop(5);
    obj.label57:setWidth(40);
    obj.label57:setHeight(25);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setText("Mod");
    obj.label57:setFontSize(13);
    obj.label57:setName("label57");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle26);
    obj.label58:setLeft(740);
    obj.label58:setTop(5);
    obj.label58:setWidth(40);
    obj.label58:setHeight(25);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setText("Grad");
    obj.label58:setFontSize(13);
    obj.label58:setName("label58");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle26);
    obj.label59:setLeft(780);
    obj.label59:setTop(5);
    obj.label59:setWidth(40);
    obj.label59:setHeight(25);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setText("Outros");
    obj.label59:setFontSize(10);
    obj.label59:setName("label59");

    obj.rclPericias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclPericias:setParent(obj.rectangle26);
    obj.rclPericias:setLeft(5);
    obj.rclPericias:setTop(30);
    obj.rclPericias:setWidth(870);
    obj.rclPericias:setHeight(565);
    obj.rclPericias:setName("rclPericias");
    obj.rclPericias:setField("listaDePericias");
    obj.rclPericias:setTemplateForm("frmSkillListForm");
    obj.rclPericias:setLayout("verticalTiles");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.scrollBox2);
    obj.rectangle27:setLeft(885);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(240);
    obj.rectangle27:setHeight(60);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setName("rectangle27");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle27);
    obj.label60:setLeft(0);
    obj.label60:setTop(5);
    obj.label60:setWidth(240);
    obj.label60:setHeight(25);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setText("Grupos de Perícias");
    obj.label60:setName("label60");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle27);
    obj.edit27:setLeft(5);
    obj.edit27:setTop(30);
    obj.edit27:setWidth(230);
    obj.edit27:setHeight(25);
    obj.edit27:setField("pericias");
    obj.edit27:setName("edit27");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Inventario");
    obj.tab3:setName("tab3");

    obj.frmInventory = gui.fromHandle(_obj_newObject("form"));
    obj.frmInventory:setParent(obj.tab3);
    obj.frmInventory:setName("frmInventory");
    obj.frmInventory:setAlign("client");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmInventory);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.scrollBox3);
    obj.rectangle28:setLeft(0);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(820);
    obj.rectangle28:setHeight(300);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setName("rectangle28");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle28);
    obj.button5:setLeft(5);
    obj.button5:setTop(5);
    obj.button5:setWidth(25);
    obj.button5:setHeight(25);
    obj.button5:setText("+");
    obj.button5:setName("button5");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle28);
    obj.label61:setLeft(0);
    obj.label61:setTop(5);
    obj.label61:setWidth(820);
    obj.label61:setHeight(25);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setText("ARMAS");
    obj.label61:setName("label61");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle28);
    obj.label62:setLeft(5);
    obj.label62:setTop(30);
    obj.label62:setWidth(150);
    obj.label62:setHeight(25);
    obj.label62:setText("Nome");
    obj.label62:setFontSize(13);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle28);
    obj.label63:setLeft(155);
    obj.label63:setTop(30);
    obj.label63:setWidth(150);
    obj.label63:setHeight(25);
    obj.label63:setText("Ataque Total");
    obj.label63:setFontSize(13);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle28);
    obj.label64:setLeft(305);
    obj.label64:setTop(30);
    obj.label64:setWidth(50);
    obj.label64:setHeight(25);
    obj.label64:setText("BBA");
    obj.label64:setFontSize(13);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle28);
    obj.label65:setLeft(355);
    obj.label65:setTop(30);
    obj.label65:setWidth(50);
    obj.label65:setHeight(25);
    obj.label65:setText("Modif.");
    obj.label65:setFontSize(13);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle28);
    obj.label66:setLeft(405);
    obj.label66:setTop(30);
    obj.label66:setWidth(50);
    obj.label66:setHeight(25);
    obj.label66:setText("Outros");
    obj.label66:setFontSize(13);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle28);
    obj.label67:setLeft(455);
    obj.label67:setTop(30);
    obj.label67:setWidth(50);
    obj.label67:setHeight(25);
    obj.label67:setText("Dano");
    obj.label67:setFontSize(13);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle28);
    obj.label68:setLeft(510);
    obj.label68:setTop(30);
    obj.label68:setWidth(50);
    obj.label68:setHeight(25);
    obj.label68:setText("Tipo");
    obj.label68:setFontSize(13);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle28);
    obj.label69:setLeft(560);
    obj.label69:setTop(30);
    obj.label69:setWidth(50);
    obj.label69:setHeight(25);
    obj.label69:setText("Tamanho");
    obj.label69:setFontSize(11);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle28);
    obj.label70:setLeft(610);
    obj.label70:setTop(30);
    obj.label70:setWidth(50);
    obj.label70:setHeight(25);
    obj.label70:setText("Alcance");
    obj.label70:setFontSize(13);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle28);
    obj.label71:setLeft(660);
    obj.label71:setTop(30);
    obj.label71:setWidth(110);
    obj.label71:setHeight(25);
    obj.label71:setText("Qualidades");
    obj.label71:setFontSize(13);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.rclArmas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclArmas:setParent(obj.rectangle28);
    obj.rclArmas:setLeft(5);
    obj.rclArmas:setTop(55);
    obj.rclArmas:setWidth(810);
    obj.rclArmas:setHeight(235);
    obj.rclArmas:setName("rclArmas");
    obj.rclArmas:setField("listaDeArmas");
    obj.rclArmas:setTemplateForm("frmWeaponListForm");
    obj.rclArmas:setLayout("vertical");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.scrollBox3);
    obj.rectangle29:setLeft(0);
    obj.rectangle29:setTop(305);
    obj.rectangle29:setWidth(240);
    obj.rectangle29:setHeight(300);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setName("rectangle29");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle29);
    obj.button6:setLeft(5);
    obj.button6:setTop(5);
    obj.button6:setWidth(25);
    obj.button6:setHeight(25);
    obj.button6:setText("+");
    obj.button6:setName("button6");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle29);
    obj.label72:setLeft(0);
    obj.label72:setTop(5);
    obj.label72:setWidth(240);
    obj.label72:setHeight(25);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setText("MOCHILA");
    obj.label72:setName("label72");

    obj.rclMochila = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMochila:setParent(obj.rectangle29);
    obj.rclMochila:setLeft(0);
    obj.rclMochila:setTop(30);
    obj.rclMochila:setWidth(240);
    obj.rclMochila:setHeight(260);
    obj.rclMochila:setName("rclMochila");
    obj.rclMochila:setField("listaDeMochila");
    obj.rclMochila:setTemplateForm("frmRecordListForm");
    obj.rclMochila:setLayout("vertical");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.scrollBox3);
    obj.rectangle30:setLeft(245);
    obj.rectangle30:setTop(305);
    obj.rectangle30:setWidth(240);
    obj.rectangle30:setHeight(300);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle30);
    obj.button7:setLeft(5);
    obj.button7:setTop(5);
    obj.button7:setWidth(25);
    obj.button7:setHeight(25);
    obj.button7:setText("+");
    obj.button7:setName("button7");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle30);
    obj.label73:setLeft(0);
    obj.label73:setTop(5);
    obj.label73:setWidth(240);
    obj.label73:setHeight(25);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setText("EQUIPAMENTOS");
    obj.label73:setName("label73");

    obj.rclEquipamentos = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclEquipamentos:setParent(obj.rectangle30);
    obj.rclEquipamentos:setLeft(0);
    obj.rclEquipamentos:setTop(30);
    obj.rclEquipamentos:setWidth(240);
    obj.rclEquipamentos:setHeight(260);
    obj.rclEquipamentos:setName("rclEquipamentos");
    obj.rclEquipamentos:setField("listaDeEquipamentos");
    obj.rclEquipamentos:setTemplateForm("frmRecordListForm");
    obj.rclEquipamentos:setLayout("vertical");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.scrollBox3);
    obj.rectangle31:setLeft(490);
    obj.rectangle31:setTop(305);
    obj.rectangle31:setWidth(230);
    obj.rectangle31:setHeight(110);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setName("rectangle31");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle31);
    obj.label74:setLeft(0);
    obj.label74:setTop(5);
    obj.label74:setWidth(230);
    obj.label74:setHeight(25);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setText("ARMADURA");
    obj.label74:setName("label74");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle31);
    obj.label75:setLeft(0);
    obj.label75:setTop(30);
    obj.label75:setWidth(100);
    obj.label75:setHeight(25);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setText("Nome");
    obj.label75:setName("label75");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle31);
    obj.edit28:setLeft(100);
    obj.edit28:setTop(30);
    obj.edit28:setWidth(120);
    obj.edit28:setHeight(25);
    obj.edit28:setField("armadura");
    obj.edit28:setName("edit28");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.rectangle31);
    obj.label76:setLeft(0);
    obj.label76:setTop(55);
    obj.label76:setWidth(100);
    obj.label76:setHeight(25);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setText("Bônus na CA");
    obj.label76:setName("label76");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle31);
    obj.edit29:setLeft(100);
    obj.edit29:setTop(55);
    obj.edit29:setWidth(60);
    obj.edit29:setHeight(25);
    obj.edit29:setField("ca_armadura");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle31);
    obj.label77:setLeft(0);
    obj.label77:setTop(80);
    obj.label77:setWidth(100);
    obj.label77:setHeight(25);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setText("Tipo");
    obj.label77:setName("label77");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle31);
    obj.edit30:setLeft(100);
    obj.edit30:setTop(80);
    obj.edit30:setWidth(120);
    obj.edit30:setHeight(25);
    obj.edit30:setField("armadura_tipo");
    obj.edit30:setName("edit30");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.scrollBox3);
    obj.rectangle32:setLeft(490);
    obj.rectangle32:setTop(420);
    obj.rectangle32:setWidth(230);
    obj.rectangle32:setHeight(110);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setName("rectangle32");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle32);
    obj.label78:setLeft(0);
    obj.label78:setTop(5);
    obj.label78:setWidth(230);
    obj.label78:setHeight(25);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setText("ESCUDO");
    obj.label78:setName("label78");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.rectangle32);
    obj.label79:setLeft(0);
    obj.label79:setTop(30);
    obj.label79:setWidth(100);
    obj.label79:setHeight(25);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setText("Nome");
    obj.label79:setName("label79");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle32);
    obj.edit31:setLeft(100);
    obj.edit31:setTop(30);
    obj.edit31:setWidth(120);
    obj.edit31:setHeight(25);
    obj.edit31:setField("escudo");
    obj.edit31:setName("edit31");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.rectangle32);
    obj.label80:setLeft(0);
    obj.label80:setTop(55);
    obj.label80:setWidth(100);
    obj.label80:setHeight(25);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setText("Bônus na CA");
    obj.label80:setName("label80");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle32);
    obj.edit32:setLeft(100);
    obj.edit32:setTop(55);
    obj.edit32:setWidth(60);
    obj.edit32:setHeight(25);
    obj.edit32:setField("ca_escudo");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.rectangle32);
    obj.label81:setLeft(0);
    obj.label81:setTop(80);
    obj.label81:setWidth(100);
    obj.label81:setHeight(25);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setText("Tipo");
    obj.label81:setName("label81");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle32);
    obj.edit33:setLeft(100);
    obj.edit33:setTop(80);
    obj.edit33:setWidth(120);
    obj.edit33:setHeight(25);
    obj.edit33:setField("escudo_tipo");
    obj.edit33:setName("edit33");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Descrição");
    obj.tab4:setName("tab4");

    obj.frmTemplateDescription = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab4);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmTemplateDescription);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.scrollBox4);
    obj.rectangle33:setLeft(0);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(910);
    obj.rectangle33:setHeight(105);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setName("rectangle33");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.rectangle33);
    obj.label82:setLeft(3);
    obj.label82:setTop(1);
    obj.label82:setWidth(100);
    obj.label82:setHeight(20);
    obj.label82:setText("DESCRIÇÃO");
    obj.label82:setName("label82");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.rectangle33);
    obj.label83:setLeft(10);
    obj.label83:setTop(25);
    obj.label83:setWidth(90);
    obj.label83:setHeight(20);
    obj.label83:setText("NACIONALIDADE");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setFontSize(11);
    obj.label83:setName("label83");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle33);
    obj.edit34:setLeft(100);
    obj.edit34:setTop(25);
    obj.edit34:setWidth(200);
    obj.edit34:setHeight(25);
    obj.edit34:setField("nacionalidade");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setName("edit34");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.rectangle33);
    obj.label84:setLeft(10);
    obj.label84:setTop(50);
    obj.label84:setWidth(90);
    obj.label84:setHeight(20);
    obj.label84:setText("ALTURA");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setFontSize(13);
    obj.label84:setName("label84");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle33);
    obj.edit35:setLeft(100);
    obj.edit35:setTop(50);
    obj.edit35:setWidth(200);
    obj.edit35:setHeight(25);
    obj.edit35:setField("altura");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setName("edit35");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle33);
    obj.label85:setLeft(10);
    obj.label85:setTop(75);
    obj.label85:setWidth(90);
    obj.label85:setHeight(20);
    obj.label85:setText("PESO");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setFontSize(13);
    obj.label85:setName("label85");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle33);
    obj.edit36:setLeft(100);
    obj.edit36:setTop(75);
    obj.edit36:setWidth(200);
    obj.edit36:setHeight(25);
    obj.edit36:setField("peso");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setName("edit36");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.rectangle33);
    obj.label86:setLeft(310);
    obj.label86:setTop(25);
    obj.label86:setWidth(90);
    obj.label86:setHeight(20);
    obj.label86:setText("IDADE");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setFontSize(13);
    obj.label86:setName("label86");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle33);
    obj.edit37:setLeft(400);
    obj.edit37:setTop(25);
    obj.edit37:setWidth(200);
    obj.edit37:setHeight(25);
    obj.edit37:setField("idade");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setName("edit37");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.rectangle33);
    obj.label87:setLeft(310);
    obj.label87:setTop(50);
    obj.label87:setWidth(90);
    obj.label87:setHeight(20);
    obj.label87:setText("SEXO");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setFontSize(13);
    obj.label87:setName("label87");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle33);
    obj.edit38:setLeft(400);
    obj.edit38:setTop(50);
    obj.edit38:setWidth(200);
    obj.edit38:setHeight(25);
    obj.edit38:setField("sexo");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setName("edit38");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.rectangle33);
    obj.label88:setLeft(310);
    obj.label88:setTop(75);
    obj.label88:setWidth(90);
    obj.label88:setHeight(20);
    obj.label88:setText("OUTROS");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setFontSize(13);
    obj.label88:setName("label88");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle33);
    obj.edit39:setLeft(400);
    obj.edit39:setTop(75);
    obj.edit39:setWidth(200);
    obj.edit39:setHeight(25);
    obj.edit39:setField("aparenciaOutros");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setName("edit39");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.rectangle33);
    obj.label89:setLeft(610);
    obj.label89:setTop(25);
    obj.label89:setWidth(90);
    obj.label89:setHeight(20);
    obj.label89:setText("OLHOS");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setFontSize(13);
    obj.label89:setName("label89");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.rectangle33);
    obj.edit40:setLeft(700);
    obj.edit40:setTop(25);
    obj.edit40:setWidth(200);
    obj.edit40:setHeight(25);
    obj.edit40:setField("aparenciaOlhos");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setName("edit40");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.rectangle33);
    obj.label90:setLeft(610);
    obj.label90:setTop(50);
    obj.label90:setWidth(90);
    obj.label90:setHeight(20);
    obj.label90:setText("PELE");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setFontSize(13);
    obj.label90:setName("label90");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.rectangle33);
    obj.edit41:setLeft(700);
    obj.edit41:setTop(50);
    obj.edit41:setWidth(200);
    obj.edit41:setHeight(25);
    obj.edit41:setField("pele");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setName("edit41");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.rectangle33);
    obj.label91:setLeft(610);
    obj.label91:setTop(75);
    obj.label91:setWidth(90);
    obj.label91:setHeight(20);
    obj.label91:setText("CABELO");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setFontSize(13);
    obj.label91:setName("label91");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.rectangle33);
    obj.edit42:setLeft(700);
    obj.edit42:setTop(75);
    obj.edit42:setWidth(200);
    obj.edit42:setHeight(25);
    obj.edit42:setField("cabelo");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setName("edit42");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox4);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(110);
    obj.layout1:setWidth(375);
    obj.layout1:setHeight(240);
    obj.layout1:setName("layout1");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout1);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setName("rectangle34");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout1);
    obj.label92:setLeft(5);
    obj.label92:setTop(1);
    obj.label92:setWidth(100);
    obj.label92:setHeight(20);
    obj.label92:setText("APARÊNCIA");
    obj.label92:setName("label92");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(365);
    obj.textEditor1:setHeight(210);
    obj.textEditor1:setField("aparencia");
    obj.textEditor1:setName("textEditor1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox4);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(355);
    obj.layout2:setWidth(375);
    obj.layout2:setHeight(250);
    obj.layout2:setName("layout2");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout2);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("black");
    obj.rectangle35:setName("rectangle35");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout2);
    obj.label93:setLeft(5);
    obj.label93:setTop(1);
    obj.label93:setWidth(100);
    obj.label93:setHeight(20);
    obj.label93:setText("PERSONALIDADE");
    obj.label93:setName("label93");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout2);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(365);
    obj.textEditor2:setHeight(220);
    obj.textEditor2:setField("personalidade");
    obj.textEditor2:setName("textEditor2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox4);
    obj.layout3:setLeft(380);
    obj.layout3:setTop(110);
    obj.layout3:setWidth(825);
    obj.layout3:setHeight(495);
    obj.layout3:setName("layout3");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout3);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setName("rectangle36");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout3);
    obj.label94:setLeft(5);
    obj.label94:setTop(1);
    obj.label94:setWidth(100);
    obj.label94:setHeight(20);
    obj.label94:setText("HISTORIA");
    obj.label94:setName("label94");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
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

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.frmTemplateNotes = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab5);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmTemplateNotes);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox5);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(400);
    obj.layout4:setHeight(580);
    obj.layout4:setName("layout4");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout4);
    obj.rectangle37:setLeft(0);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(400);
    obj.rectangle37:setHeight(580);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setXradius(5);
    obj.rectangle37:setYradius(15);
    obj.rectangle37:setCornerType("round");
    obj.rectangle37:setName("rectangle37");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout4);
    obj.label95:setLeft(0);
    obj.label95:setTop(0);
    obj.label95:setWidth(400);
    obj.label95:setHeight(20);
    obj.label95:setText("Anotações");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout4);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(540);
    obj.textEditor3:setField("anotacoes1");
    obj.textEditor3:setName("textEditor3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox5);
    obj.layout5:setLeft(410);
    obj.layout5:setTop(0);
    obj.layout5:setWidth(400);
    obj.layout5:setHeight(580);
    obj.layout5:setName("layout5");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout5);
    obj.rectangle38:setLeft(0);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(400);
    obj.rectangle38:setHeight(580);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setXradius(5);
    obj.rectangle38:setYradius(15);
    obj.rectangle38:setCornerType("round");
    obj.rectangle38:setName("rectangle38");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout5);
    obj.label96:setLeft(0);
    obj.label96:setTop(0);
    obj.label96:setWidth(400);
    obj.label96:setHeight(20);
    obj.label96:setText("Anotações");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout5);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(540);
    obj.textEditor4:setField("anotacoes2");
    obj.textEditor4:setName("textEditor4");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox5);
    obj.layout6:setLeft(820);
    obj.layout6:setTop(0);
    obj.layout6:setWidth(400);
    obj.layout6:setHeight(580);
    obj.layout6:setName("layout6");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout6);
    obj.rectangle39:setLeft(0);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(400);
    obj.rectangle39:setHeight(580);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setXradius(5);
    obj.rectangle39:setYradius(15);
    obj.rectangle39:setCornerType("round");
    obj.rectangle39:setName("rectangle39");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout6);
    obj.label97:setLeft(0);
    obj.label97:setTop(0);
    obj.label97:setWidth(400);
    obj.label97:setHeight(20);
    obj.label97:setText("Anotações");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout6);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(540);
    obj.textEditor5:setField("anotacoes3");
    obj.textEditor5:setName("textEditor5");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Creditos");
    obj.tab6:setName("tab6");

    obj.frmTemplateCreditos = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab6);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmTemplateCreditos);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox6);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(500);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/Ficha4D&T/images/logo.jpg");
    obj.image2:setName("image2");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox6);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Ficha4D&T/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox6);
    obj.layout7:setLeft(850);
    obj.layout7:setTop(0);
    obj.layout7:setWidth(200);
    obj.layout7:setHeight(160);
    obj.layout7:setName("layout7");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout7);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("black");
    obj.rectangle40:setXradius(5);
    obj.rectangle40:setYradius(15);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setName("rectangle40");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout7);
    obj.label98:setLeft(0);
    obj.label98:setTop(10);
    obj.label98:setWidth(200);
    obj.label98:setHeight(20);
    obj.label98:setText("Programador: ");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout7);
    obj.label99:setLeft(0);
    obj.label99:setTop(35);
    obj.label99:setWidth(200);
    obj.label99:setHeight(20);
    obj.label99:setText("Vinny (Ambesek)");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout7);
    obj.label100:setLeft(0);
    obj.label100:setTop(60);
    obj.label100:setWidth(200);
    obj.label100:setHeight(20);
    obj.label100:setText("Consultor: ");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout7);
    obj.label101:setLeft(0);
    obj.label101:setTop(85);
    obj.label101:setWidth(200);
    obj.label101:setHeight(20);
    obj.label101:setText("maximosjr");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.scrollBox6);
    obj.label102:setLeft(555);
    obj.label102:setTop(300);
    obj.label102:setWidth(100);
    obj.label102:setHeight(20);
    obj.label102:setText("Versão Atual: ");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox6);
    obj.image4:setLeft(667);
    obj.image4:setTop(300);
    obj.image4:setWidth(100);
    obj.image4:setHeight(20);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%204D&T/versao01.png");
    obj.image4:setName("image4");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.scrollBox6);
    obj.label103:setLeft(555);
    obj.label103:setTop(325);
    obj.label103:setWidth(100);
    obj.label103:setHeight(20);
    obj.label103:setText("Sua Versão: ");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox6);
    obj.image5:setLeft(667);
    obj.image5:setTop(325);
    obj.image5:setWidth(100);
    obj.image5:setHeight(20);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao01.png");
    obj.image5:setName("image5");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox6);
    obj.button8:setLeft(555);
    obj.button8:setTop(350);
    obj.button8:setWidth(100);
    obj.button8:setText("Change Log");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox6);
    obj.button9:setLeft(667);
    obj.button9:setTop(350);
    obj.button9:setWidth(100);
    obj.button9:setText("Atualizar");
    obj.button9:setName("button9");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.scrollBox6);
    obj.label104:setLeft(555);
    obj.label104:setTop(400);
    obj.label104:setWidth(200);
    obj.label104:setHeight(20);
    obj.label104:setText("Conheça as Mesas:");
    obj.label104:setName("label104");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox6);
    obj.button10:setLeft(555);
    obj.button10:setTop(425);
    obj.button10:setWidth(100);
    obj.button10:setText("RPGmeister");
    obj.button10:setName("button10");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox6);
    obj.button11:setLeft(667);
    obj.button11:setTop(425);
    obj.button11:setWidth(125);
    obj.button11:setText("maximosjr");
    obj.button11:setName("button11");

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

    obj._e_event16 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclPericias:append();
        end, obj);

    obj._e_event17 = obj.button4:addEventListener("onClick",
        function (self)
            defaultSkills();
        end, obj);

    obj._e_event18 = obj.rclPericias:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event19 = obj.button5:addEventListener("onClick",
        function (self)
            self.rclArmas:append();
        end, obj);

    obj._e_event20 = obj.rclArmas:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event21 = obj.button6:addEventListener("onClick",
        function (self)
            self.rclMochila:append();
        end, obj);

    obj._e_event22 = obj.rclMochila:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event23 = obj.button7:addEventListener("onClick",
        function (self)
            self.rclEquipamentos:append();
        end, obj);

    obj._e_event24 = obj.rclEquipamentos:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event25 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%204D%26T/README.md')
        end, obj);

    obj._e_event26 = obj.button9:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%204D&T/Ficha%204D&T.rpk')
        end, obj);

    obj._e_event27 = obj.button10:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event28 = obj.button11:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=81157');
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.rclTalentos ~= nil then self.rclTalentos:destroy(); self.rclTalentos = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.frmInventory ~= nil then self.frmInventory:destroy(); self.frmInventory = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
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
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
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
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.rclEquipamentos ~= nil then self.rclEquipamentos:destroy(); self.rclEquipamentos = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rclMochila ~= nil then self.rclMochila:destroy(); self.rclMochila = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.rclArmas ~= nil then self.rclArmas:destroy(); self.rclArmas = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.frmGeneral ~= nil then self.frmGeneral:destroy(); self.frmGeneral = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.frmSkills ~= nil then self.frmSkills:destroy(); self.frmSkills = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.rclPericias ~= nil then self.rclPericias:destroy(); self.rclPericias = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmTemplate = {
    newEditor = newfrmTemplate, 
    new = newfrmTemplate, 
    name = "frmTemplate", 
    dataType = "Ambesek.4DeT", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha 4D&T", 
    description=""};

frmTemplate = _frmTemplate;
rrpg.registrarForm(_frmTemplate);
rrpg.registrarDataType(_frmTemplate);

return _frmTemplate;
