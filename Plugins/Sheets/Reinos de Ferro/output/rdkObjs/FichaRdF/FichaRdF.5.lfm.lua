require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmRDF5()
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
    obj:setName("frmRDF5");
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
    obj.layout1:setWidth(315);
    obj.layout1:setHeight(160);
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
    obj.layout2:setWidth(300);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(20);
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("sj_nome");
    obj.edit1:setName("edit1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(5);
    obj.layout3:setTop(30);
    obj.layout3:setWidth(300);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(100);
    obj.label2:setHeight(20);
    obj.label2:setText("Chassis");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(100);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(200);
    obj.edit2:setHeight(25);
    obj.edit2:setField("sj_chassis");
    obj.edit2:setName("edit2");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(55);
    obj.layout4:setWidth(300);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setLeft(0);
    obj.label3:setTop(5);
    obj.label3:setWidth(100);
    obj.label3:setHeight(20);
    obj.label3:setText("Peso");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(100);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(200);
    obj.edit3:setHeight(25);
    obj.edit3:setField("sj_peso");
    obj.edit3:setName("edit3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(80);
    obj.layout5:setWidth(300);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(100);
    obj.label4:setHeight(20);
    obj.label4:setText("Altura");
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setLeft(100);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(200);
    obj.edit4:setHeight(25);
    obj.edit4:setField("sj_altura");
    obj.edit4:setName("edit4");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(5);
    obj.layout6:setTop(105);
    obj.layout6:setWidth(300);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setLeft(0);
    obj.label5:setTop(5);
    obj.label5:setWidth(100);
    obj.label5:setHeight(20);
    obj.label5:setText("Max. Comb.");
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setLeft(100);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(200);
    obj.edit5:setHeight(25);
    obj.edit5:setField("sj_m_combustivel");
    obj.edit5:setName("edit5");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(5);
    obj.layout7:setTop(130);
    obj.layout7:setWidth(300);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(100);
    obj.label6:setHeight(20);
    obj.label6:setText("Gasto Comb.");
    obj.label6:setName("label6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setLeft(100);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(200);
    obj.edit6:setHeight(25);
    obj.edit6:setField("sj_g_combustivel");
    obj.edit6:setName("edit6");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(165);
    obj.layout8:setWidth(210);
    obj.layout8:setHeight(130);
    obj.layout8:setName("layout8");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setLeft(5);
    obj.label7:setTop(0);
    obj.label7:setWidth(200);
    obj.label7:setHeight(20);
    obj.label7:setText("ATRIBUTOS");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(25);
    obj.layout9:setWidth(50);
    obj.layout9:setHeight(50);
    obj.layout9:setName("layout9");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setLeft(0);
    obj.label8:setTop(5);
    obj.label8:setWidth(50);
    obj.label8:setHeight(20);
    obj.label8:setText("FIS");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setLeft(0);
    obj.edit7:setTop(25);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("sj_atr_fis");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setLeft(55);
    obj.layout10:setTop(25);
    obj.layout10:setWidth(50);
    obj.layout10:setHeight(50);
    obj.layout10:setName("layout10");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout10);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(50);
    obj.label9:setHeight(20);
    obj.label9:setText("VEL");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setLeft(0);
    obj.edit8:setTop(25);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("sj_atr_vel");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setLeft(105);
    obj.layout11:setTop(25);
    obj.layout11:setWidth(50);
    obj.layout11:setHeight(50);
    obj.layout11:setName("layout11");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout11);
    obj.label10:setLeft(0);
    obj.label10:setTop(5);
    obj.label10:setWidth(50);
    obj.label10:setHeight(20);
    obj.label10:setText("FOR");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout11);
    obj.edit9:setLeft(0);
    obj.edit9:setTop(25);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("sj_atr_for");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setLeft(155);
    obj.layout12:setTop(25);
    obj.layout12:setWidth(50);
    obj.layout12:setHeight(50);
    obj.layout12:setName("layout12");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout12);
    obj.label11:setLeft(0);
    obj.label11:setTop(5);
    obj.label11:setWidth(50);
    obj.label11:setHeight(20);
    obj.label11:setText("AGI");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout12);
    obj.edit10:setLeft(0);
    obj.edit10:setTop(25);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("sj_atr_agi");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(75);
    obj.layout13:setWidth(50);
    obj.layout13:setHeight(50);
    obj.layout13:setName("layout13");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout13);
    obj.label12:setLeft(0);
    obj.label12:setTop(5);
    obj.label12:setWidth(50);
    obj.label12:setHeight(20);
    obj.label12:setText("DES");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout13);
    obj.edit11:setLeft(0);
    obj.edit11:setTop(25);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("sj_atr_des");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout8);
    obj.layout14:setLeft(55);
    obj.layout14:setTop(75);
    obj.layout14:setWidth(50);
    obj.layout14:setHeight(50);
    obj.layout14:setName("layout14");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout14);
    obj.label13:setLeft(0);
    obj.label13:setTop(5);
    obj.label13:setWidth(50);
    obj.label13:setHeight(20);
    obj.label13:setText("MAE");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout14);
    obj.edit12:setLeft(0);
    obj.edit12:setTop(25);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("sj_atr_mae");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout8);
    obj.layout15:setLeft(105);
    obj.layout15:setTop(75);
    obj.layout15:setWidth(50);
    obj.layout15:setHeight(50);
    obj.layout15:setName("layout15");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout15);
    obj.label14:setLeft(0);
    obj.label14:setTop(5);
    obj.label14:setWidth(50);
    obj.label14:setHeight(20);
    obj.label14:setText("INT");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout15);
    obj.edit13:setLeft(0);
    obj.edit13:setTop(25);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("sj_atr_int");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout8);
    obj.layout16:setLeft(155);
    obj.layout16:setTop(75);
    obj.layout16:setWidth(50);
    obj.layout16:setHeight(50);
    obj.layout16:setName("layout16");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout16);
    obj.label15:setLeft(0);
    obj.label15:setTop(5);
    obj.label15:setWidth(50);
    obj.label15:setHeight(20);
    obj.label15:setText("PER");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout16);
    obj.edit14:setLeft(0);
    obj.edit14:setTop(25);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("sj_atr_per");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox1);
    obj.layout17:setLeft(215);
    obj.layout17:setTop(165);
    obj.layout17:setWidth(100);
    obj.layout17:setHeight(150);
    obj.layout17:setName("layout17");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout17);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout17);
    obj.label16:setLeft(5);
    obj.label16:setTop(0);
    obj.label16:setWidth(90);
    obj.label16:setHeight(20);
    obj.label16:setText("DANO");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(25);
    obj.layout18:setWidth(200);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout18);
    obj.label17:setLeft(0);
    obj.label17:setTop(5);
    obj.label17:setWidth(15);
    obj.label17:setHeight(20);
    obj.label17:setText("1");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout18);
    obj.label18:setLeft(15);
    obj.label18:setTop(5);
    obj.label18:setWidth(15);
    obj.label18:setHeight(20);
    obj.label18:setText("2");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout18);
    obj.label19:setLeft(30);
    obj.label19:setTop(5);
    obj.label19:setWidth(15);
    obj.label19:setHeight(20);
    obj.label19:setText("3");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout18);
    obj.label20:setLeft(45);
    obj.label20:setTop(5);
    obj.label20:setWidth(15);
    obj.label20:setHeight(20);
    obj.label20:setText("4");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout18);
    obj.label21:setLeft(60);
    obj.label21:setTop(5);
    obj.label21:setWidth(15);
    obj.label21:setHeight(20);
    obj.label21:setText("5");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout18);
    obj.label22:setLeft(75);
    obj.label22:setTop(5);
    obj.label22:setWidth(15);
    obj.label22:setHeight(20);
    obj.label22:setText("3");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout17);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(50);
    obj.layout19:setWidth(200);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout19);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout19);
    obj.checkBox2:setLeft(15);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout19);
    obj.checkBox3:setLeft(30);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout19);
    obj.checkBox4:setLeft(45);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout19);
    obj.checkBox5:setLeft(60);
    obj.checkBox5:setTop(0);
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout19);
    obj.checkBox6:setLeft(75);
    obj.checkBox6:setTop(0);
    obj.checkBox6:setName("checkBox6");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout17);
    obj.layout20:setLeft(5);
    obj.layout20:setTop(65);
    obj.layout20:setWidth(200);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout20);
    obj.checkBox7:setLeft(0);
    obj.checkBox7:setTop(0);
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout20);
    obj.checkBox8:setLeft(15);
    obj.checkBox8:setTop(0);
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout20);
    obj.checkBox9:setLeft(30);
    obj.checkBox9:setTop(0);
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout20);
    obj.checkBox10:setLeft(45);
    obj.checkBox10:setTop(0);
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout20);
    obj.checkBox11:setLeft(60);
    obj.checkBox11:setTop(0);
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout20);
    obj.checkBox12:setLeft(75);
    obj.checkBox12:setTop(0);
    obj.checkBox12:setName("checkBox12");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout17);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(80);
    obj.layout21:setWidth(200);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.checkBox13 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout21);
    obj.checkBox13:setLeft(0);
    obj.checkBox13:setTop(0);
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout21);
    obj.checkBox14:setLeft(15);
    obj.checkBox14:setTop(0);
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout21);
    obj.checkBox15:setLeft(30);
    obj.checkBox15:setTop(0);
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout21);
    obj.checkBox16:setLeft(45);
    obj.checkBox16:setTop(0);
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout21);
    obj.checkBox17:setLeft(60);
    obj.checkBox17:setTop(0);
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout21);
    obj.checkBox18:setLeft(75);
    obj.checkBox18:setTop(0);
    obj.checkBox18:setName("checkBox18");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout17);
    obj.layout22:setLeft(5);
    obj.layout22:setTop(95);
    obj.layout22:setWidth(200);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.checkBox19 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout22);
    obj.checkBox19:setLeft(0);
    obj.checkBox19:setTop(0);
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout22);
    obj.checkBox20:setLeft(15);
    obj.checkBox20:setTop(0);
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout22);
    obj.checkBox21:setLeft(30);
    obj.checkBox21:setTop(0);
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout22);
    obj.checkBox22:setLeft(45);
    obj.checkBox22:setTop(0);
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout22);
    obj.checkBox23:setLeft(60);
    obj.checkBox23:setTop(0);
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout22);
    obj.checkBox24:setLeft(75);
    obj.checkBox24:setTop(0);
    obj.checkBox24:setName("checkBox24");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout17);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(110);
    obj.layout23:setWidth(200);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.checkBox25 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout23);
    obj.checkBox25:setLeft(0);
    obj.checkBox25:setTop(0);
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout23);
    obj.checkBox26:setLeft(15);
    obj.checkBox26:setTop(0);
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout23);
    obj.checkBox27:setLeft(30);
    obj.checkBox27:setTop(0);
    obj.checkBox27:setName("checkBox27");

    obj.checkBox28 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout23);
    obj.checkBox28:setLeft(45);
    obj.checkBox28:setTop(0);
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout23);
    obj.checkBox29:setLeft(60);
    obj.checkBox29:setTop(0);
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout23);
    obj.checkBox30:setLeft(75);
    obj.checkBox30:setTop(0);
    obj.checkBox30:setName("checkBox30");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout17);
    obj.layout24:setLeft(5);
    obj.layout24:setTop(125);
    obj.layout24:setWidth(200);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.checkBox31 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout24);
    obj.checkBox31:setLeft(0);
    obj.checkBox31:setTop(0);
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout24);
    obj.checkBox32:setLeft(15);
    obj.checkBox32:setTop(0);
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout24);
    obj.checkBox33:setLeft(30);
    obj.checkBox33:setTop(0);
    obj.checkBox33:setName("checkBox33");

    obj.checkBox34 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout24);
    obj.checkBox34:setLeft(45);
    obj.checkBox34:setTop(0);
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout24);
    obj.checkBox35:setLeft(60);
    obj.checkBox35:setTop(0);
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout24);
    obj.checkBox36:setLeft(75);
    obj.checkBox36:setTop(0);
    obj.checkBox36:setName("checkBox36");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox1);
    obj.layout25:setLeft(0);
    obj.layout25:setTop(320);
    obj.layout25:setWidth(315);
    obj.layout25:setHeight(130);
    obj.layout25:setName("layout25");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout25);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout25);
    obj.label23:setLeft(5);
    obj.label23:setTop(0);
    obj.label23:setWidth(305);
    obj.label23:setHeight(20);
    obj.label23:setText("CORTEX");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout25);
    obj.layout26:setLeft(5);
    obj.layout26:setTop(25);
    obj.layout26:setWidth(300);
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout26);
    obj.label24:setLeft(0);
    obj.label24:setTop(5);
    obj.label24:setWidth(100);
    obj.label24:setHeight(20);
    obj.label24:setText("Marca");
    obj.label24:setName("label24");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout26);
    obj.edit15:setLeft(100);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(200);
    obj.edit15:setHeight(25);
    obj.edit15:setField("sj_marca");
    obj.edit15:setName("edit15");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout25);
    obj.layout27:setLeft(5);
    obj.layout27:setTop(50);
    obj.layout27:setWidth(300);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout27);
    obj.label25:setLeft(0);
    obj.label25:setTop(5);
    obj.label25:setWidth(100);
    obj.label25:setHeight(20);
    obj.label25:setText("Notas");
    obj.label25:setName("label25");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout27);
    obj.edit16:setLeft(100);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(200);
    obj.edit16:setHeight(25);
    obj.edit16:setField("sj_nota");
    obj.edit16:setName("edit16");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout25);
    obj.layout28:setLeft(5);
    obj.layout28:setTop(75);
    obj.layout28:setWidth(300);
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout28);
    obj.label26:setLeft(0);
    obj.label26:setTop(5);
    obj.label26:setWidth(100);
    obj.label26:setHeight(20);
    obj.label26:setText("Bônus de Ataque");
    obj.label26:setName("label26");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout28);
    obj.edit17:setLeft(100);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(200);
    obj.edit17:setHeight(25);
    obj.edit17:setField("sj_luta");
    obj.edit17:setName("edit17");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout25);
    obj.layout29:setLeft(5);
    obj.layout29:setTop(100);
    obj.layout29:setWidth(300);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout29);
    obj.label27:setLeft(0);
    obj.label27:setTop(5);
    obj.label27:setWidth(100);
    obj.label27:setHeight(20);
    obj.label27:setText("Idioma");
    obj.label27:setName("label27");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout29);
    obj.edit18:setLeft(100);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(200);
    obj.edit18:setHeight(25);
    obj.edit18:setField("sj_idioma");
    obj.edit18:setName("edit18");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox1);
    obj.layout30:setLeft(320);
    obj.layout30:setTop(0);
    obj.layout30:setWidth(530);
    obj.layout30:setHeight(210);
    obj.layout30:setName("layout30");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout30);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setXradius(5);
    obj.rectangle5:setYradius(5);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setName("rectangle5");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout30);
    obj.label28:setLeft(15);
    obj.label28:setTop(0);
    obj.label28:setWidth(500);
    obj.label28:setHeight(20);
    obj.label28:setText("ATAQUES A DISTANCIA");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setLeft(5);
    obj.layout31:setTop(25);
    obj.layout31:setWidth(500);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout31);
    obj.label29:setLeft(0);
    obj.label29:setTop(5);
    obj.label29:setWidth(150);
    obj.label29:setHeight(20);
    obj.label29:setText("NOME");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout31);
    obj.label30:setLeft(150);
    obj.label30:setTop(5);
    obj.label30:setWidth(150);
    obj.label30:setHeight(20);
    obj.label30:setText("NOTAS");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout31);
    obj.label31:setLeft(300);
    obj.label31:setTop(5);
    obj.label31:setWidth(50);
    obj.label31:setHeight(20);
    obj.label31:setText("ALC");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout31);
    obj.label32:setLeft(350);
    obj.label32:setTop(5);
    obj.label32:setWidth(50);
    obj.label32:setHeight(20);
    obj.label32:setText("ADI");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout31);
    obj.label33:setLeft(400);
    obj.label33:setTop(5);
    obj.label33:setWidth(50);
    obj.label33:setHeight(20);
    obj.label33:setText("POD");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout31);
    obj.label34:setLeft(450);
    obj.label34:setTop(5);
    obj.label34:setWidth(50);
    obj.label34:setHeight(20);
    obj.label34:setText("MUN");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.layout30);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(50);
    obj.scrollBox2:setWidth(525);
    obj.scrollBox2:setHeight(150);
    obj.scrollBox2:setName("scrollBox2");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox2);
    obj.layout32:setLeft(5);
    obj.layout32:setTop(0);
    obj.layout32:setWidth(500);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout32);
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(150);
    obj.edit19:setHeight(25);
    obj.edit19:setField("atqD_1");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout32);
    obj.edit20:setLeft(150);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(150);
    obj.edit20:setHeight(25);
    obj.edit20:setField("atqD_notas_1");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout32);
    obj.edit21:setLeft(300);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(25);
    obj.edit21:setField("atqD_alc_1");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout32);
    obj.edit22:setLeft(350);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setField("atqD_adi_1");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout32);
    obj.edit23:setLeft(400);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setField("atqD_pod_1");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout32);
    obj.edit24:setLeft(450);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setField("atqD_mun_1");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox2);
    obj.layout33:setLeft(5);
    obj.layout33:setTop(25);
    obj.layout33:setWidth(500);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout33);
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(150);
    obj.edit25:setHeight(25);
    obj.edit25:setField("atqD_2");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout33);
    obj.edit26:setLeft(150);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(150);
    obj.edit26:setHeight(25);
    obj.edit26:setField("atqD_notas_2");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout33);
    obj.edit27:setLeft(300);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setField("atqD_alc_2");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout33);
    obj.edit28:setLeft(350);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(50);
    obj.edit28:setHeight(25);
    obj.edit28:setField("atqD_adi_2");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout33);
    obj.edit29:setLeft(400);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(25);
    obj.edit29:setField("atqD_pod_2");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout33);
    obj.edit30:setLeft(450);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(50);
    obj.edit30:setHeight(25);
    obj.edit30:setField("atqD_mun_2");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox2);
    obj.layout34:setLeft(5);
    obj.layout34:setTop(50);
    obj.layout34:setWidth(500);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout34);
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(150);
    obj.edit31:setHeight(25);
    obj.edit31:setField("atqD_3");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout34);
    obj.edit32:setLeft(150);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(150);
    obj.edit32:setHeight(25);
    obj.edit32:setField("atqD_notas_3");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout34);
    obj.edit33:setLeft(300);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(50);
    obj.edit33:setHeight(25);
    obj.edit33:setField("atqD_alc_3");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout34);
    obj.edit34:setLeft(350);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(50);
    obj.edit34:setHeight(25);
    obj.edit34:setField("atqD_adi_3");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout34);
    obj.edit35:setLeft(400);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(50);
    obj.edit35:setHeight(25);
    obj.edit35:setField("atqD_pod_3");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout34);
    obj.edit36:setLeft(450);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(50);
    obj.edit36:setHeight(25);
    obj.edit36:setField("atqD_mun_3");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox2);
    obj.layout35:setLeft(5);
    obj.layout35:setTop(75);
    obj.layout35:setWidth(500);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout35);
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(150);
    obj.edit37:setHeight(25);
    obj.edit37:setField("atqD_4");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout35);
    obj.edit38:setLeft(150);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(150);
    obj.edit38:setHeight(25);
    obj.edit38:setField("atqD_notas_4");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout35);
    obj.edit39:setLeft(300);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(25);
    obj.edit39:setField("atqD_alc_4");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout35);
    obj.edit40:setLeft(350);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(50);
    obj.edit40:setHeight(25);
    obj.edit40:setField("atqD_adi_4");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout35);
    obj.edit41:setLeft(400);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(50);
    obj.edit41:setHeight(25);
    obj.edit41:setField("atqD_pod_4");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout35);
    obj.edit42:setLeft(450);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(50);
    obj.edit42:setHeight(25);
    obj.edit42:setField("atqD_mun_4");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.scrollBox2);
    obj.layout36:setLeft(5);
    obj.layout36:setTop(100);
    obj.layout36:setWidth(500);
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout36);
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(150);
    obj.edit43:setHeight(25);
    obj.edit43:setField("atqD_5");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout36);
    obj.edit44:setLeft(150);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(150);
    obj.edit44:setHeight(25);
    obj.edit44:setField("atqD_notas_5");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout36);
    obj.edit45:setLeft(300);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(50);
    obj.edit45:setHeight(25);
    obj.edit45:setField("atqD_alc_5");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout36);
    obj.edit46:setLeft(350);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(50);
    obj.edit46:setHeight(25);
    obj.edit46:setField("atqD_adi_5");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout36);
    obj.edit47:setLeft(400);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(50);
    obj.edit47:setHeight(25);
    obj.edit47:setField("atqD_pod_5");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout36);
    obj.edit48:setLeft(450);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(50);
    obj.edit48:setHeight(25);
    obj.edit48:setField("atqD_mun_5");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.scrollBox2);
    obj.layout37:setLeft(5);
    obj.layout37:setTop(125);
    obj.layout37:setWidth(500);
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout37);
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(150);
    obj.edit49:setHeight(25);
    obj.edit49:setField("atqD_6");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout37);
    obj.edit50:setLeft(150);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(150);
    obj.edit50:setHeight(25);
    obj.edit50:setField("atqD_notas_6");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout37);
    obj.edit51:setLeft(300);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(50);
    obj.edit51:setHeight(25);
    obj.edit51:setField("atqD_alc_6");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout37);
    obj.edit52:setLeft(350);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(50);
    obj.edit52:setHeight(25);
    obj.edit52:setField("atqD_adi_6");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout37);
    obj.edit53:setLeft(400);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(50);
    obj.edit53:setHeight(25);
    obj.edit53:setField("atqD_pod_6");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout37);
    obj.edit54:setLeft(450);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(50);
    obj.edit54:setHeight(25);
    obj.edit54:setField("atqD_mun_6");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.scrollBox2);
    obj.layout38:setLeft(5);
    obj.layout38:setTop(150);
    obj.layout38:setWidth(500);
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout38);
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(150);
    obj.edit55:setHeight(25);
    obj.edit55:setField("atqD_7");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout38);
    obj.edit56:setLeft(150);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(150);
    obj.edit56:setHeight(25);
    obj.edit56:setField("atqD_notas_7");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout38);
    obj.edit57:setLeft(300);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(50);
    obj.edit57:setHeight(25);
    obj.edit57:setField("atqD_alc_7");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout38);
    obj.edit58:setLeft(350);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(50);
    obj.edit58:setHeight(25);
    obj.edit58:setField("atqD_adi_7");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout38);
    obj.edit59:setLeft(400);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(50);
    obj.edit59:setHeight(25);
    obj.edit59:setField("atqD_pod_7");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout38);
    obj.edit60:setLeft(450);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(50);
    obj.edit60:setHeight(25);
    obj.edit60:setField("atqD_mun_7");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.scrollBox2);
    obj.layout39:setLeft(5);
    obj.layout39:setTop(175);
    obj.layout39:setWidth(500);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout39);
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(150);
    obj.edit61:setHeight(25);
    obj.edit61:setField("atqD_8");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout39);
    obj.edit62:setLeft(150);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(150);
    obj.edit62:setHeight(25);
    obj.edit62:setField("atqD_notas_8");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout39);
    obj.edit63:setLeft(300);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(50);
    obj.edit63:setHeight(25);
    obj.edit63:setField("atqD_alc_8");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setName("edit63");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout39);
    obj.edit64:setLeft(350);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(50);
    obj.edit64:setHeight(25);
    obj.edit64:setField("atqD_adi_8");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout39);
    obj.edit65:setLeft(400);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(50);
    obj.edit65:setHeight(25);
    obj.edit65:setField("atqD_pod_8");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout39);
    obj.edit66:setLeft(450);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(50);
    obj.edit66:setHeight(25);
    obj.edit66:setField("atqD_mun_8");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setName("edit66");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox2);
    obj.layout40:setLeft(5);
    obj.layout40:setTop(200);
    obj.layout40:setWidth(500);
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout40);
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(150);
    obj.edit67:setHeight(25);
    obj.edit67:setField("atqD_9");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout40);
    obj.edit68:setLeft(150);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(150);
    obj.edit68:setHeight(25);
    obj.edit68:setField("atqD_notas_9");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout40);
    obj.edit69:setLeft(300);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(50);
    obj.edit69:setHeight(25);
    obj.edit69:setField("atqD_alc_9");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setName("edit69");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout40);
    obj.edit70:setLeft(350);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(50);
    obj.edit70:setHeight(25);
    obj.edit70:setField("atqD_adi_9");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout40);
    obj.edit71:setLeft(400);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(50);
    obj.edit71:setHeight(25);
    obj.edit71:setField("atqD_pod_9");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setName("edit71");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout40);
    obj.edit72:setLeft(450);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(50);
    obj.edit72:setHeight(25);
    obj.edit72:setField("atqD_mun_9");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setName("edit72");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.scrollBox2);
    obj.layout41:setLeft(5);
    obj.layout41:setTop(225);
    obj.layout41:setWidth(500);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout41);
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(150);
    obj.edit73:setHeight(25);
    obj.edit73:setField("atqD_10");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setName("edit73");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout41);
    obj.edit74:setLeft(150);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(150);
    obj.edit74:setHeight(25);
    obj.edit74:setField("atqD_notas_10");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout41);
    obj.edit75:setLeft(300);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(50);
    obj.edit75:setHeight(25);
    obj.edit75:setField("atqD_alc_10");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setName("edit75");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout41);
    obj.edit76:setLeft(350);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(50);
    obj.edit76:setHeight(25);
    obj.edit76:setField("atqD_adi_10");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout41);
    obj.edit77:setLeft(400);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(50);
    obj.edit77:setHeight(25);
    obj.edit77:setField("atqD_pod_10");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout41);
    obj.edit78:setLeft(450);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(50);
    obj.edit78:setHeight(25);
    obj.edit78:setField("atqD_mun_10");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.scrollBox1);
    obj.layout42:setLeft(855);
    obj.layout42:setTop(0);
    obj.layout42:setWidth(430);
    obj.layout42:setHeight(210);
    obj.layout42:setName("layout42");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout42);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(5);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout42);
    obj.label35:setLeft(15);
    obj.label35:setTop(0);
    obj.label35:setWidth(400);
    obj.label35:setHeight(20);
    obj.label35:setText("ATAQUES CORPO A CORPO");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout42);
    obj.layout43:setLeft(5);
    obj.layout43:setTop(25);
    obj.layout43:setWidth(400);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout43);
    obj.label36:setLeft(0);
    obj.label36:setTop(5);
    obj.label36:setWidth(150);
    obj.label36:setHeight(20);
    obj.label36:setText("NOME");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout43);
    obj.label37:setLeft(150);
    obj.label37:setTop(5);
    obj.label37:setWidth(150);
    obj.label37:setHeight(20);
    obj.label37:setText("NOTAS");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout43);
    obj.label38:setLeft(300);
    obj.label38:setTop(5);
    obj.label38:setWidth(50);
    obj.label38:setHeight(20);
    obj.label38:setText("ACO");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout43);
    obj.label39:setLeft(350);
    obj.label39:setTop(5);
    obj.label39:setWidth(50);
    obj.label39:setHeight(20);
    obj.label39:setText("P+F");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.layout42);
    obj.scrollBox3:setLeft(0);
    obj.scrollBox3:setTop(50);
    obj.scrollBox3:setWidth(425);
    obj.scrollBox3:setHeight(150);
    obj.scrollBox3:setName("scrollBox3");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.scrollBox3);
    obj.layout44:setLeft(5);
    obj.layout44:setTop(0);
    obj.layout44:setWidth(400);
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout44);
    obj.edit79:setLeft(0);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(150);
    obj.edit79:setHeight(25);
    obj.edit79:setField("atqC_1");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout44);
    obj.edit80:setLeft(150);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(150);
    obj.edit80:setHeight(25);
    obj.edit80:setField("atqC_notas_1");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout44);
    obj.edit81:setLeft(300);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(50);
    obj.edit81:setHeight(25);
    obj.edit81:setField("atqC_aco_1");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setName("edit81");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout44);
    obj.edit82:setLeft(350);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(50);
    obj.edit82:setHeight(25);
    obj.edit82:setField("atqC_pf_1");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setName("edit82");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.scrollBox3);
    obj.layout45:setLeft(5);
    obj.layout45:setTop(25);
    obj.layout45:setWidth(400);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout45);
    obj.edit83:setLeft(0);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(150);
    obj.edit83:setHeight(25);
    obj.edit83:setField("atqC_2");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setName("edit83");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout45);
    obj.edit84:setLeft(150);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(150);
    obj.edit84:setHeight(25);
    obj.edit84:setField("atqC_notas_2");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout45);
    obj.edit85:setLeft(300);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(50);
    obj.edit85:setHeight(25);
    obj.edit85:setField("atqC_aco_2");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout45);
    obj.edit86:setLeft(350);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(50);
    obj.edit86:setHeight(25);
    obj.edit86:setField("atqC_pf_2");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setName("edit86");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.scrollBox3);
    obj.layout46:setLeft(5);
    obj.layout46:setTop(50);
    obj.layout46:setWidth(400);
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout46);
    obj.edit87:setLeft(0);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(150);
    obj.edit87:setHeight(25);
    obj.edit87:setField("atqC_3");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setName("edit87");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout46);
    obj.edit88:setLeft(150);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(150);
    obj.edit88:setHeight(25);
    obj.edit88:setField("atqC_notas_3");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout46);
    obj.edit89:setLeft(300);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(50);
    obj.edit89:setHeight(25);
    obj.edit89:setField("atqC_aco_3");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout46);
    obj.edit90:setLeft(350);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(50);
    obj.edit90:setHeight(25);
    obj.edit90:setField("atqC_pf_3");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.scrollBox3);
    obj.layout47:setLeft(5);
    obj.layout47:setTop(75);
    obj.layout47:setWidth(400);
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout47);
    obj.edit91:setLeft(0);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(150);
    obj.edit91:setHeight(25);
    obj.edit91:setField("atqC_4");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setName("edit91");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout47);
    obj.edit92:setLeft(150);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(150);
    obj.edit92:setHeight(25);
    obj.edit92:setField("atqC_notas_4");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout47);
    obj.edit93:setLeft(300);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(50);
    obj.edit93:setHeight(25);
    obj.edit93:setField("atqC_aco_4");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setName("edit93");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout47);
    obj.edit94:setLeft(350);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(50);
    obj.edit94:setHeight(25);
    obj.edit94:setField("atqC_pf_4");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setName("edit94");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.scrollBox3);
    obj.layout48:setLeft(5);
    obj.layout48:setTop(100);
    obj.layout48:setWidth(400);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout48);
    obj.edit95:setLeft(0);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(150);
    obj.edit95:setHeight(25);
    obj.edit95:setField("atqC_5");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout48);
    obj.edit96:setLeft(150);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(150);
    obj.edit96:setHeight(25);
    obj.edit96:setField("atqC_notas_5");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setName("edit96");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout48);
    obj.edit97:setLeft(300);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(50);
    obj.edit97:setHeight(25);
    obj.edit97:setField("atqC_aco_5");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setName("edit97");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout48);
    obj.edit98:setLeft(350);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(50);
    obj.edit98:setHeight(25);
    obj.edit98:setField("atqC_pf_5");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox3);
    obj.layout49:setLeft(5);
    obj.layout49:setTop(125);
    obj.layout49:setWidth(400);
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout49);
    obj.edit99:setLeft(0);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(150);
    obj.edit99:setHeight(25);
    obj.edit99:setField("atqC_6");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setName("edit99");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout49);
    obj.edit100:setLeft(150);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(150);
    obj.edit100:setHeight(25);
    obj.edit100:setField("atqC_notas_6");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setName("edit100");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout49);
    obj.edit101:setLeft(300);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(50);
    obj.edit101:setHeight(25);
    obj.edit101:setField("atqC_aco_6");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setName("edit101");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout49);
    obj.edit102:setLeft(350);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(50);
    obj.edit102:setHeight(25);
    obj.edit102:setField("atqC_pf_6");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setName("edit102");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.scrollBox3);
    obj.layout50:setLeft(5);
    obj.layout50:setTop(150);
    obj.layout50:setWidth(400);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout50);
    obj.edit103:setLeft(0);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(150);
    obj.edit103:setHeight(25);
    obj.edit103:setField("atqC_7");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setName("edit103");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout50);
    obj.edit104:setLeft(150);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(150);
    obj.edit104:setHeight(25);
    obj.edit104:setField("atqC_notas_7");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setName("edit104");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout50);
    obj.edit105:setLeft(300);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(50);
    obj.edit105:setHeight(25);
    obj.edit105:setField("atqC_aco_7");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setName("edit105");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout50);
    obj.edit106:setLeft(350);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(50);
    obj.edit106:setHeight(25);
    obj.edit106:setField("atqC_pf_7");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setName("edit106");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.scrollBox3);
    obj.layout51:setLeft(5);
    obj.layout51:setTop(175);
    obj.layout51:setWidth(400);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout51);
    obj.edit107:setLeft(0);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(150);
    obj.edit107:setHeight(25);
    obj.edit107:setField("atqC_8");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setName("edit107");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout51);
    obj.edit108:setLeft(150);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(150);
    obj.edit108:setHeight(25);
    obj.edit108:setField("atqC_notas_8");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setName("edit108");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout51);
    obj.edit109:setLeft(300);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(50);
    obj.edit109:setHeight(25);
    obj.edit109:setField("atqC_aco_8");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setName("edit109");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout51);
    obj.edit110:setLeft(350);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(50);
    obj.edit110:setHeight(25);
    obj.edit110:setField("atqC_pf_8");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setName("edit110");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.scrollBox3);
    obj.layout52:setLeft(5);
    obj.layout52:setTop(200);
    obj.layout52:setWidth(400);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout52);
    obj.edit111:setLeft(0);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(150);
    obj.edit111:setHeight(25);
    obj.edit111:setField("atqC_9");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setName("edit111");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout52);
    obj.edit112:setLeft(150);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(150);
    obj.edit112:setHeight(25);
    obj.edit112:setField("atqC_notas_9");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setName("edit112");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout52);
    obj.edit113:setLeft(300);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(50);
    obj.edit113:setHeight(25);
    obj.edit113:setField("atqC_aco_9");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setName("edit113");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout52);
    obj.edit114:setLeft(350);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(50);
    obj.edit114:setHeight(25);
    obj.edit114:setField("atqC_pf_9");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setName("edit114");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.scrollBox3);
    obj.layout53:setLeft(5);
    obj.layout53:setTop(225);
    obj.layout53:setWidth(400);
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout53);
    obj.edit115:setLeft(0);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(150);
    obj.edit115:setHeight(25);
    obj.edit115:setField("atqC_10");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setName("edit115");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout53);
    obj.edit116:setLeft(150);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(150);
    obj.edit116:setHeight(25);
    obj.edit116:setField("atqC_notas_10");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setName("edit116");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout53);
    obj.edit117:setLeft(300);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(50);
    obj.edit117:setHeight(25);
    obj.edit117:setField("atqC_aco_10");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setName("edit117");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout53);
    obj.edit118:setLeft(350);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(50);
    obj.edit118:setHeight(25);
    obj.edit118:setField("atqC_pf_10");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setName("edit118");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.scrollBox1);
    obj.layout54:setLeft(320);
    obj.layout54:setTop(215);
    obj.layout54:setWidth(310);
    obj.layout54:setHeight(80);
    obj.layout54:setName("layout54");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout54);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setXradius(5);
    obj.rectangle7:setYradius(5);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setName("rectangle7");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout54);
    obj.label40:setLeft(0);
    obj.label40:setTop(0);
    obj.label40:setWidth(310);
    obj.label40:setHeight(20);
    obj.label40:setText("DEFESA");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout54);
    obj.layout55:setLeft(5);
    obj.layout55:setTop(25);
    obj.layout55:setWidth(50);
    obj.layout55:setHeight(50);
    obj.layout55:setName("layout55");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout55);
    obj.label41:setLeft(0);
    obj.label41:setTop(5);
    obj.label41:setWidth(50);
    obj.label41:setHeight(20);
    obj.label41:setText("VEL");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout55);
    obj.edit119:setLeft(0);
    obj.edit119:setTop(25);
    obj.edit119:setWidth(50);
    obj.edit119:setHeight(25);
    obj.edit119:setField("sj_atr_vel");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setName("edit119");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout54);
    obj.layout56:setLeft(55);
    obj.layout56:setTop(25);
    obj.layout56:setWidth(50);
    obj.layout56:setHeight(50);
    obj.layout56:setName("layout56");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout56);
    obj.label42:setLeft(0);
    obj.label42:setTop(5);
    obj.label42:setWidth(50);
    obj.label42:setHeight(20);
    obj.label42:setText("AGI");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout56);
    obj.edit120:setLeft(0);
    obj.edit120:setTop(25);
    obj.edit120:setWidth(50);
    obj.edit120:setHeight(25);
    obj.edit120:setField("sj_atr_agi");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setName("edit120");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout54);
    obj.layout57:setLeft(105);
    obj.layout57:setTop(25);
    obj.layout57:setWidth(50);
    obj.layout57:setHeight(50);
    obj.layout57:setName("layout57");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout57);
    obj.label43:setLeft(0);
    obj.label43:setTop(5);
    obj.label43:setWidth(50);
    obj.label43:setHeight(20);
    obj.label43:setText("PER");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout57);
    obj.edit121:setLeft(0);
    obj.edit121:setTop(25);
    obj.edit121:setWidth(50);
    obj.edit121:setHeight(25);
    obj.edit121:setField("sj_atr_per");
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setName("edit121");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout54);
    obj.layout58:setLeft(155);
    obj.layout58:setTop(25);
    obj.layout58:setWidth(50);
    obj.layout58:setHeight(50);
    obj.layout58:setName("layout58");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout58);
    obj.label44:setLeft(0);
    obj.label44:setTop(5);
    obj.label44:setWidth(50);
    obj.label44:setHeight(20);
    obj.label44:setText("EQUIP");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout58);
    obj.edit122:setLeft(0);
    obj.edit122:setTop(25);
    obj.edit122:setWidth(50);
    obj.edit122:setHeight(25);
    obj.edit122:setField("sj_atr_equip");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setName("edit122");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout54);
    obj.layout59:setLeft(205);
    obj.layout59:setTop(25);
    obj.layout59:setWidth(50);
    obj.layout59:setHeight(50);
    obj.layout59:setName("layout59");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout59);
    obj.label45:setLeft(0);
    obj.label45:setTop(5);
    obj.label45:setWidth(50);
    obj.label45:setHeight(20);
    obj.label45:setText("OUTRO");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout59);
    obj.edit123:setLeft(0);
    obj.edit123:setTop(25);
    obj.edit123:setWidth(50);
    obj.edit123:setHeight(25);
    obj.edit123:setField("sj_atr_out_def");
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setName("edit123");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout54);
    obj.layout60:setLeft(255);
    obj.layout60:setTop(25);
    obj.layout60:setWidth(50);
    obj.layout60:setHeight(50);
    obj.layout60:setName("layout60");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout60);
    obj.label46:setLeft(0);
    obj.label46:setTop(5);
    obj.label46:setWidth(50);
    obj.label46:setHeight(20);
    obj.label46:setText("TOTAL");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout60);
    obj.rectangle8:setLeft(0);
    obj.rectangle8:setTop(25);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout60);
    obj.label47:setLeft(0);
    obj.label47:setTop(25);
    obj.label47:setWidth(50);
    obj.label47:setHeight(25);
    obj.label47:setField("sj_defesa_total");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout54);
    obj.dataLink1:setFields({'sj_atr_vel', 'sj_atr_agi', 'sj_atr_per', 'sj_atr_equip', 'sj_atr_out_def'});
    obj.dataLink1:setName("dataLink1");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.scrollBox1);
    obj.layout61:setLeft(320);
    obj.layout61:setTop(300);
    obj.layout61:setWidth(310);
    obj.layout61:setHeight(80);
    obj.layout61:setName("layout61");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout61);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setXradius(5);
    obj.rectangle9:setYradius(5);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setName("rectangle9");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout61);
    obj.label48:setLeft(0);
    obj.label48:setTop(0);
    obj.label48:setWidth(310);
    obj.label48:setHeight(20);
    obj.label48:setText("ARMADURA");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout61);
    obj.layout62:setLeft(30);
    obj.layout62:setTop(25);
    obj.layout62:setWidth(50);
    obj.layout62:setHeight(50);
    obj.layout62:setName("layout62");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout62);
    obj.label49:setLeft(0);
    obj.label49:setTop(5);
    obj.label49:setWidth(50);
    obj.label49:setHeight(20);
    obj.label49:setText("FIS");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout62);
    obj.edit124:setLeft(0);
    obj.edit124:setTop(25);
    obj.edit124:setWidth(50);
    obj.edit124:setHeight(25);
    obj.edit124:setField("sj_atr_fis");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setName("edit124");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout61);
    obj.layout63:setLeft(80);
    obj.layout63:setTop(25);
    obj.layout63:setWidth(50);
    obj.layout63:setHeight(50);
    obj.layout63:setName("layout63");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout63);
    obj.label50:setLeft(0);
    obj.label50:setTop(5);
    obj.label50:setWidth(50);
    obj.label50:setHeight(20);
    obj.label50:setText("ARM");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout63);
    obj.edit125:setLeft(0);
    obj.edit125:setTop(25);
    obj.edit125:setWidth(50);
    obj.edit125:setHeight(25);
    obj.edit125:setField("sj_atr_arm");
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setName("edit125");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout61);
    obj.layout64:setLeft(130);
    obj.layout64:setTop(25);
    obj.layout64:setWidth(50);
    obj.layout64:setHeight(50);
    obj.layout64:setName("layout64");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout64);
    obj.label51:setLeft(0);
    obj.label51:setTop(5);
    obj.label51:setWidth(50);
    obj.label51:setHeight(20);
    obj.label51:setText("ESC");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout64);
    obj.edit126:setLeft(0);
    obj.edit126:setTop(25);
    obj.edit126:setWidth(50);
    obj.edit126:setHeight(25);
    obj.edit126:setField("sj_atr_esc");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setName("edit126");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout61);
    obj.layout65:setLeft(180);
    obj.layout65:setTop(25);
    obj.layout65:setWidth(50);
    obj.layout65:setHeight(50);
    obj.layout65:setName("layout65");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout65);
    obj.label52:setLeft(0);
    obj.label52:setTop(5);
    obj.label52:setWidth(50);
    obj.label52:setHeight(20);
    obj.label52:setText("OUTRO");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout65);
    obj.edit127:setLeft(0);
    obj.edit127:setTop(25);
    obj.edit127:setWidth(50);
    obj.edit127:setHeight(25);
    obj.edit127:setField("sj_atr_out_arm");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setName("edit127");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout61);
    obj.layout66:setLeft(230);
    obj.layout66:setTop(25);
    obj.layout66:setWidth(50);
    obj.layout66:setHeight(50);
    obj.layout66:setName("layout66");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout66);
    obj.label53:setLeft(0);
    obj.label53:setTop(5);
    obj.label53:setWidth(50);
    obj.label53:setHeight(20);
    obj.label53:setText("TOTAL");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout66);
    obj.rectangle10:setLeft(0);
    obj.rectangle10:setTop(25);
    obj.rectangle10:setWidth(50);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout66);
    obj.label54:setLeft(0);
    obj.label54:setTop(25);
    obj.label54:setWidth(50);
    obj.label54:setHeight(25);
    obj.label54:setField("sj_armadura_total");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout61);
    obj.dataLink2:setFields({'sj_atr_fis', 'sj_atr_arm', 'sj_atr_esc', 'sj_atr_out_arm'});
    obj.dataLink2:setName("dataLink2");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.scrollBox1);
    obj.layout67:setLeft(635);
    obj.layout67:setTop(215);
    obj.layout67:setWidth(410);
    obj.layout67:setHeight(180);
    obj.layout67:setName("layout67");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout67);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setXradius(5);
    obj.rectangle11:setYradius(5);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setName("rectangle11");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout67);
    obj.label55:setLeft(5);
    obj.label55:setTop(0);
    obj.label55:setWidth(400);
    obj.label55:setHeight(20);
    obj.label55:setText("DANO CATASTROFICO");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout67);
    obj.layout68:setLeft(5);
    obj.layout68:setTop(25);
    obj.layout68:setWidth(500);
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout68);
    obj.label56:setLeft(0);
    obj.label56:setTop(5);
    obj.label56:setWidth(100);
    obj.label56:setHeight(20);
    obj.label56:setText("DANO");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout68);
    obj.label57:setLeft(100);
    obj.label57:setTop(5);
    obj.label57:setWidth(300);
    obj.label57:setHeight(20);
    obj.label57:setText("DESCRIÇÃO");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout67);
    obj.layout69:setLeft(0);
    obj.layout69:setTop(50);
    obj.layout69:setWidth(500);
    obj.layout69:setHeight(555);
    obj.layout69:setName("layout69");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout69);
    obj.layout70:setLeft(5);
    obj.layout70:setTop(0);
    obj.layout70:setWidth(500);
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout70);
    obj.edit128:setLeft(0);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(100);
    obj.edit128:setHeight(25);
    obj.edit128:setField("dano_1");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setName("edit128");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout70);
    obj.edit129:setLeft(100);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(300);
    obj.edit129:setHeight(25);
    obj.edit129:setField("dano_desc_1");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setName("edit129");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout69);
    obj.layout71:setLeft(5);
    obj.layout71:setTop(25);
    obj.layout71:setWidth(500);
    obj.layout71:setHeight(25);
    obj.layout71:setName("layout71");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout71);
    obj.edit130:setLeft(0);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(100);
    obj.edit130:setHeight(25);
    obj.edit130:setField("dano_2");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setName("edit130");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout71);
    obj.edit131:setLeft(100);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(300);
    obj.edit131:setHeight(25);
    obj.edit131:setField("dano_desc_2");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setName("edit131");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout69);
    obj.layout72:setLeft(5);
    obj.layout72:setTop(50);
    obj.layout72:setWidth(500);
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout72);
    obj.edit132:setLeft(0);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(100);
    obj.edit132:setHeight(25);
    obj.edit132:setField("dano_3");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setName("edit132");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout72);
    obj.edit133:setLeft(100);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(300);
    obj.edit133:setHeight(25);
    obj.edit133:setField("dano_desc_3");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setName("edit133");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout69);
    obj.layout73:setLeft(5);
    obj.layout73:setTop(75);
    obj.layout73:setWidth(500);
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout73);
    obj.edit134:setLeft(0);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(100);
    obj.edit134:setHeight(25);
    obj.edit134:setField("dano_4");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setName("edit134");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout73);
    obj.edit135:setLeft(100);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(300);
    obj.edit135:setHeight(25);
    obj.edit135:setField("dano_desc_4");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setName("edit135");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout69);
    obj.layout74:setLeft(5);
    obj.layout74:setTop(100);
    obj.layout74:setWidth(500);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout74);
    obj.edit136:setLeft(0);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(100);
    obj.edit136:setHeight(25);
    obj.edit136:setField("dano_5");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setName("edit136");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout74);
    obj.edit137:setLeft(100);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(300);
    obj.edit137:setHeight(25);
    obj.edit137:setField("dano_desc_5");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setName("edit137");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.scrollBox1);
    obj.layout75:setLeft(635);
    obj.layout75:setTop(400);
    obj.layout75:setWidth(410);
    obj.layout75:setHeight(180);
    obj.layout75:setName("layout75");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout75);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(5);
    obj.rectangle12:setYradius(5);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout75);
    obj.label58:setLeft(5);
    obj.label58:setTop(0);
    obj.label58:setWidth(400);
    obj.label58:setHeight(20);
    obj.label58:setText("MECANISMOS E APRIMORAMENTOS");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout75);
    obj.layout76:setLeft(5);
    obj.layout76:setTop(25);
    obj.layout76:setWidth(500);
    obj.layout76:setHeight(25);
    obj.layout76:setName("layout76");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout76);
    obj.label59:setLeft(0);
    obj.label59:setTop(5);
    obj.label59:setWidth(100);
    obj.label59:setHeight(20);
    obj.label59:setText("NOME");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout76);
    obj.label60:setLeft(100);
    obj.label60:setTop(5);
    obj.label60:setWidth(300);
    obj.label60:setHeight(20);
    obj.label60:setText("DESCRIÇÃO");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.layout75);
    obj.scrollBox4:setLeft(0);
    obj.scrollBox4:setTop(50);
    obj.scrollBox4:setWidth(405);
    obj.scrollBox4:setHeight(125);
    obj.scrollBox4:setName("scrollBox4");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.scrollBox4);
    obj.layout77:setLeft(5);
    obj.layout77:setTop(0);
    obj.layout77:setWidth(380);
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout77);
    obj.edit138:setLeft(0);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(100);
    obj.edit138:setHeight(25);
    obj.edit138:setField("meca_1");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setName("edit138");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout77);
    obj.edit139:setLeft(100);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(280);
    obj.edit139:setHeight(25);
    obj.edit139:setField("meca_desc_1");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setName("edit139");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.scrollBox4);
    obj.layout78:setLeft(5);
    obj.layout78:setTop(25);
    obj.layout78:setWidth(380);
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout78);
    obj.edit140:setLeft(0);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(100);
    obj.edit140:setHeight(25);
    obj.edit140:setField("meca_2");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setName("edit140");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout78);
    obj.edit141:setLeft(100);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(280);
    obj.edit141:setHeight(25);
    obj.edit141:setField("meca_desc_2");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setName("edit141");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.scrollBox4);
    obj.layout79:setLeft(5);
    obj.layout79:setTop(50);
    obj.layout79:setWidth(380);
    obj.layout79:setHeight(25);
    obj.layout79:setName("layout79");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout79);
    obj.edit142:setLeft(0);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(100);
    obj.edit142:setHeight(25);
    obj.edit142:setField("meca_3");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setName("edit142");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout79);
    obj.edit143:setLeft(100);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(280);
    obj.edit143:setHeight(25);
    obj.edit143:setField("meca_desc_3");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setName("edit143");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.scrollBox4);
    obj.layout80:setLeft(5);
    obj.layout80:setTop(75);
    obj.layout80:setWidth(380);
    obj.layout80:setHeight(25);
    obj.layout80:setName("layout80");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout80);
    obj.edit144:setLeft(0);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(100);
    obj.edit144:setHeight(25);
    obj.edit144:setField("meca_4");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setName("edit144");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout80);
    obj.edit145:setLeft(100);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(280);
    obj.edit145:setHeight(25);
    obj.edit145:setField("meca_desc_4");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setName("edit145");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.scrollBox4);
    obj.layout81:setLeft(5);
    obj.layout81:setTop(100);
    obj.layout81:setWidth(380);
    obj.layout81:setHeight(25);
    obj.layout81:setName("layout81");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout81);
    obj.edit146:setLeft(0);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(100);
    obj.edit146:setHeight(25);
    obj.edit146:setField("meca_5");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setName("edit146");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout81);
    obj.edit147:setLeft(100);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(280);
    obj.edit147:setHeight(25);
    obj.edit147:setField("meca_desc_5");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setName("edit147");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.scrollBox4);
    obj.layout82:setLeft(5);
    obj.layout82:setTop(125);
    obj.layout82:setWidth(380);
    obj.layout82:setHeight(25);
    obj.layout82:setName("layout82");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout82);
    obj.edit148:setLeft(0);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(100);
    obj.edit148:setHeight(25);
    obj.edit148:setField("meca_6");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setName("edit148");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout82);
    obj.edit149:setLeft(100);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(280);
    obj.edit149:setHeight(25);
    obj.edit149:setField("meca_desc_6");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setName("edit149");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.scrollBox4);
    obj.layout83:setLeft(5);
    obj.layout83:setTop(150);
    obj.layout83:setWidth(380);
    obj.layout83:setHeight(25);
    obj.layout83:setName("layout83");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout83);
    obj.edit150:setLeft(0);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(100);
    obj.edit150:setHeight(25);
    obj.edit150:setField("meca_7");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setName("edit150");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout83);
    obj.edit151:setLeft(100);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(280);
    obj.edit151:setHeight(25);
    obj.edit151:setField("meca_desc_7");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setName("edit151");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.scrollBox4);
    obj.layout84:setLeft(5);
    obj.layout84:setTop(175);
    obj.layout84:setWidth(380);
    obj.layout84:setHeight(25);
    obj.layout84:setName("layout84");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout84);
    obj.edit152:setLeft(0);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(100);
    obj.edit152:setHeight(25);
    obj.edit152:setField("meca_8");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setName("edit152");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout84);
    obj.edit153:setLeft(100);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(280);
    obj.edit153:setHeight(25);
    obj.edit153:setField("meca_desc_8");
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setName("edit153");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.scrollBox4);
    obj.layout85:setLeft(5);
    obj.layout85:setTop(200);
    obj.layout85:setWidth(380);
    obj.layout85:setHeight(25);
    obj.layout85:setName("layout85");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout85);
    obj.edit154:setLeft(0);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(100);
    obj.edit154:setHeight(25);
    obj.edit154:setField("meca_9");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setName("edit154");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout85);
    obj.edit155:setLeft(100);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(280);
    obj.edit155:setHeight(25);
    obj.edit155:setField("meca_desc_9");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setName("edit155");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.scrollBox4);
    obj.layout86:setLeft(5);
    obj.layout86:setTop(225);
    obj.layout86:setWidth(380);
    obj.layout86:setHeight(25);
    obj.layout86:setName("layout86");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout86);
    obj.edit156:setLeft(0);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(100);
    obj.edit156:setHeight(25);
    obj.edit156:setField("meca_10");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setName("edit156");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout86);
    obj.edit157:setLeft(100);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(280);
    obj.edit157:setHeight(25);
    obj.edit157:setField("meca_desc_10");
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setName("edit157");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox1);
    obj.rectangle13:setLeft(1050);
    obj.rectangle13:setTop(215);
    obj.rectangle13:setWidth(252);
    obj.rectangle13:setHeight(252);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(1050);
    obj.image1:setTop(216);
    obj.image1:setWidth(250);
    obj.image1:setHeight(250);
    obj.image1:setField("steamjack");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setAlign("client");
    obj.image2:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.sj_defesa_total = 	(tonumber(sheet.sj_atr_vel) or 0) + 
            	                                            (tonumber(sheet.sj_atr_agi) or 0) + 
            	                                            (tonumber(sheet.sj_atr_per) or 0) + 
            	                                            (tonumber(sheet.sj_atr_equip) or 0) + 
            	                                            (tonumber(sheet.sj_atr_out_def) or 0);
                            	end;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.sj_armadura_total = 	(tonumber(sheet.sj_atr_fis) or 0) + 
            	                                            (tonumber(sheet.sj_atr_arm) or 0) + 
            	                                            (tonumber(sheet.sj_atr_esc) or 0) + 
            	                                            (tonumber(sheet.sj_atr_out_arm) or 0);
                            	end;
        end, obj);

    function obj:_releaseEvents()
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
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmRDF5 = {
    newEditor = newfrmRDF5, 
    new = newfrmRDF5, 
    name = "frmRDF5", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmRDF5 = _frmRDF5;
rrpg.registrarForm(_frmRDF5);

return _frmRDF5;
