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
    obj.layout1:setHeight(760);
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

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(70);
    obj.label1:setHeight(25);
    obj.label1:setText("Golpe");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(75);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(160);
    obj.edit1:setHeight(25);
    obj.edit1:setField("golpe1");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(80);
    obj.label2:setHeight(25);
    obj.label2:setText("Descritores");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(75);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(160);
    obj.edit2:setHeight(25);
    obj.edit2:setField("Descritores1");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(5);
    obj.label3:setTop(55);
    obj.label3:setWidth(70);
    obj.label3:setHeight(25);
    obj.label3:setText("Alcance");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(75);
    obj.edit3:setTop(55);
    obj.edit3:setWidth(160);
    obj.edit3:setHeight(25);
    obj.edit3:setField("alcance1");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(240);
    obj.label4:setTop(6);
    obj.label4:setWidth(50);
    obj.label4:setHeight(25);
    obj.label4:setText("Tipo");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(282);
    obj.edit4:setTop(6);
    obj.edit4:setWidth(82);
    obj.edit4:setHeight(25);
    obj.edit4:setField("tipo1");
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(240);
    obj.label5:setTop(31);
    obj.label5:setWidth(50);
    obj.label5:setHeight(25);
    obj.label5:setText("Classe");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setName("label5");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setLeft(282);
    obj.comboBox1:setTop(31);
    obj.comboBox1:setWidth(82);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("classe1");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox1:setValues({'1', '2', '3'});
    obj.comboBox1:setName("comboBox1");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(240);
    obj.label6:setTop(55);
    obj.label6:setWidth(50);
    obj.label6:setHeight(25);
    obj.label6:setText("Freq.");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(282);
    obj.edit5:setTop(55);
    obj.edit5:setWidth(82);
    obj.edit5:setHeight(25);
    obj.edit5:setField("frequencia1");
    obj.edit5:setName("edit5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(370);
    obj.label7:setTop(6);
    obj.label7:setWidth(70);
    obj.label7:setHeight(25);
    obj.label7:setText("Acurácia");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setName("label7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(425);
    obj.edit6:setTop(6);
    obj.edit6:setWidth(53);
    obj.edit6:setHeight(25);
    obj.edit6:setField("Acc1");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(370);
    obj.label8:setTop(31);
    obj.label8:setWidth(70);
    obj.label8:setHeight(25);
    obj.label8:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setName("label8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(425);
    obj.edit7:setTop(31);
    obj.edit7:setWidth(53);
    obj.edit7:setHeight(25);
    obj.edit7:setField("ataque1");
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(370);
    obj.label9:setTop(55);
    obj.label9:setWidth(70);
    obj.label9:setHeight(25);
    obj.label9:setText("D. Base");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setName("label9");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(425);
    obj.edit8:setTop(55);
    obj.edit8:setWidth(53);
    obj.edit8:setHeight(25);
    obj.edit8:setField("dano1");
    obj.edit8:setName("edit8");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setLeft(488);
    obj.button1:setTop(6);
    obj.button1:setWidth(82);
    obj.button1:setText("Acerto");
    obj.button1:setFontSize(11);
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(488);
    obj.button2:setTop(31);
    obj.button2:setWidth(82);
    obj.button2:setText("Dano");
    obj.button2:setFontSize(11);
    lfm_setPropAsString(obj.button2, "fontStyle",  "bold");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(488);
    obj.button3:setTop(55);
    obj.button3:setWidth(82);
    obj.button3:setText("Crítico");
    obj.button3:setFontSize(11);
    lfm_setPropAsString(obj.button3, "fontStyle",  "bold");
    obj.button3:setName("button3");

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
    obj.label10:setText("Aptidão");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setName("label10");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout2);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(940);
    obj.edit9:setTop(5);
    obj.edit9:setWidth(120);
    obj.edit9:setHeight(25);
    obj.edit9:setField("tipoContest1");
    obj.edit9:setName("edit9");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setLeft(875);
    obj.label11:setTop(30);
    obj.label11:setWidth(80);
    obj.label11:setHeight(25);
    obj.label11:setText("Concursos");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setName("label11");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(940);
    obj.edit10:setTop(30);
    obj.edit10:setWidth(120);
    obj.edit10:setHeight(25);
    obj.edit10:setField("efeitoContest1");
    obj.edit10:setName("edit10");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setLeft(875);
    obj.label12:setTop(55);
    obj.label12:setWidth(80);
    obj.label12:setHeight(25);
    obj.label12:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setName("label12");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout2);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(940);
    obj.edit11:setTop(55);
    obj.edit11:setWidth(120);
    obj.edit11:setHeight(25);
    obj.edit11:setField("BDano1");
    obj.edit11:setName("edit11");

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

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout3);
    obj.label13:setLeft(5);
    obj.label13:setTop(5);
    obj.label13:setWidth(70);
    obj.label13:setHeight(25);
    obj.label13:setText("Golpe");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setName("label13");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout3);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(75);
    obj.edit12:setTop(5);
    obj.edit12:setWidth(160);
    obj.edit12:setHeight(25);
    obj.edit12:setField("golpe2");
    obj.edit12:setName("edit12");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout3);
    obj.label14:setLeft(5);
    obj.label14:setTop(30);
    obj.label14:setWidth(80);
    obj.label14:setHeight(25);
    obj.label14:setText("Descritores");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setName("label14");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout3);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(75);
    obj.edit13:setTop(30);
    obj.edit13:setWidth(160);
    obj.edit13:setHeight(25);
    obj.edit13:setField("Descritores2");
    obj.edit13:setName("edit13");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout3);
    obj.label15:setLeft(5);
    obj.label15:setTop(55);
    obj.label15:setWidth(70);
    obj.label15:setHeight(25);
    obj.label15:setText("Alcance");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setName("label15");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout3);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(75);
    obj.edit14:setTop(55);
    obj.edit14:setWidth(160);
    obj.edit14:setHeight(25);
    obj.edit14:setField("alcance2");
    obj.edit14:setName("edit14");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout3);
    obj.label16:setLeft(240);
    obj.label16:setTop(6);
    obj.label16:setWidth(50);
    obj.label16:setHeight(25);
    obj.label16:setText("Tipo");
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");
    obj.label16:setName("label16");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout3);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(282);
    obj.edit15:setTop(6);
    obj.edit15:setWidth(82);
    obj.edit15:setHeight(25);
    obj.edit15:setField("tipo2");
    obj.edit15:setName("edit15");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout3);
    obj.label17:setLeft(240);
    obj.label17:setTop(31);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setText("Classe");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setName("label17");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout3);
    obj.comboBox2:setLeft(282);
    obj.comboBox2:setTop(31);
    obj.comboBox2:setWidth(82);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("classe2");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox2:setValues({'1', '2', '3'});
    obj.comboBox2:setName("comboBox2");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout3);
    obj.label18:setLeft(240);
    obj.label18:setTop(55);
    obj.label18:setWidth(50);
    obj.label18:setHeight(25);
    obj.label18:setText("Freq.");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setName("label18");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout3);
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(282);
    obj.edit16:setTop(55);
    obj.edit16:setWidth(82);
    obj.edit16:setHeight(25);
    obj.edit16:setField("frequencia2");
    obj.edit16:setName("edit16");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setLeft(370);
    obj.label19:setTop(6);
    obj.label19:setWidth(70);
    obj.label19:setHeight(25);
    obj.label19:setText("Acurácia");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setName("label19");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout3);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(425);
    obj.edit17:setTop(6);
    obj.edit17:setWidth(53);
    obj.edit17:setHeight(25);
    obj.edit17:setField("Acc2");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setLeft(370);
    obj.label20:setTop(31);
    obj.label20:setWidth(70);
    obj.label20:setHeight(25);
    obj.label20:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setName("label20");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout3);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(425);
    obj.edit18:setTop(31);
    obj.edit18:setWidth(53);
    obj.edit18:setHeight(25);
    obj.edit18:setField("ataque2");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout3);
    obj.label21:setLeft(370);
    obj.label21:setTop(55);
    obj.label21:setWidth(70);
    obj.label21:setHeight(25);
    obj.label21:setText("D. Base");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setName("label21");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout3);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(425);
    obj.edit19:setTop(55);
    obj.edit19:setWidth(53);
    obj.edit19:setHeight(25);
    obj.edit19:setField("dano2");
    obj.edit19:setName("edit19");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout3);
    obj.button4:setLeft(488);
    obj.button4:setTop(6);
    obj.button4:setWidth(82);
    obj.button4:setText("Acerto");
    obj.button4:setFontSize(11);
    lfm_setPropAsString(obj.button4, "fontStyle",  "bold");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout3);
    obj.button5:setLeft(488);
    obj.button5:setTop(31);
    obj.button5:setWidth(82);
    obj.button5:setText("Dano");
    obj.button5:setFontSize(11);
    lfm_setPropAsString(obj.button5, "fontStyle",  "bold");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout3);
    obj.button6:setLeft(488);
    obj.button6:setTop(55);
    obj.button6:setWidth(82);
    obj.button6:setText("Crítico");
    obj.button6:setFontSize(11);
    lfm_setPropAsString(obj.button6, "fontStyle",  "bold");
    obj.button6:setName("button6");

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
    obj.label22:setText("Aptidão");
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");
    obj.label22:setName("label22");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout3);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(940);
    obj.edit20:setTop(5);
    obj.edit20:setWidth(120);
    obj.edit20:setHeight(25);
    obj.edit20:setField("tipoContest2");
    obj.edit20:setName("edit20");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout3);
    obj.label23:setLeft(875);
    obj.label23:setTop(30);
    obj.label23:setWidth(80);
    obj.label23:setHeight(25);
    obj.label23:setText("Concursos");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setName("label23");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout3);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(940);
    obj.edit21:setTop(30);
    obj.edit21:setWidth(120);
    obj.edit21:setHeight(25);
    obj.edit21:setField("efeitoContest2");
    obj.edit21:setName("edit21");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout3);
    obj.label24:setLeft(875);
    obj.label24:setTop(55);
    obj.label24:setWidth(80);
    obj.label24:setHeight(25);
    obj.label24:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setName("label24");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout3);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(940);
    obj.edit22:setTop(55);
    obj.edit22:setWidth(120);
    obj.edit22:setHeight(25);
    obj.edit22:setField("BDano2");
    obj.edit22:setName("edit22");

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

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout4);
    obj.label25:setLeft(5);
    obj.label25:setTop(5);
    obj.label25:setWidth(70);
    obj.label25:setHeight(25);
    obj.label25:setText("Golpe");
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setName("label25");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout4);
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(75);
    obj.edit23:setTop(5);
    obj.edit23:setWidth(160);
    obj.edit23:setHeight(25);
    obj.edit23:setField("golpe3");
    obj.edit23:setName("edit23");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout4);
    obj.label26:setLeft(5);
    obj.label26:setTop(30);
    obj.label26:setWidth(80);
    obj.label26:setHeight(25);
    obj.label26:setText("Descritores");
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");
    obj.label26:setName("label26");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout4);
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(75);
    obj.edit24:setTop(30);
    obj.edit24:setWidth(160);
    obj.edit24:setHeight(25);
    obj.edit24:setField("Descritores3");
    obj.edit24:setName("edit24");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout4);
    obj.label27:setLeft(5);
    obj.label27:setTop(55);
    obj.label27:setWidth(70);
    obj.label27:setHeight(25);
    obj.label27:setText("Alcance");
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setName("label27");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout4);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(75);
    obj.edit25:setTop(55);
    obj.edit25:setWidth(160);
    obj.edit25:setHeight(25);
    obj.edit25:setField("alcance3");
    obj.edit25:setName("edit25");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout4);
    obj.label28:setLeft(240);
    obj.label28:setTop(6);
    obj.label28:setWidth(50);
    obj.label28:setHeight(25);
    obj.label28:setText("Tipo");
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setName("label28");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout4);
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(282);
    obj.edit26:setTop(6);
    obj.edit26:setWidth(82);
    obj.edit26:setHeight(25);
    obj.edit26:setField("tipo3");
    obj.edit26:setName("edit26");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout4);
    obj.label29:setLeft(240);
    obj.label29:setTop(31);
    obj.label29:setWidth(50);
    obj.label29:setHeight(25);
    obj.label29:setText("Classe");
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setName("label29");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout4);
    obj.comboBox3:setLeft(282);
    obj.comboBox3:setTop(31);
    obj.comboBox3:setWidth(82);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("classe3");
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox3:setValues({'1', '2', '3'});
    obj.comboBox3:setName("comboBox3");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout4);
    obj.label30:setLeft(240);
    obj.label30:setTop(55);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setText("Freq.");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setName("label30");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout4);
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(282);
    obj.edit27:setTop(55);
    obj.edit27:setWidth(82);
    obj.edit27:setHeight(25);
    obj.edit27:setField("frequencia3");
    obj.edit27:setName("edit27");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout4);
    obj.label31:setLeft(370);
    obj.label31:setTop(6);
    obj.label31:setWidth(70);
    obj.label31:setHeight(25);
    obj.label31:setText("Acurácia");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setName("label31");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout4);
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(425);
    obj.edit28:setTop(6);
    obj.edit28:setWidth(53);
    obj.edit28:setHeight(25);
    obj.edit28:setField("Acc3");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout4);
    obj.label32:setLeft(370);
    obj.label32:setTop(31);
    obj.label32:setWidth(70);
    obj.label32:setHeight(25);
    obj.label32:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setName("label32");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout4);
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(425);
    obj.edit29:setTop(31);
    obj.edit29:setWidth(53);
    obj.edit29:setHeight(25);
    obj.edit29:setField("ataque3");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout4);
    obj.label33:setLeft(370);
    obj.label33:setTop(55);
    obj.label33:setWidth(70);
    obj.label33:setHeight(25);
    obj.label33:setText("D. Base");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setName("label33");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout4);
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(425);
    obj.edit30:setTop(55);
    obj.edit30:setWidth(53);
    obj.edit30:setHeight(25);
    obj.edit30:setField("dano3");
    obj.edit30:setName("edit30");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout4);
    obj.button7:setLeft(488);
    obj.button7:setTop(6);
    obj.button7:setWidth(82);
    obj.button7:setText("Acerto");
    obj.button7:setFontSize(11);
    lfm_setPropAsString(obj.button7, "fontStyle",  "bold");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout4);
    obj.button8:setLeft(488);
    obj.button8:setTop(31);
    obj.button8:setWidth(82);
    obj.button8:setText("Dano");
    obj.button8:setFontSize(11);
    lfm_setPropAsString(obj.button8, "fontStyle",  "bold");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout4);
    obj.button9:setLeft(488);
    obj.button9:setTop(55);
    obj.button9:setWidth(82);
    obj.button9:setText("Crítico");
    obj.button9:setFontSize(11);
    lfm_setPropAsString(obj.button9, "fontStyle",  "bold");
    obj.button9:setName("button9");

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
    obj.label34:setText("Aptidão");
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setName("label34");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout4);
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(940);
    obj.edit31:setTop(5);
    obj.edit31:setWidth(120);
    obj.edit31:setHeight(25);
    obj.edit31:setField("tipoContest3");
    obj.edit31:setName("edit31");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout4);
    obj.label35:setLeft(875);
    obj.label35:setTop(30);
    obj.label35:setWidth(80);
    obj.label35:setHeight(25);
    obj.label35:setText("Concursos");
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");
    obj.label35:setName("label35");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout4);
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(940);
    obj.edit32:setTop(30);
    obj.edit32:setWidth(120);
    obj.edit32:setHeight(25);
    obj.edit32:setField("efeitoContest3");
    obj.edit32:setName("edit32");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout4);
    obj.label36:setLeft(875);
    obj.label36:setTop(55);
    obj.label36:setWidth(80);
    obj.label36:setHeight(25);
    obj.label36:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");
    obj.label36:setName("label36");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout4);
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(940);
    obj.edit33:setTop(55);
    obj.edit33:setWidth(120);
    obj.edit33:setHeight(25);
    obj.edit33:setField("BDano3");
    obj.edit33:setName("edit33");

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

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout5);
    obj.label37:setLeft(5);
    obj.label37:setTop(5);
    obj.label37:setWidth(70);
    obj.label37:setHeight(25);
    obj.label37:setText("Golpe");
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setName("label37");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout5);
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(75);
    obj.edit34:setTop(5);
    obj.edit34:setWidth(160);
    obj.edit34:setHeight(25);
    obj.edit34:setField("golpe4");
    obj.edit34:setName("edit34");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout5);
    obj.label38:setLeft(5);
    obj.label38:setTop(30);
    obj.label38:setWidth(80);
    obj.label38:setHeight(25);
    obj.label38:setText("Descritores");
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setName("label38");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout5);
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(75);
    obj.edit35:setTop(30);
    obj.edit35:setWidth(160);
    obj.edit35:setHeight(25);
    obj.edit35:setField("Descritores4");
    obj.edit35:setName("edit35");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout5);
    obj.label39:setLeft(5);
    obj.label39:setTop(55);
    obj.label39:setWidth(70);
    obj.label39:setHeight(25);
    obj.label39:setText("Alcance");
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setName("label39");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout5);
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(75);
    obj.edit36:setTop(55);
    obj.edit36:setWidth(160);
    obj.edit36:setHeight(25);
    obj.edit36:setField("alcance4");
    obj.edit36:setName("edit36");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout5);
    obj.label40:setLeft(240);
    obj.label40:setTop(6);
    obj.label40:setWidth(50);
    obj.label40:setHeight(25);
    obj.label40:setText("Tipo");
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setName("label40");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout5);
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(282);
    obj.edit37:setTop(6);
    obj.edit37:setWidth(82);
    obj.edit37:setHeight(25);
    obj.edit37:setField("tipo4");
    obj.edit37:setName("edit37");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout5);
    obj.label41:setLeft(240);
    obj.label41:setTop(31);
    obj.label41:setWidth(50);
    obj.label41:setHeight(25);
    obj.label41:setText("Classe");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setName("label41");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout5);
    obj.comboBox4:setLeft(282);
    obj.comboBox4:setTop(31);
    obj.comboBox4:setWidth(82);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("classe4");
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox4:setValues({'1', '2', '3'});
    obj.comboBox4:setName("comboBox4");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout5);
    obj.label42:setLeft(240);
    obj.label42:setTop(55);
    obj.label42:setWidth(50);
    obj.label42:setHeight(25);
    obj.label42:setText("Freq.");
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");
    obj.label42:setName("label42");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout5);
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(282);
    obj.edit38:setTop(55);
    obj.edit38:setWidth(82);
    obj.edit38:setHeight(25);
    obj.edit38:setField("frequencia4");
    obj.edit38:setName("edit38");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout5);
    obj.label43:setLeft(370);
    obj.label43:setTop(6);
    obj.label43:setWidth(70);
    obj.label43:setHeight(25);
    obj.label43:setText("Acurácia");
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setName("label43");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout5);
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(425);
    obj.edit39:setTop(6);
    obj.edit39:setWidth(53);
    obj.edit39:setHeight(25);
    obj.edit39:setField("Acc4");
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout5);
    obj.label44:setLeft(370);
    obj.label44:setTop(31);
    obj.label44:setWidth(70);
    obj.label44:setHeight(25);
    obj.label44:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setName("label44");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout5);
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(425);
    obj.edit40:setTop(31);
    obj.edit40:setWidth(53);
    obj.edit40:setHeight(25);
    obj.edit40:setField("ataque4");
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout5);
    obj.label45:setLeft(370);
    obj.label45:setTop(55);
    obj.label45:setWidth(70);
    obj.label45:setHeight(25);
    obj.label45:setText("D. Base");
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setName("label45");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout5);
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(425);
    obj.edit41:setTop(55);
    obj.edit41:setWidth(53);
    obj.edit41:setHeight(25);
    obj.edit41:setField("dano4");
    obj.edit41:setName("edit41");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout5);
    obj.button10:setLeft(488);
    obj.button10:setTop(6);
    obj.button10:setWidth(82);
    obj.button10:setText("Acerto");
    obj.button10:setFontSize(11);
    lfm_setPropAsString(obj.button10, "fontStyle",  "bold");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout5);
    obj.button11:setLeft(488);
    obj.button11:setTop(31);
    obj.button11:setWidth(82);
    obj.button11:setText("Dano");
    obj.button11:setFontSize(11);
    lfm_setPropAsString(obj.button11, "fontStyle",  "bold");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout5);
    obj.button12:setLeft(488);
    obj.button12:setTop(55);
    obj.button12:setWidth(82);
    obj.button12:setText("Crítico");
    obj.button12:setFontSize(11);
    lfm_setPropAsString(obj.button12, "fontStyle",  "bold");
    obj.button12:setName("button12");

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
    obj.label46:setText("Aptidão");
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");
    obj.label46:setName("label46");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout5);
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(940);
    obj.edit42:setTop(5);
    obj.edit42:setWidth(120);
    obj.edit42:setHeight(25);
    obj.edit42:setField("tipoContest4");
    obj.edit42:setName("edit42");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout5);
    obj.label47:setLeft(875);
    obj.label47:setTop(30);
    obj.label47:setWidth(80);
    obj.label47:setHeight(25);
    obj.label47:setText("Concursos");
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setName("label47");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout5);
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(940);
    obj.edit43:setTop(30);
    obj.edit43:setWidth(120);
    obj.edit43:setHeight(25);
    obj.edit43:setField("efeitoContest4");
    obj.edit43:setName("edit43");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout5);
    obj.label48:setLeft(875);
    obj.label48:setTop(55);
    obj.label48:setWidth(80);
    obj.label48:setHeight(25);
    obj.label48:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");
    obj.label48:setName("label48");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout5);
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(940);
    obj.edit44:setTop(55);
    obj.edit44:setWidth(120);
    obj.edit44:setHeight(25);
    obj.edit44:setField("BDano4");
    obj.edit44:setName("edit44");

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

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout6);
    obj.label49:setLeft(5);
    obj.label49:setTop(5);
    obj.label49:setWidth(70);
    obj.label49:setHeight(25);
    obj.label49:setText("Golpe");
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");
    obj.label49:setName("label49");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout6);
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(75);
    obj.edit45:setTop(5);
    obj.edit45:setWidth(160);
    obj.edit45:setHeight(25);
    obj.edit45:setField("golpe5");
    obj.edit45:setName("edit45");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout6);
    obj.label50:setLeft(5);
    obj.label50:setTop(30);
    obj.label50:setWidth(80);
    obj.label50:setHeight(25);
    obj.label50:setText("Descritores");
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setName("label50");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout6);
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(75);
    obj.edit46:setTop(30);
    obj.edit46:setWidth(160);
    obj.edit46:setHeight(25);
    obj.edit46:setField("Descritores5");
    obj.edit46:setName("edit46");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout6);
    obj.label51:setLeft(5);
    obj.label51:setTop(55);
    obj.label51:setWidth(70);
    obj.label51:setHeight(25);
    obj.label51:setText("Alcance");
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setName("label51");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout6);
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(75);
    obj.edit47:setTop(55);
    obj.edit47:setWidth(160);
    obj.edit47:setHeight(25);
    obj.edit47:setField("alcance5");
    obj.edit47:setName("edit47");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout6);
    obj.label52:setLeft(240);
    obj.label52:setTop(6);
    obj.label52:setWidth(50);
    obj.label52:setHeight(25);
    obj.label52:setText("Tipo");
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setName("label52");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout6);
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(282);
    obj.edit48:setTop(6);
    obj.edit48:setWidth(82);
    obj.edit48:setHeight(25);
    obj.edit48:setField("tipo5");
    obj.edit48:setName("edit48");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout6);
    obj.label53:setLeft(240);
    obj.label53:setTop(31);
    obj.label53:setWidth(50);
    obj.label53:setHeight(25);
    obj.label53:setText("Classe");
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setName("label53");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout6);
    obj.comboBox5:setLeft(282);
    obj.comboBox5:setTop(31);
    obj.comboBox5:setWidth(82);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("classe5");
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox5:setValues({'1', '2', '3'});
    obj.comboBox5:setName("comboBox5");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout6);
    obj.label54:setLeft(240);
    obj.label54:setTop(55);
    obj.label54:setWidth(50);
    obj.label54:setHeight(25);
    obj.label54:setText("Freq.");
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");
    obj.label54:setName("label54");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout6);
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(282);
    obj.edit49:setTop(55);
    obj.edit49:setWidth(82);
    obj.edit49:setHeight(25);
    obj.edit49:setField("frequencia5");
    obj.edit49:setName("edit49");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout6);
    obj.label55:setLeft(370);
    obj.label55:setTop(6);
    obj.label55:setWidth(70);
    obj.label55:setHeight(25);
    obj.label55:setText("Acurácia");
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setName("label55");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout6);
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(425);
    obj.edit50:setTop(6);
    obj.edit50:setWidth(53);
    obj.edit50:setHeight(25);
    obj.edit50:setField("Acc5");
    obj.edit50:setType("number");
    obj.edit50:setName("edit50");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout6);
    obj.label56:setLeft(370);
    obj.label56:setTop(31);
    obj.label56:setWidth(70);
    obj.label56:setHeight(25);
    obj.label56:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");
    obj.label56:setName("label56");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout6);
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(425);
    obj.edit51:setTop(31);
    obj.edit51:setWidth(53);
    obj.edit51:setHeight(25);
    obj.edit51:setField("ataque5");
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout6);
    obj.label57:setLeft(370);
    obj.label57:setTop(55);
    obj.label57:setWidth(70);
    obj.label57:setHeight(25);
    obj.label57:setText("D. Base");
    lfm_setPropAsString(obj.label57, "fontStyle",  "bold");
    obj.label57:setName("label57");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout6);
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(425);
    obj.edit52:setTop(55);
    obj.edit52:setWidth(53);
    obj.edit52:setHeight(25);
    obj.edit52:setField("dano5");
    obj.edit52:setName("edit52");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout6);
    obj.button13:setLeft(488);
    obj.button13:setTop(6);
    obj.button13:setWidth(82);
    obj.button13:setText("Acerto");
    obj.button13:setFontSize(11);
    lfm_setPropAsString(obj.button13, "fontStyle",  "bold");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout6);
    obj.button14:setLeft(488);
    obj.button14:setTop(31);
    obj.button14:setWidth(82);
    obj.button14:setText("Dano");
    obj.button14:setFontSize(11);
    lfm_setPropAsString(obj.button14, "fontStyle",  "bold");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout6);
    obj.button15:setLeft(488);
    obj.button15:setTop(55);
    obj.button15:setWidth(82);
    obj.button15:setText("Crítico");
    obj.button15:setFontSize(11);
    lfm_setPropAsString(obj.button15, "fontStyle",  "bold");
    obj.button15:setName("button15");

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
    obj.label58:setText("Aptidão");
    lfm_setPropAsString(obj.label58, "fontStyle",  "bold");
    obj.label58:setName("label58");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout6);
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(940);
    obj.edit53:setTop(5);
    obj.edit53:setWidth(120);
    obj.edit53:setHeight(25);
    obj.edit53:setField("tipoContest5");
    obj.edit53:setName("edit53");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout6);
    obj.label59:setLeft(875);
    obj.label59:setTop(30);
    obj.label59:setWidth(80);
    obj.label59:setHeight(25);
    obj.label59:setText("Concursos");
    lfm_setPropAsString(obj.label59, "fontStyle",  "bold");
    obj.label59:setName("label59");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout6);
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(940);
    obj.edit54:setTop(30);
    obj.edit54:setWidth(120);
    obj.edit54:setHeight(25);
    obj.edit54:setField("efeitoContest5");
    obj.edit54:setName("edit54");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout6);
    obj.label60:setLeft(875);
    obj.label60:setTop(55);
    obj.label60:setWidth(80);
    obj.label60:setHeight(25);
    obj.label60:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");
    obj.label60:setName("label60");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout6);
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(940);
    obj.edit55:setTop(55);
    obj.edit55:setWidth(120);
    obj.edit55:setHeight(25);
    obj.edit55:setField("BDano5");
    obj.edit55:setName("edit55");

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

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout7);
    obj.label61:setLeft(5);
    obj.label61:setTop(5);
    obj.label61:setWidth(70);
    obj.label61:setHeight(25);
    obj.label61:setText("Golpe");
    lfm_setPropAsString(obj.label61, "fontStyle",  "bold");
    obj.label61:setName("label61");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout7);
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(75);
    obj.edit56:setTop(5);
    obj.edit56:setWidth(160);
    obj.edit56:setHeight(25);
    obj.edit56:setField("golpe6");
    obj.edit56:setName("edit56");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout7);
    obj.label62:setLeft(5);
    obj.label62:setTop(30);
    obj.label62:setWidth(80);
    obj.label62:setHeight(25);
    obj.label62:setText("Descritores");
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");
    obj.label62:setName("label62");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout7);
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(75);
    obj.edit57:setTop(30);
    obj.edit57:setWidth(160);
    obj.edit57:setHeight(25);
    obj.edit57:setField("Descritores6");
    obj.edit57:setName("edit57");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout7);
    obj.label63:setLeft(5);
    obj.label63:setTop(55);
    obj.label63:setWidth(70);
    obj.label63:setHeight(25);
    obj.label63:setText("Alcance");
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");
    obj.label63:setName("label63");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout7);
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(75);
    obj.edit58:setTop(55);
    obj.edit58:setWidth(160);
    obj.edit58:setHeight(25);
    obj.edit58:setField("alcance6");
    obj.edit58:setName("edit58");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout7);
    obj.label64:setLeft(240);
    obj.label64:setTop(6);
    obj.label64:setWidth(50);
    obj.label64:setHeight(25);
    obj.label64:setText("Tipo");
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");
    obj.label64:setName("label64");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout7);
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(282);
    obj.edit59:setTop(6);
    obj.edit59:setWidth(82);
    obj.edit59:setHeight(25);
    obj.edit59:setField("tipo6");
    obj.edit59:setName("edit59");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout7);
    obj.label65:setLeft(240);
    obj.label65:setTop(31);
    obj.label65:setWidth(50);
    obj.label65:setHeight(25);
    obj.label65:setText("Classe");
    lfm_setPropAsString(obj.label65, "fontStyle",  "bold");
    obj.label65:setName("label65");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout7);
    obj.comboBox6:setLeft(282);
    obj.comboBox6:setTop(31);
    obj.comboBox6:setWidth(82);
    obj.comboBox6:setHeight(25);
    obj.comboBox6:setField("classe6");
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox6:setValues({'1', '2', '3'});
    obj.comboBox6:setName("comboBox6");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout7);
    obj.label66:setLeft(240);
    obj.label66:setTop(55);
    obj.label66:setWidth(50);
    obj.label66:setHeight(25);
    obj.label66:setText("Freq.");
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");
    obj.label66:setName("label66");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout7);
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(282);
    obj.edit60:setTop(55);
    obj.edit60:setWidth(82);
    obj.edit60:setHeight(25);
    obj.edit60:setField("frequencia6");
    obj.edit60:setName("edit60");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout7);
    obj.label67:setLeft(370);
    obj.label67:setTop(6);
    obj.label67:setWidth(70);
    obj.label67:setHeight(25);
    obj.label67:setText("Acurácia");
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setName("label67");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout7);
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(425);
    obj.edit61:setTop(6);
    obj.edit61:setWidth(53);
    obj.edit61:setHeight(25);
    obj.edit61:setField("Acc6");
    obj.edit61:setType("number");
    obj.edit61:setName("edit61");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout7);
    obj.label68:setLeft(370);
    obj.label68:setTop(31);
    obj.label68:setWidth(70);
    obj.label68:setHeight(25);
    obj.label68:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");
    obj.label68:setName("label68");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout7);
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(425);
    obj.edit62:setTop(31);
    obj.edit62:setWidth(53);
    obj.edit62:setHeight(25);
    obj.edit62:setField("ataque6");
    obj.edit62:setType("number");
    obj.edit62:setName("edit62");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout7);
    obj.label69:setLeft(370);
    obj.label69:setTop(55);
    obj.label69:setWidth(70);
    obj.label69:setHeight(25);
    obj.label69:setText("D. Base");
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setName("label69");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout7);
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(425);
    obj.edit63:setTop(55);
    obj.edit63:setWidth(53);
    obj.edit63:setHeight(25);
    obj.edit63:setField("dano6");
    obj.edit63:setName("edit63");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout7);
    obj.button16:setLeft(488);
    obj.button16:setTop(6);
    obj.button16:setWidth(82);
    obj.button16:setText("Acerto");
    obj.button16:setFontSize(11);
    lfm_setPropAsString(obj.button16, "fontStyle",  "bold");
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout7);
    obj.button17:setLeft(488);
    obj.button17:setTop(31);
    obj.button17:setWidth(82);
    obj.button17:setText("Dano");
    obj.button17:setFontSize(11);
    lfm_setPropAsString(obj.button17, "fontStyle",  "bold");
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout7);
    obj.button18:setLeft(488);
    obj.button18:setTop(55);
    obj.button18:setWidth(82);
    obj.button18:setText("Crítico");
    obj.button18:setFontSize(11);
    lfm_setPropAsString(obj.button18, "fontStyle",  "bold");
    obj.button18:setName("button18");

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
    obj.label70:setText("Aptidão");
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");
    obj.label70:setName("label70");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout7);
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(940);
    obj.edit64:setTop(5);
    obj.edit64:setWidth(120);
    obj.edit64:setHeight(25);
    obj.edit64:setField("tipoContest6");
    obj.edit64:setName("edit64");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout7);
    obj.label71:setLeft(875);
    obj.label71:setTop(30);
    obj.label71:setWidth(80);
    obj.label71:setHeight(25);
    obj.label71:setText("Concursos");
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");
    obj.label71:setName("label71");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout7);
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(940);
    obj.edit65:setTop(30);
    obj.edit65:setWidth(120);
    obj.edit65:setHeight(25);
    obj.edit65:setField("efeitoContest6");
    obj.edit65:setName("edit65");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout7);
    obj.label72:setLeft(875);
    obj.label72:setTop(55);
    obj.label72:setWidth(80);
    obj.label72:setHeight(25);
    obj.label72:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setName("label72");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout7);
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(940);
    obj.edit66:setTop(55);
    obj.edit66:setWidth(120);
    obj.edit66:setHeight(25);
    obj.edit66:setField("BDano6");
    obj.edit66:setName("edit66");

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

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout8);
    obj.label73:setLeft(5);
    obj.label73:setTop(5);
    obj.label73:setWidth(70);
    obj.label73:setHeight(25);
    obj.label73:setText("Golpe");
    lfm_setPropAsString(obj.label73, "fontStyle",  "bold");
    obj.label73:setName("label73");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout8);
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(75);
    obj.edit67:setTop(5);
    obj.edit67:setWidth(160);
    obj.edit67:setHeight(25);
    obj.edit67:setField("golpe7");
    obj.edit67:setName("edit67");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout8);
    obj.label74:setLeft(5);
    obj.label74:setTop(30);
    obj.label74:setWidth(80);
    obj.label74:setHeight(25);
    obj.label74:setText("Descritores");
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");
    obj.label74:setName("label74");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout8);
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(75);
    obj.edit68:setTop(30);
    obj.edit68:setWidth(160);
    obj.edit68:setHeight(25);
    obj.edit68:setField("Descritores7");
    obj.edit68:setName("edit68");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout8);
    obj.label75:setLeft(5);
    obj.label75:setTop(55);
    obj.label75:setWidth(70);
    obj.label75:setHeight(25);
    obj.label75:setText("Alcance");
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold");
    obj.label75:setName("label75");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout8);
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(75);
    obj.edit69:setTop(55);
    obj.edit69:setWidth(160);
    obj.edit69:setHeight(25);
    obj.edit69:setField("alcance7");
    obj.edit69:setName("edit69");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout8);
    obj.label76:setLeft(240);
    obj.label76:setTop(6);
    obj.label76:setWidth(50);
    obj.label76:setHeight(25);
    obj.label76:setText("Tipo");
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setName("label76");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout8);
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(282);
    obj.edit70:setTop(6);
    obj.edit70:setWidth(82);
    obj.edit70:setHeight(25);
    obj.edit70:setField("tipo7");
    obj.edit70:setName("edit70");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout8);
    obj.label77:setLeft(240);
    obj.label77:setTop(31);
    obj.label77:setWidth(50);
    obj.label77:setHeight(25);
    obj.label77:setText("Classe");
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");
    obj.label77:setName("label77");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout8);
    obj.comboBox7:setLeft(282);
    obj.comboBox7:setTop(31);
    obj.comboBox7:setWidth(82);
    obj.comboBox7:setHeight(25);
    obj.comboBox7:setField("classe7");
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox7:setValues({'1', '2', '3'});
    obj.comboBox7:setName("comboBox7");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout8);
    obj.label78:setLeft(240);
    obj.label78:setTop(55);
    obj.label78:setWidth(50);
    obj.label78:setHeight(25);
    obj.label78:setText("Freq.");
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");
    obj.label78:setName("label78");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout8);
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(282);
    obj.edit71:setTop(55);
    obj.edit71:setWidth(82);
    obj.edit71:setHeight(25);
    obj.edit71:setField("frequencia7");
    obj.edit71:setName("edit71");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout8);
    obj.label79:setLeft(370);
    obj.label79:setTop(6);
    obj.label79:setWidth(70);
    obj.label79:setHeight(25);
    obj.label79:setText("Acurácia");
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");
    obj.label79:setName("label79");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout8);
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(425);
    obj.edit72:setTop(6);
    obj.edit72:setWidth(53);
    obj.edit72:setHeight(25);
    obj.edit72:setField("Acc7");
    obj.edit72:setType("number");
    obj.edit72:setName("edit72");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout8);
    obj.label80:setLeft(370);
    obj.label80:setTop(31);
    obj.label80:setWidth(70);
    obj.label80:setHeight(25);
    obj.label80:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setName("label80");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout8);
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(425);
    obj.edit73:setTop(31);
    obj.edit73:setWidth(53);
    obj.edit73:setHeight(25);
    obj.edit73:setField("ataque7");
    obj.edit73:setType("number");
    obj.edit73:setName("edit73");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout8);
    obj.label81:setLeft(370);
    obj.label81:setTop(55);
    obj.label81:setWidth(70);
    obj.label81:setHeight(25);
    obj.label81:setText("D. Base");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setName("label81");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout8);
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(425);
    obj.edit74:setTop(55);
    obj.edit74:setWidth(53);
    obj.edit74:setHeight(25);
    obj.edit74:setField("dano7");
    obj.edit74:setName("edit74");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout8);
    obj.button19:setLeft(488);
    obj.button19:setTop(6);
    obj.button19:setWidth(82);
    obj.button19:setText("Acerto");
    obj.button19:setFontSize(11);
    lfm_setPropAsString(obj.button19, "fontStyle",  "bold");
    obj.button19:setName("button19");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout8);
    obj.button20:setLeft(488);
    obj.button20:setTop(31);
    obj.button20:setWidth(82);
    obj.button20:setText("Dano");
    obj.button20:setFontSize(11);
    lfm_setPropAsString(obj.button20, "fontStyle",  "bold");
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout8);
    obj.button21:setLeft(488);
    obj.button21:setTop(55);
    obj.button21:setWidth(82);
    obj.button21:setText("Crítico");
    obj.button21:setFontSize(11);
    lfm_setPropAsString(obj.button21, "fontStyle",  "bold");
    obj.button21:setName("button21");

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
    obj.label82:setText("Aptidão");
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");
    obj.label82:setName("label82");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout8);
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(940);
    obj.edit75:setTop(5);
    obj.edit75:setWidth(120);
    obj.edit75:setHeight(25);
    obj.edit75:setField("tipoContest7");
    obj.edit75:setName("edit75");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout8);
    obj.label83:setLeft(875);
    obj.label83:setTop(30);
    obj.label83:setWidth(80);
    obj.label83:setHeight(25);
    obj.label83:setText("Concursos");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setName("label83");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout8);
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(940);
    obj.edit76:setTop(30);
    obj.edit76:setWidth(120);
    obj.edit76:setHeight(25);
    obj.edit76:setField("efeitoContest7");
    obj.edit76:setName("edit76");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout8);
    obj.label84:setLeft(875);
    obj.label84:setTop(55);
    obj.label84:setWidth(80);
    obj.label84:setHeight(25);
    obj.label84:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label84, "fontStyle",  "bold");
    obj.label84:setName("label84");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout8);
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(940);
    obj.edit77:setTop(55);
    obj.edit77:setWidth(120);
    obj.edit77:setHeight(25);
    obj.edit77:setField("BDano7");
    obj.edit77:setName("edit77");

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

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout9);
    obj.label85:setLeft(5);
    obj.label85:setTop(5);
    obj.label85:setWidth(70);
    obj.label85:setHeight(25);
    obj.label85:setText("Golpe");
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");
    obj.label85:setName("label85");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout9);
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(75);
    obj.edit78:setTop(5);
    obj.edit78:setWidth(160);
    obj.edit78:setHeight(25);
    obj.edit78:setField("golpe8");
    obj.edit78:setName("edit78");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout9);
    obj.label86:setLeft(5);
    obj.label86:setTop(30);
    obj.label86:setWidth(80);
    obj.label86:setHeight(25);
    obj.label86:setText("Descritores");
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setName("label86");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout9);
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(75);
    obj.edit79:setTop(30);
    obj.edit79:setWidth(160);
    obj.edit79:setHeight(25);
    obj.edit79:setField("Descritores8");
    obj.edit79:setName("edit79");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout9);
    obj.label87:setLeft(5);
    obj.label87:setTop(55);
    obj.label87:setWidth(70);
    obj.label87:setHeight(25);
    obj.label87:setText("Alcance");
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");
    obj.label87:setName("label87");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout9);
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(75);
    obj.edit80:setTop(55);
    obj.edit80:setWidth(160);
    obj.edit80:setHeight(25);
    obj.edit80:setField("alcance8");
    obj.edit80:setName("edit80");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout9);
    obj.label88:setLeft(240);
    obj.label88:setTop(6);
    obj.label88:setWidth(50);
    obj.label88:setHeight(25);
    obj.label88:setText("Tipo");
    lfm_setPropAsString(obj.label88, "fontStyle",  "bold");
    obj.label88:setName("label88");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout9);
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(282);
    obj.edit81:setTop(6);
    obj.edit81:setWidth(82);
    obj.edit81:setHeight(25);
    obj.edit81:setField("tipo8");
    obj.edit81:setName("edit81");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout9);
    obj.label89:setLeft(240);
    obj.label89:setTop(31);
    obj.label89:setWidth(50);
    obj.label89:setHeight(25);
    obj.label89:setText("Classe");
    lfm_setPropAsString(obj.label89, "fontStyle",  "bold");
    obj.label89:setName("label89");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout9);
    obj.comboBox8:setLeft(282);
    obj.comboBox8:setTop(31);
    obj.comboBox8:setWidth(82);
    obj.comboBox8:setHeight(25);
    obj.comboBox8:setField("classe8");
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox8:setValues({'1', '2', '3'});
    obj.comboBox8:setName("comboBox8");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout9);
    obj.label90:setLeft(240);
    obj.label90:setTop(55);
    obj.label90:setWidth(50);
    obj.label90:setHeight(25);
    obj.label90:setText("Freq.");
    lfm_setPropAsString(obj.label90, "fontStyle",  "bold");
    obj.label90:setName("label90");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout9);
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(282);
    obj.edit82:setTop(55);
    obj.edit82:setWidth(82);
    obj.edit82:setHeight(25);
    obj.edit82:setField("frequencia8");
    obj.edit82:setName("edit82");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout9);
    obj.label91:setLeft(370);
    obj.label91:setTop(6);
    obj.label91:setWidth(70);
    obj.label91:setHeight(25);
    obj.label91:setText("Acurácia");
    lfm_setPropAsString(obj.label91, "fontStyle",  "bold");
    obj.label91:setName("label91");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout9);
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setLeft(425);
    obj.edit83:setTop(6);
    obj.edit83:setWidth(53);
    obj.edit83:setHeight(25);
    obj.edit83:setField("Acc8");
    obj.edit83:setType("number");
    obj.edit83:setName("edit83");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout9);
    obj.label92:setLeft(370);
    obj.label92:setTop(31);
    obj.label92:setWidth(70);
    obj.label92:setHeight(25);
    obj.label92:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label92, "fontStyle",  "bold");
    obj.label92:setName("label92");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout9);
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setLeft(425);
    obj.edit84:setTop(31);
    obj.edit84:setWidth(53);
    obj.edit84:setHeight(25);
    obj.edit84:setField("ataque8");
    obj.edit84:setType("number");
    obj.edit84:setName("edit84");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout9);
    obj.label93:setLeft(370);
    obj.label93:setTop(55);
    obj.label93:setWidth(70);
    obj.label93:setHeight(25);
    obj.label93:setText("D. Base");
    lfm_setPropAsString(obj.label93, "fontStyle",  "bold");
    obj.label93:setName("label93");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout9);
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setLeft(425);
    obj.edit85:setTop(55);
    obj.edit85:setWidth(53);
    obj.edit85:setHeight(25);
    obj.edit85:setField("dano8");
    obj.edit85:setName("edit85");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout9);
    obj.button22:setLeft(488);
    obj.button22:setTop(6);
    obj.button22:setWidth(82);
    obj.button22:setText("Acerto");
    obj.button22:setFontSize(11);
    lfm_setPropAsString(obj.button22, "fontStyle",  "bold");
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout9);
    obj.button23:setLeft(488);
    obj.button23:setTop(31);
    obj.button23:setWidth(82);
    obj.button23:setText("Dano");
    obj.button23:setFontSize(11);
    lfm_setPropAsString(obj.button23, "fontStyle",  "bold");
    obj.button23:setName("button23");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout9);
    obj.button24:setLeft(488);
    obj.button24:setTop(55);
    obj.button24:setWidth(82);
    obj.button24:setText("Crítico");
    obj.button24:setFontSize(11);
    lfm_setPropAsString(obj.button24, "fontStyle",  "bold");
    obj.button24:setName("button24");

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
    obj.label94:setText("Aptidão");
    lfm_setPropAsString(obj.label94, "fontStyle",  "bold");
    obj.label94:setName("label94");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout9);
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setLeft(940);
    obj.edit86:setTop(5);
    obj.edit86:setWidth(120);
    obj.edit86:setHeight(25);
    obj.edit86:setField("tipoContest8");
    obj.edit86:setName("edit86");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout9);
    obj.label95:setLeft(875);
    obj.label95:setTop(30);
    obj.label95:setWidth(80);
    obj.label95:setHeight(25);
    obj.label95:setText("Concursos");
    lfm_setPropAsString(obj.label95, "fontStyle",  "bold");
    obj.label95:setName("label95");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout9);
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setLeft(940);
    obj.edit87:setTop(30);
    obj.edit87:setWidth(120);
    obj.edit87:setHeight(25);
    obj.edit87:setField("efeitoContest8");
    obj.edit87:setName("edit87");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout9);
    obj.label96:setLeft(875);
    obj.label96:setTop(55);
    obj.label96:setWidth(80);
    obj.label96:setHeight(25);
    obj.label96:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label96, "fontStyle",  "bold");
    obj.label96:setName("label96");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout9);
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setLeft(940);
    obj.edit88:setTop(55);
    obj.edit88:setWidth(120);
    obj.edit88:setHeight(25);
    obj.edit88:setField("BDano8");
    obj.edit88:setName("edit88");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = sheet.ataque1 or 0;
            					local NomeGolpe = sheet.golpe1 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = sheet.Acc1 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe1 or "Golpe"
            					local NomeUser = sheet.baseName or "Pokémon"
            
            					local Attribute = tonumber(sheet.classe1) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            					
            					local dado = (sheet.dano1 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano1 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);		
            					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            					local NomeGolpe = sheet.golpe1 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Attribute = tonumber(sheet.classe1) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            
            					local dado = (sheet.dano1 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano1 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = sheet.ataque2 or 0;
            					local NomeGolpe = sheet.golpe2 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = sheet.Acc2 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe2 or "Golpe"
            					local NomeUser = sheet.baseName or "Pokémon"
            
            					local Attribute = tonumber(sheet.classe2) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            					
            					local dado = (sheet.dano2 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano2 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);		
            					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            					local NomeGolpe = sheet.golpe2 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Attribute = tonumber(sheet.classe2) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            
            					local dado = (sheet.dano2 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano2 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = sheet.ataque3 or 0;
            					local NomeGolpe = sheet.golpe3 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = sheet.Acc3 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe3 or "Golpe"
            					local NomeUser = sheet.baseName or "Pokémon"
            
            					local Attribute = tonumber(sheet.classe3) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            					
            					local dado = (sheet.dano3 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano3 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);		
            					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            					local NomeGolpe = sheet.golpe3 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Attribute = tonumber(sheet.classe3) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            
            					local dado = (sheet.dano3 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano3 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = sheet.ataque4 or 0;
            					local NomeGolpe = sheet.golpe4 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = sheet.Acc4 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe4 or "Golpe"
            					local NomeUser = sheet.baseName or "Pokémon"
            
            					local Attribute = tonumber(sheet.classe4) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            					
            					local dado = (sheet.dano4 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano4 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);		
            					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            					local NomeGolpe = sheet.golpe4 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Attribute = tonumber(sheet.classe4) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            
            					local dado = (sheet.dano4 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano4 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = sheet.ataque5 or 0;
            					local NomeGolpe = sheet.golpe5 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = sheet.Acc5 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe5 or "Golpe"
            					local NomeUser = sheet.baseName or "Pokémon"
            
            					local Attribute = tonumber(sheet.classe5) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            					
            					local dado = (sheet.dano5 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano5 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);		
            					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            					local NomeGolpe = sheet.golpe5 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Attribute = tonumber(sheet.classe5) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            
            					local dado = (sheet.dano5 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano5 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = sheet.ataque6 or 0;
            					local NomeGolpe = sheet.golpe6 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = sheet.Acc6 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe6 or "Golpe"
            					local NomeUser = sheet.baseName or "Pokémon"
            
            					local Attribute = tonumber(sheet.classe6) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            					
            					local dado = (sheet.dano6 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano6 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);		
            					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            					local NomeGolpe = sheet.golpe6 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Attribute = tonumber(sheet.classe6) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            
            					local dado = (sheet.dano6 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano6 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = sheet.ataque7 or 0;
            					local NomeGolpe = sheet.golpe7 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = sheet.Acc7 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe7 or "Golpe"
            					local NomeUser = sheet.baseName or "Pokémon"
            
            					local Attribute = tonumber(sheet.classe7) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            					
            					local dado = (sheet.dano7 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano7 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);		
            					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            					local NomeGolpe = sheet.golpe7 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Attribute = tonumber(sheet.classe7) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            
            					local dado = (sheet.dano7 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano7 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = sheet.ataque8 or 0;
            					local NomeGolpe = sheet.golpe8 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Accuracy = sheet.Acc8 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = sheet.golpe8 or "Golpe"
            					local NomeUser = sheet.baseName or "Pokémon"
            
            					local Attribute = tonumber(sheet.classe8) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            					
            					local dado = (sheet.dano8 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano8 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);		
            					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event23 = obj.button24:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            					local NomeGolpe = sheet.golpe8 or "Golpe"
            					local NomeUser = sheet.baseName or "Treinador"
            					local Attribute = tonumber(sheet.classe8) or 3;
            						if Attribute > 4 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = sheet.totFOR or 0;
            					local ATKESP = sheet.totSAB or 0;
            					local ATKWEA = sheet.totFOR or 0;
            					local ATK = {ATKFIS,ATKESP,0,ATKWEA} or 0;
            
            					local dado = (sheet.dano8 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local extra2 = sheet.BDano8 or "0"
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					rolagem:concatenar(extra2);					
            					if (Attribute == 1 or Attribute == 2 or Attribute == 4) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    function obj:_releaseEvents()
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
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
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
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
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
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
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
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
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
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
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
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
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
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
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
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
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
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
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
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
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
