require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister2_svg()
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
    obj:setName("frmFichaRPGmeister2_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(1080);
    obj.layout1:setHeight(1533);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0000007F");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(2);
    obj.layout2:setTop(2);
    obj.layout2:setWidth(1207);
    obj.layout2:setHeight(92);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setLeft(000);
    obj.button1:setTop(5);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("I");
    obj.button1:setHint("Importar um Golpe");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(000);
    obj.button2:setTop(30);
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setText("E");
    obj.button2:setHint("Exportar o Golpe");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(000);
    obj.button3:setTop(55);
    obj.button3:setWidth(20);
    obj.button3:setHeight(20);
    obj.button3:setText("A");
    obj.button3:setHint("Apagar o Golpe");
    obj.button3:setName("button3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(25);
    obj.label1:setTop(5);
    obj.label1:setWidth(70);
    obj.label1:setHeight(25);
    obj.label1:setText("Golpe");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(90);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(135);
    obj.edit1:setHeight(25);
    obj.edit1:setField("golpe1");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(25);
    obj.label2:setTop(30);
    obj.label2:setWidth(80);
    obj.label2:setHeight(25);
    obj.label2:setText("Frequência");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(90);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(135);
    obj.edit2:setHeight(25);
    obj.edit2:setField("frequencia1");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(25);
    obj.label3:setTop(55);
    obj.label3:setWidth(70);
    obj.label3:setHeight(25);
    obj.label3:setText("Alcance");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(90);
    obj.edit3:setTop(55);
    obj.edit3:setWidth(135);
    obj.edit3:setHeight(25);
    obj.edit3:setField("alcance1");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(235);
    obj.label4:setTop(6);
    obj.label4:setWidth(50);
    obj.label4:setHeight(25);
    obj.label4:setText("Tipo");
    obj.label4:setName("label4");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setLeft(277);
    obj.comboBox1:setTop(6);
    obj.comboBox1:setWidth(87);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("tipo1");
    obj.comboBox1:setHorzTextAlign("leading");
    obj.comboBox1:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox1:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox1:setName("comboBox1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(235);
    obj.label5:setTop(31);
    obj.label5:setWidth(50);
    obj.label5:setHeight(25);
    obj.label5:setText("Classe");
    obj.label5:setName("label5");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout2);
    obj.comboBox2:setLeft(277);
    obj.comboBox2:setTop(31);
    obj.comboBox2:setWidth(87);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("classe1");
    obj.comboBox2:setHorzTextAlign("leading");
    obj.comboBox2:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox2:setValues({'1', '2', '3'});
    obj.comboBox2:setName("comboBox2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(235);
    obj.label6:setTop(55);
    obj.label6:setWidth(50);
    obj.label6:setHeight(25);
    obj.label6:setText("AC");
    obj.label6:setName("label6");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(277);
    obj.edit4:setTop(55);
    obj.edit4:setWidth(87);
    obj.edit4:setHeight(25);
    obj.edit4:setField("AC1");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(370);
    obj.label7:setTop(6);
    obj.label7:setWidth(70);
    obj.label7:setHeight(25);
    obj.label7:setText("Prec.Bôn.");
    obj.label7:setName("label7");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(443);
    obj.edit5:setTop(6);
    obj.edit5:setWidth(42);
    obj.edit5:setHeight(25);
    obj.edit5:setField("ataque1");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(370);
    obj.label8:setTop(31);
    obj.label8:setWidth(70);
    obj.label8:setHeight(25);
    obj.label8:setText("Dano Base");
    obj.label8:setName("label8");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(443);
    obj.edit6:setTop(31);
    obj.edit6:setWidth(42);
    obj.edit6:setHeight(25);
    obj.edit6:setField("dano1");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(370);
    obj.label9:setTop(55);
    obj.label9:setWidth(70);
    obj.label9:setHeight(25);
    obj.label9:setText("Dano Bôn.");
    obj.label9:setName("label9");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(443);
    obj.edit7:setTop(55);
    obj.edit7:setWidth(42);
    obj.edit7:setHeight(25);
    obj.edit7:setField("BonDMG1");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout2);
    obj.button4:setLeft(488);
    obj.button4:setTop(6);
    obj.button4:setWidth(82);
    obj.button4:setText("Acerto");
    obj.button4:setFontSize(11);
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout2);
    obj.button5:setLeft(488);
    obj.button5:setTop(31);
    obj.button5:setWidth(82);
    obj.button5:setText("Dano");
    obj.button5:setFontSize(11);
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout2);
    obj.button6:setLeft(488);
    obj.button6:setTop(55);
    obj.button6:setWidth(82);
    obj.button6:setText("Crítico");
    obj.button6:setFontSize(11);
    obj.button6:setName("button6");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout2);
    obj.textEditor1:setLeft(575);
    obj.textEditor1:setTop(5);
    obj.textEditor1:setWidth(295);
    obj.textEditor1:setHeight(75);
    obj.textEditor1:setField("campoEfeitoGolpes1");
    obj.textEditor1:setName("textEditor1");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setLeft(875);
    obj.label10:setTop(5);
    obj.label10:setWidth(80);
    obj.label10:setHeight(25);
    obj.label10:setText("Tipo(Co.)");
    obj.label10:setName("label10");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(940);
    obj.edit8:setTop(5);
    obj.edit8:setWidth(120);
    obj.edit8:setHeight(25);
    obj.edit8:setField("tipoContest1");
    obj.edit8:setName("edit8");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setLeft(875);
    obj.label11:setTop(30);
    obj.label11:setWidth(80);
    obj.label11:setHeight(25);
    obj.label11:setText("Efeito(Co.)");
    obj.label11:setName("label11");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout2);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(940);
    obj.edit9:setTop(30);
    obj.edit9:setWidth(120);
    obj.edit9:setHeight(25);
    obj.edit9:setField("efeitoContest1");
    obj.edit9:setName("edit9");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setLeft(875);
    obj.label12:setTop(55);
    obj.label12:setWidth(80);
    obj.label12:setHeight(25);
    obj.label12:setText("Especial");
    obj.label12:setName("label12");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(940);
    obj.edit10:setTop(55);
    obj.edit10:setWidth(120);
    obj.edit10:setHeight(25);
    obj.edit10:setField("efeitoSpecial1");
    obj.edit10:setName("edit10");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(2);
    obj.layout3:setTop(97);
    obj.layout3:setWidth(1207);
    obj.layout3:setHeight(92);
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout3);
    obj.button7:setLeft(000);
    obj.button7:setTop(5);
    obj.button7:setWidth(20);
    obj.button7:setHeight(20);
    obj.button7:setText("I");
    obj.button7:setHint("Importar um Golpe");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout3);
    obj.button8:setLeft(000);
    obj.button8:setTop(30);
    obj.button8:setWidth(20);
    obj.button8:setHeight(20);
    obj.button8:setText("E");
    obj.button8:setHint("Exportar o Golpe");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout3);
    obj.button9:setLeft(000);
    obj.button9:setTop(55);
    obj.button9:setWidth(20);
    obj.button9:setHeight(20);
    obj.button9:setText("A");
    obj.button9:setHint("Apagar o Golpe");
    obj.button9:setName("button9");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout3);
    obj.label13:setLeft(25);
    obj.label13:setTop(5);
    obj.label13:setWidth(70);
    obj.label13:setHeight(25);
    obj.label13:setText("Golpe");
    obj.label13:setName("label13");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout3);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(90);
    obj.edit11:setTop(5);
    obj.edit11:setWidth(135);
    obj.edit11:setHeight(25);
    obj.edit11:setField("golpe2");
    obj.edit11:setName("edit11");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout3);
    obj.label14:setLeft(25);
    obj.label14:setTop(30);
    obj.label14:setWidth(80);
    obj.label14:setHeight(25);
    obj.label14:setText("Frequência");
    obj.label14:setName("label14");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout3);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(90);
    obj.edit12:setTop(30);
    obj.edit12:setWidth(135);
    obj.edit12:setHeight(25);
    obj.edit12:setField("frequencia2");
    obj.edit12:setName("edit12");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout3);
    obj.label15:setLeft(25);
    obj.label15:setTop(55);
    obj.label15:setWidth(70);
    obj.label15:setHeight(25);
    obj.label15:setText("Alcance");
    obj.label15:setName("label15");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout3);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(90);
    obj.edit13:setTop(55);
    obj.edit13:setWidth(135);
    obj.edit13:setHeight(25);
    obj.edit13:setField("alcance2");
    obj.edit13:setName("edit13");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout3);
    obj.label16:setLeft(235);
    obj.label16:setTop(6);
    obj.label16:setWidth(50);
    obj.label16:setHeight(25);
    obj.label16:setText("Tipo");
    obj.label16:setName("label16");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout3);
    obj.comboBox3:setLeft(277);
    obj.comboBox3:setTop(6);
    obj.comboBox3:setWidth(87);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("tipo2");
    obj.comboBox3:setHorzTextAlign("leading");
    obj.comboBox3:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox3:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox3:setName("comboBox3");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout3);
    obj.label17:setLeft(235);
    obj.label17:setTop(31);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setText("Classe");
    obj.label17:setName("label17");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout3);
    obj.comboBox4:setLeft(277);
    obj.comboBox4:setTop(31);
    obj.comboBox4:setWidth(87);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("classe2");
    obj.comboBox4:setHorzTextAlign("leading");
    obj.comboBox4:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox4:setValues({'1', '2', '3'});
    obj.comboBox4:setName("comboBox4");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout3);
    obj.label18:setLeft(235);
    obj.label18:setTop(55);
    obj.label18:setWidth(50);
    obj.label18:setHeight(25);
    obj.label18:setText("AC");
    obj.label18:setName("label18");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout3);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(277);
    obj.edit14:setTop(55);
    obj.edit14:setWidth(87);
    obj.edit14:setHeight(25);
    obj.edit14:setField("AC2");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setLeft(370);
    obj.label19:setTop(6);
    obj.label19:setWidth(70);
    obj.label19:setHeight(25);
    obj.label19:setText("Prec.Bôn.");
    obj.label19:setName("label19");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout3);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(443);
    obj.edit15:setTop(6);
    obj.edit15:setWidth(42);
    obj.edit15:setHeight(25);
    obj.edit15:setField("ataque2");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setLeft(370);
    obj.label20:setTop(31);
    obj.label20:setWidth(70);
    obj.label20:setHeight(25);
    obj.label20:setText("Dano Base");
    obj.label20:setName("label20");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout3);
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(443);
    obj.edit16:setTop(31);
    obj.edit16:setWidth(42);
    obj.edit16:setHeight(25);
    obj.edit16:setField("dano2");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout3);
    obj.label21:setLeft(370);
    obj.label21:setTop(55);
    obj.label21:setWidth(70);
    obj.label21:setHeight(25);
    obj.label21:setText("Dano Bôn.");
    obj.label21:setName("label21");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout3);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(443);
    obj.edit17:setTop(55);
    obj.edit17:setWidth(42);
    obj.edit17:setHeight(25);
    obj.edit17:setField("BonDMG2");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout3);
    obj.button10:setLeft(488);
    obj.button10:setTop(6);
    obj.button10:setWidth(82);
    obj.button10:setText("Acerto");
    obj.button10:setFontSize(11);
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout3);
    obj.button11:setLeft(488);
    obj.button11:setTop(31);
    obj.button11:setWidth(82);
    obj.button11:setText("Dano");
    obj.button11:setFontSize(11);
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout3);
    obj.button12:setLeft(488);
    obj.button12:setTop(55);
    obj.button12:setWidth(82);
    obj.button12:setText("Crítico");
    obj.button12:setFontSize(11);
    obj.button12:setName("button12");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout3);
    obj.textEditor2:setLeft(575);
    obj.textEditor2:setTop(5);
    obj.textEditor2:setWidth(295);
    obj.textEditor2:setHeight(75);
    obj.textEditor2:setField("campoEfeitoGolpes2");
    obj.textEditor2:setName("textEditor2");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout3);
    obj.label22:setLeft(875);
    obj.label22:setTop(5);
    obj.label22:setWidth(80);
    obj.label22:setHeight(25);
    obj.label22:setText("Tipo(Co.)");
    obj.label22:setName("label22");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout3);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(940);
    obj.edit18:setTop(5);
    obj.edit18:setWidth(120);
    obj.edit18:setHeight(25);
    obj.edit18:setField("tipoContest2");
    obj.edit18:setName("edit18");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout3);
    obj.label23:setLeft(875);
    obj.label23:setTop(30);
    obj.label23:setWidth(80);
    obj.label23:setHeight(25);
    obj.label23:setText("Efeito(Co.)");
    obj.label23:setName("label23");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout3);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(940);
    obj.edit19:setTop(30);
    obj.edit19:setWidth(120);
    obj.edit19:setHeight(25);
    obj.edit19:setField("efeitoContest2");
    obj.edit19:setName("edit19");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout3);
    obj.label24:setLeft(875);
    obj.label24:setTop(55);
    obj.label24:setWidth(80);
    obj.label24:setHeight(25);
    obj.label24:setText("Especial");
    obj.label24:setName("label24");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout3);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(940);
    obj.edit20:setTop(55);
    obj.edit20:setWidth(120);
    obj.edit20:setHeight(25);
    obj.edit20:setField("efeitoSpecial2");
    obj.edit20:setName("edit20");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(2);
    obj.layout4:setTop(192);
    obj.layout4:setWidth(1207);
    obj.layout4:setHeight(92);
    obj.layout4:setName("layout4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout4);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout4);
    obj.button13:setLeft(000);
    obj.button13:setTop(5);
    obj.button13:setWidth(20);
    obj.button13:setHeight(20);
    obj.button13:setText("I");
    obj.button13:setHint("Importar um Golpe");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout4);
    obj.button14:setLeft(000);
    obj.button14:setTop(30);
    obj.button14:setWidth(20);
    obj.button14:setHeight(20);
    obj.button14:setText("E");
    obj.button14:setHint("Exportar o Golpe");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout4);
    obj.button15:setLeft(000);
    obj.button15:setTop(55);
    obj.button15:setWidth(20);
    obj.button15:setHeight(20);
    obj.button15:setText("A");
    obj.button15:setHint("Apagar o Golpe");
    obj.button15:setName("button15");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout4);
    obj.label25:setLeft(25);
    obj.label25:setTop(5);
    obj.label25:setWidth(70);
    obj.label25:setHeight(25);
    obj.label25:setText("Golpe");
    obj.label25:setName("label25");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout4);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(90);
    obj.edit21:setTop(5);
    obj.edit21:setWidth(135);
    obj.edit21:setHeight(25);
    obj.edit21:setField("golpe3");
    obj.edit21:setName("edit21");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout4);
    obj.label26:setLeft(25);
    obj.label26:setTop(30);
    obj.label26:setWidth(80);
    obj.label26:setHeight(25);
    obj.label26:setText("Frequência");
    obj.label26:setName("label26");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout4);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(90);
    obj.edit22:setTop(30);
    obj.edit22:setWidth(135);
    obj.edit22:setHeight(25);
    obj.edit22:setField("frequencia3");
    obj.edit22:setName("edit22");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout4);
    obj.label27:setLeft(25);
    obj.label27:setTop(55);
    obj.label27:setWidth(70);
    obj.label27:setHeight(25);
    obj.label27:setText("Alcance");
    obj.label27:setName("label27");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout4);
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(90);
    obj.edit23:setTop(55);
    obj.edit23:setWidth(135);
    obj.edit23:setHeight(25);
    obj.edit23:setField("alcance3");
    obj.edit23:setName("edit23");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout4);
    obj.label28:setLeft(235);
    obj.label28:setTop(6);
    obj.label28:setWidth(50);
    obj.label28:setHeight(25);
    obj.label28:setText("Tipo");
    obj.label28:setName("label28");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout4);
    obj.comboBox5:setLeft(277);
    obj.comboBox5:setTop(6);
    obj.comboBox5:setWidth(87);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("tipo3");
    obj.comboBox5:setHorzTextAlign("leading");
    obj.comboBox5:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox5:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox5:setName("comboBox5");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout4);
    obj.label29:setLeft(235);
    obj.label29:setTop(31);
    obj.label29:setWidth(50);
    obj.label29:setHeight(25);
    obj.label29:setText("Classe");
    obj.label29:setName("label29");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout4);
    obj.comboBox6:setLeft(277);
    obj.comboBox6:setTop(31);
    obj.comboBox6:setWidth(87);
    obj.comboBox6:setHeight(25);
    obj.comboBox6:setField("classe3");
    obj.comboBox6:setHorzTextAlign("leading");
    obj.comboBox6:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox6:setValues({'1', '2', '3'});
    obj.comboBox6:setName("comboBox6");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout4);
    obj.label30:setLeft(235);
    obj.label30:setTop(55);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setText("AC");
    obj.label30:setName("label30");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout4);
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(277);
    obj.edit24:setTop(55);
    obj.edit24:setWidth(87);
    obj.edit24:setHeight(25);
    obj.edit24:setField("AC3");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout4);
    obj.label31:setLeft(370);
    obj.label31:setTop(6);
    obj.label31:setWidth(70);
    obj.label31:setHeight(25);
    obj.label31:setText("Prec.Bôn.");
    obj.label31:setName("label31");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout4);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(443);
    obj.edit25:setTop(6);
    obj.edit25:setWidth(42);
    obj.edit25:setHeight(25);
    obj.edit25:setField("ataque3");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout4);
    obj.label32:setLeft(370);
    obj.label32:setTop(31);
    obj.label32:setWidth(70);
    obj.label32:setHeight(25);
    obj.label32:setText("Dano Base");
    obj.label32:setName("label32");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout4);
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(443);
    obj.edit26:setTop(31);
    obj.edit26:setWidth(42);
    obj.edit26:setHeight(25);
    obj.edit26:setField("dano3");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout4);
    obj.label33:setLeft(370);
    obj.label33:setTop(55);
    obj.label33:setWidth(70);
    obj.label33:setHeight(25);
    obj.label33:setText("Dano Bôn.");
    obj.label33:setName("label33");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout4);
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(443);
    obj.edit27:setTop(55);
    obj.edit27:setWidth(42);
    obj.edit27:setHeight(25);
    obj.edit27:setField("BonDMG3");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout4);
    obj.button16:setLeft(488);
    obj.button16:setTop(6);
    obj.button16:setWidth(82);
    obj.button16:setText("Acerto");
    obj.button16:setFontSize(11);
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout4);
    obj.button17:setLeft(488);
    obj.button17:setTop(31);
    obj.button17:setWidth(82);
    obj.button17:setText("Dano");
    obj.button17:setFontSize(11);
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout4);
    obj.button18:setLeft(488);
    obj.button18:setTop(55);
    obj.button18:setWidth(82);
    obj.button18:setText("Crítico");
    obj.button18:setFontSize(11);
    obj.button18:setName("button18");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout4);
    obj.textEditor3:setLeft(575);
    obj.textEditor3:setTop(5);
    obj.textEditor3:setWidth(295);
    obj.textEditor3:setHeight(75);
    obj.textEditor3:setField("campoEfeitoGolpes3");
    obj.textEditor3:setName("textEditor3");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout4);
    obj.label34:setLeft(875);
    obj.label34:setTop(5);
    obj.label34:setWidth(80);
    obj.label34:setHeight(25);
    obj.label34:setText("Tipo(Co.)");
    obj.label34:setName("label34");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout4);
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(940);
    obj.edit28:setTop(5);
    obj.edit28:setWidth(120);
    obj.edit28:setHeight(25);
    obj.edit28:setField("tipoContest3");
    obj.edit28:setName("edit28");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout4);
    obj.label35:setLeft(875);
    obj.label35:setTop(30);
    obj.label35:setWidth(80);
    obj.label35:setHeight(25);
    obj.label35:setText("Efeito(Co.)");
    obj.label35:setName("label35");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout4);
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(940);
    obj.edit29:setTop(30);
    obj.edit29:setWidth(120);
    obj.edit29:setHeight(25);
    obj.edit29:setField("efeitoContest3");
    obj.edit29:setName("edit29");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout4);
    obj.label36:setLeft(875);
    obj.label36:setTop(55);
    obj.label36:setWidth(80);
    obj.label36:setHeight(25);
    obj.label36:setText("Especial");
    obj.label36:setName("label36");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout4);
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(940);
    obj.edit30:setTop(55);
    obj.edit30:setWidth(120);
    obj.edit30:setHeight(25);
    obj.edit30:setField("efeitoSpecial3");
    obj.edit30:setName("edit30");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(2);
    obj.layout5:setTop(288);
    obj.layout5:setWidth(1207);
    obj.layout5:setHeight(92);
    obj.layout5:setName("layout5");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout5);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout5);
    obj.button19:setLeft(000);
    obj.button19:setTop(5);
    obj.button19:setWidth(20);
    obj.button19:setHeight(20);
    obj.button19:setText("I");
    obj.button19:setHint("Importar um Golpe");
    obj.button19:setName("button19");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout5);
    obj.button20:setLeft(000);
    obj.button20:setTop(30);
    obj.button20:setWidth(20);
    obj.button20:setHeight(20);
    obj.button20:setText("E");
    obj.button20:setHint("Exportar o Golpe");
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout5);
    obj.button21:setLeft(000);
    obj.button21:setTop(55);
    obj.button21:setWidth(20);
    obj.button21:setHeight(20);
    obj.button21:setText("A");
    obj.button21:setHint("Apagar o Golpe");
    obj.button21:setName("button21");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout5);
    obj.label37:setLeft(25);
    obj.label37:setTop(5);
    obj.label37:setWidth(70);
    obj.label37:setHeight(25);
    obj.label37:setText("Golpe");
    obj.label37:setName("label37");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout5);
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(90);
    obj.edit31:setTop(5);
    obj.edit31:setWidth(135);
    obj.edit31:setHeight(25);
    obj.edit31:setField("golpe4");
    obj.edit31:setName("edit31");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout5);
    obj.label38:setLeft(25);
    obj.label38:setTop(30);
    obj.label38:setWidth(80);
    obj.label38:setHeight(25);
    obj.label38:setText("Frequência");
    obj.label38:setName("label38");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout5);
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(90);
    obj.edit32:setTop(30);
    obj.edit32:setWidth(135);
    obj.edit32:setHeight(25);
    obj.edit32:setField("frequencia4");
    obj.edit32:setName("edit32");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout5);
    obj.label39:setLeft(25);
    obj.label39:setTop(55);
    obj.label39:setWidth(70);
    obj.label39:setHeight(25);
    obj.label39:setText("Alcance");
    obj.label39:setName("label39");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout5);
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(90);
    obj.edit33:setTop(55);
    obj.edit33:setWidth(135);
    obj.edit33:setHeight(25);
    obj.edit33:setField("alcance4");
    obj.edit33:setName("edit33");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout5);
    obj.label40:setLeft(235);
    obj.label40:setTop(6);
    obj.label40:setWidth(50);
    obj.label40:setHeight(25);
    obj.label40:setText("Tipo");
    obj.label40:setName("label40");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout5);
    obj.comboBox7:setLeft(277);
    obj.comboBox7:setTop(6);
    obj.comboBox7:setWidth(87);
    obj.comboBox7:setHeight(25);
    obj.comboBox7:setField("tipo4");
    obj.comboBox7:setHorzTextAlign("leading");
    obj.comboBox7:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox7:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox7:setName("comboBox7");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout5);
    obj.label41:setLeft(235);
    obj.label41:setTop(31);
    obj.label41:setWidth(50);
    obj.label41:setHeight(25);
    obj.label41:setText("Classe");
    obj.label41:setName("label41");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout5);
    obj.comboBox8:setLeft(277);
    obj.comboBox8:setTop(31);
    obj.comboBox8:setWidth(87);
    obj.comboBox8:setHeight(25);
    obj.comboBox8:setField("classe4");
    obj.comboBox8:setHorzTextAlign("leading");
    obj.comboBox8:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox8:setValues({'1', '2', '3'});
    obj.comboBox8:setName("comboBox8");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout5);
    obj.label42:setLeft(235);
    obj.label42:setTop(55);
    obj.label42:setWidth(50);
    obj.label42:setHeight(25);
    obj.label42:setText("AC");
    obj.label42:setName("label42");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout5);
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(277);
    obj.edit34:setTop(55);
    obj.edit34:setWidth(87);
    obj.edit34:setHeight(25);
    obj.edit34:setField("AC4");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout5);
    obj.label43:setLeft(370);
    obj.label43:setTop(6);
    obj.label43:setWidth(70);
    obj.label43:setHeight(25);
    obj.label43:setText("Prec.Bôn.");
    obj.label43:setName("label43");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout5);
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(443);
    obj.edit35:setTop(6);
    obj.edit35:setWidth(42);
    obj.edit35:setHeight(25);
    obj.edit35:setField("ataque4");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout5);
    obj.label44:setLeft(370);
    obj.label44:setTop(31);
    obj.label44:setWidth(70);
    obj.label44:setHeight(25);
    obj.label44:setText("Dano Base");
    obj.label44:setName("label44");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout5);
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(443);
    obj.edit36:setTop(31);
    obj.edit36:setWidth(42);
    obj.edit36:setHeight(25);
    obj.edit36:setField("dano4");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout5);
    obj.label45:setLeft(370);
    obj.label45:setTop(55);
    obj.label45:setWidth(70);
    obj.label45:setHeight(25);
    obj.label45:setText("Dano Bôn.");
    obj.label45:setName("label45");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout5);
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(443);
    obj.edit37:setTop(55);
    obj.edit37:setWidth(42);
    obj.edit37:setHeight(25);
    obj.edit37:setField("BonDMG4");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout5);
    obj.button22:setLeft(488);
    obj.button22:setTop(6);
    obj.button22:setWidth(82);
    obj.button22:setText("Acerto");
    obj.button22:setFontSize(11);
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout5);
    obj.button23:setLeft(488);
    obj.button23:setTop(31);
    obj.button23:setWidth(82);
    obj.button23:setText("Dano");
    obj.button23:setFontSize(11);
    obj.button23:setName("button23");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout5);
    obj.button24:setLeft(488);
    obj.button24:setTop(55);
    obj.button24:setWidth(82);
    obj.button24:setText("Crítico");
    obj.button24:setFontSize(11);
    obj.button24:setName("button24");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout5);
    obj.textEditor4:setLeft(575);
    obj.textEditor4:setTop(5);
    obj.textEditor4:setWidth(295);
    obj.textEditor4:setHeight(75);
    obj.textEditor4:setField("campoEfeitoGolpes4");
    obj.textEditor4:setName("textEditor4");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout5);
    obj.label46:setLeft(875);
    obj.label46:setTop(5);
    obj.label46:setWidth(80);
    obj.label46:setHeight(25);
    obj.label46:setText("Tipo(Co.)");
    obj.label46:setName("label46");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout5);
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(940);
    obj.edit38:setTop(5);
    obj.edit38:setWidth(120);
    obj.edit38:setHeight(25);
    obj.edit38:setField("tipoContest4");
    obj.edit38:setName("edit38");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout5);
    obj.label47:setLeft(875);
    obj.label47:setTop(30);
    obj.label47:setWidth(80);
    obj.label47:setHeight(25);
    obj.label47:setText("Efeito(Co.)");
    obj.label47:setName("label47");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout5);
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(940);
    obj.edit39:setTop(30);
    obj.edit39:setWidth(120);
    obj.edit39:setHeight(25);
    obj.edit39:setField("efeitoContest4");
    obj.edit39:setName("edit39");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout5);
    obj.label48:setLeft(875);
    obj.label48:setTop(55);
    obj.label48:setWidth(80);
    obj.label48:setHeight(25);
    obj.label48:setText("Especial");
    obj.label48:setName("label48");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout5);
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(940);
    obj.edit40:setTop(55);
    obj.edit40:setWidth(120);
    obj.edit40:setHeight(25);
    obj.edit40:setField("efeitoSpecial4");
    obj.edit40:setName("edit40");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(2);
    obj.layout6:setTop(383);
    obj.layout6:setWidth(1207);
    obj.layout6:setHeight(92);
    obj.layout6:setName("layout6");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout6);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout6);
    obj.button25:setLeft(000);
    obj.button25:setTop(5);
    obj.button25:setWidth(20);
    obj.button25:setHeight(20);
    obj.button25:setText("I");
    obj.button25:setHint("Importar um Golpe");
    obj.button25:setName("button25");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout6);
    obj.button26:setLeft(000);
    obj.button26:setTop(30);
    obj.button26:setWidth(20);
    obj.button26:setHeight(20);
    obj.button26:setText("E");
    obj.button26:setHint("Exportar o Golpe");
    obj.button26:setName("button26");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout6);
    obj.button27:setLeft(000);
    obj.button27:setTop(55);
    obj.button27:setWidth(20);
    obj.button27:setHeight(20);
    obj.button27:setText("A");
    obj.button27:setHint("Apagar o Golpe");
    obj.button27:setName("button27");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout6);
    obj.label49:setLeft(25);
    obj.label49:setTop(5);
    obj.label49:setWidth(70);
    obj.label49:setHeight(25);
    obj.label49:setText("Golpe");
    obj.label49:setName("label49");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout6);
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(90);
    obj.edit41:setTop(5);
    obj.edit41:setWidth(135);
    obj.edit41:setHeight(25);
    obj.edit41:setField("golpe5");
    obj.edit41:setName("edit41");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout6);
    obj.label50:setLeft(25);
    obj.label50:setTop(30);
    obj.label50:setWidth(80);
    obj.label50:setHeight(25);
    obj.label50:setText("Frequência");
    obj.label50:setName("label50");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout6);
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(90);
    obj.edit42:setTop(30);
    obj.edit42:setWidth(135);
    obj.edit42:setHeight(25);
    obj.edit42:setField("frequencia5");
    obj.edit42:setName("edit42");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout6);
    obj.label51:setLeft(25);
    obj.label51:setTop(55);
    obj.label51:setWidth(70);
    obj.label51:setHeight(25);
    obj.label51:setText("Alcance");
    obj.label51:setName("label51");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout6);
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(90);
    obj.edit43:setTop(55);
    obj.edit43:setWidth(135);
    obj.edit43:setHeight(25);
    obj.edit43:setField("alcance5");
    obj.edit43:setName("edit43");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout6);
    obj.label52:setLeft(235);
    obj.label52:setTop(6);
    obj.label52:setWidth(50);
    obj.label52:setHeight(25);
    obj.label52:setText("Tipo");
    obj.label52:setName("label52");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout6);
    obj.comboBox9:setLeft(277);
    obj.comboBox9:setTop(6);
    obj.comboBox9:setWidth(87);
    obj.comboBox9:setHeight(25);
    obj.comboBox9:setField("tipo5");
    obj.comboBox9:setHorzTextAlign("leading");
    obj.comboBox9:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox9:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox9:setName("comboBox9");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout6);
    obj.label53:setLeft(235);
    obj.label53:setTop(31);
    obj.label53:setWidth(50);
    obj.label53:setHeight(25);
    obj.label53:setText("Classe");
    obj.label53:setName("label53");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout6);
    obj.comboBox10:setLeft(277);
    obj.comboBox10:setTop(31);
    obj.comboBox10:setWidth(87);
    obj.comboBox10:setHeight(25);
    obj.comboBox10:setField("classe5");
    obj.comboBox10:setHorzTextAlign("leading");
    obj.comboBox10:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox10:setValues({'1', '2', '3'});
    obj.comboBox10:setName("comboBox10");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout6);
    obj.label54:setLeft(235);
    obj.label54:setTop(55);
    obj.label54:setWidth(50);
    obj.label54:setHeight(25);
    obj.label54:setText("AC");
    obj.label54:setName("label54");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout6);
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(277);
    obj.edit44:setTop(55);
    obj.edit44:setWidth(87);
    obj.edit44:setHeight(25);
    obj.edit44:setField("AC5");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout6);
    obj.label55:setLeft(370);
    obj.label55:setTop(6);
    obj.label55:setWidth(70);
    obj.label55:setHeight(25);
    obj.label55:setText("Prec.Bôn.");
    obj.label55:setName("label55");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout6);
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(443);
    obj.edit45:setTop(6);
    obj.edit45:setWidth(42);
    obj.edit45:setHeight(25);
    obj.edit45:setField("ataque5");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout6);
    obj.label56:setLeft(370);
    obj.label56:setTop(31);
    obj.label56:setWidth(70);
    obj.label56:setHeight(25);
    obj.label56:setText("Dano Base");
    obj.label56:setName("label56");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout6);
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(443);
    obj.edit46:setTop(31);
    obj.edit46:setWidth(42);
    obj.edit46:setHeight(25);
    obj.edit46:setField("dano5");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout6);
    obj.label57:setLeft(370);
    obj.label57:setTop(55);
    obj.label57:setWidth(70);
    obj.label57:setHeight(25);
    obj.label57:setText("Dano Bôn.");
    obj.label57:setName("label57");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout6);
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(443);
    obj.edit47:setTop(55);
    obj.edit47:setWidth(42);
    obj.edit47:setHeight(25);
    obj.edit47:setField("BonDMG5");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout6);
    obj.button28:setLeft(488);
    obj.button28:setTop(6);
    obj.button28:setWidth(82);
    obj.button28:setText("Acerto");
    obj.button28:setFontSize(11);
    obj.button28:setName("button28");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout6);
    obj.button29:setLeft(488);
    obj.button29:setTop(31);
    obj.button29:setWidth(82);
    obj.button29:setText("Dano");
    obj.button29:setFontSize(11);
    obj.button29:setName("button29");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout6);
    obj.button30:setLeft(488);
    obj.button30:setTop(55);
    obj.button30:setWidth(82);
    obj.button30:setText("Crítico");
    obj.button30:setFontSize(11);
    obj.button30:setName("button30");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout6);
    obj.textEditor5:setLeft(575);
    obj.textEditor5:setTop(5);
    obj.textEditor5:setWidth(295);
    obj.textEditor5:setHeight(75);
    obj.textEditor5:setField("campoEfeitoGolpes5");
    obj.textEditor5:setName("textEditor5");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout6);
    obj.label58:setLeft(875);
    obj.label58:setTop(5);
    obj.label58:setWidth(80);
    obj.label58:setHeight(25);
    obj.label58:setText("Tipo(Co.)");
    obj.label58:setName("label58");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout6);
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(940);
    obj.edit48:setTop(5);
    obj.edit48:setWidth(120);
    obj.edit48:setHeight(25);
    obj.edit48:setField("tipoContest5");
    obj.edit48:setName("edit48");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout6);
    obj.label59:setLeft(875);
    obj.label59:setTop(30);
    obj.label59:setWidth(80);
    obj.label59:setHeight(25);
    obj.label59:setText("Efeito(Co.)");
    obj.label59:setName("label59");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout6);
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(940);
    obj.edit49:setTop(30);
    obj.edit49:setWidth(120);
    obj.edit49:setHeight(25);
    obj.edit49:setField("efeitoContest5");
    obj.edit49:setName("edit49");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout6);
    obj.label60:setLeft(875);
    obj.label60:setTop(55);
    obj.label60:setWidth(80);
    obj.label60:setHeight(25);
    obj.label60:setText("Especial");
    obj.label60:setName("label60");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout6);
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(940);
    obj.edit50:setTop(55);
    obj.edit50:setWidth(120);
    obj.edit50:setHeight(25);
    obj.edit50:setField("efeitoSpecial5");
    obj.edit50:setName("edit50");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(2);
    obj.layout7:setTop(478);
    obj.layout7:setWidth(1207);
    obj.layout7:setHeight(92);
    obj.layout7:setName("layout7");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout7);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout7);
    obj.button31:setLeft(000);
    obj.button31:setTop(5);
    obj.button31:setWidth(20);
    obj.button31:setHeight(20);
    obj.button31:setText("I");
    obj.button31:setHint("Importar um Golpe");
    obj.button31:setName("button31");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout7);
    obj.button32:setLeft(000);
    obj.button32:setTop(30);
    obj.button32:setWidth(20);
    obj.button32:setHeight(20);
    obj.button32:setText("E");
    obj.button32:setHint("Exportar o Golpe");
    obj.button32:setName("button32");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout7);
    obj.button33:setLeft(000);
    obj.button33:setTop(55);
    obj.button33:setWidth(20);
    obj.button33:setHeight(20);
    obj.button33:setText("A");
    obj.button33:setHint("Apagar o Golpe");
    obj.button33:setName("button33");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout7);
    obj.label61:setLeft(25);
    obj.label61:setTop(5);
    obj.label61:setWidth(70);
    obj.label61:setHeight(25);
    obj.label61:setText("Golpe");
    obj.label61:setName("label61");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout7);
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(90);
    obj.edit51:setTop(5);
    obj.edit51:setWidth(135);
    obj.edit51:setHeight(25);
    obj.edit51:setField("golpe6");
    obj.edit51:setName("edit51");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout7);
    obj.label62:setLeft(25);
    obj.label62:setTop(30);
    obj.label62:setWidth(80);
    obj.label62:setHeight(25);
    obj.label62:setText("Frequência");
    obj.label62:setName("label62");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout7);
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(90);
    obj.edit52:setTop(30);
    obj.edit52:setWidth(135);
    obj.edit52:setHeight(25);
    obj.edit52:setField("frequencia6");
    obj.edit52:setName("edit52");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout7);
    obj.label63:setLeft(25);
    obj.label63:setTop(55);
    obj.label63:setWidth(70);
    obj.label63:setHeight(25);
    obj.label63:setText("Alcance");
    obj.label63:setName("label63");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout7);
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(90);
    obj.edit53:setTop(55);
    obj.edit53:setWidth(135);
    obj.edit53:setHeight(25);
    obj.edit53:setField("alcance6");
    obj.edit53:setName("edit53");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout7);
    obj.label64:setLeft(235);
    obj.label64:setTop(6);
    obj.label64:setWidth(50);
    obj.label64:setHeight(25);
    obj.label64:setText("Tipo");
    obj.label64:setName("label64");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout7);
    obj.comboBox11:setLeft(277);
    obj.comboBox11:setTop(6);
    obj.comboBox11:setWidth(87);
    obj.comboBox11:setHeight(25);
    obj.comboBox11:setField("tipo6");
    obj.comboBox11:setHorzTextAlign("leading");
    obj.comboBox11:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox11:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox11:setName("comboBox11");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout7);
    obj.label65:setLeft(235);
    obj.label65:setTop(31);
    obj.label65:setWidth(50);
    obj.label65:setHeight(25);
    obj.label65:setText("Classe");
    obj.label65:setName("label65");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout7);
    obj.comboBox12:setLeft(277);
    obj.comboBox12:setTop(31);
    obj.comboBox12:setWidth(87);
    obj.comboBox12:setHeight(25);
    obj.comboBox12:setField("classe6");
    obj.comboBox12:setHorzTextAlign("leading");
    obj.comboBox12:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox12:setValues({'1', '2', '3'});
    obj.comboBox12:setName("comboBox12");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout7);
    obj.label66:setLeft(235);
    obj.label66:setTop(55);
    obj.label66:setWidth(50);
    obj.label66:setHeight(25);
    obj.label66:setText("AC");
    obj.label66:setName("label66");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout7);
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(277);
    obj.edit54:setTop(55);
    obj.edit54:setWidth(87);
    obj.edit54:setHeight(25);
    obj.edit54:setField("AC6");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout7);
    obj.label67:setLeft(370);
    obj.label67:setTop(6);
    obj.label67:setWidth(70);
    obj.label67:setHeight(25);
    obj.label67:setText("Prec.Bôn.");
    obj.label67:setName("label67");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout7);
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(443);
    obj.edit55:setTop(6);
    obj.edit55:setWidth(42);
    obj.edit55:setHeight(25);
    obj.edit55:setField("ataque6");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout7);
    obj.label68:setLeft(370);
    obj.label68:setTop(31);
    obj.label68:setWidth(70);
    obj.label68:setHeight(25);
    obj.label68:setText("Dano Base");
    obj.label68:setName("label68");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout7);
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(443);
    obj.edit56:setTop(31);
    obj.edit56:setWidth(42);
    obj.edit56:setHeight(25);
    obj.edit56:setField("dano6");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout7);
    obj.label69:setLeft(370);
    obj.label69:setTop(55);
    obj.label69:setWidth(70);
    obj.label69:setHeight(25);
    obj.label69:setText("Dano Bôn.");
    obj.label69:setName("label69");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout7);
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(443);
    obj.edit57:setTop(55);
    obj.edit57:setWidth(42);
    obj.edit57:setHeight(25);
    obj.edit57:setField("BonDMG6");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout7);
    obj.button34:setLeft(488);
    obj.button34:setTop(6);
    obj.button34:setWidth(82);
    obj.button34:setText("Acerto");
    obj.button34:setFontSize(11);
    obj.button34:setName("button34");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout7);
    obj.button35:setLeft(488);
    obj.button35:setTop(31);
    obj.button35:setWidth(82);
    obj.button35:setText("Dano");
    obj.button35:setFontSize(11);
    obj.button35:setName("button35");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout7);
    obj.button36:setLeft(488);
    obj.button36:setTop(55);
    obj.button36:setWidth(82);
    obj.button36:setText("Crítico");
    obj.button36:setFontSize(11);
    obj.button36:setName("button36");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout7);
    obj.textEditor6:setLeft(575);
    obj.textEditor6:setTop(5);
    obj.textEditor6:setWidth(295);
    obj.textEditor6:setHeight(75);
    obj.textEditor6:setField("campoEfeitoGolpes6");
    obj.textEditor6:setName("textEditor6");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout7);
    obj.label70:setLeft(875);
    obj.label70:setTop(5);
    obj.label70:setWidth(80);
    obj.label70:setHeight(25);
    obj.label70:setText("Tipo(Co.)");
    obj.label70:setName("label70");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout7);
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(940);
    obj.edit58:setTop(5);
    obj.edit58:setWidth(120);
    obj.edit58:setHeight(25);
    obj.edit58:setField("tipoContest6");
    obj.edit58:setName("edit58");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout7);
    obj.label71:setLeft(875);
    obj.label71:setTop(30);
    obj.label71:setWidth(80);
    obj.label71:setHeight(25);
    obj.label71:setText("Efeito(Co.)");
    obj.label71:setName("label71");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout7);
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(940);
    obj.edit59:setTop(30);
    obj.edit59:setWidth(120);
    obj.edit59:setHeight(25);
    obj.edit59:setField("efeitoContest6");
    obj.edit59:setName("edit59");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout7);
    obj.label72:setLeft(875);
    obj.label72:setTop(55);
    obj.label72:setWidth(80);
    obj.label72:setHeight(25);
    obj.label72:setText("Especial");
    obj.label72:setName("label72");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout7);
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(940);
    obj.edit60:setTop(55);
    obj.edit60:setWidth(120);
    obj.edit60:setHeight(25);
    obj.edit60:setField("efeitoSpecial6");
    obj.edit60:setName("edit60");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(2);
    obj.layout8:setTop(573);
    obj.layout8:setWidth(1207);
    obj.layout8:setHeight(92);
    obj.layout8:setName("layout8");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout8);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout8);
    obj.button37:setLeft(000);
    obj.button37:setTop(5);
    obj.button37:setWidth(20);
    obj.button37:setHeight(20);
    obj.button37:setText("I");
    obj.button37:setHint("Importar um Golpe");
    obj.button37:setName("button37");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout8);
    obj.button38:setLeft(000);
    obj.button38:setTop(30);
    obj.button38:setWidth(20);
    obj.button38:setHeight(20);
    obj.button38:setText("E");
    obj.button38:setHint("Exportar o Golpe");
    obj.button38:setName("button38");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout8);
    obj.button39:setLeft(000);
    obj.button39:setTop(55);
    obj.button39:setWidth(20);
    obj.button39:setHeight(20);
    obj.button39:setText("A");
    obj.button39:setHint("Apagar o Golpe");
    obj.button39:setName("button39");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout8);
    obj.label73:setLeft(25);
    obj.label73:setTop(5);
    obj.label73:setWidth(70);
    obj.label73:setHeight(25);
    obj.label73:setText("Golpe");
    obj.label73:setName("label73");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout8);
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(90);
    obj.edit61:setTop(5);
    obj.edit61:setWidth(135);
    obj.edit61:setHeight(25);
    obj.edit61:setField("golpe7");
    obj.edit61:setName("edit61");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout8);
    obj.label74:setLeft(25);
    obj.label74:setTop(30);
    obj.label74:setWidth(80);
    obj.label74:setHeight(25);
    obj.label74:setText("Frequência");
    obj.label74:setName("label74");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout8);
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(90);
    obj.edit62:setTop(30);
    obj.edit62:setWidth(135);
    obj.edit62:setHeight(25);
    obj.edit62:setField("frequencia7");
    obj.edit62:setName("edit62");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout8);
    obj.label75:setLeft(25);
    obj.label75:setTop(55);
    obj.label75:setWidth(70);
    obj.label75:setHeight(25);
    obj.label75:setText("Alcance");
    obj.label75:setName("label75");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout8);
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(90);
    obj.edit63:setTop(55);
    obj.edit63:setWidth(135);
    obj.edit63:setHeight(25);
    obj.edit63:setField("alcance7");
    obj.edit63:setName("edit63");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout8);
    obj.label76:setLeft(235);
    obj.label76:setTop(6);
    obj.label76:setWidth(50);
    obj.label76:setHeight(25);
    obj.label76:setText("Tipo");
    obj.label76:setName("label76");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout8);
    obj.comboBox13:setLeft(277);
    obj.comboBox13:setTop(6);
    obj.comboBox13:setWidth(87);
    obj.comboBox13:setHeight(25);
    obj.comboBox13:setField("tipo7");
    obj.comboBox13:setHorzTextAlign("leading");
    obj.comboBox13:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox13:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox13:setName("comboBox13");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout8);
    obj.label77:setLeft(235);
    obj.label77:setTop(31);
    obj.label77:setWidth(50);
    obj.label77:setHeight(25);
    obj.label77:setText("Classe");
    obj.label77:setName("label77");

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout8);
    obj.comboBox14:setLeft(277);
    obj.comboBox14:setTop(31);
    obj.comboBox14:setWidth(87);
    obj.comboBox14:setHeight(25);
    obj.comboBox14:setField("classe7");
    obj.comboBox14:setHorzTextAlign("leading");
    obj.comboBox14:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox14:setValues({'1', '2', '3'});
    obj.comboBox14:setName("comboBox14");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout8);
    obj.label78:setLeft(235);
    obj.label78:setTop(55);
    obj.label78:setWidth(50);
    obj.label78:setHeight(25);
    obj.label78:setText("AC");
    obj.label78:setName("label78");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout8);
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(277);
    obj.edit64:setTop(55);
    obj.edit64:setWidth(87);
    obj.edit64:setHeight(25);
    obj.edit64:setField("AC7");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout8);
    obj.label79:setLeft(370);
    obj.label79:setTop(6);
    obj.label79:setWidth(70);
    obj.label79:setHeight(25);
    obj.label79:setText("Prec.Bôn.");
    obj.label79:setName("label79");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout8);
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(443);
    obj.edit65:setTop(6);
    obj.edit65:setWidth(42);
    obj.edit65:setHeight(25);
    obj.edit65:setField("ataque7");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout8);
    obj.label80:setLeft(370);
    obj.label80:setTop(31);
    obj.label80:setWidth(70);
    obj.label80:setHeight(25);
    obj.label80:setText("Dano Base");
    obj.label80:setName("label80");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout8);
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(443);
    obj.edit66:setTop(31);
    obj.edit66:setWidth(42);
    obj.edit66:setHeight(25);
    obj.edit66:setField("dano7");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setName("edit66");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout8);
    obj.label81:setLeft(370);
    obj.label81:setTop(55);
    obj.label81:setWidth(70);
    obj.label81:setHeight(25);
    obj.label81:setText("Dano Bôn.");
    obj.label81:setName("label81");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout8);
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(443);
    obj.edit67:setTop(55);
    obj.edit67:setWidth(42);
    obj.edit67:setHeight(25);
    obj.edit67:setField("BonDMG7");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout8);
    obj.button40:setLeft(488);
    obj.button40:setTop(6);
    obj.button40:setWidth(82);
    obj.button40:setText("Acerto");
    obj.button40:setFontSize(11);
    obj.button40:setName("button40");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout8);
    obj.button41:setLeft(488);
    obj.button41:setTop(31);
    obj.button41:setWidth(82);
    obj.button41:setText("Dano");
    obj.button41:setFontSize(11);
    obj.button41:setName("button41");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout8);
    obj.button42:setLeft(488);
    obj.button42:setTop(55);
    obj.button42:setWidth(82);
    obj.button42:setText("Crítico");
    obj.button42:setFontSize(11);
    obj.button42:setName("button42");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout8);
    obj.textEditor7:setLeft(575);
    obj.textEditor7:setTop(5);
    obj.textEditor7:setWidth(295);
    obj.textEditor7:setHeight(75);
    obj.textEditor7:setField("campoEfeitoGolpes7");
    obj.textEditor7:setName("textEditor7");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout8);
    obj.label82:setLeft(875);
    obj.label82:setTop(5);
    obj.label82:setWidth(80);
    obj.label82:setHeight(25);
    obj.label82:setText("Tipo(Co.)");
    obj.label82:setName("label82");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout8);
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(940);
    obj.edit68:setTop(5);
    obj.edit68:setWidth(120);
    obj.edit68:setHeight(25);
    obj.edit68:setField("tipoContest7");
    obj.edit68:setName("edit68");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout8);
    obj.label83:setLeft(875);
    obj.label83:setTop(30);
    obj.label83:setWidth(80);
    obj.label83:setHeight(25);
    obj.label83:setText("Efeito(Co.)");
    obj.label83:setName("label83");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout8);
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(940);
    obj.edit69:setTop(30);
    obj.edit69:setWidth(120);
    obj.edit69:setHeight(25);
    obj.edit69:setField("efeitoContest7");
    obj.edit69:setName("edit69");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout8);
    obj.label84:setLeft(875);
    obj.label84:setTop(55);
    obj.label84:setWidth(80);
    obj.label84:setHeight(25);
    obj.label84:setText("Especial");
    obj.label84:setName("label84");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout8);
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(940);
    obj.edit70:setTop(55);
    obj.edit70:setWidth(120);
    obj.edit70:setHeight(25);
    obj.edit70:setField("efeitoSpecial7");
    obj.edit70:setName("edit70");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(2);
    obj.layout9:setTop(668);
    obj.layout9:setWidth(1207);
    obj.layout9:setHeight(92);
    obj.layout9:setName("layout9");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout9);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout9);
    obj.button43:setLeft(000);
    obj.button43:setTop(5);
    obj.button43:setWidth(20);
    obj.button43:setHeight(20);
    obj.button43:setText("I");
    obj.button43:setHint("Importar um Golpe");
    obj.button43:setName("button43");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout9);
    obj.button44:setLeft(000);
    obj.button44:setTop(30);
    obj.button44:setWidth(20);
    obj.button44:setHeight(20);
    obj.button44:setText("E");
    obj.button44:setHint("Exportar o Golpe");
    obj.button44:setName("button44");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout9);
    obj.button45:setLeft(000);
    obj.button45:setTop(55);
    obj.button45:setWidth(20);
    obj.button45:setHeight(20);
    obj.button45:setText("A");
    obj.button45:setHint("Apagar o Golpe");
    obj.button45:setName("button45");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout9);
    obj.label85:setLeft(25);
    obj.label85:setTop(5);
    obj.label85:setWidth(70);
    obj.label85:setHeight(25);
    obj.label85:setText("Golpe");
    obj.label85:setName("label85");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout9);
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(90);
    obj.edit71:setTop(5);
    obj.edit71:setWidth(135);
    obj.edit71:setHeight(25);
    obj.edit71:setField("golpe8");
    obj.edit71:setName("edit71");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout9);
    obj.label86:setLeft(25);
    obj.label86:setTop(30);
    obj.label86:setWidth(80);
    obj.label86:setHeight(25);
    obj.label86:setText("Frequência");
    obj.label86:setName("label86");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout9);
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(90);
    obj.edit72:setTop(30);
    obj.edit72:setWidth(135);
    obj.edit72:setHeight(25);
    obj.edit72:setField("frequencia8");
    obj.edit72:setName("edit72");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout9);
    obj.label87:setLeft(25);
    obj.label87:setTop(55);
    obj.label87:setWidth(70);
    obj.label87:setHeight(25);
    obj.label87:setText("Alcance");
    obj.label87:setName("label87");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout9);
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(90);
    obj.edit73:setTop(55);
    obj.edit73:setWidth(135);
    obj.edit73:setHeight(25);
    obj.edit73:setField("alcance8");
    obj.edit73:setName("edit73");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout9);
    obj.label88:setLeft(235);
    obj.label88:setTop(6);
    obj.label88:setWidth(50);
    obj.label88:setHeight(25);
    obj.label88:setText("Tipo");
    obj.label88:setName("label88");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout9);
    obj.comboBox15:setLeft(277);
    obj.comboBox15:setTop(6);
    obj.comboBox15:setWidth(87);
    obj.comboBox15:setHeight(25);
    obj.comboBox15:setField("tipo8");
    obj.comboBox15:setHorzTextAlign("leading");
    obj.comboBox15:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox15:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox15:setName("comboBox15");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout9);
    obj.label89:setLeft(235);
    obj.label89:setTop(31);
    obj.label89:setWidth(50);
    obj.label89:setHeight(25);
    obj.label89:setText("Classe");
    obj.label89:setName("label89");

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout9);
    obj.comboBox16:setLeft(277);
    obj.comboBox16:setTop(31);
    obj.comboBox16:setWidth(87);
    obj.comboBox16:setHeight(25);
    obj.comboBox16:setField("classe8");
    obj.comboBox16:setHorzTextAlign("leading");
    obj.comboBox16:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox16:setValues({'1', '2', '3'});
    obj.comboBox16:setName("comboBox16");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout9);
    obj.label90:setLeft(235);
    obj.label90:setTop(55);
    obj.label90:setWidth(50);
    obj.label90:setHeight(25);
    obj.label90:setText("AC");
    obj.label90:setName("label90");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout9);
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(277);
    obj.edit74:setTop(55);
    obj.edit74:setWidth(87);
    obj.edit74:setHeight(25);
    obj.edit74:setField("AC8");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout9);
    obj.label91:setLeft(370);
    obj.label91:setTop(6);
    obj.label91:setWidth(70);
    obj.label91:setHeight(25);
    obj.label91:setText("Prec.Bôn.");
    obj.label91:setName("label91");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout9);
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(443);
    obj.edit75:setTop(6);
    obj.edit75:setWidth(42);
    obj.edit75:setHeight(25);
    obj.edit75:setField("ataque8");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setName("edit75");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout9);
    obj.label92:setLeft(370);
    obj.label92:setTop(31);
    obj.label92:setWidth(70);
    obj.label92:setHeight(25);
    obj.label92:setText("Dano Base");
    obj.label92:setName("label92");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout9);
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(443);
    obj.edit76:setTop(31);
    obj.edit76:setWidth(42);
    obj.edit76:setHeight(25);
    obj.edit76:setField("dano8");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout9);
    obj.label93:setLeft(370);
    obj.label93:setTop(55);
    obj.label93:setWidth(70);
    obj.label93:setHeight(25);
    obj.label93:setText("Dano Bôn.");
    obj.label93:setName("label93");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout9);
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(443);
    obj.edit77:setTop(55);
    obj.edit77:setWidth(42);
    obj.edit77:setHeight(25);
    obj.edit77:setField("BonDMG8");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout9);
    obj.button46:setLeft(488);
    obj.button46:setTop(6);
    obj.button46:setWidth(82);
    obj.button46:setText("Acerto");
    obj.button46:setFontSize(11);
    obj.button46:setName("button46");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout9);
    obj.button47:setLeft(488);
    obj.button47:setTop(31);
    obj.button47:setWidth(82);
    obj.button47:setText("Dano");
    obj.button47:setFontSize(11);
    obj.button47:setName("button47");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout9);
    obj.button48:setLeft(488);
    obj.button48:setTop(55);
    obj.button48:setWidth(82);
    obj.button48:setText("Crítico");
    obj.button48:setFontSize(11);
    obj.button48:setName("button48");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout9);
    obj.textEditor8:setLeft(575);
    obj.textEditor8:setTop(5);
    obj.textEditor8:setWidth(295);
    obj.textEditor8:setHeight(75);
    obj.textEditor8:setField("campoEfeitoGolpes8");
    obj.textEditor8:setName("textEditor8");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout9);
    obj.label94:setLeft(875);
    obj.label94:setTop(5);
    obj.label94:setWidth(80);
    obj.label94:setHeight(25);
    obj.label94:setText("Tipo(Co.)");
    obj.label94:setName("label94");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout9);
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(940);
    obj.edit78:setTop(5);
    obj.edit78:setWidth(120);
    obj.edit78:setHeight(25);
    obj.edit78:setField("tipoContest8");
    obj.edit78:setName("edit78");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout9);
    obj.label95:setLeft(875);
    obj.label95:setTop(30);
    obj.label95:setWidth(80);
    obj.label95:setHeight(25);
    obj.label95:setText("Efeito(Co.)");
    obj.label95:setName("label95");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout9);
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(940);
    obj.edit79:setTop(30);
    obj.edit79:setWidth(120);
    obj.edit79:setHeight(25);
    obj.edit79:setField("efeitoContest8");
    obj.edit79:setName("edit79");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout9);
    obj.label96:setLeft(875);
    obj.label96:setTop(55);
    obj.label96:setWidth(80);
    obj.label96:setHeight(25);
    obj.label96:setText("Especial");
    obj.label96:setName("label96");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout9);
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(940);
    obj.edit80:setTop(55);
    obj.edit80:setWidth(120);
    obj.edit80:setHeight(25);
    obj.edit80:setField("efeitoSpecial8");
    obj.edit80:setName("edit80");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(2);
    obj.layout10:setTop(763);
    obj.layout10:setWidth(1207);
    obj.layout10:setHeight(92);
    obj.layout10:setName("layout10");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout10);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout10);
    obj.button49:setLeft(000);
    obj.button49:setTop(5);
    obj.button49:setWidth(20);
    obj.button49:setHeight(20);
    obj.button49:setText("I");
    obj.button49:setHint("Importar um Golpe");
    obj.button49:setName("button49");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout10);
    obj.button50:setLeft(000);
    obj.button50:setTop(30);
    obj.button50:setWidth(20);
    obj.button50:setHeight(20);
    obj.button50:setText("E");
    obj.button50:setHint("Exportar o Golpe");
    obj.button50:setName("button50");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout10);
    obj.button51:setLeft(000);
    obj.button51:setTop(55);
    obj.button51:setWidth(20);
    obj.button51:setHeight(20);
    obj.button51:setText("A");
    obj.button51:setHint("Apagar o Golpe");
    obj.button51:setName("button51");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout10);
    obj.label97:setLeft(25);
    obj.label97:setTop(5);
    obj.label97:setWidth(70);
    obj.label97:setHeight(25);
    obj.label97:setText("Golpe");
    obj.label97:setName("label97");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout10);
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(90);
    obj.edit81:setTop(5);
    obj.edit81:setWidth(135);
    obj.edit81:setHeight(25);
    obj.edit81:setField("golpe9");
    obj.edit81:setName("edit81");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout10);
    obj.label98:setLeft(25);
    obj.label98:setTop(30);
    obj.label98:setWidth(80);
    obj.label98:setHeight(25);
    obj.label98:setText("Frequência");
    obj.label98:setName("label98");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout10);
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(90);
    obj.edit82:setTop(30);
    obj.edit82:setWidth(135);
    obj.edit82:setHeight(25);
    obj.edit82:setField("frequencia9");
    obj.edit82:setName("edit82");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout10);
    obj.label99:setLeft(25);
    obj.label99:setTop(55);
    obj.label99:setWidth(70);
    obj.label99:setHeight(25);
    obj.label99:setText("Alcance");
    obj.label99:setName("label99");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout10);
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setLeft(90);
    obj.edit83:setTop(55);
    obj.edit83:setWidth(135);
    obj.edit83:setHeight(25);
    obj.edit83:setField("alcance9");
    obj.edit83:setName("edit83");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout10);
    obj.label100:setLeft(235);
    obj.label100:setTop(6);
    obj.label100:setWidth(50);
    obj.label100:setHeight(25);
    obj.label100:setText("Tipo");
    obj.label100:setName("label100");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout10);
    obj.comboBox17:setLeft(277);
    obj.comboBox17:setTop(6);
    obj.comboBox17:setWidth(87);
    obj.comboBox17:setHeight(25);
    obj.comboBox17:setField("tipo9");
    obj.comboBox17:setHorzTextAlign("leading");
    obj.comboBox17:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox17:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox17:setName("comboBox17");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout10);
    obj.label101:setLeft(235);
    obj.label101:setTop(31);
    obj.label101:setWidth(50);
    obj.label101:setHeight(25);
    obj.label101:setText("Classe");
    obj.label101:setName("label101");

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout10);
    obj.comboBox18:setLeft(277);
    obj.comboBox18:setTop(31);
    obj.comboBox18:setWidth(87);
    obj.comboBox18:setHeight(25);
    obj.comboBox18:setField("classe9");
    obj.comboBox18:setHorzTextAlign("leading");
    obj.comboBox18:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox18:setValues({'1', '2', '3'});
    obj.comboBox18:setName("comboBox18");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout10);
    obj.label102:setLeft(235);
    obj.label102:setTop(55);
    obj.label102:setWidth(50);
    obj.label102:setHeight(25);
    obj.label102:setText("AC");
    obj.label102:setName("label102");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout10);
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setLeft(277);
    obj.edit84:setTop(55);
    obj.edit84:setWidth(87);
    obj.edit84:setHeight(25);
    obj.edit84:setField("AC9");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout10);
    obj.label103:setLeft(370);
    obj.label103:setTop(6);
    obj.label103:setWidth(70);
    obj.label103:setHeight(25);
    obj.label103:setText("Prec.Bôn.");
    obj.label103:setName("label103");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout10);
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setLeft(443);
    obj.edit85:setTop(6);
    obj.edit85:setWidth(42);
    obj.edit85:setHeight(25);
    obj.edit85:setField("ataque9");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout10);
    obj.label104:setLeft(370);
    obj.label104:setTop(31);
    obj.label104:setWidth(70);
    obj.label104:setHeight(25);
    obj.label104:setText("Dano Base");
    obj.label104:setName("label104");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout10);
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setLeft(443);
    obj.edit86:setTop(31);
    obj.edit86:setWidth(42);
    obj.edit86:setHeight(25);
    obj.edit86:setField("dano9");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setName("edit86");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout10);
    obj.label105:setLeft(370);
    obj.label105:setTop(55);
    obj.label105:setWidth(70);
    obj.label105:setHeight(25);
    obj.label105:setText("Dano Bôn.");
    obj.label105:setName("label105");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout10);
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setLeft(443);
    obj.edit87:setTop(55);
    obj.edit87:setWidth(42);
    obj.edit87:setHeight(25);
    obj.edit87:setField("BonDMG9");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setName("edit87");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout10);
    obj.button52:setLeft(488);
    obj.button52:setTop(6);
    obj.button52:setWidth(82);
    obj.button52:setText("Acerto");
    obj.button52:setFontSize(11);
    obj.button52:setName("button52");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout10);
    obj.button53:setLeft(488);
    obj.button53:setTop(31);
    obj.button53:setWidth(82);
    obj.button53:setText("Dano");
    obj.button53:setFontSize(11);
    obj.button53:setName("button53");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout10);
    obj.button54:setLeft(488);
    obj.button54:setTop(55);
    obj.button54:setWidth(82);
    obj.button54:setText("Crítico");
    obj.button54:setFontSize(11);
    obj.button54:setName("button54");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout10);
    obj.textEditor9:setLeft(575);
    obj.textEditor9:setTop(5);
    obj.textEditor9:setWidth(295);
    obj.textEditor9:setHeight(75);
    obj.textEditor9:setField("campoEfeitoGolpes9");
    obj.textEditor9:setName("textEditor9");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout10);
    obj.label106:setLeft(875);
    obj.label106:setTop(5);
    obj.label106:setWidth(80);
    obj.label106:setHeight(25);
    obj.label106:setText("Tipo(Co.)");
    obj.label106:setName("label106");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout10);
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setLeft(940);
    obj.edit88:setTop(5);
    obj.edit88:setWidth(120);
    obj.edit88:setHeight(25);
    obj.edit88:setField("tipoContest9");
    obj.edit88:setName("edit88");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout10);
    obj.label107:setLeft(875);
    obj.label107:setTop(30);
    obj.label107:setWidth(80);
    obj.label107:setHeight(25);
    obj.label107:setText("Efeito(Co.)");
    obj.label107:setName("label107");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout10);
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setLeft(940);
    obj.edit89:setTop(30);
    obj.edit89:setWidth(120);
    obj.edit89:setHeight(25);
    obj.edit89:setField("efeitoContest9");
    obj.edit89:setName("edit89");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout10);
    obj.label108:setLeft(875);
    obj.label108:setTop(55);
    obj.label108:setWidth(80);
    obj.label108:setHeight(25);
    obj.label108:setText("Especial");
    obj.label108:setName("label108");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout10);
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setLeft(940);
    obj.edit90:setTop(55);
    obj.edit90:setWidth(120);
    obj.edit90:setHeight(25);
    obj.edit90:setField("efeitoSpecial9");
    obj.edit90:setName("edit90");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(2);
    obj.layout11:setTop(858);
    obj.layout11:setWidth(1207);
    obj.layout11:setHeight(92);
    obj.layout11:setName("layout11");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout11);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout11);
    obj.button55:setLeft(000);
    obj.button55:setTop(5);
    obj.button55:setWidth(20);
    obj.button55:setHeight(20);
    obj.button55:setText("I");
    obj.button55:setHint("Importar um Golpe");
    obj.button55:setName("button55");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.layout11);
    obj.button56:setLeft(000);
    obj.button56:setTop(30);
    obj.button56:setWidth(20);
    obj.button56:setHeight(20);
    obj.button56:setText("E");
    obj.button56:setHint("Exportar o Golpe");
    obj.button56:setName("button56");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.layout11);
    obj.button57:setLeft(000);
    obj.button57:setTop(55);
    obj.button57:setWidth(20);
    obj.button57:setHeight(20);
    obj.button57:setText("A");
    obj.button57:setHint("Apagar o Golpe");
    obj.button57:setName("button57");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout11);
    obj.label109:setLeft(25);
    obj.label109:setTop(5);
    obj.label109:setWidth(70);
    obj.label109:setHeight(25);
    obj.label109:setText("Golpe");
    obj.label109:setName("label109");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout11);
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setLeft(90);
    obj.edit91:setTop(5);
    obj.edit91:setWidth(135);
    obj.edit91:setHeight(25);
    obj.edit91:setField("golpe10");
    obj.edit91:setName("edit91");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout11);
    obj.label110:setLeft(25);
    obj.label110:setTop(30);
    obj.label110:setWidth(80);
    obj.label110:setHeight(25);
    obj.label110:setText("Frequência");
    obj.label110:setName("label110");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout11);
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setLeft(90);
    obj.edit92:setTop(30);
    obj.edit92:setWidth(135);
    obj.edit92:setHeight(25);
    obj.edit92:setField("frequencia10");
    obj.edit92:setName("edit92");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout11);
    obj.label111:setLeft(25);
    obj.label111:setTop(55);
    obj.label111:setWidth(70);
    obj.label111:setHeight(25);
    obj.label111:setText("Alcance");
    obj.label111:setName("label111");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout11);
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setLeft(90);
    obj.edit93:setTop(55);
    obj.edit93:setWidth(135);
    obj.edit93:setHeight(25);
    obj.edit93:setField("alcance10");
    obj.edit93:setName("edit93");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout11);
    obj.label112:setLeft(235);
    obj.label112:setTop(6);
    obj.label112:setWidth(50);
    obj.label112:setHeight(25);
    obj.label112:setText("Tipo");
    obj.label112:setName("label112");

    obj.comboBox19 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout11);
    obj.comboBox19:setLeft(277);
    obj.comboBox19:setTop(6);
    obj.comboBox19:setWidth(87);
    obj.comboBox19:setHeight(25);
    obj.comboBox19:setField("tipo10");
    obj.comboBox19:setHorzTextAlign("leading");
    obj.comboBox19:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox19:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox19:setName("comboBox19");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout11);
    obj.label113:setLeft(235);
    obj.label113:setTop(31);
    obj.label113:setWidth(50);
    obj.label113:setHeight(25);
    obj.label113:setText("Classe");
    obj.label113:setName("label113");

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout11);
    obj.comboBox20:setLeft(277);
    obj.comboBox20:setTop(31);
    obj.comboBox20:setWidth(87);
    obj.comboBox20:setHeight(25);
    obj.comboBox20:setField("classe10");
    obj.comboBox20:setHorzTextAlign("leading");
    obj.comboBox20:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox20:setValues({'1', '2', '3'});
    obj.comboBox20:setName("comboBox20");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout11);
    obj.label114:setLeft(235);
    obj.label114:setTop(55);
    obj.label114:setWidth(50);
    obj.label114:setHeight(25);
    obj.label114:setText("AC");
    obj.label114:setName("label114");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout11);
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setLeft(277);
    obj.edit94:setTop(55);
    obj.edit94:setWidth(87);
    obj.edit94:setHeight(25);
    obj.edit94:setField("AC10");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setName("edit94");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout11);
    obj.label115:setLeft(370);
    obj.label115:setTop(6);
    obj.label115:setWidth(70);
    obj.label115:setHeight(25);
    obj.label115:setText("Prec.Bôn.");
    obj.label115:setName("label115");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout11);
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setLeft(443);
    obj.edit95:setTop(6);
    obj.edit95:setWidth(42);
    obj.edit95:setHeight(25);
    obj.edit95:setField("ataque10");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout11);
    obj.label116:setLeft(370);
    obj.label116:setTop(31);
    obj.label116:setWidth(70);
    obj.label116:setHeight(25);
    obj.label116:setText("Dano Base");
    obj.label116:setName("label116");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout11);
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setLeft(443);
    obj.edit96:setTop(31);
    obj.edit96:setWidth(42);
    obj.edit96:setHeight(25);
    obj.edit96:setField("dano10");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setName("edit96");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout11);
    obj.label117:setLeft(370);
    obj.label117:setTop(55);
    obj.label117:setWidth(70);
    obj.label117:setHeight(25);
    obj.label117:setText("Dano Bôn.");
    obj.label117:setName("label117");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout11);
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setLeft(443);
    obj.edit97:setTop(55);
    obj.edit97:setWidth(42);
    obj.edit97:setHeight(25);
    obj.edit97:setField("BonDMG10");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setName("edit97");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.layout11);
    obj.button58:setLeft(488);
    obj.button58:setTop(6);
    obj.button58:setWidth(82);
    obj.button58:setText("Acerto");
    obj.button58:setFontSize(11);
    obj.button58:setName("button58");

    obj.button59 = GUI.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.layout11);
    obj.button59:setLeft(488);
    obj.button59:setTop(31);
    obj.button59:setWidth(82);
    obj.button59:setText("Dano");
    obj.button59:setFontSize(11);
    obj.button59:setName("button59");

    obj.button60 = GUI.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.layout11);
    obj.button60:setLeft(488);
    obj.button60:setTop(55);
    obj.button60:setWidth(82);
    obj.button60:setText("Crítico");
    obj.button60:setFontSize(11);
    obj.button60:setName("button60");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout11);
    obj.textEditor10:setLeft(575);
    obj.textEditor10:setTop(5);
    obj.textEditor10:setWidth(295);
    obj.textEditor10:setHeight(75);
    obj.textEditor10:setField("campoEfeitoGolpes10");
    obj.textEditor10:setName("textEditor10");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout11);
    obj.label118:setLeft(875);
    obj.label118:setTop(5);
    obj.label118:setWidth(80);
    obj.label118:setHeight(25);
    obj.label118:setText("Tipo(Co.)");
    obj.label118:setName("label118");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout11);
    obj.edit98:setVertTextAlign("center");
    obj.edit98:setLeft(940);
    obj.edit98:setTop(5);
    obj.edit98:setWidth(120);
    obj.edit98:setHeight(25);
    obj.edit98:setField("tipoContest10");
    obj.edit98:setName("edit98");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout11);
    obj.label119:setLeft(875);
    obj.label119:setTop(30);
    obj.label119:setWidth(80);
    obj.label119:setHeight(25);
    obj.label119:setText("Efeito(Co.)");
    obj.label119:setName("label119");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout11);
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setLeft(940);
    obj.edit99:setTop(30);
    obj.edit99:setWidth(120);
    obj.edit99:setHeight(25);
    obj.edit99:setField("efeitoContest10");
    obj.edit99:setName("edit99");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout11);
    obj.label120:setLeft(875);
    obj.label120:setTop(55);
    obj.label120:setWidth(80);
    obj.label120:setHeight(25);
    obj.label120:setText("Especial");
    obj.label120:setName("label120");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout11);
    obj.edit100:setVertTextAlign("center");
    obj.edit100:setLeft(940);
    obj.edit100:setTop(55);
    obj.edit100:setWidth(120);
    obj.edit100:setHeight(25);
    obj.edit100:setField("efeitoSpecial10");
    obj.edit100:setName("edit100");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout1);
    obj.layout12:setLeft(2);
    obj.layout12:setTop(953);
    obj.layout12:setWidth(1207);
    obj.layout12:setHeight(92);
    obj.layout12:setName("layout12");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout12);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.button61 = GUI.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.layout12);
    obj.button61:setLeft(000);
    obj.button61:setTop(5);
    obj.button61:setWidth(20);
    obj.button61:setHeight(20);
    obj.button61:setText("I");
    obj.button61:setHint("Importar um Golpe");
    obj.button61:setName("button61");

    obj.button62 = GUI.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.layout12);
    obj.button62:setLeft(000);
    obj.button62:setTop(30);
    obj.button62:setWidth(20);
    obj.button62:setHeight(20);
    obj.button62:setText("E");
    obj.button62:setHint("Exportar o Golpe");
    obj.button62:setName("button62");

    obj.button63 = GUI.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.layout12);
    obj.button63:setLeft(000);
    obj.button63:setTop(55);
    obj.button63:setWidth(20);
    obj.button63:setHeight(20);
    obj.button63:setText("A");
    obj.button63:setHint("Apagar o Golpe");
    obj.button63:setName("button63");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout12);
    obj.label121:setLeft(25);
    obj.label121:setTop(5);
    obj.label121:setWidth(70);
    obj.label121:setHeight(25);
    obj.label121:setText("Golpe");
    obj.label121:setName("label121");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout12);
    obj.edit101:setVertTextAlign("center");
    obj.edit101:setLeft(90);
    obj.edit101:setTop(5);
    obj.edit101:setWidth(135);
    obj.edit101:setHeight(25);
    obj.edit101:setField("golpe11");
    obj.edit101:setName("edit101");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout12);
    obj.label122:setLeft(25);
    obj.label122:setTop(30);
    obj.label122:setWidth(80);
    obj.label122:setHeight(25);
    obj.label122:setText("Frequência");
    obj.label122:setName("label122");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout12);
    obj.edit102:setVertTextAlign("center");
    obj.edit102:setLeft(90);
    obj.edit102:setTop(30);
    obj.edit102:setWidth(135);
    obj.edit102:setHeight(25);
    obj.edit102:setField("frequencia11");
    obj.edit102:setName("edit102");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout12);
    obj.label123:setLeft(25);
    obj.label123:setTop(55);
    obj.label123:setWidth(70);
    obj.label123:setHeight(25);
    obj.label123:setText("Alcance");
    obj.label123:setName("label123");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout12);
    obj.edit103:setVertTextAlign("center");
    obj.edit103:setLeft(90);
    obj.edit103:setTop(55);
    obj.edit103:setWidth(135);
    obj.edit103:setHeight(25);
    obj.edit103:setField("alcance11");
    obj.edit103:setName("edit103");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout12);
    obj.label124:setLeft(235);
    obj.label124:setTop(6);
    obj.label124:setWidth(50);
    obj.label124:setHeight(25);
    obj.label124:setText("Tipo");
    obj.label124:setName("label124");

    obj.comboBox21 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout12);
    obj.comboBox21:setLeft(277);
    obj.comboBox21:setTop(6);
    obj.comboBox21:setWidth(87);
    obj.comboBox21:setHeight(25);
    obj.comboBox21:setField("tipo11");
    obj.comboBox21:setHorzTextAlign("leading");
    obj.comboBox21:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox21:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox21:setName("comboBox21");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout12);
    obj.label125:setLeft(235);
    obj.label125:setTop(31);
    obj.label125:setWidth(50);
    obj.label125:setHeight(25);
    obj.label125:setText("Classe");
    obj.label125:setName("label125");

    obj.comboBox22 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout12);
    obj.comboBox22:setLeft(277);
    obj.comboBox22:setTop(31);
    obj.comboBox22:setWidth(87);
    obj.comboBox22:setHeight(25);
    obj.comboBox22:setField("classe11");
    obj.comboBox22:setHorzTextAlign("leading");
    obj.comboBox22:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox22:setValues({'1', '2', '3'});
    obj.comboBox22:setName("comboBox22");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout12);
    obj.label126:setLeft(235);
    obj.label126:setTop(55);
    obj.label126:setWidth(50);
    obj.label126:setHeight(25);
    obj.label126:setText("AC");
    obj.label126:setName("label126");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout12);
    obj.edit104:setVertTextAlign("center");
    obj.edit104:setLeft(277);
    obj.edit104:setTop(55);
    obj.edit104:setWidth(87);
    obj.edit104:setHeight(25);
    obj.edit104:setField("AC11");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setName("edit104");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout12);
    obj.label127:setLeft(370);
    obj.label127:setTop(6);
    obj.label127:setWidth(70);
    obj.label127:setHeight(25);
    obj.label127:setText("Prec.Bôn.");
    obj.label127:setName("label127");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout12);
    obj.edit105:setVertTextAlign("center");
    obj.edit105:setLeft(443);
    obj.edit105:setTop(6);
    obj.edit105:setWidth(42);
    obj.edit105:setHeight(25);
    obj.edit105:setField("ataque11");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setName("edit105");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout12);
    obj.label128:setLeft(370);
    obj.label128:setTop(31);
    obj.label128:setWidth(70);
    obj.label128:setHeight(25);
    obj.label128:setText("Dano Base");
    obj.label128:setName("label128");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout12);
    obj.edit106:setVertTextAlign("center");
    obj.edit106:setLeft(443);
    obj.edit106:setTop(31);
    obj.edit106:setWidth(42);
    obj.edit106:setHeight(25);
    obj.edit106:setField("dano11");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setName("edit106");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout12);
    obj.label129:setLeft(370);
    obj.label129:setTop(55);
    obj.label129:setWidth(70);
    obj.label129:setHeight(25);
    obj.label129:setText("Dano Bôn.");
    obj.label129:setName("label129");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout12);
    obj.edit107:setVertTextAlign("center");
    obj.edit107:setLeft(443);
    obj.edit107:setTop(55);
    obj.edit107:setWidth(42);
    obj.edit107:setHeight(25);
    obj.edit107:setField("BonDMG11");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setName("edit107");

    obj.button64 = GUI.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.layout12);
    obj.button64:setLeft(488);
    obj.button64:setTop(6);
    obj.button64:setWidth(82);
    obj.button64:setText("Acerto");
    obj.button64:setFontSize(11);
    obj.button64:setName("button64");

    obj.button65 = GUI.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.layout12);
    obj.button65:setLeft(488);
    obj.button65:setTop(31);
    obj.button65:setWidth(82);
    obj.button65:setText("Dano");
    obj.button65:setFontSize(11);
    obj.button65:setName("button65");

    obj.button66 = GUI.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.layout12);
    obj.button66:setLeft(488);
    obj.button66:setTop(55);
    obj.button66:setWidth(82);
    obj.button66:setText("Crítico");
    obj.button66:setFontSize(11);
    obj.button66:setName("button66");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout12);
    obj.textEditor11:setLeft(575);
    obj.textEditor11:setTop(5);
    obj.textEditor11:setWidth(295);
    obj.textEditor11:setHeight(75);
    obj.textEditor11:setField("campoEfeitoGolpes11");
    obj.textEditor11:setName("textEditor11");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout12);
    obj.label130:setLeft(875);
    obj.label130:setTop(5);
    obj.label130:setWidth(80);
    obj.label130:setHeight(25);
    obj.label130:setText("Tipo(Co.)");
    obj.label130:setName("label130");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout12);
    obj.edit108:setVertTextAlign("center");
    obj.edit108:setLeft(940);
    obj.edit108:setTop(5);
    obj.edit108:setWidth(120);
    obj.edit108:setHeight(25);
    obj.edit108:setField("tipoContest11");
    obj.edit108:setName("edit108");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout12);
    obj.label131:setLeft(875);
    obj.label131:setTop(30);
    obj.label131:setWidth(80);
    obj.label131:setHeight(25);
    obj.label131:setText("Efeito(Co.)");
    obj.label131:setName("label131");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout12);
    obj.edit109:setVertTextAlign("center");
    obj.edit109:setLeft(940);
    obj.edit109:setTop(30);
    obj.edit109:setWidth(120);
    obj.edit109:setHeight(25);
    obj.edit109:setField("efeitoContest11");
    obj.edit109:setName("edit109");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout12);
    obj.label132:setLeft(875);
    obj.label132:setTop(55);
    obj.label132:setWidth(80);
    obj.label132:setHeight(25);
    obj.label132:setText("Especial");
    obj.label132:setName("label132");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout12);
    obj.edit110:setVertTextAlign("center");
    obj.edit110:setLeft(940);
    obj.edit110:setTop(55);
    obj.edit110:setWidth(120);
    obj.edit110:setHeight(25);
    obj.edit110:setField("efeitoSpecial11");
    obj.edit110:setName("edit110");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout1);
    obj.layout13:setLeft(2);
    obj.layout13:setTop(1048);
    obj.layout13:setWidth(1207);
    obj.layout13:setHeight(92);
    obj.layout13:setName("layout13");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout13);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.button67 = GUI.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.layout13);
    obj.button67:setLeft(000);
    obj.button67:setTop(5);
    obj.button67:setWidth(20);
    obj.button67:setHeight(20);
    obj.button67:setText("I");
    obj.button67:setHint("Importar um Golpe");
    obj.button67:setName("button67");

    obj.button68 = GUI.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.layout13);
    obj.button68:setLeft(000);
    obj.button68:setTop(30);
    obj.button68:setWidth(20);
    obj.button68:setHeight(20);
    obj.button68:setText("E");
    obj.button68:setHint("Exportar o Golpe");
    obj.button68:setName("button68");

    obj.button69 = GUI.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.layout13);
    obj.button69:setLeft(000);
    obj.button69:setTop(55);
    obj.button69:setWidth(20);
    obj.button69:setHeight(20);
    obj.button69:setText("A");
    obj.button69:setHint("Apagar o Golpe");
    obj.button69:setName("button69");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout13);
    obj.label133:setLeft(25);
    obj.label133:setTop(5);
    obj.label133:setWidth(70);
    obj.label133:setHeight(25);
    obj.label133:setText("Golpe");
    obj.label133:setName("label133");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout13);
    obj.edit111:setVertTextAlign("center");
    obj.edit111:setLeft(90);
    obj.edit111:setTop(5);
    obj.edit111:setWidth(135);
    obj.edit111:setHeight(25);
    obj.edit111:setField("golpe12");
    obj.edit111:setName("edit111");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout13);
    obj.label134:setLeft(25);
    obj.label134:setTop(30);
    obj.label134:setWidth(80);
    obj.label134:setHeight(25);
    obj.label134:setText("Frequência");
    obj.label134:setName("label134");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout13);
    obj.edit112:setVertTextAlign("center");
    obj.edit112:setLeft(90);
    obj.edit112:setTop(30);
    obj.edit112:setWidth(135);
    obj.edit112:setHeight(25);
    obj.edit112:setField("frequencia12");
    obj.edit112:setName("edit112");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout13);
    obj.label135:setLeft(25);
    obj.label135:setTop(55);
    obj.label135:setWidth(70);
    obj.label135:setHeight(25);
    obj.label135:setText("Alcance");
    obj.label135:setName("label135");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout13);
    obj.edit113:setVertTextAlign("center");
    obj.edit113:setLeft(90);
    obj.edit113:setTop(55);
    obj.edit113:setWidth(135);
    obj.edit113:setHeight(25);
    obj.edit113:setField("alcance12");
    obj.edit113:setName("edit113");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout13);
    obj.label136:setLeft(235);
    obj.label136:setTop(6);
    obj.label136:setWidth(50);
    obj.label136:setHeight(25);
    obj.label136:setText("Tipo");
    obj.label136:setName("label136");

    obj.comboBox23 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout13);
    obj.comboBox23:setLeft(277);
    obj.comboBox23:setTop(6);
    obj.comboBox23:setWidth(87);
    obj.comboBox23:setHeight(25);
    obj.comboBox23:setField("tipo12");
    obj.comboBox23:setHorzTextAlign("leading");
    obj.comboBox23:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox23:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox23:setName("comboBox23");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout13);
    obj.label137:setLeft(235);
    obj.label137:setTop(31);
    obj.label137:setWidth(50);
    obj.label137:setHeight(25);
    obj.label137:setText("Classe");
    obj.label137:setName("label137");

    obj.comboBox24 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.layout13);
    obj.comboBox24:setLeft(277);
    obj.comboBox24:setTop(31);
    obj.comboBox24:setWidth(87);
    obj.comboBox24:setHeight(25);
    obj.comboBox24:setField("classe12");
    obj.comboBox24:setHorzTextAlign("leading");
    obj.comboBox24:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox24:setValues({'1', '2', '3'});
    obj.comboBox24:setName("comboBox24");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout13);
    obj.label138:setLeft(235);
    obj.label138:setTop(55);
    obj.label138:setWidth(50);
    obj.label138:setHeight(25);
    obj.label138:setText("AC");
    obj.label138:setName("label138");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout13);
    obj.edit114:setVertTextAlign("center");
    obj.edit114:setLeft(277);
    obj.edit114:setTop(55);
    obj.edit114:setWidth(87);
    obj.edit114:setHeight(25);
    obj.edit114:setField("AC12");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setName("edit114");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout13);
    obj.label139:setLeft(370);
    obj.label139:setTop(6);
    obj.label139:setWidth(70);
    obj.label139:setHeight(25);
    obj.label139:setText("Prec.Bôn.");
    obj.label139:setName("label139");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout13);
    obj.edit115:setVertTextAlign("center");
    obj.edit115:setLeft(443);
    obj.edit115:setTop(6);
    obj.edit115:setWidth(42);
    obj.edit115:setHeight(25);
    obj.edit115:setField("ataque12");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setName("edit115");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout13);
    obj.label140:setLeft(370);
    obj.label140:setTop(31);
    obj.label140:setWidth(70);
    obj.label140:setHeight(25);
    obj.label140:setText("Dano Base");
    obj.label140:setName("label140");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout13);
    obj.edit116:setVertTextAlign("center");
    obj.edit116:setLeft(443);
    obj.edit116:setTop(31);
    obj.edit116:setWidth(42);
    obj.edit116:setHeight(25);
    obj.edit116:setField("dano12");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setName("edit116");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout13);
    obj.label141:setLeft(370);
    obj.label141:setTop(55);
    obj.label141:setWidth(70);
    obj.label141:setHeight(25);
    obj.label141:setText("Dano Bôn.");
    obj.label141:setName("label141");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout13);
    obj.edit117:setVertTextAlign("center");
    obj.edit117:setLeft(443);
    obj.edit117:setTop(55);
    obj.edit117:setWidth(42);
    obj.edit117:setHeight(25);
    obj.edit117:setField("BonDMG12");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setName("edit117");

    obj.button70 = GUI.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.layout13);
    obj.button70:setLeft(488);
    obj.button70:setTop(6);
    obj.button70:setWidth(82);
    obj.button70:setText("Acerto");
    obj.button70:setFontSize(11);
    obj.button70:setName("button70");

    obj.button71 = GUI.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.layout13);
    obj.button71:setLeft(488);
    obj.button71:setTop(31);
    obj.button71:setWidth(82);
    obj.button71:setText("Dano");
    obj.button71:setFontSize(11);
    obj.button71:setName("button71");

    obj.button72 = GUI.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.layout13);
    obj.button72:setLeft(488);
    obj.button72:setTop(55);
    obj.button72:setWidth(82);
    obj.button72:setText("Crítico");
    obj.button72:setFontSize(11);
    obj.button72:setName("button72");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout13);
    obj.textEditor12:setLeft(575);
    obj.textEditor12:setTop(5);
    obj.textEditor12:setWidth(295);
    obj.textEditor12:setHeight(75);
    obj.textEditor12:setField("campoEfeitoGolpes12");
    obj.textEditor12:setName("textEditor12");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout13);
    obj.label142:setLeft(875);
    obj.label142:setTop(5);
    obj.label142:setWidth(80);
    obj.label142:setHeight(25);
    obj.label142:setText("Tipo(Co.)");
    obj.label142:setName("label142");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout13);
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setLeft(940);
    obj.edit118:setTop(5);
    obj.edit118:setWidth(120);
    obj.edit118:setHeight(25);
    obj.edit118:setField("tipoContest12");
    obj.edit118:setName("edit118");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout13);
    obj.label143:setLeft(875);
    obj.label143:setTop(30);
    obj.label143:setWidth(80);
    obj.label143:setHeight(25);
    obj.label143:setText("Efeito(Co.)");
    obj.label143:setName("label143");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout13);
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setLeft(940);
    obj.edit119:setTop(30);
    obj.edit119:setWidth(120);
    obj.edit119:setHeight(25);
    obj.edit119:setField("efeitoContest12");
    obj.edit119:setName("edit119");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout13);
    obj.label144:setLeft(875);
    obj.label144:setTop(55);
    obj.label144:setWidth(80);
    obj.label144:setHeight(25);
    obj.label144:setText("Especial");
    obj.label144:setName("label144");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout13);
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setLeft(940);
    obj.edit120:setTop(55);
    obj.edit120:setWidth(120);
    obj.edit120:setHeight(25);
    obj.edit120:setField("efeitoSpecial12");
    obj.edit120:setName("edit120");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout1);
    obj.layout14:setLeft(2);
    obj.layout14:setTop(1143);
    obj.layout14:setWidth(1207);
    obj.layout14:setHeight(92);
    obj.layout14:setName("layout14");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout14);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setName("rectangle14");

    obj.button73 = GUI.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.layout14);
    obj.button73:setLeft(000);
    obj.button73:setTop(5);
    obj.button73:setWidth(20);
    obj.button73:setHeight(20);
    obj.button73:setText("I");
    obj.button73:setHint("Importar um Golpe");
    obj.button73:setName("button73");

    obj.button74 = GUI.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.layout14);
    obj.button74:setLeft(000);
    obj.button74:setTop(30);
    obj.button74:setWidth(20);
    obj.button74:setHeight(20);
    obj.button74:setText("E");
    obj.button74:setHint("Exportar o Golpe");
    obj.button74:setName("button74");

    obj.button75 = GUI.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.layout14);
    obj.button75:setLeft(000);
    obj.button75:setTop(55);
    obj.button75:setWidth(20);
    obj.button75:setHeight(20);
    obj.button75:setText("A");
    obj.button75:setHint("Apagar o Golpe");
    obj.button75:setName("button75");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout14);
    obj.label145:setLeft(25);
    obj.label145:setTop(5);
    obj.label145:setWidth(70);
    obj.label145:setHeight(25);
    obj.label145:setText("Golpe");
    obj.label145:setName("label145");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout14);
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setLeft(90);
    obj.edit121:setTop(5);
    obj.edit121:setWidth(135);
    obj.edit121:setHeight(25);
    obj.edit121:setField("golpe13");
    obj.edit121:setName("edit121");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout14);
    obj.label146:setLeft(25);
    obj.label146:setTop(30);
    obj.label146:setWidth(80);
    obj.label146:setHeight(25);
    obj.label146:setText("Frequência");
    obj.label146:setName("label146");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout14);
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setLeft(90);
    obj.edit122:setTop(30);
    obj.edit122:setWidth(135);
    obj.edit122:setHeight(25);
    obj.edit122:setField("frequencia13");
    obj.edit122:setName("edit122");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout14);
    obj.label147:setLeft(25);
    obj.label147:setTop(55);
    obj.label147:setWidth(70);
    obj.label147:setHeight(25);
    obj.label147:setText("Alcance");
    obj.label147:setName("label147");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout14);
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setLeft(90);
    obj.edit123:setTop(55);
    obj.edit123:setWidth(135);
    obj.edit123:setHeight(25);
    obj.edit123:setField("alcance13");
    obj.edit123:setName("edit123");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout14);
    obj.label148:setLeft(235);
    obj.label148:setTop(6);
    obj.label148:setWidth(50);
    obj.label148:setHeight(25);
    obj.label148:setText("Tipo");
    obj.label148:setName("label148");

    obj.comboBox25 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.layout14);
    obj.comboBox25:setLeft(277);
    obj.comboBox25:setTop(6);
    obj.comboBox25:setWidth(87);
    obj.comboBox25:setHeight(25);
    obj.comboBox25:setField("tipo13");
    obj.comboBox25:setHorzTextAlign("leading");
    obj.comboBox25:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox25:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox25:setName("comboBox25");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout14);
    obj.label149:setLeft(235);
    obj.label149:setTop(31);
    obj.label149:setWidth(50);
    obj.label149:setHeight(25);
    obj.label149:setText("Classe");
    obj.label149:setName("label149");

    obj.comboBox26 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.layout14);
    obj.comboBox26:setLeft(277);
    obj.comboBox26:setTop(31);
    obj.comboBox26:setWidth(87);
    obj.comboBox26:setHeight(25);
    obj.comboBox26:setField("classe13");
    obj.comboBox26:setHorzTextAlign("leading");
    obj.comboBox26:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox26:setValues({'1', '2', '3'});
    obj.comboBox26:setName("comboBox26");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout14);
    obj.label150:setLeft(235);
    obj.label150:setTop(55);
    obj.label150:setWidth(50);
    obj.label150:setHeight(25);
    obj.label150:setText("AC");
    obj.label150:setName("label150");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout14);
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setLeft(277);
    obj.edit124:setTop(55);
    obj.edit124:setWidth(87);
    obj.edit124:setHeight(25);
    obj.edit124:setField("AC13");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setName("edit124");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout14);
    obj.label151:setLeft(370);
    obj.label151:setTop(6);
    obj.label151:setWidth(70);
    obj.label151:setHeight(25);
    obj.label151:setText("Prec.Bôn.");
    obj.label151:setName("label151");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout14);
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setLeft(443);
    obj.edit125:setTop(6);
    obj.edit125:setWidth(42);
    obj.edit125:setHeight(25);
    obj.edit125:setField("ataque13");
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setName("edit125");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout14);
    obj.label152:setLeft(370);
    obj.label152:setTop(31);
    obj.label152:setWidth(70);
    obj.label152:setHeight(25);
    obj.label152:setText("Dano Base");
    obj.label152:setName("label152");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout14);
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setLeft(443);
    obj.edit126:setTop(31);
    obj.edit126:setWidth(42);
    obj.edit126:setHeight(25);
    obj.edit126:setField("dano13");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setName("edit126");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout14);
    obj.label153:setLeft(370);
    obj.label153:setTop(55);
    obj.label153:setWidth(70);
    obj.label153:setHeight(25);
    obj.label153:setText("Dano Bôn.");
    obj.label153:setName("label153");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout14);
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setLeft(443);
    obj.edit127:setTop(55);
    obj.edit127:setWidth(42);
    obj.edit127:setHeight(25);
    obj.edit127:setField("BonDMG13");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setName("edit127");

    obj.button76 = GUI.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.layout14);
    obj.button76:setLeft(488);
    obj.button76:setTop(6);
    obj.button76:setWidth(82);
    obj.button76:setText("Acerto");
    obj.button76:setFontSize(11);
    obj.button76:setName("button76");

    obj.button77 = GUI.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.layout14);
    obj.button77:setLeft(488);
    obj.button77:setTop(31);
    obj.button77:setWidth(82);
    obj.button77:setText("Dano");
    obj.button77:setFontSize(11);
    obj.button77:setName("button77");

    obj.button78 = GUI.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.layout14);
    obj.button78:setLeft(488);
    obj.button78:setTop(55);
    obj.button78:setWidth(82);
    obj.button78:setText("Crítico");
    obj.button78:setFontSize(11);
    obj.button78:setName("button78");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout14);
    obj.textEditor13:setLeft(575);
    obj.textEditor13:setTop(5);
    obj.textEditor13:setWidth(295);
    obj.textEditor13:setHeight(75);
    obj.textEditor13:setField("campoEfeitoGolpes13");
    obj.textEditor13:setName("textEditor13");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout14);
    obj.label154:setLeft(875);
    obj.label154:setTop(5);
    obj.label154:setWidth(80);
    obj.label154:setHeight(25);
    obj.label154:setText("Tipo(Co.)");
    obj.label154:setName("label154");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout14);
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setLeft(940);
    obj.edit128:setTop(5);
    obj.edit128:setWidth(120);
    obj.edit128:setHeight(25);
    obj.edit128:setField("tipoContest13");
    obj.edit128:setName("edit128");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout14);
    obj.label155:setLeft(875);
    obj.label155:setTop(30);
    obj.label155:setWidth(80);
    obj.label155:setHeight(25);
    obj.label155:setText("Efeito(Co.)");
    obj.label155:setName("label155");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout14);
    obj.edit129:setVertTextAlign("center");
    obj.edit129:setLeft(940);
    obj.edit129:setTop(30);
    obj.edit129:setWidth(120);
    obj.edit129:setHeight(25);
    obj.edit129:setField("efeitoContest13");
    obj.edit129:setName("edit129");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout14);
    obj.label156:setLeft(875);
    obj.label156:setTop(55);
    obj.label156:setWidth(80);
    obj.label156:setHeight(25);
    obj.label156:setText("Especial");
    obj.label156:setName("label156");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout14);
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setLeft(940);
    obj.edit130:setTop(55);
    obj.edit130:setWidth(120);
    obj.edit130:setHeight(25);
    obj.edit130:setField("efeitoSpecial13");
    obj.edit130:setName("edit130");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout1);
    obj.layout15:setLeft(2);
    obj.layout15:setTop(1238);
    obj.layout15:setWidth(1207);
    obj.layout15:setHeight(92);
    obj.layout15:setName("layout15");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout15);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setName("rectangle15");

    obj.button79 = GUI.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.layout15);
    obj.button79:setLeft(000);
    obj.button79:setTop(5);
    obj.button79:setWidth(20);
    obj.button79:setHeight(20);
    obj.button79:setText("I");
    obj.button79:setHint("Importar um Golpe");
    obj.button79:setName("button79");

    obj.button80 = GUI.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.layout15);
    obj.button80:setLeft(000);
    obj.button80:setTop(30);
    obj.button80:setWidth(20);
    obj.button80:setHeight(20);
    obj.button80:setText("E");
    obj.button80:setHint("Exportar o Golpe");
    obj.button80:setName("button80");

    obj.button81 = GUI.fromHandle(_obj_newObject("button"));
    obj.button81:setParent(obj.layout15);
    obj.button81:setLeft(000);
    obj.button81:setTop(55);
    obj.button81:setWidth(20);
    obj.button81:setHeight(20);
    obj.button81:setText("A");
    obj.button81:setHint("Apagar o Golpe");
    obj.button81:setName("button81");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout15);
    obj.label157:setLeft(25);
    obj.label157:setTop(5);
    obj.label157:setWidth(70);
    obj.label157:setHeight(25);
    obj.label157:setText("Golpe");
    obj.label157:setName("label157");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout15);
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setLeft(90);
    obj.edit131:setTop(5);
    obj.edit131:setWidth(135);
    obj.edit131:setHeight(25);
    obj.edit131:setField("golpe14");
    obj.edit131:setName("edit131");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout15);
    obj.label158:setLeft(25);
    obj.label158:setTop(30);
    obj.label158:setWidth(80);
    obj.label158:setHeight(25);
    obj.label158:setText("Frequência");
    obj.label158:setName("label158");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout15);
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setLeft(90);
    obj.edit132:setTop(30);
    obj.edit132:setWidth(135);
    obj.edit132:setHeight(25);
    obj.edit132:setField("frequencia14");
    obj.edit132:setName("edit132");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout15);
    obj.label159:setLeft(25);
    obj.label159:setTop(55);
    obj.label159:setWidth(70);
    obj.label159:setHeight(25);
    obj.label159:setText("Alcance");
    obj.label159:setName("label159");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout15);
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setLeft(90);
    obj.edit133:setTop(55);
    obj.edit133:setWidth(135);
    obj.edit133:setHeight(25);
    obj.edit133:setField("alcance14");
    obj.edit133:setName("edit133");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout15);
    obj.label160:setLeft(235);
    obj.label160:setTop(6);
    obj.label160:setWidth(50);
    obj.label160:setHeight(25);
    obj.label160:setText("Tipo");
    obj.label160:setName("label160");

    obj.comboBox27 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.layout15);
    obj.comboBox27:setLeft(277);
    obj.comboBox27:setTop(6);
    obj.comboBox27:setWidth(87);
    obj.comboBox27:setHeight(25);
    obj.comboBox27:setField("tipo14");
    obj.comboBox27:setHorzTextAlign("leading");
    obj.comboBox27:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox27:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox27:setName("comboBox27");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout15);
    obj.label161:setLeft(235);
    obj.label161:setTop(31);
    obj.label161:setWidth(50);
    obj.label161:setHeight(25);
    obj.label161:setText("Classe");
    obj.label161:setName("label161");

    obj.comboBox28 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.layout15);
    obj.comboBox28:setLeft(277);
    obj.comboBox28:setTop(31);
    obj.comboBox28:setWidth(87);
    obj.comboBox28:setHeight(25);
    obj.comboBox28:setField("classe14");
    obj.comboBox28:setHorzTextAlign("leading");
    obj.comboBox28:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox28:setValues({'1', '2', '3'});
    obj.comboBox28:setName("comboBox28");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout15);
    obj.label162:setLeft(235);
    obj.label162:setTop(55);
    obj.label162:setWidth(50);
    obj.label162:setHeight(25);
    obj.label162:setText("AC");
    obj.label162:setName("label162");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout15);
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setLeft(277);
    obj.edit134:setTop(55);
    obj.edit134:setWidth(87);
    obj.edit134:setHeight(25);
    obj.edit134:setField("AC14");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setName("edit134");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout15);
    obj.label163:setLeft(370);
    obj.label163:setTop(6);
    obj.label163:setWidth(70);
    obj.label163:setHeight(25);
    obj.label163:setText("Prec.Bôn.");
    obj.label163:setName("label163");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout15);
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setLeft(443);
    obj.edit135:setTop(6);
    obj.edit135:setWidth(42);
    obj.edit135:setHeight(25);
    obj.edit135:setField("ataque14");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setName("edit135");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout15);
    obj.label164:setLeft(370);
    obj.label164:setTop(31);
    obj.label164:setWidth(70);
    obj.label164:setHeight(25);
    obj.label164:setText("Dano Base");
    obj.label164:setName("label164");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout15);
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setLeft(443);
    obj.edit136:setTop(31);
    obj.edit136:setWidth(42);
    obj.edit136:setHeight(25);
    obj.edit136:setField("dano14");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setName("edit136");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout15);
    obj.label165:setLeft(370);
    obj.label165:setTop(55);
    obj.label165:setWidth(70);
    obj.label165:setHeight(25);
    obj.label165:setText("Dano Bôn.");
    obj.label165:setName("label165");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout15);
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setLeft(443);
    obj.edit137:setTop(55);
    obj.edit137:setWidth(42);
    obj.edit137:setHeight(25);
    obj.edit137:setField("BonDMG14");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setName("edit137");

    obj.button82 = GUI.fromHandle(_obj_newObject("button"));
    obj.button82:setParent(obj.layout15);
    obj.button82:setLeft(488);
    obj.button82:setTop(6);
    obj.button82:setWidth(82);
    obj.button82:setText("Acerto");
    obj.button82:setFontSize(11);
    obj.button82:setName("button82");

    obj.button83 = GUI.fromHandle(_obj_newObject("button"));
    obj.button83:setParent(obj.layout15);
    obj.button83:setLeft(488);
    obj.button83:setTop(31);
    obj.button83:setWidth(82);
    obj.button83:setText("Dano");
    obj.button83:setFontSize(11);
    obj.button83:setName("button83");

    obj.button84 = GUI.fromHandle(_obj_newObject("button"));
    obj.button84:setParent(obj.layout15);
    obj.button84:setLeft(488);
    obj.button84:setTop(55);
    obj.button84:setWidth(82);
    obj.button84:setText("Crítico");
    obj.button84:setFontSize(11);
    obj.button84:setName("button84");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout15);
    obj.textEditor14:setLeft(575);
    obj.textEditor14:setTop(5);
    obj.textEditor14:setWidth(295);
    obj.textEditor14:setHeight(75);
    obj.textEditor14:setField("campoEfeitoGolpes14");
    obj.textEditor14:setName("textEditor14");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout15);
    obj.label166:setLeft(875);
    obj.label166:setTop(5);
    obj.label166:setWidth(80);
    obj.label166:setHeight(25);
    obj.label166:setText("Tipo(Co.)");
    obj.label166:setName("label166");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout15);
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setLeft(940);
    obj.edit138:setTop(5);
    obj.edit138:setWidth(120);
    obj.edit138:setHeight(25);
    obj.edit138:setField("tipoContest14");
    obj.edit138:setName("edit138");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout15);
    obj.label167:setLeft(875);
    obj.label167:setTop(30);
    obj.label167:setWidth(80);
    obj.label167:setHeight(25);
    obj.label167:setText("Efeito(Co.)");
    obj.label167:setName("label167");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout15);
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setLeft(940);
    obj.edit139:setTop(30);
    obj.edit139:setWidth(120);
    obj.edit139:setHeight(25);
    obj.edit139:setField("efeitoContest14");
    obj.edit139:setName("edit139");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout15);
    obj.label168:setLeft(875);
    obj.label168:setTop(55);
    obj.label168:setWidth(80);
    obj.label168:setHeight(25);
    obj.label168:setText("Especial");
    obj.label168:setName("label168");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout15);
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setLeft(940);
    obj.edit140:setTop(55);
    obj.edit140:setWidth(120);
    obj.edit140:setHeight(25);
    obj.edit140:setField("efeitoSpecial14");
    obj.edit140:setName("edit140");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout1);
    obj.layout16:setLeft(2);
    obj.layout16:setTop(1333);
    obj.layout16:setWidth(1207);
    obj.layout16:setHeight(92);
    obj.layout16:setName("layout16");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout16);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("black");
    obj.rectangle16:setName("rectangle16");

    obj.button85 = GUI.fromHandle(_obj_newObject("button"));
    obj.button85:setParent(obj.layout16);
    obj.button85:setLeft(000);
    obj.button85:setTop(5);
    obj.button85:setWidth(20);
    obj.button85:setHeight(20);
    obj.button85:setText("I");
    obj.button85:setHint("Importar um Golpe");
    obj.button85:setName("button85");

    obj.button86 = GUI.fromHandle(_obj_newObject("button"));
    obj.button86:setParent(obj.layout16);
    obj.button86:setLeft(000);
    obj.button86:setTop(30);
    obj.button86:setWidth(20);
    obj.button86:setHeight(20);
    obj.button86:setText("E");
    obj.button86:setHint("Exportar o Golpe");
    obj.button86:setName("button86");

    obj.button87 = GUI.fromHandle(_obj_newObject("button"));
    obj.button87:setParent(obj.layout16);
    obj.button87:setLeft(000);
    obj.button87:setTop(55);
    obj.button87:setWidth(20);
    obj.button87:setHeight(20);
    obj.button87:setText("A");
    obj.button87:setHint("Apagar o Golpe");
    obj.button87:setName("button87");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout16);
    obj.label169:setLeft(25);
    obj.label169:setTop(5);
    obj.label169:setWidth(70);
    obj.label169:setHeight(25);
    obj.label169:setText("Golpe");
    obj.label169:setName("label169");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout16);
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setLeft(90);
    obj.edit141:setTop(5);
    obj.edit141:setWidth(135);
    obj.edit141:setHeight(25);
    obj.edit141:setField("golpe15");
    obj.edit141:setName("edit141");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout16);
    obj.label170:setLeft(25);
    obj.label170:setTop(30);
    obj.label170:setWidth(80);
    obj.label170:setHeight(25);
    obj.label170:setText("Frequência");
    obj.label170:setName("label170");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout16);
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setLeft(90);
    obj.edit142:setTop(30);
    obj.edit142:setWidth(135);
    obj.edit142:setHeight(25);
    obj.edit142:setField("frequencia15");
    obj.edit142:setName("edit142");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout16);
    obj.label171:setLeft(25);
    obj.label171:setTop(55);
    obj.label171:setWidth(70);
    obj.label171:setHeight(25);
    obj.label171:setText("Alcance");
    obj.label171:setName("label171");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout16);
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setLeft(90);
    obj.edit143:setTop(55);
    obj.edit143:setWidth(135);
    obj.edit143:setHeight(25);
    obj.edit143:setField("alcance15");
    obj.edit143:setName("edit143");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout16);
    obj.label172:setLeft(235);
    obj.label172:setTop(6);
    obj.label172:setWidth(50);
    obj.label172:setHeight(25);
    obj.label172:setText("Tipo");
    obj.label172:setName("label172");

    obj.comboBox29 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.layout16);
    obj.comboBox29:setLeft(277);
    obj.comboBox29:setTop(6);
    obj.comboBox29:setWidth(87);
    obj.comboBox29:setHeight(25);
    obj.comboBox29:setField("tipo15");
    obj.comboBox29:setHorzTextAlign("leading");
    obj.comboBox29:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox29:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox29:setName("comboBox29");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout16);
    obj.label173:setLeft(235);
    obj.label173:setTop(31);
    obj.label173:setWidth(50);
    obj.label173:setHeight(25);
    obj.label173:setText("Classe");
    obj.label173:setName("label173");

    obj.comboBox30 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox30:setParent(obj.layout16);
    obj.comboBox30:setLeft(277);
    obj.comboBox30:setTop(31);
    obj.comboBox30:setWidth(87);
    obj.comboBox30:setHeight(25);
    obj.comboBox30:setField("classe15");
    obj.comboBox30:setHorzTextAlign("leading");
    obj.comboBox30:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox30:setValues({'1', '2', '3'});
    obj.comboBox30:setName("comboBox30");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout16);
    obj.label174:setLeft(235);
    obj.label174:setTop(55);
    obj.label174:setWidth(50);
    obj.label174:setHeight(25);
    obj.label174:setText("AC");
    obj.label174:setName("label174");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout16);
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setLeft(277);
    obj.edit144:setTop(55);
    obj.edit144:setWidth(87);
    obj.edit144:setHeight(25);
    obj.edit144:setField("AC15");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setName("edit144");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout16);
    obj.label175:setLeft(370);
    obj.label175:setTop(6);
    obj.label175:setWidth(70);
    obj.label175:setHeight(25);
    obj.label175:setText("Prec.Bôn.");
    obj.label175:setName("label175");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout16);
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setLeft(443);
    obj.edit145:setTop(6);
    obj.edit145:setWidth(42);
    obj.edit145:setHeight(25);
    obj.edit145:setField("ataque15");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setName("edit145");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout16);
    obj.label176:setLeft(370);
    obj.label176:setTop(31);
    obj.label176:setWidth(70);
    obj.label176:setHeight(25);
    obj.label176:setText("Dano Base");
    obj.label176:setName("label176");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout16);
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setLeft(443);
    obj.edit146:setTop(31);
    obj.edit146:setWidth(42);
    obj.edit146:setHeight(25);
    obj.edit146:setField("dano15");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setName("edit146");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout16);
    obj.label177:setLeft(370);
    obj.label177:setTop(55);
    obj.label177:setWidth(70);
    obj.label177:setHeight(25);
    obj.label177:setText("Dano Bôn.");
    obj.label177:setName("label177");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout16);
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setLeft(443);
    obj.edit147:setTop(55);
    obj.edit147:setWidth(42);
    obj.edit147:setHeight(25);
    obj.edit147:setField("BonDMG15");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setName("edit147");

    obj.button88 = GUI.fromHandle(_obj_newObject("button"));
    obj.button88:setParent(obj.layout16);
    obj.button88:setLeft(488);
    obj.button88:setTop(6);
    obj.button88:setWidth(82);
    obj.button88:setText("Acerto");
    obj.button88:setFontSize(11);
    obj.button88:setName("button88");

    obj.button89 = GUI.fromHandle(_obj_newObject("button"));
    obj.button89:setParent(obj.layout16);
    obj.button89:setLeft(488);
    obj.button89:setTop(31);
    obj.button89:setWidth(82);
    obj.button89:setText("Dano");
    obj.button89:setFontSize(11);
    obj.button89:setName("button89");

    obj.button90 = GUI.fromHandle(_obj_newObject("button"));
    obj.button90:setParent(obj.layout16);
    obj.button90:setLeft(488);
    obj.button90:setTop(55);
    obj.button90:setWidth(82);
    obj.button90:setText("Crítico");
    obj.button90:setFontSize(11);
    obj.button90:setName("button90");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout16);
    obj.textEditor15:setLeft(575);
    obj.textEditor15:setTop(5);
    obj.textEditor15:setWidth(295);
    obj.textEditor15:setHeight(75);
    obj.textEditor15:setField("campoEfeitoGolpes15");
    obj.textEditor15:setName("textEditor15");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout16);
    obj.label178:setLeft(875);
    obj.label178:setTop(5);
    obj.label178:setWidth(80);
    obj.label178:setHeight(25);
    obj.label178:setText("Tipo(Co.)");
    obj.label178:setName("label178");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout16);
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setLeft(940);
    obj.edit148:setTop(5);
    obj.edit148:setWidth(120);
    obj.edit148:setHeight(25);
    obj.edit148:setField("tipoContest15");
    obj.edit148:setName("edit148");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout16);
    obj.label179:setLeft(875);
    obj.label179:setTop(30);
    obj.label179:setWidth(80);
    obj.label179:setHeight(25);
    obj.label179:setText("Efeito(Co.)");
    obj.label179:setName("label179");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout16);
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setLeft(940);
    obj.edit149:setTop(30);
    obj.edit149:setWidth(120);
    obj.edit149:setHeight(25);
    obj.edit149:setField("efeitoContest15");
    obj.edit149:setName("edit149");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout16);
    obj.label180:setLeft(875);
    obj.label180:setTop(55);
    obj.label180:setWidth(80);
    obj.label180:setHeight(25);
    obj.label180:setText("Especial");
    obj.label180:setName("label180");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout16);
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setLeft(940);
    obj.edit150:setTop(55);
    obj.edit150:setWidth(120);
    obj.edit150:setHeight(25);
    obj.edit150:setField("efeitoSpecial15");
    obj.edit150:setName("edit150");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout1);
    obj.layout17:setLeft(2);
    obj.layout17:setTop(1428);
    obj.layout17:setWidth(1207);
    obj.layout17:setHeight(92);
    obj.layout17:setName("layout17");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout17);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("black");
    obj.rectangle17:setName("rectangle17");

    obj.button91 = GUI.fromHandle(_obj_newObject("button"));
    obj.button91:setParent(obj.layout17);
    obj.button91:setLeft(000);
    obj.button91:setTop(5);
    obj.button91:setWidth(20);
    obj.button91:setHeight(20);
    obj.button91:setText("I");
    obj.button91:setHint("Importar um Golpe");
    obj.button91:setName("button91");

    obj.button92 = GUI.fromHandle(_obj_newObject("button"));
    obj.button92:setParent(obj.layout17);
    obj.button92:setLeft(000);
    obj.button92:setTop(30);
    obj.button92:setWidth(20);
    obj.button92:setHeight(20);
    obj.button92:setText("E");
    obj.button92:setHint("Exportar o Golpe");
    obj.button92:setName("button92");

    obj.button93 = GUI.fromHandle(_obj_newObject("button"));
    obj.button93:setParent(obj.layout17);
    obj.button93:setLeft(000);
    obj.button93:setTop(55);
    obj.button93:setWidth(20);
    obj.button93:setHeight(20);
    obj.button93:setText("A");
    obj.button93:setHint("Apagar o Golpe");
    obj.button93:setName("button93");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout17);
    obj.label181:setLeft(25);
    obj.label181:setTop(5);
    obj.label181:setWidth(70);
    obj.label181:setHeight(25);
    obj.label181:setText("Golpe");
    obj.label181:setName("label181");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout17);
    obj.edit151:setVertTextAlign("center");
    obj.edit151:setLeft(90);
    obj.edit151:setTop(5);
    obj.edit151:setWidth(135);
    obj.edit151:setHeight(25);
    obj.edit151:setField("golpe16");
    obj.edit151:setName("edit151");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout17);
    obj.label182:setLeft(25);
    obj.label182:setTop(30);
    obj.label182:setWidth(80);
    obj.label182:setHeight(25);
    obj.label182:setText("Frequência");
    obj.label182:setName("label182");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout17);
    obj.edit152:setVertTextAlign("center");
    obj.edit152:setLeft(90);
    obj.edit152:setTop(30);
    obj.edit152:setWidth(135);
    obj.edit152:setHeight(25);
    obj.edit152:setField("frequencia16");
    obj.edit152:setName("edit152");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout17);
    obj.label183:setLeft(25);
    obj.label183:setTop(55);
    obj.label183:setWidth(70);
    obj.label183:setHeight(25);
    obj.label183:setText("Alcance");
    obj.label183:setName("label183");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout17);
    obj.edit153:setVertTextAlign("center");
    obj.edit153:setLeft(90);
    obj.edit153:setTop(55);
    obj.edit153:setWidth(135);
    obj.edit153:setHeight(25);
    obj.edit153:setField("alcance16");
    obj.edit153:setName("edit153");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout17);
    obj.label184:setLeft(235);
    obj.label184:setTop(6);
    obj.label184:setWidth(50);
    obj.label184:setHeight(25);
    obj.label184:setText("Tipo");
    obj.label184:setName("label184");

    obj.comboBox31 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox31:setParent(obj.layout17);
    obj.comboBox31:setLeft(277);
    obj.comboBox31:setTop(6);
    obj.comboBox31:setWidth(87);
    obj.comboBox31:setHeight(25);
    obj.comboBox31:setField("tipo16");
    obj.comboBox31:setHorzTextAlign("leading");
    obj.comboBox31:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox31:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox31:setName("comboBox31");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout17);
    obj.label185:setLeft(235);
    obj.label185:setTop(31);
    obj.label185:setWidth(50);
    obj.label185:setHeight(25);
    obj.label185:setText("Classe");
    obj.label185:setName("label185");

    obj.comboBox32 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox32:setParent(obj.layout17);
    obj.comboBox32:setLeft(277);
    obj.comboBox32:setTop(31);
    obj.comboBox32:setWidth(87);
    obj.comboBox32:setHeight(25);
    obj.comboBox32:setField("classe16");
    obj.comboBox32:setHorzTextAlign("leading");
    obj.comboBox32:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox32:setValues({'1', '2', '3'});
    obj.comboBox32:setName("comboBox32");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout17);
    obj.label186:setLeft(235);
    obj.label186:setTop(55);
    obj.label186:setWidth(50);
    obj.label186:setHeight(25);
    obj.label186:setText("AC");
    obj.label186:setName("label186");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout17);
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setLeft(277);
    obj.edit154:setTop(55);
    obj.edit154:setWidth(87);
    obj.edit154:setHeight(25);
    obj.edit154:setField("AC16");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setName("edit154");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout17);
    obj.label187:setLeft(370);
    obj.label187:setTop(6);
    obj.label187:setWidth(70);
    obj.label187:setHeight(25);
    obj.label187:setText("Prec.Bôn.");
    obj.label187:setName("label187");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout17);
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setLeft(443);
    obj.edit155:setTop(6);
    obj.edit155:setWidth(42);
    obj.edit155:setHeight(25);
    obj.edit155:setField("ataque16");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setName("edit155");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout17);
    obj.label188:setLeft(370);
    obj.label188:setTop(31);
    obj.label188:setWidth(70);
    obj.label188:setHeight(25);
    obj.label188:setText("Dano Base");
    obj.label188:setName("label188");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout17);
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setLeft(443);
    obj.edit156:setTop(31);
    obj.edit156:setWidth(42);
    obj.edit156:setHeight(25);
    obj.edit156:setField("dano16");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setName("edit156");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout17);
    obj.label189:setLeft(370);
    obj.label189:setTop(55);
    obj.label189:setWidth(70);
    obj.label189:setHeight(25);
    obj.label189:setText("Dano Bôn.");
    obj.label189:setName("label189");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout17);
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setLeft(443);
    obj.edit157:setTop(55);
    obj.edit157:setWidth(42);
    obj.edit157:setHeight(25);
    obj.edit157:setField("BonDMG16");
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setName("edit157");

    obj.button94 = GUI.fromHandle(_obj_newObject("button"));
    obj.button94:setParent(obj.layout17);
    obj.button94:setLeft(488);
    obj.button94:setTop(6);
    obj.button94:setWidth(82);
    obj.button94:setText("Acerto");
    obj.button94:setFontSize(11);
    obj.button94:setName("button94");

    obj.button95 = GUI.fromHandle(_obj_newObject("button"));
    obj.button95:setParent(obj.layout17);
    obj.button95:setLeft(488);
    obj.button95:setTop(31);
    obj.button95:setWidth(82);
    obj.button95:setText("Dano");
    obj.button95:setFontSize(11);
    obj.button95:setName("button95");

    obj.button96 = GUI.fromHandle(_obj_newObject("button"));
    obj.button96:setParent(obj.layout17);
    obj.button96:setLeft(488);
    obj.button96:setTop(55);
    obj.button96:setWidth(82);
    obj.button96:setText("Crítico");
    obj.button96:setFontSize(11);
    obj.button96:setName("button96");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout17);
    obj.textEditor16:setLeft(575);
    obj.textEditor16:setTop(5);
    obj.textEditor16:setWidth(295);
    obj.textEditor16:setHeight(75);
    obj.textEditor16:setField("campoEfeitoGolpes16");
    obj.textEditor16:setName("textEditor16");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout17);
    obj.label190:setLeft(875);
    obj.label190:setTop(5);
    obj.label190:setWidth(80);
    obj.label190:setHeight(25);
    obj.label190:setText("Tipo(Co.)");
    obj.label190:setName("label190");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout17);
    obj.edit158:setVertTextAlign("center");
    obj.edit158:setLeft(940);
    obj.edit158:setTop(5);
    obj.edit158:setWidth(120);
    obj.edit158:setHeight(25);
    obj.edit158:setField("tipoContest16");
    obj.edit158:setName("edit158");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout17);
    obj.label191:setLeft(875);
    obj.label191:setTop(30);
    obj.label191:setWidth(80);
    obj.label191:setHeight(25);
    obj.label191:setText("Efeito(Co.)");
    obj.label191:setName("label191");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout17);
    obj.edit159:setVertTextAlign("center");
    obj.edit159:setLeft(940);
    obj.edit159:setTop(30);
    obj.edit159:setWidth(120);
    obj.edit159:setHeight(25);
    obj.edit159:setField("efeitoContest16");
    obj.edit159:setName("edit159");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout17);
    obj.label192:setLeft(875);
    obj.label192:setTop(55);
    obj.label192:setWidth(80);
    obj.label192:setHeight(25);
    obj.label192:setText("Especial");
    obj.label192:setName("label192");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout17);
    obj.edit160:setVertTextAlign("center");
    obj.edit160:setLeft(940);
    obj.edit160:setTop(55);
    obj.edit160:setWidth(120);
    obj.edit160:setHeight(25);
    obj.edit160:setField("efeitoSpecial16");
    obj.edit160:setName("edit160");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe1 = import[1];
            						sheet.frequencia1 = import[2];
            						sheet.alcance1 = import[3];
            						sheet.tipo1 = import[4];
            						sheet.classe1 = import[5];
            						sheet.AC1 = import[6];
            						sheet.ataque1 = import[7];
            						sheet.dano1 = import[8];
            						sheet.BonDMG1 = import[9];
            						sheet.campoEfeitoGolpes1 = import[10];
            						sheet.tipoContest1 = import[11];
            						sheet.efeitoContest1 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe1, sheet.frequencia1, sheet.alcance1, sheet.tipo1, sheet.classe1, sheet.AC1, sheet.ataque1, sheet.dano1, sheet.BonDMG1, sheet.campoEfeitoGolpes1, sheet.tipoContest1, sheet.efeitoContest1};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            sheet.golpe1 = nil;
            				sheet.frequencia1 = nil;
            				sheet.alcance1 = nil;
            				sheet.tipo1 = nil;
            				sheet.classe1 = nil;
            				sheet.AC1 = nil;
            				sheet.ataque1 = nil;
            				sheet.dano1 = nil;
            				sheet.BonDMG1 = nil;
            				sheet.campoEfeitoGolpes1 = nil;
            				sheet.tipoContest1 = nil;
            				sheet.efeitoContest1 = nil;
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque1) or 0;
            					local NomeGolpe = sheet.golpe1 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC1) or "N/A"
            					local TipoG = tonumber(sheet.tipo1) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe1) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe1 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo1) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano1) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe1) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG1 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe1 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo1) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano1) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe1) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG1 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe2 = import[1];
            						sheet.frequencia2 = import[2];
            						sheet.alcance2 = import[3];
            						sheet.tipo2 = import[4];
            						sheet.classe2 = import[5];
            						sheet.AC2 = import[6];
            						sheet.ataque2 = import[7];
            						sheet.dano2 = import[8];
            						sheet.BonDMG2 = import[9];
            						sheet.campoEfeitoGolpes2 = import[10];
            						sheet.tipoContest2 = import[11];
            						sheet.efeitoContest2 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe2, sheet.frequencia2, sheet.alcance2, sheet.tipo2, sheet.classe2, sheet.AC2, sheet.ataque2, sheet.dano2, sheet.BonDMG2, sheet.campoEfeitoGolpes2, sheet.tipoContest2, sheet.efeitoContest2};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (_)
            sheet.golpe2 = nil;
            				sheet.frequencia2 = nil;
            				sheet.alcance2 = nil;
            				sheet.tipo2 = nil;
            				sheet.classe2 = nil;
            				sheet.AC2 = nil;
            				sheet.ataque2 = nil;
            				sheet.dano2 = nil;
            				sheet.BonDMG2 = nil;
            				sheet.campoEfeitoGolpes2 = nil;
            				sheet.tipoContest2 = nil;
            				sheet.efeitoContest2 = nil;
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque2) or 0;
            					local NomeGolpe = sheet.golpe2 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC2) or "N/A"
            					local TipoG = tonumber(sheet.tipo2) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe2) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe2 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo2) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano2) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe2) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG2 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe2 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo2) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano2) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe2) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG2 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe3 = import[1];
            						sheet.frequencia3 = import[2];
            						sheet.alcance3 = import[3];
            						sheet.tipo3 = import[4];
            						sheet.classe3 = import[5];
            						sheet.AC3 = import[6];
            						sheet.ataque3 = import[7];
            						sheet.dano3 = import[8];
            						sheet.BonDMG3 = import[9];
            						sheet.campoEfeitoGolpes3 = import[10];
            						sheet.tipoContest3 = import[11];
            						sheet.efeitoContest3 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe3, sheet.frequencia3, sheet.alcance3, sheet.tipo3, sheet.classe3, sheet.AC3, sheet.ataque3, sheet.dano3, sheet.BonDMG3, sheet.campoEfeitoGolpes3, sheet.tipoContest3, sheet.efeitoContest3};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (_)
            sheet.golpe3 = nil;
            				sheet.frequencia3 = nil;
            				sheet.alcance3 = nil;
            				sheet.tipo3 = nil;
            				sheet.classe3 = nil;
            				sheet.AC3 = nil;
            				sheet.ataque3 = nil;
            				sheet.dano3 = nil;
            				sheet.BonDMG3 = nil;
            				sheet.campoEfeitoGolpes3 = nil;
            				sheet.tipoContest3 = nil;
            				sheet.efeitoContest3 = nil;
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque3) or 0;
            					local NomeGolpe = sheet.golpe3 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC3) or "N/A"
            					local TipoG = tonumber(sheet.tipo3) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe3) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe3 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo3) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano3) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe3) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG3 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe3 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo3) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano3) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe3) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG3 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe4 = import[1];
            						sheet.frequencia4 = import[2];
            						sheet.alcance4 = import[3];
            						sheet.tipo4 = import[4];
            						sheet.classe4 = import[5];
            						sheet.AC4 = import[6];
            						sheet.ataque4 = import[7];
            						sheet.dano4 = import[8];
            						sheet.BonDMG4 = import[9];
            						sheet.campoEfeitoGolpes4 = import[10];
            						sheet.tipoContest4 = import[11];
            						sheet.efeitoContest4 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe4, sheet.frequencia4, sheet.alcance4, sheet.tipo4, sheet.classe4, sheet.AC4, sheet.ataque4, sheet.dano4, sheet.BonDMG4, sheet.campoEfeitoGolpes4, sheet.tipoContest4, sheet.efeitoContest4};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (_)
            sheet.golpe4 = nil;
            				sheet.frequencia4 = nil;
            				sheet.alcance4 = nil;
            				sheet.tipo4 = nil;
            				sheet.classe4 = nil;
            				sheet.AC4 = nil;
            				sheet.ataque4 = nil;
            				sheet.dano4 = nil;
            				sheet.BonDMG4 = nil;
            				sheet.campoEfeitoGolpes4 = nil;
            				sheet.tipoContest4 = nil;
            				sheet.efeitoContest4 = nil;
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque4) or 0;
            					local NomeGolpe = sheet.golpe4 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC4) or "N/A"
            					local TipoG = tonumber(sheet.tipo4) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe4) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe4 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo4) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano4) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe4) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG4 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event23 = obj.button24:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe4 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo4) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano4) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe4) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG4 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event24 = obj.button25:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe5 = import[1];
            						sheet.frequencia5 = import[2];
            						sheet.alcance5 = import[3];
            						sheet.tipo5 = import[4];
            						sheet.classe5 = import[5];
            						sheet.AC5 = import[6];
            						sheet.ataque5 = import[7];
            						sheet.dano5 = import[8];
            						sheet.BonDMG5 = import[9];
            						sheet.campoEfeitoGolpes5 = import[10];
            						sheet.tipoContest5 = import[11];
            						sheet.efeitoContest5 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event25 = obj.button26:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe5, sheet.frequencia5, sheet.alcance5, sheet.tipo5, sheet.classe5, sheet.AC5, sheet.ataque5, sheet.dano5, sheet.BonDMG5, sheet.campoEfeitoGolpes5, sheet.tipoContest5, sheet.efeitoContest5};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event26 = obj.button27:addEventListener("onClick",
        function (_)
            sheet.golpe5 = nil;
            				sheet.frequencia5 = nil;
            				sheet.alcance5 = nil;
            				sheet.tipo5 = nil;
            				sheet.classe5 = nil;
            				sheet.AC5 = nil;
            				sheet.ataque5 = nil;
            				sheet.dano5 = nil;
            				sheet.BonDMG5 = nil;
            				sheet.campoEfeitoGolpes5 = nil;
            				sheet.tipoContest5 = nil;
            				sheet.efeitoContest5 = nil;
        end, obj);

    obj._e_event27 = obj.button28:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque5) or 0;
            					local NomeGolpe = sheet.golpe5 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC5) or "N/A"
            					local TipoG = tonumber(sheet.tipo5) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe5) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event28 = obj.button29:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe5 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo5) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano5) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe5) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG5 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event29 = obj.button30:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe5 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo5) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano5) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe5) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG5 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event30 = obj.button31:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe6 = import[1];
            						sheet.frequencia6 = import[2];
            						sheet.alcance6 = import[3];
            						sheet.tipo6 = import[4];
            						sheet.classe6 = import[5];
            						sheet.AC6 = import[6];
            						sheet.ataque6 = import[7];
            						sheet.dano6 = import[8];
            						sheet.BonDMG6 = import[9];
            						sheet.campoEfeitoGolpes6 = import[10];
            						sheet.tipoContest6 = import[11];
            						sheet.efeitoContest6 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event31 = obj.button32:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe6, sheet.frequencia6, sheet.alcance6, sheet.tipo6, sheet.classe6, sheet.AC6, sheet.ataque6, sheet.dano6, sheet.BonDMG6, sheet.campoEfeitoGolpes6, sheet.tipoContest6, sheet.efeitoContest6};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event32 = obj.button33:addEventListener("onClick",
        function (_)
            sheet.golpe6 = nil;
            				sheet.frequencia6 = nil;
            				sheet.alcance6 = nil;
            				sheet.tipo6 = nil;
            				sheet.classe6 = nil;
            				sheet.AC6 = nil;
            				sheet.ataque6 = nil;
            				sheet.dano6 = nil;
            				sheet.BonDMG6 = nil;
            				sheet.campoEfeitoGolpes6 = nil;
            				sheet.tipoContest6 = nil;
            				sheet.efeitoContest6 = nil;
        end, obj);

    obj._e_event33 = obj.button34:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque6) or 0;
            					local NomeGolpe = sheet.golpe6 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC6) or "N/A"
            					local TipoG = tonumber(sheet.tipo6) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe6) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event34 = obj.button35:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe6 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo6) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano6) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe6) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG6 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event35 = obj.button36:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe6 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo6) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano6) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe6) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG6 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event36 = obj.button37:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe7 = import[1];
            						sheet.frequencia7 = import[2];
            						sheet.alcance7 = import[3];
            						sheet.tipo7 = import[4];
            						sheet.classe7 = import[5];
            						sheet.AC7 = import[6];
            						sheet.ataque7 = import[7];
            						sheet.dano7 = import[8];
            						sheet.BonDMG7 = import[9];
            						sheet.campoEfeitoGolpes7 = import[10];
            						sheet.tipoContest7 = import[11];
            						sheet.efeitoContest7 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event37 = obj.button38:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe7, sheet.frequencia7, sheet.alcance7, sheet.tipo7, sheet.classe7, sheet.AC7, sheet.ataque7, sheet.dano7, sheet.BonDMG7, sheet.campoEfeitoGolpes7, sheet.tipoContest7, sheet.efeitoContest7};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event38 = obj.button39:addEventListener("onClick",
        function (_)
            sheet.golpe7 = nil;
            				sheet.frequencia7 = nil;
            				sheet.alcance7 = nil;
            				sheet.tipo7 = nil;
            				sheet.classe7 = nil;
            				sheet.AC7 = nil;
            				sheet.ataque7 = nil;
            				sheet.dano7 = nil;
            				sheet.BonDMG7 = nil;
            				sheet.campoEfeitoGolpes7 = nil;
            				sheet.tipoContest7 = nil;
            				sheet.efeitoContest7 = nil;
        end, obj);

    obj._e_event39 = obj.button40:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque7) or 0;
            					local NomeGolpe = sheet.golpe7 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC7) or "N/A"
            					local TipoG = tonumber(sheet.tipo7) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe7) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event40 = obj.button41:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe7 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo7) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano7) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe7) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG7 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event41 = obj.button42:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe7 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo7) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano7) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe7) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG7 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event42 = obj.button43:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe8 = import[1];
            						sheet.frequencia8 = import[2];
            						sheet.alcance8 = import[3];
            						sheet.tipo8 = import[4];
            						sheet.classe8 = import[5];
            						sheet.AC8 = import[6];
            						sheet.ataque8 = import[7];
            						sheet.dano8 = import[8];
            						sheet.BonDMG8 = import[9];
            						sheet.campoEfeitoGolpes8 = import[10];
            						sheet.tipoContest8 = import[11];
            						sheet.efeitoContest8 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event43 = obj.button44:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe8, sheet.frequencia8, sheet.alcance8, sheet.tipo8, sheet.classe8, sheet.AC8, sheet.ataque8, sheet.dano8, sheet.BonDMG8, sheet.campoEfeitoGolpes8, sheet.tipoContest8, sheet.efeitoContest8};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event44 = obj.button45:addEventListener("onClick",
        function (_)
            sheet.golpe8 = nil;
            				sheet.frequencia8 = nil;
            				sheet.alcance8 = nil;
            				sheet.tipo8 = nil;
            				sheet.classe8 = nil;
            				sheet.AC8 = nil;
            				sheet.ataque8 = nil;
            				sheet.dano8 = nil;
            				sheet.BonDMG8 = nil;
            				sheet.campoEfeitoGolpes8 = nil;
            				sheet.tipoContest8 = nil;
            				sheet.efeitoContest8 = nil;
        end, obj);

    obj._e_event45 = obj.button46:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque8) or 0;
            					local NomeGolpe = sheet.golpe8 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC8) or "N/A"
            					local TipoG = tonumber(sheet.tipo8) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe8) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event46 = obj.button47:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe8 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo8) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano8) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe8) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG8 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event47 = obj.button48:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe8 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo8) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano8) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe8) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG8 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event48 = obj.button49:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe9 = import[1];
            						sheet.frequencia9 = import[2];
            						sheet.alcance9 = import[3];
            						sheet.tipo9 = import[4];
            						sheet.classe9 = import[5];
            						sheet.AC9 = import[6];
            						sheet.ataque9 = import[7];
            						sheet.dano9 = import[8];
            						sheet.BonDMG9 = import[9];
            						sheet.campoEfeitoGolpes9 = import[10];
            						sheet.tipoContest9 = import[11];
            						sheet.efeitoContest9 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event49 = obj.button50:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe9, sheet.frequencia9, sheet.alcance9, sheet.tipo9, sheet.classe9, sheet.AC9, sheet.ataque9, sheet.dano9, sheet.BonDMG9, sheet.campoEfeitoGolpes9, sheet.tipoContest9, sheet.efeitoContest9};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event50 = obj.button51:addEventListener("onClick",
        function (_)
            sheet.golpe9 = nil;
            				sheet.frequencia9 = nil;
            				sheet.alcance9 = nil;
            				sheet.tipo9 = nil;
            				sheet.classe9 = nil;
            				sheet.AC9 = nil;
            				sheet.ataque9 = nil;
            				sheet.dano9 = nil;
            				sheet.BonDMG9 = nil;
            				sheet.campoEfeitoGolpes9 = nil;
            				sheet.tipoContest9 = nil;
            				sheet.efeitoContest9 = nil;
        end, obj);

    obj._e_event51 = obj.button52:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque9) or 0;
            					local NomeGolpe = sheet.golpe9 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC9) or "N/A"
            					local TipoG = tonumber(sheet.tipo9) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe9) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event52 = obj.button53:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe9 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo9) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano9) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe9) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG9 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event53 = obj.button54:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe9 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo9) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano9) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe9) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG9 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event54 = obj.button55:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe10 = import[1];
            						sheet.frequencia10 = import[2];
            						sheet.alcance10 = import[3];
            						sheet.tipo10 = import[4];
            						sheet.classe10 = import[5];
            						sheet.AC10 = import[6];
            						sheet.ataque10 = import[7];
            						sheet.dano10 = import[8];
            						sheet.BonDMG10 = import[9];
            						sheet.campoEfeitoGolpes10 = import[10];
            						sheet.tipoContest10 = import[11];
            						sheet.efeitoContest10 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event55 = obj.button56:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe10, sheet.frequencia10, sheet.alcance10, sheet.tipo10, sheet.classe10, sheet.AC10, sheet.ataque10, sheet.dano10, sheet.BonDMG10, sheet.campoEfeitoGolpes10, sheet.tipoContest10, sheet.efeitoContest10};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event56 = obj.button57:addEventListener("onClick",
        function (_)
            sheet.golpe10 = nil;
            				sheet.frequencia10 = nil;
            				sheet.alcance10 = nil;
            				sheet.tipo10 = nil;
            				sheet.classe10 = nil;
            				sheet.AC10 = nil;
            				sheet.ataque10 = nil;
            				sheet.dano10 = nil;
            				sheet.BonDMG10 = nil;
            				sheet.campoEfeitoGolpes10 = nil;
            				sheet.tipoContest10 = nil;
            				sheet.efeitoContest10 = nil;
        end, obj);

    obj._e_event57 = obj.button58:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque10) or 0;
            					local NomeGolpe = sheet.golpe10 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC10) or "N/A"
            					local TipoG = tonumber(sheet.tipo10) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe10) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event58 = obj.button59:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe10 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo10) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano10) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe10) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG10 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event59 = obj.button60:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe10 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo10) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano10) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe10) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG10 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event60 = obj.button61:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe11 = import[1];
            						sheet.frequencia11 = import[2];
            						sheet.alcance11 = import[3];
            						sheet.tipo11 = import[4];
            						sheet.classe11 = import[5];
            						sheet.AC11 = import[6];
            						sheet.ataque11 = import[7];
            						sheet.dano11 = import[8];
            						sheet.BonDMG11 = import[9];
            						sheet.campoEfeitoGolpes11 = import[10];
            						sheet.tipoContest11 = import[11];
            						sheet.efeitoContest11 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event61 = obj.button62:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe11, sheet.frequencia11, sheet.alcance11, sheet.tipo11, sheet.classe11, sheet.AC11, sheet.ataque11, sheet.dano11, sheet.BonDMG11, sheet.campoEfeitoGolpes11, sheet.tipoContest11, sheet.efeitoContest11};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event62 = obj.button63:addEventListener("onClick",
        function (_)
            sheet.golpe11 = nil;
            				sheet.frequencia11 = nil;
            				sheet.alcance11 = nil;
            				sheet.tipo11 = nil;
            				sheet.classe11 = nil;
            				sheet.AC11 = nil;
            				sheet.ataque11 = nil;
            				sheet.dano11 = nil;
            				sheet.BonDMG11 = nil;
            				sheet.campoEfeitoGolpes11 = nil;
            				sheet.tipoContest11 = nil;
            				sheet.efeitoContest11 = nil;
        end, obj);

    obj._e_event63 = obj.button64:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque11) or 0;
            					local NomeGolpe = sheet.golpe11 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC11) or "N/A"
            					local TipoG = tonumber(sheet.tipo11) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe11) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event64 = obj.button65:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe11 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo11) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano11) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe11) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG11 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event65 = obj.button66:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe11 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo11) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano11) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe11) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG11 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event66 = obj.button67:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe12 = import[1];
            						sheet.frequencia12 = import[2];
            						sheet.alcance12 = import[3];
            						sheet.tipo12 = import[4];
            						sheet.classe12 = import[5];
            						sheet.AC12 = import[6];
            						sheet.ataque12 = import[7];
            						sheet.dano12 = import[8];
            						sheet.BonDMG12 = import[9];
            						sheet.campoEfeitoGolpes12 = import[10];
            						sheet.tipoContest12 = import[11];
            						sheet.efeitoContest12 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event67 = obj.button68:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe12, sheet.frequencia12, sheet.alcance12, sheet.tipo12, sheet.classe12, sheet.AC12, sheet.ataque12, sheet.dano12, sheet.BonDMG12, sheet.campoEfeitoGolpes12, sheet.tipoContest12, sheet.efeitoContest12};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event68 = obj.button69:addEventListener("onClick",
        function (_)
            sheet.golpe12 = nil;
            				sheet.frequencia12 = nil;
            				sheet.alcance12 = nil;
            				sheet.tipo12 = nil;
            				sheet.classe12 = nil;
            				sheet.AC12 = nil;
            				sheet.ataque12 = nil;
            				sheet.dano12 = nil;
            				sheet.BonDMG12 = nil;
            				sheet.campoEfeitoGolpes12 = nil;
            				sheet.tipoContest12 = nil;
            				sheet.efeitoContest12 = nil;
        end, obj);

    obj._e_event69 = obj.button70:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque12) or 0;
            					local NomeGolpe = sheet.golpe12 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC12) or "N/A"
            					local TipoG = tonumber(sheet.tipo12) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe12) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event70 = obj.button71:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe12 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo12) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano12) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe12) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG12 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event71 = obj.button72:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe12 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo12) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano12) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe12) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG12 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event72 = obj.button73:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe13 = import[1];
            						sheet.frequencia13 = import[2];
            						sheet.alcance13 = import[3];
            						sheet.tipo13 = import[4];
            						sheet.classe13 = import[5];
            						sheet.AC13 = import[6];
            						sheet.ataque13 = import[7];
            						sheet.dano13 = import[8];
            						sheet.BonDMG13 = import[9];
            						sheet.campoEfeitoGolpes13 = import[10];
            						sheet.tipoContest13 = import[11];
            						sheet.efeitoContest13 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event73 = obj.button74:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe13, sheet.frequencia13, sheet.alcance13, sheet.tipo13, sheet.classe13, sheet.AC13, sheet.ataque13, sheet.dano13, sheet.BonDMG13, sheet.campoEfeitoGolpes13, sheet.tipoContest13, sheet.efeitoContest13};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event74 = obj.button75:addEventListener("onClick",
        function (_)
            sheet.golpe13 = nil;
            				sheet.frequencia13 = nil;
            				sheet.alcance13 = nil;
            				sheet.tipo13 = nil;
            				sheet.classe13 = nil;
            				sheet.AC13 = nil;
            				sheet.ataque13 = nil;
            				sheet.dano13 = nil;
            				sheet.BonDMG13 = nil;
            				sheet.campoEfeitoGolpes13 = nil;
            				sheet.tipoContest13 = nil;
            				sheet.efeitoContest13 = nil;
        end, obj);

    obj._e_event75 = obj.button76:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque13) or 0;
            					local NomeGolpe = sheet.golpe13 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC13) or "N/A"
            					local TipoG = tonumber(sheet.tipo13) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe13) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event76 = obj.button77:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe13 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo13) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano13) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe13) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG13 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event77 = obj.button78:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe13 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo13) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano13) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe13) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG13 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event78 = obj.button79:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe14 = import[1];
            						sheet.frequencia14 = import[2];
            						sheet.alcance14 = import[3];
            						sheet.tipo14 = import[4];
            						sheet.classe14 = import[5];
            						sheet.AC14 = import[6];
            						sheet.ataque14 = import[7];
            						sheet.dano14 = import[8];
            						sheet.BonDMG14 = import[9];
            						sheet.campoEfeitoGolpes14 = import[10];
            						sheet.tipoContest14 = import[11];
            						sheet.efeitoContest14 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event79 = obj.button80:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe14, sheet.frequencia14, sheet.alcance14, sheet.tipo14, sheet.classe14, sheet.AC14, sheet.ataque14, sheet.dano14, sheet.BonDMG14, sheet.campoEfeitoGolpes14, sheet.tipoContest14, sheet.efeitoContest14};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event80 = obj.button81:addEventListener("onClick",
        function (_)
            sheet.golpe14 = nil;
            				sheet.frequencia14 = nil;
            				sheet.alcance14 = nil;
            				sheet.tipo14 = nil;
            				sheet.classe14 = nil;
            				sheet.AC14 = nil;
            				sheet.ataque14 = nil;
            				sheet.dano14 = nil;
            				sheet.BonDMG14 = nil;
            				sheet.campoEfeitoGolpes14 = nil;
            				sheet.tipoContest14 = nil;
            				sheet.efeitoContest14 = nil;
        end, obj);

    obj._e_event81 = obj.button82:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque14) or 0;
            					local NomeGolpe = sheet.golpe14 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC14) or "N/A"
            					local TipoG = tonumber(sheet.tipo14) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe14) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event82 = obj.button83:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe14 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo14) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano14) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe14) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG14 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event83 = obj.button84:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe14 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo14) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano14) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe14) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG14 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event84 = obj.button85:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe15 = import[1];
            						sheet.frequencia15 = import[2];
            						sheet.alcance15 = import[3];
            						sheet.tipo15 = import[4];
            						sheet.classe15 = import[5];
            						sheet.AC15 = import[6];
            						sheet.ataque15 = import[7];
            						sheet.dano15 = import[8];
            						sheet.BonDMG15 = import[9];
            						sheet.campoEfeitoGolpes15 = import[10];
            						sheet.tipoContest15 = import[11];
            						sheet.efeitoContest15 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event85 = obj.button86:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe15, sheet.frequencia15, sheet.alcance15, sheet.tipo15, sheet.classe15, sheet.AC15, sheet.ataque15, sheet.dano15, sheet.BonDMG15, sheet.campoEfeitoGolpes15, sheet.tipoContest15, sheet.efeitoContest15};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event86 = obj.button87:addEventListener("onClick",
        function (_)
            sheet.golpe15 = nil;
            				sheet.frequencia15 = nil;
            				sheet.alcance15 = nil;
            				sheet.tipo15 = nil;
            				sheet.classe15 = nil;
            				sheet.AC15 = nil;
            				sheet.ataque15 = nil;
            				sheet.dano15 = nil;
            				sheet.BonDMG15 = nil;
            				sheet.campoEfeitoGolpes15 = nil;
            				sheet.tipoContest15 = nil;
            				sheet.efeitoContest15 = nil;
        end, obj);

    obj._e_event87 = obj.button88:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque15) or 0;
            					local NomeGolpe = sheet.golpe15 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC15) or "N/A"
            					local TipoG = tonumber(sheet.tipo15) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe15) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event88 = obj.button89:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe15 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo15) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano15) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe15) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG15 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event89 = obj.button90:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe15 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo15) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano15) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe15) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG15 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event90 = obj.button91:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						sheet.golpe16 = import[1];
            						sheet.frequencia16 = import[2];
            						sheet.alcance16 = import[3];
            						sheet.tipo16 = import[4];
            						sheet.classe16 = import[5];
            						sheet.AC16 = import[6];
            						sheet.ataque16 = import[7];
            						sheet.dano16 = import[8];
            						sheet.BonDMG16 = import[9];
            						sheet.campoEfeitoGolpes16 = import[10];
            						sheet.tipoContest16 = import[11];
            						sheet.efeitoContest16 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event91 = obj.button92:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {sheet.golpe16, sheet.frequencia16, sheet.alcance16, sheet.tipo16, sheet.classe16, sheet.AC16, sheet.ataque16, sheet.dano16, sheet.BonDMG16, sheet.campoEfeitoGolpes16, sheet.tipoContest16, sheet.efeitoContest16};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event92 = obj.button93:addEventListener("onClick",
        function (_)
            sheet.golpe16 = nil;
            				sheet.frequencia16 = nil;
            				sheet.alcance16 = nil;
            				sheet.tipo16 = nil;
            				sheet.classe16 = nil;
            				sheet.AC16 = nil;
            				sheet.ataque16 = nil;
            				sheet.dano16 = nil;
            				sheet.BonDMG16 = nil;
            				sheet.campoEfeitoGolpes16 = nil;
            				sheet.tipoContest16 = nil;
            				sheet.efeitoContest16 = nil;
        end, obj);

    obj._e_event93 = obj.button94:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = (sheet.ataque16) or 0;
            					local NomeGolpe = sheet.golpe16 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = tonumber(sheet.AC16) or "N/A"
            					local TipoG = tonumber(sheet.tipo16) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local Attribute = tonumber(sheet.classe16) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end	
            					local ROLL = Firecast.interpretarRolagem("1d20");
            						  ROLL:concatenar(ATAQUE);
            					mesaDoPersonagem.activeChat:rolarDados(ROLL, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event94 = obj.button95:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe16 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo16) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(sheet.dano16) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28;					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe16) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG16 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event95 = obj.button96:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe16 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local TipoG = tonumber(sheet.tipo16) or 0;
            					MSG_Color = "[§K14]"
            					if (TipoG == 1) then
            						MSG_Color = "[§K1]"
            						elseif (TipoG == 2) then
            							MSG_Color = "[§K4]"
            						elseif (TipoG == 3) then
            							MSG_Color = "[§K22]"
            						elseif (TipoG == 4) then
            							MSG_Color = "[§K8]"
            						elseif (TipoG == 5) then
            							MSG_Color = "[§K3]"
            						elseif (TipoG == 6) then
            							MSG_Color = "[§K10]"
            						elseif (TipoG == 7) then
            							MSG_Color = "[§K28]"
            						elseif (TipoG == 8) then
            							MSG_Color = "[§K13]"
            						elseif (TipoG == 9) then
            							MSG_Color = "[§K23]"
            						elseif (TipoG == 10) then
            							MSG_Color = "[§K2]"
            						elseif (TipoG == 11) then
            							MSG_Color = "[§K6]"
            						elseif (TipoG == 12) then
            							MSG_Color = "[§K9]"
            						elseif (TipoG == 13) then
            							MSG_Color = "[§K7]"
            						elseif (TipoG == 14) then
            							MSG_Color = "[§K25]"
            						elseif (TipoG == 15) then
            							MSG_Color = "[§K27]"
            						elseif (TipoG == 16) then
            							MSG_Color = "[§K15]"
            						elseif (TipoG == 17) then
            							MSG_Color = "[§K18]"
            						elseif (TipoG == 18) then
            							MSG_Color = "[§K26]"
            						end	
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(sheet.dano16) or 1;
            					if BaseDamage > 28 then 
            						BaseDamage = 28; 					
            						end
            					if 1 > BaseDamage then 
            						BaseDamage = 1; 					
            						end
            					local Attribute = tonumber(sheet.classe16) or 3;
            					if Attribute > 3 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            					local MSG_ATT = "";
            					if (Attribute == 1) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/EVMJDECV_1536935/phy.png]"
            						end
            					if (Attribute == 2) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/HFCCDNWD_1536937/spe.png]"
            						end		
            					local ATKFIS = sheet.ATK_tot or 0;
            					local ATKESP = sheet.SPATK_tot or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = sheet.BonDMG16 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    function obj:_releaseEvents()
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

        if self.button89 ~= nil then self.button89:destroy(); self.button89 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.button96 ~= nil then self.button96:destroy(); self.button96 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.button85 ~= nil then self.button85:destroy(); self.button85 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.button93 ~= nil then self.button93:destroy(); self.button93 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.comboBox28 ~= nil then self.comboBox28:destroy(); self.comboBox28 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.button92 ~= nil then self.button92:destroy(); self.button92 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.comboBox31 ~= nil then self.comboBox31:destroy(); self.comboBox31 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.button88 ~= nil then self.button88:destroy(); self.button88 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button91 ~= nil then self.button91:destroy(); self.button91 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.button94 ~= nil then self.button94:destroy(); self.button94 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.button90 ~= nil then self.button90:destroy(); self.button90 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.button82 ~= nil then self.button82:destroy(); self.button82 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.button86 ~= nil then self.button86:destroy(); self.button86 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.button87 ~= nil then self.button87:destroy(); self.button87 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.button83 ~= nil then self.button83:destroy(); self.button83 = nil; end;
        if self.comboBox30 ~= nil then self.comboBox30:destroy(); self.comboBox30 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button84 ~= nil then self.button84:destroy(); self.button84 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.button95 ~= nil then self.button95:destroy(); self.button95 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.button81 ~= nil then self.button81:destroy(); self.button81 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.comboBox32 ~= nil then self.comboBox32:destroy(); self.comboBox32 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister2_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister2_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister2_svg = {
    newEditor = newfrmFichaRPGmeister2_svg, 
    new = newfrmFichaRPGmeister2_svg, 
    name = "frmFichaRPGmeister2_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister2_svg = _frmFichaRPGmeister2_svg;
Firecast.registrarForm(_frmFichaRPGmeister2_svg);

return _frmFichaRPGmeister2_svg;
