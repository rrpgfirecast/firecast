require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmAMZ1_4()
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
    obj:setName("frmAMZ1_4");
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
    obj.layout1:setWidth(960);
    obj.layout1:setHeight(245);
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
    obj.label1:setWidth(715);
    obj.label1:setHeight(20);
    obj.label1:setText("Equipamentos");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(10);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(230);
    obj.layout2:setHeight(200);
    obj.layout2:setName("layout2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#191919");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(230);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(60);
    obj.label2:setHeight(20);
    obj.label2:setText("1. ");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout3);
    obj.comboBox1:setLeft(60);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(165);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("inventario_1");
    obj.comboBox1:setItems({'Card: DESTRUCTION', 'Card: GILGAMESH', 'Card: GUNGNIR', 'Card: AVALON', 'Card: SAVITAR', 'Card: APOLO', 'Card: ÁRTEMIS', '-'});
    obj.comboBox1:setName("comboBox1");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(25);
    obj.layout4:setWidth(230);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setLeft(0);
    obj.label3:setTop(5);
    obj.label3:setWidth(60);
    obj.label3:setHeight(20);
    obj.label3:setText("2. ");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout4);
    obj.comboBox2:setLeft(60);
    obj.comboBox2:setTop(0);
    obj.comboBox2:setWidth(165);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("inventario_2");
    obj.comboBox2:setItems({'Card: DESTRUCTION', 'Card: GILGAMESH', 'Card: GUNGNIR', 'Card: AVALON', 'Card: SAVITAR', 'Card: APOLO', 'Card: ÁRTEMIS', '-'});
    obj.comboBox2:setName("comboBox2");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(50);
    obj.layout5:setWidth(230);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(60);
    obj.label4:setHeight(20);
    obj.label4:setText("3. ");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout5);
    obj.comboBox3:setLeft(60);
    obj.comboBox3:setTop(0);
    obj.comboBox3:setWidth(165);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("inventario_3");
    obj.comboBox3:setItems({'Card: DESTRUCTION', 'Card: GILGAMESH', 'Card: GUNGNIR', 'Card: AVALON', 'Card: SAVITAR', 'Card: APOLO', 'Card: ÁRTEMIS', '-'});
    obj.comboBox3:setName("comboBox3");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(75);
    obj.layout6:setWidth(230);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setLeft(0);
    obj.label5:setTop(5);
    obj.label5:setWidth(60);
    obj.label5:setHeight(20);
    obj.label5:setText("4. ");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout6);
    obj.comboBox4:setLeft(60);
    obj.comboBox4:setTop(0);
    obj.comboBox4:setWidth(165);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("inventario_4");
    obj.comboBox4:setItems({'Card: DESTRUCTION', 'Card: GILGAMESH', 'Card: GUNGNIR', 'Card: AVALON', 'Card: SAVITAR', 'Card: APOLO', 'Card: ÁRTEMIS', '-'});
    obj.comboBox4:setName("comboBox4");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(100);
    obj.layout7:setWidth(230);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(60);
    obj.label6:setHeight(20);
    obj.label6:setText("5. ");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout7);
    obj.comboBox5:setLeft(60);
    obj.comboBox5:setTop(0);
    obj.comboBox5:setWidth(165);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("inventario_5");
    obj.comboBox5:setItems({'Card: DESTRUCTION', 'Card: GILGAMESH', 'Card: GUNGNIR', 'Card: AVALON', 'Card: SAVITAR', 'Card: APOLO', 'Card: ÁRTEMIS', '-'});
    obj.comboBox5:setName("comboBox5");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(125);
    obj.layout8:setWidth(230);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(60);
    obj.label7:setHeight(20);
    obj.label7:setText("6. ");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout8);
    obj.comboBox6:setLeft(60);
    obj.comboBox6:setTop(0);
    obj.comboBox6:setWidth(165);
    obj.comboBox6:setHeight(25);
    obj.comboBox6:setField("inventario_6");
    obj.comboBox6:setItems({'Card: DESTRUCTION', 'Card: GILGAMESH', 'Card: GUNGNIR', 'Card: AVALON', 'Card: SAVITAR', 'Card: APOLO', 'Card: ÁRTEMIS', '-'});
    obj.comboBox6:setName("comboBox6");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout2);
    obj.layout9:setLeft(0);
    obj.layout9:setTop(150);
    obj.layout9:setWidth(230);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setLeft(0);
    obj.label8:setTop(5);
    obj.label8:setWidth(60);
    obj.label8:setHeight(20);
    obj.label8:setText("7. ");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout9);
    obj.comboBox7:setLeft(60);
    obj.comboBox7:setTop(0);
    obj.comboBox7:setWidth(165);
    obj.comboBox7:setHeight(25);
    obj.comboBox7:setField("inventario_7");
    obj.comboBox7:setItems({'Card: DESTRUCTION', 'Card: GILGAMESH', 'Card: GUNGNIR', 'Card: AVALON', 'Card: SAVITAR', 'Card: APOLO', 'Card: ÁRTEMIS', '-'});
    obj.comboBox7:setName("comboBox7");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout2);
    obj.layout10:setLeft(0);
    obj.layout10:setTop(175);
    obj.layout10:setWidth(230);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout10);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(60);
    obj.label9:setHeight(20);
    obj.label9:setText("8. ");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.comboBox8 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout10);
    obj.comboBox8:setLeft(60);
    obj.comboBox8:setTop(0);
    obj.comboBox8:setWidth(165);
    obj.comboBox8:setHeight(25);
    obj.comboBox8:setField("inventario_8");
    obj.comboBox8:setItems({'Card: DESTRUCTION', 'Card: GILGAMESH', 'Card: GUNGNIR', 'Card: AVALON', 'Card: SAVITAR', 'Card: APOLO', 'Card: ÁRTEMIS', '-'});
    obj.comboBox8:setName("comboBox8");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(250);
    obj.layout11:setTop(25);
    obj.layout11:setWidth(230);
    obj.layout11:setHeight(50);
    obj.layout11:setName("layout11");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout11);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#191919");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(0);
    obj.layout12:setWidth(230);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout12);
    obj.label10:setLeft(0);
    obj.label10:setTop(5);
    obj.label10:setWidth(60);
    obj.label10:setHeight(20);
    obj.label10:setText("9. ");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.comboBox9 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout12);
    obj.comboBox9:setLeft(60);
    obj.comboBox9:setTop(0);
    obj.comboBox9:setWidth(165);
    obj.comboBox9:setHeight(25);
    obj.comboBox9:setField("inventario_9");
    obj.comboBox9:setItems({'Estojo', 'Mochila', 'Bag', '-'});
    obj.comboBox9:setName("comboBox9");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setLeft(0);
    obj.layout13:setTop(25);
    obj.layout13:setWidth(230);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout13);
    obj.label11:setLeft(0);
    obj.label11:setTop(5);
    obj.label11:setWidth(60);
    obj.label11:setHeight(20);
    obj.label11:setText("10. ");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout13);
    obj.rectangle4:setLeft(60);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(165);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout13);
    obj.label12:setLeft(62);
    obj.label12:setTop(0);
    obj.label12:setWidth(161);
    obj.label12:setHeight(25);
    obj.label12:setField("device");
    obj.label12:setName("label12");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout11);
    obj.dataLink1:setField("inventario_9");
    obj.dataLink1:setName("dataLink1");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout1);
    obj.layout14:setLeft(490);
    obj.layout14:setTop(25);
    obj.layout14:setWidth(230);
    obj.layout14:setHeight(200);
    obj.layout14:setName("layout14");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout14);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#191919");
    obj.rectangle5:setXradius(5);
    obj.rectangle5:setYradius(5);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setName("rectangle5");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(0);
    obj.layout15:setWidth(230);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout15);
    obj.label13:setLeft(0);
    obj.label13:setTop(5);
    obj.label13:setWidth(60);
    obj.label13:setHeight(20);
    obj.label13:setText("11. ");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.inventario_11 = gui.fromHandle(_obj_newObject("edit"));
    obj.inventario_11:setParent(obj.layout15);
    obj.inventario_11:setLeft(60);
    obj.inventario_11:setTop(0);
    obj.inventario_11:setWidth(165);
    obj.inventario_11:setHeight(25);
    obj.inventario_11:setField("inventario_11");
    obj.inventario_11:setName("inventario_11");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout14);
    obj.layout16:setLeft(0);
    obj.layout16:setTop(25);
    obj.layout16:setWidth(230);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout16);
    obj.label14:setLeft(0);
    obj.label14:setTop(5);
    obj.label14:setWidth(60);
    obj.label14:setHeight(20);
    obj.label14:setText("12. ");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.inventario_12 = gui.fromHandle(_obj_newObject("edit"));
    obj.inventario_12:setParent(obj.layout16);
    obj.inventario_12:setLeft(60);
    obj.inventario_12:setTop(0);
    obj.inventario_12:setWidth(165);
    obj.inventario_12:setHeight(25);
    obj.inventario_12:setField("inventario_12");
    obj.inventario_12:setName("inventario_12");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout14);
    obj.layout17:setLeft(0);
    obj.layout17:setTop(50);
    obj.layout17:setWidth(230);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout17);
    obj.label15:setLeft(0);
    obj.label15:setTop(5);
    obj.label15:setWidth(60);
    obj.label15:setHeight(20);
    obj.label15:setText("13. ");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.inventario_13 = gui.fromHandle(_obj_newObject("edit"));
    obj.inventario_13:setParent(obj.layout17);
    obj.inventario_13:setLeft(60);
    obj.inventario_13:setTop(0);
    obj.inventario_13:setWidth(165);
    obj.inventario_13:setHeight(25);
    obj.inventario_13:setField("inventario_13");
    obj.inventario_13:setName("inventario_13");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout14);
    obj.layout18:setLeft(0);
    obj.layout18:setTop(75);
    obj.layout18:setWidth(230);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout18);
    obj.label16:setLeft(0);
    obj.label16:setTop(5);
    obj.label16:setWidth(60);
    obj.label16:setHeight(20);
    obj.label16:setText("14. ");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.inventario_14 = gui.fromHandle(_obj_newObject("edit"));
    obj.inventario_14:setParent(obj.layout18);
    obj.inventario_14:setLeft(60);
    obj.inventario_14:setTop(0);
    obj.inventario_14:setWidth(165);
    obj.inventario_14:setHeight(25);
    obj.inventario_14:setField("inventario_14");
    obj.inventario_14:setName("inventario_14");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout14);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(100);
    obj.layout19:setWidth(230);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout19);
    obj.label17:setLeft(0);
    obj.label17:setTop(5);
    obj.label17:setWidth(60);
    obj.label17:setHeight(20);
    obj.label17:setText("15. ");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.inventario_15 = gui.fromHandle(_obj_newObject("edit"));
    obj.inventario_15:setParent(obj.layout19);
    obj.inventario_15:setLeft(60);
    obj.inventario_15:setTop(0);
    obj.inventario_15:setWidth(165);
    obj.inventario_15:setHeight(25);
    obj.inventario_15:setField("inventario_15");
    obj.inventario_15:setName("inventario_15");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout14);
    obj.layout20:setLeft(0);
    obj.layout20:setTop(125);
    obj.layout20:setWidth(230);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout20);
    obj.label18:setLeft(0);
    obj.label18:setTop(5);
    obj.label18:setWidth(60);
    obj.label18:setHeight(20);
    obj.label18:setText("16. ");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.inventario_16 = gui.fromHandle(_obj_newObject("edit"));
    obj.inventario_16:setParent(obj.layout20);
    obj.inventario_16:setLeft(60);
    obj.inventario_16:setTop(0);
    obj.inventario_16:setWidth(165);
    obj.inventario_16:setHeight(25);
    obj.inventario_16:setField("inventario_16");
    obj.inventario_16:setName("inventario_16");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout14);
    obj.layout21:setLeft(0);
    obj.layout21:setTop(150);
    obj.layout21:setWidth(230);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout21);
    obj.label19:setLeft(0);
    obj.label19:setTop(5);
    obj.label19:setWidth(60);
    obj.label19:setHeight(20);
    obj.label19:setText("17. ");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.inventario_17 = gui.fromHandle(_obj_newObject("edit"));
    obj.inventario_17:setParent(obj.layout21);
    obj.inventario_17:setLeft(60);
    obj.inventario_17:setTop(0);
    obj.inventario_17:setWidth(165);
    obj.inventario_17:setHeight(25);
    obj.inventario_17:setField("inventario_17");
    obj.inventario_17:setName("inventario_17");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout14);
    obj.layout22:setLeft(0);
    obj.layout22:setTop(175);
    obj.layout22:setWidth(230);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout22);
    obj.label20:setLeft(0);
    obj.label20:setTop(5);
    obj.label20:setWidth(60);
    obj.label20:setHeight(20);
    obj.label20:setText("18. ");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.inventario_18 = gui.fromHandle(_obj_newObject("edit"));
    obj.inventario_18:setParent(obj.layout22);
    obj.inventario_18:setLeft(60);
    obj.inventario_18:setTop(0);
    obj.inventario_18:setWidth(165);
    obj.inventario_18:setHeight(25);
    obj.inventario_18:setField("inventario_18");
    obj.inventario_18:setName("inventario_18");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout1);
    obj.layout23:setLeft(730);
    obj.layout23:setTop(25);
    obj.layout23:setWidth(230);
    obj.layout23:setHeight(200);
    obj.layout23:setName("layout23");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout23);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("#191919");
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(5);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout23);
    obj.label21:setLeft(0);
    obj.label21:setTop(0);
    obj.label21:setWidth(230);
    obj.label21:setHeight(20);
    obj.label21:setText("Anotações");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout23);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(20);
    obj.textEditor1:setWidth(220);
    obj.textEditor1:setHeight(175);
    obj.textEditor1:setField("inventario_19");
    obj.textEditor1:setName("textEditor1");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            							if sheet.inventario_9 == "Estojo" then
            								self.inventario_11.visible = true;
            								self.inventario_12.visible = true;
            								self.inventario_13.visible = false;
            								self.inventario_14.visible = false;
            								self.inventario_15.visible = false;
            								self.inventario_16.visible = false;
            								self.inventario_17.visible = false;
            								self.inventario_18.visible = false;
            							elseif sheet.inventario_9 == "Mochila" then
            								self.inventario_11.visible = true;
            								self.inventario_12.visible = true;
            								self.inventario_13.visible = true;
            								self.inventario_14.visible = true;
            								self.inventario_15.visible = false;
            								self.inventario_16.visible = false;
            								self.inventario_17.visible = false;
            								self.inventario_18.visible = false;
            							elseif sheet.inventario_9 == "Bag" then
            								self.inventario_11.visible = true;
            								self.inventario_12.visible = true;
            								self.inventario_13.visible = true;
            								self.inventario_14.visible = true;
            								self.inventario_15.visible = true;
            								self.inventario_16.visible = true;
            								self.inventario_17.visible = true;
            								self.inventario_18.visible = true;
            							else
            								self.inventario_11.visible = false;
            								self.inventario_12.visible = false;
            								self.inventario_13.visible = false;
            								self.inventario_14.visible = false;
            								self.inventario_15.visible = false;
            								self.inventario_16.visible = false;
            								self.inventario_17.visible = false;
            								self.inventario_18.visible = false;
            							end
            						end;
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.inventario_12 ~= nil then self.inventario_12:destroy(); self.inventario_12 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.inventario_18 ~= nil then self.inventario_18:destroy(); self.inventario_18 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.inventario_17 ~= nil then self.inventario_17:destroy(); self.inventario_17 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.inventario_16 ~= nil then self.inventario_16:destroy(); self.inventario_16 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.inventario_13 ~= nil then self.inventario_13:destroy(); self.inventario_13 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.inventario_15 ~= nil then self.inventario_15:destroy(); self.inventario_15 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.inventario_11 ~= nil then self.inventario_11:destroy(); self.inventario_11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.inventario_14 ~= nil then self.inventario_14:destroy(); self.inventario_14 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAMZ1_4 = {
    newEditor = newfrmAMZ1_4, 
    new = newfrmAMZ1_4, 
    name = "frmAMZ1_4", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAMZ1_4 = _frmAMZ1_4;
rrpg.registrarForm(_frmAMZ1_4);

return _frmAMZ1_4;
