require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmADnD1()
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
    obj:setName("frmADnD1");
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
    obj.layout1:setWidth(935);
    obj.layout1:setHeight(70);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(310);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(20);
    obj.label1:setText("Nome");
    obj.label1:setHorzTextAlign("trailing");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(110);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(270);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(310);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(5);
    obj.label2:setTop(5);
    obj.label2:setWidth(100);
    obj.label2:setHeight(20);
    obj.label2:setText("Raça");
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(110);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(200);
    obj.edit2:setHeight(25);
    obj.edit2:setField("raca");
    obj.edit2:setName("edit2");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(560);
    obj.layout4:setTop(5);
    obj.layout4:setWidth(310);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setLeft(5);
    obj.label3:setTop(5);
    obj.label3:setWidth(100);
    obj.label3:setHeight(20);
    obj.label3:setText("Divindade");
    obj.label3:setHorzTextAlign("trailing");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(110);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(200);
    obj.edit3:setHeight(25);
    obj.edit3:setField("divindade");
    obj.edit3:setName("edit3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(35);
    obj.layout5:setWidth(310);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setLeft(5);
    obj.label4:setTop(5);
    obj.label4:setWidth(100);
    obj.label4:setHeight(20);
    obj.label4:setText("Nível");
    obj.label4:setHorzTextAlign("trailing");
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setLeft(110);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(40);
    obj.edit4:setHeight(25);
    obj.edit4:setField("nivel");
    obj.edit4:setName("edit4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout5);
    obj.label5:setLeft(155);
    obj.label5:setTop(5);
    obj.label5:setWidth(20);
    obj.label5:setHeight(20);
    obj.label5:setText("XP");
    obj.label5:setHorzTextAlign("trailing");
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setLeft(180);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(65);
    obj.edit5:setHeight(25);
    obj.edit5:setField("xp1");
    obj.edit5:setName("edit5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout5);
    obj.edit6:setLeft(245);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(65);
    obj.edit6:setHeight(25);
    obj.edit6:setField("xp2");
    obj.edit6:setName("edit6");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(270);
    obj.layout6:setTop(35);
    obj.layout6:setWidth(310);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout6);
    obj.label6:setLeft(5);
    obj.label6:setTop(5);
    obj.label6:setWidth(100);
    obj.label6:setHeight(20);
    obj.label6:setText("Classe");
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setName("label6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout6);
    obj.edit7:setLeft(110);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(200);
    obj.edit7:setHeight(25);
    obj.edit7:setField("classe");
    obj.edit7:setName("edit7");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(560);
    obj.layout7:setTop(35);
    obj.layout7:setWidth(310);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout7);
    obj.label7:setLeft(5);
    obj.label7:setTop(5);
    obj.label7:setWidth(100);
    obj.label7:setHeight(20);
    obj.label7:setText("Tendência");
    obj.label7:setHorzTextAlign("trailing");
    obj.label7:setName("label7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout7);
    obj.edit8:setLeft(110);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(200);
    obj.edit8:setHeight(25);
    obj.edit8:setField("tendencia");
    obj.edit8:setName("edit8");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(80);
    obj.layout8:setWidth(450);
    obj.layout8:setHeight(360);
    obj.layout8:setName("layout8");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout8);
    obj.label8:setLeft(0);
    obj.label8:setTop(5);
    obj.label8:setWidth(450);
    obj.label8:setHeight(20);
    obj.label8:setText("ATRIBUTOS");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(0);
    obj.layout9:setTop(30);
    obj.layout9:setWidth(450);
    obj.layout9:setHeight(50);
    obj.layout9:setName("layout9");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout9);
    obj.label9:setLeft(5);
    obj.label9:setTop(5);
    obj.label9:setWidth(100);
    obj.label9:setHeight(45);
    obj.label9:setText("FORÇA");
    obj.label9:setName("label9");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setLeft(100);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(50);
    obj.edit9:setField("forca");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(20);
    obj.edit9:setName("edit9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout9);
    obj.label10:setLeft(155);
    obj.label10:setTop(5);
    obj.label10:setWidth(40);
    obj.label10:setHeight(20);
    obj.label10:setText("Acerto");
    obj.label10:setName("label10");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout9);
    obj.edit10:setLeft(155);
    obj.edit10:setTop(25);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(25);
    obj.edit10:setField("for_acerto");
    obj.edit10:setName("edit10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout9);
    obj.label11:setLeft(203);
    obj.label11:setTop(5);
    obj.label11:setWidth(40);
    obj.label11:setHeight(20);
    obj.label11:setText("Dano");
    obj.label11:setName("label11");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout9);
    obj.edit11:setLeft(200);
    obj.edit11:setTop(25);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(25);
    obj.edit11:setField("for_dano");
    obj.edit11:setName("edit11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout9);
    obj.label12:setLeft(247);
    obj.label12:setTop(5);
    obj.label12:setWidth(40);
    obj.label12:setHeight(20);
    obj.label12:setText("Carga");
    obj.label12:setName("label12");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout9);
    obj.edit12:setLeft(245);
    obj.edit12:setTop(25);
    obj.edit12:setWidth(40);
    obj.edit12:setHeight(25);
    obj.edit12:setField("for_carga");
    obj.edit12:setName("edit12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout9);
    obj.label13:setLeft(290);
    obj.label13:setTop(5);
    obj.label13:setWidth(45);
    obj.label13:setHeight(20);
    obj.label13:setText("Sustentação");
    obj.label13:setFontSize(8);
    obj.label13:setName("label13");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout9);
    obj.edit13:setLeft(290);
    obj.edit13:setTop(25);
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(25);
    obj.edit13:setField("for_sustentacao");
    obj.edit13:setName("edit13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout9);
    obj.label14:setLeft(338);
    obj.label14:setTop(5);
    obj.label14:setWidth(40);
    obj.label14:setHeight(20);
    obj.label14:setText("Abrir");
    obj.label14:setName("label14");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout9);
    obj.edit14:setLeft(335);
    obj.edit14:setTop(25);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(25);
    obj.edit14:setField("for_abrir");
    obj.edit14:setName("edit14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout9);
    obj.label15:setLeft(380);
    obj.label15:setTop(5);
    obj.label15:setWidth(40);
    obj.label15:setHeight(20);
    obj.label15:setText("Barras");
    obj.label15:setName("label15");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout9);
    obj.edit15:setLeft(380);
    obj.edit15:setTop(25);
    obj.edit15:setWidth(40);
    obj.edit15:setHeight(25);
    obj.edit15:setField("for_barras");
    obj.edit15:setName("edit15");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setLeft(0);
    obj.layout10:setTop(85);
    obj.layout10:setWidth(450);
    obj.layout10:setHeight(50);
    obj.layout10:setName("layout10");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout10);
    obj.label16:setLeft(5);
    obj.label16:setTop(5);
    obj.label16:setWidth(100);
    obj.label16:setHeight(45);
    obj.label16:setText("DESTREZA");
    obj.label16:setName("label16");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout10);
    obj.edit16:setLeft(100);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(50);
    obj.edit16:setField("destreza");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(20);
    obj.edit16:setName("edit16");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout10);
    obj.label17:setLeft(155);
    obj.label17:setTop(5);
    obj.label17:setWidth(40);
    obj.label17:setHeight(20);
    obj.label17:setText("Reação");
    obj.label17:setFontSize(12);
    obj.label17:setName("label17");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout10);
    obj.edit17:setLeft(155);
    obj.edit17:setTop(25);
    obj.edit17:setWidth(40);
    obj.edit17:setHeight(25);
    obj.edit17:setField("des_reacao");
    obj.edit17:setName("edit17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout10);
    obj.label18:setLeft(203);
    obj.label18:setTop(5);
    obj.label18:setWidth(40);
    obj.label18:setHeight(20);
    obj.label18:setText("Ataque");
    obj.label18:setFontSize(12);
    obj.label18:setName("label18");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout10);
    obj.edit18:setLeft(200);
    obj.edit18:setTop(25);
    obj.edit18:setWidth(40);
    obj.edit18:setHeight(25);
    obj.edit18:setField("des_ataque");
    obj.edit18:setName("edit18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout10);
    obj.label19:setLeft(247);
    obj.label19:setTop(5);
    obj.label19:setWidth(40);
    obj.label19:setHeight(20);
    obj.label19:setText("Defesa");
    obj.label19:setName("label19");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout10);
    obj.edit19:setLeft(245);
    obj.edit19:setTop(25);
    obj.edit19:setWidth(40);
    obj.edit19:setHeight(25);
    obj.edit19:setField("des_defesa");
    obj.edit19:setName("edit19");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setLeft(0);
    obj.layout11:setTop(140);
    obj.layout11:setWidth(450);
    obj.layout11:setHeight(50);
    obj.layout11:setName("layout11");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout11);
    obj.label20:setLeft(5);
    obj.label20:setTop(5);
    obj.label20:setWidth(100);
    obj.label20:setHeight(45);
    obj.label20:setText("CONSTITUIÇÃO");
    obj.label20:setName("label20");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout11);
    obj.edit20:setLeft(100);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(50);
    obj.edit20:setField("constituicao");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontSize(20);
    obj.edit20:setName("edit20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout11);
    obj.label21:setLeft(160);
    obj.label21:setTop(5);
    obj.label21:setWidth(40);
    obj.label21:setHeight(20);
    obj.label21:setText("PVs");
    obj.label21:setName("label21");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout11);
    obj.edit21:setLeft(155);
    obj.edit21:setTop(25);
    obj.edit21:setWidth(40);
    obj.edit21:setHeight(25);
    obj.edit21:setField("con_pvs");
    obj.edit21:setName("edit21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout11);
    obj.label22:setLeft(200);
    obj.label22:setTop(5);
    obj.label22:setWidth(40);
    obj.label22:setHeight(20);
    obj.label22:setText("Colapso");
    obj.label22:setFontSize(11);
    obj.label22:setName("label22");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout11);
    obj.edit22:setLeft(200);
    obj.edit22:setTop(25);
    obj.edit22:setWidth(40);
    obj.edit22:setHeight(25);
    obj.edit22:setField("con_colapse");
    obj.edit22:setName("edit22");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout11);
    obj.label23:setLeft(243);
    obj.label23:setTop(5);
    obj.label23:setWidth(47);
    obj.label23:setHeight(20);
    obj.label23:setText("Ressurreição");
    obj.label23:setFontSize(8);
    obj.label23:setName("label23");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout11);
    obj.edit23:setLeft(245);
    obj.edit23:setTop(25);
    obj.edit23:setWidth(40);
    obj.edit23:setHeight(25);
    obj.edit23:setField("con_ressurreicao");
    obj.edit23:setName("edit23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout11);
    obj.label24:setLeft(290);
    obj.label24:setTop(5);
    obj.label24:setWidth(45);
    obj.label24:setHeight(20);
    obj.label24:setText("Veneno");
    obj.label24:setFontSize(12);
    obj.label24:setName("label24");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout11);
    obj.edit24:setLeft(290);
    obj.edit24:setTop(25);
    obj.edit24:setWidth(40);
    obj.edit24:setHeight(25);
    obj.edit24:setField("con_veneno");
    obj.edit24:setName("edit24");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout11);
    obj.label25:setLeft(335);
    obj.label25:setTop(5);
    obj.label25:setWidth(50);
    obj.label25:setHeight(20);
    obj.label25:setText("Regeneração");
    obj.label25:setFontSize(8);
    obj.label25:setName("label25");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout11);
    obj.edit25:setLeft(335);
    obj.edit25:setTop(25);
    obj.edit25:setWidth(40);
    obj.edit25:setHeight(25);
    obj.edit25:setField("con_regeneracao");
    obj.edit25:setName("edit25");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(195);
    obj.layout12:setWidth(450);
    obj.layout12:setHeight(50);
    obj.layout12:setName("layout12");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout12);
    obj.label26:setLeft(5);
    obj.label26:setTop(5);
    obj.label26:setWidth(100);
    obj.label26:setHeight(45);
    obj.label26:setText("INTELIGÊNCIA");
    obj.label26:setName("label26");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout12);
    obj.edit26:setLeft(100);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(50);
    obj.edit26:setHeight(50);
    obj.edit26:setField("inteligencia");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(20);
    obj.edit26:setName("edit26");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout12);
    obj.label27:setLeft(155);
    obj.label27:setTop(5);
    obj.label27:setWidth(40);
    obj.label27:setHeight(20);
    obj.label27:setText("Idiomas");
    obj.label27:setFontSize(11);
    obj.label27:setName("label27");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout12);
    obj.edit27:setLeft(155);
    obj.edit27:setTop(25);
    obj.edit27:setWidth(40);
    obj.edit27:setHeight(25);
    obj.edit27:setField("int_idiomas");
    obj.edit27:setName("edit27");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout12);
    obj.label28:setLeft(200);
    obj.label28:setTop(5);
    obj.label28:setWidth(40);
    obj.label28:setHeight(20);
    obj.label28:setText("Magia");
    obj.label28:setFontSize(13);
    obj.label28:setName("label28");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout12);
    obj.edit28:setLeft(200);
    obj.edit28:setTop(25);
    obj.edit28:setWidth(40);
    obj.edit28:setHeight(25);
    obj.edit28:setField("int_magia");
    obj.edit28:setName("edit28");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout12);
    obj.label29:setLeft(245);
    obj.label29:setTop(5);
    obj.label29:setWidth(47);
    obj.label29:setHeight(20);
    obj.label29:setText("Aprender");
    obj.label29:setFontSize(10);
    obj.label29:setName("label29");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout12);
    obj.edit29:setLeft(245);
    obj.edit29:setTop(25);
    obj.edit29:setWidth(40);
    obj.edit29:setHeight(25);
    obj.edit29:setField("int_aprender");
    obj.edit29:setName("edit29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout12);
    obj.label30:setLeft(290);
    obj.label30:setTop(5);
    obj.label30:setWidth(45);
    obj.label30:setHeight(20);
    obj.label30:setText("Maximo");
    obj.label30:setFontSize(11);
    obj.label30:setName("label30");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout12);
    obj.edit30:setLeft(290);
    obj.edit30:setTop(25);
    obj.edit30:setWidth(40);
    obj.edit30:setHeight(25);
    obj.edit30:setField("int_magia");
    obj.edit30:setName("edit30");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout12);
    obj.label31:setLeft(335);
    obj.label31:setTop(5);
    obj.label31:setWidth(95);
    obj.label31:setHeight(20);
    obj.label31:setText("Imunidade à Magia");
    obj.label31:setFontSize(11);
    obj.label31:setName("label31");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout12);
    obj.edit31:setLeft(335);
    obj.edit31:setTop(25);
    obj.edit31:setWidth(95);
    obj.edit31:setHeight(25);
    obj.edit31:setField("int_imunidade");
    obj.edit31:setName("edit31");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setLeft(0);
    obj.layout13:setTop(250);
    obj.layout13:setWidth(450);
    obj.layout13:setHeight(50);
    obj.layout13:setName("layout13");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout13);
    obj.label32:setLeft(5);
    obj.label32:setTop(5);
    obj.label32:setWidth(100);
    obj.label32:setHeight(45);
    obj.label32:setText("SABEDORIA");
    obj.label32:setName("label32");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout13);
    obj.edit32:setLeft(100);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(50);
    obj.edit32:setField("sabedoria");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontSize(20);
    obj.edit32:setName("edit32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout13);
    obj.label33:setLeft(155);
    obj.label33:setTop(5);
    obj.label33:setWidth(40);
    obj.label33:setHeight(20);
    obj.label33:setText("Defesa");
    obj.label33:setFontSize(11);
    obj.label33:setName("label33");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout13);
    obj.edit33:setLeft(155);
    obj.edit33:setTop(25);
    obj.edit33:setWidth(40);
    obj.edit33:setHeight(25);
    obj.edit33:setField("sab_defesa");
    obj.edit33:setName("edit33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout13);
    obj.label34:setLeft(200);
    obj.label34:setTop(5);
    obj.label34:setWidth(85);
    obj.label34:setHeight(20);
    obj.label34:setText("Magias Extras");
    obj.label34:setFontSize(13);
    obj.label34:setName("label34");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout13);
    obj.edit34:setLeft(200);
    obj.edit34:setTop(25);
    obj.edit34:setWidth(85);
    obj.edit34:setHeight(25);
    obj.edit34:setField("sab_extra");
    obj.edit34:setName("edit34");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout13);
    obj.label35:setLeft(290);
    obj.label35:setTop(5);
    obj.label35:setWidth(45);
    obj.label35:setHeight(20);
    obj.label35:setText("Falha");
    obj.label35:setFontSize(12);
    obj.label35:setName("label35");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout13);
    obj.edit35:setLeft(290);
    obj.edit35:setTop(25);
    obj.edit35:setWidth(40);
    obj.edit35:setHeight(25);
    obj.edit35:setField("sab_falha");
    obj.edit35:setName("edit35");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout13);
    obj.label36:setLeft(335);
    obj.label36:setTop(5);
    obj.label36:setWidth(95);
    obj.label36:setHeight(20);
    obj.label36:setText("Imunidade à Magia");
    obj.label36:setFontSize(11);
    obj.label36:setName("label36");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout13);
    obj.edit36:setLeft(335);
    obj.edit36:setTop(25);
    obj.edit36:setWidth(95);
    obj.edit36:setHeight(25);
    obj.edit36:setField("int_imunidade");
    obj.edit36:setName("edit36");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout8);
    obj.layout14:setLeft(0);
    obj.layout14:setTop(305);
    obj.layout14:setWidth(450);
    obj.layout14:setHeight(50);
    obj.layout14:setName("layout14");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout14);
    obj.label37:setLeft(5);
    obj.label37:setTop(5);
    obj.label37:setWidth(100);
    obj.label37:setHeight(45);
    obj.label37:setText("CARISMA");
    obj.label37:setName("label37");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout14);
    obj.edit37:setLeft(100);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(50);
    obj.edit37:setHeight(50);
    obj.edit37:setField("carisma");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontSize(20);
    obj.edit37:setName("edit37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout14);
    obj.label38:setLeft(155);
    obj.label38:setTop(5);
    obj.label38:setWidth(40);
    obj.label38:setHeight(20);
    obj.label38:setText("Aliados");
    obj.label38:setFontSize(12);
    obj.label38:setName("label38");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout14);
    obj.edit38:setLeft(155);
    obj.edit38:setTop(25);
    obj.edit38:setWidth(40);
    obj.edit38:setHeight(25);
    obj.edit38:setField("car_aliados");
    obj.edit38:setName("edit38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout14);
    obj.label39:setLeft(203);
    obj.label39:setTop(5);
    obj.label39:setWidth(40);
    obj.label39:setHeight(20);
    obj.label39:setText("Lealdade");
    obj.label39:setFontSize(10);
    obj.label39:setName("label39");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout14);
    obj.edit39:setLeft(200);
    obj.edit39:setTop(25);
    obj.edit39:setWidth(40);
    obj.edit39:setHeight(25);
    obj.edit39:setField("car_lealdade");
    obj.edit39:setName("edit39");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout14);
    obj.label40:setLeft(247);
    obj.label40:setTop(5);
    obj.label40:setWidth(40);
    obj.label40:setHeight(20);
    obj.label40:setText("Reação");
    obj.label40:setFontSize(12);
    obj.label40:setName("label40");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout14);
    obj.edit40:setLeft(245);
    obj.edit40:setTop(25);
    obj.edit40:setWidth(40);
    obj.edit40:setHeight(25);
    obj.edit40:setField("car_reação");
    obj.edit40:setName("edit40");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox1);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(450);
    obj.layout15:setWidth(600);
    obj.layout15:setHeight(160);
    obj.layout15:setName("layout15");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout15);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout15);
    obj.label41:setLeft(0);
    obj.label41:setTop(5);
    obj.label41:setWidth(600);
    obj.label41:setHeight(20);
    obj.label41:setText("RESISTÊNCIAS");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setLeft(0);
    obj.layout16:setTop(25);
    obj.layout16:setWidth(600);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout16);
    obj.label42:setLeft(100);
    obj.label42:setTop(5);
    obj.label42:setWidth(35);
    obj.label42:setHeight(20);
    obj.label42:setText("1");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout16);
    obj.label43:setLeft(135);
    obj.label43:setTop(5);
    obj.label43:setWidth(35);
    obj.label43:setHeight(20);
    obj.label43:setText("2");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout16);
    obj.label44:setLeft(170);
    obj.label44:setTop(5);
    obj.label44:setWidth(35);
    obj.label44:setHeight(20);
    obj.label44:setText("3");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout16);
    obj.label45:setLeft(205);
    obj.label45:setTop(5);
    obj.label45:setWidth(35);
    obj.label45:setHeight(20);
    obj.label45:setText("4");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout16);
    obj.label46:setLeft(240);
    obj.label46:setTop(5);
    obj.label46:setWidth(35);
    obj.label46:setHeight(20);
    obj.label46:setText("5");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout16);
    obj.label47:setLeft(275);
    obj.label47:setTop(5);
    obj.label47:setWidth(35);
    obj.label47:setHeight(20);
    obj.label47:setText("6");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout16);
    obj.label48:setLeft(310);
    obj.label48:setTop(5);
    obj.label48:setWidth(35);
    obj.label48:setHeight(20);
    obj.label48:setText("7");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout16);
    obj.label49:setLeft(345);
    obj.label49:setTop(5);
    obj.label49:setWidth(35);
    obj.label49:setHeight(20);
    obj.label49:setText("8");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout16);
    obj.label50:setLeft(380);
    obj.label50:setTop(5);
    obj.label50:setWidth(35);
    obj.label50:setHeight(20);
    obj.label50:setText("9");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout16);
    obj.label51:setLeft(415);
    obj.label51:setTop(5);
    obj.label51:setWidth(35);
    obj.label51:setHeight(20);
    obj.label51:setText("10");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout16);
    obj.label52:setLeft(455);
    obj.label52:setTop(5);
    obj.label52:setWidth(105);
    obj.label52:setHeight(20);
    obj.label52:setText("Paralisia/Veneno/Morte");
    obj.label52:setHorzTextAlign("trailing");
    obj.label52:setFontSize(10);
    obj.label52:setName("label52");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout16);
    obj.edit41:setLeft(560);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(35);
    obj.edit41:setHeight(25);
    obj.edit41:setField("TRveneno");
    obj.edit41:setName("edit41");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17:setLeft(0);
    obj.layout17:setTop(50);
    obj.layout17:setWidth(600);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout17);
    obj.label53:setLeft(2);
    obj.label53:setTop(5);
    obj.label53:setWidth(40);
    obj.label53:setHeight(20);
    obj.label53:setText("TACO");
    obj.label53:setHorzTextAlign("trailing");
    obj.label53:setName("label53");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout17);
    obj.edit42:setLeft(45);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(40);
    obj.edit42:setHeight(25);
    obj.edit42:setField("taco");
    obj.edit42:setName("edit42");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout17);
    obj.edit43:setLeft(100);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(35);
    obj.edit43:setHeight(25);
    obj.edit43:setField("taco1");
    obj.edit43:setName("edit43");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout17);
    obj.edit44:setLeft(135);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(35);
    obj.edit44:setHeight(25);
    obj.edit44:setField("taco2");
    obj.edit44:setName("edit44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout17);
    obj.edit45:setLeft(170);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(35);
    obj.edit45:setHeight(25);
    obj.edit45:setField("taco3");
    obj.edit45:setName("edit45");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout17);
    obj.edit46:setLeft(205);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(35);
    obj.edit46:setHeight(25);
    obj.edit46:setField("taco4");
    obj.edit46:setName("edit46");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout17);
    obj.edit47:setLeft(240);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(35);
    obj.edit47:setHeight(25);
    obj.edit47:setField("taco5");
    obj.edit47:setName("edit47");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout17);
    obj.edit48:setLeft(275);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(35);
    obj.edit48:setHeight(25);
    obj.edit48:setField("taco6");
    obj.edit48:setName("edit48");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout17);
    obj.edit49:setLeft(310);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(35);
    obj.edit49:setHeight(25);
    obj.edit49:setField("taco7");
    obj.edit49:setName("edit49");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout17);
    obj.edit50:setLeft(345);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(35);
    obj.edit50:setHeight(25);
    obj.edit50:setField("taco8");
    obj.edit50:setName("edit50");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout17);
    obj.edit51:setLeft(380);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(35);
    obj.edit51:setHeight(25);
    obj.edit51:setField("taco9");
    obj.edit51:setName("edit51");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout17);
    obj.edit52:setLeft(415);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(35);
    obj.edit52:setHeight(25);
    obj.edit52:setField("taco10");
    obj.edit52:setName("edit52");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout17);
    obj.label54:setLeft(455);
    obj.label54:setTop(5);
    obj.label54:setWidth(105);
    obj.label54:setHeight(20);
    obj.label54:setText("Bastão/Cajado/Varinha");
    obj.label54:setHorzTextAlign("trailing");
    obj.label54:setFontSize(10);
    obj.label54:setName("label54");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout17);
    obj.edit53:setLeft(560);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(35);
    obj.edit53:setHeight(25);
    obj.edit53:setField("TRgatilho");
    obj.edit53:setName("edit53");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout15);
    obj.layout18:setLeft(0);
    obj.layout18:setTop(75);
    obj.layout18:setWidth(600);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout18);
    obj.label55:setLeft(2);
    obj.label55:setTop(5);
    obj.label55:setWidth(40);
    obj.label55:setHeight(20);
    obj.label55:setText("Acerto");
    obj.label55:setHorzTextAlign("trailing");
    obj.label55:setName("label55");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout18);
    obj.edit54:setLeft(45);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(40);
    obj.edit54:setHeight(25);
    obj.edit54:setField("acerto");
    obj.edit54:setName("edit54");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout18);
    obj.label56:setLeft(100);
    obj.label56:setTop(5);
    obj.label56:setWidth(35);
    obj.label56:setHeight(20);
    obj.label56:setText("-1");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout18);
    obj.label57:setLeft(135);
    obj.label57:setTop(5);
    obj.label57:setWidth(35);
    obj.label57:setHeight(20);
    obj.label57:setText("-2");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout18);
    obj.label58:setLeft(170);
    obj.label58:setTop(5);
    obj.label58:setWidth(35);
    obj.label58:setHeight(20);
    obj.label58:setText("-3");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout18);
    obj.label59:setLeft(205);
    obj.label59:setTop(5);
    obj.label59:setWidth(35);
    obj.label59:setHeight(20);
    obj.label59:setText("-4");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout18);
    obj.label60:setLeft(240);
    obj.label60:setTop(5);
    obj.label60:setWidth(35);
    obj.label60:setHeight(20);
    obj.label60:setText("-5");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout18);
    obj.label61:setLeft(275);
    obj.label61:setTop(5);
    obj.label61:setWidth(35);
    obj.label61:setHeight(20);
    obj.label61:setText("-6");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout18);
    obj.label62:setLeft(310);
    obj.label62:setTop(5);
    obj.label62:setWidth(35);
    obj.label62:setHeight(20);
    obj.label62:setText("-7");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout18);
    obj.label63:setLeft(345);
    obj.label63:setTop(5);
    obj.label63:setWidth(35);
    obj.label63:setHeight(20);
    obj.label63:setText("-8");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout18);
    obj.label64:setLeft(380);
    obj.label64:setTop(5);
    obj.label64:setWidth(35);
    obj.label64:setHeight(20);
    obj.label64:setText("-9");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout18);
    obj.label65:setLeft(415);
    obj.label65:setTop(5);
    obj.label65:setWidth(35);
    obj.label65:setHeight(20);
    obj.label65:setText("-10");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout18);
    obj.label66:setLeft(455);
    obj.label66:setTop(5);
    obj.label66:setWidth(105);
    obj.label66:setHeight(20);
    obj.label66:setText("Petrificação/Transformação");
    obj.label66:setHorzTextAlign("trailing");
    obj.label66:setFontSize(8);
    obj.label66:setName("label66");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout18);
    obj.edit55:setLeft(560);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(35);
    obj.edit55:setHeight(25);
    obj.edit55:setField("TRtransmutacao");
    obj.edit55:setName("edit55");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout15);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(100);
    obj.layout19:setWidth(600);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout19);
    obj.label67:setLeft(2);
    obj.label67:setTop(5);
    obj.label67:setWidth(40);
    obj.label67:setHeight(20);
    obj.label67:setText("Distância");
    obj.label67:setHorzTextAlign("trailing");
    obj.label67:setFontSize(10);
    obj.label67:setName("label67");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout19);
    obj.edit56:setLeft(45);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(40);
    obj.edit56:setHeight(25);
    obj.edit56:setField("distancia");
    obj.edit56:setName("edit56");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout19);
    obj.edit57:setLeft(100);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(35);
    obj.edit57:setHeight(25);
    obj.edit57:setField("taco-1");
    obj.edit57:setName("edit57");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout19);
    obj.edit58:setLeft(135);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(35);
    obj.edit58:setHeight(25);
    obj.edit58:setField("taco-2");
    obj.edit58:setName("edit58");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout19);
    obj.edit59:setLeft(170);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(35);
    obj.edit59:setHeight(25);
    obj.edit59:setField("taco-3");
    obj.edit59:setName("edit59");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout19);
    obj.edit60:setLeft(205);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(35);
    obj.edit60:setHeight(25);
    obj.edit60:setField("taco-4");
    obj.edit60:setName("edit60");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout19);
    obj.edit61:setLeft(240);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(35);
    obj.edit61:setHeight(25);
    obj.edit61:setField("taco-5");
    obj.edit61:setName("edit61");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout19);
    obj.edit62:setLeft(275);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(35);
    obj.edit62:setHeight(25);
    obj.edit62:setField("taco-6");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout19);
    obj.edit63:setLeft(310);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(35);
    obj.edit63:setHeight(25);
    obj.edit63:setField("taco-7");
    obj.edit63:setName("edit63");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout19);
    obj.edit64:setLeft(345);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(35);
    obj.edit64:setHeight(25);
    obj.edit64:setField("taco-8");
    obj.edit64:setName("edit64");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout19);
    obj.edit65:setLeft(380);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(35);
    obj.edit65:setHeight(25);
    obj.edit65:setField("taco-9");
    obj.edit65:setName("edit65");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout19);
    obj.edit66:setLeft(415);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(35);
    obj.edit66:setHeight(25);
    obj.edit66:setField("taco-10");
    obj.edit66:setName("edit66");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout19);
    obj.label68:setLeft(455);
    obj.label68:setTop(5);
    obj.label68:setWidth(105);
    obj.label68:setHeight(20);
    obj.label68:setText("Sopro-de-Dragão");
    obj.label68:setHorzTextAlign("trailing");
    obj.label68:setFontSize(11);
    obj.label68:setName("label68");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout19);
    obj.edit67:setLeft(560);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(35);
    obj.edit67:setHeight(25);
    obj.edit67:setField("TRsopro");
    obj.edit67:setName("edit67");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout15);
    obj.layout20:setLeft(0);
    obj.layout20:setTop(125);
    obj.layout20:setWidth(600);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout20);
    obj.label69:setLeft(455);
    obj.label69:setTop(5);
    obj.label69:setWidth(105);
    obj.label69:setHeight(20);
    obj.label69:setText("Magia");
    obj.label69:setHorzTextAlign("trailing");
    obj.label69:setFontSize(13);
    obj.label69:setName("label69");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout20);
    obj.edit68:setLeft(560);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(35);
    obj.edit68:setHeight(25);
    obj.edit68:setField("TRmagia");
    obj.edit68:setName("edit68");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox1);
    obj.layout21:setLeft(460);
    obj.layout21:setTop(80);
    obj.layout21:setWidth(200);
    obj.layout21:setHeight(160);
    obj.layout21:setName("layout21");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout21);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout21);
    obj.label70:setLeft(0);
    obj.label70:setTop(5);
    obj.label70:setWidth(200);
    obj.label70:setHeight(20);
    obj.label70:setText("CATEGORIA DE ARMADURA (CA)");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout21);
    obj.label71:setLeft(5);
    obj.label71:setTop(30);
    obj.label71:setWidth(90);
    obj.label71:setHeight(20);
    obj.label71:setText("Destreza");
    obj.label71:setHorzTextAlign("trailing");
    obj.label71:setName("label71");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout21);
    obj.edit69:setLeft(100);
    obj.edit69:setTop(25);
    obj.edit69:setWidth(40);
    obj.edit69:setHeight(25);
    obj.edit69:setField("CAdes");
    obj.edit69:setName("edit69");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout21);
    obj.label72:setLeft(5);
    obj.label72:setTop(55);
    obj.label72:setWidth(90);
    obj.label72:setHeight(20);
    obj.label72:setText("Armadura");
    obj.label72:setHorzTextAlign("trailing");
    obj.label72:setName("label72");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout21);
    obj.edit70:setLeft(100);
    obj.edit70:setTop(50);
    obj.edit70:setWidth(40);
    obj.edit70:setHeight(25);
    obj.edit70:setField("CAarmadura");
    obj.edit70:setName("edit70");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout21);
    obj.label73:setLeft(5);
    obj.label73:setTop(80);
    obj.label73:setWidth(90);
    obj.label73:setHeight(20);
    obj.label73:setText("Escudo");
    obj.label73:setHorzTextAlign("trailing");
    obj.label73:setName("label73");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout21);
    obj.edit71:setLeft(100);
    obj.edit71:setTop(75);
    obj.edit71:setWidth(40);
    obj.edit71:setHeight(25);
    obj.edit71:setField("CAescudo");
    obj.edit71:setName("edit71");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout21);
    obj.label74:setLeft(5);
    obj.label74:setTop(105);
    obj.label74:setWidth(90);
    obj.label74:setHeight(20);
    obj.label74:setText("");
    obj.label74:setHorzTextAlign("trailing");
    obj.label74:setName("label74");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout21);
    obj.edit72:setLeft(100);
    obj.edit72:setTop(100);
    obj.edit72:setWidth(40);
    obj.edit72:setHeight(25);
    obj.edit72:setField("CAoutros");
    obj.edit72:setName("edit72");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout21);
    obj.label75:setLeft(5);
    obj.label75:setTop(130);
    obj.label75:setWidth(90);
    obj.label75:setHeight(20);
    obj.label75:setText("TOTAL");
    obj.label75:setHorzTextAlign("trailing");
    obj.label75:setName("label75");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout21);
    obj.rectangle5:setLeft(100);
    obj.rectangle5:setTop(125);
    obj.rectangle5:setWidth(40);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout21);
    obj.label76:setLeft(100);
    obj.label76:setTop(125);
    obj.label76:setWidth(40);
    obj.label76:setHeight(25);
    obj.label76:setField("CAtotal");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");


				local function sumCA();
					if sheet~=nil then
						local mod = (tonumber(sheet.CAdes) or 0) + 
									(tonumber(sheet.CAarmadura) or 0) + 
									(tonumber(sheet.CAescudo) or 0) + 
									(tonumber(sheet.CAoutros) or 0);
						sheet.CAtotal = mod;
					end;
				end;
			


    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox1);
    obj.layout22:setLeft(460);
    obj.layout22:setTop(250);
    obj.layout22:setWidth(200);
    obj.layout22:setHeight(60);
    obj.layout22:setName("layout22");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout22);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(5);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout22);
    obj.label77:setLeft(0);
    obj.label77:setTop(5);
    obj.label77:setWidth(200);
    obj.label77:setHeight(20);
    obj.label77:setText("PONTOS DE VIDA");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout22);
    obj.edit73:setLeft(5);
    obj.edit73:setTop(30);
    obj.edit73:setWidth(95);
    obj.edit73:setHeight(25);
    obj.edit73:setField("PVatual");
    obj.edit73:setName("edit73");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout22);
    obj.edit74:setLeft(100);
    obj.edit74:setTop(30);
    obj.edit74:setWidth(95);
    obj.edit74:setHeight(25);
    obj.edit74:setField("PVmax");
    obj.edit74:setName("edit74");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(460);
    obj.image1:setTop(320);
    obj.image1:setWidth(120);
    obj.image1:setHeight(120);
    obj.image1:setStyle("stretch");
    obj.image1:setSRC("/Ficha ADnD 2e/images/d20.png");
    obj.image1:setName("image1");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.scrollBox1);
    obj.rectangle7:setLeft(670);
    obj.rectangle7:setTop(80);
    obj.rectangle7:setWidth(230);
    obj.rectangle7:setHeight(230);
    obj.rectangle7:setColor("DimGray");
    obj.rectangle7:setXradius(5);
    obj.rectangle7:setYradius(5);
    obj.rectangle7:setCornerType("innerLine");
    obj.rectangle7:setName("rectangle7");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(670);
    obj.image2:setTop(80);
    obj.image2:setWidth(230);
    obj.image2:setHeight(230);
    obj.image2:setField("avatar");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox1);
    obj.layout23:setLeft(610);
    obj.layout23:setTop(320);
    obj.layout23:setWidth(600);
    obj.layout23:setHeight(290);
    obj.layout23:setName("layout23");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout23);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setXradius(5);
    obj.rectangle8:setYradius(5);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setName("rectangle8");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout23);
    obj.label78:setLeft(0);
    obj.label78:setTop(5);
    obj.label78:setWidth(600);
    obj.label78:setHeight(20);
    obj.label78:setText("ARMAS");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24:setLeft(0);
    obj.layout24:setTop(30);
    obj.layout24:setWidth(600);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout24);
    obj.label79:setLeft(5);
    obj.label79:setTop(0);
    obj.label79:setWidth(190);
    obj.label79:setHeight(25);
    obj.label79:setFontSize(13);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setText("Arma");
    obj.label79:setName("label79");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout24);
    obj.label80:setLeft(195);
    obj.label80:setTop(0);
    obj.label80:setWidth(50);
    obj.label80:setHeight(25);
    obj.label80:setFontSize(11);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setText("Ataques");
    obj.label80:setName("label80");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout24);
    obj.label81:setLeft(245);
    obj.label81:setTop(0);
    obj.label81:setWidth(50);
    obj.label81:setHeight(25);
    obj.label81:setFontSize(11);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setText("Alcance");
    obj.label81:setName("label81");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout24);
    obj.label82:setLeft(295);
    obj.label82:setTop(0);
    obj.label82:setWidth(50);
    obj.label82:setHeight(25);
    obj.label82:setFontSize(9);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setText("Dano (P/M)");
    obj.label82:setName("label82");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout24);
    obj.label83:setLeft(345);
    obj.label83:setTop(0);
    obj.label83:setWidth(50);
    obj.label83:setHeight(25);
    obj.label83:setFontSize(11);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setText("Dano (G)");
    obj.label83:setName("label83");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout24);
    obj.label84:setLeft(395);
    obj.label84:setTop(0);
    obj.label84:setWidth(50);
    obj.label84:setHeight(25);
    obj.label84:setFontSize(10);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setText("Ajuste");
    obj.label84:setName("label84");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout24);
    obj.label85:setLeft(445);
    obj.label85:setTop(0);
    obj.label85:setWidth(50);
    obj.label85:setHeight(25);
    obj.label85:setFontSize(13);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setText("Peso");
    obj.label85:setName("label85");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout24);
    obj.label86:setLeft(495);
    obj.label86:setTop(0);
    obj.label86:setWidth(50);
    obj.label86:setHeight(25);
    obj.label86:setFontSize(13);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setText("Tipo");
    obj.label86:setName("label86");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout24);
    obj.label87:setLeft(545);
    obj.label87:setTop(0);
    obj.label87:setWidth(50);
    obj.label87:setHeight(25);
    obj.label87:setFontSize(10);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setText("Velocidade");
    obj.label87:setName("label87");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout23);
    obj.layout25:setLeft(0);
    obj.layout25:setTop(55);
    obj.layout25:setWidth(600);
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout25);
    obj.edit75:setLeft(5);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(190);
    obj.edit75:setHeight(25);
    obj.edit75:setField("Arma_1");
    obj.edit75:setName("edit75");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout25);
    obj.edit76:setLeft(195);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(50);
    obj.edit76:setHeight(25);
    obj.edit76:setField("Arma_ataques_1");
    obj.edit76:setName("edit76");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout25);
    obj.edit77:setLeft(245);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(50);
    obj.edit77:setHeight(25);
    obj.edit77:setField("Arma_alcance_1");
    obj.edit77:setName("edit77");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout25);
    obj.edit78:setLeft(295);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(50);
    obj.edit78:setHeight(25);
    obj.edit78:setField("Arma_dano_pm_1");
    obj.edit78:setName("edit78");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout25);
    obj.edit79:setLeft(345);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(50);
    obj.edit79:setHeight(25);
    obj.edit79:setField("Arma_dano_g_1");
    obj.edit79:setName("edit79");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout25);
    obj.edit80:setLeft(395);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(50);
    obj.edit80:setHeight(25);
    obj.edit80:setField("Arma_ajuste_1");
    obj.edit80:setName("edit80");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout25);
    obj.edit81:setLeft(445);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(50);
    obj.edit81:setHeight(25);
    obj.edit81:setField("Arma_tipo_1");
    obj.edit81:setName("edit81");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout25);
    obj.edit82:setLeft(495);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(50);
    obj.edit82:setHeight(25);
    obj.edit82:setField("Arma_peso_1");
    obj.edit82:setName("edit82");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout25);
    obj.edit83:setLeft(545);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(50);
    obj.edit83:setHeight(25);
    obj.edit83:setField("Arma_velocidade_1");
    obj.edit83:setName("edit83");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout23);
    obj.layout26:setLeft(0);
    obj.layout26:setTop(80);
    obj.layout26:setWidth(600);
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout26);
    obj.edit84:setLeft(5);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(190);
    obj.edit84:setHeight(25);
    obj.edit84:setField("Arma_2");
    obj.edit84:setName("edit84");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout26);
    obj.edit85:setLeft(195);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(50);
    obj.edit85:setHeight(25);
    obj.edit85:setField("Arma_ataques_2");
    obj.edit85:setName("edit85");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout26);
    obj.edit86:setLeft(245);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(50);
    obj.edit86:setHeight(25);
    obj.edit86:setField("Arma_alcance_2");
    obj.edit86:setName("edit86");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout26);
    obj.edit87:setLeft(295);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(50);
    obj.edit87:setHeight(25);
    obj.edit87:setField("Arma_dano_pm_2");
    obj.edit87:setName("edit87");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout26);
    obj.edit88:setLeft(345);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(50);
    obj.edit88:setHeight(25);
    obj.edit88:setField("Arma_dano_g_2");
    obj.edit88:setName("edit88");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout26);
    obj.edit89:setLeft(395);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(50);
    obj.edit89:setHeight(25);
    obj.edit89:setField("Arma_ajuste_2");
    obj.edit89:setName("edit89");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout26);
    obj.edit90:setLeft(445);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(50);
    obj.edit90:setHeight(25);
    obj.edit90:setField("Arma_tipo_2");
    obj.edit90:setName("edit90");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout26);
    obj.edit91:setLeft(495);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(50);
    obj.edit91:setHeight(25);
    obj.edit91:setField("Arma_peso_2");
    obj.edit91:setName("edit91");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout26);
    obj.edit92:setLeft(545);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(50);
    obj.edit92:setHeight(25);
    obj.edit92:setField("Arma_velocidade_2");
    obj.edit92:setName("edit92");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout23);
    obj.layout27:setLeft(0);
    obj.layout27:setTop(105);
    obj.layout27:setWidth(600);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout27);
    obj.edit93:setLeft(5);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(190);
    obj.edit93:setHeight(25);
    obj.edit93:setField("Arma_3");
    obj.edit93:setName("edit93");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout27);
    obj.edit94:setLeft(195);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(50);
    obj.edit94:setHeight(25);
    obj.edit94:setField("Arma_ataques_3");
    obj.edit94:setName("edit94");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout27);
    obj.edit95:setLeft(245);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(50);
    obj.edit95:setHeight(25);
    obj.edit95:setField("Arma_alcance_3");
    obj.edit95:setName("edit95");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout27);
    obj.edit96:setLeft(295);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(50);
    obj.edit96:setHeight(25);
    obj.edit96:setField("Arma_dano_pm_3");
    obj.edit96:setName("edit96");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout27);
    obj.edit97:setLeft(345);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(50);
    obj.edit97:setHeight(25);
    obj.edit97:setField("Arma_dano_g_3");
    obj.edit97:setName("edit97");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout27);
    obj.edit98:setLeft(395);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(50);
    obj.edit98:setHeight(25);
    obj.edit98:setField("Arma_ajuste_3");
    obj.edit98:setName("edit98");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout27);
    obj.edit99:setLeft(445);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(50);
    obj.edit99:setHeight(25);
    obj.edit99:setField("Arma_tipo_3");
    obj.edit99:setName("edit99");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout27);
    obj.edit100:setLeft(495);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(50);
    obj.edit100:setHeight(25);
    obj.edit100:setField("Arma_peso_3");
    obj.edit100:setName("edit100");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout27);
    obj.edit101:setLeft(545);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(50);
    obj.edit101:setHeight(25);
    obj.edit101:setField("Arma_velocidade_3");
    obj.edit101:setName("edit101");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout23);
    obj.layout28:setLeft(0);
    obj.layout28:setTop(130);
    obj.layout28:setWidth(600);
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout28);
    obj.edit102:setLeft(5);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(190);
    obj.edit102:setHeight(25);
    obj.edit102:setField("Arma_4");
    obj.edit102:setName("edit102");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout28);
    obj.edit103:setLeft(195);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(50);
    obj.edit103:setHeight(25);
    obj.edit103:setField("Arma_ataques_4");
    obj.edit103:setName("edit103");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout28);
    obj.edit104:setLeft(245);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(50);
    obj.edit104:setHeight(25);
    obj.edit104:setField("Arma_alcance_4");
    obj.edit104:setName("edit104");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout28);
    obj.edit105:setLeft(295);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(50);
    obj.edit105:setHeight(25);
    obj.edit105:setField("Arma_dano_pm_4");
    obj.edit105:setName("edit105");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout28);
    obj.edit106:setLeft(345);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(50);
    obj.edit106:setHeight(25);
    obj.edit106:setField("Arma_dano_g_4");
    obj.edit106:setName("edit106");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout28);
    obj.edit107:setLeft(395);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(50);
    obj.edit107:setHeight(25);
    obj.edit107:setField("Arma_ajuste_4");
    obj.edit107:setName("edit107");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout28);
    obj.edit108:setLeft(445);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(50);
    obj.edit108:setHeight(25);
    obj.edit108:setField("Arma_tipo_4");
    obj.edit108:setName("edit108");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout28);
    obj.edit109:setLeft(495);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(50);
    obj.edit109:setHeight(25);
    obj.edit109:setField("Arma_peso_4");
    obj.edit109:setName("edit109");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout28);
    obj.edit110:setLeft(545);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(50);
    obj.edit110:setHeight(25);
    obj.edit110:setField("Arma_velocidade_4");
    obj.edit110:setName("edit110");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout23);
    obj.layout29:setLeft(0);
    obj.layout29:setTop(155);
    obj.layout29:setWidth(600);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout29);
    obj.edit111:setLeft(5);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(190);
    obj.edit111:setHeight(25);
    obj.edit111:setField("Arma_5");
    obj.edit111:setName("edit111");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout29);
    obj.edit112:setLeft(195);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(50);
    obj.edit112:setHeight(25);
    obj.edit112:setField("Arma_ataques_5");
    obj.edit112:setName("edit112");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout29);
    obj.edit113:setLeft(245);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(50);
    obj.edit113:setHeight(25);
    obj.edit113:setField("Arma_alcance_5");
    obj.edit113:setName("edit113");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout29);
    obj.edit114:setLeft(295);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(50);
    obj.edit114:setHeight(25);
    obj.edit114:setField("Arma_dano_pm_5");
    obj.edit114:setName("edit114");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout29);
    obj.edit115:setLeft(345);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(50);
    obj.edit115:setHeight(25);
    obj.edit115:setField("Arma_dano_g_5");
    obj.edit115:setName("edit115");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout29);
    obj.edit116:setLeft(395);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(50);
    obj.edit116:setHeight(25);
    obj.edit116:setField("Arma_ajuste_5");
    obj.edit116:setName("edit116");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout29);
    obj.edit117:setLeft(445);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(50);
    obj.edit117:setHeight(25);
    obj.edit117:setField("Arma_tipo_5");
    obj.edit117:setName("edit117");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout29);
    obj.edit118:setLeft(495);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(50);
    obj.edit118:setHeight(25);
    obj.edit118:setField("Arma_peso_5");
    obj.edit118:setName("edit118");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout29);
    obj.edit119:setLeft(545);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(50);
    obj.edit119:setHeight(25);
    obj.edit119:setField("Arma_velocidade_5");
    obj.edit119:setName("edit119");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout23);
    obj.layout30:setLeft(0);
    obj.layout30:setTop(180);
    obj.layout30:setWidth(600);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout30);
    obj.edit120:setLeft(5);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(190);
    obj.edit120:setHeight(25);
    obj.edit120:setField("Arma_6");
    obj.edit120:setName("edit120");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout30);
    obj.edit121:setLeft(195);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(50);
    obj.edit121:setHeight(25);
    obj.edit121:setField("Arma_ataques_6");
    obj.edit121:setName("edit121");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout30);
    obj.edit122:setLeft(245);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(50);
    obj.edit122:setHeight(25);
    obj.edit122:setField("Arma_alcance_6");
    obj.edit122:setName("edit122");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout30);
    obj.edit123:setLeft(295);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(50);
    obj.edit123:setHeight(25);
    obj.edit123:setField("Arma_dano_pm_6");
    obj.edit123:setName("edit123");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout30);
    obj.edit124:setLeft(345);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(50);
    obj.edit124:setHeight(25);
    obj.edit124:setField("Arma_dano_g_6");
    obj.edit124:setName("edit124");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout30);
    obj.edit125:setLeft(395);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(50);
    obj.edit125:setHeight(25);
    obj.edit125:setField("Arma_ajuste_6");
    obj.edit125:setName("edit125");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout30);
    obj.edit126:setLeft(445);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(50);
    obj.edit126:setHeight(25);
    obj.edit126:setField("Arma_tipo_6");
    obj.edit126:setName("edit126");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout30);
    obj.edit127:setLeft(495);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(50);
    obj.edit127:setHeight(25);
    obj.edit127:setField("Arma_peso_6");
    obj.edit127:setName("edit127");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout30);
    obj.edit128:setLeft(545);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(50);
    obj.edit128:setHeight(25);
    obj.edit128:setField("Arma_velocidade_6");
    obj.edit128:setName("edit128");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout23);
    obj.layout31:setLeft(0);
    obj.layout31:setTop(205);
    obj.layout31:setWidth(600);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout31);
    obj.edit129:setLeft(5);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(190);
    obj.edit129:setHeight(25);
    obj.edit129:setField("Arma_7");
    obj.edit129:setName("edit129");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout31);
    obj.edit130:setLeft(195);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(50);
    obj.edit130:setHeight(25);
    obj.edit130:setField("Arma_ataques_7");
    obj.edit130:setName("edit130");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout31);
    obj.edit131:setLeft(245);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(50);
    obj.edit131:setHeight(25);
    obj.edit131:setField("Arma_alcance_7");
    obj.edit131:setName("edit131");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout31);
    obj.edit132:setLeft(295);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(50);
    obj.edit132:setHeight(25);
    obj.edit132:setField("Arma_dano_pm_7");
    obj.edit132:setName("edit132");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout31);
    obj.edit133:setLeft(345);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(50);
    obj.edit133:setHeight(25);
    obj.edit133:setField("Arma_dano_g_7");
    obj.edit133:setName("edit133");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout31);
    obj.edit134:setLeft(395);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(50);
    obj.edit134:setHeight(25);
    obj.edit134:setField("Arma_ajuste_7");
    obj.edit134:setName("edit134");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout31);
    obj.edit135:setLeft(445);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(50);
    obj.edit135:setHeight(25);
    obj.edit135:setField("Arma_tipo_7");
    obj.edit135:setName("edit135");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout31);
    obj.edit136:setLeft(495);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(50);
    obj.edit136:setHeight(25);
    obj.edit136:setField("Arma_peso_7");
    obj.edit136:setName("edit136");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout31);
    obj.edit137:setLeft(545);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(50);
    obj.edit137:setHeight(25);
    obj.edit137:setField("Arma_velocidade_7");
    obj.edit137:setName("edit137");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout23);
    obj.layout32:setLeft(0);
    obj.layout32:setTop(230);
    obj.layout32:setWidth(600);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout32);
    obj.edit138:setLeft(5);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(190);
    obj.edit138:setHeight(25);
    obj.edit138:setField("Arma_8");
    obj.edit138:setName("edit138");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout32);
    obj.edit139:setLeft(195);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(50);
    obj.edit139:setHeight(25);
    obj.edit139:setField("Arma_ataques_8");
    obj.edit139:setName("edit139");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout32);
    obj.edit140:setLeft(245);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(50);
    obj.edit140:setHeight(25);
    obj.edit140:setField("Arma_alcance_8");
    obj.edit140:setName("edit140");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout32);
    obj.edit141:setLeft(295);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(50);
    obj.edit141:setHeight(25);
    obj.edit141:setField("Arma_dano_pm_8");
    obj.edit141:setName("edit141");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout32);
    obj.edit142:setLeft(345);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(50);
    obj.edit142:setHeight(25);
    obj.edit142:setField("Arma_dano_g_8");
    obj.edit142:setName("edit142");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout32);
    obj.edit143:setLeft(395);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(50);
    obj.edit143:setHeight(25);
    obj.edit143:setField("Arma_ajuste_8");
    obj.edit143:setName("edit143");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout32);
    obj.edit144:setLeft(445);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(50);
    obj.edit144:setHeight(25);
    obj.edit144:setField("Arma_tipo_8");
    obj.edit144:setName("edit144");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout32);
    obj.edit145:setLeft(495);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(50);
    obj.edit145:setHeight(25);
    obj.edit145:setField("Arma_peso_8");
    obj.edit145:setName("edit145");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout32);
    obj.edit146:setLeft(545);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(50);
    obj.edit146:setHeight(25);
    obj.edit146:setField("Arma_velocidade_8");
    obj.edit146:setName("edit146");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout23);
    obj.layout33:setLeft(0);
    obj.layout33:setTop(255);
    obj.layout33:setWidth(600);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout33);
    obj.edit147:setLeft(5);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(190);
    obj.edit147:setHeight(25);
    obj.edit147:setField("Arma_9");
    obj.edit147:setName("edit147");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout33);
    obj.edit148:setLeft(195);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(50);
    obj.edit148:setHeight(25);
    obj.edit148:setField("Arma_ataques_9");
    obj.edit148:setName("edit148");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout33);
    obj.edit149:setLeft(245);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(50);
    obj.edit149:setHeight(25);
    obj.edit149:setField("Arma_alcance_9");
    obj.edit149:setName("edit149");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout33);
    obj.edit150:setLeft(295);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(50);
    obj.edit150:setHeight(25);
    obj.edit150:setField("Arma_dano_pm_9");
    obj.edit150:setName("edit150");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout33);
    obj.edit151:setLeft(345);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(50);
    obj.edit151:setHeight(25);
    obj.edit151:setField("Arma_dano_g_9");
    obj.edit151:setName("edit151");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout33);
    obj.edit152:setLeft(395);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(50);
    obj.edit152:setHeight(25);
    obj.edit152:setField("Arma_ajuste_9");
    obj.edit152:setName("edit152");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout33);
    obj.edit153:setLeft(445);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(50);
    obj.edit153:setHeight(25);
    obj.edit153:setField("Arma_tipo_9");
    obj.edit153:setName("edit153");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout33);
    obj.edit154:setLeft(495);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(50);
    obj.edit154:setHeight(25);
    obj.edit154:setField("Arma_peso_9");
    obj.edit154:setName("edit154");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout33);
    obj.edit155:setLeft(545);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(50);
    obj.edit155:setHeight(25);
    obj.edit155:setField("Arma_velocidade_9");
    obj.edit155:setName("edit155");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setAlign("client");
    obj.image3:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20ADnD%20releases/imagens/block.png");
    obj.image3:setStyle("autoFit");
    obj.image3:setName("image3");

    obj._e_event0 = obj.edit69:addEventListener("onChange",
        function (self)
            sumCA();
        end, obj);

    obj._e_event1 = obj.edit70:addEventListener("onChange",
        function (self)
            sumCA();
        end, obj);

    obj._e_event2 = obj.edit71:addEventListener("onChange",
        function (self)
            sumCA();
        end, obj);

    obj._e_event3 = obj.edit72:addEventListener("onChange",
        function (self)
            sumCA();
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

        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmADnD1 = {
    newEditor = newfrmADnD1, 
    new = newfrmADnD1, 
    name = "frmADnD1", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmADnD1 = _frmADnD1;
rrpg.registrarForm(_frmADnD1);

return _frmADnD1;
