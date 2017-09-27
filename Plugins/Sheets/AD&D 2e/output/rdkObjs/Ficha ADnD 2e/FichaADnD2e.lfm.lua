require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaACN()
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
    obj:setName("frmFichaACN");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.FichaADnD2e");
    obj:setTitle("Ficha AD&D 2e");
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

    obj.frmADnD1 = gui.fromHandle(_obj_newObject("form"));
    obj.frmADnD1:setParent(obj.tab1);
    obj.frmADnD1:setName("frmADnD1");
    obj.frmADnD1:setAlign("client");
    obj.frmADnD1:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmADnD1);
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
						local mod = 10 +
									(tonumber(sheet.CAdes) or 0) + 
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

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Perícias");
    obj.tab2:setName("tab2");

    obj.frmADnD2 = gui.fromHandle(_obj_newObject("form"));
    obj.frmADnD2:setParent(obj.tab2);
    obj.frmADnD2:setName("frmADnD2");
    obj.frmADnD2:setAlign("client");
    obj.frmADnD2:setTheme("dark");
    obj.frmADnD2:setMargins({top=1});

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmADnD2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox2);
    obj.layout34:setLeft(0);
    obj.layout34:setTop(0);
    obj.layout34:setWidth(250);
    obj.layout34:setHeight(610);
    obj.layout34:setName("layout34");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout34);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setXradius(5);
    obj.rectangle9:setYradius(5);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setName("rectangle9");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout34);
    obj.label88:setLeft(0);
    obj.label88:setTop(5);
    obj.label88:setWidth(250);
    obj.label88:setHeight(20);
    obj.label88:setText("PERÍCIA COM ARMA");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout34);
    obj.layout35:setLeft(0);
    obj.layout35:setTop(30);
    obj.layout35:setWidth(250);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout35);
    obj.label89:setLeft(5);
    obj.label89:setTop(5);
    obj.label89:setWidth(40);
    obj.label89:setHeight(20);
    obj.label89:setText("Iniciais");
    obj.label89:setFontSize(11);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout35);
    obj.edit156:setLeft(45);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(40);
    obj.edit156:setHeight(25);
    obj.edit156:setField("Pericia_Arma_Inicial");
    obj.edit156:setName("edit156");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout35);
    obj.label90:setLeft(85);
    obj.label90:setTop(5);
    obj.label90:setWidth(40);
    obj.label90:setHeight(20);
    obj.label90:setText("Adicionais");
    obj.label90:setFontSize(8);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout35);
    obj.edit157:setLeft(125);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(40);
    obj.edit157:setHeight(25);
    obj.edit157:setField("Pericia_Arma_Adicional");
    obj.edit157:setName("edit157");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout35);
    obj.label91:setLeft(165);
    obj.label91:setTop(5);
    obj.label91:setWidth(40);
    obj.label91:setHeight(20);
    obj.label91:setText("Penalidade");
    obj.label91:setFontSize(8);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout35);
    obj.edit158:setLeft(205);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(40);
    obj.edit158:setHeight(25);
    obj.edit158:setField("Pericia_Arma_Penalidade");
    obj.edit158:setName("edit158");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout34);
    obj.layout36:setLeft(0);
    obj.layout36:setTop(55);
    obj.layout36:setWidth(250);
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout36);
    obj.label92:setLeft(5);
    obj.label92:setTop(0);
    obj.label92:setWidth(190);
    obj.label92:setHeight(25);
    obj.label92:setFontSize(13);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setText("Arma");
    obj.label92:setName("label92");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout36);
    obj.label93:setLeft(195);
    obj.label93:setTop(0);
    obj.label93:setWidth(50);
    obj.label93:setHeight(25);
    obj.label93:setFontSize(13);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setText("Pontos");
    obj.label93:setName("label93");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout34);
    obj.layout37:setLeft(0);
    obj.layout37:setTop(80);
    obj.layout37:setWidth(250);
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout37);
    obj.edit159:setLeft(5);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(190);
    obj.edit159:setHeight(25);
    obj.edit159:setField("Pericia_Arma_2");
    obj.edit159:setName("edit159");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout37);
    obj.edit160:setLeft(195);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(50);
    obj.edit160:setHeight(25);
    obj.edit160:setField("Pericia_Arma_Pontos_2");
    obj.edit160:setName("edit160");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout34);
    obj.layout38:setLeft(0);
    obj.layout38:setTop(105);
    obj.layout38:setWidth(250);
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout38);
    obj.edit161:setLeft(5);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(190);
    obj.edit161:setHeight(25);
    obj.edit161:setField("Pericia_Arma_3");
    obj.edit161:setName("edit161");

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout38);
    obj.edit162:setLeft(195);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(50);
    obj.edit162:setHeight(25);
    obj.edit162:setField("Pericia_Arma_Pontos_3");
    obj.edit162:setName("edit162");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout34);
    obj.layout39:setLeft(0);
    obj.layout39:setTop(130);
    obj.layout39:setWidth(250);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout39);
    obj.edit163:setLeft(5);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(190);
    obj.edit163:setHeight(25);
    obj.edit163:setField("Pericia_Arma_4");
    obj.edit163:setName("edit163");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout39);
    obj.edit164:setLeft(195);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(50);
    obj.edit164:setHeight(25);
    obj.edit164:setField("Pericia_Arma_Pontos_4");
    obj.edit164:setName("edit164");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout34);
    obj.layout40:setLeft(0);
    obj.layout40:setTop(155);
    obj.layout40:setWidth(250);
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout40);
    obj.edit165:setLeft(5);
    obj.edit165:setTop(0);
    obj.edit165:setWidth(190);
    obj.edit165:setHeight(25);
    obj.edit165:setField("Pericia_Arma_5");
    obj.edit165:setName("edit165");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout40);
    obj.edit166:setLeft(195);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(50);
    obj.edit166:setHeight(25);
    obj.edit166:setField("Pericia_Arma_Pontos_5");
    obj.edit166:setName("edit166");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout34);
    obj.layout41:setLeft(0);
    obj.layout41:setTop(180);
    obj.layout41:setWidth(250);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout41);
    obj.edit167:setLeft(5);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(190);
    obj.edit167:setHeight(25);
    obj.edit167:setField("Pericia_Arma_7");
    obj.edit167:setName("edit167");

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout41);
    obj.edit168:setLeft(195);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(50);
    obj.edit168:setHeight(25);
    obj.edit168:setField("Pericia_Arma_Pontos_7");
    obj.edit168:setName("edit168");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout34);
    obj.layout42:setLeft(0);
    obj.layout42:setTop(205);
    obj.layout42:setWidth(250);
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout42);
    obj.edit169:setLeft(5);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(190);
    obj.edit169:setHeight(25);
    obj.edit169:setField("Pericia_Arma_8");
    obj.edit169:setName("edit169");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout42);
    obj.edit170:setLeft(195);
    obj.edit170:setTop(0);
    obj.edit170:setWidth(50);
    obj.edit170:setHeight(25);
    obj.edit170:setField("Pericia_Arma_Pontos_8");
    obj.edit170:setName("edit170");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout34);
    obj.layout43:setLeft(0);
    obj.layout43:setTop(230);
    obj.layout43:setWidth(250);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.edit171 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout43);
    obj.edit171:setLeft(5);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(190);
    obj.edit171:setHeight(25);
    obj.edit171:setField("Pericia_Arma_9");
    obj.edit171:setName("edit171");

    obj.edit172 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout43);
    obj.edit172:setLeft(195);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(50);
    obj.edit172:setHeight(25);
    obj.edit172:setField("Pericia_Arma_Pontos_9");
    obj.edit172:setName("edit172");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout34);
    obj.layout44:setLeft(0);
    obj.layout44:setTop(255);
    obj.layout44:setWidth(250);
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.edit173 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout44);
    obj.edit173:setLeft(5);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(190);
    obj.edit173:setHeight(25);
    obj.edit173:setField("Pericia_Arma_10");
    obj.edit173:setName("edit173");

    obj.edit174 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout44);
    obj.edit174:setLeft(195);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(50);
    obj.edit174:setHeight(25);
    obj.edit174:setField("Pericia_Arma_Pontos_10");
    obj.edit174:setName("edit174");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout34);
    obj.layout45:setLeft(0);
    obj.layout45:setTop(280);
    obj.layout45:setWidth(250);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.edit175 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout45);
    obj.edit175:setLeft(5);
    obj.edit175:setTop(0);
    obj.edit175:setWidth(190);
    obj.edit175:setHeight(25);
    obj.edit175:setField("Pericia_Arma_11");
    obj.edit175:setName("edit175");

    obj.edit176 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout45);
    obj.edit176:setLeft(195);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(50);
    obj.edit176:setHeight(25);
    obj.edit176:setField("Pericia_Arma_Pontos_11");
    obj.edit176:setName("edit176");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout34);
    obj.layout46:setLeft(0);
    obj.layout46:setTop(305);
    obj.layout46:setWidth(250);
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.edit177 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout46);
    obj.edit177:setLeft(5);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(190);
    obj.edit177:setHeight(25);
    obj.edit177:setField("Pericia_Arma_12");
    obj.edit177:setName("edit177");

    obj.edit178 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout46);
    obj.edit178:setLeft(195);
    obj.edit178:setTop(0);
    obj.edit178:setWidth(50);
    obj.edit178:setHeight(25);
    obj.edit178:setField("Pericia_Arma_Pontos_12");
    obj.edit178:setName("edit178");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout34);
    obj.layout47:setLeft(0);
    obj.layout47:setTop(330);
    obj.layout47:setWidth(250);
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.edit179 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout47);
    obj.edit179:setLeft(5);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(190);
    obj.edit179:setHeight(25);
    obj.edit179:setField("Pericia_Arma_13");
    obj.edit179:setName("edit179");

    obj.edit180 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout47);
    obj.edit180:setLeft(195);
    obj.edit180:setTop(0);
    obj.edit180:setWidth(50);
    obj.edit180:setHeight(25);
    obj.edit180:setField("Pericia_Arma_Pontos_13");
    obj.edit180:setName("edit180");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout34);
    obj.layout48:setLeft(0);
    obj.layout48:setTop(355);
    obj.layout48:setWidth(250);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.edit181 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout48);
    obj.edit181:setLeft(5);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(190);
    obj.edit181:setHeight(25);
    obj.edit181:setField("Pericia_Arma_14");
    obj.edit181:setName("edit181");

    obj.edit182 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout48);
    obj.edit182:setLeft(195);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(50);
    obj.edit182:setHeight(25);
    obj.edit182:setField("Pericia_Arma_Pontos_14");
    obj.edit182:setName("edit182");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout34);
    obj.layout49:setLeft(0);
    obj.layout49:setTop(380);
    obj.layout49:setWidth(250);
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.edit183 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout49);
    obj.edit183:setLeft(5);
    obj.edit183:setTop(0);
    obj.edit183:setWidth(190);
    obj.edit183:setHeight(25);
    obj.edit183:setField("Pericia_Arma_15");
    obj.edit183:setName("edit183");

    obj.edit184 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout49);
    obj.edit184:setLeft(195);
    obj.edit184:setTop(0);
    obj.edit184:setWidth(50);
    obj.edit184:setHeight(25);
    obj.edit184:setField("Pericia_Arma_Pontos_15");
    obj.edit184:setName("edit184");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout34);
    obj.layout50:setLeft(0);
    obj.layout50:setTop(405);
    obj.layout50:setWidth(250);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.edit185 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout50);
    obj.edit185:setLeft(5);
    obj.edit185:setTop(0);
    obj.edit185:setWidth(190);
    obj.edit185:setHeight(25);
    obj.edit185:setField("Pericia_Arma_16");
    obj.edit185:setName("edit185");

    obj.edit186 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout50);
    obj.edit186:setLeft(195);
    obj.edit186:setTop(0);
    obj.edit186:setWidth(50);
    obj.edit186:setHeight(25);
    obj.edit186:setField("Pericia_Arma_Pontos_16");
    obj.edit186:setName("edit186");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout34);
    obj.layout51:setLeft(0);
    obj.layout51:setTop(430);
    obj.layout51:setWidth(250);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.edit187 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout51);
    obj.edit187:setLeft(5);
    obj.edit187:setTop(0);
    obj.edit187:setWidth(190);
    obj.edit187:setHeight(25);
    obj.edit187:setField("Pericia_Arma_17");
    obj.edit187:setName("edit187");

    obj.edit188 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout51);
    obj.edit188:setLeft(195);
    obj.edit188:setTop(0);
    obj.edit188:setWidth(50);
    obj.edit188:setHeight(25);
    obj.edit188:setField("Pericia_Arma_Pontos_17");
    obj.edit188:setName("edit188");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout34);
    obj.layout52:setLeft(0);
    obj.layout52:setTop(455);
    obj.layout52:setWidth(250);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.edit189 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout52);
    obj.edit189:setLeft(5);
    obj.edit189:setTop(0);
    obj.edit189:setWidth(190);
    obj.edit189:setHeight(25);
    obj.edit189:setField("Pericia_Arma_18");
    obj.edit189:setName("edit189");

    obj.edit190 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout52);
    obj.edit190:setLeft(195);
    obj.edit190:setTop(0);
    obj.edit190:setWidth(50);
    obj.edit190:setHeight(25);
    obj.edit190:setField("Pericia_Arma_Pontos_18");
    obj.edit190:setName("edit190");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout34);
    obj.layout53:setLeft(0);
    obj.layout53:setTop(480);
    obj.layout53:setWidth(250);
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.edit191 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout53);
    obj.edit191:setLeft(5);
    obj.edit191:setTop(0);
    obj.edit191:setWidth(190);
    obj.edit191:setHeight(25);
    obj.edit191:setField("Pericia_Arma_19");
    obj.edit191:setName("edit191");

    obj.edit192 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout53);
    obj.edit192:setLeft(195);
    obj.edit192:setTop(0);
    obj.edit192:setWidth(50);
    obj.edit192:setHeight(25);
    obj.edit192:setField("Pericia_Arma_Pontos_19");
    obj.edit192:setName("edit192");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout34);
    obj.layout54:setLeft(0);
    obj.layout54:setTop(505);
    obj.layout54:setWidth(250);
    obj.layout54:setHeight(25);
    obj.layout54:setName("layout54");

    obj.edit193 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout54);
    obj.edit193:setLeft(5);
    obj.edit193:setTop(0);
    obj.edit193:setWidth(190);
    obj.edit193:setHeight(25);
    obj.edit193:setField("Pericia_Arma_20");
    obj.edit193:setName("edit193");

    obj.edit194 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout54);
    obj.edit194:setLeft(195);
    obj.edit194:setTop(0);
    obj.edit194:setWidth(50);
    obj.edit194:setHeight(25);
    obj.edit194:setField("Pericia_Arma_Pontos_20");
    obj.edit194:setName("edit194");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout34);
    obj.layout55:setLeft(0);
    obj.layout55:setTop(530);
    obj.layout55:setWidth(250);
    obj.layout55:setHeight(25);
    obj.layout55:setName("layout55");

    obj.edit195 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout55);
    obj.edit195:setLeft(5);
    obj.edit195:setTop(0);
    obj.edit195:setWidth(190);
    obj.edit195:setHeight(25);
    obj.edit195:setField("Pericia_Arma_21");
    obj.edit195:setName("edit195");

    obj.edit196 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout55);
    obj.edit196:setLeft(195);
    obj.edit196:setTop(0);
    obj.edit196:setWidth(50);
    obj.edit196:setHeight(25);
    obj.edit196:setField("Pericia_Arma_Pontos_21");
    obj.edit196:setName("edit196");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout34);
    obj.layout56:setLeft(0);
    obj.layout56:setTop(555);
    obj.layout56:setWidth(250);
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.edit197 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout56);
    obj.edit197:setLeft(5);
    obj.edit197:setTop(0);
    obj.edit197:setWidth(190);
    obj.edit197:setHeight(25);
    obj.edit197:setField("Pericia_Arma_22");
    obj.edit197:setName("edit197");

    obj.edit198 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout56);
    obj.edit198:setLeft(195);
    obj.edit198:setTop(0);
    obj.edit198:setWidth(50);
    obj.edit198:setHeight(25);
    obj.edit198:setField("Pericia_Arma_Pontos_22");
    obj.edit198:setName("edit198");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout34);
    obj.layout57:setLeft(0);
    obj.layout57:setTop(580);
    obj.layout57:setWidth(250);
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.edit199 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout57);
    obj.edit199:setLeft(5);
    obj.edit199:setTop(0);
    obj.edit199:setWidth(190);
    obj.edit199:setHeight(25);
    obj.edit199:setField("Pericia_Arma_23");
    obj.edit199:setName("edit199");

    obj.edit200 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout57);
    obj.edit200:setLeft(195);
    obj.edit200:setTop(0);
    obj.edit200:setWidth(50);
    obj.edit200:setHeight(25);
    obj.edit200:setField("Pericia_Arma_Pontos_23");
    obj.edit200:setName("edit200");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.scrollBox2);
    obj.layout58:setLeft(260);
    obj.layout58:setTop(0);
    obj.layout58:setWidth(350);
    obj.layout58:setHeight(610);
    obj.layout58:setName("layout58");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout58);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setXradius(5);
    obj.rectangle10:setYradius(5);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setName("rectangle10");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout58);
    obj.label94:setLeft(0);
    obj.label94:setTop(5);
    obj.label94:setWidth(350);
    obj.label94:setHeight(20);
    obj.label94:setText("PERÍCIA GERAL");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout58);
    obj.layout59:setLeft(0);
    obj.layout59:setTop(30);
    obj.layout59:setWidth(350);
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout59);
    obj.label95:setLeft(55);
    obj.label95:setTop(5);
    obj.label95:setWidth(40);
    obj.label95:setHeight(20);
    obj.label95:setText("Iniciais");
    obj.label95:setFontSize(11);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.edit201 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout59);
    obj.edit201:setLeft(95);
    obj.edit201:setTop(0);
    obj.edit201:setWidth(40);
    obj.edit201:setHeight(25);
    obj.edit201:setField("Pericia_Geral_Inicial");
    obj.edit201:setName("edit201");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout59);
    obj.label96:setLeft(135);
    obj.label96:setTop(5);
    obj.label96:setWidth(40);
    obj.label96:setHeight(20);
    obj.label96:setText("Adicionais");
    obj.label96:setFontSize(8);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.edit202 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout59);
    obj.edit202:setLeft(175);
    obj.edit202:setTop(0);
    obj.edit202:setWidth(40);
    obj.edit202:setHeight(25);
    obj.edit202:setField("Pericia_Geral_Adicional");
    obj.edit202:setName("edit202");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout59);
    obj.label97:setLeft(215);
    obj.label97:setTop(5);
    obj.label97:setWidth(40);
    obj.label97:setHeight(20);
    obj.label97:setText("Penalidade");
    obj.label97:setFontSize(8);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.edit203 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout59);
    obj.edit203:setLeft(255);
    obj.edit203:setTop(0);
    obj.edit203:setWidth(40);
    obj.edit203:setHeight(25);
    obj.edit203:setField("Pericia_Geral_Penalidade");
    obj.edit203:setName("edit203");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout58);
    obj.layout60:setLeft(0);
    obj.layout60:setTop(55);
    obj.layout60:setWidth(350);
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout60);
    obj.label98:setLeft(5);
    obj.label98:setTop(0);
    obj.label98:setWidth(190);
    obj.label98:setHeight(25);
    obj.label98:setFontSize(13);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setText("Perícia");
    obj.label98:setName("label98");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout60);
    obj.label99:setLeft(195);
    obj.label99:setTop(0);
    obj.label99:setWidth(50);
    obj.label99:setHeight(25);
    obj.label99:setFontSize(13);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setText("Pontos");
    obj.label99:setName("label99");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout60);
    obj.label100:setLeft(245);
    obj.label100:setTop(0);
    obj.label100:setWidth(50);
    obj.label100:setHeight(25);
    obj.label100:setFontSize(13);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setText("HAB");
    obj.label100:setName("label100");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout60);
    obj.label101:setLeft(295);
    obj.label101:setTop(0);
    obj.label101:setWidth(50);
    obj.label101:setHeight(25);
    obj.label101:setFontSize(13);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setText("MOD");
    obj.label101:setName("label101");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout58);
    obj.layout61:setLeft(0);
    obj.layout61:setTop(80);
    obj.layout61:setWidth(350);
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.edit204 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout61);
    obj.edit204:setLeft(5);
    obj.edit204:setTop(0);
    obj.edit204:setWidth(190);
    obj.edit204:setHeight(25);
    obj.edit204:setField("Pericia_Geral_2");
    obj.edit204:setName("edit204");

    obj.edit205 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout61);
    obj.edit205:setLeft(195);
    obj.edit205:setTop(0);
    obj.edit205:setWidth(50);
    obj.edit205:setHeight(25);
    obj.edit205:setField("Pericia_Geral_Pontos_2");
    obj.edit205:setName("edit205");

    obj.edit206 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout61);
    obj.edit206:setLeft(245);
    obj.edit206:setTop(0);
    obj.edit206:setWidth(50);
    obj.edit206:setHeight(25);
    obj.edit206:setField("Pericia_Geral_HAB2");
    obj.edit206:setName("edit206");

    obj.edit207 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout61);
    obj.edit207:setLeft(295);
    obj.edit207:setTop(0);
    obj.edit207:setWidth(50);
    obj.edit207:setHeight(25);
    obj.edit207:setField("Pericia_Geral_MOD_2");
    obj.edit207:setName("edit207");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout58);
    obj.layout62:setLeft(0);
    obj.layout62:setTop(105);
    obj.layout62:setWidth(350);
    obj.layout62:setHeight(25);
    obj.layout62:setName("layout62");

    obj.edit208 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout62);
    obj.edit208:setLeft(5);
    obj.edit208:setTop(0);
    obj.edit208:setWidth(190);
    obj.edit208:setHeight(25);
    obj.edit208:setField("Pericia_Geral_3");
    obj.edit208:setName("edit208");

    obj.edit209 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout62);
    obj.edit209:setLeft(195);
    obj.edit209:setTop(0);
    obj.edit209:setWidth(50);
    obj.edit209:setHeight(25);
    obj.edit209:setField("Pericia_Geral_Pontos_3");
    obj.edit209:setName("edit209");

    obj.edit210 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout62);
    obj.edit210:setLeft(245);
    obj.edit210:setTop(0);
    obj.edit210:setWidth(50);
    obj.edit210:setHeight(25);
    obj.edit210:setField("Pericia_Geral_HAB3");
    obj.edit210:setName("edit210");

    obj.edit211 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout62);
    obj.edit211:setLeft(295);
    obj.edit211:setTop(0);
    obj.edit211:setWidth(50);
    obj.edit211:setHeight(25);
    obj.edit211:setField("Pericia_Geral_MOD_3");
    obj.edit211:setName("edit211");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout58);
    obj.layout63:setLeft(0);
    obj.layout63:setTop(130);
    obj.layout63:setWidth(350);
    obj.layout63:setHeight(25);
    obj.layout63:setName("layout63");

    obj.edit212 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout63);
    obj.edit212:setLeft(5);
    obj.edit212:setTop(0);
    obj.edit212:setWidth(190);
    obj.edit212:setHeight(25);
    obj.edit212:setField("Pericia_Geral_4");
    obj.edit212:setName("edit212");

    obj.edit213 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout63);
    obj.edit213:setLeft(195);
    obj.edit213:setTop(0);
    obj.edit213:setWidth(50);
    obj.edit213:setHeight(25);
    obj.edit213:setField("Pericia_Geral_Pontos_4");
    obj.edit213:setName("edit213");

    obj.edit214 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout63);
    obj.edit214:setLeft(245);
    obj.edit214:setTop(0);
    obj.edit214:setWidth(50);
    obj.edit214:setHeight(25);
    obj.edit214:setField("Pericia_Geral_HAB4");
    obj.edit214:setName("edit214");

    obj.edit215 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout63);
    obj.edit215:setLeft(295);
    obj.edit215:setTop(0);
    obj.edit215:setWidth(50);
    obj.edit215:setHeight(25);
    obj.edit215:setField("Pericia_Geral_MOD_4");
    obj.edit215:setName("edit215");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout58);
    obj.layout64:setLeft(0);
    obj.layout64:setTop(155);
    obj.layout64:setWidth(350);
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.edit216 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout64);
    obj.edit216:setLeft(5);
    obj.edit216:setTop(0);
    obj.edit216:setWidth(190);
    obj.edit216:setHeight(25);
    obj.edit216:setField("Pericia_Geral_5");
    obj.edit216:setName("edit216");

    obj.edit217 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout64);
    obj.edit217:setLeft(195);
    obj.edit217:setTop(0);
    obj.edit217:setWidth(50);
    obj.edit217:setHeight(25);
    obj.edit217:setField("Pericia_Geral_Pontos_5");
    obj.edit217:setName("edit217");

    obj.edit218 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout64);
    obj.edit218:setLeft(245);
    obj.edit218:setTop(0);
    obj.edit218:setWidth(50);
    obj.edit218:setHeight(25);
    obj.edit218:setField("Pericia_Geral_HAB5");
    obj.edit218:setName("edit218");

    obj.edit219 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout64);
    obj.edit219:setLeft(295);
    obj.edit219:setTop(0);
    obj.edit219:setWidth(50);
    obj.edit219:setHeight(25);
    obj.edit219:setField("Pericia_Geral_MOD_5");
    obj.edit219:setName("edit219");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout58);
    obj.layout65:setLeft(0);
    obj.layout65:setTop(180);
    obj.layout65:setWidth(350);
    obj.layout65:setHeight(25);
    obj.layout65:setName("layout65");

    obj.edit220 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout65);
    obj.edit220:setLeft(5);
    obj.edit220:setTop(0);
    obj.edit220:setWidth(190);
    obj.edit220:setHeight(25);
    obj.edit220:setField("Pericia_Geral_7");
    obj.edit220:setName("edit220");

    obj.edit221 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout65);
    obj.edit221:setLeft(195);
    obj.edit221:setTop(0);
    obj.edit221:setWidth(50);
    obj.edit221:setHeight(25);
    obj.edit221:setField("Pericia_Geral_Pontos_7");
    obj.edit221:setName("edit221");

    obj.edit222 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout65);
    obj.edit222:setLeft(245);
    obj.edit222:setTop(0);
    obj.edit222:setWidth(50);
    obj.edit222:setHeight(25);
    obj.edit222:setField("Pericia_Geral_HAB7");
    obj.edit222:setName("edit222");

    obj.edit223 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout65);
    obj.edit223:setLeft(295);
    obj.edit223:setTop(0);
    obj.edit223:setWidth(50);
    obj.edit223:setHeight(25);
    obj.edit223:setField("Pericia_Geral_MOD_7");
    obj.edit223:setName("edit223");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout58);
    obj.layout66:setLeft(0);
    obj.layout66:setTop(205);
    obj.layout66:setWidth(350);
    obj.layout66:setHeight(25);
    obj.layout66:setName("layout66");

    obj.edit224 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout66);
    obj.edit224:setLeft(5);
    obj.edit224:setTop(0);
    obj.edit224:setWidth(190);
    obj.edit224:setHeight(25);
    obj.edit224:setField("Pericia_Geral_8");
    obj.edit224:setName("edit224");

    obj.edit225 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout66);
    obj.edit225:setLeft(195);
    obj.edit225:setTop(0);
    obj.edit225:setWidth(50);
    obj.edit225:setHeight(25);
    obj.edit225:setField("Pericia_Geral_Pontos_8");
    obj.edit225:setName("edit225");

    obj.edit226 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout66);
    obj.edit226:setLeft(245);
    obj.edit226:setTop(0);
    obj.edit226:setWidth(50);
    obj.edit226:setHeight(25);
    obj.edit226:setField("Pericia_Geral_HAB8");
    obj.edit226:setName("edit226");

    obj.edit227 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout66);
    obj.edit227:setLeft(295);
    obj.edit227:setTop(0);
    obj.edit227:setWidth(50);
    obj.edit227:setHeight(25);
    obj.edit227:setField("Pericia_Geral_MOD_8");
    obj.edit227:setName("edit227");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout58);
    obj.layout67:setLeft(0);
    obj.layout67:setTop(230);
    obj.layout67:setWidth(350);
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.edit228 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout67);
    obj.edit228:setLeft(5);
    obj.edit228:setTop(0);
    obj.edit228:setWidth(190);
    obj.edit228:setHeight(25);
    obj.edit228:setField("Pericia_Geral_9");
    obj.edit228:setName("edit228");

    obj.edit229 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout67);
    obj.edit229:setLeft(195);
    obj.edit229:setTop(0);
    obj.edit229:setWidth(50);
    obj.edit229:setHeight(25);
    obj.edit229:setField("Pericia_Geral_Pontos_9");
    obj.edit229:setName("edit229");

    obj.edit230 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout67);
    obj.edit230:setLeft(245);
    obj.edit230:setTop(0);
    obj.edit230:setWidth(50);
    obj.edit230:setHeight(25);
    obj.edit230:setField("Pericia_Geral_HAB9");
    obj.edit230:setName("edit230");

    obj.edit231 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout67);
    obj.edit231:setLeft(295);
    obj.edit231:setTop(0);
    obj.edit231:setWidth(50);
    obj.edit231:setHeight(25);
    obj.edit231:setField("Pericia_Geral_MOD_9");
    obj.edit231:setName("edit231");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout58);
    obj.layout68:setLeft(0);
    obj.layout68:setTop(255);
    obj.layout68:setWidth(350);
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.edit232 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout68);
    obj.edit232:setLeft(5);
    obj.edit232:setTop(0);
    obj.edit232:setWidth(190);
    obj.edit232:setHeight(25);
    obj.edit232:setField("Pericia_Geral_10");
    obj.edit232:setName("edit232");

    obj.edit233 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout68);
    obj.edit233:setLeft(195);
    obj.edit233:setTop(0);
    obj.edit233:setWidth(50);
    obj.edit233:setHeight(25);
    obj.edit233:setField("Pericia_Geral_Pontos_10");
    obj.edit233:setName("edit233");

    obj.edit234 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout68);
    obj.edit234:setLeft(245);
    obj.edit234:setTop(0);
    obj.edit234:setWidth(50);
    obj.edit234:setHeight(25);
    obj.edit234:setField("Pericia_Geral_HAB10");
    obj.edit234:setName("edit234");

    obj.edit235 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout68);
    obj.edit235:setLeft(295);
    obj.edit235:setTop(0);
    obj.edit235:setWidth(50);
    obj.edit235:setHeight(25);
    obj.edit235:setField("Pericia_Geral_MOD_10");
    obj.edit235:setName("edit235");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout58);
    obj.layout69:setLeft(0);
    obj.layout69:setTop(280);
    obj.layout69:setWidth(350);
    obj.layout69:setHeight(25);
    obj.layout69:setName("layout69");

    obj.edit236 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout69);
    obj.edit236:setLeft(5);
    obj.edit236:setTop(0);
    obj.edit236:setWidth(190);
    obj.edit236:setHeight(25);
    obj.edit236:setField("Pericia_Geral_11");
    obj.edit236:setName("edit236");

    obj.edit237 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout69);
    obj.edit237:setLeft(195);
    obj.edit237:setTop(0);
    obj.edit237:setWidth(50);
    obj.edit237:setHeight(25);
    obj.edit237:setField("Pericia_Geral_Pontos_11");
    obj.edit237:setName("edit237");

    obj.edit238 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout69);
    obj.edit238:setLeft(245);
    obj.edit238:setTop(0);
    obj.edit238:setWidth(50);
    obj.edit238:setHeight(25);
    obj.edit238:setField("Pericia_Geral_HAB11");
    obj.edit238:setName("edit238");

    obj.edit239 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout69);
    obj.edit239:setLeft(295);
    obj.edit239:setTop(0);
    obj.edit239:setWidth(50);
    obj.edit239:setHeight(25);
    obj.edit239:setField("Pericia_Geral_MOD_11");
    obj.edit239:setName("edit239");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout58);
    obj.layout70:setLeft(0);
    obj.layout70:setTop(305);
    obj.layout70:setWidth(350);
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.edit240 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout70);
    obj.edit240:setLeft(5);
    obj.edit240:setTop(0);
    obj.edit240:setWidth(190);
    obj.edit240:setHeight(25);
    obj.edit240:setField("Pericia_Geral_12");
    obj.edit240:setName("edit240");

    obj.edit241 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout70);
    obj.edit241:setLeft(195);
    obj.edit241:setTop(0);
    obj.edit241:setWidth(50);
    obj.edit241:setHeight(25);
    obj.edit241:setField("Pericia_Geral_Pontos_12");
    obj.edit241:setName("edit241");

    obj.edit242 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout70);
    obj.edit242:setLeft(245);
    obj.edit242:setTop(0);
    obj.edit242:setWidth(50);
    obj.edit242:setHeight(25);
    obj.edit242:setField("Pericia_Geral_HAB12");
    obj.edit242:setName("edit242");

    obj.edit243 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout70);
    obj.edit243:setLeft(295);
    obj.edit243:setTop(0);
    obj.edit243:setWidth(50);
    obj.edit243:setHeight(25);
    obj.edit243:setField("Pericia_Geral_MOD_12");
    obj.edit243:setName("edit243");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout58);
    obj.layout71:setLeft(0);
    obj.layout71:setTop(330);
    obj.layout71:setWidth(350);
    obj.layout71:setHeight(25);
    obj.layout71:setName("layout71");

    obj.edit244 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout71);
    obj.edit244:setLeft(5);
    obj.edit244:setTop(0);
    obj.edit244:setWidth(190);
    obj.edit244:setHeight(25);
    obj.edit244:setField("Pericia_Geral_13");
    obj.edit244:setName("edit244");

    obj.edit245 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout71);
    obj.edit245:setLeft(195);
    obj.edit245:setTop(0);
    obj.edit245:setWidth(50);
    obj.edit245:setHeight(25);
    obj.edit245:setField("Pericia_Geral_Pontos_13");
    obj.edit245:setName("edit245");

    obj.edit246 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout71);
    obj.edit246:setLeft(245);
    obj.edit246:setTop(0);
    obj.edit246:setWidth(50);
    obj.edit246:setHeight(25);
    obj.edit246:setField("Pericia_Geral_HAB13");
    obj.edit246:setName("edit246");

    obj.edit247 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout71);
    obj.edit247:setLeft(295);
    obj.edit247:setTop(0);
    obj.edit247:setWidth(50);
    obj.edit247:setHeight(25);
    obj.edit247:setField("Pericia_Geral_MOD_13");
    obj.edit247:setName("edit247");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout58);
    obj.layout72:setLeft(0);
    obj.layout72:setTop(355);
    obj.layout72:setWidth(350);
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.edit248 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout72);
    obj.edit248:setLeft(5);
    obj.edit248:setTop(0);
    obj.edit248:setWidth(190);
    obj.edit248:setHeight(25);
    obj.edit248:setField("Pericia_Geral_14");
    obj.edit248:setName("edit248");

    obj.edit249 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout72);
    obj.edit249:setLeft(195);
    obj.edit249:setTop(0);
    obj.edit249:setWidth(50);
    obj.edit249:setHeight(25);
    obj.edit249:setField("Pericia_Geral_Pontos_14");
    obj.edit249:setName("edit249");

    obj.edit250 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout72);
    obj.edit250:setLeft(245);
    obj.edit250:setTop(0);
    obj.edit250:setWidth(50);
    obj.edit250:setHeight(25);
    obj.edit250:setField("Pericia_Geral_HAB14");
    obj.edit250:setName("edit250");

    obj.edit251 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout72);
    obj.edit251:setLeft(295);
    obj.edit251:setTop(0);
    obj.edit251:setWidth(50);
    obj.edit251:setHeight(25);
    obj.edit251:setField("Pericia_Geral_MOD_14");
    obj.edit251:setName("edit251");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout58);
    obj.layout73:setLeft(0);
    obj.layout73:setTop(380);
    obj.layout73:setWidth(350);
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.edit252 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout73);
    obj.edit252:setLeft(5);
    obj.edit252:setTop(0);
    obj.edit252:setWidth(190);
    obj.edit252:setHeight(25);
    obj.edit252:setField("Pericia_Geral_15");
    obj.edit252:setName("edit252");

    obj.edit253 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout73);
    obj.edit253:setLeft(195);
    obj.edit253:setTop(0);
    obj.edit253:setWidth(50);
    obj.edit253:setHeight(25);
    obj.edit253:setField("Pericia_Geral_Pontos_15");
    obj.edit253:setName("edit253");

    obj.edit254 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout73);
    obj.edit254:setLeft(245);
    obj.edit254:setTop(0);
    obj.edit254:setWidth(50);
    obj.edit254:setHeight(25);
    obj.edit254:setField("Pericia_Geral_HAB15");
    obj.edit254:setName("edit254");

    obj.edit255 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout73);
    obj.edit255:setLeft(295);
    obj.edit255:setTop(0);
    obj.edit255:setWidth(50);
    obj.edit255:setHeight(25);
    obj.edit255:setField("Pericia_Geral_MOD_15");
    obj.edit255:setName("edit255");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout58);
    obj.layout74:setLeft(0);
    obj.layout74:setTop(405);
    obj.layout74:setWidth(350);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.edit256 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout74);
    obj.edit256:setLeft(5);
    obj.edit256:setTop(0);
    obj.edit256:setWidth(190);
    obj.edit256:setHeight(25);
    obj.edit256:setField("Pericia_Geral_16");
    obj.edit256:setName("edit256");

    obj.edit257 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout74);
    obj.edit257:setLeft(195);
    obj.edit257:setTop(0);
    obj.edit257:setWidth(50);
    obj.edit257:setHeight(25);
    obj.edit257:setField("Pericia_Geral_Pontos_16");
    obj.edit257:setName("edit257");

    obj.edit258 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout74);
    obj.edit258:setLeft(245);
    obj.edit258:setTop(0);
    obj.edit258:setWidth(50);
    obj.edit258:setHeight(25);
    obj.edit258:setField("Pericia_Geral_HAB16");
    obj.edit258:setName("edit258");

    obj.edit259 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout74);
    obj.edit259:setLeft(295);
    obj.edit259:setTop(0);
    obj.edit259:setWidth(50);
    obj.edit259:setHeight(25);
    obj.edit259:setField("Pericia_Geral_MOD_16");
    obj.edit259:setName("edit259");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout58);
    obj.layout75:setLeft(0);
    obj.layout75:setTop(430);
    obj.layout75:setWidth(350);
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.edit260 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout75);
    obj.edit260:setLeft(5);
    obj.edit260:setTop(0);
    obj.edit260:setWidth(190);
    obj.edit260:setHeight(25);
    obj.edit260:setField("Pericia_Geral_17");
    obj.edit260:setName("edit260");

    obj.edit261 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout75);
    obj.edit261:setLeft(195);
    obj.edit261:setTop(0);
    obj.edit261:setWidth(50);
    obj.edit261:setHeight(25);
    obj.edit261:setField("Pericia_Geral_Pontos_17");
    obj.edit261:setName("edit261");

    obj.edit262 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout75);
    obj.edit262:setLeft(245);
    obj.edit262:setTop(0);
    obj.edit262:setWidth(50);
    obj.edit262:setHeight(25);
    obj.edit262:setField("Pericia_Geral_HAB17");
    obj.edit262:setName("edit262");

    obj.edit263 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout75);
    obj.edit263:setLeft(295);
    obj.edit263:setTop(0);
    obj.edit263:setWidth(50);
    obj.edit263:setHeight(25);
    obj.edit263:setField("Pericia_Geral_MOD_17");
    obj.edit263:setName("edit263");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout58);
    obj.layout76:setLeft(0);
    obj.layout76:setTop(455);
    obj.layout76:setWidth(350);
    obj.layout76:setHeight(25);
    obj.layout76:setName("layout76");

    obj.edit264 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout76);
    obj.edit264:setLeft(5);
    obj.edit264:setTop(0);
    obj.edit264:setWidth(190);
    obj.edit264:setHeight(25);
    obj.edit264:setField("Pericia_Geral_18");
    obj.edit264:setName("edit264");

    obj.edit265 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout76);
    obj.edit265:setLeft(195);
    obj.edit265:setTop(0);
    obj.edit265:setWidth(50);
    obj.edit265:setHeight(25);
    obj.edit265:setField("Pericia_Geral_Pontos_18");
    obj.edit265:setName("edit265");

    obj.edit266 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout76);
    obj.edit266:setLeft(245);
    obj.edit266:setTop(0);
    obj.edit266:setWidth(50);
    obj.edit266:setHeight(25);
    obj.edit266:setField("Pericia_Geral_HAB18");
    obj.edit266:setName("edit266");

    obj.edit267 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.layout76);
    obj.edit267:setLeft(295);
    obj.edit267:setTop(0);
    obj.edit267:setWidth(50);
    obj.edit267:setHeight(25);
    obj.edit267:setField("Pericia_Geral_MOD_18");
    obj.edit267:setName("edit267");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout58);
    obj.layout77:setLeft(0);
    obj.layout77:setTop(480);
    obj.layout77:setWidth(350);
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.edit268 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.layout77);
    obj.edit268:setLeft(5);
    obj.edit268:setTop(0);
    obj.edit268:setWidth(190);
    obj.edit268:setHeight(25);
    obj.edit268:setField("Pericia_Geral_19");
    obj.edit268:setName("edit268");

    obj.edit269 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.layout77);
    obj.edit269:setLeft(195);
    obj.edit269:setTop(0);
    obj.edit269:setWidth(50);
    obj.edit269:setHeight(25);
    obj.edit269:setField("Pericia_Geral_Pontos_19");
    obj.edit269:setName("edit269");

    obj.edit270 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout77);
    obj.edit270:setLeft(245);
    obj.edit270:setTop(0);
    obj.edit270:setWidth(50);
    obj.edit270:setHeight(25);
    obj.edit270:setField("Pericia_Geral_HAB19");
    obj.edit270:setName("edit270");

    obj.edit271 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout77);
    obj.edit271:setLeft(295);
    obj.edit271:setTop(0);
    obj.edit271:setWidth(50);
    obj.edit271:setHeight(25);
    obj.edit271:setField("Pericia_Geral_MOD_19");
    obj.edit271:setName("edit271");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout58);
    obj.layout78:setLeft(0);
    obj.layout78:setTop(505);
    obj.layout78:setWidth(350);
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.edit272 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout78);
    obj.edit272:setLeft(5);
    obj.edit272:setTop(0);
    obj.edit272:setWidth(190);
    obj.edit272:setHeight(25);
    obj.edit272:setField("Pericia_Geral_20");
    obj.edit272:setName("edit272");

    obj.edit273 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout78);
    obj.edit273:setLeft(195);
    obj.edit273:setTop(0);
    obj.edit273:setWidth(50);
    obj.edit273:setHeight(25);
    obj.edit273:setField("Pericia_Geral_Pontos_20");
    obj.edit273:setName("edit273");

    obj.edit274 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout78);
    obj.edit274:setLeft(245);
    obj.edit274:setTop(0);
    obj.edit274:setWidth(50);
    obj.edit274:setHeight(25);
    obj.edit274:setField("Pericia_Geral_HAB20");
    obj.edit274:setName("edit274");

    obj.edit275 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout78);
    obj.edit275:setLeft(295);
    obj.edit275:setTop(0);
    obj.edit275:setWidth(50);
    obj.edit275:setHeight(25);
    obj.edit275:setField("Pericia_Geral_MOD_20");
    obj.edit275:setName("edit275");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout58);
    obj.layout79:setLeft(0);
    obj.layout79:setTop(530);
    obj.layout79:setWidth(350);
    obj.layout79:setHeight(25);
    obj.layout79:setName("layout79");

    obj.edit276 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout79);
    obj.edit276:setLeft(5);
    obj.edit276:setTop(0);
    obj.edit276:setWidth(190);
    obj.edit276:setHeight(25);
    obj.edit276:setField("Pericia_Geral_21");
    obj.edit276:setName("edit276");

    obj.edit277 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout79);
    obj.edit277:setLeft(195);
    obj.edit277:setTop(0);
    obj.edit277:setWidth(50);
    obj.edit277:setHeight(25);
    obj.edit277:setField("Pericia_Geral_Pontos_21");
    obj.edit277:setName("edit277");

    obj.edit278 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout79);
    obj.edit278:setLeft(245);
    obj.edit278:setTop(0);
    obj.edit278:setWidth(50);
    obj.edit278:setHeight(25);
    obj.edit278:setField("Pericia_Geral_HAB21");
    obj.edit278:setName("edit278");

    obj.edit279 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout79);
    obj.edit279:setLeft(295);
    obj.edit279:setTop(0);
    obj.edit279:setWidth(50);
    obj.edit279:setHeight(25);
    obj.edit279:setField("Pericia_Geral_MOD_21");
    obj.edit279:setName("edit279");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout58);
    obj.layout80:setLeft(0);
    obj.layout80:setTop(555);
    obj.layout80:setWidth(350);
    obj.layout80:setHeight(25);
    obj.layout80:setName("layout80");

    obj.edit280 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout80);
    obj.edit280:setLeft(5);
    obj.edit280:setTop(0);
    obj.edit280:setWidth(190);
    obj.edit280:setHeight(25);
    obj.edit280:setField("Pericia_Geral_22");
    obj.edit280:setName("edit280");

    obj.edit281 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout80);
    obj.edit281:setLeft(195);
    obj.edit281:setTop(0);
    obj.edit281:setWidth(50);
    obj.edit281:setHeight(25);
    obj.edit281:setField("Pericia_Geral_Pontos_22");
    obj.edit281:setName("edit281");

    obj.edit282 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout80);
    obj.edit282:setLeft(245);
    obj.edit282:setTop(0);
    obj.edit282:setWidth(50);
    obj.edit282:setHeight(25);
    obj.edit282:setField("Pericia_Geral_HAB22");
    obj.edit282:setName("edit282");

    obj.edit283 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout80);
    obj.edit283:setLeft(295);
    obj.edit283:setTop(0);
    obj.edit283:setWidth(50);
    obj.edit283:setHeight(25);
    obj.edit283:setField("Pericia_Geral_MOD_22");
    obj.edit283:setName("edit283");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout58);
    obj.layout81:setLeft(0);
    obj.layout81:setTop(580);
    obj.layout81:setWidth(350);
    obj.layout81:setHeight(25);
    obj.layout81:setName("layout81");

    obj.edit284 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout81);
    obj.edit284:setLeft(5);
    obj.edit284:setTop(0);
    obj.edit284:setWidth(190);
    obj.edit284:setHeight(25);
    obj.edit284:setField("Pericia_Geral_23");
    obj.edit284:setName("edit284");

    obj.edit285 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout81);
    obj.edit285:setLeft(195);
    obj.edit285:setTop(0);
    obj.edit285:setWidth(50);
    obj.edit285:setHeight(25);
    obj.edit285:setField("Pericia_Geral_Pontos_23");
    obj.edit285:setName("edit285");

    obj.edit286 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout81);
    obj.edit286:setLeft(245);
    obj.edit286:setTop(0);
    obj.edit286:setWidth(50);
    obj.edit286:setHeight(25);
    obj.edit286:setField("Pericia_Geral_HAB23");
    obj.edit286:setName("edit286");

    obj.edit287 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout81);
    obj.edit287:setLeft(295);
    obj.edit287:setTop(0);
    obj.edit287:setWidth(50);
    obj.edit287:setHeight(25);
    obj.edit287:setField("Pericia_Geral_MOD_23");
    obj.edit287:setName("edit287");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.scrollBox2);
    obj.layout82:setLeft(620);
    obj.layout82:setTop(0);
    obj.layout82:setWidth(150);
    obj.layout82:setHeight(255);
    obj.layout82:setName("layout82");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout82);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setXradius(5);
    obj.rectangle11:setYradius(5);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setName("rectangle11");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout82);
    obj.label102:setLeft(0);
    obj.label102:setTop(5);
    obj.label102:setWidth(150);
    obj.label102:setHeight(20);
    obj.label102:setText("TALENTOS LADINOS");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout82);
    obj.label103:setLeft(5);
    obj.label103:setTop(25);
    obj.label103:setWidth(100);
    obj.label103:setHeight(20);
    obj.label103:setFontSize(13);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setText("Furtar Bolsos");
    obj.label103:setName("label103");

    obj.edit288 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout82);
    obj.edit288:setLeft(105);
    obj.edit288:setTop(25);
    obj.edit288:setWidth(40);
    obj.edit288:setHeight(25);
    obj.edit288:setField("Talento_Furto");
    obj.edit288:setName("edit288");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout82);
    obj.label104:setLeft(5);
    obj.label104:setTop(50);
    obj.label104:setWidth(100);
    obj.label104:setHeight(20);
    obj.label104:setFontSize(13);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setText("Abrir Fechaduras");
    obj.label104:setName("label104");

    obj.edit289 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout82);
    obj.edit289:setLeft(105);
    obj.edit289:setTop(50);
    obj.edit289:setWidth(40);
    obj.edit289:setHeight(25);
    obj.edit289:setField("Talento_Abrir_Fechaduras");
    obj.edit289:setName("edit289");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout82);
    obj.label105:setLeft(5);
    obj.label105:setTop(75);
    obj.label105:setWidth(100);
    obj.label105:setHeight(20);
    obj.label105:setFontSize(8);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setText("Achar/Desarmar Armadilhas");
    obj.label105:setName("label105");

    obj.edit290 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout82);
    obj.edit290:setLeft(105);
    obj.edit290:setTop(75);
    obj.edit290:setWidth(40);
    obj.edit290:setHeight(25);
    obj.edit290:setField("Talento_Armadilhas");
    obj.edit290:setName("edit290");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout82);
    obj.label106:setLeft(5);
    obj.label106:setTop(100);
    obj.label106:setWidth(100);
    obj.label106:setHeight(20);
    obj.label106:setFontSize(10);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setText("Mover-se em Silêncio");
    obj.label106:setName("label106");

    obj.edit291 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout82);
    obj.edit291:setLeft(105);
    obj.edit291:setTop(100);
    obj.edit291:setWidth(40);
    obj.edit291:setHeight(25);
    obj.edit291:setField("Talento_Furtividade");
    obj.edit291:setName("edit291");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout82);
    obj.label107:setLeft(5);
    obj.label107:setTop(125);
    obj.label107:setWidth(100);
    obj.label107:setHeight(20);
    obj.label107:setFontSize(10);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setText("Esconder-se nas Sombras");
    obj.label107:setName("label107");

    obj.edit292 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout82);
    obj.edit292:setLeft(105);
    obj.edit292:setTop(125);
    obj.edit292:setWidth(40);
    obj.edit292:setHeight(25);
    obj.edit292:setField("Talento_Esconder");
    obj.edit292:setName("edit292");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout82);
    obj.label108:setLeft(5);
    obj.label108:setTop(150);
    obj.label108:setWidth(100);
    obj.label108:setHeight(20);
    obj.label108:setFontSize(13);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setText("Ouvir Ruídos");
    obj.label108:setName("label108");

    obj.edit293 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout82);
    obj.edit293:setLeft(105);
    obj.edit293:setTop(150);
    obj.edit293:setWidth(40);
    obj.edit293:setHeight(25);
    obj.edit293:setField("Talento_Ouvir");
    obj.edit293:setName("edit293");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout82);
    obj.label109:setLeft(5);
    obj.label109:setTop(175);
    obj.label109:setWidth(100);
    obj.label109:setHeight(20);
    obj.label109:setFontSize(13);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setText("Escalar Muros");
    obj.label109:setName("label109");

    obj.edit294 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.layout82);
    obj.edit294:setLeft(105);
    obj.edit294:setTop(175);
    obj.edit294:setWidth(40);
    obj.edit294:setHeight(25);
    obj.edit294:setField("Talento_Escalar");
    obj.edit294:setName("edit294");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout82);
    obj.label110:setLeft(5);
    obj.label110:setTop(200);
    obj.label110:setWidth(100);
    obj.label110:setHeight(20);
    obj.label110:setFontSize(11);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setText("Decifrar Linguagens");
    obj.label110:setName("label110");

    obj.edit295 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.layout82);
    obj.edit295:setLeft(105);
    obj.edit295:setTop(200);
    obj.edit295:setWidth(40);
    obj.edit295:setHeight(25);
    obj.edit295:setField("Talento_Decifrar");
    obj.edit295:setName("edit295");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout82);
    obj.label111:setLeft(5);
    obj.label111:setTop(225);
    obj.label111:setWidth(100);
    obj.label111:setHeight(20);
    obj.label111:setFontSize(11);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setText("Ataque pelas Costas");
    obj.label111:setName("label111");

    obj.edit296 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit296:setParent(obj.layout82);
    obj.edit296:setLeft(105);
    obj.edit296:setTop(225);
    obj.edit296:setWidth(40);
    obj.edit296:setHeight(25);
    obj.edit296:setField("Talento_Ataque_Furtivo");
    obj.edit296:setName("edit296");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.scrollBox2);
    obj.layout83:setLeft(620);
    obj.layout83:setTop(259);
    obj.layout83:setWidth(150);
    obj.layout83:setHeight(355);
    obj.layout83:setName("layout83");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout83);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(5);
    obj.rectangle12:setYradius(5);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout83);
    obj.label112:setLeft(0);
    obj.label112:setTop(5);
    obj.label112:setWidth(150);
    obj.label112:setHeight(20);
    obj.label112:setText("PODER DA FÉ");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout83);
    obj.label113:setLeft(5);
    obj.label113:setTop(25);
    obj.label113:setWidth(100);
    obj.label113:setHeight(20);
    obj.label113:setFontSize(13);
    obj.label113:setHorzTextAlign("center");
    obj.label113:setText("Esqueleto (1DV)");
    obj.label113:setName("label113");

    obj.edit297 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit297:setParent(obj.layout83);
    obj.edit297:setLeft(105);
    obj.edit297:setTop(25);
    obj.edit297:setWidth(40);
    obj.edit297:setHeight(25);
    obj.edit297:setField("Fe1");
    obj.edit297:setName("edit297");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout83);
    obj.label114:setLeft(5);
    obj.label114:setTop(50);
    obj.label114:setWidth(100);
    obj.label114:setHeight(20);
    obj.label114:setFontSize(13);
    obj.label114:setHorzTextAlign("center");
    obj.label114:setText("Zumbi");
    obj.label114:setName("label114");

    obj.edit298 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit298:setParent(obj.layout83);
    obj.edit298:setLeft(105);
    obj.edit298:setTop(50);
    obj.edit298:setWidth(40);
    obj.edit298:setHeight(25);
    obj.edit298:setField("Fe2");
    obj.edit298:setName("edit298");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout83);
    obj.label115:setLeft(5);
    obj.label115:setTop(75);
    obj.label115:setWidth(100);
    obj.label115:setHeight(20);
    obj.label115:setFontSize(13);
    obj.label115:setHorzTextAlign("center");
    obj.label115:setText("Carniçal (2DV)");
    obj.label115:setName("label115");

    obj.edit299 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit299:setParent(obj.layout83);
    obj.edit299:setLeft(105);
    obj.edit299:setTop(75);
    obj.edit299:setWidth(40);
    obj.edit299:setHeight(25);
    obj.edit299:setField("Fe3");
    obj.edit299:setName("edit299");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout83);
    obj.label116:setLeft(5);
    obj.label116:setTop(100);
    obj.label116:setWidth(100);
    obj.label116:setHeight(20);
    obj.label116:setFontSize(13);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setText("Sombra (3-4DV)");
    obj.label116:setName("label116");

    obj.edit300 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit300:setParent(obj.layout83);
    obj.edit300:setLeft(105);
    obj.edit300:setTop(100);
    obj.edit300:setWidth(40);
    obj.edit300:setHeight(25);
    obj.edit300:setField("Fe4");
    obj.edit300:setName("edit300");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout83);
    obj.label117:setLeft(5);
    obj.label117:setTop(125);
    obj.label117:setWidth(100);
    obj.label117:setHeight(20);
    obj.label117:setFontSize(13);
    obj.label117:setHorzTextAlign("center");
    obj.label117:setText("Vulto (5DV)");
    obj.label117:setName("label117");

    obj.edit301 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit301:setParent(obj.layout83);
    obj.edit301:setLeft(105);
    obj.edit301:setTop(125);
    obj.edit301:setWidth(40);
    obj.edit301:setHeight(25);
    obj.edit301:setField("Fe5");
    obj.edit301:setName("edit301");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout83);
    obj.label118:setLeft(5);
    obj.label118:setTop(150);
    obj.label118:setWidth(100);
    obj.label118:setHeight(20);
    obj.label118:setFontSize(13);
    obj.label118:setHorzTextAlign("center");
    obj.label118:setText("Carniçal");
    obj.label118:setName("label118");

    obj.edit302 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit302:setParent(obj.layout83);
    obj.edit302:setLeft(105);
    obj.edit302:setTop(150);
    obj.edit302:setWidth(40);
    obj.edit302:setHeight(25);
    obj.edit302:setField("Fe6");
    obj.edit302:setName("edit302");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout83);
    obj.label119:setLeft(5);
    obj.label119:setTop(175);
    obj.label119:setWidth(100);
    obj.label119:setHeight(20);
    obj.label119:setFontSize(13);
    obj.label119:setHorzTextAlign("center");
    obj.label119:setText("Aparição (6DV)");
    obj.label119:setName("label119");

    obj.edit303 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit303:setParent(obj.layout83);
    obj.edit303:setLeft(105);
    obj.edit303:setTop(175);
    obj.edit303:setWidth(40);
    obj.edit303:setHeight(25);
    obj.edit303:setField("Fe7");
    obj.edit303:setName("edit303");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout83);
    obj.label120:setLeft(5);
    obj.label120:setTop(200);
    obj.label120:setWidth(100);
    obj.label120:setHeight(20);
    obj.label120:setFontSize(13);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setText("Múmia (7DV)");
    obj.label120:setName("label120");

    obj.edit304 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit304:setParent(obj.layout83);
    obj.edit304:setLeft(105);
    obj.edit304:setTop(200);
    obj.edit304:setWidth(40);
    obj.edit304:setHeight(25);
    obj.edit304:setField("Fe8");
    obj.edit304:setName("edit304");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout83);
    obj.label121:setLeft(5);
    obj.label121:setTop(225);
    obj.label121:setWidth(100);
    obj.label121:setHeight(20);
    obj.label121:setFontSize(13);
    obj.label121:setHorzTextAlign("center");
    obj.label121:setText("Espectro (8DV)");
    obj.label121:setName("label121");

    obj.edit305 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit305:setParent(obj.layout83);
    obj.edit305:setLeft(105);
    obj.edit305:setTop(225);
    obj.edit305:setWidth(40);
    obj.edit305:setHeight(25);
    obj.edit305:setField("Fe9");
    obj.edit305:setName("edit305");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout83);
    obj.label122:setLeft(5);
    obj.label122:setTop(250);
    obj.label122:setWidth(100);
    obj.label122:setHeight(20);
    obj.label122:setFontSize(13);
    obj.label122:setHorzTextAlign("center");
    obj.label122:setText("Vampiro (9DV)");
    obj.label122:setName("label122");

    obj.edit306 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit306:setParent(obj.layout83);
    obj.edit306:setLeft(105);
    obj.edit306:setTop(250);
    obj.edit306:setWidth(40);
    obj.edit306:setHeight(25);
    obj.edit306:setField("Fe10");
    obj.edit306:setName("edit306");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout83);
    obj.label123:setLeft(5);
    obj.label123:setTop(275);
    obj.label123:setWidth(100);
    obj.label123:setHeight(20);
    obj.label123:setFontSize(13);
    obj.label123:setHorzTextAlign("center");
    obj.label123:setText("Fantasma (10DV)");
    obj.label123:setName("label123");

    obj.edit307 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit307:setParent(obj.layout83);
    obj.edit307:setLeft(105);
    obj.edit307:setTop(275);
    obj.edit307:setWidth(40);
    obj.edit307:setHeight(25);
    obj.edit307:setField("Fe11");
    obj.edit307:setName("edit307");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout83);
    obj.label124:setLeft(5);
    obj.label124:setTop(300);
    obj.label124:setWidth(100);
    obj.label124:setHeight(20);
    obj.label124:setFontSize(13);
    obj.label124:setHorzTextAlign("center");
    obj.label124:setText("Lich (11DV+)");
    obj.label124:setName("label124");

    obj.edit308 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit308:setParent(obj.layout83);
    obj.edit308:setLeft(105);
    obj.edit308:setTop(300);
    obj.edit308:setWidth(40);
    obj.edit308:setHeight(25);
    obj.edit308:setField("Fe12");
    obj.edit308:setName("edit308");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout83);
    obj.label125:setLeft(5);
    obj.label125:setTop(325);
    obj.label125:setWidth(100);
    obj.label125:setHeight(20);
    obj.label125:setFontSize(13);
    obj.label125:setHorzTextAlign("center");
    obj.label125:setText("Especial");
    obj.label125:setName("label125");

    obj.edit309 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit309:setParent(obj.layout83);
    obj.edit309:setLeft(105);
    obj.edit309:setTop(325);
    obj.edit309:setWidth(40);
    obj.edit309:setHeight(25);
    obj.edit309:setField("Fe13");
    obj.edit309:setName("edit309");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.scrollBox2);
    obj.layout84:setLeft(780);
    obj.layout84:setTop(0);
    obj.layout84:setWidth(265);
    obj.layout84:setHeight(300);
    obj.layout84:setName("layout84");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout84);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setXradius(5);
    obj.rectangle13:setYradius(5);
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setName("rectangle13");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout84);
    obj.label126:setLeft(0);
    obj.label126:setTop(0);
    obj.label126:setWidth(265);
    obj.label126:setHeight(20);
    obj.label126:setText("Habilidades Especificas");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout84);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(255);
    obj.textEditor1:setHeight(265);
    obj.textEditor1:setField("HE1");
    obj.textEditor1:setName("textEditor1");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.scrollBox2);
    obj.layout85:setLeft(780);
    obj.layout85:setTop(310);
    obj.layout85:setWidth(265);
    obj.layout85:setHeight(300);
    obj.layout85:setName("layout85");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout85);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setXradius(5);
    obj.rectangle14:setYradius(5);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setName("rectangle14");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout85);
    obj.label127:setLeft(0);
    obj.label127:setTop(0);
    obj.label127:setWidth(265);
    obj.label127:setHeight(20);
    obj.label127:setText("Habilidades Especificas");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout85);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(255);
    obj.textEditor2:setHeight(265);
    obj.textEditor2:setField("HE3");
    obj.textEditor2:setName("textEditor2");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.scrollBox2);
    obj.layout86:setLeft(1055);
    obj.layout86:setTop(0);
    obj.layout86:setWidth(265);
    obj.layout86:setHeight(300);
    obj.layout86:setName("layout86");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout86);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setXradius(5);
    obj.rectangle15:setYradius(5);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout86);
    obj.label128:setLeft(0);
    obj.label128:setTop(0);
    obj.label128:setWidth(265);
    obj.label128:setHeight(20);
    obj.label128:setText("Habilidades Especificas");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout86);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(255);
    obj.textEditor3:setHeight(265);
    obj.textEditor3:setField("HE2");
    obj.textEditor3:setName("textEditor3");

    obj.layout87 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.scrollBox2);
    obj.layout87:setLeft(1055);
    obj.layout87:setTop(310);
    obj.layout87:setWidth(265);
    obj.layout87:setHeight(300);
    obj.layout87:setName("layout87");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout87);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("black");
    obj.rectangle16:setXradius(5);
    obj.rectangle16:setYradius(5);
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setName("rectangle16");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout87);
    obj.label129:setLeft(0);
    obj.label129:setTop(0);
    obj.label129:setWidth(265);
    obj.label129:setHeight(20);
    obj.label129:setText("Habilidades Especificas");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout87);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(255);
    obj.textEditor4:setHeight(265);
    obj.textEditor4:setField("HE4");
    obj.textEditor4:setName("textEditor4");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox2);
    obj.image4:setAlign("client");
    obj.image4:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20ADnD%20releases/imagens/block.png");
    obj.image4:setStyle("autoFit");
    obj.image4:setName("image4");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Inventario");
    obj.tab3:setName("tab3");

    obj.frmADnD3 = gui.fromHandle(_obj_newObject("form"));
    obj.frmADnD3:setParent(obj.tab3);
    obj.frmADnD3:setName("frmADnD3");
    obj.frmADnD3:setAlign("client");
    obj.frmADnD3:setTheme("dark");
    obj.frmADnD3:setMargins({top=1});

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmADnD3);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");


			local function sumCusto();
				if sheet~=nil then
					local mod = (tonumber(sheet.Equipamento_Custo_1_1) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_2) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_3) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_4) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_5) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_6) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_7) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_8) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_9) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_10) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_11) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_12) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_13) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_14) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_15) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_16) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_17) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_18) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_19) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_20) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_21) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_22) or 0) +
								(tonumber(sheet.Equipamento_Custo_2_1) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_2) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_3) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_4) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_5) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_6) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_7) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_8) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_9) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_10) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_11) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_12) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_13) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_14) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_15) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_16) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_17) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_18) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_19) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_20) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_21) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_22) or 0) +
								(tonumber(sheet.Equipamento_Custo_3_1) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_2) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_3) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_4) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_5) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_6) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_7) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_8) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_9) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_10) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_11) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_12) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_13) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_14) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_15) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_16) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_17) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_18) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_19) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_20) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_21) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_22) or 0);
					sheet.Custo_Total = mod;
				end;
			end;
		



			local function sumPeso();
				if sheet~=nil then
					local mod = (tonumber(sheet.Equipamento_Peso_1_1) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_2) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_3) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_4) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_5) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_6) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_7) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_8) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_9) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_10) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_11) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_12) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_13) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_14) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_15) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_16) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_17) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_18) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_19) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_20) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_21) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_22) or 0) +
								(tonumber(sheet.Equipamento_Peso_2_1) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_2) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_3) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_4) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_5) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_6) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_7) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_8) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_9) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_10) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_11) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_12) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_13) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_14) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_15) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_16) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_17) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_18) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_19) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_20) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_21) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_22) or 0) +
								(tonumber(sheet.Equipamento_Peso_3_1) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_2) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_3) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_4) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_5) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_6) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_7) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_8) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_9) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_10) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_11) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_12) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_13) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_14) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_15) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_16) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_17) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_18) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_19) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_20) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_21) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_22) or 0);
					sheet.Peso_Total = mod;
				end;
			end;
		


    obj.layout88 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.scrollBox3);
    obj.layout88:setLeft(0);
    obj.layout88:setTop(0);
    obj.layout88:setWidth(300);
    obj.layout88:setHeight(610);
    obj.layout88:setName("layout88");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout88);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("black");
    obj.rectangle17:setXradius(5);
    obj.rectangle17:setYradius(5);
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setName("rectangle17");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout88);
    obj.label130:setLeft(0);
    obj.label130:setTop(5);
    obj.label130:setWidth(300);
    obj.label130:setHeight(20);
    obj.label130:setText("EQUIPAMENTOS");
    obj.label130:setHorzTextAlign("center");
    obj.label130:setName("label130");

    obj.layout89 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout88);
    obj.layout89:setLeft(0);
    obj.layout89:setTop(30);
    obj.layout89:setWidth(300);
    obj.layout89:setHeight(25);
    obj.layout89:setName("layout89");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout89);
    obj.label131:setLeft(5);
    obj.label131:setTop(0);
    obj.label131:setWidth(190);
    obj.label131:setHeight(25);
    obj.label131:setHorzTextAlign("center");
    obj.label131:setText("Item");
    obj.label131:setName("label131");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout89);
    obj.label132:setLeft(195);
    obj.label132:setTop(0);
    obj.label132:setWidth(50);
    obj.label132:setHeight(25);
    obj.label132:setHorzTextAlign("center");
    obj.label132:setText("Custo");
    obj.label132:setName("label132");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout89);
    obj.label133:setLeft(245);
    obj.label133:setTop(0);
    obj.label133:setWidth(50);
    obj.label133:setHeight(25);
    obj.label133:setHorzTextAlign("center");
    obj.label133:setText("Peso");
    obj.label133:setName("label133");

    obj.layout90 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout88);
    obj.layout90:setLeft(0);
    obj.layout90:setTop(55);
    obj.layout90:setWidth(300);
    obj.layout90:setHeight(25);
    obj.layout90:setName("layout90");

    obj.edit310 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit310:setParent(obj.layout90);
    obj.edit310:setLeft(5);
    obj.edit310:setTop(0);
    obj.edit310:setWidth(190);
    obj.edit310:setHeight(25);
    obj.edit310:setField("Equipamento_1_1");
    obj.edit310:setName("edit310");

    obj.edit311 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit311:setParent(obj.layout90);
    obj.edit311:setLeft(195);
    obj.edit311:setTop(0);
    obj.edit311:setWidth(50);
    obj.edit311:setHeight(25);
    obj.edit311:setField("Equipamento_Custo_1_1");
    obj.edit311:setName("edit311");

    obj.edit312 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit312:setParent(obj.layout90);
    obj.edit312:setLeft(245);
    obj.edit312:setTop(0);
    obj.edit312:setWidth(50);
    obj.edit312:setHeight(25);
    obj.edit312:setField("Equipamento_Peso_1_1");
    obj.edit312:setName("edit312");

    obj.layout91 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout88);
    obj.layout91:setLeft(0);
    obj.layout91:setTop(80);
    obj.layout91:setWidth(300);
    obj.layout91:setHeight(25);
    obj.layout91:setName("layout91");

    obj.edit313 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit313:setParent(obj.layout91);
    obj.edit313:setLeft(5);
    obj.edit313:setTop(0);
    obj.edit313:setWidth(190);
    obj.edit313:setHeight(25);
    obj.edit313:setField("Equipamento_1_2");
    obj.edit313:setName("edit313");

    obj.edit314 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit314:setParent(obj.layout91);
    obj.edit314:setLeft(195);
    obj.edit314:setTop(0);
    obj.edit314:setWidth(50);
    obj.edit314:setHeight(25);
    obj.edit314:setField("Equipamento_Custo_1_2");
    obj.edit314:setName("edit314");

    obj.edit315 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit315:setParent(obj.layout91);
    obj.edit315:setLeft(245);
    obj.edit315:setTop(0);
    obj.edit315:setWidth(50);
    obj.edit315:setHeight(25);
    obj.edit315:setField("Equipamento_Peso_1_2");
    obj.edit315:setName("edit315");

    obj.layout92 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout88);
    obj.layout92:setLeft(0);
    obj.layout92:setTop(105);
    obj.layout92:setWidth(300);
    obj.layout92:setHeight(25);
    obj.layout92:setName("layout92");

    obj.edit316 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit316:setParent(obj.layout92);
    obj.edit316:setLeft(5);
    obj.edit316:setTop(0);
    obj.edit316:setWidth(190);
    obj.edit316:setHeight(25);
    obj.edit316:setField("Equipamento_1_3");
    obj.edit316:setName("edit316");

    obj.edit317 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit317:setParent(obj.layout92);
    obj.edit317:setLeft(195);
    obj.edit317:setTop(0);
    obj.edit317:setWidth(50);
    obj.edit317:setHeight(25);
    obj.edit317:setField("Equipamento_Custo_1_3");
    obj.edit317:setName("edit317");

    obj.edit318 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit318:setParent(obj.layout92);
    obj.edit318:setLeft(245);
    obj.edit318:setTop(0);
    obj.edit318:setWidth(50);
    obj.edit318:setHeight(25);
    obj.edit318:setField("Equipamento_Peso_1_3");
    obj.edit318:setName("edit318");

    obj.layout93 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout88);
    obj.layout93:setLeft(0);
    obj.layout93:setTop(130);
    obj.layout93:setWidth(300);
    obj.layout93:setHeight(25);
    obj.layout93:setName("layout93");

    obj.edit319 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit319:setParent(obj.layout93);
    obj.edit319:setLeft(5);
    obj.edit319:setTop(0);
    obj.edit319:setWidth(190);
    obj.edit319:setHeight(25);
    obj.edit319:setField("Equipamento_1_4");
    obj.edit319:setName("edit319");

    obj.edit320 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit320:setParent(obj.layout93);
    obj.edit320:setLeft(195);
    obj.edit320:setTop(0);
    obj.edit320:setWidth(50);
    obj.edit320:setHeight(25);
    obj.edit320:setField("Equipamento_Custo_1_4");
    obj.edit320:setName("edit320");

    obj.edit321 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit321:setParent(obj.layout93);
    obj.edit321:setLeft(245);
    obj.edit321:setTop(0);
    obj.edit321:setWidth(50);
    obj.edit321:setHeight(25);
    obj.edit321:setField("Equipamento_Peso_1_4");
    obj.edit321:setName("edit321");

    obj.layout94 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout88);
    obj.layout94:setLeft(0);
    obj.layout94:setTop(155);
    obj.layout94:setWidth(300);
    obj.layout94:setHeight(25);
    obj.layout94:setName("layout94");

    obj.edit322 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit322:setParent(obj.layout94);
    obj.edit322:setLeft(5);
    obj.edit322:setTop(0);
    obj.edit322:setWidth(190);
    obj.edit322:setHeight(25);
    obj.edit322:setField("Equipamento_1_5");
    obj.edit322:setName("edit322");

    obj.edit323 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit323:setParent(obj.layout94);
    obj.edit323:setLeft(195);
    obj.edit323:setTop(0);
    obj.edit323:setWidth(50);
    obj.edit323:setHeight(25);
    obj.edit323:setField("Equipamento_Custo_1_5");
    obj.edit323:setName("edit323");

    obj.edit324 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit324:setParent(obj.layout94);
    obj.edit324:setLeft(245);
    obj.edit324:setTop(0);
    obj.edit324:setWidth(50);
    obj.edit324:setHeight(25);
    obj.edit324:setField("Equipamento_Peso_1_5");
    obj.edit324:setName("edit324");

    obj.layout95 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout88);
    obj.layout95:setLeft(0);
    obj.layout95:setTop(180);
    obj.layout95:setWidth(300);
    obj.layout95:setHeight(25);
    obj.layout95:setName("layout95");

    obj.edit325 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit325:setParent(obj.layout95);
    obj.edit325:setLeft(5);
    obj.edit325:setTop(0);
    obj.edit325:setWidth(190);
    obj.edit325:setHeight(25);
    obj.edit325:setField("Equipamento_1_6");
    obj.edit325:setName("edit325");

    obj.edit326 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit326:setParent(obj.layout95);
    obj.edit326:setLeft(195);
    obj.edit326:setTop(0);
    obj.edit326:setWidth(50);
    obj.edit326:setHeight(25);
    obj.edit326:setField("Equipamento_Custo_1_6");
    obj.edit326:setName("edit326");

    obj.edit327 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit327:setParent(obj.layout95);
    obj.edit327:setLeft(245);
    obj.edit327:setTop(0);
    obj.edit327:setWidth(50);
    obj.edit327:setHeight(25);
    obj.edit327:setField("Equipamento_Peso_1_6");
    obj.edit327:setName("edit327");

    obj.layout96 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout88);
    obj.layout96:setLeft(0);
    obj.layout96:setTop(205);
    obj.layout96:setWidth(300);
    obj.layout96:setHeight(25);
    obj.layout96:setName("layout96");

    obj.edit328 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit328:setParent(obj.layout96);
    obj.edit328:setLeft(5);
    obj.edit328:setTop(0);
    obj.edit328:setWidth(190);
    obj.edit328:setHeight(25);
    obj.edit328:setField("Equipamento_1_7");
    obj.edit328:setName("edit328");

    obj.edit329 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit329:setParent(obj.layout96);
    obj.edit329:setLeft(195);
    obj.edit329:setTop(0);
    obj.edit329:setWidth(50);
    obj.edit329:setHeight(25);
    obj.edit329:setField("Equipamento_Custo_1_7");
    obj.edit329:setName("edit329");

    obj.edit330 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit330:setParent(obj.layout96);
    obj.edit330:setLeft(245);
    obj.edit330:setTop(0);
    obj.edit330:setWidth(50);
    obj.edit330:setHeight(25);
    obj.edit330:setField("Equipamento_Peso_1_7");
    obj.edit330:setName("edit330");

    obj.layout97 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout88);
    obj.layout97:setLeft(0);
    obj.layout97:setTop(230);
    obj.layout97:setWidth(300);
    obj.layout97:setHeight(25);
    obj.layout97:setName("layout97");

    obj.edit331 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit331:setParent(obj.layout97);
    obj.edit331:setLeft(5);
    obj.edit331:setTop(0);
    obj.edit331:setWidth(190);
    obj.edit331:setHeight(25);
    obj.edit331:setField("Equipamento_1_8");
    obj.edit331:setName("edit331");

    obj.edit332 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit332:setParent(obj.layout97);
    obj.edit332:setLeft(195);
    obj.edit332:setTop(0);
    obj.edit332:setWidth(50);
    obj.edit332:setHeight(25);
    obj.edit332:setField("Equipamento_Custo_1_8");
    obj.edit332:setName("edit332");

    obj.edit333 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit333:setParent(obj.layout97);
    obj.edit333:setLeft(245);
    obj.edit333:setTop(0);
    obj.edit333:setWidth(50);
    obj.edit333:setHeight(25);
    obj.edit333:setField("Equipamento_Peso_1_8");
    obj.edit333:setName("edit333");

    obj.layout98 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout88);
    obj.layout98:setLeft(0);
    obj.layout98:setTop(255);
    obj.layout98:setWidth(300);
    obj.layout98:setHeight(25);
    obj.layout98:setName("layout98");

    obj.edit334 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit334:setParent(obj.layout98);
    obj.edit334:setLeft(5);
    obj.edit334:setTop(0);
    obj.edit334:setWidth(190);
    obj.edit334:setHeight(25);
    obj.edit334:setField("Equipamento_1_9");
    obj.edit334:setName("edit334");

    obj.edit335 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit335:setParent(obj.layout98);
    obj.edit335:setLeft(195);
    obj.edit335:setTop(0);
    obj.edit335:setWidth(50);
    obj.edit335:setHeight(25);
    obj.edit335:setField("Equipamento_Custo_1_9");
    obj.edit335:setName("edit335");

    obj.edit336 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit336:setParent(obj.layout98);
    obj.edit336:setLeft(245);
    obj.edit336:setTop(0);
    obj.edit336:setWidth(50);
    obj.edit336:setHeight(25);
    obj.edit336:setField("Equipamento_Peso_1_9");
    obj.edit336:setName("edit336");

    obj.layout99 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout88);
    obj.layout99:setLeft(0);
    obj.layout99:setTop(280);
    obj.layout99:setWidth(300);
    obj.layout99:setHeight(25);
    obj.layout99:setName("layout99");

    obj.edit337 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit337:setParent(obj.layout99);
    obj.edit337:setLeft(5);
    obj.edit337:setTop(0);
    obj.edit337:setWidth(190);
    obj.edit337:setHeight(25);
    obj.edit337:setField("Equipamento_1_10");
    obj.edit337:setName("edit337");

    obj.edit338 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit338:setParent(obj.layout99);
    obj.edit338:setLeft(195);
    obj.edit338:setTop(0);
    obj.edit338:setWidth(50);
    obj.edit338:setHeight(25);
    obj.edit338:setField("Equipamento_Custo_1_10");
    obj.edit338:setName("edit338");

    obj.edit339 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit339:setParent(obj.layout99);
    obj.edit339:setLeft(245);
    obj.edit339:setTop(0);
    obj.edit339:setWidth(50);
    obj.edit339:setHeight(25);
    obj.edit339:setField("Equipamento_Peso_1_10");
    obj.edit339:setName("edit339");

    obj.layout100 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout88);
    obj.layout100:setLeft(0);
    obj.layout100:setTop(305);
    obj.layout100:setWidth(300);
    obj.layout100:setHeight(25);
    obj.layout100:setName("layout100");

    obj.edit340 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit340:setParent(obj.layout100);
    obj.edit340:setLeft(5);
    obj.edit340:setTop(0);
    obj.edit340:setWidth(190);
    obj.edit340:setHeight(25);
    obj.edit340:setField("Equipamento_1_11");
    obj.edit340:setName("edit340");

    obj.edit341 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit341:setParent(obj.layout100);
    obj.edit341:setLeft(195);
    obj.edit341:setTop(0);
    obj.edit341:setWidth(50);
    obj.edit341:setHeight(25);
    obj.edit341:setField("Equipamento_Custo_1_11");
    obj.edit341:setName("edit341");

    obj.edit342 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit342:setParent(obj.layout100);
    obj.edit342:setLeft(245);
    obj.edit342:setTop(0);
    obj.edit342:setWidth(50);
    obj.edit342:setHeight(25);
    obj.edit342:setField("Equipamento_Peso_1_11");
    obj.edit342:setName("edit342");

    obj.layout101 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout88);
    obj.layout101:setLeft(0);
    obj.layout101:setTop(330);
    obj.layout101:setWidth(300);
    obj.layout101:setHeight(25);
    obj.layout101:setName("layout101");

    obj.edit343 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit343:setParent(obj.layout101);
    obj.edit343:setLeft(5);
    obj.edit343:setTop(0);
    obj.edit343:setWidth(190);
    obj.edit343:setHeight(25);
    obj.edit343:setField("Equipamento_1_12");
    obj.edit343:setName("edit343");

    obj.edit344 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit344:setParent(obj.layout101);
    obj.edit344:setLeft(195);
    obj.edit344:setTop(0);
    obj.edit344:setWidth(50);
    obj.edit344:setHeight(25);
    obj.edit344:setField("Equipamento_Custo_1_12");
    obj.edit344:setName("edit344");

    obj.edit345 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit345:setParent(obj.layout101);
    obj.edit345:setLeft(245);
    obj.edit345:setTop(0);
    obj.edit345:setWidth(50);
    obj.edit345:setHeight(25);
    obj.edit345:setField("Equipamento_Peso_1_12");
    obj.edit345:setName("edit345");

    obj.layout102 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout88);
    obj.layout102:setLeft(0);
    obj.layout102:setTop(355);
    obj.layout102:setWidth(300);
    obj.layout102:setHeight(25);
    obj.layout102:setName("layout102");

    obj.edit346 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit346:setParent(obj.layout102);
    obj.edit346:setLeft(5);
    obj.edit346:setTop(0);
    obj.edit346:setWidth(190);
    obj.edit346:setHeight(25);
    obj.edit346:setField("Equipamento_1_13");
    obj.edit346:setName("edit346");

    obj.edit347 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit347:setParent(obj.layout102);
    obj.edit347:setLeft(195);
    obj.edit347:setTop(0);
    obj.edit347:setWidth(50);
    obj.edit347:setHeight(25);
    obj.edit347:setField("Equipamento_Custo_1_13");
    obj.edit347:setName("edit347");

    obj.edit348 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit348:setParent(obj.layout102);
    obj.edit348:setLeft(245);
    obj.edit348:setTop(0);
    obj.edit348:setWidth(50);
    obj.edit348:setHeight(25);
    obj.edit348:setField("Equipamento_Peso_1_13");
    obj.edit348:setName("edit348");

    obj.layout103 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout88);
    obj.layout103:setLeft(0);
    obj.layout103:setTop(380);
    obj.layout103:setWidth(300);
    obj.layout103:setHeight(25);
    obj.layout103:setName("layout103");

    obj.edit349 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit349:setParent(obj.layout103);
    obj.edit349:setLeft(5);
    obj.edit349:setTop(0);
    obj.edit349:setWidth(190);
    obj.edit349:setHeight(25);
    obj.edit349:setField("Equipamento_1_14");
    obj.edit349:setName("edit349");

    obj.edit350 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit350:setParent(obj.layout103);
    obj.edit350:setLeft(195);
    obj.edit350:setTop(0);
    obj.edit350:setWidth(50);
    obj.edit350:setHeight(25);
    obj.edit350:setField("Equipamento_Custo_1_14");
    obj.edit350:setName("edit350");

    obj.edit351 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit351:setParent(obj.layout103);
    obj.edit351:setLeft(245);
    obj.edit351:setTop(0);
    obj.edit351:setWidth(50);
    obj.edit351:setHeight(25);
    obj.edit351:setField("Equipamento_Peso_1_14");
    obj.edit351:setName("edit351");

    obj.layout104 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout88);
    obj.layout104:setLeft(0);
    obj.layout104:setTop(405);
    obj.layout104:setWidth(300);
    obj.layout104:setHeight(25);
    obj.layout104:setName("layout104");

    obj.edit352 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit352:setParent(obj.layout104);
    obj.edit352:setLeft(5);
    obj.edit352:setTop(0);
    obj.edit352:setWidth(190);
    obj.edit352:setHeight(25);
    obj.edit352:setField("Equipamento_1_15");
    obj.edit352:setName("edit352");

    obj.edit353 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit353:setParent(obj.layout104);
    obj.edit353:setLeft(195);
    obj.edit353:setTop(0);
    obj.edit353:setWidth(50);
    obj.edit353:setHeight(25);
    obj.edit353:setField("Equipamento_Custo_1_15");
    obj.edit353:setName("edit353");

    obj.edit354 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit354:setParent(obj.layout104);
    obj.edit354:setLeft(245);
    obj.edit354:setTop(0);
    obj.edit354:setWidth(50);
    obj.edit354:setHeight(25);
    obj.edit354:setField("Equipamento_Peso_1_15");
    obj.edit354:setName("edit354");

    obj.layout105 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout88);
    obj.layout105:setLeft(0);
    obj.layout105:setTop(430);
    obj.layout105:setWidth(300);
    obj.layout105:setHeight(25);
    obj.layout105:setName("layout105");

    obj.edit355 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit355:setParent(obj.layout105);
    obj.edit355:setLeft(5);
    obj.edit355:setTop(0);
    obj.edit355:setWidth(190);
    obj.edit355:setHeight(25);
    obj.edit355:setField("Equipamento_1_16");
    obj.edit355:setName("edit355");

    obj.edit356 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit356:setParent(obj.layout105);
    obj.edit356:setLeft(195);
    obj.edit356:setTop(0);
    obj.edit356:setWidth(50);
    obj.edit356:setHeight(25);
    obj.edit356:setField("Equipamento_Custo_1_16");
    obj.edit356:setName("edit356");

    obj.edit357 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit357:setParent(obj.layout105);
    obj.edit357:setLeft(245);
    obj.edit357:setTop(0);
    obj.edit357:setWidth(50);
    obj.edit357:setHeight(25);
    obj.edit357:setField("Equipamento_Peso_1_16");
    obj.edit357:setName("edit357");

    obj.layout106 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout88);
    obj.layout106:setLeft(0);
    obj.layout106:setTop(455);
    obj.layout106:setWidth(300);
    obj.layout106:setHeight(25);
    obj.layout106:setName("layout106");

    obj.edit358 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit358:setParent(obj.layout106);
    obj.edit358:setLeft(5);
    obj.edit358:setTop(0);
    obj.edit358:setWidth(190);
    obj.edit358:setHeight(25);
    obj.edit358:setField("Equipamento_1_17");
    obj.edit358:setName("edit358");

    obj.edit359 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit359:setParent(obj.layout106);
    obj.edit359:setLeft(195);
    obj.edit359:setTop(0);
    obj.edit359:setWidth(50);
    obj.edit359:setHeight(25);
    obj.edit359:setField("Equipamento_Custo_1_17");
    obj.edit359:setName("edit359");

    obj.edit360 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit360:setParent(obj.layout106);
    obj.edit360:setLeft(245);
    obj.edit360:setTop(0);
    obj.edit360:setWidth(50);
    obj.edit360:setHeight(25);
    obj.edit360:setField("Equipamento_Peso_1_17");
    obj.edit360:setName("edit360");

    obj.layout107 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout88);
    obj.layout107:setLeft(0);
    obj.layout107:setTop(480);
    obj.layout107:setWidth(300);
    obj.layout107:setHeight(25);
    obj.layout107:setName("layout107");

    obj.edit361 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit361:setParent(obj.layout107);
    obj.edit361:setLeft(5);
    obj.edit361:setTop(0);
    obj.edit361:setWidth(190);
    obj.edit361:setHeight(25);
    obj.edit361:setField("Equipamento_1_18");
    obj.edit361:setName("edit361");

    obj.edit362 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit362:setParent(obj.layout107);
    obj.edit362:setLeft(195);
    obj.edit362:setTop(0);
    obj.edit362:setWidth(50);
    obj.edit362:setHeight(25);
    obj.edit362:setField("Equipamento_Custo_1_18");
    obj.edit362:setName("edit362");

    obj.edit363 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit363:setParent(obj.layout107);
    obj.edit363:setLeft(245);
    obj.edit363:setTop(0);
    obj.edit363:setWidth(50);
    obj.edit363:setHeight(25);
    obj.edit363:setField("Equipamento_Peso_1_18");
    obj.edit363:setName("edit363");

    obj.layout108 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout88);
    obj.layout108:setLeft(0);
    obj.layout108:setTop(505);
    obj.layout108:setWidth(300);
    obj.layout108:setHeight(25);
    obj.layout108:setName("layout108");

    obj.edit364 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit364:setParent(obj.layout108);
    obj.edit364:setLeft(5);
    obj.edit364:setTop(0);
    obj.edit364:setWidth(190);
    obj.edit364:setHeight(25);
    obj.edit364:setField("Equipamento_1_19");
    obj.edit364:setName("edit364");

    obj.edit365 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit365:setParent(obj.layout108);
    obj.edit365:setLeft(195);
    obj.edit365:setTop(0);
    obj.edit365:setWidth(50);
    obj.edit365:setHeight(25);
    obj.edit365:setField("Equipamento_Custo_1_19");
    obj.edit365:setName("edit365");

    obj.edit366 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit366:setParent(obj.layout108);
    obj.edit366:setLeft(245);
    obj.edit366:setTop(0);
    obj.edit366:setWidth(50);
    obj.edit366:setHeight(25);
    obj.edit366:setField("Equipamento_Peso_1_19");
    obj.edit366:setName("edit366");

    obj.layout109 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout88);
    obj.layout109:setLeft(0);
    obj.layout109:setTop(530);
    obj.layout109:setWidth(300);
    obj.layout109:setHeight(25);
    obj.layout109:setName("layout109");

    obj.edit367 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit367:setParent(obj.layout109);
    obj.edit367:setLeft(5);
    obj.edit367:setTop(0);
    obj.edit367:setWidth(190);
    obj.edit367:setHeight(25);
    obj.edit367:setField("Equipamento_1_20");
    obj.edit367:setName("edit367");

    obj.edit368 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit368:setParent(obj.layout109);
    obj.edit368:setLeft(195);
    obj.edit368:setTop(0);
    obj.edit368:setWidth(50);
    obj.edit368:setHeight(25);
    obj.edit368:setField("Equipamento_Custo_1_20");
    obj.edit368:setName("edit368");

    obj.edit369 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit369:setParent(obj.layout109);
    obj.edit369:setLeft(245);
    obj.edit369:setTop(0);
    obj.edit369:setWidth(50);
    obj.edit369:setHeight(25);
    obj.edit369:setField("Equipamento_Peso_1_20");
    obj.edit369:setName("edit369");

    obj.layout110 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout88);
    obj.layout110:setLeft(0);
    obj.layout110:setTop(555);
    obj.layout110:setWidth(300);
    obj.layout110:setHeight(25);
    obj.layout110:setName("layout110");

    obj.edit370 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit370:setParent(obj.layout110);
    obj.edit370:setLeft(5);
    obj.edit370:setTop(0);
    obj.edit370:setWidth(190);
    obj.edit370:setHeight(25);
    obj.edit370:setField("Equipamento_1_21");
    obj.edit370:setName("edit370");

    obj.edit371 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit371:setParent(obj.layout110);
    obj.edit371:setLeft(195);
    obj.edit371:setTop(0);
    obj.edit371:setWidth(50);
    obj.edit371:setHeight(25);
    obj.edit371:setField("Equipamento_Custo_1_21");
    obj.edit371:setName("edit371");

    obj.edit372 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit372:setParent(obj.layout110);
    obj.edit372:setLeft(245);
    obj.edit372:setTop(0);
    obj.edit372:setWidth(50);
    obj.edit372:setHeight(25);
    obj.edit372:setField("Equipamento_Peso_1_21");
    obj.edit372:setName("edit372");

    obj.layout111 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout88);
    obj.layout111:setLeft(0);
    obj.layout111:setTop(580);
    obj.layout111:setWidth(300);
    obj.layout111:setHeight(25);
    obj.layout111:setName("layout111");

    obj.edit373 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit373:setParent(obj.layout111);
    obj.edit373:setLeft(5);
    obj.edit373:setTop(0);
    obj.edit373:setWidth(190);
    obj.edit373:setHeight(25);
    obj.edit373:setField("Equipamento_1_22");
    obj.edit373:setName("edit373");

    obj.edit374 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit374:setParent(obj.layout111);
    obj.edit374:setLeft(195);
    obj.edit374:setTop(0);
    obj.edit374:setWidth(50);
    obj.edit374:setHeight(25);
    obj.edit374:setField("Equipamento_Custo_1_22");
    obj.edit374:setName("edit374");

    obj.edit375 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit375:setParent(obj.layout111);
    obj.edit375:setLeft(245);
    obj.edit375:setTop(0);
    obj.edit375:setWidth(50);
    obj.edit375:setHeight(25);
    obj.edit375:setField("Equipamento_Peso_1_22");
    obj.edit375:setName("edit375");

    obj.layout112 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.scrollBox3);
    obj.layout112:setLeft(310);
    obj.layout112:setTop(0);
    obj.layout112:setWidth(300);
    obj.layout112:setHeight(610);
    obj.layout112:setName("layout112");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout112);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setXradius(5);
    obj.rectangle18:setYradius(5);
    obj.rectangle18:setCornerType("round");
    obj.rectangle18:setName("rectangle18");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout112);
    obj.label134:setLeft(0);
    obj.label134:setTop(5);
    obj.label134:setWidth(300);
    obj.label134:setHeight(20);
    obj.label134:setText("EQUIPAMENTOS");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.layout113 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout112);
    obj.layout113:setLeft(0);
    obj.layout113:setTop(30);
    obj.layout113:setWidth(300);
    obj.layout113:setHeight(25);
    obj.layout113:setName("layout113");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout113);
    obj.label135:setLeft(5);
    obj.label135:setTop(0);
    obj.label135:setWidth(190);
    obj.label135:setHeight(25);
    obj.label135:setHorzTextAlign("center");
    obj.label135:setText("Item");
    obj.label135:setName("label135");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout113);
    obj.label136:setLeft(195);
    obj.label136:setTop(0);
    obj.label136:setWidth(50);
    obj.label136:setHeight(25);
    obj.label136:setHorzTextAlign("center");
    obj.label136:setText("Custo");
    obj.label136:setName("label136");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout113);
    obj.label137:setLeft(245);
    obj.label137:setTop(0);
    obj.label137:setWidth(50);
    obj.label137:setHeight(25);
    obj.label137:setHorzTextAlign("center");
    obj.label137:setText("Peso");
    obj.label137:setName("label137");

    obj.layout114 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout112);
    obj.layout114:setLeft(0);
    obj.layout114:setTop(55);
    obj.layout114:setWidth(300);
    obj.layout114:setHeight(25);
    obj.layout114:setName("layout114");

    obj.edit376 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit376:setParent(obj.layout114);
    obj.edit376:setLeft(5);
    obj.edit376:setTop(0);
    obj.edit376:setWidth(190);
    obj.edit376:setHeight(25);
    obj.edit376:setField("Equipamento_2_1");
    obj.edit376:setName("edit376");

    obj.edit377 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit377:setParent(obj.layout114);
    obj.edit377:setLeft(195);
    obj.edit377:setTop(0);
    obj.edit377:setWidth(50);
    obj.edit377:setHeight(25);
    obj.edit377:setField("Equipamento_Custo_2_1");
    obj.edit377:setName("edit377");

    obj.edit378 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit378:setParent(obj.layout114);
    obj.edit378:setLeft(245);
    obj.edit378:setTop(0);
    obj.edit378:setWidth(50);
    obj.edit378:setHeight(25);
    obj.edit378:setField("Equipamento_Peso_2_1");
    obj.edit378:setName("edit378");

    obj.layout115 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout112);
    obj.layout115:setLeft(0);
    obj.layout115:setTop(80);
    obj.layout115:setWidth(300);
    obj.layout115:setHeight(25);
    obj.layout115:setName("layout115");

    obj.edit379 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit379:setParent(obj.layout115);
    obj.edit379:setLeft(5);
    obj.edit379:setTop(0);
    obj.edit379:setWidth(190);
    obj.edit379:setHeight(25);
    obj.edit379:setField("Equipamento_2_2");
    obj.edit379:setName("edit379");

    obj.edit380 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit380:setParent(obj.layout115);
    obj.edit380:setLeft(195);
    obj.edit380:setTop(0);
    obj.edit380:setWidth(50);
    obj.edit380:setHeight(25);
    obj.edit380:setField("Equipamento_Custo_2_2");
    obj.edit380:setName("edit380");

    obj.edit381 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit381:setParent(obj.layout115);
    obj.edit381:setLeft(245);
    obj.edit381:setTop(0);
    obj.edit381:setWidth(50);
    obj.edit381:setHeight(25);
    obj.edit381:setField("Equipamento_Peso_2_2");
    obj.edit381:setName("edit381");

    obj.layout116 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout112);
    obj.layout116:setLeft(0);
    obj.layout116:setTop(105);
    obj.layout116:setWidth(300);
    obj.layout116:setHeight(25);
    obj.layout116:setName("layout116");

    obj.edit382 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit382:setParent(obj.layout116);
    obj.edit382:setLeft(5);
    obj.edit382:setTop(0);
    obj.edit382:setWidth(190);
    obj.edit382:setHeight(25);
    obj.edit382:setField("Equipamento_2_3");
    obj.edit382:setName("edit382");

    obj.edit383 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit383:setParent(obj.layout116);
    obj.edit383:setLeft(195);
    obj.edit383:setTop(0);
    obj.edit383:setWidth(50);
    obj.edit383:setHeight(25);
    obj.edit383:setField("Equipamento_Custo_2_3");
    obj.edit383:setName("edit383");

    obj.edit384 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit384:setParent(obj.layout116);
    obj.edit384:setLeft(245);
    obj.edit384:setTop(0);
    obj.edit384:setWidth(50);
    obj.edit384:setHeight(25);
    obj.edit384:setField("Equipamento_Peso_2_3");
    obj.edit384:setName("edit384");

    obj.layout117 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout112);
    obj.layout117:setLeft(0);
    obj.layout117:setTop(130);
    obj.layout117:setWidth(300);
    obj.layout117:setHeight(25);
    obj.layout117:setName("layout117");

    obj.edit385 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit385:setParent(obj.layout117);
    obj.edit385:setLeft(5);
    obj.edit385:setTop(0);
    obj.edit385:setWidth(190);
    obj.edit385:setHeight(25);
    obj.edit385:setField("Equipamento_2_4");
    obj.edit385:setName("edit385");

    obj.edit386 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit386:setParent(obj.layout117);
    obj.edit386:setLeft(195);
    obj.edit386:setTop(0);
    obj.edit386:setWidth(50);
    obj.edit386:setHeight(25);
    obj.edit386:setField("Equipamento_Custo_2_4");
    obj.edit386:setName("edit386");

    obj.edit387 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit387:setParent(obj.layout117);
    obj.edit387:setLeft(245);
    obj.edit387:setTop(0);
    obj.edit387:setWidth(50);
    obj.edit387:setHeight(25);
    obj.edit387:setField("Equipamento_Peso_2_4");
    obj.edit387:setName("edit387");

    obj.layout118 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout112);
    obj.layout118:setLeft(0);
    obj.layout118:setTop(155);
    obj.layout118:setWidth(300);
    obj.layout118:setHeight(25);
    obj.layout118:setName("layout118");

    obj.edit388 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit388:setParent(obj.layout118);
    obj.edit388:setLeft(5);
    obj.edit388:setTop(0);
    obj.edit388:setWidth(190);
    obj.edit388:setHeight(25);
    obj.edit388:setField("Equipamento_2_5");
    obj.edit388:setName("edit388");

    obj.edit389 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit389:setParent(obj.layout118);
    obj.edit389:setLeft(195);
    obj.edit389:setTop(0);
    obj.edit389:setWidth(50);
    obj.edit389:setHeight(25);
    obj.edit389:setField("Equipamento_Custo_2_5");
    obj.edit389:setName("edit389");

    obj.edit390 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit390:setParent(obj.layout118);
    obj.edit390:setLeft(245);
    obj.edit390:setTop(0);
    obj.edit390:setWidth(50);
    obj.edit390:setHeight(25);
    obj.edit390:setField("Equipamento_Peso_2_5");
    obj.edit390:setName("edit390");

    obj.layout119 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.layout112);
    obj.layout119:setLeft(0);
    obj.layout119:setTop(180);
    obj.layout119:setWidth(300);
    obj.layout119:setHeight(25);
    obj.layout119:setName("layout119");

    obj.edit391 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit391:setParent(obj.layout119);
    obj.edit391:setLeft(5);
    obj.edit391:setTop(0);
    obj.edit391:setWidth(190);
    obj.edit391:setHeight(25);
    obj.edit391:setField("Equipamento_2_6");
    obj.edit391:setName("edit391");

    obj.edit392 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit392:setParent(obj.layout119);
    obj.edit392:setLeft(195);
    obj.edit392:setTop(0);
    obj.edit392:setWidth(50);
    obj.edit392:setHeight(25);
    obj.edit392:setField("Equipamento_Custo_2_6");
    obj.edit392:setName("edit392");

    obj.edit393 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit393:setParent(obj.layout119);
    obj.edit393:setLeft(245);
    obj.edit393:setTop(0);
    obj.edit393:setWidth(50);
    obj.edit393:setHeight(25);
    obj.edit393:setField("Equipamento_Peso_2_6");
    obj.edit393:setName("edit393");

    obj.layout120 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout112);
    obj.layout120:setLeft(0);
    obj.layout120:setTop(205);
    obj.layout120:setWidth(300);
    obj.layout120:setHeight(25);
    obj.layout120:setName("layout120");

    obj.edit394 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit394:setParent(obj.layout120);
    obj.edit394:setLeft(5);
    obj.edit394:setTop(0);
    obj.edit394:setWidth(190);
    obj.edit394:setHeight(25);
    obj.edit394:setField("Equipamento_2_7");
    obj.edit394:setName("edit394");

    obj.edit395 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit395:setParent(obj.layout120);
    obj.edit395:setLeft(195);
    obj.edit395:setTop(0);
    obj.edit395:setWidth(50);
    obj.edit395:setHeight(25);
    obj.edit395:setField("Equipamento_Custo_2_7");
    obj.edit395:setName("edit395");

    obj.edit396 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit396:setParent(obj.layout120);
    obj.edit396:setLeft(245);
    obj.edit396:setTop(0);
    obj.edit396:setWidth(50);
    obj.edit396:setHeight(25);
    obj.edit396:setField("Equipamento_Peso_2_7");
    obj.edit396:setName("edit396");

    obj.layout121 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.layout112);
    obj.layout121:setLeft(0);
    obj.layout121:setTop(230);
    obj.layout121:setWidth(300);
    obj.layout121:setHeight(25);
    obj.layout121:setName("layout121");

    obj.edit397 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit397:setParent(obj.layout121);
    obj.edit397:setLeft(5);
    obj.edit397:setTop(0);
    obj.edit397:setWidth(190);
    obj.edit397:setHeight(25);
    obj.edit397:setField("Equipamento_2_8");
    obj.edit397:setName("edit397");

    obj.edit398 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit398:setParent(obj.layout121);
    obj.edit398:setLeft(195);
    obj.edit398:setTop(0);
    obj.edit398:setWidth(50);
    obj.edit398:setHeight(25);
    obj.edit398:setField("Equipamento_Custo_2_8");
    obj.edit398:setName("edit398");

    obj.edit399 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit399:setParent(obj.layout121);
    obj.edit399:setLeft(245);
    obj.edit399:setTop(0);
    obj.edit399:setWidth(50);
    obj.edit399:setHeight(25);
    obj.edit399:setField("Equipamento_Peso_2_8");
    obj.edit399:setName("edit399");

    obj.layout122 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.layout112);
    obj.layout122:setLeft(0);
    obj.layout122:setTop(255);
    obj.layout122:setWidth(300);
    obj.layout122:setHeight(25);
    obj.layout122:setName("layout122");

    obj.edit400 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit400:setParent(obj.layout122);
    obj.edit400:setLeft(5);
    obj.edit400:setTop(0);
    obj.edit400:setWidth(190);
    obj.edit400:setHeight(25);
    obj.edit400:setField("Equipamento_2_9");
    obj.edit400:setName("edit400");

    obj.edit401 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit401:setParent(obj.layout122);
    obj.edit401:setLeft(195);
    obj.edit401:setTop(0);
    obj.edit401:setWidth(50);
    obj.edit401:setHeight(25);
    obj.edit401:setField("Equipamento_Custo_2_9");
    obj.edit401:setName("edit401");

    obj.edit402 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit402:setParent(obj.layout122);
    obj.edit402:setLeft(245);
    obj.edit402:setTop(0);
    obj.edit402:setWidth(50);
    obj.edit402:setHeight(25);
    obj.edit402:setField("Equipamento_Peso_2_9");
    obj.edit402:setName("edit402");

    obj.layout123 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.layout112);
    obj.layout123:setLeft(0);
    obj.layout123:setTop(280);
    obj.layout123:setWidth(300);
    obj.layout123:setHeight(25);
    obj.layout123:setName("layout123");

    obj.edit403 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit403:setParent(obj.layout123);
    obj.edit403:setLeft(5);
    obj.edit403:setTop(0);
    obj.edit403:setWidth(190);
    obj.edit403:setHeight(25);
    obj.edit403:setField("Equipamento_2_10");
    obj.edit403:setName("edit403");

    obj.edit404 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit404:setParent(obj.layout123);
    obj.edit404:setLeft(195);
    obj.edit404:setTop(0);
    obj.edit404:setWidth(50);
    obj.edit404:setHeight(25);
    obj.edit404:setField("Equipamento_Custo_2_10");
    obj.edit404:setName("edit404");

    obj.edit405 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit405:setParent(obj.layout123);
    obj.edit405:setLeft(245);
    obj.edit405:setTop(0);
    obj.edit405:setWidth(50);
    obj.edit405:setHeight(25);
    obj.edit405:setField("Equipamento_Peso_2_10");
    obj.edit405:setName("edit405");

    obj.layout124 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.layout112);
    obj.layout124:setLeft(0);
    obj.layout124:setTop(305);
    obj.layout124:setWidth(300);
    obj.layout124:setHeight(25);
    obj.layout124:setName("layout124");

    obj.edit406 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit406:setParent(obj.layout124);
    obj.edit406:setLeft(5);
    obj.edit406:setTop(0);
    obj.edit406:setWidth(190);
    obj.edit406:setHeight(25);
    obj.edit406:setField("Equipamento_2_11");
    obj.edit406:setName("edit406");

    obj.edit407 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit407:setParent(obj.layout124);
    obj.edit407:setLeft(195);
    obj.edit407:setTop(0);
    obj.edit407:setWidth(50);
    obj.edit407:setHeight(25);
    obj.edit407:setField("Equipamento_Custo_2_11");
    obj.edit407:setName("edit407");

    obj.edit408 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit408:setParent(obj.layout124);
    obj.edit408:setLeft(245);
    obj.edit408:setTop(0);
    obj.edit408:setWidth(50);
    obj.edit408:setHeight(25);
    obj.edit408:setField("Equipamento_Peso_2_11");
    obj.edit408:setName("edit408");

    obj.layout125 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.layout112);
    obj.layout125:setLeft(0);
    obj.layout125:setTop(330);
    obj.layout125:setWidth(300);
    obj.layout125:setHeight(25);
    obj.layout125:setName("layout125");

    obj.edit409 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit409:setParent(obj.layout125);
    obj.edit409:setLeft(5);
    obj.edit409:setTop(0);
    obj.edit409:setWidth(190);
    obj.edit409:setHeight(25);
    obj.edit409:setField("Equipamento_2_12");
    obj.edit409:setName("edit409");

    obj.edit410 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit410:setParent(obj.layout125);
    obj.edit410:setLeft(195);
    obj.edit410:setTop(0);
    obj.edit410:setWidth(50);
    obj.edit410:setHeight(25);
    obj.edit410:setField("Equipamento_Custo_2_12");
    obj.edit410:setName("edit410");

    obj.edit411 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit411:setParent(obj.layout125);
    obj.edit411:setLeft(245);
    obj.edit411:setTop(0);
    obj.edit411:setWidth(50);
    obj.edit411:setHeight(25);
    obj.edit411:setField("Equipamento_Peso_2_12");
    obj.edit411:setName("edit411");

    obj.layout126 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.layout112);
    obj.layout126:setLeft(0);
    obj.layout126:setTop(355);
    obj.layout126:setWidth(300);
    obj.layout126:setHeight(25);
    obj.layout126:setName("layout126");

    obj.edit412 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit412:setParent(obj.layout126);
    obj.edit412:setLeft(5);
    obj.edit412:setTop(0);
    obj.edit412:setWidth(190);
    obj.edit412:setHeight(25);
    obj.edit412:setField("Equipamento_2_13");
    obj.edit412:setName("edit412");

    obj.edit413 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit413:setParent(obj.layout126);
    obj.edit413:setLeft(195);
    obj.edit413:setTop(0);
    obj.edit413:setWidth(50);
    obj.edit413:setHeight(25);
    obj.edit413:setField("Equipamento_Custo_2_13");
    obj.edit413:setName("edit413");

    obj.edit414 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit414:setParent(obj.layout126);
    obj.edit414:setLeft(245);
    obj.edit414:setTop(0);
    obj.edit414:setWidth(50);
    obj.edit414:setHeight(25);
    obj.edit414:setField("Equipamento_Peso_2_13");
    obj.edit414:setName("edit414");

    obj.layout127 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.layout112);
    obj.layout127:setLeft(0);
    obj.layout127:setTop(380);
    obj.layout127:setWidth(300);
    obj.layout127:setHeight(25);
    obj.layout127:setName("layout127");

    obj.edit415 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit415:setParent(obj.layout127);
    obj.edit415:setLeft(5);
    obj.edit415:setTop(0);
    obj.edit415:setWidth(190);
    obj.edit415:setHeight(25);
    obj.edit415:setField("Equipamento_2_14");
    obj.edit415:setName("edit415");

    obj.edit416 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit416:setParent(obj.layout127);
    obj.edit416:setLeft(195);
    obj.edit416:setTop(0);
    obj.edit416:setWidth(50);
    obj.edit416:setHeight(25);
    obj.edit416:setField("Equipamento_Custo_2_14");
    obj.edit416:setName("edit416");

    obj.edit417 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit417:setParent(obj.layout127);
    obj.edit417:setLeft(245);
    obj.edit417:setTop(0);
    obj.edit417:setWidth(50);
    obj.edit417:setHeight(25);
    obj.edit417:setField("Equipamento_Peso_2_14");
    obj.edit417:setName("edit417");

    obj.layout128 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.layout112);
    obj.layout128:setLeft(0);
    obj.layout128:setTop(405);
    obj.layout128:setWidth(300);
    obj.layout128:setHeight(25);
    obj.layout128:setName("layout128");

    obj.edit418 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit418:setParent(obj.layout128);
    obj.edit418:setLeft(5);
    obj.edit418:setTop(0);
    obj.edit418:setWidth(190);
    obj.edit418:setHeight(25);
    obj.edit418:setField("Equipamento_2_15");
    obj.edit418:setName("edit418");

    obj.edit419 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit419:setParent(obj.layout128);
    obj.edit419:setLeft(195);
    obj.edit419:setTop(0);
    obj.edit419:setWidth(50);
    obj.edit419:setHeight(25);
    obj.edit419:setField("Equipamento_Custo_2_15");
    obj.edit419:setName("edit419");

    obj.edit420 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit420:setParent(obj.layout128);
    obj.edit420:setLeft(245);
    obj.edit420:setTop(0);
    obj.edit420:setWidth(50);
    obj.edit420:setHeight(25);
    obj.edit420:setField("Equipamento_Peso_2_15");
    obj.edit420:setName("edit420");

    obj.layout129 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.layout112);
    obj.layout129:setLeft(0);
    obj.layout129:setTop(430);
    obj.layout129:setWidth(300);
    obj.layout129:setHeight(25);
    obj.layout129:setName("layout129");

    obj.edit421 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit421:setParent(obj.layout129);
    obj.edit421:setLeft(5);
    obj.edit421:setTop(0);
    obj.edit421:setWidth(190);
    obj.edit421:setHeight(25);
    obj.edit421:setField("Equipamento_2_16");
    obj.edit421:setName("edit421");

    obj.edit422 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit422:setParent(obj.layout129);
    obj.edit422:setLeft(195);
    obj.edit422:setTop(0);
    obj.edit422:setWidth(50);
    obj.edit422:setHeight(25);
    obj.edit422:setField("Equipamento_Custo_2_16");
    obj.edit422:setName("edit422");

    obj.edit423 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit423:setParent(obj.layout129);
    obj.edit423:setLeft(245);
    obj.edit423:setTop(0);
    obj.edit423:setWidth(50);
    obj.edit423:setHeight(25);
    obj.edit423:setField("Equipamento_Peso_2_16");
    obj.edit423:setName("edit423");

    obj.layout130 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.layout112);
    obj.layout130:setLeft(0);
    obj.layout130:setTop(455);
    obj.layout130:setWidth(300);
    obj.layout130:setHeight(25);
    obj.layout130:setName("layout130");

    obj.edit424 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit424:setParent(obj.layout130);
    obj.edit424:setLeft(5);
    obj.edit424:setTop(0);
    obj.edit424:setWidth(190);
    obj.edit424:setHeight(25);
    obj.edit424:setField("Equipamento_2_17");
    obj.edit424:setName("edit424");

    obj.edit425 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit425:setParent(obj.layout130);
    obj.edit425:setLeft(195);
    obj.edit425:setTop(0);
    obj.edit425:setWidth(50);
    obj.edit425:setHeight(25);
    obj.edit425:setField("Equipamento_Custo_2_17");
    obj.edit425:setName("edit425");

    obj.edit426 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit426:setParent(obj.layout130);
    obj.edit426:setLeft(245);
    obj.edit426:setTop(0);
    obj.edit426:setWidth(50);
    obj.edit426:setHeight(25);
    obj.edit426:setField("Equipamento_Peso_2_17");
    obj.edit426:setName("edit426");

    obj.layout131 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.layout112);
    obj.layout131:setLeft(0);
    obj.layout131:setTop(480);
    obj.layout131:setWidth(300);
    obj.layout131:setHeight(25);
    obj.layout131:setName("layout131");

    obj.edit427 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit427:setParent(obj.layout131);
    obj.edit427:setLeft(5);
    obj.edit427:setTop(0);
    obj.edit427:setWidth(190);
    obj.edit427:setHeight(25);
    obj.edit427:setField("Equipamento_2_18");
    obj.edit427:setName("edit427");

    obj.edit428 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit428:setParent(obj.layout131);
    obj.edit428:setLeft(195);
    obj.edit428:setTop(0);
    obj.edit428:setWidth(50);
    obj.edit428:setHeight(25);
    obj.edit428:setField("Equipamento_Custo_2_18");
    obj.edit428:setName("edit428");

    obj.edit429 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit429:setParent(obj.layout131);
    obj.edit429:setLeft(245);
    obj.edit429:setTop(0);
    obj.edit429:setWidth(50);
    obj.edit429:setHeight(25);
    obj.edit429:setField("Equipamento_Peso_2_18");
    obj.edit429:setName("edit429");

    obj.layout132 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.layout112);
    obj.layout132:setLeft(0);
    obj.layout132:setTop(505);
    obj.layout132:setWidth(300);
    obj.layout132:setHeight(25);
    obj.layout132:setName("layout132");

    obj.edit430 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit430:setParent(obj.layout132);
    obj.edit430:setLeft(5);
    obj.edit430:setTop(0);
    obj.edit430:setWidth(190);
    obj.edit430:setHeight(25);
    obj.edit430:setField("Equipamento_2_19");
    obj.edit430:setName("edit430");

    obj.edit431 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit431:setParent(obj.layout132);
    obj.edit431:setLeft(195);
    obj.edit431:setTop(0);
    obj.edit431:setWidth(50);
    obj.edit431:setHeight(25);
    obj.edit431:setField("Equipamento_Custo_2_19");
    obj.edit431:setName("edit431");

    obj.edit432 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit432:setParent(obj.layout132);
    obj.edit432:setLeft(245);
    obj.edit432:setTop(0);
    obj.edit432:setWidth(50);
    obj.edit432:setHeight(25);
    obj.edit432:setField("Equipamento_Peso_2_19");
    obj.edit432:setName("edit432");

    obj.layout133 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.layout112);
    obj.layout133:setLeft(0);
    obj.layout133:setTop(530);
    obj.layout133:setWidth(300);
    obj.layout133:setHeight(25);
    obj.layout133:setName("layout133");

    obj.edit433 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit433:setParent(obj.layout133);
    obj.edit433:setLeft(5);
    obj.edit433:setTop(0);
    obj.edit433:setWidth(190);
    obj.edit433:setHeight(25);
    obj.edit433:setField("Equipamento_2_20");
    obj.edit433:setName("edit433");

    obj.edit434 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit434:setParent(obj.layout133);
    obj.edit434:setLeft(195);
    obj.edit434:setTop(0);
    obj.edit434:setWidth(50);
    obj.edit434:setHeight(25);
    obj.edit434:setField("Equipamento_Custo_2_20");
    obj.edit434:setName("edit434");

    obj.edit435 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit435:setParent(obj.layout133);
    obj.edit435:setLeft(245);
    obj.edit435:setTop(0);
    obj.edit435:setWidth(50);
    obj.edit435:setHeight(25);
    obj.edit435:setField("Equipamento_Peso_2_20");
    obj.edit435:setName("edit435");

    obj.layout134 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout112);
    obj.layout134:setLeft(0);
    obj.layout134:setTop(555);
    obj.layout134:setWidth(300);
    obj.layout134:setHeight(25);
    obj.layout134:setName("layout134");

    obj.edit436 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit436:setParent(obj.layout134);
    obj.edit436:setLeft(5);
    obj.edit436:setTop(0);
    obj.edit436:setWidth(190);
    obj.edit436:setHeight(25);
    obj.edit436:setField("Equipamento_2_21");
    obj.edit436:setName("edit436");

    obj.edit437 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit437:setParent(obj.layout134);
    obj.edit437:setLeft(195);
    obj.edit437:setTop(0);
    obj.edit437:setWidth(50);
    obj.edit437:setHeight(25);
    obj.edit437:setField("Equipamento_Custo_2_21");
    obj.edit437:setName("edit437");

    obj.edit438 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit438:setParent(obj.layout134);
    obj.edit438:setLeft(245);
    obj.edit438:setTop(0);
    obj.edit438:setWidth(50);
    obj.edit438:setHeight(25);
    obj.edit438:setField("Equipamento_Peso_2_21");
    obj.edit438:setName("edit438");

    obj.layout135 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.layout112);
    obj.layout135:setLeft(0);
    obj.layout135:setTop(580);
    obj.layout135:setWidth(300);
    obj.layout135:setHeight(25);
    obj.layout135:setName("layout135");

    obj.edit439 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit439:setParent(obj.layout135);
    obj.edit439:setLeft(5);
    obj.edit439:setTop(0);
    obj.edit439:setWidth(190);
    obj.edit439:setHeight(25);
    obj.edit439:setField("Equipamento_2_22");
    obj.edit439:setName("edit439");

    obj.edit440 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit440:setParent(obj.layout135);
    obj.edit440:setLeft(195);
    obj.edit440:setTop(0);
    obj.edit440:setWidth(50);
    obj.edit440:setHeight(25);
    obj.edit440:setField("Equipamento_Custo_2_22");
    obj.edit440:setName("edit440");

    obj.edit441 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit441:setParent(obj.layout135);
    obj.edit441:setLeft(245);
    obj.edit441:setTop(0);
    obj.edit441:setWidth(50);
    obj.edit441:setHeight(25);
    obj.edit441:setField("Equipamento_Peso_2_22");
    obj.edit441:setName("edit441");

    obj.layout136 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.scrollBox3);
    obj.layout136:setLeft(620);
    obj.layout136:setTop(0);
    obj.layout136:setWidth(300);
    obj.layout136:setHeight(610);
    obj.layout136:setName("layout136");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout136);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("black");
    obj.rectangle19:setXradius(5);
    obj.rectangle19:setYradius(5);
    obj.rectangle19:setCornerType("round");
    obj.rectangle19:setName("rectangle19");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout136);
    obj.label138:setLeft(0);
    obj.label138:setTop(5);
    obj.label138:setWidth(300);
    obj.label138:setHeight(20);
    obj.label138:setText("EQUIPAMENTOS");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.layout137 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.layout136);
    obj.layout137:setLeft(0);
    obj.layout137:setTop(30);
    obj.layout137:setWidth(300);
    obj.layout137:setHeight(25);
    obj.layout137:setName("layout137");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout137);
    obj.label139:setLeft(5);
    obj.label139:setTop(0);
    obj.label139:setWidth(190);
    obj.label139:setHeight(25);
    obj.label139:setHorzTextAlign("center");
    obj.label139:setText("Item");
    obj.label139:setName("label139");

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout137);
    obj.label140:setLeft(195);
    obj.label140:setTop(0);
    obj.label140:setWidth(50);
    obj.label140:setHeight(25);
    obj.label140:setHorzTextAlign("center");
    obj.label140:setText("Custo");
    obj.label140:setName("label140");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout137);
    obj.label141:setLeft(245);
    obj.label141:setTop(0);
    obj.label141:setWidth(50);
    obj.label141:setHeight(25);
    obj.label141:setHorzTextAlign("center");
    obj.label141:setText("Peso");
    obj.label141:setName("label141");

    obj.layout138 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.layout136);
    obj.layout138:setLeft(0);
    obj.layout138:setTop(55);
    obj.layout138:setWidth(300);
    obj.layout138:setHeight(25);
    obj.layout138:setName("layout138");

    obj.edit442 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit442:setParent(obj.layout138);
    obj.edit442:setLeft(5);
    obj.edit442:setTop(0);
    obj.edit442:setWidth(190);
    obj.edit442:setHeight(25);
    obj.edit442:setField("Equipamento_3_1");
    obj.edit442:setName("edit442");

    obj.edit443 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit443:setParent(obj.layout138);
    obj.edit443:setLeft(195);
    obj.edit443:setTop(0);
    obj.edit443:setWidth(50);
    obj.edit443:setHeight(25);
    obj.edit443:setField("Equipamento_Custo_3_1");
    obj.edit443:setName("edit443");

    obj.edit444 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit444:setParent(obj.layout138);
    obj.edit444:setLeft(245);
    obj.edit444:setTop(0);
    obj.edit444:setWidth(50);
    obj.edit444:setHeight(25);
    obj.edit444:setField("Equipamento_Peso_3_1");
    obj.edit444:setName("edit444");

    obj.layout139 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout136);
    obj.layout139:setLeft(0);
    obj.layout139:setTop(80);
    obj.layout139:setWidth(300);
    obj.layout139:setHeight(25);
    obj.layout139:setName("layout139");

    obj.edit445 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit445:setParent(obj.layout139);
    obj.edit445:setLeft(5);
    obj.edit445:setTop(0);
    obj.edit445:setWidth(190);
    obj.edit445:setHeight(25);
    obj.edit445:setField("Equipamento_3_2");
    obj.edit445:setName("edit445");

    obj.edit446 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit446:setParent(obj.layout139);
    obj.edit446:setLeft(195);
    obj.edit446:setTop(0);
    obj.edit446:setWidth(50);
    obj.edit446:setHeight(25);
    obj.edit446:setField("Equipamento_Custo_3_2");
    obj.edit446:setName("edit446");

    obj.edit447 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit447:setParent(obj.layout139);
    obj.edit447:setLeft(245);
    obj.edit447:setTop(0);
    obj.edit447:setWidth(50);
    obj.edit447:setHeight(25);
    obj.edit447:setField("Equipamento_Peso_3_2");
    obj.edit447:setName("edit447");

    obj.layout140 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.layout136);
    obj.layout140:setLeft(0);
    obj.layout140:setTop(105);
    obj.layout140:setWidth(300);
    obj.layout140:setHeight(25);
    obj.layout140:setName("layout140");

    obj.edit448 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit448:setParent(obj.layout140);
    obj.edit448:setLeft(5);
    obj.edit448:setTop(0);
    obj.edit448:setWidth(190);
    obj.edit448:setHeight(25);
    obj.edit448:setField("Equipamento_3_3");
    obj.edit448:setName("edit448");

    obj.edit449 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit449:setParent(obj.layout140);
    obj.edit449:setLeft(195);
    obj.edit449:setTop(0);
    obj.edit449:setWidth(50);
    obj.edit449:setHeight(25);
    obj.edit449:setField("Equipamento_Custo_3_3");
    obj.edit449:setName("edit449");

    obj.edit450 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit450:setParent(obj.layout140);
    obj.edit450:setLeft(245);
    obj.edit450:setTop(0);
    obj.edit450:setWidth(50);
    obj.edit450:setHeight(25);
    obj.edit450:setField("Equipamento_Peso_3_3");
    obj.edit450:setName("edit450");

    obj.layout141 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.layout136);
    obj.layout141:setLeft(0);
    obj.layout141:setTop(130);
    obj.layout141:setWidth(300);
    obj.layout141:setHeight(25);
    obj.layout141:setName("layout141");

    obj.edit451 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit451:setParent(obj.layout141);
    obj.edit451:setLeft(5);
    obj.edit451:setTop(0);
    obj.edit451:setWidth(190);
    obj.edit451:setHeight(25);
    obj.edit451:setField("Equipamento_3_4");
    obj.edit451:setName("edit451");

    obj.edit452 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit452:setParent(obj.layout141);
    obj.edit452:setLeft(195);
    obj.edit452:setTop(0);
    obj.edit452:setWidth(50);
    obj.edit452:setHeight(25);
    obj.edit452:setField("Equipamento_Custo_3_4");
    obj.edit452:setName("edit452");

    obj.edit453 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit453:setParent(obj.layout141);
    obj.edit453:setLeft(245);
    obj.edit453:setTop(0);
    obj.edit453:setWidth(50);
    obj.edit453:setHeight(25);
    obj.edit453:setField("Equipamento_Peso_3_4");
    obj.edit453:setName("edit453");

    obj.layout142 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.layout136);
    obj.layout142:setLeft(0);
    obj.layout142:setTop(155);
    obj.layout142:setWidth(300);
    obj.layout142:setHeight(25);
    obj.layout142:setName("layout142");

    obj.edit454 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit454:setParent(obj.layout142);
    obj.edit454:setLeft(5);
    obj.edit454:setTop(0);
    obj.edit454:setWidth(190);
    obj.edit454:setHeight(25);
    obj.edit454:setField("Equipamento_3_5");
    obj.edit454:setName("edit454");

    obj.edit455 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit455:setParent(obj.layout142);
    obj.edit455:setLeft(195);
    obj.edit455:setTop(0);
    obj.edit455:setWidth(50);
    obj.edit455:setHeight(25);
    obj.edit455:setField("Equipamento_Custo_3_5");
    obj.edit455:setName("edit455");

    obj.edit456 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit456:setParent(obj.layout142);
    obj.edit456:setLeft(245);
    obj.edit456:setTop(0);
    obj.edit456:setWidth(50);
    obj.edit456:setHeight(25);
    obj.edit456:setField("Equipamento_Peso_3_5");
    obj.edit456:setName("edit456");

    obj.layout143 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.layout136);
    obj.layout143:setLeft(0);
    obj.layout143:setTop(180);
    obj.layout143:setWidth(300);
    obj.layout143:setHeight(25);
    obj.layout143:setName("layout143");

    obj.edit457 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit457:setParent(obj.layout143);
    obj.edit457:setLeft(5);
    obj.edit457:setTop(0);
    obj.edit457:setWidth(190);
    obj.edit457:setHeight(25);
    obj.edit457:setField("Equipamento_3_6");
    obj.edit457:setName("edit457");

    obj.edit458 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit458:setParent(obj.layout143);
    obj.edit458:setLeft(195);
    obj.edit458:setTop(0);
    obj.edit458:setWidth(50);
    obj.edit458:setHeight(25);
    obj.edit458:setField("Equipamento_Custo_3_6");
    obj.edit458:setName("edit458");

    obj.edit459 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit459:setParent(obj.layout143);
    obj.edit459:setLeft(245);
    obj.edit459:setTop(0);
    obj.edit459:setWidth(50);
    obj.edit459:setHeight(25);
    obj.edit459:setField("Equipamento_Peso_3_6");
    obj.edit459:setName("edit459");

    obj.layout144 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.layout136);
    obj.layout144:setLeft(0);
    obj.layout144:setTop(205);
    obj.layout144:setWidth(300);
    obj.layout144:setHeight(25);
    obj.layout144:setName("layout144");

    obj.edit460 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit460:setParent(obj.layout144);
    obj.edit460:setLeft(5);
    obj.edit460:setTop(0);
    obj.edit460:setWidth(190);
    obj.edit460:setHeight(25);
    obj.edit460:setField("Equipamento_3_7");
    obj.edit460:setName("edit460");

    obj.edit461 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit461:setParent(obj.layout144);
    obj.edit461:setLeft(195);
    obj.edit461:setTop(0);
    obj.edit461:setWidth(50);
    obj.edit461:setHeight(25);
    obj.edit461:setField("Equipamento_Custo_3_7");
    obj.edit461:setName("edit461");

    obj.edit462 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit462:setParent(obj.layout144);
    obj.edit462:setLeft(245);
    obj.edit462:setTop(0);
    obj.edit462:setWidth(50);
    obj.edit462:setHeight(25);
    obj.edit462:setField("Equipamento_Peso_3_7");
    obj.edit462:setName("edit462");

    obj.layout145 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.layout136);
    obj.layout145:setLeft(0);
    obj.layout145:setTop(230);
    obj.layout145:setWidth(300);
    obj.layout145:setHeight(25);
    obj.layout145:setName("layout145");

    obj.edit463 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit463:setParent(obj.layout145);
    obj.edit463:setLeft(5);
    obj.edit463:setTop(0);
    obj.edit463:setWidth(190);
    obj.edit463:setHeight(25);
    obj.edit463:setField("Equipamento_3_8");
    obj.edit463:setName("edit463");

    obj.edit464 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit464:setParent(obj.layout145);
    obj.edit464:setLeft(195);
    obj.edit464:setTop(0);
    obj.edit464:setWidth(50);
    obj.edit464:setHeight(25);
    obj.edit464:setField("Equipamento_Custo_3_8");
    obj.edit464:setName("edit464");

    obj.edit465 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit465:setParent(obj.layout145);
    obj.edit465:setLeft(245);
    obj.edit465:setTop(0);
    obj.edit465:setWidth(50);
    obj.edit465:setHeight(25);
    obj.edit465:setField("Equipamento_Peso_3_8");
    obj.edit465:setName("edit465");

    obj.layout146 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.layout136);
    obj.layout146:setLeft(0);
    obj.layout146:setTop(255);
    obj.layout146:setWidth(300);
    obj.layout146:setHeight(25);
    obj.layout146:setName("layout146");

    obj.edit466 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit466:setParent(obj.layout146);
    obj.edit466:setLeft(5);
    obj.edit466:setTop(0);
    obj.edit466:setWidth(190);
    obj.edit466:setHeight(25);
    obj.edit466:setField("Equipamento_3_9");
    obj.edit466:setName("edit466");

    obj.edit467 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit467:setParent(obj.layout146);
    obj.edit467:setLeft(195);
    obj.edit467:setTop(0);
    obj.edit467:setWidth(50);
    obj.edit467:setHeight(25);
    obj.edit467:setField("Equipamento_Custo_3_9");
    obj.edit467:setName("edit467");

    obj.edit468 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit468:setParent(obj.layout146);
    obj.edit468:setLeft(245);
    obj.edit468:setTop(0);
    obj.edit468:setWidth(50);
    obj.edit468:setHeight(25);
    obj.edit468:setField("Equipamento_Peso_3_9");
    obj.edit468:setName("edit468");

    obj.layout147 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.layout136);
    obj.layout147:setLeft(0);
    obj.layout147:setTop(280);
    obj.layout147:setWidth(300);
    obj.layout147:setHeight(25);
    obj.layout147:setName("layout147");

    obj.edit469 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit469:setParent(obj.layout147);
    obj.edit469:setLeft(5);
    obj.edit469:setTop(0);
    obj.edit469:setWidth(190);
    obj.edit469:setHeight(25);
    obj.edit469:setField("Equipamento_3_10");
    obj.edit469:setName("edit469");

    obj.edit470 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit470:setParent(obj.layout147);
    obj.edit470:setLeft(195);
    obj.edit470:setTop(0);
    obj.edit470:setWidth(50);
    obj.edit470:setHeight(25);
    obj.edit470:setField("Equipamento_Custo_3_10");
    obj.edit470:setName("edit470");

    obj.edit471 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit471:setParent(obj.layout147);
    obj.edit471:setLeft(245);
    obj.edit471:setTop(0);
    obj.edit471:setWidth(50);
    obj.edit471:setHeight(25);
    obj.edit471:setField("Equipamento_Peso_3_10");
    obj.edit471:setName("edit471");

    obj.layout148 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.layout136);
    obj.layout148:setLeft(0);
    obj.layout148:setTop(305);
    obj.layout148:setWidth(300);
    obj.layout148:setHeight(25);
    obj.layout148:setName("layout148");

    obj.edit472 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit472:setParent(obj.layout148);
    obj.edit472:setLeft(5);
    obj.edit472:setTop(0);
    obj.edit472:setWidth(190);
    obj.edit472:setHeight(25);
    obj.edit472:setField("Equipamento_3_11");
    obj.edit472:setName("edit472");

    obj.edit473 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit473:setParent(obj.layout148);
    obj.edit473:setLeft(195);
    obj.edit473:setTop(0);
    obj.edit473:setWidth(50);
    obj.edit473:setHeight(25);
    obj.edit473:setField("Equipamento_Custo_3_11");
    obj.edit473:setName("edit473");

    obj.edit474 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit474:setParent(obj.layout148);
    obj.edit474:setLeft(245);
    obj.edit474:setTop(0);
    obj.edit474:setWidth(50);
    obj.edit474:setHeight(25);
    obj.edit474:setField("Equipamento_Peso_3_11");
    obj.edit474:setName("edit474");

    obj.layout149 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.layout136);
    obj.layout149:setLeft(0);
    obj.layout149:setTop(330);
    obj.layout149:setWidth(300);
    obj.layout149:setHeight(25);
    obj.layout149:setName("layout149");

    obj.edit475 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit475:setParent(obj.layout149);
    obj.edit475:setLeft(5);
    obj.edit475:setTop(0);
    obj.edit475:setWidth(190);
    obj.edit475:setHeight(25);
    obj.edit475:setField("Equipamento_3_12");
    obj.edit475:setName("edit475");

    obj.edit476 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit476:setParent(obj.layout149);
    obj.edit476:setLeft(195);
    obj.edit476:setTop(0);
    obj.edit476:setWidth(50);
    obj.edit476:setHeight(25);
    obj.edit476:setField("Equipamento_Custo_3_12");
    obj.edit476:setName("edit476");

    obj.edit477 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit477:setParent(obj.layout149);
    obj.edit477:setLeft(245);
    obj.edit477:setTop(0);
    obj.edit477:setWidth(50);
    obj.edit477:setHeight(25);
    obj.edit477:setField("Equipamento_Peso_3_12");
    obj.edit477:setName("edit477");

    obj.layout150 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.layout136);
    obj.layout150:setLeft(0);
    obj.layout150:setTop(355);
    obj.layout150:setWidth(300);
    obj.layout150:setHeight(25);
    obj.layout150:setName("layout150");

    obj.edit478 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit478:setParent(obj.layout150);
    obj.edit478:setLeft(5);
    obj.edit478:setTop(0);
    obj.edit478:setWidth(190);
    obj.edit478:setHeight(25);
    obj.edit478:setField("Equipamento_3_13");
    obj.edit478:setName("edit478");

    obj.edit479 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit479:setParent(obj.layout150);
    obj.edit479:setLeft(195);
    obj.edit479:setTop(0);
    obj.edit479:setWidth(50);
    obj.edit479:setHeight(25);
    obj.edit479:setField("Equipamento_Custo_3_13");
    obj.edit479:setName("edit479");

    obj.edit480 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit480:setParent(obj.layout150);
    obj.edit480:setLeft(245);
    obj.edit480:setTop(0);
    obj.edit480:setWidth(50);
    obj.edit480:setHeight(25);
    obj.edit480:setField("Equipamento_Peso_3_13");
    obj.edit480:setName("edit480");

    obj.layout151 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.layout136);
    obj.layout151:setLeft(0);
    obj.layout151:setTop(380);
    obj.layout151:setWidth(300);
    obj.layout151:setHeight(25);
    obj.layout151:setName("layout151");

    obj.edit481 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit481:setParent(obj.layout151);
    obj.edit481:setLeft(5);
    obj.edit481:setTop(0);
    obj.edit481:setWidth(190);
    obj.edit481:setHeight(25);
    obj.edit481:setField("Equipamento_3_14");
    obj.edit481:setName("edit481");

    obj.edit482 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit482:setParent(obj.layout151);
    obj.edit482:setLeft(195);
    obj.edit482:setTop(0);
    obj.edit482:setWidth(50);
    obj.edit482:setHeight(25);
    obj.edit482:setField("Equipamento_Custo_3_14");
    obj.edit482:setName("edit482");

    obj.edit483 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit483:setParent(obj.layout151);
    obj.edit483:setLeft(245);
    obj.edit483:setTop(0);
    obj.edit483:setWidth(50);
    obj.edit483:setHeight(25);
    obj.edit483:setField("Equipamento_Peso_3_14");
    obj.edit483:setName("edit483");

    obj.layout152 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.layout136);
    obj.layout152:setLeft(0);
    obj.layout152:setTop(405);
    obj.layout152:setWidth(300);
    obj.layout152:setHeight(25);
    obj.layout152:setName("layout152");

    obj.edit484 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit484:setParent(obj.layout152);
    obj.edit484:setLeft(5);
    obj.edit484:setTop(0);
    obj.edit484:setWidth(190);
    obj.edit484:setHeight(25);
    obj.edit484:setField("Equipamento_3_15");
    obj.edit484:setName("edit484");

    obj.edit485 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit485:setParent(obj.layout152);
    obj.edit485:setLeft(195);
    obj.edit485:setTop(0);
    obj.edit485:setWidth(50);
    obj.edit485:setHeight(25);
    obj.edit485:setField("Equipamento_Custo_3_15");
    obj.edit485:setName("edit485");

    obj.edit486 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit486:setParent(obj.layout152);
    obj.edit486:setLeft(245);
    obj.edit486:setTop(0);
    obj.edit486:setWidth(50);
    obj.edit486:setHeight(25);
    obj.edit486:setField("Equipamento_Peso_3_15");
    obj.edit486:setName("edit486");

    obj.layout153 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.layout136);
    obj.layout153:setLeft(0);
    obj.layout153:setTop(430);
    obj.layout153:setWidth(300);
    obj.layout153:setHeight(25);
    obj.layout153:setName("layout153");

    obj.edit487 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit487:setParent(obj.layout153);
    obj.edit487:setLeft(5);
    obj.edit487:setTop(0);
    obj.edit487:setWidth(190);
    obj.edit487:setHeight(25);
    obj.edit487:setField("Equipamento_3_16");
    obj.edit487:setName("edit487");

    obj.edit488 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit488:setParent(obj.layout153);
    obj.edit488:setLeft(195);
    obj.edit488:setTop(0);
    obj.edit488:setWidth(50);
    obj.edit488:setHeight(25);
    obj.edit488:setField("Equipamento_Custo_3_16");
    obj.edit488:setName("edit488");

    obj.edit489 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit489:setParent(obj.layout153);
    obj.edit489:setLeft(245);
    obj.edit489:setTop(0);
    obj.edit489:setWidth(50);
    obj.edit489:setHeight(25);
    obj.edit489:setField("Equipamento_Peso_3_16");
    obj.edit489:setName("edit489");

    obj.layout154 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.layout136);
    obj.layout154:setLeft(0);
    obj.layout154:setTop(455);
    obj.layout154:setWidth(300);
    obj.layout154:setHeight(25);
    obj.layout154:setName("layout154");

    obj.edit490 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit490:setParent(obj.layout154);
    obj.edit490:setLeft(5);
    obj.edit490:setTop(0);
    obj.edit490:setWidth(190);
    obj.edit490:setHeight(25);
    obj.edit490:setField("Equipamento_3_17");
    obj.edit490:setName("edit490");

    obj.edit491 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit491:setParent(obj.layout154);
    obj.edit491:setLeft(195);
    obj.edit491:setTop(0);
    obj.edit491:setWidth(50);
    obj.edit491:setHeight(25);
    obj.edit491:setField("Equipamento_Custo_3_17");
    obj.edit491:setName("edit491");

    obj.edit492 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit492:setParent(obj.layout154);
    obj.edit492:setLeft(245);
    obj.edit492:setTop(0);
    obj.edit492:setWidth(50);
    obj.edit492:setHeight(25);
    obj.edit492:setField("Equipamento_Peso_3_17");
    obj.edit492:setName("edit492");

    obj.layout155 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.layout136);
    obj.layout155:setLeft(0);
    obj.layout155:setTop(480);
    obj.layout155:setWidth(300);
    obj.layout155:setHeight(25);
    obj.layout155:setName("layout155");

    obj.edit493 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit493:setParent(obj.layout155);
    obj.edit493:setLeft(5);
    obj.edit493:setTop(0);
    obj.edit493:setWidth(190);
    obj.edit493:setHeight(25);
    obj.edit493:setField("Equipamento_3_18");
    obj.edit493:setName("edit493");

    obj.edit494 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit494:setParent(obj.layout155);
    obj.edit494:setLeft(195);
    obj.edit494:setTop(0);
    obj.edit494:setWidth(50);
    obj.edit494:setHeight(25);
    obj.edit494:setField("Equipamento_Custo_3_18");
    obj.edit494:setName("edit494");

    obj.edit495 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit495:setParent(obj.layout155);
    obj.edit495:setLeft(245);
    obj.edit495:setTop(0);
    obj.edit495:setWidth(50);
    obj.edit495:setHeight(25);
    obj.edit495:setField("Equipamento_Peso_3_18");
    obj.edit495:setName("edit495");

    obj.layout156 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.layout136);
    obj.layout156:setLeft(0);
    obj.layout156:setTop(505);
    obj.layout156:setWidth(300);
    obj.layout156:setHeight(25);
    obj.layout156:setName("layout156");

    obj.edit496 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit496:setParent(obj.layout156);
    obj.edit496:setLeft(5);
    obj.edit496:setTop(0);
    obj.edit496:setWidth(190);
    obj.edit496:setHeight(25);
    obj.edit496:setField("Equipamento_3_19");
    obj.edit496:setName("edit496");

    obj.edit497 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit497:setParent(obj.layout156);
    obj.edit497:setLeft(195);
    obj.edit497:setTop(0);
    obj.edit497:setWidth(50);
    obj.edit497:setHeight(25);
    obj.edit497:setField("Equipamento_Custo_3_19");
    obj.edit497:setName("edit497");

    obj.edit498 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit498:setParent(obj.layout156);
    obj.edit498:setLeft(245);
    obj.edit498:setTop(0);
    obj.edit498:setWidth(50);
    obj.edit498:setHeight(25);
    obj.edit498:setField("Equipamento_Peso_3_19");
    obj.edit498:setName("edit498");

    obj.layout157 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.layout136);
    obj.layout157:setLeft(0);
    obj.layout157:setTop(530);
    obj.layout157:setWidth(300);
    obj.layout157:setHeight(25);
    obj.layout157:setName("layout157");

    obj.edit499 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit499:setParent(obj.layout157);
    obj.edit499:setLeft(5);
    obj.edit499:setTop(0);
    obj.edit499:setWidth(190);
    obj.edit499:setHeight(25);
    obj.edit499:setField("Equipamento_3_20");
    obj.edit499:setName("edit499");

    obj.edit500 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit500:setParent(obj.layout157);
    obj.edit500:setLeft(195);
    obj.edit500:setTop(0);
    obj.edit500:setWidth(50);
    obj.edit500:setHeight(25);
    obj.edit500:setField("Equipamento_Custo_3_20");
    obj.edit500:setName("edit500");

    obj.edit501 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit501:setParent(obj.layout157);
    obj.edit501:setLeft(245);
    obj.edit501:setTop(0);
    obj.edit501:setWidth(50);
    obj.edit501:setHeight(25);
    obj.edit501:setField("Equipamento_Peso_3_20");
    obj.edit501:setName("edit501");

    obj.layout158 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.layout136);
    obj.layout158:setLeft(0);
    obj.layout158:setTop(555);
    obj.layout158:setWidth(300);
    obj.layout158:setHeight(25);
    obj.layout158:setName("layout158");

    obj.edit502 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit502:setParent(obj.layout158);
    obj.edit502:setLeft(5);
    obj.edit502:setTop(0);
    obj.edit502:setWidth(190);
    obj.edit502:setHeight(25);
    obj.edit502:setField("Equipamento_3_21");
    obj.edit502:setName("edit502");

    obj.edit503 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit503:setParent(obj.layout158);
    obj.edit503:setLeft(195);
    obj.edit503:setTop(0);
    obj.edit503:setWidth(50);
    obj.edit503:setHeight(25);
    obj.edit503:setField("Equipamento_Custo_3_21");
    obj.edit503:setName("edit503");

    obj.edit504 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit504:setParent(obj.layout158);
    obj.edit504:setLeft(245);
    obj.edit504:setTop(0);
    obj.edit504:setWidth(50);
    obj.edit504:setHeight(25);
    obj.edit504:setField("Equipamento_Peso_3_21");
    obj.edit504:setName("edit504");

    obj.layout159 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.layout136);
    obj.layout159:setLeft(0);
    obj.layout159:setTop(580);
    obj.layout159:setWidth(300);
    obj.layout159:setHeight(25);
    obj.layout159:setName("layout159");

    obj.edit505 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit505:setParent(obj.layout159);
    obj.edit505:setLeft(5);
    obj.edit505:setTop(0);
    obj.edit505:setWidth(190);
    obj.edit505:setHeight(25);
    obj.edit505:setField("Equipamento_3_22");
    obj.edit505:setName("edit505");

    obj.edit506 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit506:setParent(obj.layout159);
    obj.edit506:setLeft(195);
    obj.edit506:setTop(0);
    obj.edit506:setWidth(50);
    obj.edit506:setHeight(25);
    obj.edit506:setField("Equipamento_Custo_3_22");
    obj.edit506:setName("edit506");

    obj.edit507 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit507:setParent(obj.layout159);
    obj.edit507:setLeft(245);
    obj.edit507:setTop(0);
    obj.edit507:setWidth(50);
    obj.edit507:setHeight(25);
    obj.edit507:setField("Equipamento_Peso_3_22");
    obj.edit507:setName("edit507");

    obj.layout160 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.scrollBox3);
    obj.layout160:setLeft(930);
    obj.layout160:setTop(0);
    obj.layout160:setWidth(300);
    obj.layout160:setHeight(115);
    obj.layout160:setName("layout160");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout160);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setXradius(5);
    obj.rectangle20:setYradius(5);
    obj.rectangle20:setCornerType("round");
    obj.rectangle20:setName("rectangle20");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout160);
    obj.label142:setLeft(0);
    obj.label142:setTop(5);
    obj.label142:setWidth(300);
    obj.label142:setHeight(20);
    obj.label142:setText("DINHEIRO E CARGA");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout160);
    obj.label143:setLeft(5);
    obj.label143:setTop(55);
    obj.label143:setWidth(60);
    obj.label143:setHeight(20);
    obj.label143:setText("CARGA");
    obj.label143:setHorzTextAlign("trailing");
    obj.label143:setName("label143");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout160);
    obj.rectangle21:setLeft(70);
    obj.rectangle21:setTop(50);
    obj.rectangle21:setWidth(40);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("Black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout160);
    obj.label144:setLeft(70);
    obj.label144:setTop(50);
    obj.label144:setWidth(40);
    obj.label144:setHeight(25);
    obj.label144:setField("Peso_Total");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout160);
    obj.label145:setLeft(120);
    obj.label145:setTop(55);
    obj.label145:setWidth(60);
    obj.label145:setHeight(20);
    obj.label145:setText("GASTOS");
    obj.label145:setHorzTextAlign("trailing");
    obj.label145:setName("label145");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout160);
    obj.rectangle22:setLeft(185);
    obj.rectangle22:setTop(50);
    obj.rectangle22:setWidth(40);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("Black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout160);
    obj.label146:setLeft(185);
    obj.label146:setTop(50);
    obj.label146:setWidth(40);
    obj.label146:setHeight(25);
    obj.label146:setField("Custo_Total");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout160);
    obj.label147:setLeft(5);
    obj.label147:setTop(90);
    obj.label147:setWidth(20);
    obj.label147:setHeight(20);
    obj.label147:setText("PL");
    obj.label147:setHorzTextAlign("trailing");
    obj.label147:setName("label147");

    obj.edit508 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit508:setParent(obj.layout160);
    obj.edit508:setLeft(30);
    obj.edit508:setTop(85);
    obj.edit508:setWidth(40);
    obj.edit508:setHeight(25);
    obj.edit508:setField("PL");
    obj.edit508:setName("edit508");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout160);
    obj.label148:setLeft(70);
    obj.label148:setTop(90);
    obj.label148:setWidth(20);
    obj.label148:setHeight(20);
    obj.label148:setText("PO");
    obj.label148:setHorzTextAlign("trailing");
    obj.label148:setName("label148");

    obj.edit509 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit509:setParent(obj.layout160);
    obj.edit509:setLeft(95);
    obj.edit509:setTop(85);
    obj.edit509:setWidth(40);
    obj.edit509:setHeight(25);
    obj.edit509:setField("PO");
    obj.edit509:setName("edit509");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout160);
    obj.label149:setLeft(135);
    obj.label149:setTop(90);
    obj.label149:setWidth(20);
    obj.label149:setHeight(20);
    obj.label149:setText("PP");
    obj.label149:setHorzTextAlign("trailing");
    obj.label149:setName("label149");

    obj.edit510 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit510:setParent(obj.layout160);
    obj.edit510:setLeft(160);
    obj.edit510:setTop(85);
    obj.edit510:setWidth(40);
    obj.edit510:setHeight(25);
    obj.edit510:setField("PP");
    obj.edit510:setName("edit510");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout160);
    obj.label150:setLeft(200);
    obj.label150:setTop(90);
    obj.label150:setWidth(20);
    obj.label150:setHeight(20);
    obj.label150:setText("PC");
    obj.label150:setHorzTextAlign("trailing");
    obj.label150:setName("label150");

    obj.edit511 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit511:setParent(obj.layout160);
    obj.edit511:setLeft(225);
    obj.edit511:setTop(85);
    obj.edit511:setWidth(40);
    obj.edit511:setHeight(25);
    obj.edit511:setField("PC");
    obj.edit511:setName("edit511");

    obj.layout161 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.scrollBox3);
    obj.layout161:setLeft(930);
    obj.layout161:setTop(120);
    obj.layout161:setWidth(300);
    obj.layout161:setHeight(490);
    obj.layout161:setName("layout161");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout161);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("black");
    obj.rectangle23:setXradius(5);
    obj.rectangle23:setYradius(5);
    obj.rectangle23:setCornerType("round");
    obj.rectangle23:setName("rectangle23");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout161);
    obj.label151:setLeft(0);
    obj.label151:setTop(5);
    obj.label151:setWidth(300);
    obj.label151:setHeight(20);
    obj.label151:setText("OUTROS");
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout161);
    obj.textEditor5:setLeft(5);
    obj.textEditor5:setTop(30);
    obj.textEditor5:setWidth(290);
    obj.textEditor5:setHeight(450);
    obj.textEditor5:setField("Equipamentos_Outros");
    obj.textEditor5:setName("textEditor5");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox3);
    obj.image5:setAlign("client");
    obj.image5:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20ADnD%20releases/imagens/block.png");
    obj.image5:setStyle("autoFit");
    obj.image5:setName("image5");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Magias");
    obj.tab4:setName("tab4");

    obj.frmADnD4 = gui.fromHandle(_obj_newObject("form"));
    obj.frmADnD4:setParent(obj.tab4);
    obj.frmADnD4:setName("frmADnD4");
    obj.frmADnD4:setAlign("client");
    obj.frmADnD4:setTheme("dark");
    obj.frmADnD4:setMargins({top=1});

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmADnD4);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout162 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.scrollBox4);
    obj.layout162:setLeft(0);
    obj.layout162:setTop(0);
    obj.layout162:setWidth(140);
    obj.layout162:setHeight(255);
    obj.layout162:setName("layout162");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout162);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("black");
    obj.rectangle24:setXradius(5);
    obj.rectangle24:setYradius(5);
    obj.rectangle24:setCornerType("round");
    obj.rectangle24:setName("rectangle24");

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout162);
    obj.label152:setLeft(0);
    obj.label152:setTop(5);
    obj.label152:setWidth(140);
    obj.label152:setHeight(20);
    obj.label152:setText("MAGIAS POR DIA");
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout162);
    obj.label153:setLeft(25);
    obj.label153:setTop(25);
    obj.label153:setWidth(60);
    obj.label153:setHeight(20);
    obj.label153:setFontSize(13);
    obj.label153:setHorzTextAlign("center");
    obj.label153:setText("1º");
    obj.label153:setName("label153");

    obj.edit512 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit512:setParent(obj.layout162);
    obj.edit512:setLeft(75);
    obj.edit512:setTop(25);
    obj.edit512:setWidth(40);
    obj.edit512:setHeight(25);
    obj.edit512:setField("Circulo1");
    obj.edit512:setName("edit512");

    obj.label154 = gui.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout162);
    obj.label154:setLeft(25);
    obj.label154:setTop(50);
    obj.label154:setWidth(60);
    obj.label154:setHeight(20);
    obj.label154:setFontSize(13);
    obj.label154:setHorzTextAlign("center");
    obj.label154:setText("2º");
    obj.label154:setName("label154");

    obj.edit513 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit513:setParent(obj.layout162);
    obj.edit513:setLeft(75);
    obj.edit513:setTop(50);
    obj.edit513:setWidth(40);
    obj.edit513:setHeight(25);
    obj.edit513:setField("Circulo2");
    obj.edit513:setName("edit513");

    obj.label155 = gui.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout162);
    obj.label155:setLeft(25);
    obj.label155:setTop(75);
    obj.label155:setWidth(60);
    obj.label155:setHeight(20);
    obj.label155:setFontSize(13);
    obj.label155:setHorzTextAlign("center");
    obj.label155:setText("3º");
    obj.label155:setName("label155");

    obj.edit514 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit514:setParent(obj.layout162);
    obj.edit514:setLeft(75);
    obj.edit514:setTop(75);
    obj.edit514:setWidth(40);
    obj.edit514:setHeight(25);
    obj.edit514:setField("Circulo3");
    obj.edit514:setName("edit514");

    obj.label156 = gui.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout162);
    obj.label156:setLeft(25);
    obj.label156:setTop(100);
    obj.label156:setWidth(60);
    obj.label156:setHeight(20);
    obj.label156:setFontSize(13);
    obj.label156:setHorzTextAlign("center");
    obj.label156:setText("4º");
    obj.label156:setName("label156");

    obj.edit515 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit515:setParent(obj.layout162);
    obj.edit515:setLeft(75);
    obj.edit515:setTop(100);
    obj.edit515:setWidth(40);
    obj.edit515:setHeight(25);
    obj.edit515:setField("Circulo4");
    obj.edit515:setName("edit515");

    obj.label157 = gui.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout162);
    obj.label157:setLeft(25);
    obj.label157:setTop(125);
    obj.label157:setWidth(60);
    obj.label157:setHeight(20);
    obj.label157:setFontSize(13);
    obj.label157:setHorzTextAlign("center");
    obj.label157:setText("5º");
    obj.label157:setName("label157");

    obj.edit516 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit516:setParent(obj.layout162);
    obj.edit516:setLeft(75);
    obj.edit516:setTop(125);
    obj.edit516:setWidth(40);
    obj.edit516:setHeight(25);
    obj.edit516:setField("Circulo5");
    obj.edit516:setName("edit516");

    obj.label158 = gui.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout162);
    obj.label158:setLeft(25);
    obj.label158:setTop(150);
    obj.label158:setWidth(60);
    obj.label158:setHeight(20);
    obj.label158:setFontSize(13);
    obj.label158:setHorzTextAlign("center");
    obj.label158:setText("6º");
    obj.label158:setName("label158");

    obj.edit517 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit517:setParent(obj.layout162);
    obj.edit517:setLeft(75);
    obj.edit517:setTop(150);
    obj.edit517:setWidth(40);
    obj.edit517:setHeight(25);
    obj.edit517:setField("Circulo6");
    obj.edit517:setName("edit517");

    obj.label159 = gui.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout162);
    obj.label159:setLeft(25);
    obj.label159:setTop(175);
    obj.label159:setWidth(60);
    obj.label159:setHeight(20);
    obj.label159:setFontSize(13);
    obj.label159:setHorzTextAlign("center");
    obj.label159:setText("7º");
    obj.label159:setName("label159");

    obj.edit518 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit518:setParent(obj.layout162);
    obj.edit518:setLeft(75);
    obj.edit518:setTop(175);
    obj.edit518:setWidth(40);
    obj.edit518:setHeight(25);
    obj.edit518:setField("Circulo7");
    obj.edit518:setName("edit518");

    obj.label160 = gui.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout162);
    obj.label160:setLeft(25);
    obj.label160:setTop(200);
    obj.label160:setWidth(60);
    obj.label160:setHeight(20);
    obj.label160:setFontSize(13);
    obj.label160:setHorzTextAlign("center");
    obj.label160:setText("8º");
    obj.label160:setName("label160");

    obj.edit519 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit519:setParent(obj.layout162);
    obj.edit519:setLeft(75);
    obj.edit519:setTop(200);
    obj.edit519:setWidth(40);
    obj.edit519:setHeight(25);
    obj.edit519:setField("Circulo8");
    obj.edit519:setName("edit519");

    obj.label161 = gui.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout162);
    obj.label161:setLeft(25);
    obj.label161:setTop(225);
    obj.label161:setWidth(60);
    obj.label161:setHeight(20);
    obj.label161:setFontSize(13);
    obj.label161:setHorzTextAlign("center");
    obj.label161:setText("9º");
    obj.label161:setName("label161");

    obj.edit520 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit520:setParent(obj.layout162);
    obj.edit520:setLeft(75);
    obj.edit520:setTop(225);
    obj.edit520:setWidth(40);
    obj.edit520:setHeight(25);
    obj.edit520:setField("Circulo9");
    obj.edit520:setName("edit520");

    obj.layout163 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.scrollBox4);
    obj.layout163:setLeft(150);
    obj.layout163:setTop(0);
    obj.layout163:setWidth(150);
    obj.layout163:setHeight(255);
    obj.layout163:setName("layout163");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout163);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("black");
    obj.rectangle25:setXradius(5);
    obj.rectangle25:setYradius(5);
    obj.rectangle25:setCornerType("round");
    obj.rectangle25:setName("rectangle25");

    obj.label162 = gui.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout163);
    obj.label162:setLeft(0);
    obj.label162:setTop(5);
    obj.label162:setWidth(140);
    obj.label162:setHeight(20);
    obj.label162:setText("GRIMÓRIO");
    obj.label162:setHorzTextAlign("center");
    obj.label162:setName("label162");

    obj.label163 = gui.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout163);
    obj.label163:setLeft(5);
    obj.label163:setTop(30);
    obj.label163:setWidth(45);
    obj.label163:setHeight(20);
    obj.label163:setFontSize(13);
    obj.label163:setHorzTextAlign("center");
    obj.label163:setText("Total");
    obj.label163:setName("label163");

    obj.label164 = gui.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout163);
    obj.label164:setLeft(50);
    obj.label164:setTop(30);
    obj.label164:setWidth(45);
    obj.label164:setHeight(20);
    obj.label164:setFontSize(13);
    obj.label164:setHorzTextAlign("center");
    obj.label164:setText("Usadas");
    obj.label164:setName("label164");

    obj.label165 = gui.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout163);
    obj.label165:setLeft(95);
    obj.label165:setTop(30);
    obj.label165:setWidth(45);
    obj.label165:setHeight(20);
    obj.label165:setFontSize(13);
    obj.label165:setHorzTextAlign("center");
    obj.label165:setText("Vazias");
    obj.label165:setName("label165");

    obj.edit521 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit521:setParent(obj.layout163);
    obj.edit521:setLeft(5);
    obj.edit521:setTop(50);
    obj.edit521:setWidth(45);
    obj.edit521:setHeight(25);
    obj.edit521:setField("Grimorio_total_1");
    obj.edit521:setName("edit521");

    obj.edit522 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit522:setParent(obj.layout163);
    obj.edit522:setLeft(50);
    obj.edit522:setTop(50);
    obj.edit522:setWidth(45);
    obj.edit522:setHeight(25);
    obj.edit522:setField("Grimorio_usadas_1");
    obj.edit522:setName("edit522");

    obj.edit523 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit523:setParent(obj.layout163);
    obj.edit523:setLeft(95);
    obj.edit523:setTop(50);
    obj.edit523:setWidth(45);
    obj.edit523:setHeight(25);
    obj.edit523:setField("Grimorio_vazias_1");
    obj.edit523:setName("edit523");

    obj.edit524 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit524:setParent(obj.layout163);
    obj.edit524:setLeft(5);
    obj.edit524:setTop(75);
    obj.edit524:setWidth(45);
    obj.edit524:setHeight(25);
    obj.edit524:setField("Grimorio_total_2");
    obj.edit524:setName("edit524");

    obj.edit525 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit525:setParent(obj.layout163);
    obj.edit525:setLeft(50);
    obj.edit525:setTop(75);
    obj.edit525:setWidth(45);
    obj.edit525:setHeight(25);
    obj.edit525:setField("Grimorio_usadas_2");
    obj.edit525:setName("edit525");

    obj.edit526 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit526:setParent(obj.layout163);
    obj.edit526:setLeft(95);
    obj.edit526:setTop(75);
    obj.edit526:setWidth(45);
    obj.edit526:setHeight(25);
    obj.edit526:setField("Grimorio_vazias_2");
    obj.edit526:setName("edit526");

    obj.edit527 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit527:setParent(obj.layout163);
    obj.edit527:setLeft(5);
    obj.edit527:setTop(100);
    obj.edit527:setWidth(45);
    obj.edit527:setHeight(25);
    obj.edit527:setField("Grimorio_total_3");
    obj.edit527:setName("edit527");

    obj.edit528 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit528:setParent(obj.layout163);
    obj.edit528:setLeft(50);
    obj.edit528:setTop(100);
    obj.edit528:setWidth(45);
    obj.edit528:setHeight(25);
    obj.edit528:setField("Grimorio_usadas_3");
    obj.edit528:setName("edit528");

    obj.edit529 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit529:setParent(obj.layout163);
    obj.edit529:setLeft(95);
    obj.edit529:setTop(100);
    obj.edit529:setWidth(45);
    obj.edit529:setHeight(25);
    obj.edit529:setField("Grimorio_vazias_3");
    obj.edit529:setName("edit529");

    obj.edit530 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit530:setParent(obj.layout163);
    obj.edit530:setLeft(5);
    obj.edit530:setTop(125);
    obj.edit530:setWidth(45);
    obj.edit530:setHeight(25);
    obj.edit530:setField("Grimorio_total_4");
    obj.edit530:setName("edit530");

    obj.edit531 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit531:setParent(obj.layout163);
    obj.edit531:setLeft(50);
    obj.edit531:setTop(125);
    obj.edit531:setWidth(45);
    obj.edit531:setHeight(25);
    obj.edit531:setField("Grimorio_usadas_4");
    obj.edit531:setName("edit531");

    obj.edit532 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit532:setParent(obj.layout163);
    obj.edit532:setLeft(95);
    obj.edit532:setTop(125);
    obj.edit532:setWidth(45);
    obj.edit532:setHeight(25);
    obj.edit532:setField("Grimorio_vazias_4");
    obj.edit532:setName("edit532");

    obj.edit533 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit533:setParent(obj.layout163);
    obj.edit533:setLeft(5);
    obj.edit533:setTop(150);
    obj.edit533:setWidth(45);
    obj.edit533:setHeight(25);
    obj.edit533:setField("Grimorio_total_5");
    obj.edit533:setName("edit533");

    obj.edit534 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit534:setParent(obj.layout163);
    obj.edit534:setLeft(50);
    obj.edit534:setTop(150);
    obj.edit534:setWidth(45);
    obj.edit534:setHeight(25);
    obj.edit534:setField("Grimorio_usadas_5");
    obj.edit534:setName("edit534");

    obj.edit535 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit535:setParent(obj.layout163);
    obj.edit535:setLeft(95);
    obj.edit535:setTop(150);
    obj.edit535:setWidth(45);
    obj.edit535:setHeight(25);
    obj.edit535:setField("Grimorio_vazias_5");
    obj.edit535:setName("edit535");

    obj.edit536 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit536:setParent(obj.layout163);
    obj.edit536:setLeft(5);
    obj.edit536:setTop(175);
    obj.edit536:setWidth(45);
    obj.edit536:setHeight(25);
    obj.edit536:setField("Grimorio_total_6");
    obj.edit536:setName("edit536");

    obj.edit537 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit537:setParent(obj.layout163);
    obj.edit537:setLeft(50);
    obj.edit537:setTop(175);
    obj.edit537:setWidth(45);
    obj.edit537:setHeight(25);
    obj.edit537:setField("Grimorio_usadas_6");
    obj.edit537:setName("edit537");

    obj.edit538 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit538:setParent(obj.layout163);
    obj.edit538:setLeft(95);
    obj.edit538:setTop(175);
    obj.edit538:setWidth(45);
    obj.edit538:setHeight(25);
    obj.edit538:setField("Grimorio_vazias_6");
    obj.edit538:setName("edit538");

    obj.edit539 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit539:setParent(obj.layout163);
    obj.edit539:setLeft(5);
    obj.edit539:setTop(200);
    obj.edit539:setWidth(45);
    obj.edit539:setHeight(25);
    obj.edit539:setField("Grimorio_total_7");
    obj.edit539:setName("edit539");

    obj.edit540 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit540:setParent(obj.layout163);
    obj.edit540:setLeft(50);
    obj.edit540:setTop(200);
    obj.edit540:setWidth(45);
    obj.edit540:setHeight(25);
    obj.edit540:setField("Grimorio_usadas_7");
    obj.edit540:setName("edit540");

    obj.edit541 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit541:setParent(obj.layout163);
    obj.edit541:setLeft(95);
    obj.edit541:setTop(200);
    obj.edit541:setWidth(45);
    obj.edit541:setHeight(25);
    obj.edit541:setField("Grimorio_vazias_7");
    obj.edit541:setName("edit541");

    obj.edit542 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit542:setParent(obj.layout163);
    obj.edit542:setLeft(5);
    obj.edit542:setTop(225);
    obj.edit542:setWidth(45);
    obj.edit542:setHeight(25);
    obj.edit542:setField("Grimorio_total_8");
    obj.edit542:setName("edit542");

    obj.edit543 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit543:setParent(obj.layout163);
    obj.edit543:setLeft(50);
    obj.edit543:setTop(225);
    obj.edit543:setWidth(45);
    obj.edit543:setHeight(25);
    obj.edit543:setField("Grimorio_usadas_8");
    obj.edit543:setName("edit543");

    obj.edit544 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit544:setParent(obj.layout163);
    obj.edit544:setLeft(95);
    obj.edit544:setTop(225);
    obj.edit544:setWidth(45);
    obj.edit544:setHeight(25);
    obj.edit544:setField("Grimorio_vazias_8");
    obj.edit544:setName("edit544");

    obj.layout164 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.scrollBox4);
    obj.layout164:setLeft(0);
    obj.layout164:setTop(260);
    obj.layout164:setWidth(300);
    obj.layout164:setHeight(340);
    obj.layout164:setName("layout164");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout164);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setXradius(5);
    obj.rectangle26:setYradius(5);
    obj.rectangle26:setCornerType("round");
    obj.rectangle26:setName("rectangle26");

    obj.label166 = gui.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout164);
    obj.label166:setLeft(0);
    obj.label166:setTop(5);
    obj.label166:setWidth(300);
    obj.label166:setHeight(20);
    obj.label166:setText("ITENS DE MAGIA");
    obj.label166:setHorzTextAlign("center");
    obj.label166:setName("label166");

    obj.layout165 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.layout164);
    obj.layout165:setLeft(0);
    obj.layout165:setTop(30);
    obj.layout165:setWidth(300);
    obj.layout165:setHeight(25);
    obj.layout165:setName("layout165");

    obj.label167 = gui.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout165);
    obj.label167:setLeft(5);
    obj.label167:setTop(0);
    obj.label167:setWidth(190);
    obj.label167:setHeight(25);
    obj.label167:setHorzTextAlign("center");
    obj.label167:setText("Item");
    obj.label167:setName("label167");

    obj.label168 = gui.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout165);
    obj.label168:setLeft(195);
    obj.label168:setTop(0);
    obj.label168:setWidth(50);
    obj.label168:setHeight(25);
    obj.label168:setHorzTextAlign("center");
    obj.label168:setText("Custo");
    obj.label168:setName("label168");

    obj.label169 = gui.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout165);
    obj.label169:setLeft(245);
    obj.label169:setTop(0);
    obj.label169:setWidth(50);
    obj.label169:setHeight(25);
    obj.label169:setHorzTextAlign("center");
    obj.label169:setText("Quantidade");
    obj.label169:setFontSize(9);
    obj.label169:setName("label169");

    obj.layout166 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.layout164);
    obj.layout166:setLeft(0);
    obj.layout166:setTop(55);
    obj.layout166:setWidth(300);
    obj.layout166:setHeight(25);
    obj.layout166:setName("layout166");

    obj.edit545 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit545:setParent(obj.layout166);
    obj.edit545:setLeft(5);
    obj.edit545:setTop(0);
    obj.edit545:setWidth(190);
    obj.edit545:setHeight(25);
    obj.edit545:setField("ItemMagico_1_1");
    obj.edit545:setName("edit545");

    obj.edit546 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit546:setParent(obj.layout166);
    obj.edit546:setLeft(195);
    obj.edit546:setTop(0);
    obj.edit546:setWidth(50);
    obj.edit546:setHeight(25);
    obj.edit546:setField("ItemMagico_Custo_1_1");
    obj.edit546:setName("edit546");

    obj.edit547 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit547:setParent(obj.layout166);
    obj.edit547:setLeft(245);
    obj.edit547:setTop(0);
    obj.edit547:setWidth(50);
    obj.edit547:setHeight(25);
    obj.edit547:setField("ItemMagico_Quantia_1_1");
    obj.edit547:setName("edit547");

    obj.layout167 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.layout164);
    obj.layout167:setLeft(0);
    obj.layout167:setTop(80);
    obj.layout167:setWidth(300);
    obj.layout167:setHeight(25);
    obj.layout167:setName("layout167");

    obj.edit548 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit548:setParent(obj.layout167);
    obj.edit548:setLeft(5);
    obj.edit548:setTop(0);
    obj.edit548:setWidth(190);
    obj.edit548:setHeight(25);
    obj.edit548:setField("ItemMagico_1_2");
    obj.edit548:setName("edit548");

    obj.edit549 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit549:setParent(obj.layout167);
    obj.edit549:setLeft(195);
    obj.edit549:setTop(0);
    obj.edit549:setWidth(50);
    obj.edit549:setHeight(25);
    obj.edit549:setField("ItemMagico_Custo_1_2");
    obj.edit549:setName("edit549");

    obj.edit550 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit550:setParent(obj.layout167);
    obj.edit550:setLeft(245);
    obj.edit550:setTop(0);
    obj.edit550:setWidth(50);
    obj.edit550:setHeight(25);
    obj.edit550:setField("ItemMagico_Quantia_1_2");
    obj.edit550:setName("edit550");

    obj.layout168 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.layout164);
    obj.layout168:setLeft(0);
    obj.layout168:setTop(105);
    obj.layout168:setWidth(300);
    obj.layout168:setHeight(25);
    obj.layout168:setName("layout168");

    obj.edit551 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit551:setParent(obj.layout168);
    obj.edit551:setLeft(5);
    obj.edit551:setTop(0);
    obj.edit551:setWidth(190);
    obj.edit551:setHeight(25);
    obj.edit551:setField("ItemMagico_1_3");
    obj.edit551:setName("edit551");

    obj.edit552 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit552:setParent(obj.layout168);
    obj.edit552:setLeft(195);
    obj.edit552:setTop(0);
    obj.edit552:setWidth(50);
    obj.edit552:setHeight(25);
    obj.edit552:setField("ItemMagico_Custo_1_3");
    obj.edit552:setName("edit552");

    obj.edit553 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit553:setParent(obj.layout168);
    obj.edit553:setLeft(245);
    obj.edit553:setTop(0);
    obj.edit553:setWidth(50);
    obj.edit553:setHeight(25);
    obj.edit553:setField("ItemMagico_Quantia_1_3");
    obj.edit553:setName("edit553");

    obj.layout169 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.layout164);
    obj.layout169:setLeft(0);
    obj.layout169:setTop(130);
    obj.layout169:setWidth(300);
    obj.layout169:setHeight(25);
    obj.layout169:setName("layout169");

    obj.edit554 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit554:setParent(obj.layout169);
    obj.edit554:setLeft(5);
    obj.edit554:setTop(0);
    obj.edit554:setWidth(190);
    obj.edit554:setHeight(25);
    obj.edit554:setField("ItemMagico_1_4");
    obj.edit554:setName("edit554");

    obj.edit555 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit555:setParent(obj.layout169);
    obj.edit555:setLeft(195);
    obj.edit555:setTop(0);
    obj.edit555:setWidth(50);
    obj.edit555:setHeight(25);
    obj.edit555:setField("ItemMagico_Custo_1_4");
    obj.edit555:setName("edit555");

    obj.edit556 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit556:setParent(obj.layout169);
    obj.edit556:setLeft(245);
    obj.edit556:setTop(0);
    obj.edit556:setWidth(50);
    obj.edit556:setHeight(25);
    obj.edit556:setField("ItemMagico_Quantia_1_4");
    obj.edit556:setName("edit556");

    obj.layout170 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.layout164);
    obj.layout170:setLeft(0);
    obj.layout170:setTop(155);
    obj.layout170:setWidth(300);
    obj.layout170:setHeight(25);
    obj.layout170:setName("layout170");

    obj.edit557 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit557:setParent(obj.layout170);
    obj.edit557:setLeft(5);
    obj.edit557:setTop(0);
    obj.edit557:setWidth(190);
    obj.edit557:setHeight(25);
    obj.edit557:setField("ItemMagico_1_5");
    obj.edit557:setName("edit557");

    obj.edit558 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit558:setParent(obj.layout170);
    obj.edit558:setLeft(195);
    obj.edit558:setTop(0);
    obj.edit558:setWidth(50);
    obj.edit558:setHeight(25);
    obj.edit558:setField("ItemMagico_Custo_1_5");
    obj.edit558:setName("edit558");

    obj.edit559 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit559:setParent(obj.layout170);
    obj.edit559:setLeft(245);
    obj.edit559:setTop(0);
    obj.edit559:setWidth(50);
    obj.edit559:setHeight(25);
    obj.edit559:setField("ItemMagico_Quantia_1_5");
    obj.edit559:setName("edit559");

    obj.layout171 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.layout164);
    obj.layout171:setLeft(0);
    obj.layout171:setTop(180);
    obj.layout171:setWidth(300);
    obj.layout171:setHeight(25);
    obj.layout171:setName("layout171");

    obj.edit560 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit560:setParent(obj.layout171);
    obj.edit560:setLeft(5);
    obj.edit560:setTop(0);
    obj.edit560:setWidth(190);
    obj.edit560:setHeight(25);
    obj.edit560:setField("ItemMagico_1_6");
    obj.edit560:setName("edit560");

    obj.edit561 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit561:setParent(obj.layout171);
    obj.edit561:setLeft(195);
    obj.edit561:setTop(0);
    obj.edit561:setWidth(50);
    obj.edit561:setHeight(25);
    obj.edit561:setField("ItemMagico_Custo_1_6");
    obj.edit561:setName("edit561");

    obj.edit562 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit562:setParent(obj.layout171);
    obj.edit562:setLeft(245);
    obj.edit562:setTop(0);
    obj.edit562:setWidth(50);
    obj.edit562:setHeight(25);
    obj.edit562:setField("ItemMagico_Quantia_1_6");
    obj.edit562:setName("edit562");

    obj.layout172 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.layout164);
    obj.layout172:setLeft(0);
    obj.layout172:setTop(205);
    obj.layout172:setWidth(300);
    obj.layout172:setHeight(25);
    obj.layout172:setName("layout172");

    obj.edit563 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit563:setParent(obj.layout172);
    obj.edit563:setLeft(5);
    obj.edit563:setTop(0);
    obj.edit563:setWidth(190);
    obj.edit563:setHeight(25);
    obj.edit563:setField("ItemMagico_1_7");
    obj.edit563:setName("edit563");

    obj.edit564 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit564:setParent(obj.layout172);
    obj.edit564:setLeft(195);
    obj.edit564:setTop(0);
    obj.edit564:setWidth(50);
    obj.edit564:setHeight(25);
    obj.edit564:setField("ItemMagico_Custo_1_7");
    obj.edit564:setName("edit564");

    obj.edit565 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit565:setParent(obj.layout172);
    obj.edit565:setLeft(245);
    obj.edit565:setTop(0);
    obj.edit565:setWidth(50);
    obj.edit565:setHeight(25);
    obj.edit565:setField("ItemMagico_Quantia_1_7");
    obj.edit565:setName("edit565");

    obj.layout173 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.layout164);
    obj.layout173:setLeft(0);
    obj.layout173:setTop(230);
    obj.layout173:setWidth(300);
    obj.layout173:setHeight(25);
    obj.layout173:setName("layout173");

    obj.edit566 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit566:setParent(obj.layout173);
    obj.edit566:setLeft(5);
    obj.edit566:setTop(0);
    obj.edit566:setWidth(190);
    obj.edit566:setHeight(25);
    obj.edit566:setField("ItemMagico_1_8");
    obj.edit566:setName("edit566");

    obj.edit567 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit567:setParent(obj.layout173);
    obj.edit567:setLeft(195);
    obj.edit567:setTop(0);
    obj.edit567:setWidth(50);
    obj.edit567:setHeight(25);
    obj.edit567:setField("ItemMagico_Custo_1_8");
    obj.edit567:setName("edit567");

    obj.edit568 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit568:setParent(obj.layout173);
    obj.edit568:setLeft(245);
    obj.edit568:setTop(0);
    obj.edit568:setWidth(50);
    obj.edit568:setHeight(25);
    obj.edit568:setField("ItemMagico_Quantia_1_8");
    obj.edit568:setName("edit568");

    obj.layout174 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.layout164);
    obj.layout174:setLeft(0);
    obj.layout174:setTop(255);
    obj.layout174:setWidth(300);
    obj.layout174:setHeight(25);
    obj.layout174:setName("layout174");

    obj.edit569 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit569:setParent(obj.layout174);
    obj.edit569:setLeft(5);
    obj.edit569:setTop(0);
    obj.edit569:setWidth(190);
    obj.edit569:setHeight(25);
    obj.edit569:setField("ItemMagico_1_9");
    obj.edit569:setName("edit569");

    obj.edit570 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit570:setParent(obj.layout174);
    obj.edit570:setLeft(195);
    obj.edit570:setTop(0);
    obj.edit570:setWidth(50);
    obj.edit570:setHeight(25);
    obj.edit570:setField("ItemMagico_Custo_1_9");
    obj.edit570:setName("edit570");

    obj.edit571 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit571:setParent(obj.layout174);
    obj.edit571:setLeft(245);
    obj.edit571:setTop(0);
    obj.edit571:setWidth(50);
    obj.edit571:setHeight(25);
    obj.edit571:setField("ItemMagico_Quantia_1_9");
    obj.edit571:setName("edit571");

    obj.layout175 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.layout164);
    obj.layout175:setLeft(0);
    obj.layout175:setTop(280);
    obj.layout175:setWidth(300);
    obj.layout175:setHeight(25);
    obj.layout175:setName("layout175");

    obj.edit572 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit572:setParent(obj.layout175);
    obj.edit572:setLeft(5);
    obj.edit572:setTop(0);
    obj.edit572:setWidth(190);
    obj.edit572:setHeight(25);
    obj.edit572:setField("ItemMagico_1_10");
    obj.edit572:setName("edit572");

    obj.edit573 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit573:setParent(obj.layout175);
    obj.edit573:setLeft(195);
    obj.edit573:setTop(0);
    obj.edit573:setWidth(50);
    obj.edit573:setHeight(25);
    obj.edit573:setField("ItemMagico_Custo_1_10");
    obj.edit573:setName("edit573");

    obj.edit574 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit574:setParent(obj.layout175);
    obj.edit574:setLeft(245);
    obj.edit574:setTop(0);
    obj.edit574:setWidth(50);
    obj.edit574:setHeight(25);
    obj.edit574:setField("ItemMagico_Quantia_1_10");
    obj.edit574:setName("edit574");

    obj.layout176 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.layout164);
    obj.layout176:setLeft(0);
    obj.layout176:setTop(305);
    obj.layout176:setWidth(300);
    obj.layout176:setHeight(25);
    obj.layout176:setName("layout176");

    obj.edit575 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit575:setParent(obj.layout176);
    obj.edit575:setLeft(5);
    obj.edit575:setTop(0);
    obj.edit575:setWidth(190);
    obj.edit575:setHeight(25);
    obj.edit575:setField("ItemMagico_1_11");
    obj.edit575:setName("edit575");

    obj.edit576 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit576:setParent(obj.layout176);
    obj.edit576:setLeft(195);
    obj.edit576:setTop(0);
    obj.edit576:setWidth(50);
    obj.edit576:setHeight(25);
    obj.edit576:setField("ItemMagico_Custo_1_11");
    obj.edit576:setName("edit576");

    obj.edit577 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit577:setParent(obj.layout176);
    obj.edit577:setLeft(245);
    obj.edit577:setTop(0);
    obj.edit577:setWidth(50);
    obj.edit577:setHeight(25);
    obj.edit577:setField("ItemMagico_Quantia_1_11");
    obj.edit577:setName("edit577");

    obj.layout177 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.scrollBox4);
    obj.layout177:setLeft(310);
    obj.layout177:setTop(0);
    obj.layout177:setWidth(300);
    obj.layout177:setHeight(200);
    obj.layout177:setName("layout177");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout177);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("black");
    obj.rectangle27:setXradius(5);
    obj.rectangle27:setYradius(5);
    obj.rectangle27:setCornerType("round");
    obj.rectangle27:setName("rectangle27");

    obj.label170 = gui.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout177);
    obj.label170:setLeft(0);
    obj.label170:setTop(5);
    obj.label170:setWidth(300);
    obj.label170:setHeight(20);
    obj.label170:setText("1º CIRCULO");
    obj.label170:setHorzTextAlign("center");
    obj.label170:setName("label170");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout177);
    obj.textEditor6:setLeft(5);
    obj.textEditor6:setTop(30);
    obj.textEditor6:setWidth(290);
    obj.textEditor6:setHeight(165);
    obj.textEditor6:setField("magia1");
    obj.textEditor6:setName("textEditor6");

    obj.layout178 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.scrollBox4);
    obj.layout178:setLeft(620);
    obj.layout178:setTop(0);
    obj.layout178:setWidth(300);
    obj.layout178:setHeight(200);
    obj.layout178:setName("layout178");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout178);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setXradius(5);
    obj.rectangle28:setYradius(5);
    obj.rectangle28:setCornerType("round");
    obj.rectangle28:setName("rectangle28");

    obj.label171 = gui.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout178);
    obj.label171:setLeft(0);
    obj.label171:setTop(5);
    obj.label171:setWidth(300);
    obj.label171:setHeight(20);
    obj.label171:setText("2º CIRCULO");
    obj.label171:setHorzTextAlign("center");
    obj.label171:setName("label171");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout178);
    obj.textEditor7:setLeft(5);
    obj.textEditor7:setTop(30);
    obj.textEditor7:setWidth(290);
    obj.textEditor7:setHeight(165);
    obj.textEditor7:setField("magia2");
    obj.textEditor7:setName("textEditor7");

    obj.layout179 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.scrollBox4);
    obj.layout179:setLeft(930);
    obj.layout179:setTop(0);
    obj.layout179:setWidth(300);
    obj.layout179:setHeight(200);
    obj.layout179:setName("layout179");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout179);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setXradius(5);
    obj.rectangle29:setYradius(5);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setName("rectangle29");

    obj.label172 = gui.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout179);
    obj.label172:setLeft(0);
    obj.label172:setTop(5);
    obj.label172:setWidth(300);
    obj.label172:setHeight(20);
    obj.label172:setText("3º CIRCULO");
    obj.label172:setHorzTextAlign("center");
    obj.label172:setName("label172");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout179);
    obj.textEditor8:setLeft(5);
    obj.textEditor8:setTop(30);
    obj.textEditor8:setWidth(290);
    obj.textEditor8:setHeight(165);
    obj.textEditor8:setField("magia3");
    obj.textEditor8:setName("textEditor8");

    obj.layout180 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.scrollBox4);
    obj.layout180:setLeft(310);
    obj.layout180:setTop(205);
    obj.layout180:setWidth(300);
    obj.layout180:setHeight(200);
    obj.layout180:setName("layout180");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout180);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("black");
    obj.rectangle30:setXradius(5);
    obj.rectangle30:setYradius(5);
    obj.rectangle30:setCornerType("round");
    obj.rectangle30:setName("rectangle30");

    obj.label173 = gui.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout180);
    obj.label173:setLeft(0);
    obj.label173:setTop(5);
    obj.label173:setWidth(300);
    obj.label173:setHeight(20);
    obj.label173:setText("4º CIRCULO");
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout180);
    obj.textEditor9:setLeft(5);
    obj.textEditor9:setTop(30);
    obj.textEditor9:setWidth(290);
    obj.textEditor9:setHeight(165);
    obj.textEditor9:setField("magia4");
    obj.textEditor9:setName("textEditor9");

    obj.layout181 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.scrollBox4);
    obj.layout181:setLeft(620);
    obj.layout181:setTop(205);
    obj.layout181:setWidth(300);
    obj.layout181:setHeight(200);
    obj.layout181:setName("layout181");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout181);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("black");
    obj.rectangle31:setXradius(5);
    obj.rectangle31:setYradius(5);
    obj.rectangle31:setCornerType("round");
    obj.rectangle31:setName("rectangle31");

    obj.label174 = gui.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout181);
    obj.label174:setLeft(0);
    obj.label174:setTop(5);
    obj.label174:setWidth(300);
    obj.label174:setHeight(20);
    obj.label174:setText("5º CIRCULO");
    obj.label174:setHorzTextAlign("center");
    obj.label174:setName("label174");

    obj.textEditor10 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout181);
    obj.textEditor10:setLeft(5);
    obj.textEditor10:setTop(30);
    obj.textEditor10:setWidth(290);
    obj.textEditor10:setHeight(165);
    obj.textEditor10:setField("magia5");
    obj.textEditor10:setName("textEditor10");

    obj.layout182 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.scrollBox4);
    obj.layout182:setLeft(930);
    obj.layout182:setTop(205);
    obj.layout182:setWidth(300);
    obj.layout182:setHeight(200);
    obj.layout182:setName("layout182");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout182);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setXradius(5);
    obj.rectangle32:setYradius(5);
    obj.rectangle32:setCornerType("round");
    obj.rectangle32:setName("rectangle32");

    obj.label175 = gui.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout182);
    obj.label175:setLeft(0);
    obj.label175:setTop(5);
    obj.label175:setWidth(300);
    obj.label175:setHeight(20);
    obj.label175:setText("6º CIRCULO");
    obj.label175:setHorzTextAlign("center");
    obj.label175:setName("label175");

    obj.textEditor11 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout182);
    obj.textEditor11:setLeft(5);
    obj.textEditor11:setTop(30);
    obj.textEditor11:setWidth(290);
    obj.textEditor11:setHeight(165);
    obj.textEditor11:setField("magia6");
    obj.textEditor11:setName("textEditor11");

    obj.layout183 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.scrollBox4);
    obj.layout183:setLeft(310);
    obj.layout183:setTop(410);
    obj.layout183:setWidth(300);
    obj.layout183:setHeight(200);
    obj.layout183:setName("layout183");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout183);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setColor("black");
    obj.rectangle33:setXradius(5);
    obj.rectangle33:setYradius(5);
    obj.rectangle33:setCornerType("round");
    obj.rectangle33:setName("rectangle33");

    obj.label176 = gui.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout183);
    obj.label176:setLeft(0);
    obj.label176:setTop(5);
    obj.label176:setWidth(300);
    obj.label176:setHeight(20);
    obj.label176:setText("7º CIRCULO");
    obj.label176:setHorzTextAlign("center");
    obj.label176:setName("label176");

    obj.textEditor12 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout183);
    obj.textEditor12:setLeft(5);
    obj.textEditor12:setTop(30);
    obj.textEditor12:setWidth(290);
    obj.textEditor12:setHeight(165);
    obj.textEditor12:setField("magia7");
    obj.textEditor12:setName("textEditor12");

    obj.layout184 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.scrollBox4);
    obj.layout184:setLeft(620);
    obj.layout184:setTop(410);
    obj.layout184:setWidth(300);
    obj.layout184:setHeight(200);
    obj.layout184:setName("layout184");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout184);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setXradius(5);
    obj.rectangle34:setYradius(5);
    obj.rectangle34:setCornerType("round");
    obj.rectangle34:setName("rectangle34");

    obj.label177 = gui.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout184);
    obj.label177:setLeft(0);
    obj.label177:setTop(5);
    obj.label177:setWidth(300);
    obj.label177:setHeight(20);
    obj.label177:setText("8º CIRCULO");
    obj.label177:setHorzTextAlign("center");
    obj.label177:setName("label177");

    obj.textEditor13 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout184);
    obj.textEditor13:setLeft(5);
    obj.textEditor13:setTop(30);
    obj.textEditor13:setWidth(290);
    obj.textEditor13:setHeight(165);
    obj.textEditor13:setField("magia8");
    obj.textEditor13:setName("textEditor13");

    obj.layout185 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.scrollBox4);
    obj.layout185:setLeft(930);
    obj.layout185:setTop(410);
    obj.layout185:setWidth(300);
    obj.layout185:setHeight(200);
    obj.layout185:setName("layout185");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout185);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("black");
    obj.rectangle35:setXradius(5);
    obj.rectangle35:setYradius(5);
    obj.rectangle35:setCornerType("round");
    obj.rectangle35:setName("rectangle35");

    obj.label178 = gui.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout185);
    obj.label178:setLeft(0);
    obj.label178:setTop(5);
    obj.label178:setWidth(300);
    obj.label178:setHeight(20);
    obj.label178:setText("9º CIRCULO");
    obj.label178:setHorzTextAlign("center");
    obj.label178:setName("label178");

    obj.textEditor14 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout185);
    obj.textEditor14:setLeft(5);
    obj.textEditor14:setTop(30);
    obj.textEditor14:setWidth(290);
    obj.textEditor14:setHeight(165);
    obj.textEditor14:setField("magia9");
    obj.textEditor14:setName("textEditor14");

    obj.image6 = gui.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.scrollBox4);
    obj.image6:setAlign("client");
    obj.image6:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20ADnD%20releases/imagens/block.png");
    obj.image6:setStyle("autoFit");
    obj.image6:setName("image6");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Descrições");
    obj.tab5:setName("tab5");

    obj.frmADnD5 = gui.fromHandle(_obj_newObject("form"));
    obj.frmADnD5:setParent(obj.tab5);
    obj.frmADnD5:setName("frmADnD5");
    obj.frmADnD5:setAlign("client");
    obj.frmADnD5:setTheme("dark");

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmADnD5);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout186 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.scrollBox5);
    obj.layout186:setLeft(0);
    obj.layout186:setTop(0);
    obj.layout186:setWidth(960);
    obj.layout186:setHeight(70);
    obj.layout186:setName("layout186");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout186);
    obj.rectangle36:setLeft(5);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(950);
    obj.rectangle36:setHeight(70);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setXradius(15);
    obj.rectangle36:setYradius(15);
    obj.rectangle36:setCornerType("round");
    obj.rectangle36:setName("rectangle36");

    obj.layout187 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.layout186);
    obj.layout187:setLeft(5);
    obj.layout187:setTop(5);
    obj.layout187:setWidth(310);
    obj.layout187:setHeight(25);
    obj.layout187:setName("layout187");

    obj.label179 = gui.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout187);
    obj.label179:setLeft(0);
    obj.label179:setTop(5);
    obj.label179:setWidth(100);
    obj.label179:setHeight(20);
    obj.label179:setText("Sexo");
    obj.label179:setHorzTextAlign("trailing");
    obj.label179:setName("label179");

    obj.edit578 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit578:setParent(obj.layout187);
    obj.edit578:setLeft(110);
    obj.edit578:setTop(0);
    obj.edit578:setWidth(200);
    obj.edit578:setHeight(25);
    obj.edit578:setField("desc_sexo");
    obj.edit578:setName("edit578");

    obj.layout188 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.layout186);
    obj.layout188:setLeft(320);
    obj.layout188:setTop(5);
    obj.layout188:setWidth(310);
    obj.layout188:setHeight(25);
    obj.layout188:setName("layout188");

    obj.label180 = gui.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout188);
    obj.label180:setLeft(0);
    obj.label180:setTop(5);
    obj.label180:setWidth(100);
    obj.label180:setHeight(20);
    obj.label180:setText("Altura");
    obj.label180:setHorzTextAlign("trailing");
    obj.label180:setName("label180");

    obj.edit579 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit579:setParent(obj.layout188);
    obj.edit579:setLeft(110);
    obj.edit579:setTop(0);
    obj.edit579:setWidth(200);
    obj.edit579:setHeight(25);
    obj.edit579:setField("desc_altura");
    obj.edit579:setName("edit579");

    obj.layout189 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.layout186);
    obj.layout189:setLeft(585);
    obj.layout189:setTop(5);
    obj.layout189:setWidth(310);
    obj.layout189:setHeight(25);
    obj.layout189:setName("layout189");

    obj.label181 = gui.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout189);
    obj.label181:setLeft(0);
    obj.label181:setTop(5);
    obj.label181:setWidth(100);
    obj.label181:setHeight(20);
    obj.label181:setText("Olhos");
    obj.label181:setHorzTextAlign("trailing");
    obj.label181:setName("label181");

    obj.edit580 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit580:setParent(obj.layout189);
    obj.edit580:setLeft(110);
    obj.edit580:setTop(0);
    obj.edit580:setWidth(200);
    obj.edit580:setHeight(25);
    obj.edit580:setField("desc_olhos");
    obj.edit580:setName("edit580");

    obj.layout190 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.layout186);
    obj.layout190:setLeft(5);
    obj.layout190:setTop(35);
    obj.layout190:setWidth(310);
    obj.layout190:setHeight(25);
    obj.layout190:setName("layout190");

    obj.label182 = gui.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout190);
    obj.label182:setLeft(0);
    obj.label182:setTop(5);
    obj.label182:setWidth(100);
    obj.label182:setHeight(20);
    obj.label182:setText("Idade");
    obj.label182:setHorzTextAlign("trailing");
    obj.label182:setName("label182");

    obj.edit581 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit581:setParent(obj.layout190);
    obj.edit581:setLeft(110);
    obj.edit581:setTop(0);
    obj.edit581:setWidth(200);
    obj.edit581:setHeight(25);
    obj.edit581:setField("desc_idade");
    obj.edit581:setName("edit581");

    obj.layout191 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.layout186);
    obj.layout191:setLeft(320);
    obj.layout191:setTop(35);
    obj.layout191:setWidth(310);
    obj.layout191:setHeight(25);
    obj.layout191:setName("layout191");

    obj.label183 = gui.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout191);
    obj.label183:setLeft(0);
    obj.label183:setTop(5);
    obj.label183:setWidth(100);
    obj.label183:setHeight(20);
    obj.label183:setText("Peso");
    obj.label183:setHorzTextAlign("trailing");
    obj.label183:setName("label183");

    obj.edit582 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit582:setParent(obj.layout191);
    obj.edit582:setLeft(110);
    obj.edit582:setTop(0);
    obj.edit582:setWidth(200);
    obj.edit582:setHeight(25);
    obj.edit582:setField("desc_peso");
    obj.edit582:setName("edit582");

    obj.layout192 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout192:setParent(obj.layout186);
    obj.layout192:setLeft(585);
    obj.layout192:setTop(35);
    obj.layout192:setWidth(310);
    obj.layout192:setHeight(25);
    obj.layout192:setName("layout192");

    obj.label184 = gui.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout192);
    obj.label184:setLeft(0);
    obj.label184:setTop(5);
    obj.label184:setWidth(100);
    obj.label184:setHeight(20);
    obj.label184:setText("Cabelo");
    obj.label184:setHorzTextAlign("trailing");
    obj.label184:setName("label184");

    obj.edit583 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit583:setParent(obj.layout192);
    obj.edit583:setLeft(110);
    obj.edit583:setTop(0);
    obj.edit583:setWidth(200);
    obj.edit583:setHeight(25);
    obj.edit583:setField("desc_cabelo");
    obj.edit583:setName("edit583");

    obj.layout193 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout193:setParent(obj.scrollBox5);
    obj.layout193:setLeft(0);
    obj.layout193:setTop(80);
    obj.layout193:setWidth(400);
    obj.layout193:setHeight(175);
    obj.layout193:setName("layout193");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout193);
    obj.rectangle37:setLeft(0);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(400);
    obj.rectangle37:setHeight(175);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setXradius(15);
    obj.rectangle37:setYradius(15);
    obj.rectangle37:setCornerType("round");
    obj.rectangle37:setName("rectangle37");

    obj.label185 = gui.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout193);
    obj.label185:setLeft(0);
    obj.label185:setTop(0);
    obj.label185:setWidth(400);
    obj.label185:setHeight(20);
    obj.label185:setText("Aparencia");
    obj.label185:setHorzTextAlign("center");
    obj.label185:setName("label185");

    obj.textEditor15 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout193);
    obj.textEditor15:setLeft(10);
    obj.textEditor15:setTop(25);
    obj.textEditor15:setWidth(380);
    obj.textEditor15:setHeight(135);
    obj.textEditor15:setField("aparencia");
    obj.textEditor15:setName("textEditor15");

    obj.layout194 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout194:setParent(obj.scrollBox5);
    obj.layout194:setLeft(0);
    obj.layout194:setTop(260);
    obj.layout194:setWidth(400);
    obj.layout194:setHeight(175);
    obj.layout194:setName("layout194");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout194);
    obj.rectangle38:setLeft(0);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(400);
    obj.rectangle38:setHeight(175);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setXradius(15);
    obj.rectangle38:setYradius(15);
    obj.rectangle38:setCornerType("round");
    obj.rectangle38:setName("rectangle38");

    obj.label186 = gui.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout194);
    obj.label186:setLeft(0);
    obj.label186:setTop(0);
    obj.label186:setWidth(400);
    obj.label186:setHeight(20);
    obj.label186:setText("Personalidade");
    obj.label186:setHorzTextAlign("center");
    obj.label186:setName("label186");

    obj.textEditor16 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout194);
    obj.textEditor16:setLeft(10);
    obj.textEditor16:setTop(25);
    obj.textEditor16:setWidth(380);
    obj.textEditor16:setHeight(135);
    obj.textEditor16:setField("personalidade");
    obj.textEditor16:setName("textEditor16");

    obj.layout195 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout195:setParent(obj.scrollBox5);
    obj.layout195:setLeft(0);
    obj.layout195:setTop(440);
    obj.layout195:setWidth(400);
    obj.layout195:setHeight(175);
    obj.layout195:setName("layout195");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout195);
    obj.rectangle39:setLeft(0);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(400);
    obj.rectangle39:setHeight(175);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setXradius(15);
    obj.rectangle39:setYradius(15);
    obj.rectangle39:setCornerType("round");
    obj.rectangle39:setName("rectangle39");

    obj.label187 = gui.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout195);
    obj.label187:setLeft(0);
    obj.label187:setTop(0);
    obj.label187:setWidth(400);
    obj.label187:setHeight(20);
    obj.label187:setText("Idiomas");
    obj.label187:setHorzTextAlign("center");
    obj.label187:setName("label187");

    obj.textEditor17 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout195);
    obj.textEditor17:setLeft(10);
    obj.textEditor17:setTop(25);
    obj.textEditor17:setWidth(380);
    obj.textEditor17:setHeight(135);
    obj.textEditor17:setField("idiomas");
    obj.textEditor17:setName("textEditor17");

    obj.layout196 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout196:setParent(obj.scrollBox5);
    obj.layout196:setLeft(410);
    obj.layout196:setTop(80);
    obj.layout196:setWidth(600);
    obj.layout196:setHeight(535);
    obj.layout196:setName("layout196");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout196);
    obj.rectangle40:setLeft(0);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(600);
    obj.rectangle40:setHeight(535);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setXradius(15);
    obj.rectangle40:setYradius(15);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setName("rectangle40");

    obj.label188 = gui.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout196);
    obj.label188:setLeft(0);
    obj.label188:setTop(0);
    obj.label188:setWidth(600);
    obj.label188:setHeight(20);
    obj.label188:setText("Historia");
    obj.label188:setHorzTextAlign("center");
    obj.label188:setName("label188");

    obj.textEditor18 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout196);
    obj.textEditor18:setLeft(10);
    obj.textEditor18:setTop(25);
    obj.textEditor18:setWidth(580);
    obj.textEditor18:setHeight(495);
    obj.textEditor18:setField("historia");
    obj.textEditor18:setName("textEditor18");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Anotações");
    obj.tab6:setName("tab6");

    obj.frmADnD6 = gui.fromHandle(_obj_newObject("form"));
    obj.frmADnD6:setParent(obj.tab6);
    obj.frmADnD6:setName("frmADnD6");
    obj.frmADnD6:setAlign("client");
    obj.frmADnD6:setTheme("dark");

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmADnD6);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout197 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout197:setParent(obj.scrollBox6);
    obj.layout197:setLeft(0);
    obj.layout197:setTop(0);
    obj.layout197:setWidth(400);
    obj.layout197:setHeight(580);
    obj.layout197:setName("layout197");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout197);
    obj.rectangle41:setLeft(0);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(400);
    obj.rectangle41:setHeight(580);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setXradius(5);
    obj.rectangle41:setYradius(5);
    obj.rectangle41:setCornerType("round");
    obj.rectangle41:setName("rectangle41");

    obj.label189 = gui.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout197);
    obj.label189:setLeft(0);
    obj.label189:setTop(0);
    obj.label189:setWidth(400);
    obj.label189:setHeight(20);
    obj.label189:setText("Anotações");
    obj.label189:setHorzTextAlign("center");
    obj.label189:setName("label189");

    obj.textEditor19 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout197);
    obj.textEditor19:setLeft(10);
    obj.textEditor19:setTop(25);
    obj.textEditor19:setWidth(380);
    obj.textEditor19:setHeight(540);
    obj.textEditor19:setField("anotacoes1");
    obj.textEditor19:setName("textEditor19");

    obj.layout198 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout198:setParent(obj.scrollBox6);
    obj.layout198:setLeft(410);
    obj.layout198:setTop(0);
    obj.layout198:setWidth(400);
    obj.layout198:setHeight(580);
    obj.layout198:setName("layout198");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout198);
    obj.rectangle42:setLeft(0);
    obj.rectangle42:setTop(0);
    obj.rectangle42:setWidth(400);
    obj.rectangle42:setHeight(580);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setXradius(5);
    obj.rectangle42:setYradius(5);
    obj.rectangle42:setCornerType("round");
    obj.rectangle42:setName("rectangle42");

    obj.label190 = gui.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout198);
    obj.label190:setLeft(0);
    obj.label190:setTop(0);
    obj.label190:setWidth(400);
    obj.label190:setHeight(20);
    obj.label190:setText("Anotações");
    obj.label190:setHorzTextAlign("center");
    obj.label190:setName("label190");

    obj.textEditor20 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.layout198);
    obj.textEditor20:setLeft(10);
    obj.textEditor20:setTop(25);
    obj.textEditor20:setWidth(380);
    obj.textEditor20:setHeight(540);
    obj.textEditor20:setField("anotacoes2");
    obj.textEditor20:setName("textEditor20");

    obj.layout199 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout199:setParent(obj.scrollBox6);
    obj.layout199:setLeft(820);
    obj.layout199:setTop(0);
    obj.layout199:setWidth(400);
    obj.layout199:setHeight(580);
    obj.layout199:setName("layout199");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout199);
    obj.rectangle43:setLeft(0);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(400);
    obj.rectangle43:setHeight(580);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setXradius(5);
    obj.rectangle43:setYradius(5);
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setName("rectangle43");

    obj.label191 = gui.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout199);
    obj.label191:setLeft(0);
    obj.label191:setTop(0);
    obj.label191:setWidth(400);
    obj.label191:setHeight(20);
    obj.label191:setText("Anotações");
    obj.label191:setHorzTextAlign("center");
    obj.label191:setName("label191");

    obj.textEditor21 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.layout199);
    obj.textEditor21:setLeft(10);
    obj.textEditor21:setTop(25);
    obj.textEditor21:setWidth(380);
    obj.textEditor21:setHeight(540);
    obj.textEditor21:setField("anotacoes3");
    obj.textEditor21:setName("textEditor21");

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Creditos");
    obj.tab7:setName("tab7");

    obj.frmADnD7 = gui.fromHandle(_obj_newObject("form"));
    obj.frmADnD7:setParent(obj.tab7);
    obj.frmADnD7:setName("frmADnD7");
    obj.frmADnD7:setAlign("client");
    obj.frmADnD7:setTheme("dark");

    obj.scrollBox7 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmADnD7);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.image7 = gui.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox7);
    obj.image7:setLeft(0);
    obj.image7:setTop(0);
    obj.image7:setWidth(500);
    obj.image7:setHeight(250);
    obj.image7:setStyle("stretch");
    obj.image7:setSRC("/Ficha ADnD 2e/images/ADnD.png");
    obj.image7:setName("image7");

    obj.image8 = gui.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.scrollBox7);
    obj.image8:setLeft(550);
    obj.image8:setTop(0);
    obj.image8:setWidth(250);
    obj.image8:setHeight(250);
    obj.image8:setStyle("stretch");
    obj.image8:setSRC("/Ficha ADnD 2e/images/RPGmeister.jpg");
    obj.image8:setName("image8");

    obj.layout200 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout200:setParent(obj.scrollBox7);
    obj.layout200:setLeft(550);
    obj.layout200:setTop(300);
    obj.layout200:setWidth(200);
    obj.layout200:setHeight(150);
    obj.layout200:setName("layout200");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout200);
    obj.rectangle44:setLeft(0);
    obj.rectangle44:setTop(0);
    obj.rectangle44:setWidth(200);
    obj.rectangle44:setHeight(150);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setXradius(15);
    obj.rectangle44:setYradius(15);
    obj.rectangle44:setCornerType("round");
    obj.rectangle44:setName("rectangle44");

    obj.label192 = gui.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout200);
    obj.label192:setLeft(0);
    obj.label192:setTop(10);
    obj.label192:setWidth(200);
    obj.label192:setHeight(20);
    obj.label192:setText("Programador: Vinny (Ambesek)");
    obj.label192:setHorzTextAlign("center");
    obj.label192:setName("label192");

    obj.label193 = gui.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout200);
    obj.label193:setLeft(0);
    obj.label193:setTop(35);
    obj.label193:setWidth(200);
    obj.label193:setHeight(20);
    obj.label193:setText("Arte: Nefer (Nefertyne)");
    obj.label193:setHorzTextAlign("center");
    obj.label193:setName("label193");

    obj.label194 = gui.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout200);
    obj.label194:setLeft(0);
    obj.label194:setTop(60);
    obj.label194:setWidth(200);
    obj.label194:setHeight(20);
    obj.label194:setText("Consultor: KONDAKJR (Kondak)");
    obj.label194:setHorzTextAlign("center");
    obj.label194:setName("label194");

    obj.label195 = gui.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout200);
    obj.label195:setLeft(0);
    obj.label195:setTop(95);
    obj.label195:setWidth(200);
    obj.label195:setHeight(20);
    obj.label195:setText("Ficha feita para a mesa AD&D");
    obj.label195:setHorzTextAlign("center");
    obj.label195:setName("label195");

    obj.label196 = gui.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout200);
    obj.label196:setLeft(0);
    obj.label196:setTop(120);
    obj.label196:setWidth(200);
    obj.label196:setHeight(20);
    obj.label196:setText("Sistema: AD&D 2e");
    obj.label196:setHorzTextAlign("center");
    obj.label196:setName("label196");

    obj.label197 = gui.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.scrollBox7);
    obj.label197:setLeft(755);
    obj.label197:setTop(300);
    obj.label197:setWidth(100);
    obj.label197:setHeight(20);
    obj.label197:setText("Versão Atual: ");
    obj.label197:setHorzTextAlign("center");
    obj.label197:setName("label197");

    obj.image9 = gui.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.scrollBox7);
    obj.image9:setLeft(867);
    obj.image9:setTop(300);
    obj.image9:setWidth(100);
    obj.image9:setHeight(20);
    obj.image9:setStyle("autoFit");
    obj.image9:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao02.png");
    obj.image9:setName("image9");

    obj.label198 = gui.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.scrollBox7);
    obj.label198:setLeft(755);
    obj.label198:setTop(325);
    obj.label198:setWidth(100);
    obj.label198:setHeight(20);
    obj.label198:setText("Ultima Versão: ");
    obj.label198:setHorzTextAlign("center");
    obj.label198:setName("label198");

    obj.image10 = gui.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.scrollBox7);
    obj.image10:setLeft(867);
    obj.image10:setTop(325);
    obj.image10:setWidth(100);
    obj.image10:setHeight(20);
    obj.image10:setStyle("autoFit");
    obj.image10:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20ADnD%20releases/release.png");
    obj.image10:setName("image10");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox7);
    obj.button1:setLeft(755);
    obj.button1:setTop(350);
    obj.button1:setWidth(100);
    obj.button1:setText("Change Log");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox7);
    obj.button2:setLeft(867);
    obj.button2:setTop(350);
    obj.button2:setWidth(100);
    obj.button2:setText("Atualizar");
    obj.button2:setName("button2");

    obj.label199 = gui.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.scrollBox7);
    obj.label199:setLeft(755);
    obj.label199:setTop(400);
    obj.label199:setWidth(200);
    obj.label199:setHeight(20);
    obj.label199:setText("Conheça as Mesas:");
    obj.label199:setName("label199");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox7);
    obj.button3:setLeft(755);
    obj.button3:setTop(425);
    obj.button3:setWidth(100);
    obj.button3:setText("RPGmeister");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox7);
    obj.button4:setLeft(867);
    obj.button4:setTop(425);
    obj.button4:setWidth(100);
    obj.button4:setText("ADnD 2e");
    obj.button4:setName("button4");

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

    obj._e_event4 = obj.edit311:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event5 = obj.edit312:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event6 = obj.edit314:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event7 = obj.edit315:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event8 = obj.edit317:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event9 = obj.edit318:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event10 = obj.edit320:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event11 = obj.edit321:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event12 = obj.edit323:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event13 = obj.edit324:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event14 = obj.edit326:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event15 = obj.edit327:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event16 = obj.edit329:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event17 = obj.edit330:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event18 = obj.edit332:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event19 = obj.edit333:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event20 = obj.edit335:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event21 = obj.edit336:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event22 = obj.edit338:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event23 = obj.edit339:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event24 = obj.edit341:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event25 = obj.edit342:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event26 = obj.edit344:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event27 = obj.edit345:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event28 = obj.edit347:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event29 = obj.edit348:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event30 = obj.edit350:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event31 = obj.edit351:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event32 = obj.edit353:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event33 = obj.edit354:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event34 = obj.edit356:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event35 = obj.edit357:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event36 = obj.edit359:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event37 = obj.edit360:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event38 = obj.edit362:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event39 = obj.edit363:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event40 = obj.edit365:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event41 = obj.edit366:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event42 = obj.edit368:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event43 = obj.edit369:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event44 = obj.edit371:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event45 = obj.edit372:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event46 = obj.edit374:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event47 = obj.edit375:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event48 = obj.edit377:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event49 = obj.edit378:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event50 = obj.edit380:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event51 = obj.edit381:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event52 = obj.edit383:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event53 = obj.edit384:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event54 = obj.edit386:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event55 = obj.edit387:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event56 = obj.edit389:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event57 = obj.edit390:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event58 = obj.edit392:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event59 = obj.edit393:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event60 = obj.edit395:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event61 = obj.edit396:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event62 = obj.edit398:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event63 = obj.edit399:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event64 = obj.edit401:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event65 = obj.edit402:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event66 = obj.edit404:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event67 = obj.edit405:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event68 = obj.edit407:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event69 = obj.edit408:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event70 = obj.edit410:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event71 = obj.edit411:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event72 = obj.edit413:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event73 = obj.edit414:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event74 = obj.edit416:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event75 = obj.edit417:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event76 = obj.edit419:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event77 = obj.edit420:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event78 = obj.edit422:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event79 = obj.edit423:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event80 = obj.edit425:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event81 = obj.edit426:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event82 = obj.edit428:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event83 = obj.edit429:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event84 = obj.edit431:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event85 = obj.edit432:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event86 = obj.edit434:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event87 = obj.edit435:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event88 = obj.edit437:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event89 = obj.edit438:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event90 = obj.edit440:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event91 = obj.edit441:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event92 = obj.edit443:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event93 = obj.edit444:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event94 = obj.edit446:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event95 = obj.edit447:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event96 = obj.edit449:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event97 = obj.edit450:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event98 = obj.edit452:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event99 = obj.edit453:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event100 = obj.edit455:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event101 = obj.edit456:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event102 = obj.edit458:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event103 = obj.edit459:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event104 = obj.edit461:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event105 = obj.edit462:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event106 = obj.edit464:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event107 = obj.edit465:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event108 = obj.edit467:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event109 = obj.edit468:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event110 = obj.edit470:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event111 = obj.edit471:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event112 = obj.edit473:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event113 = obj.edit474:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event114 = obj.edit476:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event115 = obj.edit477:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event116 = obj.edit479:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event117 = obj.edit480:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event118 = obj.edit482:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event119 = obj.edit483:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event120 = obj.edit485:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event121 = obj.edit486:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event122 = obj.edit488:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event123 = obj.edit489:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event124 = obj.edit491:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event125 = obj.edit492:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event126 = obj.edit494:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event127 = obj.edit495:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event128 = obj.edit497:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event129 = obj.edit498:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event130 = obj.edit500:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event131 = obj.edit501:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event132 = obj.edit503:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event133 = obj.edit504:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event134 = obj.edit506:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event135 = obj.edit507:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event136 = obj.edit546:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event137 = obj.edit549:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event138 = obj.edit552:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event139 = obj.edit555:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event140 = obj.edit558:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event141 = obj.edit561:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event142 = obj.edit564:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event143 = obj.edit567:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event144 = obj.edit570:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event145 = obj.edit573:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event146 = obj.edit576:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event147 = obj.button1:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20ADnD%20releases/Change%20Log.txt');
        end, obj);

    obj._e_event148 = obj.button2:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20ADnD%20releases/Ficha%20AD&D%202e.rpk');
        end, obj);

    obj._e_event149 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event150 = obj.button4:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=116028');
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event150);
        __o_rrpgObjs.removeEventListenerById(self._e_event149);
        __o_rrpgObjs.removeEventListenerById(self._e_event148);
        __o_rrpgObjs.removeEventListenerById(self._e_event147);
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
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

        if self.edit273 ~= nil then self.edit273:destroy(); self.edit273 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.edit573 ~= nil then self.edit573:destroy(); self.edit573 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.edit568 ~= nil then self.edit568:destroy(); self.edit568 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.edit480 ~= nil then self.edit480:destroy(); self.edit480 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit431 ~= nil then self.edit431:destroy(); self.edit431 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit457 ~= nil then self.edit457:destroy(); self.edit457 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit462 ~= nil then self.edit462:destroy(); self.edit462 = nil; end;
        if self.edit508 ~= nil then self.edit508:destroy(); self.edit508 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.edit523 ~= nil then self.edit523:destroy(); self.edit523 = nil; end;
        if self.edit570 ~= nil then self.edit570:destroy(); self.edit570 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.edit366 ~= nil then self.edit366:destroy(); self.edit366 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit429 ~= nil then self.edit429:destroy(); self.edit429 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit442 ~= nil then self.edit442:destroy(); self.edit442 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit464 ~= nil then self.edit464:destroy(); self.edit464 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.edit466 ~= nil then self.edit466:destroy(); self.edit466 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.edit504 ~= nil then self.edit504:destroy(); self.edit504 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit532 ~= nil then self.edit532:destroy(); self.edit532 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.edit519 ~= nil then self.edit519:destroy(); self.edit519 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.layout194 ~= nil then self.layout194:destroy(); self.layout194 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit312 ~= nil then self.edit312:destroy(); self.edit312 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit400 ~= nil then self.edit400:destroy(); self.edit400 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.edit339 ~= nil then self.edit339:destroy(); self.edit339 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.edit518 ~= nil then self.edit518:destroy(); self.edit518 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit404 ~= nil then self.edit404:destroy(); self.edit404 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.edit510 ~= nil then self.edit510:destroy(); self.edit510 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.edit446 ~= nil then self.edit446:destroy(); self.edit446 = nil; end;
        if self.edit347 ~= nil then self.edit347:destroy(); self.edit347 = nil; end;
        if self.edit465 ~= nil then self.edit465:destroy(); self.edit465 = nil; end;
        if self.edit475 ~= nil then self.edit475:destroy(); self.edit475 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit343 ~= nil then self.edit343:destroy(); self.edit343 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.edit549 ~= nil then self.edit549:destroy(); self.edit549 = nil; end;
        if self.edit304 ~= nil then self.edit304:destroy(); self.edit304 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit309 ~= nil then self.edit309:destroy(); self.edit309 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.edit369 ~= nil then self.edit369:destroy(); self.edit369 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.edit440 ~= nil then self.edit440:destroy(); self.edit440 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.edit501 ~= nil then self.edit501:destroy(); self.edit501 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.edit572 ~= nil then self.edit572:destroy(); self.edit572 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.edit348 ~= nil then self.edit348:destroy(); self.edit348 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.edit513 ~= nil then self.edit513:destroy(); self.edit513 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit476 ~= nil then self.edit476:destroy(); self.edit476 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.edit419 ~= nil then self.edit419:destroy(); self.edit419 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.edit360 ~= nil then self.edit360:destroy(); self.edit360 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit542 ~= nil then self.edit542:destroy(); self.edit542 = nil; end;
        if self.edit373 ~= nil then self.edit373:destroy(); self.edit373 = nil; end;
        if self.edit332 ~= nil then self.edit332:destroy(); self.edit332 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.edit489 ~= nil then self.edit489:destroy(); self.edit489 = nil; end;
        if self.edit499 ~= nil then self.edit499:destroy(); self.edit499 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit313 ~= nil then self.edit313:destroy(); self.edit313 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.frmADnD7 ~= nil then self.frmADnD7:destroy(); self.frmADnD7 = nil; end;
        if self.edit358 ~= nil then self.edit358:destroy(); self.edit358 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit520 ~= nil then self.edit520:destroy(); self.edit520 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit355 ~= nil then self.edit355:destroy(); self.edit355 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.edit473 ~= nil then self.edit473:destroy(); self.edit473 = nil; end;
        if self.layout200 ~= nil then self.layout200:destroy(); self.layout200 = nil; end;
        if self.edit490 ~= nil then self.edit490:destroy(); self.edit490 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.edit483 ~= nil then self.edit483:destroy(); self.edit483 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit302 ~= nil then self.edit302:destroy(); self.edit302 = nil; end;
        if self.edit390 ~= nil then self.edit390:destroy(); self.edit390 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit308 ~= nil then self.edit308:destroy(); self.edit308 = nil; end;
        if self.edit559 ~= nil then self.edit559:destroy(); self.edit559 = nil; end;
        if self.edit300 ~= nil then self.edit300:destroy(); self.edit300 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.edit398 ~= nil then self.edit398:destroy(); self.edit398 = nil; end;
        if self.edit529 ~= nil then self.edit529:destroy(); self.edit529 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.edit389 ~= nil then self.edit389:destroy(); self.edit389 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.edit314 ~= nil then self.edit314:destroy(); self.edit314 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.edit439 ~= nil then self.edit439:destroy(); self.edit439 = nil; end;
        if self.edit553 ~= nil then self.edit553:destroy(); self.edit553 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit581 ~= nil then self.edit581:destroy(); self.edit581 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.edit393 ~= nil then self.edit393:destroy(); self.edit393 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit543 ~= nil then self.edit543:destroy(); self.edit543 = nil; end;
        if self.edit547 ~= nil then self.edit547:destroy(); self.edit547 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.edit556 ~= nil then self.edit556:destroy(); self.edit556 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit359 ~= nil then self.edit359:destroy(); self.edit359 = nil; end;
        if self.edit500 ~= nil then self.edit500:destroy(); self.edit500 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.edit459 ~= nil then self.edit459:destroy(); self.edit459 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.edit528 ~= nil then self.edit528:destroy(); self.edit528 = nil; end;
        if self.edit567 ~= nil then self.edit567:destroy(); self.edit567 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit333 ~= nil then self.edit333:destroy(); self.edit333 = nil; end;
        if self.edit310 ~= nil then self.edit310:destroy(); self.edit310 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.edit561 ~= nil then self.edit561:destroy(); self.edit561 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit492 ~= nil then self.edit492:destroy(); self.edit492 = nil; end;
        if self.edit544 ~= nil then self.edit544:destroy(); self.edit544 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit557 ~= nil then self.edit557:destroy(); self.edit557 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit416 ~= nil then self.edit416:destroy(); self.edit416 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.edit479 ~= nil then self.edit479:destroy(); self.edit479 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit382 ~= nil then self.edit382:destroy(); self.edit382 = nil; end;
        if self.edit454 ~= nil then self.edit454:destroy(); self.edit454 = nil; end;
        if self.edit298 ~= nil then self.edit298:destroy(); self.edit298 = nil; end;
        if self.edit526 ~= nil then self.edit526:destroy(); self.edit526 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit530 ~= nil then self.edit530:destroy(); self.edit530 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.edit397 ~= nil then self.edit397:destroy(); self.edit397 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.edit467 ~= nil then self.edit467:destroy(); self.edit467 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.layout199 ~= nil then self.layout199:destroy(); self.layout199 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.edit365 ~= nil then self.edit365:destroy(); self.edit365 = nil; end;
        if self.edit540 ~= nil then self.edit540:destroy(); self.edit540 = nil; end;
        if self.edit451 ~= nil then self.edit451:destroy(); self.edit451 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit391 ~= nil then self.edit391:destroy(); self.edit391 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.edit582 ~= nil then self.edit582:destroy(); self.edit582 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit353 ~= nil then self.edit353:destroy(); self.edit353 = nil; end;
        if self.edit402 ~= nil then self.edit402:destroy(); self.edit402 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit349 ~= nil then self.edit349:destroy(); self.edit349 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.edit326 ~= nil then self.edit326:destroy(); self.edit326 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit558 ~= nil then self.edit558:destroy(); self.edit558 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit449 ~= nil then self.edit449:destroy(); self.edit449 = nil; end;
        if self.edit338 ~= nil then self.edit338:destroy(); self.edit338 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit354 ~= nil then self.edit354:destroy(); self.edit354 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit293 ~= nil then self.edit293:destroy(); self.edit293 = nil; end;
        if self.edit481 ~= nil then self.edit481:destroy(); self.edit481 = nil; end;
        if self.edit515 ~= nil then self.edit515:destroy(); self.edit515 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit421 ~= nil then self.edit421:destroy(); self.edit421 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.edit361 ~= nil then self.edit361:destroy(); self.edit361 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.edit428 ~= nil then self.edit428:destroy(); self.edit428 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.frmADnD4 ~= nil then self.frmADnD4:destroy(); self.frmADnD4 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.edit329 ~= nil then self.edit329:destroy(); self.edit329 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit311 ~= nil then self.edit311:destroy(); self.edit311 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.edit371 ~= nil then self.edit371:destroy(); self.edit371 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.edit426 ~= nil then self.edit426:destroy(); self.edit426 = nil; end;
        if self.edit474 ~= nil then self.edit474:destroy(); self.edit474 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit384 ~= nil then self.edit384:destroy(); self.edit384 = nil; end;
        if self.edit560 ~= nil then self.edit560:destroy(); self.edit560 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit341 ~= nil then self.edit341:destroy(); self.edit341 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.edit342 ~= nil then self.edit342:destroy(); self.edit342 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.edit522 ~= nil then self.edit522:destroy(); self.edit522 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit340 ~= nil then self.edit340:destroy(); self.edit340 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.edit502 ~= nil then self.edit502:destroy(); self.edit502 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.frmADnD1 ~= nil then self.frmADnD1:destroy(); self.frmADnD1 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.edit539 ~= nil then self.edit539:destroy(); self.edit539 = nil; end;
        if self.edit368 ~= nil then self.edit368:destroy(); self.edit368 = nil; end;
        if self.edit350 ~= nil then self.edit350:destroy(); self.edit350 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.frmADnD6 ~= nil then self.frmADnD6:destroy(); self.frmADnD6 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.edit536 ~= nil then self.edit536:destroy(); self.edit536 = nil; end;
        if self.edit408 ~= nil then self.edit408:destroy(); self.edit408 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit444 ~= nil then self.edit444:destroy(); self.edit444 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit321 ~= nil then self.edit321:destroy(); self.edit321 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit403 ~= nil then self.edit403:destroy(); self.edit403 = nil; end;
        if self.edit331 ~= nil then self.edit331:destroy(); self.edit331 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit541 ~= nil then self.edit541:destroy(); self.edit541 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit545 ~= nil then self.edit545:destroy(); self.edit545 = nil; end;
        if self.layout197 ~= nil then self.layout197:destroy(); self.layout197 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit374 ~= nil then self.edit374:destroy(); self.edit374 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.edit346 ~= nil then self.edit346:destroy(); self.edit346 = nil; end;
        if self.edit507 ~= nil then self.edit507:destroy(); self.edit507 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit583 ~= nil then self.edit583:destroy(); self.edit583 = nil; end;
        if self.edit376 ~= nil then self.edit376:destroy(); self.edit376 = nil; end;
        if self.edit399 ~= nil then self.edit399:destroy(); self.edit399 = nil; end;
        if self.edit436 ~= nil then self.edit436:destroy(); self.edit436 = nil; end;
        if self.edit461 ~= nil then self.edit461:destroy(); self.edit461 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit524 ~= nil then self.edit524:destroy(); self.edit524 = nil; end;
        if self.edit579 ~= nil then self.edit579:destroy(); self.edit579 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit395 ~= nil then self.edit395:destroy(); self.edit395 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.edit345 ~= nil then self.edit345:destroy(); self.edit345 = nil; end;
        if self.edit352 ~= nil then self.edit352:destroy(); self.edit352 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.edit380 ~= nil then self.edit380:destroy(); self.edit380 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.edit487 ~= nil then self.edit487:destroy(); self.edit487 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit303 ~= nil then self.edit303:destroy(); self.edit303 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.edit516 ~= nil then self.edit516:destroy(); self.edit516 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit434 ~= nil then self.edit434:destroy(); self.edit434 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.edit495 ~= nil then self.edit495:destroy(); self.edit495 = nil; end;
        if self.edit470 ~= nil then self.edit470:destroy(); self.edit470 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit578 ~= nil then self.edit578:destroy(); self.edit578 = nil; end;
        if self.edit396 ~= nil then self.edit396:destroy(); self.edit396 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit394 ~= nil then self.edit394:destroy(); self.edit394 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.edit551 ~= nil then self.edit551:destroy(); self.edit551 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit334 ~= nil then self.edit334:destroy(); self.edit334 = nil; end;
        if self.edit430 ~= nil then self.edit430:destroy(); self.edit430 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.edit580 ~= nil then self.edit580:destroy(); self.edit580 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.edit571 ~= nil then self.edit571:destroy(); self.edit571 = nil; end;
        if self.edit456 ~= nil then self.edit456:destroy(); self.edit456 = nil; end;
        if self.edit576 ~= nil then self.edit576:destroy(); self.edit576 = nil; end;
        if self.edit296 ~= nil then self.edit296:destroy(); self.edit296 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.layout195 ~= nil then self.layout195:destroy(); self.layout195 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.edit445 ~= nil then self.edit445:destroy(); self.edit445 = nil; end;
        if self.edit488 ~= nil then self.edit488:destroy(); self.edit488 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit386 ~= nil then self.edit386:destroy(); self.edit386 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.edit412 ~= nil then self.edit412:destroy(); self.edit412 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.layout196 ~= nil then self.layout196:destroy(); self.layout196 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit297 ~= nil then self.edit297:destroy(); self.edit297 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.edit413 ~= nil then self.edit413:destroy(); self.edit413 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.edit546 ~= nil then self.edit546:destroy(); self.edit546 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.edit472 ~= nil then self.edit472:destroy(); self.edit472 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit452 ~= nil then self.edit452:destroy(); self.edit452 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.edit534 ~= nil then self.edit534:destroy(); self.edit534 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit316 ~= nil then self.edit316:destroy(); self.edit316 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.edit460 ~= nil then self.edit460:destroy(); self.edit460 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.edit423 ~= nil then self.edit423:destroy(); self.edit423 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.edit441 ~= nil then self.edit441:destroy(); self.edit441 = nil; end;
        if self.frmADnD5 ~= nil then self.frmADnD5:destroy(); self.frmADnD5 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.edit575 ~= nil then self.edit575:destroy(); self.edit575 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit493 ~= nil then self.edit493:destroy(); self.edit493 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit385 ~= nil then self.edit385:destroy(); self.edit385 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.edit566 ~= nil then self.edit566:destroy(); self.edit566 = nil; end;
        if self.edit401 ~= nil then self.edit401:destroy(); self.edit401 = nil; end;
        if self.edit410 ~= nil then self.edit410:destroy(); self.edit410 = nil; end;
        if self.edit324 ~= nil then self.edit324:destroy(); self.edit324 = nil; end;
        if self.edit420 ~= nil then self.edit420:destroy(); self.edit420 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit362 ~= nil then self.edit362:destroy(); self.edit362 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit301 ~= nil then self.edit301:destroy(); self.edit301 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit330 ~= nil then self.edit330:destroy(); self.edit330 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.edit388 ~= nil then self.edit388:destroy(); self.edit388 = nil; end;
        if self.edit577 ~= nil then self.edit577:destroy(); self.edit577 = nil; end;
        if self.edit491 ~= nil then self.edit491:destroy(); self.edit491 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.edit565 ~= nil then self.edit565:destroy(); self.edit565 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.edit574 ~= nil then self.edit574:destroy(); self.edit574 = nil; end;
        if self.edit435 ~= nil then self.edit435:destroy(); self.edit435 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.edit469 ~= nil then self.edit469:destroy(); self.edit469 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.edit409 ~= nil then self.edit409:destroy(); self.edit409 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.edit336 ~= nil then self.edit336:destroy(); self.edit336 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.layout193 ~= nil then self.layout193:destroy(); self.layout193 = nil; end;
        if self.frmADnD2 ~= nil then self.frmADnD2:destroy(); self.frmADnD2 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.edit370 ~= nil then self.edit370:destroy(); self.edit370 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.edit424 ~= nil then self.edit424:destroy(); self.edit424 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.frmADnD3 ~= nil then self.frmADnD3:destroy(); self.frmADnD3 = nil; end;
        if self.edit378 ~= nil then self.edit378:destroy(); self.edit378 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit415 ~= nil then self.edit415:destroy(); self.edit415 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit387 ~= nil then self.edit387:destroy(); self.edit387 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit323 ~= nil then self.edit323:destroy(); self.edit323 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit328 ~= nil then self.edit328:destroy(); self.edit328 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit418 ~= nil then self.edit418:destroy(); self.edit418 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit512 ~= nil then self.edit512:destroy(); self.edit512 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.edit531 ~= nil then self.edit531:destroy(); self.edit531 = nil; end;
        if self.edit525 ~= nil then self.edit525:destroy(); self.edit525 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit533 ~= nil then self.edit533:destroy(); self.edit533 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout198 ~= nil then self.layout198:destroy(); self.layout198 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit363 ~= nil then self.edit363:destroy(); self.edit363 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.edit299 ~= nil then self.edit299:destroy(); self.edit299 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit379 ~= nil then self.edit379:destroy(); self.edit379 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.edit432 ~= nil then self.edit432:destroy(); self.edit432 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.edit438 ~= nil then self.edit438:destroy(); self.edit438 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.edit527 ~= nil then self.edit527:destroy(); self.edit527 = nil; end;
        if self.edit305 ~= nil then self.edit305:destroy(); self.edit305 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.edit320 ~= nil then self.edit320:destroy(); self.edit320 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.edit335 ~= nil then self.edit335:destroy(); self.edit335 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit511 ~= nil then self.edit511:destroy(); self.edit511 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.edit463 ~= nil then self.edit463:destroy(); self.edit463 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit450 ~= nil then self.edit450:destroy(); self.edit450 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.edit521 ~= nil then self.edit521:destroy(); self.edit521 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit555 ~= nil then self.edit555:destroy(); self.edit555 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit478 ~= nil then self.edit478:destroy(); self.edit478 = nil; end;
        if self.edit564 ~= nil then self.edit564:destroy(); self.edit564 = nil; end;
        if self.edit447 ~= nil then self.edit447:destroy(); self.edit447 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit367 ~= nil then self.edit367:destroy(); self.edit367 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit411 ~= nil then self.edit411:destroy(); self.edit411 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.edit517 ~= nil then self.edit517:destroy(); self.edit517 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit496 ~= nil then self.edit496:destroy(); self.edit496 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit422 ~= nil then self.edit422:destroy(); self.edit422 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.edit537 ~= nil then self.edit537:destroy(); self.edit537 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.edit357 ~= nil then self.edit357:destroy(); self.edit357 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit538 ~= nil then self.edit538:destroy(); self.edit538 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.layout192 ~= nil then self.layout192:destroy(); self.layout192 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.edit417 ~= nil then self.edit417:destroy(); self.edit417 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit448 ~= nil then self.edit448:destroy(); self.edit448 = nil; end;
        if self.edit506 ~= nil then self.edit506:destroy(); self.edit506 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.edit381 ~= nil then self.edit381:destroy(); self.edit381 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.edit468 ~= nil then self.edit468:destroy(); self.edit468 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.edit315 ~= nil then self.edit315:destroy(); self.edit315 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.edit554 ~= nil then self.edit554:destroy(); self.edit554 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit327 ~= nil then self.edit327:destroy(); self.edit327 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.edit437 ~= nil then self.edit437:destroy(); self.edit437 = nil; end;
        if self.edit443 ~= nil then self.edit443:destroy(); self.edit443 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.edit319 ~= nil then self.edit319:destroy(); self.edit319 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit494 ~= nil then self.edit494:destroy(); self.edit494 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.edit433 ~= nil then self.edit433:destroy(); self.edit433 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit325 ~= nil then self.edit325:destroy(); self.edit325 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit322 ~= nil then self.edit322:destroy(); self.edit322 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit485 ~= nil then self.edit485:destroy(); self.edit485 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit406 ~= nil then self.edit406:destroy(); self.edit406 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit455 ~= nil then self.edit455:destroy(); self.edit455 = nil; end;
        if self.edit453 ~= nil then self.edit453:destroy(); self.edit453 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.edit484 ~= nil then self.edit484:destroy(); self.edit484 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit563 ~= nil then self.edit563:destroy(); self.edit563 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.edit505 ~= nil then self.edit505:destroy(); self.edit505 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit351 ~= nil then self.edit351:destroy(); self.edit351 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit356 ~= nil then self.edit356:destroy(); self.edit356 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit344 ~= nil then self.edit344:destroy(); self.edit344 = nil; end;
        if self.edit425 ~= nil then self.edit425:destroy(); self.edit425 = nil; end;
        if self.edit427 ~= nil then self.edit427:destroy(); self.edit427 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.edit497 ~= nil then self.edit497:destroy(); self.edit497 = nil; end;
        if self.edit509 ~= nil then self.edit509:destroy(); self.edit509 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit317 ~= nil then self.edit317:destroy(); self.edit317 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.edit548 ~= nil then self.edit548:destroy(); self.edit548 = nil; end;
        if self.edit318 ~= nil then self.edit318:destroy(); self.edit318 = nil; end;
        if self.edit535 ~= nil then self.edit535:destroy(); self.edit535 = nil; end;
        if self.edit569 ~= nil then self.edit569:destroy(); self.edit569 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.edit414 ~= nil then self.edit414:destroy(); self.edit414 = nil; end;
        if self.edit405 ~= nil then self.edit405:destroy(); self.edit405 = nil; end;
        if self.edit486 ~= nil then self.edit486:destroy(); self.edit486 = nil; end;
        if self.edit364 ~= nil then self.edit364:destroy(); self.edit364 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.edit482 ~= nil then self.edit482:destroy(); self.edit482 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit306 ~= nil then self.edit306:destroy(); self.edit306 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.edit477 ~= nil then self.edit477:destroy(); self.edit477 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit383 ~= nil then self.edit383:destroy(); self.edit383 = nil; end;
        if self.edit552 ~= nil then self.edit552:destroy(); self.edit552 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit550 ~= nil then self.edit550:destroy(); self.edit550 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit307 ~= nil then self.edit307:destroy(); self.edit307 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit337 ~= nil then self.edit337:destroy(); self.edit337 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.edit375 ~= nil then self.edit375:destroy(); self.edit375 = nil; end;
        if self.edit392 ~= nil then self.edit392:destroy(); self.edit392 = nil; end;
        if self.edit514 ~= nil then self.edit514:destroy(); self.edit514 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.edit562 ~= nil then self.edit562:destroy(); self.edit562 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit372 ~= nil then self.edit372:destroy(); self.edit372 = nil; end;
        if self.edit377 ~= nil then self.edit377:destroy(); self.edit377 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.edit471 ~= nil then self.edit471:destroy(); self.edit471 = nil; end;
        if self.edit503 ~= nil then self.edit503:destroy(); self.edit503 = nil; end;
        if self.edit498 ~= nil then self.edit498:destroy(); self.edit498 = nil; end;
        if self.edit407 ~= nil then self.edit407:destroy(); self.edit407 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit458 ~= nil then self.edit458:destroy(); self.edit458 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaACN = {
    newEditor = newfrmFichaACN, 
    new = newfrmFichaACN, 
    name = "frmFichaACN", 
    dataType = "Ambesek.Nefertyne.FichaADnD2e", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha AD&D 2e", 
    description=""};

frmFichaACN = _frmFichaACN;
rrpg.registrarForm(_frmFichaACN);
rrpg.registrarDataType(_frmFichaACN);

return _frmFichaACN;
