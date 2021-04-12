require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPokemon3()
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
    obj:setName("frmPokemon3");
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

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(70);
    obj.label1:setHeight(25);
    obj.label1:setText("Golpe 1");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(75);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(160);
    obj.edit1:setHeight(25);
    obj.edit1:setField("golpeP1");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(80);
    obj.label2:setHeight(25);
    obj.label2:setText("Tipo");
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setLeft(75);
    obj.comboBox1:setTop(32);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setField("campoElem31");
    obj.comboBox1:setHorzTextAlign("leading");
    obj.comboBox1:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox1:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox1:setName("comboBox1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setField("campoElem31");
    obj.dataLink1:setDefaultValue("19");
    obj.dataLink1:setName("dataLink1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(170);
    obj.label3:setTop(32);
    obj.label3:setWidth(10);
    obj.label3:setHeight(25);
    obj.label3:setText("Z:");
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(190);
    obj.edit2:setTop(32);
    obj.edit2:setWidth(45);
    obj.edit2:setHeight(25);
    obj.edit2:setField("danoZ1");
    obj.edit2:setHint("Poder do golpe Z");
    obj.edit2:setName("edit2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(5);
    obj.label4:setTop(55);
    obj.label4:setWidth(80);
    obj.label4:setHeight(25);
    obj.label4:setText("ACP/ACS(%)");
    obj.label4:setName("label4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(75);
    obj.edit3:setTop(55);
    obj.edit3:setWidth(75);
    obj.edit3:setHeight(25);
    obj.edit3:setField("ACP1");
    obj.edit3:setHint("Acerto Primário");
    obj.edit3:setType("number");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(160);
    obj.edit4:setTop(55);
    obj.edit4:setWidth(75);
    obj.edit4:setHeight(25);
    obj.edit4:setField("ACS1");
    obj.edit4:setHint("Acerto Secundário");
    obj.edit4:setType("number");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(240);
    obj.label5:setTop(6);
    obj.label5:setWidth(50);
    obj.label5:setHeight(25);
    obj.label5:setText("Classe");
    obj.label5:setName("label5");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout2);
    obj.comboBox2:setLeft(282);
    obj.comboBox2:setTop(6);
    obj.comboBox2:setWidth(82);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("classeP1");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox2:setValues({'1', '2', '3'});
    obj.comboBox2:setName("comboBox2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(240);
    obj.label6:setTop(31);
    obj.label6:setWidth(50);
    obj.label6:setHeight(25);
    obj.label6:setText("Cont.");
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(282);
    obj.edit5:setTop(31);
    obj.edit5:setWidth(82);
    obj.edit5:setHeight(25);
    obj.edit5:setField("contP1");
    obj.edit5:setHint("Contato");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(240);
    obj.label7:setTop(55);
    obj.label7:setWidth(50);
    obj.label7:setHeight(25);
    obj.label7:setText("Área");
    obj.label7:setName("label7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(282);
    obj.edit6:setTop(55);
    obj.edit6:setWidth(82);
    obj.edit6:setHeight(25);
    obj.edit6:setField("Area1");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(370);
    obj.label8:setTop(6);
    obj.label8:setWidth(70);
    obj.label8:setHeight(25);
    obj.label8:setText("Prioridade");
    obj.label8:setName("label8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(443);
    obj.edit7:setTop(6);
    obj.edit7:setWidth(42);
    obj.edit7:setHeight(25);
    obj.edit7:setField("prioP1");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(370);
    obj.label9:setTop(31);
    obj.label9:setWidth(70);
    obj.label9:setHeight(25);
    obj.label9:setText("Poder");
    obj.label9:setName("label9");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(443);
    obj.edit8:setTop(31);
    obj.edit8:setWidth(42);
    obj.edit8:setHeight(25);
    obj.edit8:setField("danoP1");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setLeft(370);
    obj.label10:setTop(55);
    obj.label10:setWidth(70);
    obj.label10:setHeight(25);
    obj.label10:setText("Dano Bôn.");
    obj.label10:setName("label10");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout2);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(443);
    obj.edit9:setTop(55);
    obj.edit9:setWidth(42);
    obj.edit9:setHeight(25);
    obj.edit9:setField("BonDMGP1");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setLeft(488);
    obj.button1:setTop(6);
    obj.button1:setWidth(82);
    obj.button1:setText("Acerto");
    obj.button1:setFontSize(11);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(488);
    obj.button2:setTop(31);
    obj.button2:setWidth(82);
    obj.button2:setText("A. Seguido");
    obj.button2:setFontSize(11);
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(488);
    obj.button3:setTop(55);
    obj.button3:setWidth(82);
    obj.button3:setText("Golpe Z");
    obj.button3:setFontSize(11);
    obj.button3:setName("button3");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout2);
    obj.textEditor1:setLeft(575);
    obj.textEditor1:setTop(5);
    obj.textEditor1:setWidth(280);
    obj.textEditor1:setHeight(50);
    obj.textEditor1:setField("campoEfeitoGolpesP1");
    obj.textEditor1:setName("textEditor1");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setLeft(575);
    obj.label11:setTop(55);
    obj.label11:setWidth(50);
    obj.label11:setHeight(25);
    obj.label11:setText("M.Crit.");
    obj.label11:setName("label11");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(630);
    obj.edit10:setTop(55);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("MCRIT1");
    obj.edit10:setHint("Margem de Crítico");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout2);
    obj.dataLink2:setField("BCRIT1");
    obj.dataLink2:setDefaultValue("10");
    obj.dataLink2:setName("dataLink2");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setLeft(685);
    obj.label12:setTop(55);
    obj.label12:setWidth(50);
    obj.label12:setHeight(25);
    obj.label12:setText("Efeito");
    obj.label12:setName("label12");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout2);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(740);
    obj.edit11:setTop(55);
    obj.edit11:setWidth(80);
    obj.edit11:setHeight(25);
    obj.edit11:setField("EFF1");
    obj.edit11:setHint("Efeito Causado");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout2);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(825);
    obj.edit12:setTop(55);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setField("MARGEF1");
    obj.edit12:setHint("Margem");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

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

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout3);
    obj.label13:setLeft(5);
    obj.label13:setTop(5);
    obj.label13:setWidth(70);
    obj.label13:setHeight(25);
    obj.label13:setText("Golpe 2");
    obj.label13:setName("label13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout3);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(75);
    obj.edit13:setTop(5);
    obj.edit13:setWidth(160);
    obj.edit13:setHeight(25);
    obj.edit13:setField("golpeP2");
    obj.edit13:setName("edit13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout3);
    obj.label14:setLeft(5);
    obj.label14:setTop(30);
    obj.label14:setWidth(80);
    obj.label14:setHeight(25);
    obj.label14:setText("Tipo");
    obj.label14:setName("label14");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout3);
    obj.comboBox3:setLeft(75);
    obj.comboBox3:setTop(32);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setHeight(20);
    obj.comboBox3:setField("campoElem32");
    obj.comboBox3:setHorzTextAlign("leading");
    obj.comboBox3:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox3:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout3);
    obj.dataLink3:setField("campoElem32");
    obj.dataLink3:setDefaultValue("19");
    obj.dataLink3:setName("dataLink3");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout3);
    obj.label15:setLeft(170);
    obj.label15:setTop(32);
    obj.label15:setWidth(10);
    obj.label15:setHeight(25);
    obj.label15:setText("Z:");
    obj.label15:setName("label15");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout3);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(190);
    obj.edit14:setTop(32);
    obj.edit14:setWidth(45);
    obj.edit14:setHeight(25);
    obj.edit14:setField("danoZ2");
    obj.edit14:setHint("Poder do golpe Z");
    obj.edit14:setName("edit14");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout3);
    obj.label16:setLeft(5);
    obj.label16:setTop(55);
    obj.label16:setWidth(80);
    obj.label16:setHeight(25);
    obj.label16:setText("ACP/ACS(%)");
    obj.label16:setName("label16");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout3);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(75);
    obj.edit15:setTop(55);
    obj.edit15:setWidth(75);
    obj.edit15:setHeight(25);
    obj.edit15:setField("ACP2");
    obj.edit15:setHint("Acerto Primário");
    obj.edit15:setType("number");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout3);
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(160);
    obj.edit16:setTop(55);
    obj.edit16:setWidth(75);
    obj.edit16:setHeight(25);
    obj.edit16:setField("ACS2");
    obj.edit16:setHint("Acerto Secundário");
    obj.edit16:setType("number");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout3);
    obj.label17:setLeft(240);
    obj.label17:setTop(6);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setText("Classe");
    obj.label17:setName("label17");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout3);
    obj.comboBox4:setLeft(282);
    obj.comboBox4:setTop(6);
    obj.comboBox4:setWidth(82);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("classeP2");
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox4:setValues({'1', '2', '3'});
    obj.comboBox4:setName("comboBox4");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout3);
    obj.label18:setLeft(240);
    obj.label18:setTop(31);
    obj.label18:setWidth(50);
    obj.label18:setHeight(25);
    obj.label18:setText("Cont.");
    obj.label18:setName("label18");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout3);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(282);
    obj.edit17:setTop(31);
    obj.edit17:setWidth(82);
    obj.edit17:setHeight(25);
    obj.edit17:setField("contP2");
    obj.edit17:setHint("Contato");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setLeft(240);
    obj.label19:setTop(55);
    obj.label19:setWidth(50);
    obj.label19:setHeight(25);
    obj.label19:setText("Área");
    obj.label19:setName("label19");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout3);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(282);
    obj.edit18:setTop(55);
    obj.edit18:setWidth(82);
    obj.edit18:setHeight(25);
    obj.edit18:setField("Area2");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setLeft(370);
    obj.label20:setTop(6);
    obj.label20:setWidth(70);
    obj.label20:setHeight(25);
    obj.label20:setText("Prioridade");
    obj.label20:setName("label20");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout3);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(443);
    obj.edit19:setTop(6);
    obj.edit19:setWidth(42);
    obj.edit19:setHeight(25);
    obj.edit19:setField("prioP2");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout3);
    obj.label21:setLeft(370);
    obj.label21:setTop(31);
    obj.label21:setWidth(70);
    obj.label21:setHeight(25);
    obj.label21:setText("Poder");
    obj.label21:setName("label21");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout3);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(443);
    obj.edit20:setTop(31);
    obj.edit20:setWidth(42);
    obj.edit20:setHeight(25);
    obj.edit20:setField("danoP2");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout3);
    obj.label22:setLeft(370);
    obj.label22:setTop(55);
    obj.label22:setWidth(70);
    obj.label22:setHeight(25);
    obj.label22:setText("Dano Bôn.");
    obj.label22:setName("label22");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout3);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(443);
    obj.edit21:setTop(55);
    obj.edit21:setWidth(42);
    obj.edit21:setHeight(25);
    obj.edit21:setField("BonDMGP2");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout3);
    obj.button4:setLeft(488);
    obj.button4:setTop(6);
    obj.button4:setWidth(82);
    obj.button4:setText("Acerto");
    obj.button4:setFontSize(11);
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout3);
    obj.button5:setLeft(488);
    obj.button5:setTop(31);
    obj.button5:setWidth(82);
    obj.button5:setText("A. Seguido");
    obj.button5:setFontSize(11);
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout3);
    obj.button6:setLeft(488);
    obj.button6:setTop(55);
    obj.button6:setWidth(82);
    obj.button6:setText("Golpe Z");
    obj.button6:setFontSize(11);
    obj.button6:setName("button6");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout3);
    obj.textEditor2:setLeft(575);
    obj.textEditor2:setTop(5);
    obj.textEditor2:setWidth(280);
    obj.textEditor2:setHeight(50);
    obj.textEditor2:setField("campoEfeitoGolpesP2");
    obj.textEditor2:setName("textEditor2");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout3);
    obj.label23:setLeft(575);
    obj.label23:setTop(55);
    obj.label23:setWidth(50);
    obj.label23:setHeight(25);
    obj.label23:setText("M.Crit.");
    obj.label23:setName("label23");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout3);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(630);
    obj.edit22:setTop(55);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setField("MCRIT2");
    obj.edit22:setHint("Margem de Crítico");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout3);
    obj.dataLink4:setField("BCRIT2");
    obj.dataLink4:setDefaultValue("10");
    obj.dataLink4:setName("dataLink4");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout3);
    obj.label24:setLeft(685);
    obj.label24:setTop(55);
    obj.label24:setWidth(50);
    obj.label24:setHeight(25);
    obj.label24:setText("Efeito");
    obj.label24:setName("label24");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout3);
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(740);
    obj.edit23:setTop(55);
    obj.edit23:setWidth(80);
    obj.edit23:setHeight(25);
    obj.edit23:setField("EFF2");
    obj.edit23:setHint("Efeito Causado");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout3);
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(825);
    obj.edit24:setTop(55);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setField("MARGEF2");
    obj.edit24:setHint("Margem");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

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

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout4);
    obj.label25:setLeft(5);
    obj.label25:setTop(5);
    obj.label25:setWidth(70);
    obj.label25:setHeight(25);
    obj.label25:setText("Golpe 3");
    obj.label25:setName("label25");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout4);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(75);
    obj.edit25:setTop(5);
    obj.edit25:setWidth(160);
    obj.edit25:setHeight(25);
    obj.edit25:setField("golpeP3");
    obj.edit25:setName("edit25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout4);
    obj.label26:setLeft(5);
    obj.label26:setTop(30);
    obj.label26:setWidth(80);
    obj.label26:setHeight(25);
    obj.label26:setText("Tipo");
    obj.label26:setName("label26");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout4);
    obj.comboBox5:setLeft(75);
    obj.comboBox5:setTop(32);
    obj.comboBox5:setWidth(90);
    obj.comboBox5:setHeight(20);
    obj.comboBox5:setField("campoElem33");
    obj.comboBox5:setHorzTextAlign("leading");
    obj.comboBox5:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox5:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout4);
    obj.dataLink5:setField("campoElem33");
    obj.dataLink5:setDefaultValue("19");
    obj.dataLink5:setName("dataLink5");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout4);
    obj.label27:setLeft(170);
    obj.label27:setTop(32);
    obj.label27:setWidth(10);
    obj.label27:setHeight(25);
    obj.label27:setText("Z:");
    obj.label27:setName("label27");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout4);
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(190);
    obj.edit26:setTop(32);
    obj.edit26:setWidth(45);
    obj.edit26:setHeight(25);
    obj.edit26:setField("danoZ3");
    obj.edit26:setHint("Poder do golpe Z");
    obj.edit26:setName("edit26");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout4);
    obj.label28:setLeft(5);
    obj.label28:setTop(55);
    obj.label28:setWidth(80);
    obj.label28:setHeight(25);
    obj.label28:setText("ACP/ACS(%)");
    obj.label28:setName("label28");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout4);
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(75);
    obj.edit27:setTop(55);
    obj.edit27:setWidth(75);
    obj.edit27:setHeight(25);
    obj.edit27:setField("ACP3");
    obj.edit27:setHint("Acerto Primário");
    obj.edit27:setType("number");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout4);
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(160);
    obj.edit28:setTop(55);
    obj.edit28:setWidth(75);
    obj.edit28:setHeight(25);
    obj.edit28:setField("ACS3");
    obj.edit28:setHint("Acerto Secundário");
    obj.edit28:setType("number");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout4);
    obj.label29:setLeft(240);
    obj.label29:setTop(6);
    obj.label29:setWidth(50);
    obj.label29:setHeight(25);
    obj.label29:setText("Classe");
    obj.label29:setName("label29");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout4);
    obj.comboBox6:setLeft(282);
    obj.comboBox6:setTop(6);
    obj.comboBox6:setWidth(82);
    obj.comboBox6:setHeight(25);
    obj.comboBox6:setField("classeP3");
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox6:setValues({'1', '2', '3'});
    obj.comboBox6:setName("comboBox6");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout4);
    obj.label30:setLeft(240);
    obj.label30:setTop(31);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setText("Cont.");
    obj.label30:setName("label30");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout4);
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(282);
    obj.edit29:setTop(31);
    obj.edit29:setWidth(82);
    obj.edit29:setHeight(25);
    obj.edit29:setField("contP3");
    obj.edit29:setHint("Contato");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout4);
    obj.label31:setLeft(240);
    obj.label31:setTop(55);
    obj.label31:setWidth(50);
    obj.label31:setHeight(25);
    obj.label31:setText("Área");
    obj.label31:setName("label31");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout4);
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(282);
    obj.edit30:setTop(55);
    obj.edit30:setWidth(82);
    obj.edit30:setHeight(25);
    obj.edit30:setField("Area3");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout4);
    obj.label32:setLeft(370);
    obj.label32:setTop(6);
    obj.label32:setWidth(70);
    obj.label32:setHeight(25);
    obj.label32:setText("Prioridade");
    obj.label32:setName("label32");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout4);
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(443);
    obj.edit31:setTop(6);
    obj.edit31:setWidth(42);
    obj.edit31:setHeight(25);
    obj.edit31:setField("prioP3");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout4);
    obj.label33:setLeft(370);
    obj.label33:setTop(31);
    obj.label33:setWidth(70);
    obj.label33:setHeight(25);
    obj.label33:setText("Poder");
    obj.label33:setName("label33");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout4);
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(443);
    obj.edit32:setTop(31);
    obj.edit32:setWidth(42);
    obj.edit32:setHeight(25);
    obj.edit32:setField("danoP3");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout4);
    obj.label34:setLeft(370);
    obj.label34:setTop(55);
    obj.label34:setWidth(70);
    obj.label34:setHeight(25);
    obj.label34:setText("Dano Bôn.");
    obj.label34:setName("label34");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout4);
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(443);
    obj.edit33:setTop(55);
    obj.edit33:setWidth(42);
    obj.edit33:setHeight(25);
    obj.edit33:setField("BonDMGP3");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout4);
    obj.button7:setLeft(488);
    obj.button7:setTop(6);
    obj.button7:setWidth(82);
    obj.button7:setText("Acerto");
    obj.button7:setFontSize(11);
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout4);
    obj.button8:setLeft(488);
    obj.button8:setTop(31);
    obj.button8:setWidth(82);
    obj.button8:setText("A. Seguido");
    obj.button8:setFontSize(11);
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout4);
    obj.button9:setLeft(488);
    obj.button9:setTop(55);
    obj.button9:setWidth(82);
    obj.button9:setText("Golpe Z");
    obj.button9:setFontSize(11);
    obj.button9:setName("button9");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout4);
    obj.textEditor3:setLeft(575);
    obj.textEditor3:setTop(5);
    obj.textEditor3:setWidth(280);
    obj.textEditor3:setHeight(50);
    obj.textEditor3:setField("campoEfeitoGolpesP3");
    obj.textEditor3:setName("textEditor3");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout4);
    obj.label35:setLeft(575);
    obj.label35:setTop(55);
    obj.label35:setWidth(50);
    obj.label35:setHeight(25);
    obj.label35:setText("M.Crit.");
    obj.label35:setName("label35");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout4);
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(630);
    obj.edit34:setTop(55);
    obj.edit34:setWidth(50);
    obj.edit34:setHeight(25);
    obj.edit34:setField("MCRIT3");
    obj.edit34:setHint("Margem de Crítico");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout4);
    obj.dataLink6:setField("BCRIT3");
    obj.dataLink6:setDefaultValue("10");
    obj.dataLink6:setName("dataLink6");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout4);
    obj.label36:setLeft(685);
    obj.label36:setTop(55);
    obj.label36:setWidth(50);
    obj.label36:setHeight(25);
    obj.label36:setText("Efeito");
    obj.label36:setName("label36");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout4);
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(740);
    obj.edit35:setTop(55);
    obj.edit35:setWidth(80);
    obj.edit35:setHeight(25);
    obj.edit35:setField("EFF3");
    obj.edit35:setHint("Efeito Causado");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout4);
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(825);
    obj.edit36:setTop(55);
    obj.edit36:setWidth(30);
    obj.edit36:setHeight(25);
    obj.edit36:setField("MARGEF3");
    obj.edit36:setHint("Margem");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

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

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout5);
    obj.label37:setLeft(5);
    obj.label37:setTop(5);
    obj.label37:setWidth(70);
    obj.label37:setHeight(25);
    obj.label37:setText("Golpe 4");
    obj.label37:setName("label37");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout5);
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(75);
    obj.edit37:setTop(5);
    obj.edit37:setWidth(160);
    obj.edit37:setHeight(25);
    obj.edit37:setField("golpeP4");
    obj.edit37:setName("edit37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout5);
    obj.label38:setLeft(5);
    obj.label38:setTop(30);
    obj.label38:setWidth(80);
    obj.label38:setHeight(25);
    obj.label38:setText("Tipo");
    obj.label38:setName("label38");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout5);
    obj.comboBox7:setLeft(75);
    obj.comboBox7:setTop(32);
    obj.comboBox7:setWidth(90);
    obj.comboBox7:setHeight(20);
    obj.comboBox7:setField("campoElem34");
    obj.comboBox7:setHorzTextAlign("leading");
    obj.comboBox7:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox7:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox7:setName("comboBox7");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout5);
    obj.dataLink7:setField("campoElem34");
    obj.dataLink7:setDefaultValue("19");
    obj.dataLink7:setName("dataLink7");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout5);
    obj.label39:setLeft(170);
    obj.label39:setTop(32);
    obj.label39:setWidth(10);
    obj.label39:setHeight(25);
    obj.label39:setText("Z:");
    obj.label39:setName("label39");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout5);
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(190);
    obj.edit38:setTop(32);
    obj.edit38:setWidth(45);
    obj.edit38:setHeight(25);
    obj.edit38:setField("danoZ4");
    obj.edit38:setHint("Poder do golpe Z");
    obj.edit38:setName("edit38");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout5);
    obj.label40:setLeft(5);
    obj.label40:setTop(55);
    obj.label40:setWidth(80);
    obj.label40:setHeight(25);
    obj.label40:setText("ACP/ACS(%)");
    obj.label40:setName("label40");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout5);
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(75);
    obj.edit39:setTop(55);
    obj.edit39:setWidth(75);
    obj.edit39:setHeight(25);
    obj.edit39:setField("ACP4");
    obj.edit39:setHint("Acerto Primário");
    obj.edit39:setType("number");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout5);
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(160);
    obj.edit40:setTop(55);
    obj.edit40:setWidth(75);
    obj.edit40:setHeight(25);
    obj.edit40:setField("ACS4");
    obj.edit40:setHint("Acerto Secundário");
    obj.edit40:setType("number");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout5);
    obj.label41:setLeft(240);
    obj.label41:setTop(6);
    obj.label41:setWidth(50);
    obj.label41:setHeight(25);
    obj.label41:setText("Classe");
    obj.label41:setName("label41");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout5);
    obj.comboBox8:setLeft(282);
    obj.comboBox8:setTop(6);
    obj.comboBox8:setWidth(82);
    obj.comboBox8:setHeight(25);
    obj.comboBox8:setField("classeP4");
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox8:setValues({'1', '2', '3'});
    obj.comboBox8:setName("comboBox8");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout5);
    obj.label42:setLeft(240);
    obj.label42:setTop(31);
    obj.label42:setWidth(50);
    obj.label42:setHeight(25);
    obj.label42:setText("Cont.");
    obj.label42:setName("label42");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout5);
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(282);
    obj.edit41:setTop(31);
    obj.edit41:setWidth(82);
    obj.edit41:setHeight(25);
    obj.edit41:setField("contP4");
    obj.edit41:setHint("Contato");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout5);
    obj.label43:setLeft(240);
    obj.label43:setTop(55);
    obj.label43:setWidth(50);
    obj.label43:setHeight(25);
    obj.label43:setText("Área");
    obj.label43:setName("label43");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout5);
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(282);
    obj.edit42:setTop(55);
    obj.edit42:setWidth(82);
    obj.edit42:setHeight(25);
    obj.edit42:setField("Area4");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout5);
    obj.label44:setLeft(370);
    obj.label44:setTop(6);
    obj.label44:setWidth(70);
    obj.label44:setHeight(25);
    obj.label44:setText("Prioridade");
    obj.label44:setName("label44");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout5);
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(443);
    obj.edit43:setTop(6);
    obj.edit43:setWidth(42);
    obj.edit43:setHeight(25);
    obj.edit43:setField("prioP4");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout5);
    obj.label45:setLeft(370);
    obj.label45:setTop(31);
    obj.label45:setWidth(70);
    obj.label45:setHeight(25);
    obj.label45:setText("Poder");
    obj.label45:setName("label45");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout5);
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(443);
    obj.edit44:setTop(31);
    obj.edit44:setWidth(42);
    obj.edit44:setHeight(25);
    obj.edit44:setField("danoP4");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout5);
    obj.label46:setLeft(370);
    obj.label46:setTop(55);
    obj.label46:setWidth(70);
    obj.label46:setHeight(25);
    obj.label46:setText("Dano Bôn.");
    obj.label46:setName("label46");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout5);
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(443);
    obj.edit45:setTop(55);
    obj.edit45:setWidth(42);
    obj.edit45:setHeight(25);
    obj.edit45:setField("BonDMGP4");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout5);
    obj.button10:setLeft(488);
    obj.button10:setTop(6);
    obj.button10:setWidth(82);
    obj.button10:setText("Acerto");
    obj.button10:setFontSize(11);
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout5);
    obj.button11:setLeft(488);
    obj.button11:setTop(31);
    obj.button11:setWidth(82);
    obj.button11:setText("A. Seguido");
    obj.button11:setFontSize(11);
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout5);
    obj.button12:setLeft(488);
    obj.button12:setTop(55);
    obj.button12:setWidth(82);
    obj.button12:setText("Golpe Z");
    obj.button12:setFontSize(11);
    obj.button12:setName("button12");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout5);
    obj.textEditor4:setLeft(575);
    obj.textEditor4:setTop(5);
    obj.textEditor4:setWidth(280);
    obj.textEditor4:setHeight(50);
    obj.textEditor4:setField("campoEfeitoGolpesP4");
    obj.textEditor4:setName("textEditor4");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout5);
    obj.label47:setLeft(575);
    obj.label47:setTop(55);
    obj.label47:setWidth(50);
    obj.label47:setHeight(25);
    obj.label47:setText("M.Crit.");
    obj.label47:setName("label47");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout5);
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(630);
    obj.edit46:setTop(55);
    obj.edit46:setWidth(50);
    obj.edit46:setHeight(25);
    obj.edit46:setField("MCRIT4");
    obj.edit46:setHint("Margem de Crítico");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout5);
    obj.dataLink8:setField("BCRIT4");
    obj.dataLink8:setDefaultValue("10");
    obj.dataLink8:setName("dataLink8");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout5);
    obj.label48:setLeft(685);
    obj.label48:setTop(55);
    obj.label48:setWidth(50);
    obj.label48:setHeight(25);
    obj.label48:setText("Efeito");
    obj.label48:setName("label48");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout5);
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(740);
    obj.edit47:setTop(55);
    obj.edit47:setWidth(80);
    obj.edit47:setHeight(25);
    obj.edit47:setField("EFF4");
    obj.edit47:setHint("Efeito Causado");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout5);
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(825);
    obj.edit48:setTop(55);
    obj.edit48:setWidth(30);
    obj.edit48:setHeight(25);
    obj.edit48:setField("MARGEF4");
    obj.edit48:setHint("Margem");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(2);
    obj.layout6:setTop(427);
    obj.layout6:setWidth(880);
    obj.layout6:setHeight(92);
    obj.layout6:setName("layout6");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout6);
    obj.label49:setLeft(0);
    obj.label49:setTop(0);
    obj.label49:setWidth(880);
    obj.label49:setHeight(25);
    obj.label49:setText("Golpes de Classe ou Outros");
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");
    obj.label49:setFontSize(16);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(2);
    obj.layout7:setTop(478);
    obj.layout7:setWidth(880);
    obj.layout7:setHeight(92);
    obj.layout7:setName("layout7");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout7);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout7);
    obj.label50:setLeft(5);
    obj.label50:setTop(5);
    obj.label50:setWidth(70);
    obj.label50:setHeight(25);
    obj.label50:setText("Golpe 5");
    obj.label50:setName("label50");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout7);
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(75);
    obj.edit49:setTop(5);
    obj.edit49:setWidth(160);
    obj.edit49:setHeight(25);
    obj.edit49:setField("golpeP5");
    obj.edit49:setName("edit49");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout7);
    obj.label51:setLeft(5);
    obj.label51:setTop(30);
    obj.label51:setWidth(80);
    obj.label51:setHeight(25);
    obj.label51:setText("Tipo");
    obj.label51:setName("label51");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout7);
    obj.comboBox9:setLeft(75);
    obj.comboBox9:setTop(32);
    obj.comboBox9:setWidth(90);
    obj.comboBox9:setHeight(20);
    obj.comboBox9:setField("campoElem35");
    obj.comboBox9:setHorzTextAlign("leading");
    obj.comboBox9:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox9:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox9:setName("comboBox9");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout7);
    obj.dataLink9:setField("campoElem35");
    obj.dataLink9:setDefaultValue("19");
    obj.dataLink9:setName("dataLink9");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout7);
    obj.label52:setLeft(170);
    obj.label52:setTop(32);
    obj.label52:setWidth(10);
    obj.label52:setHeight(25);
    obj.label52:setText("Z:");
    obj.label52:setName("label52");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout7);
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(190);
    obj.edit50:setTop(32);
    obj.edit50:setWidth(45);
    obj.edit50:setHeight(25);
    obj.edit50:setField("danoZ5");
    obj.edit50:setHint("Poder do golpe Z");
    obj.edit50:setName("edit50");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout7);
    obj.label53:setLeft(5);
    obj.label53:setTop(55);
    obj.label53:setWidth(80);
    obj.label53:setHeight(25);
    obj.label53:setText("ACP/ACS(%)");
    obj.label53:setName("label53");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout7);
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(75);
    obj.edit51:setTop(55);
    obj.edit51:setWidth(75);
    obj.edit51:setHeight(25);
    obj.edit51:setField("ACP5");
    obj.edit51:setHint("Acerto Primário");
    obj.edit51:setType("number");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout7);
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(160);
    obj.edit52:setTop(55);
    obj.edit52:setWidth(75);
    obj.edit52:setHeight(25);
    obj.edit52:setField("ACS5");
    obj.edit52:setHint("Acerto Secundário");
    obj.edit52:setType("number");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout7);
    obj.label54:setLeft(240);
    obj.label54:setTop(6);
    obj.label54:setWidth(50);
    obj.label54:setHeight(25);
    obj.label54:setText("Classe");
    obj.label54:setName("label54");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout7);
    obj.comboBox10:setLeft(282);
    obj.comboBox10:setTop(6);
    obj.comboBox10:setWidth(82);
    obj.comboBox10:setHeight(25);
    obj.comboBox10:setField("classeP5");
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox10:setValues({'1', '2', '3'});
    obj.comboBox10:setName("comboBox10");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout7);
    obj.label55:setLeft(240);
    obj.label55:setTop(31);
    obj.label55:setWidth(50);
    obj.label55:setHeight(25);
    obj.label55:setText("Cont.");
    obj.label55:setName("label55");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout7);
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(282);
    obj.edit53:setTop(31);
    obj.edit53:setWidth(82);
    obj.edit53:setHeight(25);
    obj.edit53:setField("contP5");
    obj.edit53:setHint("Contato");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout7);
    obj.label56:setLeft(240);
    obj.label56:setTop(55);
    obj.label56:setWidth(50);
    obj.label56:setHeight(25);
    obj.label56:setText("Área");
    obj.label56:setName("label56");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout7);
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(282);
    obj.edit54:setTop(55);
    obj.edit54:setWidth(82);
    obj.edit54:setHeight(25);
    obj.edit54:setField("Area5");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout7);
    obj.label57:setLeft(370);
    obj.label57:setTop(6);
    obj.label57:setWidth(70);
    obj.label57:setHeight(25);
    obj.label57:setText("Prioridade");
    obj.label57:setName("label57");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout7);
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(443);
    obj.edit55:setTop(6);
    obj.edit55:setWidth(42);
    obj.edit55:setHeight(25);
    obj.edit55:setField("prioP5");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout7);
    obj.label58:setLeft(370);
    obj.label58:setTop(31);
    obj.label58:setWidth(70);
    obj.label58:setHeight(25);
    obj.label58:setText("Poder");
    obj.label58:setName("label58");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout7);
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(443);
    obj.edit56:setTop(31);
    obj.edit56:setWidth(42);
    obj.edit56:setHeight(25);
    obj.edit56:setField("danoP5");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setType("number");
    obj.edit56:setName("edit56");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout7);
    obj.label59:setLeft(370);
    obj.label59:setTop(55);
    obj.label59:setWidth(70);
    obj.label59:setHeight(25);
    obj.label59:setText("Dano Bôn.");
    obj.label59:setName("label59");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout7);
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(443);
    obj.edit57:setTop(55);
    obj.edit57:setWidth(42);
    obj.edit57:setHeight(25);
    obj.edit57:setField("BonDMGP5");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setType("number");
    obj.edit57:setName("edit57");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout7);
    obj.button13:setLeft(488);
    obj.button13:setTop(6);
    obj.button13:setWidth(82);
    obj.button13:setText("Acerto");
    obj.button13:setFontSize(11);
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout7);
    obj.button14:setLeft(488);
    obj.button14:setTop(31);
    obj.button14:setWidth(82);
    obj.button14:setText("A. Seguido");
    obj.button14:setFontSize(11);
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout7);
    obj.button15:setLeft(488);
    obj.button15:setTop(55);
    obj.button15:setWidth(82);
    obj.button15:setText("Golpe Z");
    obj.button15:setFontSize(11);
    obj.button15:setName("button15");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout7);
    obj.textEditor5:setLeft(575);
    obj.textEditor5:setTop(5);
    obj.textEditor5:setWidth(280);
    obj.textEditor5:setHeight(50);
    obj.textEditor5:setField("campoEfeitoGolpesP5");
    obj.textEditor5:setName("textEditor5");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout7);
    obj.label60:setLeft(575);
    obj.label60:setTop(55);
    obj.label60:setWidth(50);
    obj.label60:setHeight(25);
    obj.label60:setText("M.Crit.");
    obj.label60:setName("label60");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout7);
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(630);
    obj.edit58:setTop(55);
    obj.edit58:setWidth(50);
    obj.edit58:setHeight(25);
    obj.edit58:setField("MCRIT5");
    obj.edit58:setHint("Margem de Crítico");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setType("number");
    obj.edit58:setName("edit58");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout7);
    obj.dataLink10:setField("BCRIT5");
    obj.dataLink10:setDefaultValue("10");
    obj.dataLink10:setName("dataLink10");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout7);
    obj.label61:setLeft(685);
    obj.label61:setTop(55);
    obj.label61:setWidth(50);
    obj.label61:setHeight(25);
    obj.label61:setText("Efeito");
    obj.label61:setName("label61");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout7);
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(740);
    obj.edit59:setTop(55);
    obj.edit59:setWidth(80);
    obj.edit59:setHeight(25);
    obj.edit59:setField("EFF5");
    obj.edit59:setHint("Efeito Causado");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout7);
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(825);
    obj.edit60:setTop(55);
    obj.edit60:setWidth(30);
    obj.edit60:setHeight(25);
    obj.edit60:setField("MARGEF5");
    obj.edit60:setHint("Margem");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(2);
    obj.layout8:setTop(573);
    obj.layout8:setWidth(880);
    obj.layout8:setHeight(92);
    obj.layout8:setName("layout8");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout8);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout8);
    obj.label62:setLeft(5);
    obj.label62:setTop(5);
    obj.label62:setWidth(70);
    obj.label62:setHeight(25);
    obj.label62:setText("Golpe 6");
    obj.label62:setName("label62");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout8);
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(75);
    obj.edit61:setTop(5);
    obj.edit61:setWidth(160);
    obj.edit61:setHeight(25);
    obj.edit61:setField("golpeP6");
    obj.edit61:setName("edit61");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout8);
    obj.label63:setLeft(5);
    obj.label63:setTop(30);
    obj.label63:setWidth(80);
    obj.label63:setHeight(25);
    obj.label63:setText("Tipo");
    obj.label63:setName("label63");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout8);
    obj.comboBox11:setLeft(75);
    obj.comboBox11:setTop(32);
    obj.comboBox11:setWidth(90);
    obj.comboBox11:setHeight(20);
    obj.comboBox11:setField("campoElem36");
    obj.comboBox11:setHorzTextAlign("leading");
    obj.comboBox11:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox11:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox11:setName("comboBox11");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout8);
    obj.dataLink11:setField("campoElem36");
    obj.dataLink11:setDefaultValue("19");
    obj.dataLink11:setName("dataLink11");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout8);
    obj.label64:setLeft(170);
    obj.label64:setTop(32);
    obj.label64:setWidth(10);
    obj.label64:setHeight(25);
    obj.label64:setText("Z:");
    obj.label64:setName("label64");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout8);
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(190);
    obj.edit62:setTop(32);
    obj.edit62:setWidth(45);
    obj.edit62:setHeight(25);
    obj.edit62:setField("danoZ6");
    obj.edit62:setHint("Poder do golpe Z");
    obj.edit62:setName("edit62");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout8);
    obj.label65:setLeft(5);
    obj.label65:setTop(55);
    obj.label65:setWidth(80);
    obj.label65:setHeight(25);
    obj.label65:setText("ACP/ACS(%)");
    obj.label65:setName("label65");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout8);
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(75);
    obj.edit63:setTop(55);
    obj.edit63:setWidth(75);
    obj.edit63:setHeight(25);
    obj.edit63:setField("ACP6");
    obj.edit63:setHint("Acerto Primário");
    obj.edit63:setType("number");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setName("edit63");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout8);
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(160);
    obj.edit64:setTop(55);
    obj.edit64:setWidth(75);
    obj.edit64:setHeight(25);
    obj.edit64:setField("ACS6");
    obj.edit64:setHint("Acerto Secundário");
    obj.edit64:setType("number");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout8);
    obj.label66:setLeft(240);
    obj.label66:setTop(6);
    obj.label66:setWidth(50);
    obj.label66:setHeight(25);
    obj.label66:setText("Classe");
    obj.label66:setName("label66");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout8);
    obj.comboBox12:setLeft(282);
    obj.comboBox12:setTop(6);
    obj.comboBox12:setWidth(82);
    obj.comboBox12:setHeight(25);
    obj.comboBox12:setField("classeP6");
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox12:setValues({'1', '2', '3'});
    obj.comboBox12:setName("comboBox12");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout8);
    obj.label67:setLeft(240);
    obj.label67:setTop(31);
    obj.label67:setWidth(50);
    obj.label67:setHeight(25);
    obj.label67:setText("Cont.");
    obj.label67:setName("label67");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout8);
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(282);
    obj.edit65:setTop(31);
    obj.edit65:setWidth(82);
    obj.edit65:setHeight(25);
    obj.edit65:setField("contP6");
    obj.edit65:setHint("Contato");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout8);
    obj.label68:setLeft(240);
    obj.label68:setTop(55);
    obj.label68:setWidth(50);
    obj.label68:setHeight(25);
    obj.label68:setText("Área");
    obj.label68:setName("label68");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout8);
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(282);
    obj.edit66:setTop(55);
    obj.edit66:setWidth(82);
    obj.edit66:setHeight(25);
    obj.edit66:setField("Area6");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setName("edit66");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout8);
    obj.label69:setLeft(370);
    obj.label69:setTop(6);
    obj.label69:setWidth(70);
    obj.label69:setHeight(25);
    obj.label69:setText("Prioridade");
    obj.label69:setName("label69");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout8);
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(443);
    obj.edit67:setTop(6);
    obj.edit67:setWidth(42);
    obj.edit67:setHeight(25);
    obj.edit67:setField("prioP6");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout8);
    obj.label70:setLeft(370);
    obj.label70:setTop(31);
    obj.label70:setWidth(70);
    obj.label70:setHeight(25);
    obj.label70:setText("Poder");
    obj.label70:setName("label70");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout8);
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(443);
    obj.edit68:setTop(31);
    obj.edit68:setWidth(42);
    obj.edit68:setHeight(25);
    obj.edit68:setField("danoP6");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setType("number");
    obj.edit68:setName("edit68");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout8);
    obj.label71:setLeft(370);
    obj.label71:setTop(55);
    obj.label71:setWidth(70);
    obj.label71:setHeight(25);
    obj.label71:setText("Dano Bôn.");
    obj.label71:setName("label71");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout8);
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(443);
    obj.edit69:setTop(55);
    obj.edit69:setWidth(42);
    obj.edit69:setHeight(25);
    obj.edit69:setField("BonDMGP6");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setType("number");
    obj.edit69:setName("edit69");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout8);
    obj.button16:setLeft(488);
    obj.button16:setTop(6);
    obj.button16:setWidth(82);
    obj.button16:setText("Acerto");
    obj.button16:setFontSize(11);
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout8);
    obj.button17:setLeft(488);
    obj.button17:setTop(31);
    obj.button17:setWidth(82);
    obj.button17:setText("A. Seguido");
    obj.button17:setFontSize(11);
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout8);
    obj.button18:setLeft(488);
    obj.button18:setTop(55);
    obj.button18:setWidth(82);
    obj.button18:setText("Golpe Z");
    obj.button18:setFontSize(11);
    obj.button18:setName("button18");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout8);
    obj.textEditor6:setLeft(575);
    obj.textEditor6:setTop(5);
    obj.textEditor6:setWidth(280);
    obj.textEditor6:setHeight(50);
    obj.textEditor6:setField("campoEfeitoGolpesP6");
    obj.textEditor6:setName("textEditor6");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout8);
    obj.label72:setLeft(575);
    obj.label72:setTop(55);
    obj.label72:setWidth(50);
    obj.label72:setHeight(25);
    obj.label72:setText("M.Crit.");
    obj.label72:setName("label72");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout8);
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(630);
    obj.edit70:setTop(55);
    obj.edit70:setWidth(50);
    obj.edit70:setHeight(25);
    obj.edit70:setField("MCRIT6");
    obj.edit70:setHint("Margem de Crítico");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setType("number");
    obj.edit70:setName("edit70");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout8);
    obj.dataLink12:setField("BCRIT6");
    obj.dataLink12:setDefaultValue("10");
    obj.dataLink12:setName("dataLink12");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout8);
    obj.label73:setLeft(685);
    obj.label73:setTop(55);
    obj.label73:setWidth(50);
    obj.label73:setHeight(25);
    obj.label73:setText("Efeito");
    obj.label73:setName("label73");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout8);
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(740);
    obj.edit71:setTop(55);
    obj.edit71:setWidth(80);
    obj.edit71:setHeight(25);
    obj.edit71:setField("EFF6");
    obj.edit71:setHint("Efeito Causado");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout8);
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(825);
    obj.edit72:setTop(55);
    obj.edit72:setWidth(30);
    obj.edit72:setHeight(25);
    obj.edit72:setField("MARGEF6");
    obj.edit72:setHint("Margem");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setType("number");
    obj.edit72:setName("edit72");

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

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout9);
    obj.label74:setLeft(5);
    obj.label74:setTop(5);
    obj.label74:setWidth(70);
    obj.label74:setHeight(25);
    obj.label74:setText("Golpe 7");
    obj.label74:setName("label74");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout9);
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(75);
    obj.edit73:setTop(5);
    obj.edit73:setWidth(160);
    obj.edit73:setHeight(25);
    obj.edit73:setField("golpeP7");
    obj.edit73:setName("edit73");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout9);
    obj.label75:setLeft(5);
    obj.label75:setTop(30);
    obj.label75:setWidth(80);
    obj.label75:setHeight(25);
    obj.label75:setText("Tipo");
    obj.label75:setName("label75");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout9);
    obj.comboBox13:setLeft(75);
    obj.comboBox13:setTop(32);
    obj.comboBox13:setWidth(90);
    obj.comboBox13:setHeight(20);
    obj.comboBox13:setField("campoElem37");
    obj.comboBox13:setHorzTextAlign("leading");
    obj.comboBox13:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox13:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox13:setName("comboBox13");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout9);
    obj.dataLink13:setField("campoElem37");
    obj.dataLink13:setDefaultValue("19");
    obj.dataLink13:setName("dataLink13");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout9);
    obj.label76:setLeft(170);
    obj.label76:setTop(32);
    obj.label76:setWidth(10);
    obj.label76:setHeight(25);
    obj.label76:setText("Z:");
    obj.label76:setName("label76");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout9);
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(190);
    obj.edit74:setTop(32);
    obj.edit74:setWidth(45);
    obj.edit74:setHeight(25);
    obj.edit74:setField("danoZ7");
    obj.edit74:setHint("Poder do golpe Z");
    obj.edit74:setName("edit74");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout9);
    obj.label77:setLeft(5);
    obj.label77:setTop(55);
    obj.label77:setWidth(80);
    obj.label77:setHeight(25);
    obj.label77:setText("ACP/ACS(%)");
    obj.label77:setName("label77");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout9);
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(75);
    obj.edit75:setTop(55);
    obj.edit75:setWidth(75);
    obj.edit75:setHeight(25);
    obj.edit75:setField("ACP7");
    obj.edit75:setHint("Acerto Primário");
    obj.edit75:setType("number");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setName("edit75");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout9);
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(160);
    obj.edit76:setTop(55);
    obj.edit76:setWidth(75);
    obj.edit76:setHeight(25);
    obj.edit76:setField("ACS7");
    obj.edit76:setHint("Acerto Secundário");
    obj.edit76:setType("number");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout9);
    obj.label78:setLeft(240);
    obj.label78:setTop(6);
    obj.label78:setWidth(50);
    obj.label78:setHeight(25);
    obj.label78:setText("Classe");
    obj.label78:setName("label78");

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout9);
    obj.comboBox14:setLeft(282);
    obj.comboBox14:setTop(6);
    obj.comboBox14:setWidth(82);
    obj.comboBox14:setHeight(25);
    obj.comboBox14:setField("classeP7");
    obj.comboBox14:setHorzTextAlign("center");
    obj.comboBox14:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox14:setValues({'1', '2', '3'});
    obj.comboBox14:setName("comboBox14");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout9);
    obj.label79:setLeft(240);
    obj.label79:setTop(31);
    obj.label79:setWidth(50);
    obj.label79:setHeight(25);
    obj.label79:setText("Cont.");
    obj.label79:setName("label79");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout9);
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(282);
    obj.edit77:setTop(31);
    obj.edit77:setWidth(82);
    obj.edit77:setHeight(25);
    obj.edit77:setField("contP7");
    obj.edit77:setHint("Contato");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout9);
    obj.label80:setLeft(240);
    obj.label80:setTop(55);
    obj.label80:setWidth(50);
    obj.label80:setHeight(25);
    obj.label80:setText("Área");
    obj.label80:setName("label80");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout9);
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(282);
    obj.edit78:setTop(55);
    obj.edit78:setWidth(82);
    obj.edit78:setHeight(25);
    obj.edit78:setField("Area7");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout9);
    obj.label81:setLeft(370);
    obj.label81:setTop(6);
    obj.label81:setWidth(70);
    obj.label81:setHeight(25);
    obj.label81:setText("Prioridade");
    obj.label81:setName("label81");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout9);
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(443);
    obj.edit79:setTop(6);
    obj.edit79:setWidth(42);
    obj.edit79:setHeight(25);
    obj.edit79:setField("prioP7");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout9);
    obj.label82:setLeft(370);
    obj.label82:setTop(31);
    obj.label82:setWidth(70);
    obj.label82:setHeight(25);
    obj.label82:setText("Poder");
    obj.label82:setName("label82");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout9);
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(443);
    obj.edit80:setTop(31);
    obj.edit80:setWidth(42);
    obj.edit80:setHeight(25);
    obj.edit80:setField("danoP7");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setType("number");
    obj.edit80:setName("edit80");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout9);
    obj.label83:setLeft(370);
    obj.label83:setTop(55);
    obj.label83:setWidth(70);
    obj.label83:setHeight(25);
    obj.label83:setText("Dano Bôn.");
    obj.label83:setName("label83");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout9);
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(443);
    obj.edit81:setTop(55);
    obj.edit81:setWidth(42);
    obj.edit81:setHeight(25);
    obj.edit81:setField("BonDMGP7");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setType("number");
    obj.edit81:setName("edit81");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout9);
    obj.button19:setLeft(488);
    obj.button19:setTop(6);
    obj.button19:setWidth(82);
    obj.button19:setText("Acerto");
    obj.button19:setFontSize(11);
    obj.button19:setName("button19");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout9);
    obj.button20:setLeft(488);
    obj.button20:setTop(31);
    obj.button20:setWidth(82);
    obj.button20:setText("A. Seguido");
    obj.button20:setFontSize(11);
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout9);
    obj.button21:setLeft(488);
    obj.button21:setTop(55);
    obj.button21:setWidth(82);
    obj.button21:setText("Golpe Z");
    obj.button21:setFontSize(11);
    obj.button21:setName("button21");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout9);
    obj.textEditor7:setLeft(575);
    obj.textEditor7:setTop(5);
    obj.textEditor7:setWidth(280);
    obj.textEditor7:setHeight(50);
    obj.textEditor7:setField("campoEfeitoGolpesP7");
    obj.textEditor7:setName("textEditor7");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout9);
    obj.label84:setLeft(575);
    obj.label84:setTop(55);
    obj.label84:setWidth(50);
    obj.label84:setHeight(25);
    obj.label84:setText("M.Crit.");
    obj.label84:setName("label84");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout9);
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(630);
    obj.edit82:setTop(55);
    obj.edit82:setWidth(50);
    obj.edit82:setHeight(25);
    obj.edit82:setField("MCRIT7");
    obj.edit82:setHint("Margem de Crítico");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setType("number");
    obj.edit82:setName("edit82");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout9);
    obj.dataLink14:setField("BCRIT7");
    obj.dataLink14:setDefaultValue("10");
    obj.dataLink14:setName("dataLink14");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout9);
    obj.label85:setLeft(685);
    obj.label85:setTop(55);
    obj.label85:setWidth(50);
    obj.label85:setHeight(25);
    obj.label85:setText("Efeito");
    obj.label85:setName("label85");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout9);
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setLeft(740);
    obj.edit83:setTop(55);
    obj.edit83:setWidth(80);
    obj.edit83:setHeight(25);
    obj.edit83:setField("EFF7");
    obj.edit83:setHint("Efeito Causado");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout9);
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setLeft(825);
    obj.edit84:setTop(55);
    obj.edit84:setWidth(30);
    obj.edit84:setHeight(25);
    obj.edit84:setField("MARGEF7");
    obj.edit84:setHint("Margem");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setType("number");
    obj.edit84:setName("edit84");

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

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout10);
    obj.label86:setLeft(5);
    obj.label86:setTop(5);
    obj.label86:setWidth(70);
    obj.label86:setHeight(25);
    obj.label86:setText("Golpe 8");
    obj.label86:setName("label86");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout10);
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setLeft(75);
    obj.edit85:setTop(5);
    obj.edit85:setWidth(160);
    obj.edit85:setHeight(25);
    obj.edit85:setField("golpeP8");
    obj.edit85:setName("edit85");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout10);
    obj.label87:setLeft(5);
    obj.label87:setTop(30);
    obj.label87:setWidth(80);
    obj.label87:setHeight(25);
    obj.label87:setText("Tipo");
    obj.label87:setName("label87");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout10);
    obj.comboBox15:setLeft(75);
    obj.comboBox15:setTop(32);
    obj.comboBox15:setWidth(90);
    obj.comboBox15:setHeight(20);
    obj.comboBox15:setField("campoElem38");
    obj.comboBox15:setHorzTextAlign("leading");
    obj.comboBox15:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox15:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox15:setName("comboBox15");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout10);
    obj.dataLink15:setField("campoElem38");
    obj.dataLink15:setDefaultValue("19");
    obj.dataLink15:setName("dataLink15");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout10);
    obj.label88:setLeft(170);
    obj.label88:setTop(32);
    obj.label88:setWidth(10);
    obj.label88:setHeight(25);
    obj.label88:setText("Z:");
    obj.label88:setName("label88");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout10);
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setLeft(190);
    obj.edit86:setTop(32);
    obj.edit86:setWidth(45);
    obj.edit86:setHeight(25);
    obj.edit86:setField("danoZ8");
    obj.edit86:setHint("Poder do golpe Z");
    obj.edit86:setName("edit86");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout10);
    obj.label89:setLeft(5);
    obj.label89:setTop(55);
    obj.label89:setWidth(80);
    obj.label89:setHeight(25);
    obj.label89:setText("ACP/ACS(%)");
    obj.label89:setName("label89");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout10);
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setLeft(75);
    obj.edit87:setTop(55);
    obj.edit87:setWidth(75);
    obj.edit87:setHeight(25);
    obj.edit87:setField("ACP8");
    obj.edit87:setHint("Acerto Primário");
    obj.edit87:setType("number");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setName("edit87");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout10);
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setLeft(160);
    obj.edit88:setTop(55);
    obj.edit88:setWidth(75);
    obj.edit88:setHeight(25);
    obj.edit88:setField("ACS8");
    obj.edit88:setHint("Acerto Secundário");
    obj.edit88:setType("number");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout10);
    obj.label90:setLeft(240);
    obj.label90:setTop(6);
    obj.label90:setWidth(50);
    obj.label90:setHeight(25);
    obj.label90:setText("Classe");
    obj.label90:setName("label90");

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout10);
    obj.comboBox16:setLeft(282);
    obj.comboBox16:setTop(6);
    obj.comboBox16:setWidth(82);
    obj.comboBox16:setHeight(25);
    obj.comboBox16:setField("classeP8");
    obj.comboBox16:setHorzTextAlign("center");
    obj.comboBox16:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox16:setValues({'1', '2', '3'});
    obj.comboBox16:setName("comboBox16");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout10);
    obj.label91:setLeft(240);
    obj.label91:setTop(31);
    obj.label91:setWidth(50);
    obj.label91:setHeight(25);
    obj.label91:setText("Cont.");
    obj.label91:setName("label91");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout10);
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setLeft(282);
    obj.edit89:setTop(31);
    obj.edit89:setWidth(82);
    obj.edit89:setHeight(25);
    obj.edit89:setField("contP8");
    obj.edit89:setHint("Contato");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout10);
    obj.label92:setLeft(240);
    obj.label92:setTop(55);
    obj.label92:setWidth(50);
    obj.label92:setHeight(25);
    obj.label92:setText("Área");
    obj.label92:setName("label92");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout10);
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setLeft(282);
    obj.edit90:setTop(55);
    obj.edit90:setWidth(82);
    obj.edit90:setHeight(25);
    obj.edit90:setField("Area8");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout10);
    obj.label93:setLeft(370);
    obj.label93:setTop(6);
    obj.label93:setWidth(70);
    obj.label93:setHeight(25);
    obj.label93:setText("Prioridade");
    obj.label93:setName("label93");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout10);
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setLeft(443);
    obj.edit91:setTop(6);
    obj.edit91:setWidth(42);
    obj.edit91:setHeight(25);
    obj.edit91:setField("prioP8");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setName("edit91");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout10);
    obj.label94:setLeft(370);
    obj.label94:setTop(31);
    obj.label94:setWidth(70);
    obj.label94:setHeight(25);
    obj.label94:setText("Poder");
    obj.label94:setName("label94");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout10);
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setLeft(443);
    obj.edit92:setTop(31);
    obj.edit92:setWidth(42);
    obj.edit92:setHeight(25);
    obj.edit92:setField("danoP8");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setType("number");
    obj.edit92:setName("edit92");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout10);
    obj.label95:setLeft(370);
    obj.label95:setTop(55);
    obj.label95:setWidth(70);
    obj.label95:setHeight(25);
    obj.label95:setText("Dano Bôn.");
    obj.label95:setName("label95");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout10);
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setLeft(443);
    obj.edit93:setTop(55);
    obj.edit93:setWidth(42);
    obj.edit93:setHeight(25);
    obj.edit93:setField("BonDMGP8");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setType("number");
    obj.edit93:setName("edit93");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout10);
    obj.button22:setLeft(488);
    obj.button22:setTop(6);
    obj.button22:setWidth(82);
    obj.button22:setText("Acerto");
    obj.button22:setFontSize(11);
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout10);
    obj.button23:setLeft(488);
    obj.button23:setTop(31);
    obj.button23:setWidth(82);
    obj.button23:setText("A. Seguido");
    obj.button23:setFontSize(11);
    obj.button23:setName("button23");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout10);
    obj.button24:setLeft(488);
    obj.button24:setTop(55);
    obj.button24:setWidth(82);
    obj.button24:setText("Golpe Z");
    obj.button24:setFontSize(11);
    obj.button24:setName("button24");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout10);
    obj.textEditor8:setLeft(575);
    obj.textEditor8:setTop(5);
    obj.textEditor8:setWidth(280);
    obj.textEditor8:setHeight(50);
    obj.textEditor8:setField("campoEfeitoGolpesP8");
    obj.textEditor8:setName("textEditor8");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout10);
    obj.label96:setLeft(575);
    obj.label96:setTop(55);
    obj.label96:setWidth(50);
    obj.label96:setHeight(25);
    obj.label96:setText("M.Crit.");
    obj.label96:setName("label96");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout10);
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setLeft(630);
    obj.edit94:setTop(55);
    obj.edit94:setWidth(50);
    obj.edit94:setHeight(25);
    obj.edit94:setField("MCRIT8");
    obj.edit94:setHint("Margem de Crítico");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setType("number");
    obj.edit94:setName("edit94");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout10);
    obj.dataLink16:setField("BCRIT8");
    obj.dataLink16:setDefaultValue("10");
    obj.dataLink16:setName("dataLink16");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout10);
    obj.label97:setLeft(685);
    obj.label97:setTop(55);
    obj.label97:setWidth(50);
    obj.label97:setHeight(25);
    obj.label97:setText("Efeito");
    obj.label97:setName("label97");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout10);
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setLeft(740);
    obj.edit95:setTop(55);
    obj.edit95:setWidth(80);
    obj.edit95:setHeight(25);
    obj.edit95:setField("EFF8");
    obj.edit95:setHint("Efeito Causado");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout10);
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setLeft(825);
    obj.edit96:setTop(55);
    obj.edit96:setWidth(30);
    obj.edit96:setHeight(25);
    obj.edit96:setField("MARGEF8");
    obj.edit96:setHint("Margem");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setType("number");
    obj.edit96:setName("edit96");

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

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout11);
    obj.label98:setLeft(5);
    obj.label98:setTop(5);
    obj.label98:setWidth(70);
    obj.label98:setHeight(25);
    obj.label98:setText("Golpe 9");
    obj.label98:setName("label98");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout11);
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setLeft(75);
    obj.edit97:setTop(5);
    obj.edit97:setWidth(160);
    obj.edit97:setHeight(25);
    obj.edit97:setField("golpeP9");
    obj.edit97:setName("edit97");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout11);
    obj.label99:setLeft(5);
    obj.label99:setTop(30);
    obj.label99:setWidth(80);
    obj.label99:setHeight(25);
    obj.label99:setText("Tipo");
    obj.label99:setName("label99");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout11);
    obj.comboBox17:setLeft(75);
    obj.comboBox17:setTop(32);
    obj.comboBox17:setWidth(90);
    obj.comboBox17:setHeight(20);
    obj.comboBox17:setField("campoElem39");
    obj.comboBox17:setHorzTextAlign("leading");
    obj.comboBox17:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox17:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox17:setName("comboBox17");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout11);
    obj.dataLink17:setField("campoElem39");
    obj.dataLink17:setDefaultValue("19");
    obj.dataLink17:setName("dataLink17");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout11);
    obj.label100:setLeft(170);
    obj.label100:setTop(32);
    obj.label100:setWidth(10);
    obj.label100:setHeight(25);
    obj.label100:setText("Z:");
    obj.label100:setName("label100");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout11);
    obj.edit98:setVertTextAlign("center");
    obj.edit98:setLeft(190);
    obj.edit98:setTop(32);
    obj.edit98:setWidth(45);
    obj.edit98:setHeight(25);
    obj.edit98:setField("danoZ9");
    obj.edit98:setHint("Poder do golpe Z");
    obj.edit98:setName("edit98");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout11);
    obj.label101:setLeft(5);
    obj.label101:setTop(55);
    obj.label101:setWidth(80);
    obj.label101:setHeight(25);
    obj.label101:setText("ACP/ACS(%)");
    obj.label101:setName("label101");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout11);
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setLeft(75);
    obj.edit99:setTop(55);
    obj.edit99:setWidth(75);
    obj.edit99:setHeight(25);
    obj.edit99:setField("ACP9");
    obj.edit99:setHint("Acerto Primário");
    obj.edit99:setType("number");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setName("edit99");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout11);
    obj.edit100:setVertTextAlign("center");
    obj.edit100:setLeft(160);
    obj.edit100:setTop(55);
    obj.edit100:setWidth(75);
    obj.edit100:setHeight(25);
    obj.edit100:setField("ACS9");
    obj.edit100:setHint("Acerto Secundário");
    obj.edit100:setType("number");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setName("edit100");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout11);
    obj.label102:setLeft(240);
    obj.label102:setTop(6);
    obj.label102:setWidth(50);
    obj.label102:setHeight(25);
    obj.label102:setText("Classe");
    obj.label102:setName("label102");

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout11);
    obj.comboBox18:setLeft(282);
    obj.comboBox18:setTop(6);
    obj.comboBox18:setWidth(82);
    obj.comboBox18:setHeight(25);
    obj.comboBox18:setField("classeP9");
    obj.comboBox18:setHorzTextAlign("center");
    obj.comboBox18:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox18:setValues({'1', '2', '3'});
    obj.comboBox18:setName("comboBox18");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout11);
    obj.label103:setLeft(240);
    obj.label103:setTop(31);
    obj.label103:setWidth(50);
    obj.label103:setHeight(25);
    obj.label103:setText("Cont.");
    obj.label103:setName("label103");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout11);
    obj.edit101:setVertTextAlign("center");
    obj.edit101:setLeft(282);
    obj.edit101:setTop(31);
    obj.edit101:setWidth(82);
    obj.edit101:setHeight(25);
    obj.edit101:setField("contP9");
    obj.edit101:setHint("Contato");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setName("edit101");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout11);
    obj.label104:setLeft(240);
    obj.label104:setTop(55);
    obj.label104:setWidth(50);
    obj.label104:setHeight(25);
    obj.label104:setText("Área");
    obj.label104:setName("label104");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout11);
    obj.edit102:setVertTextAlign("center");
    obj.edit102:setLeft(282);
    obj.edit102:setTop(55);
    obj.edit102:setWidth(82);
    obj.edit102:setHeight(25);
    obj.edit102:setField("Area9");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setName("edit102");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout11);
    obj.label105:setLeft(370);
    obj.label105:setTop(6);
    obj.label105:setWidth(70);
    obj.label105:setHeight(25);
    obj.label105:setText("Prioridade");
    obj.label105:setName("label105");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout11);
    obj.edit103:setVertTextAlign("center");
    obj.edit103:setLeft(443);
    obj.edit103:setTop(6);
    obj.edit103:setWidth(42);
    obj.edit103:setHeight(25);
    obj.edit103:setField("prioP9");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setName("edit103");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout11);
    obj.label106:setLeft(370);
    obj.label106:setTop(31);
    obj.label106:setWidth(70);
    obj.label106:setHeight(25);
    obj.label106:setText("Poder");
    obj.label106:setName("label106");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout11);
    obj.edit104:setVertTextAlign("center");
    obj.edit104:setLeft(443);
    obj.edit104:setTop(31);
    obj.edit104:setWidth(42);
    obj.edit104:setHeight(25);
    obj.edit104:setField("danoP9");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setType("number");
    obj.edit104:setName("edit104");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout11);
    obj.label107:setLeft(370);
    obj.label107:setTop(55);
    obj.label107:setWidth(70);
    obj.label107:setHeight(25);
    obj.label107:setText("Dano Bôn.");
    obj.label107:setName("label107");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout11);
    obj.edit105:setVertTextAlign("center");
    obj.edit105:setLeft(443);
    obj.edit105:setTop(55);
    obj.edit105:setWidth(42);
    obj.edit105:setHeight(25);
    obj.edit105:setField("BonDMGP9");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setType("number");
    obj.edit105:setName("edit105");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout11);
    obj.button25:setLeft(488);
    obj.button25:setTop(6);
    obj.button25:setWidth(82);
    obj.button25:setText("Acerto");
    obj.button25:setFontSize(11);
    obj.button25:setName("button25");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout11);
    obj.button26:setLeft(488);
    obj.button26:setTop(31);
    obj.button26:setWidth(82);
    obj.button26:setText("A. Seguido");
    obj.button26:setFontSize(11);
    obj.button26:setName("button26");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout11);
    obj.button27:setLeft(488);
    obj.button27:setTop(55);
    obj.button27:setWidth(82);
    obj.button27:setText("Golpe Z");
    obj.button27:setFontSize(11);
    obj.button27:setName("button27");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout11);
    obj.textEditor9:setLeft(575);
    obj.textEditor9:setTop(5);
    obj.textEditor9:setWidth(280);
    obj.textEditor9:setHeight(50);
    obj.textEditor9:setField("campoEfeitoGolpesP9");
    obj.textEditor9:setName("textEditor9");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout11);
    obj.label108:setLeft(575);
    obj.label108:setTop(55);
    obj.label108:setWidth(50);
    obj.label108:setHeight(25);
    obj.label108:setText("M.Crit.");
    obj.label108:setName("label108");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout11);
    obj.edit106:setVertTextAlign("center");
    obj.edit106:setLeft(630);
    obj.edit106:setTop(55);
    obj.edit106:setWidth(50);
    obj.edit106:setHeight(25);
    obj.edit106:setField("MCRIT9");
    obj.edit106:setHint("Margem de Crítico");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setType("number");
    obj.edit106:setName("edit106");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout11);
    obj.dataLink18:setField("BCRIT9");
    obj.dataLink18:setDefaultValue("10");
    obj.dataLink18:setName("dataLink18");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout11);
    obj.label109:setLeft(685);
    obj.label109:setTop(55);
    obj.label109:setWidth(50);
    obj.label109:setHeight(25);
    obj.label109:setText("Efeito");
    obj.label109:setName("label109");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout11);
    obj.edit107:setVertTextAlign("center");
    obj.edit107:setLeft(740);
    obj.edit107:setTop(55);
    obj.edit107:setWidth(80);
    obj.edit107:setHeight(25);
    obj.edit107:setField("EFF9");
    obj.edit107:setHint("Efeito Causado");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setName("edit107");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout11);
    obj.edit108:setVertTextAlign("center");
    obj.edit108:setLeft(825);
    obj.edit108:setTop(55);
    obj.edit108:setWidth(30);
    obj.edit108:setHeight(25);
    obj.edit108:setField("MARGEF9");
    obj.edit108:setHint("Margem");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setType("number");
    obj.edit108:setName("edit108");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP1 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP1) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF1 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACP1) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem31) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP1) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP1) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT1) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF1) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP1 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP1) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF1 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACS1) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem31) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP1) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP1) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT1) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF1) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP1) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_ACC = "; [§K9]Auto-Acerto![§K14] "
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem31) or 19;
            					if (Elemento == 1) then 
            						NomeGolpe = "Breakneck Blitz"
            						end
            					if (Elemento == 2) then 
            						NomeGolpe = "Inferno Overdrive"
            						end
            					if (Elemento == 3) then 
            						NomeGolpe = "Hydro Vortex"
            						end
            					if (Elemento == 4) then 
            						NomeGolpe = "Gigavolt Havoc"
            						end
            					if (Elemento == 5) then 
            						NomeGolpe = "Bloom Doom"
            						end
            					if (Elemento == 6) then 
            						NomeGolpe = "Subzero Slammer"
            						end
            					if (Elemento == 7) then 
            						NomeGolpe = "All-Out Plummeling"
            						end
            					if (Elemento == 8) then 
            						NomeGolpe = "Acid Downpur"
            						end
            					if (Elemento == 9) then 
            						NomeGolpe = "Tectonic Rage"
            						end
            					if (Elemento == 10) then 
            						NomeGolpe = "Supersonic Skystrike"
            						end
            					if (Elemento == 11) then 
            						NomeGolpe = "Shattered Psyche"
            						end
            					if (Elemento == 12) then 
            						NomeGolpe = "Savage Spin-Out"
            						end
            					if (Elemento == 13) then 
            						NomeGolpe = "Continental Crush"
            						end
            					if (Elemento == 14) then 
            						NomeGolpe = "Never-Ending Nightmare"
            						end
            					if (Elemento == 15) then 
            						NomeGolpe = "Devastating Drake"
            						end
            					if (Elemento == 16) then 
            						NomeGolpe = "Blackhole Eclipse"
            						end
            					if (Elemento == 17) then 
            						NomeGolpe = "Corkscrew Crash"
            						end
            					if (Elemento == 18) then 
            						NomeGolpe = "Twinkle Tackle"
            						end
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoZ1) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP1) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT1) or 10;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser)
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP2 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP2) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF2 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACP2) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem32) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP2) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP2) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT2) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF2) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP2 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP2) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF2 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACS2) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem32) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP2) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP2) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT2) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF2) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP2) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_ACC = "; [§K9]Auto-Acerto![§K14] "
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem32) or 19;
            					if (Elemento == 1) then 
            						NomeGolpe = "Breakneck Blitz"
            						end
            					if (Elemento == 2) then 
            						NomeGolpe = "Inferno Overdrive"
            						end
            					if (Elemento == 3) then 
            						NomeGolpe = "Hydro Vortex"
            						end
            					if (Elemento == 4) then 
            						NomeGolpe = "Gigavolt Havoc"
            						end
            					if (Elemento == 5) then 
            						NomeGolpe = "Bloom Doom"
            						end
            					if (Elemento == 6) then 
            						NomeGolpe = "Subzero Slammer"
            						end
            					if (Elemento == 7) then 
            						NomeGolpe = "All-Out Plummeling"
            						end
            					if (Elemento == 8) then 
            						NomeGolpe = "Acid Downpur"
            						end
            					if (Elemento == 9) then 
            						NomeGolpe = "Tectonic Rage"
            						end
            					if (Elemento == 10) then 
            						NomeGolpe = "Supersonic Skystrike"
            						end
            					if (Elemento == 11) then 
            						NomeGolpe = "Shattered Psyche"
            						end
            					if (Elemento == 12) then 
            						NomeGolpe = "Savage Spin-Out"
            						end
            					if (Elemento == 13) then 
            						NomeGolpe = "Continental Crush"
            						end
            					if (Elemento == 14) then 
            						NomeGolpe = "Never-Ending Nightmare"
            						end
            					if (Elemento == 15) then 
            						NomeGolpe = "Devastating Drake"
            						end
            					if (Elemento == 16) then 
            						NomeGolpe = "Blackhole Eclipse"
            						end
            					if (Elemento == 17) then 
            						NomeGolpe = "Corkscrew Crash"
            						end
            					if (Elemento == 18) then 
            						NomeGolpe = "Twinkle Tackle"
            						end
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoZ2) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP2) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT2) or 10;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser)
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP3 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP3) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF3 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACP3) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem33) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP3) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP3) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT3) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF3) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP3 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP3) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF3 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACS3) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem33) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP3) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP3) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT3) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF3) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP3) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_ACC = "; [§K9]Auto-Acerto![§K14] "
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem33) or 19;
            					if (Elemento == 1) then 
            						NomeGolpe = "Breakneck Blitz"
            						end
            					if (Elemento == 2) then 
            						NomeGolpe = "Inferno Overdrive"
            						end
            					if (Elemento == 3) then 
            						NomeGolpe = "Hydro Vortex"
            						end
            					if (Elemento == 4) then 
            						NomeGolpe = "Gigavolt Havoc"
            						end
            					if (Elemento == 5) then 
            						NomeGolpe = "Bloom Doom"
            						end
            					if (Elemento == 6) then 
            						NomeGolpe = "Subzero Slammer"
            						end
            					if (Elemento == 7) then 
            						NomeGolpe = "All-Out Plummeling"
            						end
            					if (Elemento == 8) then 
            						NomeGolpe = "Acid Downpur"
            						end
            					if (Elemento == 9) then 
            						NomeGolpe = "Tectonic Rage"
            						end
            					if (Elemento == 10) then 
            						NomeGolpe = "Supersonic Skystrike"
            						end
            					if (Elemento == 11) then 
            						NomeGolpe = "Shattered Psyche"
            						end
            					if (Elemento == 12) then 
            						NomeGolpe = "Savage Spin-Out"
            						end
            					if (Elemento == 13) then 
            						NomeGolpe = "Continental Crush"
            						end
            					if (Elemento == 14) then 
            						NomeGolpe = "Never-Ending Nightmare"
            						end
            					if (Elemento == 15) then 
            						NomeGolpe = "Devastating Drake"
            						end
            					if (Elemento == 16) then 
            						NomeGolpe = "Blackhole Eclipse"
            						end
            					if (Elemento == 17) then 
            						NomeGolpe = "Corkscrew Crash"
            						end
            					if (Elemento == 18) then 
            						NomeGolpe = "Twinkle Tackle"
            						end
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoZ3) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP3) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT3) or 10;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser)
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP4 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP4) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF4 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACP4) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem34) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP4) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP4) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT4) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF4) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP4 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP4) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF4 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACS4) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem34) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP4) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP4) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT4) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF4) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP4) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_ACC = "; [§K9]Auto-Acerto![§K14] "
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem34) or 19;
            					if (Elemento == 1) then 
            						NomeGolpe = "Breakneck Blitz"
            						end
            					if (Elemento == 2) then 
            						NomeGolpe = "Inferno Overdrive"
            						end
            					if (Elemento == 3) then 
            						NomeGolpe = "Hydro Vortex"
            						end
            					if (Elemento == 4) then 
            						NomeGolpe = "Gigavolt Havoc"
            						end
            					if (Elemento == 5) then 
            						NomeGolpe = "Bloom Doom"
            						end
            					if (Elemento == 6) then 
            						NomeGolpe = "Subzero Slammer"
            						end
            					if (Elemento == 7) then 
            						NomeGolpe = "All-Out Plummeling"
            						end
            					if (Elemento == 8) then 
            						NomeGolpe = "Acid Downpur"
            						end
            					if (Elemento == 9) then 
            						NomeGolpe = "Tectonic Rage"
            						end
            					if (Elemento == 10) then 
            						NomeGolpe = "Supersonic Skystrike"
            						end
            					if (Elemento == 11) then 
            						NomeGolpe = "Shattered Psyche"
            						end
            					if (Elemento == 12) then 
            						NomeGolpe = "Savage Spin-Out"
            						end
            					if (Elemento == 13) then 
            						NomeGolpe = "Continental Crush"
            						end
            					if (Elemento == 14) then 
            						NomeGolpe = "Never-Ending Nightmare"
            						end
            					if (Elemento == 15) then 
            						NomeGolpe = "Devastating Drake"
            						end
            					if (Elemento == 16) then 
            						NomeGolpe = "Blackhole Eclipse"
            						end
            					if (Elemento == 17) then 
            						NomeGolpe = "Corkscrew Crash"
            						end
            					if (Elemento == 18) then 
            						NomeGolpe = "Twinkle Tackle"
            						end
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoZ4) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP4) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT4) or 10;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser)
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP5 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP5) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF5 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACP5) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem35) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP5) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP5) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT5) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF5) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP5 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP5) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF5 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACS5) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem35) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP5) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP5) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT5) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF5) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP5) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_ACC = "; [§K9]Auto-Acerto![§K14] "
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem35) or 19;
            					if (Elemento == 1) then 
            						NomeGolpe = "Breakneck Blitz"
            						end
            					if (Elemento == 2) then 
            						NomeGolpe = "Inferno Overdrive"
            						end
            					if (Elemento == 3) then 
            						NomeGolpe = "Hydro Vortex"
            						end
            					if (Elemento == 4) then 
            						NomeGolpe = "Gigavolt Havoc"
            						end
            					if (Elemento == 5) then 
            						NomeGolpe = "Bloom Doom"
            						end
            					if (Elemento == 6) then 
            						NomeGolpe = "Subzero Slammer"
            						end
            					if (Elemento == 7) then 
            						NomeGolpe = "All-Out Plummeling"
            						end
            					if (Elemento == 8) then 
            						NomeGolpe = "Acid Downpur"
            						end
            					if (Elemento == 9) then 
            						NomeGolpe = "Tectonic Rage"
            						end
            					if (Elemento == 10) then 
            						NomeGolpe = "Supersonic Skystrike"
            						end
            					if (Elemento == 11) then 
            						NomeGolpe = "Shattered Psyche"
            						end
            					if (Elemento == 12) then 
            						NomeGolpe = "Savage Spin-Out"
            						end
            					if (Elemento == 13) then 
            						NomeGolpe = "Continental Crush"
            						end
            					if (Elemento == 14) then 
            						NomeGolpe = "Never-Ending Nightmare"
            						end
            					if (Elemento == 15) then 
            						NomeGolpe = "Devastating Drake"
            						end
            					if (Elemento == 16) then 
            						NomeGolpe = "Blackhole Eclipse"
            						end
            					if (Elemento == 17) then 
            						NomeGolpe = "Corkscrew Crash"
            						end
            					if (Elemento == 18) then 
            						NomeGolpe = "Twinkle Tackle"
            						end
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoZ5) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP5) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT5) or 10;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser)
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP6 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP6) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF6 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACP6) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem36) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP6) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP6) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT6) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF6) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP6 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP6) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF6 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACS6) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem36) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP6) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP6) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT6) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF6) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP6) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_ACC = "; [§K9]Auto-Acerto![§K14] "
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem36) or 19;
            					if (Elemento == 1) then 
            						NomeGolpe = "Breakneck Blitz"
            						end
            					if (Elemento == 2) then 
            						NomeGolpe = "Inferno Overdrive"
            						end
            					if (Elemento == 3) then 
            						NomeGolpe = "Hydro Vortex"
            						end
            					if (Elemento == 4) then 
            						NomeGolpe = "Gigavolt Havoc"
            						end
            					if (Elemento == 5) then 
            						NomeGolpe = "Bloom Doom"
            						end
            					if (Elemento == 6) then 
            						NomeGolpe = "Subzero Slammer"
            						end
            					if (Elemento == 7) then 
            						NomeGolpe = "All-Out Plummeling"
            						end
            					if (Elemento == 8) then 
            						NomeGolpe = "Acid Downpur"
            						end
            					if (Elemento == 9) then 
            						NomeGolpe = "Tectonic Rage"
            						end
            					if (Elemento == 10) then 
            						NomeGolpe = "Supersonic Skystrike"
            						end
            					if (Elemento == 11) then 
            						NomeGolpe = "Shattered Psyche"
            						end
            					if (Elemento == 12) then 
            						NomeGolpe = "Savage Spin-Out"
            						end
            					if (Elemento == 13) then 
            						NomeGolpe = "Continental Crush"
            						end
            					if (Elemento == 14) then 
            						NomeGolpe = "Never-Ending Nightmare"
            						end
            					if (Elemento == 15) then 
            						NomeGolpe = "Devastating Drake"
            						end
            					if (Elemento == 16) then 
            						NomeGolpe = "Blackhole Eclipse"
            						end
            					if (Elemento == 17) then 
            						NomeGolpe = "Corkscrew Crash"
            						end
            					if (Elemento == 18) then 
            						NomeGolpe = "Twinkle Tackle"
            						end
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoZ6) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP6) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT6) or 10;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser)
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP7 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP7) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF7 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACP7) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem37) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP7) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP7) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT7) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF7) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP7 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP7) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF7 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACS7) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem37) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP7) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP7) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT7) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF7) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP7) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_ACC = "; [§K9]Auto-Acerto![§K14] "
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem37) or 19;
            					if (Elemento == 1) then 
            						NomeGolpe = "Breakneck Blitz"
            						end
            					if (Elemento == 2) then 
            						NomeGolpe = "Inferno Overdrive"
            						end
            					if (Elemento == 3) then 
            						NomeGolpe = "Hydro Vortex"
            						end
            					if (Elemento == 4) then 
            						NomeGolpe = "Gigavolt Havoc"
            						end
            					if (Elemento == 5) then 
            						NomeGolpe = "Bloom Doom"
            						end
            					if (Elemento == 6) then 
            						NomeGolpe = "Subzero Slammer"
            						end
            					if (Elemento == 7) then 
            						NomeGolpe = "All-Out Plummeling"
            						end
            					if (Elemento == 8) then 
            						NomeGolpe = "Acid Downpur"
            						end
            					if (Elemento == 9) then 
            						NomeGolpe = "Tectonic Rage"
            						end
            					if (Elemento == 10) then 
            						NomeGolpe = "Supersonic Skystrike"
            						end
            					if (Elemento == 11) then 
            						NomeGolpe = "Shattered Psyche"
            						end
            					if (Elemento == 12) then 
            						NomeGolpe = "Savage Spin-Out"
            						end
            					if (Elemento == 13) then 
            						NomeGolpe = "Continental Crush"
            						end
            					if (Elemento == 14) then 
            						NomeGolpe = "Never-Ending Nightmare"
            						end
            					if (Elemento == 15) then 
            						NomeGolpe = "Devastating Drake"
            						end
            					if (Elemento == 16) then 
            						NomeGolpe = "Blackhole Eclipse"
            						end
            					if (Elemento == 17) then 
            						NomeGolpe = "Corkscrew Crash"
            						end
            					if (Elemento == 18) then 
            						NomeGolpe = "Twinkle Tackle"
            						end
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoZ7) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP7) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT7) or 10;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser)
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP8 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP8) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF8 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACP8) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem38) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP8) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP8) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT8) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF8) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP8 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP8) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF8 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACS8) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem38) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP8) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP8) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT8) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF8) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event23 = obj.button24:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP8) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_ACC = "; [§K9]Auto-Acerto![§K14] "
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem38) or 19;
            					if (Elemento == 1) then 
            						NomeGolpe = "Breakneck Blitz"
            						end
            					if (Elemento == 2) then 
            						NomeGolpe = "Inferno Overdrive"
            						end
            					if (Elemento == 3) then 
            						NomeGolpe = "Hydro Vortex"
            						end
            					if (Elemento == 4) then 
            						NomeGolpe = "Gigavolt Havoc"
            						end
            					if (Elemento == 5) then 
            						NomeGolpe = "Bloom Doom"
            						end
            					if (Elemento == 6) then 
            						NomeGolpe = "Subzero Slammer"
            						end
            					if (Elemento == 7) then 
            						NomeGolpe = "All-Out Plummeling"
            						end
            					if (Elemento == 8) then 
            						NomeGolpe = "Acid Downpur"
            						end
            					if (Elemento == 9) then 
            						NomeGolpe = "Tectonic Rage"
            						end
            					if (Elemento == 10) then 
            						NomeGolpe = "Supersonic Skystrike"
            						end
            					if (Elemento == 11) then 
            						NomeGolpe = "Shattered Psyche"
            						end
            					if (Elemento == 12) then 
            						NomeGolpe = "Savage Spin-Out"
            						end
            					if (Elemento == 13) then 
            						NomeGolpe = "Continental Crush"
            						end
            					if (Elemento == 14) then 
            						NomeGolpe = "Never-Ending Nightmare"
            						end
            					if (Elemento == 15) then 
            						NomeGolpe = "Devastating Drake"
            						end
            					if (Elemento == 16) then 
            						NomeGolpe = "Blackhole Eclipse"
            						end
            					if (Elemento == 17) then 
            						NomeGolpe = "Corkscrew Crash"
            						end
            					if (Elemento == 18) then 
            						NomeGolpe = "Twinkle Tackle"
            						end
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoZ8) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP8) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT8) or 10;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser)
        end, obj);

    obj._e_event24 = obj.button25:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP9 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP9) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF9 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACP9) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem39) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP9) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP9) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT9) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF9) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event25 = obj.button26:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP9 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP9) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_Effe = "";
            					local MSG_ACC = "";
            					local NomeEfeito = self.boxDetalhesDoItem.node.EFF9 or ""
            					local Acerto = tonumber(self.boxDetalhesDoItem.node.ACS9) or 0 
            						Acerto = math.floor(Acerto/10)
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem39) or 19;
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoP9) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP9) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT9) or 10;
            					local MEFFE = tonumber(self.boxDetalhesDoItem.node.MARGEF9) or 11;
            					local EDCPREC = tonumber(self.boxDetalhesDoItem.node.edcPREC) or 0;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local Acerto2 = Acerto + EDCPREC;
            					local Acerto2po = "" .. Acerto2*10 .. "%"
            					local Acerto3 = 10 - Acerto2;
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC > Acerto3) then
            						MSG_ACC = "; [§K9]Acertou![§K14](" .. Acerto2po .. ") "
            						end
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					if (ACC >= MEFFE) then
            						MSG_Effe = "; " .. NomeEfeito .. " causado."
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					if (Acerto3 >= ACC) then
            						MSG_ACC = "; [§K4]Errou![§K14](" .. Acerto2po .. ") "
            						MSG_DANO ="";
            						MSG_Crit ="";
            						MSG_Effe ="";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser .. MSG_Effe)
        end, obj);

    obj._e_event26 = obj.button27:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesa = Firecast.getMesaDe(sheet)
            					local NomeGolpe
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local CLASSE = tonumber(self.boxDetalhesDoItem.node.classeP9) or 3
            					local DAN_ATT = 0;
            					if CLASSE == 1 then
            						DAN_ATT = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            						end
            					if CLASSE == 2 then
            						DAN_ATT = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            						end
            					local DanSTAB = 0;
            					local MSG_Crit = "";
            					local MSG_ACC = "; [§K9]Auto-Acerto![§K14] "
            					local Elemento = tonumber(self.boxDetalhesDoItem.node.campoElem39) or 19;
            					if (Elemento == 1) then 
            						NomeGolpe = "Breakneck Blitz"
            						end
            					if (Elemento == 2) then 
            						NomeGolpe = "Inferno Overdrive"
            						end
            					if (Elemento == 3) then 
            						NomeGolpe = "Hydro Vortex"
            						end
            					if (Elemento == 4) then 
            						NomeGolpe = "Gigavolt Havoc"
            						end
            					if (Elemento == 5) then 
            						NomeGolpe = "Bloom Doom"
            						end
            					if (Elemento == 6) then 
            						NomeGolpe = "Subzero Slammer"
            						end
            					if (Elemento == 7) then 
            						NomeGolpe = "All-Out Plummeling"
            						end
            					if (Elemento == 8) then 
            						NomeGolpe = "Acid Downpur"
            						end
            					if (Elemento == 9) then 
            						NomeGolpe = "Tectonic Rage"
            						end
            					if (Elemento == 10) then 
            						NomeGolpe = "Supersonic Skystrike"
            						end
            					if (Elemento == 11) then 
            						NomeGolpe = "Shattered Psyche"
            						end
            					if (Elemento == 12) then 
            						NomeGolpe = "Savage Spin-Out"
            						end
            					if (Elemento == 13) then 
            						NomeGolpe = "Continental Crush"
            						end
            					if (Elemento == 14) then 
            						NomeGolpe = "Never-Ending Nightmare"
            						end
            					if (Elemento == 15) then 
            						NomeGolpe = "Devastating Drake"
            						end
            					if (Elemento == 16) then 
            						NomeGolpe = "Blackhole Eclipse"
            						end
            					if (Elemento == 17) then 
            						NomeGolpe = "Corkscrew Crash"
            						end
            					if (Elemento == 18) then 
            						NomeGolpe = "Twinkle Tackle"
            						end
            					local Tipo1 = tonumber(self.boxDetalhesDoItem.node.campoElem1) or 19;
            					local Tipo2 = tonumber(self.boxDetalhesDoItem.node.campoElem2) or 19;
            					local Poder = tonumber(self.boxDetalhesDoItem.node.danoZ9) or 0 
            					if (Elemento ~= 19) then
            						if (Elemento == Tipo1 or Elemento == Tipo2) then
            							DanSTAB = math.ceil(Poder/2);
            							end
            						end
            					local DanBon = tonumber(self.boxDetalhesDoItem.node.BonDMGP9) or 0 
            					local MCRIT = tonumber(self.boxDetalhesDoItem.node.MCRIT9) or 10;
            					local EDCCRIT = tonumber(self.boxDetalhesDoItem.node.edcCRIT) or 1;
            					local CRITOT = MCRIT + EDCCRIT -1;
            					local ACC = math.random(1,10)
            					local DANFINAL = math.ceil(ACC/2) + Poder + DanSTAB + DAN_ATT + DanBon
            					if (ACC >= CRITOT) then
            						DANFINAL = math.floor(DANFINAL*1.5)
            						MSG_Crit = "; [§K9](Crítico)[§K14] "
            						end
            					local MSG_DANO = "; [§B]Dano:[§B] " .. DANFINAL .. ""
            					if (CLASSE == 3) then
            						MSG_DANO = "";
            						end
            					mesa.activeChat:enviarMensagem("[§B]Dado:[§B]" .. ACC .. MSG_ACC .. MSG_Crit .. MSG_DANO .. "; [§B]" .. NomeGolpe .. "[§B] usado por " .. NomeUser)
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
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
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
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
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPokemon3()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPokemon3();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPokemon3 = {
    newEditor = newfrmPokemon3, 
    new = newfrmPokemon3, 
    name = "frmPokemon3", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPokemon3 = _frmPokemon3;
Firecast.registrarForm(_frmPokemon3);

return _frmPokemon3;
