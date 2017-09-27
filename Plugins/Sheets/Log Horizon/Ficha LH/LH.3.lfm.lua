require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmLH3()
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
    obj:setName("frmLH3");
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
    obj.layout1:setWidth(400);
    obj.layout1:setHeight(110);
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
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setText("Mão");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(50);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(160);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome_mao_1");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(215);
    obj.label2:setTop(5);
    obj.label2:setWidth(100);
    obj.label2:setHeight(25);
    obj.label2:setText("Rank");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setLeft(255);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("rank_mao_1");
    obj.edit2:setName("edit2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(310);
    obj.label3:setTop(5);
    obj.label3:setWidth(100);
    obj.label3:setHeight(25);
    obj.label3:setText("Preço");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setLeft(345);
    obj.edit3:setTop(5);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("preco_mao_1");
    obj.edit3:setName("edit3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setLeft(5);
    obj.label4:setTop(30);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setText("TAG");
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setLeft(50);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(160);
    obj.edit4:setHeight(25);
    obj.edit4:setField("tag_mao_1");
    obj.edit4:setName("edit4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(215);
    obj.label5:setTop(30);
    obj.label5:setWidth(100);
    obj.label5:setHeight(25);
    obj.label5:setText("Ataque");
    obj.label5:setFontSize(12);
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5:setLeft(255);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("ataque_mao_1");
    obj.edit5:setName("edit5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setLeft(310);
    obj.label6:setTop(30);
    obj.label6:setWidth(100);
    obj.label6:setHeight(25);
    obj.label6:setText("Magia");
    obj.label6:setName("label6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6:setLeft(345);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("magia_mao_1");
    obj.edit6:setName("edit6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setLeft(5);
    obj.label7:setTop(55);
    obj.label7:setWidth(100);
    obj.label7:setHeight(25);
    obj.label7:setText("Efeito");
    obj.label7:setName("label7");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout1);
    obj.edit7:setLeft(50);
    obj.edit7:setTop(55);
    obj.edit7:setWidth(160);
    obj.edit7:setHeight(25);
    obj.edit7:setField("efeito_mao_1");
    obj.edit7:setName("edit7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setLeft(215);
    obj.label8:setTop(55);
    obj.label8:setWidth(100);
    obj.label8:setHeight(25);
    obj.label8:setText("PDEF");
    obj.label8:setName("label8");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout1);
    obj.edit8:setLeft(255);
    obj.edit8:setTop(55);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("pdef_mao_1");
    obj.edit8:setName("edit8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout1);
    obj.label9:setLeft(310);
    obj.label9:setTop(55);
    obj.label9:setWidth(100);
    obj.label9:setHeight(25);
    obj.label9:setText("MDEF");
    obj.label9:setName("label9");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout1);
    obj.edit9:setLeft(345);
    obj.edit9:setTop(55);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("mdef_mao_1");
    obj.edit9:setName("edit9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout1);
    obj.label10:setLeft(115);
    obj.label10:setTop(80);
    obj.label10:setWidth(100);
    obj.label10:setHeight(25);
    obj.label10:setText("Iniciativa");
    obj.label10:setFontSize(11);
    obj.label10:setName("label10");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout1);
    obj.edit10:setLeft(160);
    obj.edit10:setTop(80);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("iniciativa_mao_1");
    obj.edit10:setName("edit10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout1);
    obj.label11:setLeft(215);
    obj.label11:setTop(80);
    obj.label11:setWidth(100);
    obj.label11:setHeight(25);
    obj.label11:setText("Precisão");
    obj.label11:setFontSize(11);
    obj.label11:setName("label11");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout1);
    obj.edit11:setLeft(255);
    obj.edit11:setTop(80);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("precisao_mao_1");
    obj.edit11:setName("edit11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout1);
    obj.label12:setLeft(310);
    obj.label12:setTop(80);
    obj.label12:setWidth(100);
    obj.label12:setHeight(25);
    obj.label12:setText("Alcance");
    obj.label12:setFontSize(10);
    obj.label12:setName("label12");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout1);
    obj.edit12:setLeft(345);
    obj.edit12:setTop(80);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("alcance_mao_1");
    obj.edit12:setName("edit12");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(405);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(400);
    obj.layout2:setHeight(110);
    obj.layout2:setName("layout2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setLeft(5);
    obj.label13:setTop(5);
    obj.label13:setWidth(100);
    obj.label13:setHeight(25);
    obj.label13:setText("Mão");
    obj.label13:setName("label13");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout2);
    obj.edit13:setLeft(50);
    obj.edit13:setTop(5);
    obj.edit13:setWidth(160);
    obj.edit13:setHeight(25);
    obj.edit13:setField("nome_mao_2");
    obj.edit13:setName("edit13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setLeft(215);
    obj.label14:setTop(5);
    obj.label14:setWidth(100);
    obj.label14:setHeight(25);
    obj.label14:setText("Rank");
    obj.label14:setName("label14");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout2);
    obj.edit14:setLeft(255);
    obj.edit14:setTop(5);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("rank_mao_2");
    obj.edit14:setName("edit14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout2);
    obj.label15:setLeft(310);
    obj.label15:setTop(5);
    obj.label15:setWidth(100);
    obj.label15:setHeight(25);
    obj.label15:setText("Preço");
    obj.label15:setName("label15");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout2);
    obj.edit15:setLeft(345);
    obj.edit15:setTop(5);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("preco_mao_2");
    obj.edit15:setName("edit15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setLeft(5);
    obj.label16:setTop(30);
    obj.label16:setWidth(100);
    obj.label16:setHeight(25);
    obj.label16:setText("TAG");
    obj.label16:setName("label16");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout2);
    obj.edit16:setLeft(50);
    obj.edit16:setTop(30);
    obj.edit16:setWidth(160);
    obj.edit16:setHeight(25);
    obj.edit16:setField("tag_mao_2");
    obj.edit16:setName("edit16");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout2);
    obj.label17:setLeft(215);
    obj.label17:setTop(30);
    obj.label17:setWidth(100);
    obj.label17:setHeight(25);
    obj.label17:setText("Ataque");
    obj.label17:setFontSize(12);
    obj.label17:setName("label17");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout2);
    obj.edit17:setLeft(255);
    obj.edit17:setTop(30);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("ataque_mao_2");
    obj.edit17:setName("edit17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout2);
    obj.label18:setLeft(310);
    obj.label18:setTop(30);
    obj.label18:setWidth(100);
    obj.label18:setHeight(25);
    obj.label18:setText("Magia");
    obj.label18:setName("label18");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout2);
    obj.edit18:setLeft(345);
    obj.edit18:setTop(30);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setField("magia_mao_2");
    obj.edit18:setName("edit18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout2);
    obj.label19:setLeft(5);
    obj.label19:setTop(55);
    obj.label19:setWidth(100);
    obj.label19:setHeight(25);
    obj.label19:setText("Efeito");
    obj.label19:setName("label19");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout2);
    obj.edit19:setLeft(50);
    obj.edit19:setTop(55);
    obj.edit19:setWidth(160);
    obj.edit19:setHeight(25);
    obj.edit19:setField("efeito_mao_2");
    obj.edit19:setName("edit19");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout2);
    obj.label20:setLeft(215);
    obj.label20:setTop(55);
    obj.label20:setWidth(100);
    obj.label20:setHeight(25);
    obj.label20:setText("PDEF");
    obj.label20:setName("label20");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout2);
    obj.edit20:setLeft(255);
    obj.edit20:setTop(55);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(25);
    obj.edit20:setField("pdef_mao_2");
    obj.edit20:setName("edit20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout2);
    obj.label21:setLeft(310);
    obj.label21:setTop(55);
    obj.label21:setWidth(100);
    obj.label21:setHeight(25);
    obj.label21:setText("MDEF");
    obj.label21:setName("label21");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout2);
    obj.edit21:setLeft(345);
    obj.edit21:setTop(55);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(25);
    obj.edit21:setField("mdef_mao_2");
    obj.edit21:setName("edit21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout2);
    obj.label22:setLeft(115);
    obj.label22:setTop(80);
    obj.label22:setWidth(100);
    obj.label22:setHeight(25);
    obj.label22:setText("Iniciativa");
    obj.label22:setFontSize(11);
    obj.label22:setName("label22");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout2);
    obj.edit22:setLeft(160);
    obj.edit22:setTop(80);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setField("iniciativa_mao_2");
    obj.edit22:setName("edit22");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout2);
    obj.label23:setLeft(215);
    obj.label23:setTop(80);
    obj.label23:setWidth(100);
    obj.label23:setHeight(25);
    obj.label23:setText("Precisão");
    obj.label23:setFontSize(11);
    obj.label23:setName("label23");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout2);
    obj.edit23:setLeft(255);
    obj.edit23:setTop(80);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setField("precisao_mao_2");
    obj.edit23:setName("edit23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout2);
    obj.label24:setLeft(310);
    obj.label24:setTop(80);
    obj.label24:setWidth(100);
    obj.label24:setHeight(25);
    obj.label24:setText("Alcance");
    obj.label24:setFontSize(10);
    obj.label24:setName("label24");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout2);
    obj.edit24:setLeft(345);
    obj.edit24:setTop(80);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setField("alcance_mao_2");
    obj.edit24:setName("edit24");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(810);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(400);
    obj.layout3:setHeight(110);
    obj.layout3:setName("layout3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout3);
    obj.label25:setLeft(5);
    obj.label25:setTop(5);
    obj.label25:setWidth(100);
    obj.label25:setHeight(25);
    obj.label25:setText("Armadura");
    obj.label25:setFontSize(10);
    obj.label25:setName("label25");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout3);
    obj.edit25:setLeft(50);
    obj.edit25:setTop(5);
    obj.edit25:setWidth(160);
    obj.edit25:setHeight(25);
    obj.edit25:setField("nome_armadura");
    obj.edit25:setName("edit25");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout3);
    obj.label26:setLeft(215);
    obj.label26:setTop(5);
    obj.label26:setWidth(100);
    obj.label26:setHeight(25);
    obj.label26:setText("Rank");
    obj.label26:setName("label26");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout3);
    obj.edit26:setLeft(255);
    obj.edit26:setTop(5);
    obj.edit26:setWidth(50);
    obj.edit26:setHeight(25);
    obj.edit26:setField("rank_armadura");
    obj.edit26:setName("edit26");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout3);
    obj.label27:setLeft(310);
    obj.label27:setTop(5);
    obj.label27:setWidth(100);
    obj.label27:setHeight(25);
    obj.label27:setText("Preço");
    obj.label27:setName("label27");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout3);
    obj.edit27:setLeft(345);
    obj.edit27:setTop(5);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setField("preco_armadura");
    obj.edit27:setName("edit27");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout3);
    obj.label28:setLeft(5);
    obj.label28:setTop(30);
    obj.label28:setWidth(100);
    obj.label28:setHeight(25);
    obj.label28:setText("TAG");
    obj.label28:setName("label28");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout3);
    obj.edit28:setLeft(50);
    obj.edit28:setTop(30);
    obj.edit28:setWidth(160);
    obj.edit28:setHeight(25);
    obj.edit28:setField("tag_armadura");
    obj.edit28:setName("edit28");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout3);
    obj.label29:setLeft(215);
    obj.label29:setTop(30);
    obj.label29:setWidth(100);
    obj.label29:setHeight(25);
    obj.label29:setText("PDEF");
    obj.label29:setName("label29");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout3);
    obj.edit29:setLeft(255);
    obj.edit29:setTop(30);
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(25);
    obj.edit29:setField("pdef_armadura");
    obj.edit29:setName("edit29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout3);
    obj.label30:setLeft(310);
    obj.label30:setTop(30);
    obj.label30:setWidth(100);
    obj.label30:setHeight(25);
    obj.label30:setText("MDEF");
    obj.label30:setName("label30");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout3);
    obj.edit30:setLeft(345);
    obj.edit30:setTop(30);
    obj.edit30:setWidth(50);
    obj.edit30:setHeight(25);
    obj.edit30:setField("mdef_armadura");
    obj.edit30:setName("edit30");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout3);
    obj.label31:setLeft(5);
    obj.label31:setTop(55);
    obj.label31:setWidth(100);
    obj.label31:setHeight(25);
    obj.label31:setText("Efeito");
    obj.label31:setName("label31");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout3);
    obj.edit31:setLeft(50);
    obj.edit31:setTop(55);
    obj.edit31:setWidth(160);
    obj.edit31:setHeight(25);
    obj.edit31:setField("efeito_armadura");
    obj.edit31:setName("edit31");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout3);
    obj.label32:setLeft(215);
    obj.label32:setTop(55);
    obj.label32:setWidth(100);
    obj.label32:setHeight(25);
    obj.label32:setText("Iniciativa");
    obj.label32:setFontSize(10);
    obj.label32:setName("label32");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout3);
    obj.edit32:setLeft(255);
    obj.edit32:setTop(55);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(25);
    obj.edit32:setField("iniciativa_armadura");
    obj.edit32:setName("edit32");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(115);
    obj.layout4:setWidth(400);
    obj.layout4:setHeight(85);
    obj.layout4:setName("layout4");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout4);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout4);
    obj.label33:setLeft(5);
    obj.label33:setTop(5);
    obj.label33:setWidth(100);
    obj.label33:setHeight(25);
    obj.label33:setText("Acessório");
    obj.label33:setFontSize(10);
    obj.label33:setName("label33");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout4);
    obj.edit33:setLeft(50);
    obj.edit33:setTop(5);
    obj.edit33:setWidth(160);
    obj.edit33:setHeight(25);
    obj.edit33:setField("nome_acessorio_1");
    obj.edit33:setName("edit33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout4);
    obj.label34:setLeft(215);
    obj.label34:setTop(5);
    obj.label34:setWidth(100);
    obj.label34:setHeight(25);
    obj.label34:setText("Rank");
    obj.label34:setName("label34");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout4);
    obj.edit34:setLeft(255);
    obj.edit34:setTop(5);
    obj.edit34:setWidth(50);
    obj.edit34:setHeight(25);
    obj.edit34:setField("rank_acessorio_1");
    obj.edit34:setName("edit34");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout4);
    obj.label35:setLeft(310);
    obj.label35:setTop(5);
    obj.label35:setWidth(100);
    obj.label35:setHeight(25);
    obj.label35:setText("Preço");
    obj.label35:setName("label35");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout4);
    obj.edit35:setLeft(345);
    obj.edit35:setTop(5);
    obj.edit35:setWidth(50);
    obj.edit35:setHeight(25);
    obj.edit35:setField("preco_acessorio_1");
    obj.edit35:setName("edit35");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout4);
    obj.label36:setLeft(5);
    obj.label36:setTop(30);
    obj.label36:setWidth(100);
    obj.label36:setHeight(25);
    obj.label36:setText("TAG");
    obj.label36:setName("label36");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout4);
    obj.edit36:setLeft(50);
    obj.edit36:setTop(30);
    obj.edit36:setWidth(160);
    obj.edit36:setHeight(25);
    obj.edit36:setField("tag_acessorio_1");
    obj.edit36:setName("edit36");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout4);
    obj.label37:setLeft(215);
    obj.label37:setTop(30);
    obj.label37:setWidth(100);
    obj.label37:setHeight(25);
    obj.label37:setText("PDEF");
    obj.label37:setName("label37");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout4);
    obj.edit37:setLeft(255);
    obj.edit37:setTop(30);
    obj.edit37:setWidth(50);
    obj.edit37:setHeight(25);
    obj.edit37:setField("pdef_acessorio_1");
    obj.edit37:setName("edit37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout4);
    obj.label38:setLeft(310);
    obj.label38:setTop(30);
    obj.label38:setWidth(100);
    obj.label38:setHeight(25);
    obj.label38:setText("MDEF");
    obj.label38:setName("label38");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout4);
    obj.edit38:setLeft(345);
    obj.edit38:setTop(30);
    obj.edit38:setWidth(50);
    obj.edit38:setHeight(25);
    obj.edit38:setField("mdef_acessorio_1");
    obj.edit38:setName("edit38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout4);
    obj.label39:setLeft(5);
    obj.label39:setTop(55);
    obj.label39:setWidth(100);
    obj.label39:setHeight(25);
    obj.label39:setText("Efeito");
    obj.label39:setName("label39");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout4);
    obj.edit39:setLeft(50);
    obj.edit39:setTop(55);
    obj.edit39:setWidth(160);
    obj.edit39:setHeight(25);
    obj.edit39:setField("efeito_acessorio_1");
    obj.edit39:setName("edit39");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout4);
    obj.label40:setLeft(215);
    obj.label40:setTop(55);
    obj.label40:setWidth(100);
    obj.label40:setHeight(25);
    obj.label40:setText("Iniciativa");
    obj.label40:setFontSize(10);
    obj.label40:setName("label40");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout4);
    obj.edit40:setLeft(255);
    obj.edit40:setTop(55);
    obj.edit40:setWidth(50);
    obj.edit40:setHeight(25);
    obj.edit40:setField("iniciativa_acessorio_1");
    obj.edit40:setName("edit40");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout4);
    obj.label41:setLeft(310);
    obj.label41:setTop(55);
    obj.label41:setWidth(100);
    obj.label41:setHeight(25);
    obj.label41:setText("Magia");
    obj.label41:setName("label41");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout4);
    obj.edit41:setLeft(345);
    obj.edit41:setTop(55);
    obj.edit41:setWidth(50);
    obj.edit41:setHeight(25);
    obj.edit41:setField("magia_acessorio_1");
    obj.edit41:setName("edit41");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox1);
    obj.layout5:setLeft(405);
    obj.layout5:setTop(115);
    obj.layout5:setWidth(400);
    obj.layout5:setHeight(85);
    obj.layout5:setName("layout5");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout5);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setXradius(5);
    obj.rectangle5:setYradius(5);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setName("rectangle5");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout5);
    obj.label42:setLeft(5);
    obj.label42:setTop(5);
    obj.label42:setWidth(100);
    obj.label42:setHeight(25);
    obj.label42:setText("Acessório");
    obj.label42:setFontSize(10);
    obj.label42:setName("label42");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout5);
    obj.edit42:setLeft(50);
    obj.edit42:setTop(5);
    obj.edit42:setWidth(160);
    obj.edit42:setHeight(25);
    obj.edit42:setField("nome_acessorio_2");
    obj.edit42:setName("edit42");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout5);
    obj.label43:setLeft(215);
    obj.label43:setTop(5);
    obj.label43:setWidth(100);
    obj.label43:setHeight(25);
    obj.label43:setText("Rank");
    obj.label43:setName("label43");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout5);
    obj.edit43:setLeft(255);
    obj.edit43:setTop(5);
    obj.edit43:setWidth(50);
    obj.edit43:setHeight(25);
    obj.edit43:setField("rank_acessorio_2");
    obj.edit43:setName("edit43");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout5);
    obj.label44:setLeft(310);
    obj.label44:setTop(5);
    obj.label44:setWidth(100);
    obj.label44:setHeight(25);
    obj.label44:setText("Preço");
    obj.label44:setName("label44");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout5);
    obj.edit44:setLeft(345);
    obj.edit44:setTop(5);
    obj.edit44:setWidth(50);
    obj.edit44:setHeight(25);
    obj.edit44:setField("preco_acessorio_2");
    obj.edit44:setName("edit44");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout5);
    obj.label45:setLeft(5);
    obj.label45:setTop(30);
    obj.label45:setWidth(100);
    obj.label45:setHeight(25);
    obj.label45:setText("TAG");
    obj.label45:setName("label45");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout5);
    obj.edit45:setLeft(50);
    obj.edit45:setTop(30);
    obj.edit45:setWidth(160);
    obj.edit45:setHeight(25);
    obj.edit45:setField("tag_acessorio_2");
    obj.edit45:setName("edit45");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout5);
    obj.label46:setLeft(215);
    obj.label46:setTop(30);
    obj.label46:setWidth(100);
    obj.label46:setHeight(25);
    obj.label46:setText("PDEF");
    obj.label46:setName("label46");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout5);
    obj.edit46:setLeft(255);
    obj.edit46:setTop(30);
    obj.edit46:setWidth(50);
    obj.edit46:setHeight(25);
    obj.edit46:setField("pdef_acessorio_2");
    obj.edit46:setName("edit46");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout5);
    obj.label47:setLeft(310);
    obj.label47:setTop(30);
    obj.label47:setWidth(100);
    obj.label47:setHeight(25);
    obj.label47:setText("MDEF");
    obj.label47:setName("label47");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout5);
    obj.edit47:setLeft(345);
    obj.edit47:setTop(30);
    obj.edit47:setWidth(50);
    obj.edit47:setHeight(25);
    obj.edit47:setField("mdef_acessorio_2");
    obj.edit47:setName("edit47");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout5);
    obj.label48:setLeft(5);
    obj.label48:setTop(55);
    obj.label48:setWidth(100);
    obj.label48:setHeight(25);
    obj.label48:setText("Efeito");
    obj.label48:setName("label48");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout5);
    obj.edit48:setLeft(50);
    obj.edit48:setTop(55);
    obj.edit48:setWidth(160);
    obj.edit48:setHeight(25);
    obj.edit48:setField("efeito_acessorio_2");
    obj.edit48:setName("edit48");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout5);
    obj.label49:setLeft(215);
    obj.label49:setTop(55);
    obj.label49:setWidth(100);
    obj.label49:setHeight(25);
    obj.label49:setText("Iniciativa");
    obj.label49:setFontSize(10);
    obj.label49:setName("label49");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout5);
    obj.edit49:setLeft(255);
    obj.edit49:setTop(55);
    obj.edit49:setWidth(50);
    obj.edit49:setHeight(25);
    obj.edit49:setField("iniciativa_acessorio_2");
    obj.edit49:setName("edit49");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout5);
    obj.label50:setLeft(310);
    obj.label50:setTop(55);
    obj.label50:setWidth(100);
    obj.label50:setHeight(25);
    obj.label50:setText("Magia");
    obj.label50:setName("label50");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout5);
    obj.edit50:setLeft(345);
    obj.edit50:setTop(55);
    obj.edit50:setWidth(50);
    obj.edit50:setHeight(25);
    obj.edit50:setField("magia_acessorio_2");
    obj.edit50:setName("edit50");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox1);
    obj.layout6:setLeft(810);
    obj.layout6:setTop(115);
    obj.layout6:setWidth(400);
    obj.layout6:setHeight(85);
    obj.layout6:setName("layout6");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout6);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(5);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout6);
    obj.label51:setLeft(5);
    obj.label51:setTop(5);
    obj.label51:setWidth(100);
    obj.label51:setHeight(25);
    obj.label51:setText("Acessório");
    obj.label51:setFontSize(10);
    obj.label51:setName("label51");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout6);
    obj.edit51:setLeft(50);
    obj.edit51:setTop(5);
    obj.edit51:setWidth(160);
    obj.edit51:setHeight(25);
    obj.edit51:setField("nome_acessorio_3");
    obj.edit51:setName("edit51");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout6);
    obj.label52:setLeft(215);
    obj.label52:setTop(5);
    obj.label52:setWidth(100);
    obj.label52:setHeight(25);
    obj.label52:setText("Rank");
    obj.label52:setName("label52");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout6);
    obj.edit52:setLeft(255);
    obj.edit52:setTop(5);
    obj.edit52:setWidth(50);
    obj.edit52:setHeight(25);
    obj.edit52:setField("rank_acessorio_3");
    obj.edit52:setName("edit52");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout6);
    obj.label53:setLeft(310);
    obj.label53:setTop(5);
    obj.label53:setWidth(100);
    obj.label53:setHeight(25);
    obj.label53:setText("Preço");
    obj.label53:setName("label53");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout6);
    obj.edit53:setLeft(345);
    obj.edit53:setTop(5);
    obj.edit53:setWidth(50);
    obj.edit53:setHeight(25);
    obj.edit53:setField("preco_acessorio_3");
    obj.edit53:setName("edit53");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout6);
    obj.label54:setLeft(5);
    obj.label54:setTop(30);
    obj.label54:setWidth(100);
    obj.label54:setHeight(25);
    obj.label54:setText("TAG");
    obj.label54:setName("label54");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout6);
    obj.edit54:setLeft(50);
    obj.edit54:setTop(30);
    obj.edit54:setWidth(160);
    obj.edit54:setHeight(25);
    obj.edit54:setField("tag_acessorio_3");
    obj.edit54:setName("edit54");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout6);
    obj.label55:setLeft(215);
    obj.label55:setTop(30);
    obj.label55:setWidth(100);
    obj.label55:setHeight(25);
    obj.label55:setText("PDEF");
    obj.label55:setName("label55");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout6);
    obj.edit55:setLeft(255);
    obj.edit55:setTop(30);
    obj.edit55:setWidth(50);
    obj.edit55:setHeight(25);
    obj.edit55:setField("pdef_acessorio_3");
    obj.edit55:setName("edit55");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout6);
    obj.label56:setLeft(310);
    obj.label56:setTop(30);
    obj.label56:setWidth(100);
    obj.label56:setHeight(25);
    obj.label56:setText("MDEF");
    obj.label56:setName("label56");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout6);
    obj.edit56:setLeft(345);
    obj.edit56:setTop(30);
    obj.edit56:setWidth(50);
    obj.edit56:setHeight(25);
    obj.edit56:setField("mdef_acessorio_3");
    obj.edit56:setName("edit56");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout6);
    obj.label57:setLeft(5);
    obj.label57:setTop(55);
    obj.label57:setWidth(100);
    obj.label57:setHeight(25);
    obj.label57:setText("Efeito");
    obj.label57:setName("label57");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout6);
    obj.edit57:setLeft(50);
    obj.edit57:setTop(55);
    obj.edit57:setWidth(160);
    obj.edit57:setHeight(25);
    obj.edit57:setField("efeito_acessorio_3");
    obj.edit57:setName("edit57");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout6);
    obj.label58:setLeft(215);
    obj.label58:setTop(55);
    obj.label58:setWidth(100);
    obj.label58:setHeight(25);
    obj.label58:setText("Iniciativa");
    obj.label58:setFontSize(10);
    obj.label58:setName("label58");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout6);
    obj.edit58:setLeft(255);
    obj.edit58:setTop(55);
    obj.edit58:setWidth(50);
    obj.edit58:setHeight(25);
    obj.edit58:setField("iniciativa_acessorio_3");
    obj.edit58:setName("edit58");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout6);
    obj.label59:setLeft(310);
    obj.label59:setTop(55);
    obj.label59:setWidth(100);
    obj.label59:setHeight(25);
    obj.label59:setText("Magia");
    obj.label59:setName("label59");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout6);
    obj.edit59:setLeft(345);
    obj.edit59:setTop(55);
    obj.edit59:setWidth(50);
    obj.edit59:setHeight(25);
    obj.edit59:setField("magia_acessorio_3");
    obj.edit59:setName("edit59");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox1);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(205);
    obj.layout7:setWidth(775);
    obj.layout7:setHeight(386);
    obj.layout7:setName("layout7");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout7);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setXradius(5);
    obj.rectangle7:setYradius(5);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setName("rectangle7");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout7);
    obj.button1:setText("+");
    obj.button1:setLeft(2);
    obj.button1:setTop(2);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setName("button1");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout7);
    obj.label60:setLeft(5);
    obj.label60:setTop(0);
    obj.label60:setWidth(765);
    obj.label60:setHeight(25);
    obj.label60:setText("BOLSA/EXTRAS");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.rclListaDosItens = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.layout7);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("listaItens");
    obj.rclListaDosItens:setTemplateForm("frmLH3_1");
    obj.rclListaDosItens:setLeft(0);
    obj.rclListaDosItens:setTop(30);
    obj.rclListaDosItens:setWidth(760);
    obj.rclListaDosItens:setHeight(351);
    obj.rclListaDosItens:setLayout("vertical");
    obj.rclListaDosItens:setMinQt(1);

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20LH%20releases/imagens/block.png");
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclListaDosItens:append();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
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

local _frmLH3 = {
    newEditor = newfrmLH3, 
    new = newfrmLH3, 
    name = "frmLH3", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLH3 = _frmLH3;
rrpg.registrarForm(_frmLH3);

return _frmLH3;
