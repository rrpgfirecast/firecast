require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmADnD4()
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
    obj:setName("frmADnD4");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(140);
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
    obj.label1:setTop(5);
    obj.label1:setWidth(140);
    obj.label1:setHeight(20);
    obj.label1:setText("MAGIAS POR DIA");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(25);
    obj.label2:setTop(25);
    obj.label2:setWidth(60);
    obj.label2:setHeight(20);
    obj.label2:setFontSize(13);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("1º");
    obj.label2:setName("label2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(75);
    obj.edit1:setTop(25);
    obj.edit1:setWidth(40);
    obj.edit1:setHeight(25);
    obj.edit1:setField("Circulo1");
    obj.edit1:setName("edit1");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(25);
    obj.label3:setTop(50);
    obj.label3:setWidth(60);
    obj.label3:setHeight(20);
    obj.label3:setFontSize(13);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("2º");
    obj.label3:setName("label3");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setLeft(75);
    obj.edit2:setTop(50);
    obj.edit2:setWidth(40);
    obj.edit2:setHeight(25);
    obj.edit2:setField("Circulo2");
    obj.edit2:setName("edit2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setLeft(25);
    obj.label4:setTop(75);
    obj.label4:setWidth(60);
    obj.label4:setHeight(20);
    obj.label4:setFontSize(13);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("3º");
    obj.label4:setName("label4");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setLeft(75);
    obj.edit3:setTop(75);
    obj.edit3:setWidth(40);
    obj.edit3:setHeight(25);
    obj.edit3:setField("Circulo3");
    obj.edit3:setName("edit3");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(25);
    obj.label5:setTop(100);
    obj.label5:setWidth(60);
    obj.label5:setHeight(20);
    obj.label5:setFontSize(13);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("4º");
    obj.label5:setName("label5");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setLeft(75);
    obj.edit4:setTop(100);
    obj.edit4:setWidth(40);
    obj.edit4:setHeight(25);
    obj.edit4:setField("Circulo4");
    obj.edit4:setName("edit4");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setLeft(25);
    obj.label6:setTop(125);
    obj.label6:setWidth(60);
    obj.label6:setHeight(20);
    obj.label6:setFontSize(13);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setText("5º");
    obj.label6:setName("label6");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5:setLeft(75);
    obj.edit5:setTop(125);
    obj.edit5:setWidth(40);
    obj.edit5:setHeight(25);
    obj.edit5:setField("Circulo5");
    obj.edit5:setName("edit5");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setLeft(25);
    obj.label7:setTop(150);
    obj.label7:setWidth(60);
    obj.label7:setHeight(20);
    obj.label7:setFontSize(13);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setText("6º");
    obj.label7:setName("label7");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6:setLeft(75);
    obj.edit6:setTop(150);
    obj.edit6:setWidth(40);
    obj.edit6:setHeight(25);
    obj.edit6:setField("Circulo6");
    obj.edit6:setName("edit6");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setLeft(25);
    obj.label8:setTop(175);
    obj.label8:setWidth(60);
    obj.label8:setHeight(20);
    obj.label8:setFontSize(13);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("7º");
    obj.label8:setName("label8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout1);
    obj.edit7:setLeft(75);
    obj.edit7:setTop(175);
    obj.edit7:setWidth(40);
    obj.edit7:setHeight(25);
    obj.edit7:setField("Circulo7");
    obj.edit7:setName("edit7");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout1);
    obj.label9:setLeft(25);
    obj.label9:setTop(200);
    obj.label9:setWidth(60);
    obj.label9:setHeight(20);
    obj.label9:setFontSize(13);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setText("8º");
    obj.label9:setName("label9");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout1);
    obj.edit8:setLeft(75);
    obj.edit8:setTop(200);
    obj.edit8:setWidth(40);
    obj.edit8:setHeight(25);
    obj.edit8:setField("Circulo8");
    obj.edit8:setName("edit8");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout1);
    obj.label10:setLeft(25);
    obj.label10:setTop(225);
    obj.label10:setWidth(60);
    obj.label10:setHeight(20);
    obj.label10:setFontSize(13);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("9º");
    obj.label10:setName("label10");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout1);
    obj.edit9:setLeft(75);
    obj.edit9:setTop(225);
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(25);
    obj.edit9:setField("Circulo9");
    obj.edit9:setName("edit9");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(150);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(150);
    obj.layout2:setHeight(255);
    obj.layout2:setName("layout2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setLeft(0);
    obj.label11:setTop(5);
    obj.label11:setWidth(140);
    obj.label11:setHeight(20);
    obj.label11:setText("GRIMÓRIO");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setLeft(5);
    obj.label12:setTop(30);
    obj.label12:setWidth(45);
    obj.label12:setHeight(20);
    obj.label12:setFontSize(13);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("Total");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setLeft(50);
    obj.label13:setTop(30);
    obj.label13:setWidth(45);
    obj.label13:setHeight(20);
    obj.label13:setFontSize(13);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setText("Usadas");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setLeft(95);
    obj.label14:setTop(30);
    obj.label14:setWidth(45);
    obj.label14:setHeight(20);
    obj.label14:setFontSize(13);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setText("Vazias");
    obj.label14:setName("label14");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setLeft(5);
    obj.edit10:setTop(50);
    obj.edit10:setWidth(45);
    obj.edit10:setHeight(25);
    obj.edit10:setField("Grimorio_total_1");
    obj.edit10:setName("edit10");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout2);
    obj.edit11:setLeft(50);
    obj.edit11:setTop(50);
    obj.edit11:setWidth(45);
    obj.edit11:setHeight(25);
    obj.edit11:setField("Grimorio_usadas_1");
    obj.edit11:setName("edit11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout2);
    obj.edit12:setLeft(95);
    obj.edit12:setTop(50);
    obj.edit12:setWidth(45);
    obj.edit12:setHeight(25);
    obj.edit12:setField("Grimorio_vazias_1");
    obj.edit12:setName("edit12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout2);
    obj.edit13:setLeft(5);
    obj.edit13:setTop(75);
    obj.edit13:setWidth(45);
    obj.edit13:setHeight(25);
    obj.edit13:setField("Grimorio_total_2");
    obj.edit13:setName("edit13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout2);
    obj.edit14:setLeft(50);
    obj.edit14:setTop(75);
    obj.edit14:setWidth(45);
    obj.edit14:setHeight(25);
    obj.edit14:setField("Grimorio_usadas_2");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout2);
    obj.edit15:setLeft(95);
    obj.edit15:setTop(75);
    obj.edit15:setWidth(45);
    obj.edit15:setHeight(25);
    obj.edit15:setField("Grimorio_vazias_2");
    obj.edit15:setName("edit15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout2);
    obj.edit16:setLeft(5);
    obj.edit16:setTop(100);
    obj.edit16:setWidth(45);
    obj.edit16:setHeight(25);
    obj.edit16:setField("Grimorio_total_3");
    obj.edit16:setName("edit16");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout2);
    obj.edit17:setLeft(50);
    obj.edit17:setTop(100);
    obj.edit17:setWidth(45);
    obj.edit17:setHeight(25);
    obj.edit17:setField("Grimorio_usadas_3");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout2);
    obj.edit18:setLeft(95);
    obj.edit18:setTop(100);
    obj.edit18:setWidth(45);
    obj.edit18:setHeight(25);
    obj.edit18:setField("Grimorio_vazias_3");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout2);
    obj.edit19:setLeft(5);
    obj.edit19:setTop(125);
    obj.edit19:setWidth(45);
    obj.edit19:setHeight(25);
    obj.edit19:setField("Grimorio_total_4");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout2);
    obj.edit20:setLeft(50);
    obj.edit20:setTop(125);
    obj.edit20:setWidth(45);
    obj.edit20:setHeight(25);
    obj.edit20:setField("Grimorio_usadas_4");
    obj.edit20:setName("edit20");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout2);
    obj.edit21:setLeft(95);
    obj.edit21:setTop(125);
    obj.edit21:setWidth(45);
    obj.edit21:setHeight(25);
    obj.edit21:setField("Grimorio_vazias_4");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout2);
    obj.edit22:setLeft(5);
    obj.edit22:setTop(150);
    obj.edit22:setWidth(45);
    obj.edit22:setHeight(25);
    obj.edit22:setField("Grimorio_total_5");
    obj.edit22:setName("edit22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout2);
    obj.edit23:setLeft(50);
    obj.edit23:setTop(150);
    obj.edit23:setWidth(45);
    obj.edit23:setHeight(25);
    obj.edit23:setField("Grimorio_usadas_5");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout2);
    obj.edit24:setLeft(95);
    obj.edit24:setTop(150);
    obj.edit24:setWidth(45);
    obj.edit24:setHeight(25);
    obj.edit24:setField("Grimorio_vazias_5");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout2);
    obj.edit25:setLeft(5);
    obj.edit25:setTop(175);
    obj.edit25:setWidth(45);
    obj.edit25:setHeight(25);
    obj.edit25:setField("Grimorio_total_6");
    obj.edit25:setName("edit25");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout2);
    obj.edit26:setLeft(50);
    obj.edit26:setTop(175);
    obj.edit26:setWidth(45);
    obj.edit26:setHeight(25);
    obj.edit26:setField("Grimorio_usadas_6");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout2);
    obj.edit27:setLeft(95);
    obj.edit27:setTop(175);
    obj.edit27:setWidth(45);
    obj.edit27:setHeight(25);
    obj.edit27:setField("Grimorio_vazias_6");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout2);
    obj.edit28:setLeft(5);
    obj.edit28:setTop(200);
    obj.edit28:setWidth(45);
    obj.edit28:setHeight(25);
    obj.edit28:setField("Grimorio_total_7");
    obj.edit28:setName("edit28");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout2);
    obj.edit29:setLeft(50);
    obj.edit29:setTop(200);
    obj.edit29:setWidth(45);
    obj.edit29:setHeight(25);
    obj.edit29:setField("Grimorio_usadas_7");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout2);
    obj.edit30:setLeft(95);
    obj.edit30:setTop(200);
    obj.edit30:setWidth(45);
    obj.edit30:setHeight(25);
    obj.edit30:setField("Grimorio_vazias_7");
    obj.edit30:setName("edit30");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout2);
    obj.edit31:setLeft(5);
    obj.edit31:setTop(225);
    obj.edit31:setWidth(45);
    obj.edit31:setHeight(25);
    obj.edit31:setField("Grimorio_total_8");
    obj.edit31:setName("edit31");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout2);
    obj.edit32:setLeft(50);
    obj.edit32:setTop(225);
    obj.edit32:setWidth(45);
    obj.edit32:setHeight(25);
    obj.edit32:setField("Grimorio_usadas_8");
    obj.edit32:setName("edit32");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout2);
    obj.edit33:setLeft(95);
    obj.edit33:setTop(225);
    obj.edit33:setWidth(45);
    obj.edit33:setHeight(25);
    obj.edit33:setField("Grimorio_vazias_8");
    obj.edit33:setName("edit33");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(260);
    obj.layout3:setWidth(300);
    obj.layout3:setHeight(340);
    obj.layout3:setName("layout3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout3);
    obj.label15:setLeft(0);
    obj.label15:setTop(5);
    obj.label15:setWidth(300);
    obj.label15:setHeight(20);
    obj.label15:setText("ITENS DE MAGIA");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(30);
    obj.layout4:setWidth(300);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout4);
    obj.label16:setLeft(5);
    obj.label16:setTop(0);
    obj.label16:setWidth(190);
    obj.label16:setHeight(25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setText("Item");
    obj.label16:setName("label16");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout4);
    obj.label17:setLeft(195);
    obj.label17:setTop(0);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setText("Custo");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout4);
    obj.label18:setLeft(245);
    obj.label18:setTop(0);
    obj.label18:setWidth(50);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setText("Quantidade");
    obj.label18:setFontSize(9);
    obj.label18:setName("label18");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(55);
    obj.layout5:setWidth(300);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout5);
    obj.edit34:setLeft(5);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(190);
    obj.edit34:setHeight(25);
    obj.edit34:setField("ItemMagico_1_1");
    obj.edit34:setName("edit34");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout5);
    obj.edit35:setLeft(195);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(50);
    obj.edit35:setHeight(25);
    obj.edit35:setField("ItemMagico_Custo_1_1");
    obj.edit35:setName("edit35");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout5);
    obj.edit36:setLeft(245);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(50);
    obj.edit36:setHeight(25);
    obj.edit36:setField("ItemMagico_Quantia_1_1");
    obj.edit36:setName("edit36");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout3);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(80);
    obj.layout6:setWidth(300);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout6);
    obj.edit37:setLeft(5);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(190);
    obj.edit37:setHeight(25);
    obj.edit37:setField("ItemMagico_1_2");
    obj.edit37:setName("edit37");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout6);
    obj.edit38:setLeft(195);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(50);
    obj.edit38:setHeight(25);
    obj.edit38:setField("ItemMagico_Custo_1_2");
    obj.edit38:setName("edit38");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout6);
    obj.edit39:setLeft(245);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(25);
    obj.edit39:setField("ItemMagico_Quantia_1_2");
    obj.edit39:setName("edit39");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout3);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(105);
    obj.layout7:setWidth(300);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout7);
    obj.edit40:setLeft(5);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(190);
    obj.edit40:setHeight(25);
    obj.edit40:setField("ItemMagico_1_3");
    obj.edit40:setName("edit40");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout7);
    obj.edit41:setLeft(195);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(50);
    obj.edit41:setHeight(25);
    obj.edit41:setField("ItemMagico_Custo_1_3");
    obj.edit41:setName("edit41");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout7);
    obj.edit42:setLeft(245);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(50);
    obj.edit42:setHeight(25);
    obj.edit42:setField("ItemMagico_Quantia_1_3");
    obj.edit42:setName("edit42");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout3);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(130);
    obj.layout8:setWidth(300);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout8);
    obj.edit43:setLeft(5);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(190);
    obj.edit43:setHeight(25);
    obj.edit43:setField("ItemMagico_1_4");
    obj.edit43:setName("edit43");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout8);
    obj.edit44:setLeft(195);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(50);
    obj.edit44:setHeight(25);
    obj.edit44:setField("ItemMagico_Custo_1_4");
    obj.edit44:setName("edit44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout8);
    obj.edit45:setLeft(245);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(50);
    obj.edit45:setHeight(25);
    obj.edit45:setField("ItemMagico_Quantia_1_4");
    obj.edit45:setName("edit45");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout3);
    obj.layout9:setLeft(0);
    obj.layout9:setTop(155);
    obj.layout9:setWidth(300);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout9);
    obj.edit46:setLeft(5);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(190);
    obj.edit46:setHeight(25);
    obj.edit46:setField("ItemMagico_1_5");
    obj.edit46:setName("edit46");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout9);
    obj.edit47:setLeft(195);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(50);
    obj.edit47:setHeight(25);
    obj.edit47:setField("ItemMagico_Custo_1_5");
    obj.edit47:setName("edit47");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout9);
    obj.edit48:setLeft(245);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(50);
    obj.edit48:setHeight(25);
    obj.edit48:setField("ItemMagico_Quantia_1_5");
    obj.edit48:setName("edit48");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout3);
    obj.layout10:setLeft(0);
    obj.layout10:setTop(180);
    obj.layout10:setWidth(300);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout10);
    obj.edit49:setLeft(5);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(190);
    obj.edit49:setHeight(25);
    obj.edit49:setField("ItemMagico_1_6");
    obj.edit49:setName("edit49");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout10);
    obj.edit50:setLeft(195);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(50);
    obj.edit50:setHeight(25);
    obj.edit50:setField("ItemMagico_Custo_1_6");
    obj.edit50:setName("edit50");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout10);
    obj.edit51:setLeft(245);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(50);
    obj.edit51:setHeight(25);
    obj.edit51:setField("ItemMagico_Quantia_1_6");
    obj.edit51:setName("edit51");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout3);
    obj.layout11:setLeft(0);
    obj.layout11:setTop(205);
    obj.layout11:setWidth(300);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout11);
    obj.edit52:setLeft(5);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(190);
    obj.edit52:setHeight(25);
    obj.edit52:setField("ItemMagico_1_7");
    obj.edit52:setName("edit52");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout11);
    obj.edit53:setLeft(195);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(50);
    obj.edit53:setHeight(25);
    obj.edit53:setField("ItemMagico_Custo_1_7");
    obj.edit53:setName("edit53");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout11);
    obj.edit54:setLeft(245);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(50);
    obj.edit54:setHeight(25);
    obj.edit54:setField("ItemMagico_Quantia_1_7");
    obj.edit54:setName("edit54");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout3);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(230);
    obj.layout12:setWidth(300);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout12);
    obj.edit55:setLeft(5);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(190);
    obj.edit55:setHeight(25);
    obj.edit55:setField("ItemMagico_1_8");
    obj.edit55:setName("edit55");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout12);
    obj.edit56:setLeft(195);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(50);
    obj.edit56:setHeight(25);
    obj.edit56:setField("ItemMagico_Custo_1_8");
    obj.edit56:setName("edit56");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout12);
    obj.edit57:setLeft(245);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(50);
    obj.edit57:setHeight(25);
    obj.edit57:setField("ItemMagico_Quantia_1_8");
    obj.edit57:setName("edit57");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout3);
    obj.layout13:setLeft(0);
    obj.layout13:setTop(255);
    obj.layout13:setWidth(300);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout13);
    obj.edit58:setLeft(5);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(190);
    obj.edit58:setHeight(25);
    obj.edit58:setField("ItemMagico_1_9");
    obj.edit58:setName("edit58");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout13);
    obj.edit59:setLeft(195);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(50);
    obj.edit59:setHeight(25);
    obj.edit59:setField("ItemMagico_Custo_1_9");
    obj.edit59:setName("edit59");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout13);
    obj.edit60:setLeft(245);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(50);
    obj.edit60:setHeight(25);
    obj.edit60:setField("ItemMagico_Quantia_1_9");
    obj.edit60:setName("edit60");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout3);
    obj.layout14:setLeft(0);
    obj.layout14:setTop(280);
    obj.layout14:setWidth(300);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout14);
    obj.edit61:setLeft(5);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(190);
    obj.edit61:setHeight(25);
    obj.edit61:setField("ItemMagico_1_10");
    obj.edit61:setName("edit61");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout14);
    obj.edit62:setLeft(195);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(50);
    obj.edit62:setHeight(25);
    obj.edit62:setField("ItemMagico_Custo_1_10");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout14);
    obj.edit63:setLeft(245);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(50);
    obj.edit63:setHeight(25);
    obj.edit63:setField("ItemMagico_Quantia_1_10");
    obj.edit63:setName("edit63");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout3);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(305);
    obj.layout15:setWidth(300);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout15);
    obj.edit64:setLeft(5);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(190);
    obj.edit64:setHeight(25);
    obj.edit64:setField("ItemMagico_1_11");
    obj.edit64:setName("edit64");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout15);
    obj.edit65:setLeft(195);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(50);
    obj.edit65:setHeight(25);
    obj.edit65:setField("ItemMagico_Custo_1_11");
    obj.edit65:setName("edit65");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout15);
    obj.edit66:setLeft(245);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(50);
    obj.edit66:setHeight(25);
    obj.edit66:setField("ItemMagico_Quantia_1_11");
    obj.edit66:setName("edit66");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox1);
    obj.layout16:setLeft(310);
    obj.layout16:setTop(0);
    obj.layout16:setWidth(300);
    obj.layout16:setHeight(200);
    obj.layout16:setName("layout16");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout16);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout16);
    obj.label19:setLeft(0);
    obj.label19:setTop(5);
    obj.label19:setWidth(300);
    obj.label19:setHeight(20);
    obj.label19:setText("1º CIRCULO");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout16);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setWidth(290);
    obj.textEditor1:setHeight(165);
    obj.textEditor1:setField("magia1");
    obj.textEditor1:setName("textEditor1");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox1);
    obj.layout17:setLeft(620);
    obj.layout17:setTop(0);
    obj.layout17:setWidth(300);
    obj.layout17:setHeight(200);
    obj.layout17:setName("layout17");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout17);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setXradius(5);
    obj.rectangle5:setYradius(5);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setName("rectangle5");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout17);
    obj.label20:setLeft(0);
    obj.label20:setTop(5);
    obj.label20:setWidth(300);
    obj.label20:setHeight(20);
    obj.label20:setText("2º CIRCULO");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout17);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(30);
    obj.textEditor2:setWidth(290);
    obj.textEditor2:setHeight(165);
    obj.textEditor2:setField("magia2");
    obj.textEditor2:setName("textEditor2");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox1);
    obj.layout18:setLeft(930);
    obj.layout18:setTop(0);
    obj.layout18:setWidth(300);
    obj.layout18:setHeight(200);
    obj.layout18:setName("layout18");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout18);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(5);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout18);
    obj.label21:setLeft(0);
    obj.label21:setTop(5);
    obj.label21:setWidth(300);
    obj.label21:setHeight(20);
    obj.label21:setText("3º CIRCULO");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout18);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(30);
    obj.textEditor3:setWidth(290);
    obj.textEditor3:setHeight(165);
    obj.textEditor3:setField("magia3");
    obj.textEditor3:setName("textEditor3");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox1);
    obj.layout19:setLeft(310);
    obj.layout19:setTop(205);
    obj.layout19:setWidth(300);
    obj.layout19:setHeight(200);
    obj.layout19:setName("layout19");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout19);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setXradius(5);
    obj.rectangle7:setYradius(5);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setName("rectangle7");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout19);
    obj.label22:setLeft(0);
    obj.label22:setTop(5);
    obj.label22:setWidth(300);
    obj.label22:setHeight(20);
    obj.label22:setText("4º CIRCULO");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout19);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(30);
    obj.textEditor4:setWidth(290);
    obj.textEditor4:setHeight(165);
    obj.textEditor4:setField("magia4");
    obj.textEditor4:setName("textEditor4");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(620);
    obj.layout20:setTop(205);
    obj.layout20:setWidth(300);
    obj.layout20:setHeight(200);
    obj.layout20:setName("layout20");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout20);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setXradius(5);
    obj.rectangle8:setYradius(5);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setName("rectangle8");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout20);
    obj.label23:setLeft(0);
    obj.label23:setTop(5);
    obj.label23:setWidth(300);
    obj.label23:setHeight(20);
    obj.label23:setText("5º CIRCULO");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout20);
    obj.textEditor5:setLeft(5);
    obj.textEditor5:setTop(30);
    obj.textEditor5:setWidth(290);
    obj.textEditor5:setHeight(165);
    obj.textEditor5:setField("magia5");
    obj.textEditor5:setName("textEditor5");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox1);
    obj.layout21:setLeft(930);
    obj.layout21:setTop(205);
    obj.layout21:setWidth(300);
    obj.layout21:setHeight(200);
    obj.layout21:setName("layout21");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout21);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setXradius(5);
    obj.rectangle9:setYradius(5);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setName("rectangle9");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout21);
    obj.label24:setLeft(0);
    obj.label24:setTop(5);
    obj.label24:setWidth(300);
    obj.label24:setHeight(20);
    obj.label24:setText("6º CIRCULO");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout21);
    obj.textEditor6:setLeft(5);
    obj.textEditor6:setTop(30);
    obj.textEditor6:setWidth(290);
    obj.textEditor6:setHeight(165);
    obj.textEditor6:setField("magia6");
    obj.textEditor6:setName("textEditor6");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox1);
    obj.layout22:setLeft(310);
    obj.layout22:setTop(410);
    obj.layout22:setWidth(300);
    obj.layout22:setHeight(200);
    obj.layout22:setName("layout22");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout22);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setXradius(5);
    obj.rectangle10:setYradius(5);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setName("rectangle10");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout22);
    obj.label25:setLeft(0);
    obj.label25:setTop(5);
    obj.label25:setWidth(300);
    obj.label25:setHeight(20);
    obj.label25:setText("7º CIRCULO");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout22);
    obj.textEditor7:setLeft(5);
    obj.textEditor7:setTop(30);
    obj.textEditor7:setWidth(290);
    obj.textEditor7:setHeight(165);
    obj.textEditor7:setField("magia7");
    obj.textEditor7:setName("textEditor7");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox1);
    obj.layout23:setLeft(620);
    obj.layout23:setTop(410);
    obj.layout23:setWidth(300);
    obj.layout23:setHeight(200);
    obj.layout23:setName("layout23");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout23);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setXradius(5);
    obj.rectangle11:setYradius(5);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setName("rectangle11");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout23);
    obj.label26:setLeft(0);
    obj.label26:setTop(5);
    obj.label26:setWidth(300);
    obj.label26:setHeight(20);
    obj.label26:setText("8º CIRCULO");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout23);
    obj.textEditor8:setLeft(5);
    obj.textEditor8:setTop(30);
    obj.textEditor8:setWidth(290);
    obj.textEditor8:setHeight(165);
    obj.textEditor8:setField("magia8");
    obj.textEditor8:setName("textEditor8");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox1);
    obj.layout24:setLeft(930);
    obj.layout24:setTop(410);
    obj.layout24:setWidth(300);
    obj.layout24:setHeight(200);
    obj.layout24:setName("layout24");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout24);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(5);
    obj.rectangle12:setYradius(5);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout24);
    obj.label27:setLeft(0);
    obj.label27:setTop(5);
    obj.label27:setWidth(300);
    obj.label27:setHeight(20);
    obj.label27:setText("9º CIRCULO");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout24);
    obj.textEditor9:setLeft(5);
    obj.textEditor9:setTop(30);
    obj.textEditor9:setWidth(290);
    obj.textEditor9:setHeight(165);
    obj.textEditor9:setField("magia9");
    obj.textEditor9:setName("textEditor9");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20ADnD%20releases/imagens/block.png");
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj._e_event0 = obj.edit35:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event1 = obj.edit38:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event2 = obj.edit41:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event3 = obj.edit44:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event4 = obj.edit47:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event5 = obj.edit50:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event6 = obj.edit53:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event7 = obj.edit56:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event8 = obj.edit59:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event9 = obj.edit62:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event10 = obj.edit65:addEventListener("onChange",
        function (self)
            sumCusto();
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

        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmADnD4 = {
    newEditor = newfrmADnD4, 
    new = newfrmADnD4, 
    name = "frmADnD4", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmADnD4 = _frmADnD4;
rrpg.registrarForm(_frmADnD4);

return _frmADnD4;
