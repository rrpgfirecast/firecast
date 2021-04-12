require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister3_svg()
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
    obj:setName("frmFichaRPGmeister3_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("left");
    obj.scrollBox1:setWidth(880);
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(864);
    obj.layout1:setHeight(953);
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
    obj.layout2:setWidth(880);
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
    obj.edit1:setField("golpeP1");
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
    obj.edit2:setField("frequenciaP1");
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
    obj.edit3:setField("alcanceP1");
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
    obj.comboBox1:setField("tipoP1");
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
    obj.comboBox2:setField("classeP1");
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
    obj.edit4:setField("ACP1");
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
    obj.edit5:setField("ataqueP1");
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
    obj.edit6:setField("danoP1");
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
    obj.edit7:setField("BonDMGP1");
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
    obj.textEditor1:setWidth(280);
    obj.textEditor1:setHeight(50);
    obj.textEditor1:setField("campoEfeitoGolpesP1");
    obj.textEditor1:setName("textEditor1");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setLeft(575);
    obj.label10:setTop(60);
    obj.label10:setWidth(60);
    obj.label10:setHeight(25);
    obj.label10:setText("Tipo(C)");
    obj.label10:setName("label10");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(620);
    obj.edit8:setTop(60);
    obj.edit8:setWidth(45);
    obj.edit8:setHeight(25);
    obj.edit8:setField("tipoContestP1");
    obj.edit8:setName("edit8");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setLeft(675);
    obj.label11:setTop(60);
    obj.label11:setWidth(60);
    obj.label11:setHeight(25);
    obj.label11:setText("Efeito(C)");
    obj.label11:setName("label11");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout2);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(730);
    obj.edit9:setTop(60);
    obj.edit9:setWidth(125);
    obj.edit9:setHeight(25);
    obj.edit9:setField("efeitoContestP1");
    obj.edit9:setName("edit9");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(2);
    obj.layout3:setTop(97);
    obj.layout3:setWidth(880);
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

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout3);
    obj.label12:setLeft(25);
    obj.label12:setTop(5);
    obj.label12:setWidth(70);
    obj.label12:setHeight(25);
    obj.label12:setText("Golpe");
    obj.label12:setName("label12");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout3);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(90);
    obj.edit10:setTop(5);
    obj.edit10:setWidth(135);
    obj.edit10:setHeight(25);
    obj.edit10:setField("golpeP2");
    obj.edit10:setName("edit10");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout3);
    obj.label13:setLeft(25);
    obj.label13:setTop(30);
    obj.label13:setWidth(80);
    obj.label13:setHeight(25);
    obj.label13:setText("Frequência");
    obj.label13:setName("label13");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout3);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(90);
    obj.edit11:setTop(30);
    obj.edit11:setWidth(135);
    obj.edit11:setHeight(25);
    obj.edit11:setField("frequenciaP2");
    obj.edit11:setName("edit11");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout3);
    obj.label14:setLeft(25);
    obj.label14:setTop(55);
    obj.label14:setWidth(70);
    obj.label14:setHeight(25);
    obj.label14:setText("Alcance");
    obj.label14:setName("label14");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout3);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(90);
    obj.edit12:setTop(55);
    obj.edit12:setWidth(135);
    obj.edit12:setHeight(25);
    obj.edit12:setField("alcanceP2");
    obj.edit12:setName("edit12");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout3);
    obj.label15:setLeft(235);
    obj.label15:setTop(6);
    obj.label15:setWidth(50);
    obj.label15:setHeight(25);
    obj.label15:setText("Tipo");
    obj.label15:setName("label15");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout3);
    obj.comboBox3:setLeft(277);
    obj.comboBox3:setTop(6);
    obj.comboBox3:setWidth(87);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("tipoP2");
    obj.comboBox3:setHorzTextAlign("leading");
    obj.comboBox3:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox3:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox3:setName("comboBox3");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout3);
    obj.label16:setLeft(235);
    obj.label16:setTop(31);
    obj.label16:setWidth(50);
    obj.label16:setHeight(25);
    obj.label16:setText("Classe");
    obj.label16:setName("label16");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout3);
    obj.comboBox4:setLeft(277);
    obj.comboBox4:setTop(31);
    obj.comboBox4:setWidth(87);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("classeP2");
    obj.comboBox4:setHorzTextAlign("leading");
    obj.comboBox4:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox4:setValues({'1', '2', '3'});
    obj.comboBox4:setName("comboBox4");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout3);
    obj.label17:setLeft(235);
    obj.label17:setTop(55);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setText("AC");
    obj.label17:setName("label17");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout3);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(277);
    obj.edit13:setTop(55);
    obj.edit13:setWidth(87);
    obj.edit13:setHeight(25);
    obj.edit13:setField("ACP2");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout3);
    obj.label18:setLeft(370);
    obj.label18:setTop(6);
    obj.label18:setWidth(70);
    obj.label18:setHeight(25);
    obj.label18:setText("Prec.Bôn.");
    obj.label18:setName("label18");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout3);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(443);
    obj.edit14:setTop(6);
    obj.edit14:setWidth(42);
    obj.edit14:setHeight(25);
    obj.edit14:setField("ataqueP2");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setLeft(370);
    obj.label19:setTop(31);
    obj.label19:setWidth(70);
    obj.label19:setHeight(25);
    obj.label19:setText("Dano Base");
    obj.label19:setName("label19");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout3);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(443);
    obj.edit15:setTop(31);
    obj.edit15:setWidth(42);
    obj.edit15:setHeight(25);
    obj.edit15:setField("danoP2");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setLeft(370);
    obj.label20:setTop(55);
    obj.label20:setWidth(70);
    obj.label20:setHeight(25);
    obj.label20:setText("Dano Bôn.");
    obj.label20:setName("label20");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout3);
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(443);
    obj.edit16:setTop(55);
    obj.edit16:setWidth(42);
    obj.edit16:setHeight(25);
    obj.edit16:setField("BonDMGP2");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

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
    obj.textEditor2:setWidth(280);
    obj.textEditor2:setHeight(50);
    obj.textEditor2:setField("campoEfeitoGolpesP2");
    obj.textEditor2:setName("textEditor2");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout3);
    obj.label21:setLeft(575);
    obj.label21:setTop(60);
    obj.label21:setWidth(60);
    obj.label21:setHeight(25);
    obj.label21:setText("Tipo(C)");
    obj.label21:setName("label21");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout3);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(620);
    obj.edit17:setTop(60);
    obj.edit17:setWidth(45);
    obj.edit17:setHeight(25);
    obj.edit17:setField("tipoContestP2");
    obj.edit17:setName("edit17");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout3);
    obj.label22:setLeft(675);
    obj.label22:setTop(60);
    obj.label22:setWidth(60);
    obj.label22:setHeight(25);
    obj.label22:setText("Efeito(C)");
    obj.label22:setName("label22");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout3);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(730);
    obj.edit18:setTop(60);
    obj.edit18:setWidth(125);
    obj.edit18:setHeight(25);
    obj.edit18:setField("efeitoContestP2");
    obj.edit18:setName("edit18");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(2);
    obj.layout4:setTop(192);
    obj.layout4:setWidth(880);
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

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout4);
    obj.label23:setLeft(25);
    obj.label23:setTop(5);
    obj.label23:setWidth(70);
    obj.label23:setHeight(25);
    obj.label23:setText("Golpe");
    obj.label23:setName("label23");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout4);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(90);
    obj.edit19:setTop(5);
    obj.edit19:setWidth(135);
    obj.edit19:setHeight(25);
    obj.edit19:setField("golpeP3");
    obj.edit19:setName("edit19");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout4);
    obj.label24:setLeft(25);
    obj.label24:setTop(30);
    obj.label24:setWidth(80);
    obj.label24:setHeight(25);
    obj.label24:setText("Frequência");
    obj.label24:setName("label24");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout4);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(90);
    obj.edit20:setTop(30);
    obj.edit20:setWidth(135);
    obj.edit20:setHeight(25);
    obj.edit20:setField("frequenciaP3");
    obj.edit20:setName("edit20");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout4);
    obj.label25:setLeft(25);
    obj.label25:setTop(55);
    obj.label25:setWidth(70);
    obj.label25:setHeight(25);
    obj.label25:setText("Alcance");
    obj.label25:setName("label25");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout4);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(90);
    obj.edit21:setTop(55);
    obj.edit21:setWidth(135);
    obj.edit21:setHeight(25);
    obj.edit21:setField("alcanceP3");
    obj.edit21:setName("edit21");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout4);
    obj.label26:setLeft(235);
    obj.label26:setTop(6);
    obj.label26:setWidth(50);
    obj.label26:setHeight(25);
    obj.label26:setText("Tipo");
    obj.label26:setName("label26");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout4);
    obj.comboBox5:setLeft(277);
    obj.comboBox5:setTop(6);
    obj.comboBox5:setWidth(87);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("tipoP3");
    obj.comboBox5:setHorzTextAlign("leading");
    obj.comboBox5:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox5:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox5:setName("comboBox5");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout4);
    obj.label27:setLeft(235);
    obj.label27:setTop(31);
    obj.label27:setWidth(50);
    obj.label27:setHeight(25);
    obj.label27:setText("Classe");
    obj.label27:setName("label27");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout4);
    obj.comboBox6:setLeft(277);
    obj.comboBox6:setTop(31);
    obj.comboBox6:setWidth(87);
    obj.comboBox6:setHeight(25);
    obj.comboBox6:setField("classeP3");
    obj.comboBox6:setHorzTextAlign("leading");
    obj.comboBox6:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox6:setValues({'1', '2', '3'});
    obj.comboBox6:setName("comboBox6");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout4);
    obj.label28:setLeft(235);
    obj.label28:setTop(55);
    obj.label28:setWidth(50);
    obj.label28:setHeight(25);
    obj.label28:setText("AC");
    obj.label28:setName("label28");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout4);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(277);
    obj.edit22:setTop(55);
    obj.edit22:setWidth(87);
    obj.edit22:setHeight(25);
    obj.edit22:setField("ACP3");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout4);
    obj.label29:setLeft(370);
    obj.label29:setTop(6);
    obj.label29:setWidth(70);
    obj.label29:setHeight(25);
    obj.label29:setText("Prec.Bôn.");
    obj.label29:setName("label29");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout4);
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(443);
    obj.edit23:setTop(6);
    obj.edit23:setWidth(42);
    obj.edit23:setHeight(25);
    obj.edit23:setField("ataqueP3");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout4);
    obj.label30:setLeft(370);
    obj.label30:setTop(31);
    obj.label30:setWidth(70);
    obj.label30:setHeight(25);
    obj.label30:setText("Dano Base");
    obj.label30:setName("label30");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout4);
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(443);
    obj.edit24:setTop(31);
    obj.edit24:setWidth(42);
    obj.edit24:setHeight(25);
    obj.edit24:setField("danoP3");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout4);
    obj.label31:setLeft(370);
    obj.label31:setTop(55);
    obj.label31:setWidth(70);
    obj.label31:setHeight(25);
    obj.label31:setText("Dano Bôn.");
    obj.label31:setName("label31");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout4);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(443);
    obj.edit25:setTop(55);
    obj.edit25:setWidth(42);
    obj.edit25:setHeight(25);
    obj.edit25:setField("BonDMGP3");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

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
    obj.textEditor3:setWidth(280);
    obj.textEditor3:setHeight(50);
    obj.textEditor3:setField("campoEfeitoGolpesP3");
    obj.textEditor3:setName("textEditor3");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout4);
    obj.label32:setLeft(575);
    obj.label32:setTop(60);
    obj.label32:setWidth(60);
    obj.label32:setHeight(25);
    obj.label32:setText("Tipo(C)");
    obj.label32:setName("label32");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout4);
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(620);
    obj.edit26:setTop(60);
    obj.edit26:setWidth(45);
    obj.edit26:setHeight(25);
    obj.edit26:setField("tipoContestP3");
    obj.edit26:setName("edit26");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout4);
    obj.label33:setLeft(675);
    obj.label33:setTop(60);
    obj.label33:setWidth(60);
    obj.label33:setHeight(25);
    obj.label33:setText("Efeito(C)");
    obj.label33:setName("label33");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout4);
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(730);
    obj.edit27:setTop(60);
    obj.edit27:setWidth(125);
    obj.edit27:setHeight(25);
    obj.edit27:setField("efeitoContestP3");
    obj.edit27:setName("edit27");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(2);
    obj.layout5:setTop(288);
    obj.layout5:setWidth(880);
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

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout5);
    obj.label34:setLeft(25);
    obj.label34:setTop(5);
    obj.label34:setWidth(70);
    obj.label34:setHeight(25);
    obj.label34:setText("Golpe");
    obj.label34:setName("label34");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout5);
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(90);
    obj.edit28:setTop(5);
    obj.edit28:setWidth(135);
    obj.edit28:setHeight(25);
    obj.edit28:setField("golpeP4");
    obj.edit28:setName("edit28");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout5);
    obj.label35:setLeft(25);
    obj.label35:setTop(30);
    obj.label35:setWidth(80);
    obj.label35:setHeight(25);
    obj.label35:setText("Frequência");
    obj.label35:setName("label35");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout5);
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(90);
    obj.edit29:setTop(30);
    obj.edit29:setWidth(135);
    obj.edit29:setHeight(25);
    obj.edit29:setField("frequenciaP4");
    obj.edit29:setName("edit29");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout5);
    obj.label36:setLeft(25);
    obj.label36:setTop(55);
    obj.label36:setWidth(70);
    obj.label36:setHeight(25);
    obj.label36:setText("Alcance");
    obj.label36:setName("label36");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout5);
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(90);
    obj.edit30:setTop(55);
    obj.edit30:setWidth(135);
    obj.edit30:setHeight(25);
    obj.edit30:setField("alcanceP4");
    obj.edit30:setName("edit30");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout5);
    obj.label37:setLeft(235);
    obj.label37:setTop(6);
    obj.label37:setWidth(50);
    obj.label37:setHeight(25);
    obj.label37:setText("Tipo");
    obj.label37:setName("label37");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout5);
    obj.comboBox7:setLeft(277);
    obj.comboBox7:setTop(6);
    obj.comboBox7:setWidth(87);
    obj.comboBox7:setHeight(25);
    obj.comboBox7:setField("tipoP4");
    obj.comboBox7:setHorzTextAlign("leading");
    obj.comboBox7:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox7:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox7:setName("comboBox7");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout5);
    obj.label38:setLeft(235);
    obj.label38:setTop(31);
    obj.label38:setWidth(50);
    obj.label38:setHeight(25);
    obj.label38:setText("Classe");
    obj.label38:setName("label38");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout5);
    obj.comboBox8:setLeft(277);
    obj.comboBox8:setTop(31);
    obj.comboBox8:setWidth(87);
    obj.comboBox8:setHeight(25);
    obj.comboBox8:setField("classeP4");
    obj.comboBox8:setHorzTextAlign("leading");
    obj.comboBox8:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox8:setValues({'1', '2', '3'});
    obj.comboBox8:setName("comboBox8");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout5);
    obj.label39:setLeft(235);
    obj.label39:setTop(55);
    obj.label39:setWidth(50);
    obj.label39:setHeight(25);
    obj.label39:setText("AC");
    obj.label39:setName("label39");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout5);
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(277);
    obj.edit31:setTop(55);
    obj.edit31:setWidth(87);
    obj.edit31:setHeight(25);
    obj.edit31:setField("ACP4");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout5);
    obj.label40:setLeft(370);
    obj.label40:setTop(6);
    obj.label40:setWidth(70);
    obj.label40:setHeight(25);
    obj.label40:setText("Prec.Bôn.");
    obj.label40:setName("label40");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout5);
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(443);
    obj.edit32:setTop(6);
    obj.edit32:setWidth(42);
    obj.edit32:setHeight(25);
    obj.edit32:setField("ataqueP4");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout5);
    obj.label41:setLeft(370);
    obj.label41:setTop(31);
    obj.label41:setWidth(70);
    obj.label41:setHeight(25);
    obj.label41:setText("Dano Base");
    obj.label41:setName("label41");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout5);
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(443);
    obj.edit33:setTop(31);
    obj.edit33:setWidth(42);
    obj.edit33:setHeight(25);
    obj.edit33:setField("danoP4");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout5);
    obj.label42:setLeft(370);
    obj.label42:setTop(55);
    obj.label42:setWidth(70);
    obj.label42:setHeight(25);
    obj.label42:setText("Dano Bôn.");
    obj.label42:setName("label42");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout5);
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(443);
    obj.edit34:setTop(55);
    obj.edit34:setWidth(42);
    obj.edit34:setHeight(25);
    obj.edit34:setField("BonDMGP4");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

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
    obj.textEditor4:setWidth(280);
    obj.textEditor4:setHeight(50);
    obj.textEditor4:setField("campoEfeitoGolpesP4");
    obj.textEditor4:setName("textEditor4");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout5);
    obj.label43:setLeft(575);
    obj.label43:setTop(60);
    obj.label43:setWidth(60);
    obj.label43:setHeight(25);
    obj.label43:setText("Tipo(C)");
    obj.label43:setName("label43");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout5);
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(620);
    obj.edit35:setTop(60);
    obj.edit35:setWidth(45);
    obj.edit35:setHeight(25);
    obj.edit35:setField("tipoContestP4");
    obj.edit35:setName("edit35");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout5);
    obj.label44:setLeft(675);
    obj.label44:setTop(60);
    obj.label44:setWidth(60);
    obj.label44:setHeight(25);
    obj.label44:setText("Efeito(C)");
    obj.label44:setName("label44");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout5);
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(730);
    obj.edit36:setTop(60);
    obj.edit36:setWidth(125);
    obj.edit36:setHeight(25);
    obj.edit36:setField("efeitoContestP4");
    obj.edit36:setName("edit36");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(2);
    obj.layout6:setTop(383);
    obj.layout6:setWidth(880);
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

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout6);
    obj.label45:setLeft(25);
    obj.label45:setTop(5);
    obj.label45:setWidth(70);
    obj.label45:setHeight(25);
    obj.label45:setText("Golpe");
    obj.label45:setName("label45");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout6);
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(90);
    obj.edit37:setTop(5);
    obj.edit37:setWidth(135);
    obj.edit37:setHeight(25);
    obj.edit37:setField("golpeP5");
    obj.edit37:setName("edit37");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout6);
    obj.label46:setLeft(25);
    obj.label46:setTop(30);
    obj.label46:setWidth(80);
    obj.label46:setHeight(25);
    obj.label46:setText("Frequência");
    obj.label46:setName("label46");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout6);
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(90);
    obj.edit38:setTop(30);
    obj.edit38:setWidth(135);
    obj.edit38:setHeight(25);
    obj.edit38:setField("frequenciaP5");
    obj.edit38:setName("edit38");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout6);
    obj.label47:setLeft(25);
    obj.label47:setTop(55);
    obj.label47:setWidth(70);
    obj.label47:setHeight(25);
    obj.label47:setText("Alcance");
    obj.label47:setName("label47");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout6);
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(90);
    obj.edit39:setTop(55);
    obj.edit39:setWidth(135);
    obj.edit39:setHeight(25);
    obj.edit39:setField("alcanceP5");
    obj.edit39:setName("edit39");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout6);
    obj.label48:setLeft(235);
    obj.label48:setTop(6);
    obj.label48:setWidth(50);
    obj.label48:setHeight(25);
    obj.label48:setText("Tipo");
    obj.label48:setName("label48");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout6);
    obj.comboBox9:setLeft(277);
    obj.comboBox9:setTop(6);
    obj.comboBox9:setWidth(87);
    obj.comboBox9:setHeight(25);
    obj.comboBox9:setField("tipoP5");
    obj.comboBox9:setHorzTextAlign("leading");
    obj.comboBox9:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox9:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox9:setName("comboBox9");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout6);
    obj.label49:setLeft(235);
    obj.label49:setTop(31);
    obj.label49:setWidth(50);
    obj.label49:setHeight(25);
    obj.label49:setText("Classe");
    obj.label49:setName("label49");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout6);
    obj.comboBox10:setLeft(277);
    obj.comboBox10:setTop(31);
    obj.comboBox10:setWidth(87);
    obj.comboBox10:setHeight(25);
    obj.comboBox10:setField("classeP5");
    obj.comboBox10:setHorzTextAlign("leading");
    obj.comboBox10:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox10:setValues({'1', '2', '3'});
    obj.comboBox10:setName("comboBox10");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout6);
    obj.label50:setLeft(235);
    obj.label50:setTop(55);
    obj.label50:setWidth(50);
    obj.label50:setHeight(25);
    obj.label50:setText("AC");
    obj.label50:setName("label50");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout6);
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(277);
    obj.edit40:setTop(55);
    obj.edit40:setWidth(87);
    obj.edit40:setHeight(25);
    obj.edit40:setField("ACP5");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout6);
    obj.label51:setLeft(370);
    obj.label51:setTop(6);
    obj.label51:setWidth(70);
    obj.label51:setHeight(25);
    obj.label51:setText("Prec.Bôn.");
    obj.label51:setName("label51");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout6);
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(443);
    obj.edit41:setTop(6);
    obj.edit41:setWidth(42);
    obj.edit41:setHeight(25);
    obj.edit41:setField("ataqueP5");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout6);
    obj.label52:setLeft(370);
    obj.label52:setTop(31);
    obj.label52:setWidth(70);
    obj.label52:setHeight(25);
    obj.label52:setText("Dano Base");
    obj.label52:setName("label52");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout6);
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(443);
    obj.edit42:setTop(31);
    obj.edit42:setWidth(42);
    obj.edit42:setHeight(25);
    obj.edit42:setField("danoP5");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout6);
    obj.label53:setLeft(370);
    obj.label53:setTop(55);
    obj.label53:setWidth(70);
    obj.label53:setHeight(25);
    obj.label53:setText("Dano Bôn.");
    obj.label53:setName("label53");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout6);
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(443);
    obj.edit43:setTop(55);
    obj.edit43:setWidth(42);
    obj.edit43:setHeight(25);
    obj.edit43:setField("BonDMGP5");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

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
    obj.textEditor5:setWidth(280);
    obj.textEditor5:setHeight(50);
    obj.textEditor5:setField("campoEfeitoGolpesP5");
    obj.textEditor5:setName("textEditor5");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout6);
    obj.label54:setLeft(575);
    obj.label54:setTop(60);
    obj.label54:setWidth(60);
    obj.label54:setHeight(25);
    obj.label54:setText("Tipo(C)");
    obj.label54:setName("label54");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout6);
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(620);
    obj.edit44:setTop(60);
    obj.edit44:setWidth(45);
    obj.edit44:setHeight(25);
    obj.edit44:setField("tipoContestP5");
    obj.edit44:setName("edit44");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout6);
    obj.label55:setLeft(675);
    obj.label55:setTop(60);
    obj.label55:setWidth(60);
    obj.label55:setHeight(25);
    obj.label55:setText("Efeito(C)");
    obj.label55:setName("label55");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout6);
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(730);
    obj.edit45:setTop(60);
    obj.edit45:setWidth(125);
    obj.edit45:setHeight(25);
    obj.edit45:setField("efeitoContestP5");
    obj.edit45:setName("edit45");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(2);
    obj.layout7:setTop(478);
    obj.layout7:setWidth(880);
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

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout7);
    obj.label56:setLeft(25);
    obj.label56:setTop(5);
    obj.label56:setWidth(70);
    obj.label56:setHeight(25);
    obj.label56:setText("Golpe");
    obj.label56:setName("label56");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout7);
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(90);
    obj.edit46:setTop(5);
    obj.edit46:setWidth(135);
    obj.edit46:setHeight(25);
    obj.edit46:setField("golpeP6");
    obj.edit46:setName("edit46");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout7);
    obj.label57:setLeft(25);
    obj.label57:setTop(30);
    obj.label57:setWidth(80);
    obj.label57:setHeight(25);
    obj.label57:setText("Frequência");
    obj.label57:setName("label57");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout7);
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(90);
    obj.edit47:setTop(30);
    obj.edit47:setWidth(135);
    obj.edit47:setHeight(25);
    obj.edit47:setField("frequenciaP6");
    obj.edit47:setName("edit47");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout7);
    obj.label58:setLeft(25);
    obj.label58:setTop(55);
    obj.label58:setWidth(70);
    obj.label58:setHeight(25);
    obj.label58:setText("Alcance");
    obj.label58:setName("label58");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout7);
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(90);
    obj.edit48:setTop(55);
    obj.edit48:setWidth(135);
    obj.edit48:setHeight(25);
    obj.edit48:setField("alcanceP6");
    obj.edit48:setName("edit48");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout7);
    obj.label59:setLeft(235);
    obj.label59:setTop(6);
    obj.label59:setWidth(50);
    obj.label59:setHeight(25);
    obj.label59:setText("Tipo");
    obj.label59:setName("label59");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout7);
    obj.comboBox11:setLeft(277);
    obj.comboBox11:setTop(6);
    obj.comboBox11:setWidth(87);
    obj.comboBox11:setHeight(25);
    obj.comboBox11:setField("tipoP6");
    obj.comboBox11:setHorzTextAlign("leading");
    obj.comboBox11:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox11:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox11:setName("comboBox11");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout7);
    obj.label60:setLeft(235);
    obj.label60:setTop(31);
    obj.label60:setWidth(50);
    obj.label60:setHeight(25);
    obj.label60:setText("Classe");
    obj.label60:setName("label60");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout7);
    obj.comboBox12:setLeft(277);
    obj.comboBox12:setTop(31);
    obj.comboBox12:setWidth(87);
    obj.comboBox12:setHeight(25);
    obj.comboBox12:setField("classeP6");
    obj.comboBox12:setHorzTextAlign("leading");
    obj.comboBox12:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox12:setValues({'1', '2', '3'});
    obj.comboBox12:setName("comboBox12");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout7);
    obj.label61:setLeft(235);
    obj.label61:setTop(55);
    obj.label61:setWidth(50);
    obj.label61:setHeight(25);
    obj.label61:setText("AC");
    obj.label61:setName("label61");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout7);
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(277);
    obj.edit49:setTop(55);
    obj.edit49:setWidth(87);
    obj.edit49:setHeight(25);
    obj.edit49:setField("ACP6");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout7);
    obj.label62:setLeft(370);
    obj.label62:setTop(6);
    obj.label62:setWidth(70);
    obj.label62:setHeight(25);
    obj.label62:setText("Prec.Bôn.");
    obj.label62:setName("label62");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout7);
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(443);
    obj.edit50:setTop(6);
    obj.edit50:setWidth(42);
    obj.edit50:setHeight(25);
    obj.edit50:setField("ataqueP6");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout7);
    obj.label63:setLeft(370);
    obj.label63:setTop(31);
    obj.label63:setWidth(70);
    obj.label63:setHeight(25);
    obj.label63:setText("Dano Base");
    obj.label63:setName("label63");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout7);
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(443);
    obj.edit51:setTop(31);
    obj.edit51:setWidth(42);
    obj.edit51:setHeight(25);
    obj.edit51:setField("danoP6");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout7);
    obj.label64:setLeft(370);
    obj.label64:setTop(55);
    obj.label64:setWidth(70);
    obj.label64:setHeight(25);
    obj.label64:setText("Dano Bôn.");
    obj.label64:setName("label64");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout7);
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(443);
    obj.edit52:setTop(55);
    obj.edit52:setWidth(42);
    obj.edit52:setHeight(25);
    obj.edit52:setField("BonDMGP6");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

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
    obj.textEditor6:setWidth(280);
    obj.textEditor6:setHeight(50);
    obj.textEditor6:setField("campoEfeitoGolpesP6");
    obj.textEditor6:setName("textEditor6");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout7);
    obj.label65:setLeft(575);
    obj.label65:setTop(60);
    obj.label65:setWidth(60);
    obj.label65:setHeight(25);
    obj.label65:setText("Tipo(C)");
    obj.label65:setName("label65");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout7);
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(620);
    obj.edit53:setTop(60);
    obj.edit53:setWidth(45);
    obj.edit53:setHeight(25);
    obj.edit53:setField("tipoContestP6");
    obj.edit53:setName("edit53");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout7);
    obj.label66:setLeft(675);
    obj.label66:setTop(60);
    obj.label66:setWidth(60);
    obj.label66:setHeight(25);
    obj.label66:setText("Efeito(C)");
    obj.label66:setName("label66");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout7);
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(730);
    obj.edit54:setTop(60);
    obj.edit54:setWidth(125);
    obj.edit54:setHeight(25);
    obj.edit54:setField("efeitoContestP6");
    obj.edit54:setName("edit54");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(2);
    obj.layout8:setTop(644);
    obj.layout8:setWidth(880);
    obj.layout8:setHeight(92);
    obj.layout8:setName("layout8");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout8);
    obj.label67:setLeft(0);
    obj.label67:setTop(0);
    obj.label67:setWidth(880);
    obj.label67:setHeight(25);
    obj.label67:setText("Struggle, Guidance, Advanced Connection, Cluster Mind e similares");
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setFontSize(16);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(2);
    obj.layout9:setTop(668);
    obj.layout9:setWidth(880);
    obj.layout9:setHeight(92);
    obj.layout9:setName("layout9");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout9);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout9);
    obj.button37:setLeft(000);
    obj.button37:setTop(5);
    obj.button37:setWidth(20);
    obj.button37:setHeight(20);
    obj.button37:setText("I");
    obj.button37:setHint("Importar um Golpe");
    obj.button37:setName("button37");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout9);
    obj.button38:setLeft(000);
    obj.button38:setTop(30);
    obj.button38:setWidth(20);
    obj.button38:setHeight(20);
    obj.button38:setText("E");
    obj.button38:setHint("Exportar o Golpe");
    obj.button38:setName("button38");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout9);
    obj.button39:setLeft(000);
    obj.button39:setTop(55);
    obj.button39:setWidth(20);
    obj.button39:setHeight(20);
    obj.button39:setText("A");
    obj.button39:setHint("Apagar o Golpe");
    obj.button39:setName("button39");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout9);
    obj.label68:setLeft(25);
    obj.label68:setTop(5);
    obj.label68:setWidth(70);
    obj.label68:setHeight(25);
    obj.label68:setText("Golpe");
    obj.label68:setName("label68");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout9);
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(90);
    obj.edit55:setTop(5);
    obj.edit55:setWidth(135);
    obj.edit55:setHeight(25);
    obj.edit55:setField("golpeP7");
    obj.edit55:setName("edit55");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout9);
    obj.label69:setLeft(25);
    obj.label69:setTop(30);
    obj.label69:setWidth(80);
    obj.label69:setHeight(25);
    obj.label69:setText("Frequência");
    obj.label69:setName("label69");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout9);
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(90);
    obj.edit56:setTop(30);
    obj.edit56:setWidth(135);
    obj.edit56:setHeight(25);
    obj.edit56:setField("frequenciaP7");
    obj.edit56:setName("edit56");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout9);
    obj.label70:setLeft(25);
    obj.label70:setTop(55);
    obj.label70:setWidth(70);
    obj.label70:setHeight(25);
    obj.label70:setText("Alcance");
    obj.label70:setName("label70");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout9);
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(90);
    obj.edit57:setTop(55);
    obj.edit57:setWidth(135);
    obj.edit57:setHeight(25);
    obj.edit57:setField("alcanceP7");
    obj.edit57:setName("edit57");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout9);
    obj.label71:setLeft(235);
    obj.label71:setTop(6);
    obj.label71:setWidth(50);
    obj.label71:setHeight(25);
    obj.label71:setText("Tipo");
    obj.label71:setName("label71");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout9);
    obj.comboBox13:setLeft(277);
    obj.comboBox13:setTop(6);
    obj.comboBox13:setWidth(87);
    obj.comboBox13:setHeight(25);
    obj.comboBox13:setField("tipoP7");
    obj.comboBox13:setHorzTextAlign("leading");
    obj.comboBox13:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox13:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox13:setName("comboBox13");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout9);
    obj.label72:setLeft(235);
    obj.label72:setTop(31);
    obj.label72:setWidth(50);
    obj.label72:setHeight(25);
    obj.label72:setText("Classe");
    obj.label72:setName("label72");

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout9);
    obj.comboBox14:setLeft(277);
    obj.comboBox14:setTop(31);
    obj.comboBox14:setWidth(87);
    obj.comboBox14:setHeight(25);
    obj.comboBox14:setField("classeP7");
    obj.comboBox14:setHorzTextAlign("leading");
    obj.comboBox14:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox14:setValues({'1', '2', '3'});
    obj.comboBox14:setName("comboBox14");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout9);
    obj.label73:setLeft(235);
    obj.label73:setTop(55);
    obj.label73:setWidth(50);
    obj.label73:setHeight(25);
    obj.label73:setText("AC");
    obj.label73:setName("label73");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout9);
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(277);
    obj.edit58:setTop(55);
    obj.edit58:setWidth(87);
    obj.edit58:setHeight(25);
    obj.edit58:setField("ACP7");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout9);
    obj.label74:setLeft(370);
    obj.label74:setTop(6);
    obj.label74:setWidth(70);
    obj.label74:setHeight(25);
    obj.label74:setText("Prec.Bôn.");
    obj.label74:setName("label74");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout9);
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(443);
    obj.edit59:setTop(6);
    obj.edit59:setWidth(42);
    obj.edit59:setHeight(25);
    obj.edit59:setField("ataqueP7");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout9);
    obj.label75:setLeft(370);
    obj.label75:setTop(31);
    obj.label75:setWidth(70);
    obj.label75:setHeight(25);
    obj.label75:setText("Dano Base");
    obj.label75:setName("label75");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout9);
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(443);
    obj.edit60:setTop(31);
    obj.edit60:setWidth(42);
    obj.edit60:setHeight(25);
    obj.edit60:setField("danoP7");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout9);
    obj.label76:setLeft(370);
    obj.label76:setTop(55);
    obj.label76:setWidth(70);
    obj.label76:setHeight(25);
    obj.label76:setText("Dano Bôn.");
    obj.label76:setName("label76");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout9);
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(443);
    obj.edit61:setTop(55);
    obj.edit61:setWidth(42);
    obj.edit61:setHeight(25);
    obj.edit61:setField("BonDMGP7");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout9);
    obj.button40:setLeft(488);
    obj.button40:setTop(6);
    obj.button40:setWidth(82);
    obj.button40:setText("Acerto");
    obj.button40:setFontSize(11);
    obj.button40:setName("button40");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout9);
    obj.button41:setLeft(488);
    obj.button41:setTop(31);
    obj.button41:setWidth(82);
    obj.button41:setText("Dano");
    obj.button41:setFontSize(11);
    obj.button41:setName("button41");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout9);
    obj.button42:setLeft(488);
    obj.button42:setTop(55);
    obj.button42:setWidth(82);
    obj.button42:setText("Crítico");
    obj.button42:setFontSize(11);
    obj.button42:setName("button42");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout9);
    obj.textEditor7:setLeft(575);
    obj.textEditor7:setTop(5);
    obj.textEditor7:setWidth(280);
    obj.textEditor7:setHeight(50);
    obj.textEditor7:setField("campoEfeitoGolpesP7");
    obj.textEditor7:setName("textEditor7");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout9);
    obj.label77:setLeft(575);
    obj.label77:setTop(60);
    obj.label77:setWidth(60);
    obj.label77:setHeight(25);
    obj.label77:setText("Tipo(C)");
    obj.label77:setName("label77");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout9);
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(620);
    obj.edit62:setTop(60);
    obj.edit62:setWidth(45);
    obj.edit62:setHeight(25);
    obj.edit62:setField("tipoContestP7");
    obj.edit62:setName("edit62");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout9);
    obj.label78:setLeft(675);
    obj.label78:setTop(60);
    obj.label78:setWidth(60);
    obj.label78:setHeight(25);
    obj.label78:setText("Efeito(C)");
    obj.label78:setName("label78");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout9);
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(730);
    obj.edit63:setTop(60);
    obj.edit63:setWidth(125);
    obj.edit63:setHeight(25);
    obj.edit63:setField("efeitoContestP7");
    obj.edit63:setName("edit63");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(2);
    obj.layout10:setTop(763);
    obj.layout10:setWidth(880);
    obj.layout10:setHeight(92);
    obj.layout10:setName("layout10");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout10);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout10);
    obj.button43:setLeft(000);
    obj.button43:setTop(5);
    obj.button43:setWidth(20);
    obj.button43:setHeight(20);
    obj.button43:setText("I");
    obj.button43:setHint("Importar um Golpe");
    obj.button43:setName("button43");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout10);
    obj.button44:setLeft(000);
    obj.button44:setTop(30);
    obj.button44:setWidth(20);
    obj.button44:setHeight(20);
    obj.button44:setText("E");
    obj.button44:setHint("Exportar o Golpe");
    obj.button44:setName("button44");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout10);
    obj.button45:setLeft(000);
    obj.button45:setTop(55);
    obj.button45:setWidth(20);
    obj.button45:setHeight(20);
    obj.button45:setText("A");
    obj.button45:setHint("Apagar o Golpe");
    obj.button45:setName("button45");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout10);
    obj.label79:setLeft(25);
    obj.label79:setTop(5);
    obj.label79:setWidth(70);
    obj.label79:setHeight(25);
    obj.label79:setText("Golpe");
    obj.label79:setName("label79");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout10);
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(90);
    obj.edit64:setTop(5);
    obj.edit64:setWidth(135);
    obj.edit64:setHeight(25);
    obj.edit64:setField("golpeP8");
    obj.edit64:setName("edit64");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout10);
    obj.label80:setLeft(25);
    obj.label80:setTop(30);
    obj.label80:setWidth(80);
    obj.label80:setHeight(25);
    obj.label80:setText("Frequência");
    obj.label80:setName("label80");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout10);
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(90);
    obj.edit65:setTop(30);
    obj.edit65:setWidth(135);
    obj.edit65:setHeight(25);
    obj.edit65:setField("frequenciaP8");
    obj.edit65:setName("edit65");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout10);
    obj.label81:setLeft(25);
    obj.label81:setTop(55);
    obj.label81:setWidth(70);
    obj.label81:setHeight(25);
    obj.label81:setText("Alcance");
    obj.label81:setName("label81");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout10);
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(90);
    obj.edit66:setTop(55);
    obj.edit66:setWidth(135);
    obj.edit66:setHeight(25);
    obj.edit66:setField("alcanceP8");
    obj.edit66:setName("edit66");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout10);
    obj.label82:setLeft(235);
    obj.label82:setTop(6);
    obj.label82:setWidth(50);
    obj.label82:setHeight(25);
    obj.label82:setText("Tipo");
    obj.label82:setName("label82");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout10);
    obj.comboBox15:setLeft(277);
    obj.comboBox15:setTop(6);
    obj.comboBox15:setWidth(87);
    obj.comboBox15:setHeight(25);
    obj.comboBox15:setField("tipoP8");
    obj.comboBox15:setHorzTextAlign("leading");
    obj.comboBox15:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox15:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox15:setName("comboBox15");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout10);
    obj.label83:setLeft(235);
    obj.label83:setTop(31);
    obj.label83:setWidth(50);
    obj.label83:setHeight(25);
    obj.label83:setText("Classe");
    obj.label83:setName("label83");

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout10);
    obj.comboBox16:setLeft(277);
    obj.comboBox16:setTop(31);
    obj.comboBox16:setWidth(87);
    obj.comboBox16:setHeight(25);
    obj.comboBox16:setField("classeP8");
    obj.comboBox16:setHorzTextAlign("leading");
    obj.comboBox16:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox16:setValues({'1', '2', '3'});
    obj.comboBox16:setName("comboBox16");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout10);
    obj.label84:setLeft(235);
    obj.label84:setTop(55);
    obj.label84:setWidth(50);
    obj.label84:setHeight(25);
    obj.label84:setText("AC");
    obj.label84:setName("label84");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout10);
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(277);
    obj.edit67:setTop(55);
    obj.edit67:setWidth(87);
    obj.edit67:setHeight(25);
    obj.edit67:setField("ACP8");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout10);
    obj.label85:setLeft(370);
    obj.label85:setTop(6);
    obj.label85:setWidth(70);
    obj.label85:setHeight(25);
    obj.label85:setText("Prec.Bôn.");
    obj.label85:setName("label85");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout10);
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(443);
    obj.edit68:setTop(6);
    obj.edit68:setWidth(42);
    obj.edit68:setHeight(25);
    obj.edit68:setField("ataqueP8");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout10);
    obj.label86:setLeft(370);
    obj.label86:setTop(31);
    obj.label86:setWidth(70);
    obj.label86:setHeight(25);
    obj.label86:setText("Dano Base");
    obj.label86:setName("label86");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout10);
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(443);
    obj.edit69:setTop(31);
    obj.edit69:setWidth(42);
    obj.edit69:setHeight(25);
    obj.edit69:setField("danoP8");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setName("edit69");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout10);
    obj.label87:setLeft(370);
    obj.label87:setTop(55);
    obj.label87:setWidth(70);
    obj.label87:setHeight(25);
    obj.label87:setText("Dano Bôn.");
    obj.label87:setName("label87");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout10);
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(443);
    obj.edit70:setTop(55);
    obj.edit70:setWidth(42);
    obj.edit70:setHeight(25);
    obj.edit70:setField("BonDMGP8");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout10);
    obj.button46:setLeft(488);
    obj.button46:setTop(6);
    obj.button46:setWidth(82);
    obj.button46:setText("Acerto");
    obj.button46:setFontSize(11);
    obj.button46:setName("button46");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout10);
    obj.button47:setLeft(488);
    obj.button47:setTop(31);
    obj.button47:setWidth(82);
    obj.button47:setText("Dano");
    obj.button47:setFontSize(11);
    obj.button47:setName("button47");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout10);
    obj.button48:setLeft(488);
    obj.button48:setTop(55);
    obj.button48:setWidth(82);
    obj.button48:setText("Crítico");
    obj.button48:setFontSize(11);
    obj.button48:setName("button48");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout10);
    obj.textEditor8:setLeft(575);
    obj.textEditor8:setTop(5);
    obj.textEditor8:setWidth(280);
    obj.textEditor8:setHeight(50);
    obj.textEditor8:setField("campoEfeitoGolpesP8");
    obj.textEditor8:setName("textEditor8");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout10);
    obj.label88:setLeft(575);
    obj.label88:setTop(60);
    obj.label88:setWidth(60);
    obj.label88:setHeight(25);
    obj.label88:setText("Tipo(C)");
    obj.label88:setName("label88");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout10);
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(620);
    obj.edit71:setTop(60);
    obj.edit71:setWidth(45);
    obj.edit71:setHeight(25);
    obj.edit71:setField("tipoContestP8");
    obj.edit71:setName("edit71");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout10);
    obj.label89:setLeft(675);
    obj.label89:setTop(60);
    obj.label89:setWidth(60);
    obj.label89:setHeight(25);
    obj.label89:setText("Efeito(C)");
    obj.label89:setName("label89");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout10);
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(730);
    obj.edit72:setTop(60);
    obj.edit72:setWidth(125);
    obj.edit72:setHeight(25);
    obj.edit72:setField("efeitoContestP8");
    obj.edit72:setName("edit72");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(2);
    obj.layout11:setTop(858);
    obj.layout11:setWidth(880);
    obj.layout11:setHeight(92);
    obj.layout11:setName("layout11");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout11);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout11);
    obj.button49:setLeft(000);
    obj.button49:setTop(5);
    obj.button49:setWidth(20);
    obj.button49:setHeight(20);
    obj.button49:setText("I");
    obj.button49:setHint("Importar um Golpe");
    obj.button49:setName("button49");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout11);
    obj.button50:setLeft(000);
    obj.button50:setTop(30);
    obj.button50:setWidth(20);
    obj.button50:setHeight(20);
    obj.button50:setText("E");
    obj.button50:setHint("Exportar o Golpe");
    obj.button50:setName("button50");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout11);
    obj.button51:setLeft(000);
    obj.button51:setTop(55);
    obj.button51:setWidth(20);
    obj.button51:setHeight(20);
    obj.button51:setText("A");
    obj.button51:setHint("Apagar o Golpe");
    obj.button51:setName("button51");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout11);
    obj.label90:setLeft(25);
    obj.label90:setTop(5);
    obj.label90:setWidth(70);
    obj.label90:setHeight(25);
    obj.label90:setText("Golpe");
    obj.label90:setName("label90");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout11);
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(90);
    obj.edit73:setTop(5);
    obj.edit73:setWidth(135);
    obj.edit73:setHeight(25);
    obj.edit73:setField("golpeP9");
    obj.edit73:setName("edit73");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout11);
    obj.label91:setLeft(25);
    obj.label91:setTop(30);
    obj.label91:setWidth(80);
    obj.label91:setHeight(25);
    obj.label91:setText("Frequência");
    obj.label91:setName("label91");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout11);
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(90);
    obj.edit74:setTop(30);
    obj.edit74:setWidth(135);
    obj.edit74:setHeight(25);
    obj.edit74:setField("frequenciaP9");
    obj.edit74:setName("edit74");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout11);
    obj.label92:setLeft(25);
    obj.label92:setTop(55);
    obj.label92:setWidth(70);
    obj.label92:setHeight(25);
    obj.label92:setText("Alcance");
    obj.label92:setName("label92");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout11);
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(90);
    obj.edit75:setTop(55);
    obj.edit75:setWidth(135);
    obj.edit75:setHeight(25);
    obj.edit75:setField("alcanceP9");
    obj.edit75:setName("edit75");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout11);
    obj.label93:setLeft(235);
    obj.label93:setTop(6);
    obj.label93:setWidth(50);
    obj.label93:setHeight(25);
    obj.label93:setText("Tipo");
    obj.label93:setName("label93");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout11);
    obj.comboBox17:setLeft(277);
    obj.comboBox17:setTop(6);
    obj.comboBox17:setWidth(87);
    obj.comboBox17:setHeight(25);
    obj.comboBox17:setField("tipoP9");
    obj.comboBox17:setHorzTextAlign("leading");
    obj.comboBox17:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox17:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox17:setName("comboBox17");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout11);
    obj.label94:setLeft(235);
    obj.label94:setTop(31);
    obj.label94:setWidth(50);
    obj.label94:setHeight(25);
    obj.label94:setText("Classe");
    obj.label94:setName("label94");

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout11);
    obj.comboBox18:setLeft(277);
    obj.comboBox18:setTop(31);
    obj.comboBox18:setWidth(87);
    obj.comboBox18:setHeight(25);
    obj.comboBox18:setField("classeP9");
    obj.comboBox18:setHorzTextAlign("leading");
    obj.comboBox18:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox18:setValues({'1', '2', '3'});
    obj.comboBox18:setName("comboBox18");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout11);
    obj.label95:setLeft(235);
    obj.label95:setTop(55);
    obj.label95:setWidth(50);
    obj.label95:setHeight(25);
    obj.label95:setText("AC");
    obj.label95:setName("label95");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout11);
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(277);
    obj.edit76:setTop(55);
    obj.edit76:setWidth(87);
    obj.edit76:setHeight(25);
    obj.edit76:setField("ACP9");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout11);
    obj.label96:setLeft(370);
    obj.label96:setTop(6);
    obj.label96:setWidth(70);
    obj.label96:setHeight(25);
    obj.label96:setText("Prec.Bôn.");
    obj.label96:setName("label96");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout11);
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(443);
    obj.edit77:setTop(6);
    obj.edit77:setWidth(42);
    obj.edit77:setHeight(25);
    obj.edit77:setField("ataqueP9");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout11);
    obj.label97:setLeft(370);
    obj.label97:setTop(31);
    obj.label97:setWidth(70);
    obj.label97:setHeight(25);
    obj.label97:setText("Dano Base");
    obj.label97:setName("label97");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout11);
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(443);
    obj.edit78:setTop(31);
    obj.edit78:setWidth(42);
    obj.edit78:setHeight(25);
    obj.edit78:setField("danoP9");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout11);
    obj.label98:setLeft(370);
    obj.label98:setTop(55);
    obj.label98:setWidth(70);
    obj.label98:setHeight(25);
    obj.label98:setText("Dano Bôn.");
    obj.label98:setName("label98");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout11);
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(443);
    obj.edit79:setTop(55);
    obj.edit79:setWidth(42);
    obj.edit79:setHeight(25);
    obj.edit79:setField("BonDMGP9");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout11);
    obj.button52:setLeft(488);
    obj.button52:setTop(6);
    obj.button52:setWidth(82);
    obj.button52:setText("Acerto");
    obj.button52:setFontSize(11);
    obj.button52:setName("button52");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout11);
    obj.button53:setLeft(488);
    obj.button53:setTop(31);
    obj.button53:setWidth(82);
    obj.button53:setText("Dano");
    obj.button53:setFontSize(11);
    obj.button53:setName("button53");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout11);
    obj.button54:setLeft(488);
    obj.button54:setTop(55);
    obj.button54:setWidth(82);
    obj.button54:setText("Crítico");
    obj.button54:setFontSize(11);
    obj.button54:setName("button54");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout11);
    obj.textEditor9:setLeft(575);
    obj.textEditor9:setTop(5);
    obj.textEditor9:setWidth(280);
    obj.textEditor9:setHeight(50);
    obj.textEditor9:setField("campoEfeitoGolpesP9");
    obj.textEditor9:setName("textEditor9");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout11);
    obj.label99:setLeft(575);
    obj.label99:setTop(60);
    obj.label99:setWidth(60);
    obj.label99:setHeight(25);
    obj.label99:setText("Tipo(C)");
    obj.label99:setName("label99");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout11);
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(620);
    obj.edit80:setTop(60);
    obj.edit80:setWidth(45);
    obj.edit80:setHeight(25);
    obj.edit80:setField("tipoContestP9");
    obj.edit80:setName("edit80");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout11);
    obj.label100:setLeft(675);
    obj.label100:setTop(60);
    obj.label100:setWidth(60);
    obj.label100:setHeight(25);
    obj.label100:setText("Efeito(C)");
    obj.label100:setName("label100");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout11);
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(730);
    obj.edit81:setTop(60);
    obj.edit81:setWidth(125);
    obj.edit81:setHeight(25);
    obj.edit81:setField("efeitoContestP9");
    obj.edit81:setName("edit81");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "text/plain", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            						local msg = arq.stream:readBinary("ansi",txt);
            						local import = strToTable(msg);
            						self.boxDetalhesDoItem.node.golpeP1 = import[1];
            						self.boxDetalhesDoItem.node.frequenciaP1 = import[2];
            						self.boxDetalhesDoItem.node.alcanceP1 = import[3];
            						self.boxDetalhesDoItem.node.tipoP1 = import[4];
            						self.boxDetalhesDoItem.node.classeP1 = import[5];
            						self.boxDetalhesDoItem.node.ACP1 = import[6];
            						self.boxDetalhesDoItem.node.ataqueP1 = import[7];
            						self.boxDetalhesDoItem.node.danoP1 = import[8];
            						self.boxDetalhesDoItem.node.BonDMGP1 = import[9];
            						self.boxDetalhesDoItem.node.campoEfeitoGolpesP1 = import[10];
            						self.boxDetalhesDoItem.node.tipoContestP1 = import[11];
            						self.boxDetalhesDoItem.node.efeitoContestP1 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {self.boxDetalhesDoItem.node.golpeP1, self.boxDetalhesDoItem.node.frequenciaP1, self.boxDetalhesDoItem.node.alcanceP1, self.boxDetalhesDoItem.node.tipoP1, self.boxDetalhesDoItem.node.classeP1, self.boxDetalhesDoItem.node.ACP1, self.boxDetalhesDoItem.node.ataqueP1, self.boxDetalhesDoItem.node.danoP1, self.boxDetalhesDoItem.node.BonDMGP1, self.boxDetalhesDoItem.node.campoEfeitoGolpesP1, self.boxDetalhesDoItem.node.tipoContestP1, self.boxDetalhesDoItem.node.efeitoContestP1};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.golpeP1 = nil;
            				self.boxDetalhesDoItem.node.frequenciaP1 = nil;
            				self.boxDetalhesDoItem.node.alcanceP1 = nil;
            				self.boxDetalhesDoItem.node.tipoP1 = nil;
            				self.boxDetalhesDoItem.node.classeP1 = nil;
            				self.boxDetalhesDoItem.node.ACP1 = nil;
            				self.boxDetalhesDoItem.node.ataqueP1 = nil;
            				self.boxDetalhesDoItem.node.danoP1 = nil;
            				self.boxDetalhesDoItem.node.BonDMGP1 = nil;
            				self.boxDetalhesDoItem.node.campoEfeitoGolpesP1 = nil;
            				self.boxDetalhesDoItem.node.tipoContestP1 = nil;
            				self.boxDetalhesDoItem.node.efeitoContestP1 = nil;
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = tonumber(self.boxDetalhesDoItem.node.ataqueP1) or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP1 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local flagFocadoTr = self.boxDetalhesDoItem.node.focTr or false
            					if (flagFocadoTr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local flagFocadoOr = self.boxDetalhesDoItem.node.focOr or false
            					if (flagFocadoOr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local Accuracy = tonumber(self.boxDetalhesDoItem.node.ACP1) or "N/A"
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP1) or 0;
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
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP1) or 3;
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
            					if (ATAQUE > 6) then
            						ATAQUE = 6;
            						end
            					if (-6 > ATAQUE) then
            						ATAQUE = -6;
            						end
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP1) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP1 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP1) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP1) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end					
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP1 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP1) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP1 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP1) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP1) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end							
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP1 or 0;
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
            						self.boxDetalhesDoItem.node.golpeP2 = import[1];
            						self.boxDetalhesDoItem.node.frequenciaP2 = import[2];
            						self.boxDetalhesDoItem.node.alcanceP2 = import[3];
            						self.boxDetalhesDoItem.node.tipoP2 = import[4];
            						self.boxDetalhesDoItem.node.classeP2 = import[5];
            						self.boxDetalhesDoItem.node.ACP2 = import[6];
            						self.boxDetalhesDoItem.node.ataqueP2 = import[7];
            						self.boxDetalhesDoItem.node.danoP2 = import[8];
            						self.boxDetalhesDoItem.node.BonDMGP2 = import[9];
            						self.boxDetalhesDoItem.node.campoEfeitoGolpesP2 = import[10];
            						self.boxDetalhesDoItem.node.tipoContestP2 = import[11];
            						self.boxDetalhesDoItem.node.efeitoContestP2 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {self.boxDetalhesDoItem.node.golpeP2, self.boxDetalhesDoItem.node.frequenciaP2, self.boxDetalhesDoItem.node.alcanceP2, self.boxDetalhesDoItem.node.tipoP2, self.boxDetalhesDoItem.node.classeP2, self.boxDetalhesDoItem.node.ACP2, self.boxDetalhesDoItem.node.ataqueP2, self.boxDetalhesDoItem.node.danoP2, self.boxDetalhesDoItem.node.BonDMGP2, self.boxDetalhesDoItem.node.campoEfeitoGolpesP2, self.boxDetalhesDoItem.node.tipoContestP2, self.boxDetalhesDoItem.node.efeitoContestP2};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.golpeP2 = nil;
            				self.boxDetalhesDoItem.node.frequenciaP2 = nil;
            				self.boxDetalhesDoItem.node.alcanceP2 = nil;
            				self.boxDetalhesDoItem.node.tipoP2 = nil;
            				self.boxDetalhesDoItem.node.classeP2 = nil;
            				self.boxDetalhesDoItem.node.ACP2 = nil;
            				self.boxDetalhesDoItem.node.ataqueP2 = nil;
            				self.boxDetalhesDoItem.node.danoP2 = nil;
            				self.boxDetalhesDoItem.node.BonDMGP2 = nil;
            				self.boxDetalhesDoItem.node.campoEfeitoGolpesP2 = nil;
            				self.boxDetalhesDoItem.node.tipoContestP2 = nil;
            				self.boxDetalhesDoItem.node.efeitoContestP2 = nil;
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = tonumber(self.boxDetalhesDoItem.node.ataqueP2) or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP2 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local flagFocadoTr = self.boxDetalhesDoItem.node.focTr or false
            					if (flagFocadoTr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local flagFocadoOr = self.boxDetalhesDoItem.node.focOr or false
            					if (flagFocadoOr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local Accuracy = tonumber(self.boxDetalhesDoItem.node.ACP2) or "N/A"
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP2) or 0;
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
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP2) or 3;
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
            					if (ATAQUE > 6) then
            						ATAQUE = 6;
            						end
            					if (-6 > ATAQUE) then
            						ATAQUE = -6;
            						end
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP2) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP2 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP2) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP2) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end					
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP2 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP2) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP2 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP2) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP2) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end							
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP2 or 0;
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
            						self.boxDetalhesDoItem.node.golpeP3 = import[1];
            						self.boxDetalhesDoItem.node.frequenciaP3 = import[2];
            						self.boxDetalhesDoItem.node.alcanceP3 = import[3];
            						self.boxDetalhesDoItem.node.tipoP3 = import[4];
            						self.boxDetalhesDoItem.node.classeP3 = import[5];
            						self.boxDetalhesDoItem.node.ACP3 = import[6];
            						self.boxDetalhesDoItem.node.ataqueP3 = import[7];
            						self.boxDetalhesDoItem.node.danoP3 = import[8];
            						self.boxDetalhesDoItem.node.BonDMGP3 = import[9];
            						self.boxDetalhesDoItem.node.campoEfeitoGolpesP3 = import[10];
            						self.boxDetalhesDoItem.node.tipoContestP3 = import[11];
            						self.boxDetalhesDoItem.node.efeitoContestP3 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {self.boxDetalhesDoItem.node.golpeP3, self.boxDetalhesDoItem.node.frequenciaP3, self.boxDetalhesDoItem.node.alcanceP3, self.boxDetalhesDoItem.node.tipoP3, self.boxDetalhesDoItem.node.classeP3, self.boxDetalhesDoItem.node.ACP3, self.boxDetalhesDoItem.node.ataqueP3, self.boxDetalhesDoItem.node.danoP3, self.boxDetalhesDoItem.node.BonDMGP3, self.boxDetalhesDoItem.node.campoEfeitoGolpesP3, self.boxDetalhesDoItem.node.tipoContestP3, self.boxDetalhesDoItem.node.efeitoContestP3};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.golpeP3 = nil;
            				self.boxDetalhesDoItem.node.frequenciaP3 = nil;
            				self.boxDetalhesDoItem.node.alcanceP3 = nil;
            				self.boxDetalhesDoItem.node.tipoP3 = nil;
            				self.boxDetalhesDoItem.node.classeP3 = nil;
            				self.boxDetalhesDoItem.node.ACP3 = nil;
            				self.boxDetalhesDoItem.node.ataqueP3 = nil;
            				self.boxDetalhesDoItem.node.danoP3 = nil;
            				self.boxDetalhesDoItem.node.BonDMGP3 = nil;
            				self.boxDetalhesDoItem.node.campoEfeitoGolpesP3 = nil;
            				self.boxDetalhesDoItem.node.tipoContestP3 = nil;
            				self.boxDetalhesDoItem.node.efeitoContestP3 = nil;
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = tonumber(self.boxDetalhesDoItem.node.ataqueP3) or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP3 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local flagFocadoTr = self.boxDetalhesDoItem.node.focTr or false
            					if (flagFocadoTr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local flagFocadoOr = self.boxDetalhesDoItem.node.focOr or false
            					if (flagFocadoOr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local Accuracy = tonumber(self.boxDetalhesDoItem.node.ACP3) or "N/A"
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP3) or 0;
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
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP3) or 3;
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
            					if (ATAQUE > 6) then
            						ATAQUE = 6;
            						end
            					if (-6 > ATAQUE) then
            						ATAQUE = -6;
            						end
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP3) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP3 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP3) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP3) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end					
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP3 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP3) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP3 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP3) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP3) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end							
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP3 or 0;
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
            						self.boxDetalhesDoItem.node.golpeP4 = import[1];
            						self.boxDetalhesDoItem.node.frequenciaP4 = import[2];
            						self.boxDetalhesDoItem.node.alcanceP4 = import[3];
            						self.boxDetalhesDoItem.node.tipoP4 = import[4];
            						self.boxDetalhesDoItem.node.classeP4 = import[5];
            						self.boxDetalhesDoItem.node.ACP4 = import[6];
            						self.boxDetalhesDoItem.node.ataqueP4 = import[7];
            						self.boxDetalhesDoItem.node.danoP4 = import[8];
            						self.boxDetalhesDoItem.node.BonDMGP4 = import[9];
            						self.boxDetalhesDoItem.node.campoEfeitoGolpesP4 = import[10];
            						self.boxDetalhesDoItem.node.tipoContestP4 = import[11];
            						self.boxDetalhesDoItem.node.efeitoContestP4 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {self.boxDetalhesDoItem.node.golpeP4, self.boxDetalhesDoItem.node.frequenciaP4, self.boxDetalhesDoItem.node.alcanceP4, self.boxDetalhesDoItem.node.tipoP4, self.boxDetalhesDoItem.node.classeP4, self.boxDetalhesDoItem.node.ACP4, self.boxDetalhesDoItem.node.ataqueP4, self.boxDetalhesDoItem.node.danoP4, self.boxDetalhesDoItem.node.BonDMGP4, self.boxDetalhesDoItem.node.campoEfeitoGolpesP4, self.boxDetalhesDoItem.node.tipoContestP4, self.boxDetalhesDoItem.node.efeitoContestP4};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.golpeP4 = nil;
            				self.boxDetalhesDoItem.node.frequenciaP4 = nil;
            				self.boxDetalhesDoItem.node.alcanceP4 = nil;
            				self.boxDetalhesDoItem.node.tipoP4 = nil;
            				self.boxDetalhesDoItem.node.classeP4 = nil;
            				self.boxDetalhesDoItem.node.ACP4 = nil;
            				self.boxDetalhesDoItem.node.ataqueP4 = nil;
            				self.boxDetalhesDoItem.node.danoP4 = nil;
            				self.boxDetalhesDoItem.node.BonDMGP4 = nil;
            				self.boxDetalhesDoItem.node.campoEfeitoGolpesP4 = nil;
            				self.boxDetalhesDoItem.node.tipoContestP4 = nil;
            				self.boxDetalhesDoItem.node.efeitoContestP4 = nil;
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = tonumber(self.boxDetalhesDoItem.node.ataqueP4) or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP4 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local flagFocadoTr = self.boxDetalhesDoItem.node.focTr or false
            					if (flagFocadoTr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local flagFocadoOr = self.boxDetalhesDoItem.node.focOr or false
            					if (flagFocadoOr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local Accuracy = tonumber(self.boxDetalhesDoItem.node.ACP4) or "N/A"
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP4) or 0;
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
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP4) or 3;
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
            					if (ATAQUE > 6) then
            						ATAQUE = 6;
            						end
            					if (-6 > ATAQUE) then
            						ATAQUE = -6;
            						end
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP4) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP4 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP4) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP4) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end					
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP4 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event23 = obj.button24:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP4) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP4 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP4) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP4) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end							
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP4 or 0;
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
            						self.boxDetalhesDoItem.node.golpeP5 = import[1];
            						self.boxDetalhesDoItem.node.frequenciaP5 = import[2];
            						self.boxDetalhesDoItem.node.alcanceP5 = import[3];
            						self.boxDetalhesDoItem.node.tipoP5 = import[4];
            						self.boxDetalhesDoItem.node.classeP5 = import[5];
            						self.boxDetalhesDoItem.node.ACP5 = import[6];
            						self.boxDetalhesDoItem.node.ataqueP5 = import[7];
            						self.boxDetalhesDoItem.node.danoP5 = import[8];
            						self.boxDetalhesDoItem.node.BonDMGP5 = import[9];
            						self.boxDetalhesDoItem.node.campoEfeitoGolpesP5 = import[10];
            						self.boxDetalhesDoItem.node.tipoContestP5 = import[11];
            						self.boxDetalhesDoItem.node.efeitoContestP5 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event25 = obj.button26:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {self.boxDetalhesDoItem.node.golpeP5, self.boxDetalhesDoItem.node.frequenciaP5, self.boxDetalhesDoItem.node.alcanceP5, self.boxDetalhesDoItem.node.tipoP5, self.boxDetalhesDoItem.node.classeP5, self.boxDetalhesDoItem.node.ACP5, self.boxDetalhesDoItem.node.ataqueP5, self.boxDetalhesDoItem.node.danoP5, self.boxDetalhesDoItem.node.BonDMGP5, self.boxDetalhesDoItem.node.campoEfeitoGolpesP5, self.boxDetalhesDoItem.node.tipoContestP5, self.boxDetalhesDoItem.node.efeitoContestP5};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event26 = obj.button27:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.golpeP5 = nil;
            				self.boxDetalhesDoItem.node.frequenciaP5 = nil;
            				self.boxDetalhesDoItem.node.alcanceP5 = nil;
            				self.boxDetalhesDoItem.node.tipoP5 = nil;
            				self.boxDetalhesDoItem.node.classeP5 = nil;
            				self.boxDetalhesDoItem.node.ACP5 = nil;
            				self.boxDetalhesDoItem.node.ataqueP5 = nil;
            				self.boxDetalhesDoItem.node.danoP5 = nil;
            				self.boxDetalhesDoItem.node.BonDMGP5 = nil;
            				self.boxDetalhesDoItem.node.campoEfeitoGolpesP5 = nil;
            				self.boxDetalhesDoItem.node.tipoContestP5 = nil;
            				self.boxDetalhesDoItem.node.efeitoContestP5 = nil;
        end, obj);

    obj._e_event27 = obj.button28:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = tonumber(self.boxDetalhesDoItem.node.ataqueP5) or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP5 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local flagFocadoTr = self.boxDetalhesDoItem.node.focTr or false
            					if (flagFocadoTr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local flagFocadoOr = self.boxDetalhesDoItem.node.focOr or false
            					if (flagFocadoOr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local Accuracy = tonumber(self.boxDetalhesDoItem.node.ACP5) or "N/A"
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP5) or 0;
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
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP5) or 3;
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
            					if (ATAQUE > 6) then
            						ATAQUE = 6;
            						end
            					if (-6 > ATAQUE) then
            						ATAQUE = -6;
            						end
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event28 = obj.button29:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP5) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP5 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP5) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP5) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end					
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP5 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event29 = obj.button30:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP5) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP5 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP5) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP5) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end							
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP5 or 0;
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
            						self.boxDetalhesDoItem.node.golpeP6 = import[1];
            						self.boxDetalhesDoItem.node.frequenciaP6 = import[2];
            						self.boxDetalhesDoItem.node.alcanceP6 = import[3];
            						self.boxDetalhesDoItem.node.tipoP6 = import[4];
            						self.boxDetalhesDoItem.node.classeP6 = import[5];
            						self.boxDetalhesDoItem.node.ACP6 = import[6];
            						self.boxDetalhesDoItem.node.ataqueP6 = import[7];
            						self.boxDetalhesDoItem.node.danoP6 = import[8];
            						self.boxDetalhesDoItem.node.BonDMGP6 = import[9];
            						self.boxDetalhesDoItem.node.campoEfeitoGolpesP6 = import[10];
            						self.boxDetalhesDoItem.node.tipoContestP6 = import[11];
            						self.boxDetalhesDoItem.node.efeitoContestP6 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event31 = obj.button32:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {self.boxDetalhesDoItem.node.golpeP6, self.boxDetalhesDoItem.node.frequenciaP6, self.boxDetalhesDoItem.node.alcanceP6, self.boxDetalhesDoItem.node.tipoP6, self.boxDetalhesDoItem.node.classeP6, self.boxDetalhesDoItem.node.ACP6, self.boxDetalhesDoItem.node.ataqueP6, self.boxDetalhesDoItem.node.danoP6, self.boxDetalhesDoItem.node.BonDMGP6, self.boxDetalhesDoItem.node.campoEfeitoGolpesP6, self.boxDetalhesDoItem.node.tipoContestP6, self.boxDetalhesDoItem.node.efeitoContestP6};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event32 = obj.button33:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.golpeP6 = nil;
            				self.boxDetalhesDoItem.node.frequenciaP6 = nil;
            				self.boxDetalhesDoItem.node.alcanceP6 = nil;
            				self.boxDetalhesDoItem.node.tipoP6 = nil;
            				self.boxDetalhesDoItem.node.classeP6 = nil;
            				self.boxDetalhesDoItem.node.ACP6 = nil;
            				self.boxDetalhesDoItem.node.ataqueP6 = nil;
            				self.boxDetalhesDoItem.node.danoP6 = nil;
            				self.boxDetalhesDoItem.node.BonDMGP6 = nil;
            				self.boxDetalhesDoItem.node.campoEfeitoGolpesP6 = nil;
            				self.boxDetalhesDoItem.node.tipoContestP6 = nil;
            				self.boxDetalhesDoItem.node.efeitoContestP6 = nil;
        end, obj);

    obj._e_event33 = obj.button34:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = tonumber(self.boxDetalhesDoItem.node.ataqueP6) or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP6 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local flagFocadoTr = self.boxDetalhesDoItem.node.focTr or false
            					if (flagFocadoTr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local flagFocadoOr = self.boxDetalhesDoItem.node.focOr or false
            					if (flagFocadoOr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local Accuracy = tonumber(self.boxDetalhesDoItem.node.ACP6) or "N/A"
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP6) or 0;
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
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP6) or 3;
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
            					if (ATAQUE > 6) then
            						ATAQUE = 6;
            						end
            					if (-6 > ATAQUE) then
            						ATAQUE = -6;
            						end
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event34 = obj.button35:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP6) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP6 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP6) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP6) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end					
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP6 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event35 = obj.button36:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP6) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP6 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP6) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP6) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end							
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP6 or 0;
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
            						self.boxDetalhesDoItem.node.golpeP7 = import[1];
            						self.boxDetalhesDoItem.node.frequenciaP7 = import[2];
            						self.boxDetalhesDoItem.node.alcanceP7 = import[3];
            						self.boxDetalhesDoItem.node.tipoP7 = import[4];
            						self.boxDetalhesDoItem.node.classeP7 = import[5];
            						self.boxDetalhesDoItem.node.ACP7 = import[6];
            						self.boxDetalhesDoItem.node.ataqueP7 = import[7];
            						self.boxDetalhesDoItem.node.danoP7 = import[8];
            						self.boxDetalhesDoItem.node.BonDMGP7 = import[9];
            						self.boxDetalhesDoItem.node.campoEfeitoGolpesP7 = import[10];
            						self.boxDetalhesDoItem.node.tipoContestP7 = import[11];
            						self.boxDetalhesDoItem.node.efeitoContestP7 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event37 = obj.button38:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {self.boxDetalhesDoItem.node.golpeP7, self.boxDetalhesDoItem.node.frequenciaP7, self.boxDetalhesDoItem.node.alcanceP7, self.boxDetalhesDoItem.node.tipoP7, self.boxDetalhesDoItem.node.classeP7, self.boxDetalhesDoItem.node.ACP7, self.boxDetalhesDoItem.node.ataqueP7, self.boxDetalhesDoItem.node.danoP7, self.boxDetalhesDoItem.node.BonDMGP7, self.boxDetalhesDoItem.node.campoEfeitoGolpesP7, self.boxDetalhesDoItem.node.tipoContestP7, self.boxDetalhesDoItem.node.efeitoContestP7};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event38 = obj.button39:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.golpeP7 = nil;
            				self.boxDetalhesDoItem.node.frequenciaP7 = nil;
            				self.boxDetalhesDoItem.node.alcanceP7 = nil;
            				self.boxDetalhesDoItem.node.tipoP7 = nil;
            				self.boxDetalhesDoItem.node.classeP7 = nil;
            				self.boxDetalhesDoItem.node.ACP7 = nil;
            				self.boxDetalhesDoItem.node.ataqueP7 = nil;
            				self.boxDetalhesDoItem.node.danoP7 = nil;
            				self.boxDetalhesDoItem.node.BonDMGP7 = nil;
            				self.boxDetalhesDoItem.node.campoEfeitoGolpesP7 = nil;
            				self.boxDetalhesDoItem.node.tipoContestP7 = nil;
            				self.boxDetalhesDoItem.node.efeitoContestP7 = nil;
        end, obj);

    obj._e_event39 = obj.button40:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = tonumber(self.boxDetalhesDoItem.node.ataqueP7) or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP7 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local flagFocadoTr = self.boxDetalhesDoItem.node.focTr or false
            					if (flagFocadoTr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local flagFocadoOr = self.boxDetalhesDoItem.node.focOr or false
            					if (flagFocadoOr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local Accuracy = tonumber(self.boxDetalhesDoItem.node.ACP7) or "N/A"
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP7) or 0;
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
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP7) or 3;
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
            					if (ATAQUE > 6) then
            						ATAQUE = 6;
            						end
            					if (-6 > ATAQUE) then
            						ATAQUE = -6;
            						end
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event40 = obj.button41:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP7) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP7 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP7) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP7) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end					
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP7 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event41 = obj.button42:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP7) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP7 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP7) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP7) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end							
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP7 or 0;
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
            						self.boxDetalhesDoItem.node.golpeP8 = import[1];
            						self.boxDetalhesDoItem.node.frequenciaP8 = import[2];
            						self.boxDetalhesDoItem.node.alcanceP8 = import[3];
            						self.boxDetalhesDoItem.node.tipoP8 = import[4];
            						self.boxDetalhesDoItem.node.classeP8 = import[5];
            						self.boxDetalhesDoItem.node.ACP8 = import[6];
            						self.boxDetalhesDoItem.node.ataqueP8 = import[7];
            						self.boxDetalhesDoItem.node.danoP8 = import[8];
            						self.boxDetalhesDoItem.node.BonDMGP8 = import[9];
            						self.boxDetalhesDoItem.node.campoEfeitoGolpesP8 = import[10];
            						self.boxDetalhesDoItem.node.tipoContestP8 = import[11];
            						self.boxDetalhesDoItem.node.efeitoContestP8 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event43 = obj.button44:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {self.boxDetalhesDoItem.node.golpeP8, self.boxDetalhesDoItem.node.frequenciaP8, self.boxDetalhesDoItem.node.alcanceP8, self.boxDetalhesDoItem.node.tipoP8, self.boxDetalhesDoItem.node.classeP8, self.boxDetalhesDoItem.node.ACP8, self.boxDetalhesDoItem.node.ataqueP8, self.boxDetalhesDoItem.node.danoP8, self.boxDetalhesDoItem.node.BonDMGP8, self.boxDetalhesDoItem.node.campoEfeitoGolpesP8, self.boxDetalhesDoItem.node.tipoContestP8, self.boxDetalhesDoItem.node.efeitoContestP8};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event44 = obj.button45:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.golpeP8 = nil;
            				self.boxDetalhesDoItem.node.frequenciaP8 = nil;
            				self.boxDetalhesDoItem.node.alcanceP8 = nil;
            				self.boxDetalhesDoItem.node.tipoP8 = nil;
            				self.boxDetalhesDoItem.node.classeP8 = nil;
            				self.boxDetalhesDoItem.node.ACP8 = nil;
            				self.boxDetalhesDoItem.node.ataqueP8 = nil;
            				self.boxDetalhesDoItem.node.danoP8 = nil;
            				self.boxDetalhesDoItem.node.BonDMGP8 = nil;
            				self.boxDetalhesDoItem.node.campoEfeitoGolpesP8 = nil;
            				self.boxDetalhesDoItem.node.tipoContestP8 = nil;
            				self.boxDetalhesDoItem.node.efeitoContestP8 = nil;
        end, obj);

    obj._e_event45 = obj.button46:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = tonumber(self.boxDetalhesDoItem.node.ataqueP8) or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP8 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local flagFocadoTr = self.boxDetalhesDoItem.node.focTr or false
            					if (flagFocadoTr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local flagFocadoOr = self.boxDetalhesDoItem.node.focOr or false
            					if (flagFocadoOr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local Accuracy = tonumber(self.boxDetalhesDoItem.node.ACP8) or "N/A"
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP8) or 0;
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
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP8) or 3;
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
            					if (ATAQUE > 6) then
            						ATAQUE = 6;
            						end
            					if (-6 > ATAQUE) then
            						ATAQUE = -6;
            						end
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event46 = obj.button47:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP8) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP8 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP8) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP8) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end					
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP8 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event47 = obj.button48:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP8) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP8 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP8) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP8) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end							
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP8 or 0;
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
            						self.boxDetalhesDoItem.node.golpeP9 = import[1];
            						self.boxDetalhesDoItem.node.frequenciaP9 = import[2];
            						self.boxDetalhesDoItem.node.alcanceP9 = import[3];
            						self.boxDetalhesDoItem.node.tipoP9 = import[4];
            						self.boxDetalhesDoItem.node.classeP9 = import[5];
            						self.boxDetalhesDoItem.node.ACP9 = import[6];
            						self.boxDetalhesDoItem.node.ataqueP9 = import[7];
            						self.boxDetalhesDoItem.node.danoP9 = import[8];
            						self.boxDetalhesDoItem.node.BonDMGP9 = import[9];
            						self.boxDetalhesDoItem.node.campoEfeitoGolpesP9 = import[10];
            						self.boxDetalhesDoItem.node.tipoContestP9 = import[11];
            						self.boxDetalhesDoItem.node.efeitoContestP9 = import[12];
            						local bytes = arq.stream:close();		
            					end);
        end, obj);

    obj._e_event49 = obj.button50:addEventListener("onClick",
        function (_)
            local stream = Utils.newMemoryStream();
            				local export = {self.boxDetalhesDoItem.node.golpeP9, self.boxDetalhesDoItem.node.frequenciaP9, self.boxDetalhesDoItem.node.alcanceP9, self.boxDetalhesDoItem.node.tipoP9, self.boxDetalhesDoItem.node.classeP9, self.boxDetalhesDoItem.node.ACP9, self.boxDetalhesDoItem.node.ataqueP9, self.boxDetalhesDoItem.node.danoP9, self.boxDetalhesDoItem.node.BonDMGP9, self.boxDetalhesDoItem.node.campoEfeitoGolpesP9, self.boxDetalhesDoItem.node.tipoContestP9, self.boxDetalhesDoItem.node.efeitoContestP9};
            				local txt = tableToStr(export);
            				local bytes = stream:writeBinary("ansi",txt);
            				Dialogs.saveFile("Salvar golpe como txt", stream, "ficha.txt", "text/plain",
            				function()
            					stream:close();
            					end);
        end, obj);

    obj._e_event50 = obj.button51:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.golpeP9 = nil;
            				self.boxDetalhesDoItem.node.frequenciaP9 = nil;
            				self.boxDetalhesDoItem.node.alcanceP9 = nil;
            				self.boxDetalhesDoItem.node.tipoP9 = nil;
            				self.boxDetalhesDoItem.node.classeP9 = nil;
            				self.boxDetalhesDoItem.node.ACP9 = nil;
            				self.boxDetalhesDoItem.node.ataqueP9 = nil;
            				self.boxDetalhesDoItem.node.danoP9 = nil;
            				self.boxDetalhesDoItem.node.BonDMGP9 = nil;
            				self.boxDetalhesDoItem.node.campoEfeitoGolpesP9 = nil;
            				self.boxDetalhesDoItem.node.tipoContestP9 = nil;
            				self.boxDetalhesDoItem.node.efeitoContestP9 = nil;
        end, obj);

    obj._e_event51 = obj.button52:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = tonumber(self.boxDetalhesDoItem.node.ataqueP9) or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP9 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local flagFocadoTr = self.boxDetalhesDoItem.node.focTr or false
            					if (flagFocadoTr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local flagFocadoOr = self.boxDetalhesDoItem.node.focOr or false
            					if (flagFocadoOr) then
            						ATAQUE = ATAQUE+1;
            						end
            					local Accuracy = tonumber(self.boxDetalhesDoItem.node.ACP9) or "N/A"
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP9) or 0;
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
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP9) or 3;
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
            					if (ATAQUE > 6) then
            						ATAQUE = 6;
            						end
            					if (-6 > ATAQUE) then
            						ATAQUE = -6;
            						end
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "[§K14]Acerto (AC = " .. Accuracy .. ") de " .. MSG_Color .. NomeGolpe .. MSG_ATT .. "[§K14] usado por " .. NomeUser)
        end, obj);

    obj._e_event52 = obj.button53:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP9) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP9 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"1d6+1","1d6+3","1d6+5","1d8+6","1d8+8","2d6+8","2d6+10","2d8+10","2d10+10","3d8+10","3d10+10","3d12+10","4d10+10","4d10+15","4d10+20",
            									"5d10+20","5d12+25","6d12+25","6d12+30","6d12+35","6d12+40","6d12+45","6d12+50","6d12+55","6d12+60","7d12+65","8d12+70","8d12+80"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP9) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP9) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end					
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP9 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event53 = obj.button54:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 0;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 0;
            					local TipoG = tonumber(self.boxDetalhesDoItem.node.tipoP9) or 0;
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
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP9 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local DamageTable = {"2d6+2","2d6+6","2d6+10","2d8+12","2d8+16","4d6+16","4d6+20","4d8+20","4d10+20","6d8+20","6d10+20","6d12+20","8d10+20","8d10+30","8d10+40",
            									"10d10+40","10d12+50","12d12+50","12d12+60","12d12+70","12d12+80","12d12+90","12d12+100","12d12+110","12d12+120","14d12+130","16d12+140","16d12+160"};
            					local BaseDamage = tonumber(self.boxDetalhesDoItem.node.danoP9) or 1;
            						if ((TipoG == Tipo1) or (TipoG == Tipo2)) then
            							BaseDamage = BaseDamage +2;
            							end
            						if BaseDamage > 28 then 
            							BaseDamage = 28; 					
            							end
            						if 1 > BaseDamage then 
            							BaseDamage = 1; 					
            							end
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP9) or 3;
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
            					if (Attribute == 3) then
            						MSG_ATT = " [§I http://blob.firecast.com.br/blobs/NVLBUHIV_1536933/other.png]"
            						end							
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0};
            					local BonusDamage = self.boxDetalhesDoItem.node.BonDMGP9 or 0;
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados((DamageTable[BaseDamage] or "1d2") .. "+" .. (ATK[Attribute] or 0) .. "+" .. BonusDamage, "[§K14]Dano CRÍTICO de " .. MSG_Color .. NomeGolpe .. "[§K14]" .. MSG_ATT .. MSG_Color .. "[§K14] usado por " .. NomeUser) 
            						end
        end, obj);

    function obj:_releaseEvents()
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister3_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister3_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister3_svg = {
    newEditor = newfrmFichaRPGmeister3_svg, 
    new = newfrmFichaRPGmeister3_svg, 
    name = "frmFichaRPGmeister3_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister3_svg = _frmFichaRPGmeister3_svg;
Firecast.registrarForm(_frmFichaRPGmeister3_svg);

return _frmFichaRPGmeister3_svg;
