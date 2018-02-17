require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmStats()
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
    obj:setName("frmStats");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(210);
    obj.layout1:setHeight(505);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(210);
    obj.label1:setHeight(20);
    obj.label1:setText("KARMA SPENT");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setText("ATTRIBUTES");
    obj.label2:setLeft(5);
    obj.label2:setTop(25);
    obj.label2:setWidth(150);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setLeft(155);
    obj.rectangle2:setTop(25);
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(155);
    obj.label3:setTop(25);
    obj.label3:setWidth(50);
    obj.label3:setHeight(25);
    obj.label3:setField("attribute_karma_spent");
    obj.label3:setVertTextAlign("center");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setText("ACTIVE SKILLS");
    obj.label4:setLeft(5);
    obj.label4:setTop(50);
    obj.label4:setWidth(150);
    obj.label4:setHeight(20);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setLeft(155);
    obj.rectangle3:setTop(50);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(155);
    obj.label5:setTop(50);
    obj.label5:setWidth(50);
    obj.label5:setHeight(25);
    obj.label5:setField("skills_active_karma_spent");
    obj.label5:setVertTextAlign("center");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setText("KNOWLEDGE SKILLS");
    obj.label6:setLeft(5);
    obj.label6:setTop(75);
    obj.label6:setWidth(150);
    obj.label6:setHeight(20);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout1);
    obj.rectangle4:setLeft(155);
    obj.rectangle4:setTop(75);
    obj.rectangle4:setWidth(50);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setLeft(155);
    obj.label7:setTop(75);
    obj.label7:setWidth(50);
    obj.label7:setHeight(25);
    obj.label7:setField("skills_knowledge_karma_spent");
    obj.label7:setVertTextAlign("center");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setText("LANGUAGE SKILLS");
    obj.label8:setLeft(5);
    obj.label8:setTop(100);
    obj.label8:setWidth(150);
    obj.label8:setHeight(20);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout1);
    obj.rectangle5:setLeft(155);
    obj.rectangle5:setTop(100);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout1);
    obj.label9:setLeft(155);
    obj.label9:setTop(100);
    obj.label9:setWidth(50);
    obj.label9:setHeight(25);
    obj.label9:setField("skills_language_karma_spent");
    obj.label9:setVertTextAlign("center");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout1);
    obj.label10:setText("QUALITIES");
    obj.label10:setLeft(5);
    obj.label10:setTop(125);
    obj.label10:setWidth(150);
    obj.label10:setHeight(20);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout1);
    obj.rectangle6:setLeft(155);
    obj.rectangle6:setTop(125);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout1);
    obj.label11:setLeft(155);
    obj.label11:setTop(125);
    obj.label11:setWidth(50);
    obj.label11:setHeight(25);
    obj.label11:setField("qualities_karma");
    obj.label11:setVertTextAlign("center");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout1);
    obj.label12:setText("CONTACTS");
    obj.label12:setLeft(5);
    obj.label12:setTop(150);
    obj.label12:setWidth(150);
    obj.label12:setHeight(20);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout1);
    obj.rectangle7:setLeft(155);
    obj.rectangle7:setTop(150);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout1);
    obj.label13:setLeft(155);
    obj.label13:setTop(150);
    obj.label13:setWidth(50);
    obj.label13:setHeight(25);
    obj.label13:setField("contact_karma");
    obj.label13:setVertTextAlign("center");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout1);
    obj.label14:setText("S/P/R/CF");
    obj.label14:setLeft(5);
    obj.label14:setTop(175);
    obj.label14:setWidth(150);
    obj.label14:setHeight(20);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout1);
    obj.rectangle8:setLeft(155);
    obj.rectangle8:setTop(175);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout1);
    obj.label15:setLeft(155);
    obj.label15:setTop(175);
    obj.label15:setWidth(50);
    obj.label15:setHeight(25);
    obj.label15:setField("spells_karma");
    obj.label15:setVertTextAlign("center");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout1);
    obj.label16:setText("POWERS/ABILITIES");
    obj.label16:setLeft(5);
    obj.label16:setTop(200);
    obj.label16:setWidth(150);
    obj.label16:setHeight(20);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout1);
    obj.rectangle9:setLeft(155);
    obj.rectangle9:setTop(200);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout1);
    obj.label17:setLeft(155);
    obj.label17:setTop(200);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setField("abilities_karma");
    obj.label17:setVertTextAlign("center");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout1);
    obj.label18:setText("OTHER");
    obj.label18:setLeft(5);
    obj.label18:setTop(225);
    obj.label18:setWidth(150);
    obj.label18:setHeight(20);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(155);
    obj.edit1:setTop(225);
    obj.edit1:setWidth(50);
    obj.edit1:setHeight(25);
    obj.edit1:setField("other_karma");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout1);
    obj.label19:setText("MISC");
    obj.label19:setLeft(5);
    obj.label19:setTop(250);
    obj.label19:setWidth(150);
    obj.label19:setHeight(20);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setLeft(155);
    obj.edit2:setTop(250);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("misc_karma");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout1);
    obj.label20:setText("ALTERNATIVE");
    obj.label20:setLeft(5);
    obj.label20:setTop(275);
    obj.label20:setWidth(150);
    obj.label20:setHeight(20);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setLeft(155);
    obj.edit3:setTop(275);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("alternative_karma");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(300);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(200);
    obj.textEditor1:setField("details_karma");
    obj.textEditor1:setName("textEditor1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setFields({'attribute_karma_spent', 'skills_active_karma_spent', 'skills_knowledge_karma_spent', 'skills_language_karma_spent', 'qualities_karma', 'contact_karma', 'spells_karma', 'abilities_karma', 'other_karma', 'misc_karma', 'alternative_karma', 'details_karma', 'karmaTotal'});
    obj.dataLink1:setName("dataLink1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(215);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(610);
    obj.layout2:setHeight(155);
    obj.layout2:setName("layout2");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout2);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout2);
    obj.label21:setLeft(5);
    obj.label21:setTop(0);
    obj.label21:setWidth(610);
    obj.label21:setHeight(20);
    obj.label21:setText("PRIORITIES");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout2);
    obj.label22:setText("PRIORITY A");
    obj.label22:setLeft(5);
    obj.label22:setTop(25);
    obj.label22:setWidth(100);
    obj.label22:setHeight(20);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setLeft(105);
    obj.comboBox1:setTop(25);
    obj.comboBox1:setWidth(500);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("priority_a");
    obj.comboBox1:setItems({'METATYPE: Human (9), Elf (8), Dwarf (7), Ork (7), Troll (5)', 'ATTRIBUTES: 24', 'MAGIC: Magician or Mystic Adept: Magic 6, two Rating 5 Magical skills, 10 spells', 'RESSONANCE: Technomancer: Resonance 6, two Rating 5 Resonance skills, 5 complex forms', 'SKILLS: 46/10 ', 'RESOURCES: 450,000¥'});
    obj.comboBox1:setName("comboBox1");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout2);
    obj.label23:setText("PRIORITY B");
    obj.label23:setLeft(5);
    obj.label23:setTop(50);
    obj.label23:setWidth(100);
    obj.label23:setHeight(20);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout2);
    obj.comboBox2:setLeft(105);
    obj.comboBox2:setTop(50);
    obj.comboBox2:setWidth(500);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("priority_b");
    obj.comboBox2:setItems({'METATYPE: Human (7), Elf (6), Dwarf (4), Ork (4), Troll (0)', 'ATTRIBUTES: 20', 'MAGIC: Magician or Mystic Adept: Magic 4, two Rating 4 Magical skills, 7 spells', 'RESSONANCE: Technomancer: Resonance 4, two Rating 4 Resonance skills, 2 complex forms', 'MAGIC: Adept: Magic 6, one Rating 4 Active skill', 'MAGIC: Aspected Magician: Magic 5, one Rating 4 Magical skill group', 'SKILLS: 36/5 ', 'RESOURCES: 275,000¥'});
    obj.comboBox2:setName("comboBox2");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout2);
    obj.label24:setText("PRIORITY C");
    obj.label24:setLeft(5);
    obj.label24:setTop(75);
    obj.label24:setWidth(100);
    obj.label24:setHeight(20);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout2);
    obj.comboBox3:setLeft(105);
    obj.comboBox3:setTop(75);
    obj.comboBox3:setWidth(500);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("priority_c");
    obj.comboBox3:setItems({'METATYPE: Human (5), Elf (3), Dwarf (1), Ork (0)', 'ATTRIBUTES: 16', 'MAGIC: Magician or Mystic Adept: Magic 3, 5 spells', 'RESSONANCE: Technomancer: Resonance 3, 1 complex form', 'MAGIC: Adept: Magic 4, one Rating 2 Active skill', 'MAGIC: Aspected Magician: Magic 3, one Rating 2 Magical skill group', 'SKILLS: 28/2 ', 'RESOURCES: 140,000¥'});
    obj.comboBox3:setName("comboBox3");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout2);
    obj.label25:setText("PRIORITY D");
    obj.label25:setLeft(5);
    obj.label25:setTop(100);
    obj.label25:setWidth(100);
    obj.label25:setHeight(20);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout2);
    obj.comboBox4:setLeft(105);
    obj.comboBox4:setTop(100);
    obj.comboBox4:setWidth(500);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("priority_d");
    obj.comboBox4:setItems({'METATYPE: Human (3), Elf (0)', 'ATTRIBUTES: 14', 'MAGIC: Adept: Magic 2', 'MAGIC: Aspected Magician: Magic 2', 'SKILLS: 22/0 ', 'RESOURCES: 50,000¥'});
    obj.comboBox4:setName("comboBox4");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout2);
    obj.label26:setText("PRIORITY E");
    obj.label26:setLeft(5);
    obj.label26:setTop(125);
    obj.label26:setWidth(100);
    obj.label26:setHeight(20);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout2);
    obj.comboBox5:setLeft(105);
    obj.comboBox5:setTop(125);
    obj.comboBox5:setWidth(500);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("priority_e");
    obj.comboBox5:setItems({'METATYPE: Human (1)', 'ATTRIBUTES: 12 ', 'MAGIC: — ', 'SKILLS: 18/0 ', 'RESOURCES: 6,000¥'});
    obj.comboBox5:setName("comboBox5");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(215);
    obj.layout3:setTop(160);
    obj.layout3:setWidth(310);
    obj.layout3:setHeight(130);
    obj.layout3:setName("layout3");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout3);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout3);
    obj.label27:setLeft(5);
    obj.label27:setTop(0);
    obj.label27:setWidth(310);
    obj.label27:setHeight(20);
    obj.label27:setText("BASE/POINTS SPENT");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout3);
    obj.label28:setLeft(155);
    obj.label28:setTop(25);
    obj.label28:setWidth(50);
    obj.label28:setHeight(20);
    obj.label28:setText("BASE");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout3);
    obj.label29:setLeft(205);
    obj.label29:setTop(25);
    obj.label29:setWidth(50);
    obj.label29:setHeight(20);
    obj.label29:setText("POINTS");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout3);
    obj.label30:setLeft(255);
    obj.label30:setTop(25);
    obj.label30:setWidth(50);
    obj.label30:setHeight(20);
    obj.label30:setText("GROUP");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout3);
    obj.label31:setText("ATTRIBUTES");
    obj.label31:setLeft(5);
    obj.label31:setTop(50);
    obj.label31:setWidth(150);
    obj.label31:setHeight(20);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout3);
    obj.rectangle12:setLeft(155);
    obj.rectangle12:setTop(50);
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout3);
    obj.label32:setLeft(155);
    obj.label32:setTop(50);
    obj.label32:setWidth(50);
    obj.label32:setHeight(25);
    obj.label32:setField("attribute_base_spent");
    obj.label32:setVertTextAlign("center");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout3);
    obj.rectangle13:setLeft(205);
    obj.rectangle13:setTop(50);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout3);
    obj.label33:setLeft(205);
    obj.label33:setTop(50);
    obj.label33:setWidth(50);
    obj.label33:setHeight(25);
    obj.label33:setField("attribute_initial_spent");
    obj.label33:setVertTextAlign("center");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout3);
    obj.label34:setText("ACTIVE SKILLS");
    obj.label34:setLeft(5);
    obj.label34:setTop(75);
    obj.label34:setWidth(150);
    obj.label34:setHeight(20);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout3);
    obj.rectangle14:setLeft(155);
    obj.rectangle14:setTop(75);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout3);
    obj.label35:setLeft(155);
    obj.label35:setTop(75);
    obj.label35:setWidth(50);
    obj.label35:setHeight(25);
    obj.label35:setField("skills_active_base_spent");
    obj.label35:setVertTextAlign("center");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout3);
    obj.rectangle15:setLeft(205);
    obj.rectangle15:setTop(75);
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout3);
    obj.label36:setLeft(205);
    obj.label36:setTop(75);
    obj.label36:setWidth(50);
    obj.label36:setHeight(25);
    obj.label36:setField("skills_active_points_spent");
    obj.label36:setVertTextAlign("center");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout3);
    obj.rectangle16:setLeft(255);
    obj.rectangle16:setTop(75);
    obj.rectangle16:setWidth(50);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout3);
    obj.label37:setLeft(255);
    obj.label37:setTop(75);
    obj.label37:setWidth(50);
    obj.label37:setHeight(25);
    obj.label37:setField("skills_active_group_spent");
    obj.label37:setVertTextAlign("center");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout3);
    obj.label38:setText("KNOWLEDGE/LANGUAGE");
    obj.label38:setLeft(5);
    obj.label38:setTop(100);
    obj.label38:setWidth(150);
    obj.label38:setHeight(20);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout3);
    obj.rectangle17:setLeft(155);
    obj.rectangle17:setTop(100);
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout3);
    obj.label39:setLeft(155);
    obj.label39:setTop(100);
    obj.label39:setWidth(50);
    obj.label39:setHeight(25);
    obj.label39:setField("skill_knowledge_base_spent");
    obj.label39:setVertTextAlign("center");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout3);
    obj.rectangle18:setLeft(205);
    obj.rectangle18:setTop(100);
    obj.rectangle18:setWidth(50);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout3);
    obj.label40:setLeft(205);
    obj.label40:setTop(100);
    obj.label40:setWidth(50);
    obj.label40:setHeight(25);
    obj.label40:setField("skill_knowledge_points_spent");
    obj.label40:setVertTextAlign("center");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local karma = 	(tonumber(sheet.attribute_karma_spent) or 0) + 
            									(tonumber(sheet.skills_active_karma_spent) or 0) + 
            									(tonumber(sheet.skills_knowledge_karma_spent) or 0) + 
            									(tonumber(sheet.skills_language_karma_spent) or 0) + 
            									(tonumber(sheet.qualities_karma) or 0) + 
            									(tonumber(sheet.contact_karma) or 0) + 
            									(tonumber(sheet.spells_karma) or 0) + 
            									(tonumber(sheet.abilities_karma) or 0) + 
            									(tonumber(sheet.other_karma) or 0) + 
            									(tonumber(sheet.misc_karma) or 0) + 
            									(tonumber(sheet.alternative_karma) or 0) + 
            									(tonumber(sheet.details_karma) or 0);
            
            					local left = (tonumber(sheet.karmaTotal) or 0) - karma;
            
            					sheet.karma = left;
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
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmStats = {
    newEditor = newfrmStats, 
    new = newfrmStats, 
    name = "frmStats", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmStats = _frmStats;
rrpg.registrarForm(_frmStats);

return _frmStats;
