require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmBibliotecaRPGmeister()
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
    obj:setName("frmBibliotecaRPGmeister");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Gerenciador.RPGmeister");
    obj:setTitle("Gerenciador de Campanha");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Introdução");
    obj.tab1:setName("tab1");

    obj.frmGerenciador01 = gui.fromHandle(_obj_newObject("form"));
    obj.frmGerenciador01:setParent(obj.tab1);
    obj.frmGerenciador01:setName("frmGerenciador01");
    obj.frmGerenciador01:setAlign("client");
    obj.frmGerenciador01:setTheme("dark");
    obj.frmGerenciador01:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmGerenciador01);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(550);
    obj.rectangle1:setHeight(615);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(550);
    obj.label1:setHeight(25);
    obj.label1:setText("SESSÕES");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(30);
    obj.label2:setHeight(25);
    obj.label2:setText("Nº");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(35);
    obj.label3:setTop(30);
    obj.label3:setWidth(205);
    obj.label3:setHeight(25);
    obj.label3:setText("XP");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(240);
    obj.label4:setTop(30);
    obj.label4:setWidth(90);
    obj.label4:setHeight(25);
    obj.label4:setText("PO");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(330);
    obj.label5:setTop(30);
    obj.label5:setWidth(80);
    obj.label5:setHeight(25);
    obj.label5:setText("Data");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(460);
    obj.label6:setTop(30);
    obj.label6:setWidth(40);
    obj.label6:setHeight(25);
    obj.label6:setText("Log");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(495);
    obj.button1:setTop(5);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("O");
    obj.button1:setHint("Organizar");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(520);
    obj.button2:setTop(5);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setHint("Novo");
    obj.button2:setName("button2");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.rectangle1);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(55);
    obj.scrollBox2:setWidth(550);
    obj.scrollBox2:setHeight(555);
    obj.scrollBox2:setName("scrollBox2");

    obj.rclSessoes = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclSessoes:setParent(obj.scrollBox2);
    obj.rclSessoes:setLeft(0);
    obj.rclSessoes:setTop(0);
    obj.rclSessoes:setWidth(530);
    obj.rclSessoes:setHeight(555);
    obj.rclSessoes:setItemHeight(35);
    obj.rclSessoes:setAutoHeight(true);
    obj.rclSessoes:setMinQt(1);
    obj.rclSessoes:setName("rclSessoes");
    obj.rclSessoes:setField("sessoes");
    obj.rclSessoes:setTemplateForm("frmGerenciador01_Sessao");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(555);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(680);
    obj.rectangle2:setHeight(615);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setName("rectangle2");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle2);
    obj.label7:setLeft(5);
    obj.label7:setTop(5);
    obj.label7:setWidth(550);
    obj.label7:setHeight(25);
    obj.label7:setText("JOGADORES");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle2);
    obj.label8:setLeft(5);
    obj.label8:setTop(30);
    obj.label8:setWidth(100);
    obj.label8:setHeight(25);
    obj.label8:setText("Jogador");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle2);
    obj.label9:setLeft(105);
    obj.label9:setTop(30);
    obj.label9:setWidth(100);
    obj.label9:setHeight(25);
    obj.label9:setText("Personagem");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle2);
    obj.label10:setLeft(205);
    obj.label10:setTop(30);
    obj.label10:setWidth(75);
    obj.label10:setHeight(25);
    obj.label10:setText("XP Inicial");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle2);
    obj.label11:setLeft(280);
    obj.label11:setTop(30);
    obj.label11:setWidth(75);
    obj.label11:setHeight(25);
    obj.label11:setText("XP Gasta");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle2);
    obj.label12:setLeft(355);
    obj.label12:setTop(30);
    obj.label12:setWidth(75);
    obj.label12:setHeight(25);
    obj.label12:setText("XP Total");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle2);
    obj.label13:setLeft(430);
    obj.label13:setTop(30);
    obj.label13:setWidth(25);
    obj.label13:setHeight(25);
    obj.label13:setText("NEP");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle2);
    obj.label14:setLeft(455);
    obj.label14:setTop(30);
    obj.label14:setWidth(75);
    obj.label14:setHeight(25);
    obj.label14:setText("PO Inicial");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle2);
    obj.label15:setLeft(530);
    obj.label15:setTop(30);
    obj.label15:setWidth(75);
    obj.label15:setHeight(25);
    obj.label15:setText("PO Total");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle2);
    obj.label16:setLeft(605);
    obj.label16:setTop(30);
    obj.label16:setWidth(25);
    obj.label16:setHeight(25);
    obj.label16:setText("Nº");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle2);
    obj.button3:setLeft(600);
    obj.button3:setTop(5);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("V");
    obj.button3:setHint("Dá voz a todos jogadores da lista, retira +Jogador dos outros e ativa mesa moderada. ");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle2);
    obj.button4:setLeft(625);
    obj.button4:setTop(5);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setText("O");
    obj.button4:setHint("Organizar");
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle2);
    obj.button5:setLeft(650);
    obj.button5:setTop(5);
    obj.button5:setWidth(25);
    obj.button5:setHeight(25);
    obj.button5:setText("+");
    obj.button5:setHint("Novo");
    obj.button5:setName("button5");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.rectangle2);
    obj.scrollBox3:setLeft(0);
    obj.scrollBox3:setTop(55);
    obj.scrollBox3:setWidth(680);
    obj.scrollBox3:setHeight(440);
    obj.scrollBox3:setName("scrollBox3");

    obj.rclJogadores = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclJogadores:setParent(obj.scrollBox3);
    obj.rclJogadores:setLeft(0);
    obj.rclJogadores:setTop(0);
    obj.rclJogadores:setWidth(660);
    obj.rclJogadores:setHeight(440);
    obj.rclJogadores:setItemHeight(35);
    obj.rclJogadores:setAutoHeight(true);
    obj.rclJogadores:setMinQt(1);
    obj.rclJogadores:setName("rclJogadores");
    obj.rclJogadores:setField("jogadores");
    obj.rclJogadores:setTemplateForm("frmGerenciador01_Jogadores");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Calendario");
    obj.tab2:setName("tab2");

    obj.frmGerenciador02 = gui.fromHandle(_obj_newObject("form"));
    obj.frmGerenciador02:setParent(obj.tab2);
    obj.frmGerenciador02:setName("frmGerenciador02");
    obj.frmGerenciador02:setAlign("client");
    obj.frmGerenciador02:setTheme("dark");
    obj.frmGerenciador02:setMargins({top=1});

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmGerenciador02);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.popClima = gui.fromHandle(_obj_newObject("popup"));
    obj.popClima:setParent(obj.scrollBox4);
    obj.popClima:setName("popClima");
    obj.popClima:setWidth(200);
    obj.popClima:setHeight(100);
    obj.popClima:setBackOpacity(0.4);

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popClima);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(70);
    obj.flowPart1:setMaxWidth(70);
    obj.flowPart1:setHeight(15);
    obj.flowPart1:setName("flowPart1");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart1);
    obj.label17:setAlign("top");
    obj.label17:setFontSize(10);
    obj.label17:setText("Temperatura");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setWordWrap(true);
    obj.label17:setTextTrimming("none");
    obj.label17:setAutoSize(true);
    obj.label17:setName("label17");

    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(100);
    obj.flowPart2:setMaxWidth(150);
    obj.flowPart2:setHeight(20);
    obj.flowPart2:setName("flowPart2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowPart2);
    obj.comboBox1:setAlign("top");
    obj.comboBox1:setFontSize(10);
    obj.comboBox1:setField("temperatura");
    obj.comboBox1:setItems({'Glacial', 'Frio', 'Temperado', 'Morno', 'Quente', 'Infernal'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.flowPart3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(70);
    obj.flowPart3:setMaxWidth(70);
    obj.flowPart3:setHeight(15);
    obj.flowPart3:setName("flowPart3");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart3);
    obj.label18:setAlign("top");
    obj.label18:setFontSize(10);
    obj.label18:setText("Precipitação");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setWordWrap(true);
    obj.label18:setTextTrimming("none");
    obj.label18:setAutoSize(true);
    obj.label18:setName("label18");

    obj.flowPart4 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(100);
    obj.flowPart4:setMaxWidth(150);
    obj.flowPart4:setHeight(20);
    obj.flowPart4:setName("flowPart4");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.flowPart4);
    obj.comboBox2:setAlign("top");
    obj.comboBox2:setFontSize(10);
    obj.comboBox2:setField("chuvas");
    obj.comboBox2:setItems({'Nenhuma', 'Pouca', 'Razoável', 'Muita', 'Constante'});
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setName("comboBox2");

    obj.flowPart5 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(70);
    obj.flowPart5:setMaxWidth(70);
    obj.flowPart5:setHeight(15);
    obj.flowPart5:setName("flowPart5");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart5);
    obj.label19:setAlign("top");
    obj.label19:setFontSize(10);
    obj.label19:setText("Areia");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setWordWrap(true);
    obj.label19:setTextTrimming("none");
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.flowPart6 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(100);
    obj.flowPart6:setMaxWidth(150);
    obj.flowPart6:setHeight(20);
    obj.flowPart6:setName("flowPart6");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.flowPart6);
    obj.comboBox3:setAlign("top");
    obj.comboBox3:setFontSize(10);
    obj.comboBox3:setField("areia");
    obj.comboBox3:setItems({'Nenhuma', 'Pouca', 'Razoável', 'Muita', 'Constante'});
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setName("comboBox3");

    obj.flowPart7 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(70);
    obj.flowPart7:setMaxWidth(70);
    obj.flowPart7:setHeight(15);
    obj.flowPart7:setName("flowPart7");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart7);
    obj.label20:setAlign("top");
    obj.label20:setFontSize(10);
    obj.label20:setText("Ventos");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setWordWrap(true);
    obj.label20:setTextTrimming("none");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.flowPart8 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(100);
    obj.flowPart8:setMaxWidth(150);
    obj.flowPart8:setHeight(20);
    obj.flowPart8:setName("flowPart8");

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.flowPart8);
    obj.comboBox4:setAlign("top");
    obj.comboBox4:setFontSize(10);
    obj.comboBox4:setField("ventos");
    obj.comboBox4:setItems({'Nenhum', 'Pouco', 'Razoável', 'Muito', 'Constante'});
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setName("comboBox4");

    obj.popCelestial = gui.fromHandle(_obj_newObject("popup"));
    obj.popCelestial:setParent(obj.scrollBox4);
    obj.popCelestial:setName("popCelestial");
    obj.popCelestial:setWidth(200);
    obj.popCelestial:setHeight(190);
    obj.popCelestial:setBackOpacity(0.4);

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popCelestial);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(2);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart9 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout2);
    obj.flowPart9:setMinWidth(100);
    obj.flowPart9:setMaxWidth(150);
    obj.flowPart9:setHeight(15);
    obj.flowPart9:setName("flowPart9");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart9);
    obj.label21:setAlign("top");
    obj.label21:setFontSize(10);
    obj.label21:setText("Eventos Celestes");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setWordWrap(true);
    obj.label21:setTextTrimming("none");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart10 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout2);
    obj.flowPart10:setMinWidth(70);
    obj.flowPart10:setMaxWidth(70);
    obj.flowPart10:setHeight(15);
    obj.flowPart10:setName("flowPart10");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart10);
    obj.label22:setAlign("top");
    obj.label22:setFontSize(10);
    obj.label22:setText("Sobrenatural");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setWordWrap(true);
    obj.label22:setTextTrimming("none");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.flowPart11 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout2);
    obj.flowPart11:setMinWidth(100);
    obj.flowPart11:setMaxWidth(150);
    obj.flowPart11:setHeight(20);
    obj.flowPart11:setName("flowPart11");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.flowPart11);
    obj.comboBox5:setAlign("top");
    obj.comboBox5:setFontSize(10);
    obj.comboBox5:setField("sobrentural");
    obj.comboBox5:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setName("comboBox5");

    obj.flowPart12 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout2);
    obj.flowPart12:setMinWidth(70);
    obj.flowPart12:setMaxWidth(70);
    obj.flowPart12:setHeight(15);
    obj.flowPart12:setName("flowPart12");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart12);
    obj.label23:setAlign("top");
    obj.label23:setFontSize(10);
    obj.label23:setText("Aurora");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setWordWrap(true);
    obj.label23:setTextTrimming("none");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");

    obj.flowPart13 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout2);
    obj.flowPart13:setMinWidth(100);
    obj.flowPart13:setMaxWidth(150);
    obj.flowPart13:setHeight(20);
    obj.flowPart13:setName("flowPart13");

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.flowPart13);
    obj.comboBox6:setAlign("top");
    obj.comboBox6:setFontSize(10);
    obj.comboBox6:setField("auroras");
    obj.comboBox6:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setName("comboBox6");

    obj.flowPart14 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout2);
    obj.flowPart14:setMinWidth(70);
    obj.flowPart14:setMaxWidth(70);
    obj.flowPart14:setHeight(15);
    obj.flowPart14:setName("flowPart14");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart14);
    obj.label24:setAlign("top");
    obj.label24:setFontSize(10);
    obj.label24:setText("Cometas");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setWordWrap(true);
    obj.label24:setTextTrimming("none");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.flowPart15 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout2);
    obj.flowPart15:setMinWidth(100);
    obj.flowPart15:setMaxWidth(150);
    obj.flowPart15:setHeight(20);
    obj.flowPart15:setName("flowPart15");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.flowPart15);
    obj.comboBox7:setAlign("top");
    obj.comboBox7:setFontSize(10);
    obj.comboBox7:setField("cometas");
    obj.comboBox7:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setName("comboBox7");

    obj.flowPart16 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout2);
    obj.flowPart16:setMinWidth(70);
    obj.flowPart16:setMaxWidth(70);
    obj.flowPart16:setHeight(15);
    obj.flowPart16:setName("flowPart16");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart16);
    obj.label25:setAlign("top");
    obj.label25:setFontSize(10);
    obj.label25:setText("Estrela Cadente");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setWordWrap(true);
    obj.label25:setTextTrimming("none");
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.flowPart17 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout2);
    obj.flowPart17:setMinWidth(100);
    obj.flowPart17:setMaxWidth(150);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setName("flowPart17");

    obj.comboBox8 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.flowPart17);
    obj.comboBox8:setAlign("top");
    obj.comboBox8:setFontSize(10);
    obj.comboBox8:setField("cadentes");
    obj.comboBox8:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setName("comboBox8");

    obj.flowPart18 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout2);
    obj.flowPart18:setMinWidth(70);
    obj.flowPart18:setMaxWidth(70);
    obj.flowPart18:setHeight(15);
    obj.flowPart18:setName("flowPart18");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart18);
    obj.label26:setAlign("top");
    obj.label26:setFontSize(10);
    obj.label26:setText("Eclipse Lunar");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setWordWrap(true);
    obj.label26:setTextTrimming("none");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.flowPart19 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout2);
    obj.flowPart19:setMinWidth(100);
    obj.flowPart19:setMaxWidth(150);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setName("flowPart19");

    obj.comboBox9 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.flowPart19);
    obj.comboBox9:setAlign("top");
    obj.comboBox9:setFontSize(10);
    obj.comboBox9:setField("lunar");
    obj.comboBox9:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setName("comboBox9");

    obj.flowPart20 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout2);
    obj.flowPart20:setMinWidth(70);
    obj.flowPart20:setMaxWidth(70);
    obj.flowPart20:setHeight(15);
    obj.flowPart20:setName("flowPart20");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart20);
    obj.label27:setAlign("top");
    obj.label27:setFontSize(10);
    obj.label27:setText("Eclipse Solar");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setWordWrap(true);
    obj.label27:setTextTrimming("none");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.flowPart21 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout2);
    obj.flowPart21:setMinWidth(100);
    obj.flowPart21:setMaxWidth(150);
    obj.flowPart21:setHeight(20);
    obj.flowPart21:setName("flowPart21");

    obj.comboBox10 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.flowPart21);
    obj.comboBox10:setAlign("top");
    obj.comboBox10:setFontSize(10);
    obj.comboBox10:setField("solar");
    obj.comboBox10:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setName("comboBox10");

    obj.flowPart22 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout2);
    obj.flowPart22:setMinWidth(70);
    obj.flowPart22:setMaxWidth(70);
    obj.flowPart22:setHeight(15);
    obj.flowPart22:setName("flowPart22");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart22);
    obj.label28:setAlign("top");
    obj.label28:setFontSize(10);
    obj.label28:setText("Meteoros");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setWordWrap(true);
    obj.label28:setTextTrimming("none");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.flowPart23 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout2);
    obj.flowPart23:setMinWidth(100);
    obj.flowPart23:setMaxWidth(150);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setName("flowPart23");

    obj.comboBox11 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.flowPart23);
    obj.comboBox11:setAlign("top");
    obj.comboBox11:setFontSize(10);
    obj.comboBox11:setField("meteoros");
    obj.comboBox11:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setName("comboBox11");

    obj.flowPart24 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout2);
    obj.flowPart24:setMinWidth(70);
    obj.flowPart24:setMaxWidth(70);
    obj.flowPart24:setHeight(15);
    obj.flowPart24:setName("flowPart24");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart24);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(10);
    obj.label29:setText("Terremotos");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setWordWrap(true);
    obj.label29:setTextTrimming("none");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");

    obj.flowPart25 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout2);
    obj.flowPart25:setMinWidth(100);
    obj.flowPart25:setMaxWidth(150);
    obj.flowPart25:setHeight(20);
    obj.flowPart25:setName("flowPart25");

    obj.comboBox12 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.flowPart25);
    obj.comboBox12:setAlign("top");
    obj.comboBox12:setFontSize(10);
    obj.comboBox12:setField("terremotos");
    obj.comboBox12:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setName("comboBox12");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox4);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(1020);
    obj.layout1:setHeight(345);
    obj.layout1:setName("layout1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(250);
    obj.layout2:setHeight(345);
    obj.layout2:setName("layout2");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setName("rectangle3");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout2);
    obj.label30:setWidth(250);
    obj.label30:setHeight(20);
    obj.label30:setText("MESES");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(25);
    obj.layout3:setWidth(250);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout3);
    obj.button6:setLeft(10);
    obj.button6:setTop(0);
    obj.button6:setWidth(25);
    obj.button6:setHeight(25);
    obj.button6:setText("+");
    obj.button6:setHint("Novo");
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout3);
    obj.button7:setLeft(35);
    obj.button7:setTop(0);
    obj.button7:setWidth(25);
    obj.button7:setHeight(25);
    obj.button7:setText("O");
    obj.button7:setHint("Organizar");
    obj.button7:setName("button7");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout3);
    obj.label31:setLeft(115);
    obj.label31:setTop(0);
    obj.label31:setWidth(40);
    obj.label31:setHeight(25);
    obj.label31:setText("Total");
    obj.label31:setHitTest(true);
    obj.label31:setHint("Quantos dias dura o ano.");
    obj.label31:setName("label31");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setLeft(165);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(35);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.dias = gui.fromHandle(_obj_newObject("label"));
    obj.dias:setParent(obj.layout3);
    obj.dias:setLeft(165);
    obj.dias:setTop(0);
    obj.dias:setWidth(35);
    obj.dias:setHeight(25);
    obj.dias:setField("dias");
    obj.dias:setHorzTextAlign("center");
    obj.dias:setFontSize(12);
    obj.dias:setName("dias");
    obj.dias:setHitTest(true);
    obj.dias:setHint("Se estiver vermelho a duração do ano e das estações está dessincronizada. ");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout2);
    obj.label32:setLeft(6);
    obj.label32:setTop(50);
    obj.label32:setWidth(30);
    obj.label32:setHeight(25);
    obj.label32:setText("Nº");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setHitTest(true);
    obj.label32:setHint("Qual a ordem dos meses?");
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout2);
    obj.label33:setLeft(45);
    obj.label33:setTop(50);
    obj.label33:setWidth(110);
    obj.label33:setHeight(25);
    obj.label33:setText("Nome");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout2);
    obj.label34:setLeft(155);
    obj.label34:setTop(50);
    obj.label34:setWidth(55);
    obj.label34:setHeight(25);
    obj.label34:setText("Duração");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setHitTest(true);
    obj.label34:setHint("Quantos dias dura esse mês.");
    obj.label34:setName("label34");

    obj.rclMeses = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMeses:setParent(obj.layout2);
    obj.rclMeses:setLeft(5);
    obj.rclMeses:setTop(80);
    obj.rclMeses:setWidth(240);
    obj.rclMeses:setHeight(260);
    obj.rclMeses:setName("rclMeses");
    obj.rclMeses:setField("listaMeses");
    obj.rclMeses:setTemplateForm("frmGerenciador02_MES");
    obj.rclMeses:setLayout("vertical");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setFields({'duracaoEstacao', 'dias'});
    obj.dataLink1:setName("dataLink1");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(255);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(250);
    obj.layout4:setHeight(345);
    obj.layout4:setName("layout4");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout4);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setName("rectangle5");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout4);
    obj.label35:setWidth(250);
    obj.label35:setHeight(20);
    obj.label35:setText("DIAS DA SEMANA");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(25);
    obj.layout5:setWidth(250);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout5);
    obj.button8:setLeft(10);
    obj.button8:setTop(0);
    obj.button8:setWidth(25);
    obj.button8:setHeight(25);
    obj.button8:setText("+");
    obj.button8:setHint("Novo");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout5);
    obj.button9:setLeft(35);
    obj.button9:setTop(0);
    obj.button9:setWidth(25);
    obj.button9:setHeight(25);
    obj.button9:setText("O");
    obj.button9:setHint("Organizar");
    obj.button9:setName("button9");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout5);
    obj.label36:setLeft(125);
    obj.label36:setTop(0);
    obj.label36:setWidth(40);
    obj.label36:setHeight(25);
    obj.label36:setText("Desvio");
    obj.label36:setHitTest(true);
    obj.label36:setHint("O ano 1 começa em quem dia da semana?");
    obj.label36:setName("label36");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout5);
    obj.edit1:setLeft(165);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(35);
    obj.edit1:setHeight(25);
    obj.edit1:setField("desvioSemana");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout4);
    obj.label37:setLeft(6);
    obj.label37:setTop(50);
    obj.label37:setWidth(30);
    obj.label37:setHeight(25);
    obj.label37:setText("Nº");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setHitTest(true);
    obj.label37:setHint("Qual a ordem dos dias da semana?");
    obj.label37:setName("label37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout4);
    obj.label38:setLeft(35);
    obj.label38:setTop(50);
    obj.label38:setWidth(165);
    obj.label38:setHeight(25);
    obj.label38:setText("Nome");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.rclSemana = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclSemana:setParent(obj.layout4);
    obj.rclSemana:setLeft(5);
    obj.rclSemana:setTop(80);
    obj.rclSemana:setWidth(240);
    obj.rclSemana:setHeight(260);
    obj.rclSemana:setName("rclSemana");
    obj.rclSemana:setField("listaSemana");
    obj.rclSemana:setTemplateForm("frmGerenciador02_SEMANA");
    obj.rclSemana:setLayout("vertical");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(510);
    obj.layout6:setTop(0);
    obj.layout6:setWidth(250);
    obj.layout6:setHeight(345);
    obj.layout6:setName("layout6");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout6);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("Black");
    obj.rectangle6:setName("rectangle6");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout6);
    obj.label39:setWidth(250);
    obj.label39:setHeight(20);
    obj.label39:setText("LUAS");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(25);
    obj.layout7:setWidth(250);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout7);
    obj.button10:setLeft(10);
    obj.button10:setTop(0);
    obj.button10:setWidth(25);
    obj.button10:setHeight(25);
    obj.button10:setText("+");
    obj.button10:setHint("Novo");
    obj.button10:setName("button10");

    obj.celestialBt = gui.fromHandle(_obj_newObject("button"));
    obj.celestialBt:setParent(obj.layout7);
    obj.celestialBt:setLeft(35);
    obj.celestialBt:setTop(0);
    obj.celestialBt:setWidth(25);
    obj.celestialBt:setHeight(25);
    obj.celestialBt:setText("i");
    obj.celestialBt:setName("celestialBt");
    obj.celestialBt:setHint("Eventos Celestiais");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout6);
    obj.label40:setLeft(15);
    obj.label40:setTop(50);
    obj.label40:setWidth(110);
    obj.label40:setHeight(25);
    obj.label40:setText("Nome");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout6);
    obj.label41:setLeft(120);
    obj.label41:setTop(50);
    obj.label41:setWidth(55);
    obj.label41:setHeight(25);
    obj.label41:setText("Ciclo");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setHitTest(true);
    obj.label41:setHint("Quantos dias leva o ciclo lunar?");
    obj.label41:setName("label41");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout6);
    obj.label42:setLeft(155);
    obj.label42:setTop(50);
    obj.label42:setWidth(55);
    obj.label42:setHeight(25);
    obj.label42:setText("Desvio");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setHitTest(true);
    obj.label42:setHint("No ano 1 em que dia começa o ciclo lunar (lua cheia)?");
    obj.label42:setName("label42");

    obj.rclLuas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclLuas:setParent(obj.layout6);
    obj.rclLuas:setLeft(5);
    obj.rclLuas:setTop(80);
    obj.rclLuas:setWidth(240);
    obj.rclLuas:setHeight(260);
    obj.rclLuas:setName("rclLuas");
    obj.rclLuas:setField("listaLuas");
    obj.rclLuas:setTemplateForm("frmGerenciador02_LUA");
    obj.rclLuas:setLayout("vertical");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(765);
    obj.layout8:setTop(0);
    obj.layout8:setWidth(250);
    obj.layout8:setHeight(345);
    obj.layout8:setName("layout8");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout8);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("Black");
    obj.rectangle7:setName("rectangle7");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout8);
    obj.label43:setWidth(250);
    obj.label43:setHeight(20);
    obj.label43:setText("ESTAÇÕES");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(0);
    obj.layout9:setTop(25);
    obj.layout9:setWidth(250);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout9);
    obj.button11:setLeft(10);
    obj.button11:setTop(0);
    obj.button11:setWidth(25);
    obj.button11:setHeight(25);
    obj.button11:setText("+");
    obj.button11:setHint("Novo");
    obj.button11:setName("button11");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout9);
    obj.button12:setLeft(35);
    obj.button12:setTop(0);
    obj.button12:setWidth(25);
    obj.button12:setHeight(25);
    obj.button12:setText("O");
    obj.button12:setHint("Organizar");
    obj.button12:setName("button12");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout9);
    obj.label44:setLeft(125);
    obj.label44:setTop(0);
    obj.label44:setWidth(40);
    obj.label44:setHeight(25);
    obj.label44:setText("Desvio");
    obj.label44:setHitTest(true);
    obj.label44:setHint("Em que dia do ano começa a primeira estação?");
    obj.label44:setName("label44");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout9);
    obj.edit2:setLeft(165);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(35);
    obj.edit2:setHeight(25);
    obj.edit2:setField("desvioEstacao");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout8);
    obj.label45:setLeft(6);
    obj.label45:setTop(50);
    obj.label45:setWidth(30);
    obj.label45:setHeight(25);
    obj.label45:setText("Nº");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setHitTest(true);
    obj.label45:setHint("Qual a ordem das estações?");
    obj.label45:setName("label45");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout8);
    obj.label46:setLeft(45);
    obj.label46:setTop(50);
    obj.label46:setWidth(85);
    obj.label46:setHeight(25);
    obj.label46:setText("Nome");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout8);
    obj.label47:setLeft(130);
    obj.label47:setTop(50);
    obj.label47:setWidth(55);
    obj.label47:setHeight(25);
    obj.label47:setText("Duração");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setHitTest(true);
    obj.label47:setHint("Quantos dias dura essa estação?");
    obj.label47:setName("label47");

    obj.rclEstacoes = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclEstacoes:setParent(obj.layout8);
    obj.rclEstacoes:setLeft(5);
    obj.rclEstacoes:setTop(80);
    obj.rclEstacoes:setWidth(240);
    obj.rclEstacoes:setHeight(260);
    obj.rclEstacoes:setName("rclEstacoes");
    obj.rclEstacoes:setField("listaEstacoes");
    obj.rclEstacoes:setTemplateForm("frmGerenciador02_ESTACAO");
    obj.rclEstacoes:setLayout("vertical");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox4);
    obj.layout10:setLeft(1020);
    obj.layout10:setTop(0);
    obj.layout10:setWidth(210);
    obj.layout10:setHeight(345);
    obj.layout10:setName("layout10");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout10);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("Black");
    obj.rectangle8:setName("rectangle8");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout10);
    obj.label48:setLeft(5);
    obj.label48:setTop(5);
    obj.label48:setWidth(30);
    obj.label48:setHeight(25);
    obj.label48:setText("Dia");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout10);
    obj.edit3:setLeft(5);
    obj.edit3:setTop(30);
    obj.edit3:setWidth(30);
    obj.edit3:setHeight(25);
    obj.edit3:setField("dia");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout10);
    obj.label49:setLeft(35);
    obj.label49:setTop(5);
    obj.label49:setWidth(30);
    obj.label49:setHeight(25);
    obj.label49:setText("Mês");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout10);
    obj.edit4:setLeft(35);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(30);
    obj.edit4:setHeight(25);
    obj.edit4:setField("mes");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout10);
    obj.label50:setLeft(65);
    obj.label50:setTop(5);
    obj.label50:setWidth(40);
    obj.label50:setHeight(25);
    obj.label50:setText("Ano");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout10);
    obj.edit5:setLeft(65);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(40);
    obj.edit5:setHeight(25);
    obj.edit5:setField("ano");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout10);
    obj.label51:setLeft(105);
    obj.label51:setTop(5);
    obj.label51:setWidth(100);
    obj.label51:setHeight(25);
    obj.label51:setText("Era");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout10);
    obj.edit6:setLeft(105);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setField("era");
    obj.edit6:setName("edit6");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout10);
    obj.button13:setLeft(5);
    obj.button13:setTop(55);
    obj.button13:setWidth(100);
    obj.button13:setHeight(25);
    obj.button13:setText("Avançar");
    obj.button13:setHint("Avança X dias no Calandario.");
    obj.button13:setName("button13");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout10);
    obj.edit7:setLeft(105);
    obj.edit7:setTop(55);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("add");
    obj.edit7:setName("edit7");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout10);
    obj.label52:setLeft(160);
    obj.label52:setTop(55);
    obj.label52:setWidth(45);
    obj.label52:setHeight(25);
    obj.label52:setText("Dias");
    obj.label52:setName("label52");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout10);
    obj.dataLink2:setField("add");
    obj.dataLink2:setDefaultValue("1");
    obj.dataLink2:setName("dataLink2");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout10);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(80);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("data");
    obj.textEditor1:setName("textEditor1");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(180);
    obj.layout11:setWidth(200);
    obj.layout11:setHeight(155);
    obj.layout11:setName("layout11");

    obj.dataLabel = gui.fromHandle(_obj_newObject("label"));
    obj.dataLabel:setParent(obj.layout11);
    obj.dataLabel:setLeft(0);
    obj.dataLabel:setTop(0);
    obj.dataLabel:setWidth(200);
    obj.dataLabel:setHeight(20);
    obj.dataLabel:setField("dataLabel");
    obj.dataLabel:setName("dataLabel");
    obj.dataLabel:setFontSize(10);

    obj.estacaoLabel = gui.fromHandle(_obj_newObject("label"));
    obj.estacaoLabel:setParent(obj.layout11);
    obj.estacaoLabel:setLeft(0);
    obj.estacaoLabel:setTop(20);
    obj.estacaoLabel:setWidth(200);
    obj.estacaoLabel:setHeight(20);
    obj.estacaoLabel:setField("estacaoLabel");
    obj.estacaoLabel:setName("estacaoLabel");
    obj.estacaoLabel:setFontSize(10);

    obj.temperaturaLabel = gui.fromHandle(_obj_newObject("label"));
    obj.temperaturaLabel:setParent(obj.layout11);
    obj.temperaturaLabel:setLeft(0);
    obj.temperaturaLabel:setTop(40);
    obj.temperaturaLabel:setWidth(200);
    obj.temperaturaLabel:setHeight(20);
    obj.temperaturaLabel:setField("temperaturaLabel");
    obj.temperaturaLabel:setName("temperaturaLabel");
    obj.temperaturaLabel:setFontSize(10);
    obj.temperaturaLabel:setHitTest(true);

    obj.precipitacaoLabel = gui.fromHandle(_obj_newObject("label"));
    obj.precipitacaoLabel:setParent(obj.layout11);
    obj.precipitacaoLabel:setLeft(0);
    obj.precipitacaoLabel:setTop(60);
    obj.precipitacaoLabel:setWidth(200);
    obj.precipitacaoLabel:setHeight(20);
    obj.precipitacaoLabel:setField("precipitacaoLabel");
    obj.precipitacaoLabel:setName("precipitacaoLabel");
    obj.precipitacaoLabel:setFontSize(10);
    obj.precipitacaoLabel:setHitTest(true);

    obj.ventoLabel = gui.fromHandle(_obj_newObject("label"));
    obj.ventoLabel:setParent(obj.layout11);
    obj.ventoLabel:setLeft(0);
    obj.ventoLabel:setTop(80);
    obj.ventoLabel:setWidth(200);
    obj.ventoLabel:setHeight(20);
    obj.ventoLabel:setField("ventoLabel");
    obj.ventoLabel:setName("ventoLabel");
    obj.ventoLabel:setFontSize(10);
    obj.ventoLabel:setHitTest(true);

    obj.luasLabel = gui.fromHandle(_obj_newObject("label"));
    obj.luasLabel:setParent(obj.layout11);
    obj.luasLabel:setLeft(0);
    obj.luasLabel:setTop(100);
    obj.luasLabel:setWidth(200);
    obj.luasLabel:setHeight(35);
    obj.luasLabel:setField("luasLabel");
    obj.luasLabel:setName("luasLabel");
    obj.luasLabel:setFontSize(10);
    obj.luasLabel:setWordWrap(true);
    obj.luasLabel:setTextTrimming("none");

    obj.eventosLabel = gui.fromHandle(_obj_newObject("label"));
    obj.eventosLabel:setParent(obj.layout11);
    obj.eventosLabel:setLeft(0);
    obj.eventosLabel:setTop(135);
    obj.eventosLabel:setWidth(200);
    obj.eventosLabel:setHeight(20);
    obj.eventosLabel:setField("eventosLabel");
    obj.eventosLabel:setName("eventosLabel");
    obj.eventosLabel:setFontSize(10);
    obj.eventosLabel:setHitTest(true);

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout10);
    obj.dataLink3:setFields({'dia', 'mes', 'ano', 'dias', 'duracaoEstacao', 'desvioSemana', 'desvioEstacao'});
    obj.dataLink3:setName("dataLink3");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("NPCs");
    obj.tab3:setName("tab3");

    obj.Listade_NPC_Dock = gui.fromHandle(_obj_newObject("form"));
    obj.Listade_NPC_Dock:setParent(obj.tab3);
    obj.Listade_NPC_Dock:setName("Listade_NPC_Dock");
    obj.Listade_NPC_Dock:setFormType("tablesDock");
    obj.Listade_NPC_Dock:setDataType("Lista.de.NPC");
    obj.Listade_NPC_Dock:setTitle("Lista de NPCs");
    obj.Listade_NPC_Dock:setAlign("client");
    obj.Listade_NPC_Dock:setTheme("dark");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.Listade_NPC_Dock);
    obj.dataLink4:setField("CorIndex");
    obj.dataLink4:setDefaultValue("0");
    obj.dataLink4:setName("dataLink4");


		function getOrganizacao()
			return self.dcsMain.scopeNode.TipoOrganizar;
		end;
		
		function MudarNomeDaAba(nome)
			sheet.opcaoEscolhida = nome;
		end;

		function self:autoCalcular()
			local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
			self.dropDownFalso:show(bottomCenter, self.comboBoxFalsa);
			self.dropDownFalso.top = self.dropDownFalso.top + self.comboBoxFalsa.height;
			
			self.dropDownFalso.height = 8 + (24 * #nodes)			 
		end;
		
		function autoFechar()
			self.dropDownFalso:close();
		end;
		
		function safeNodeDeletion(node)
			nodes = ndb.getChildNodes(sheet.opcoesFalsas);
			setTimeout(function()
				if node == self.dcsMain.scopeNode then
					self.opcoesFalsas.selectedNode = nodes[1];
				end;
			end, 10)
			ndb.deleteNode(node);
			self:autoCalcular();
			self.dropDownFalso:close();
		end;
		
		function GetBarrinhaNome(id)
			if sheet ~= nil then
				if id == 1 then
					return (sheet.NomeBarrinha1 or "Barrinha 1");
				elseif id == 2 then
					return (sheet.NomeBarrinha2 or "Barrinha 2");
				elseif id == 3 then
					return (sheet.NomeBarrinha3 or "Barrinha 3");
				elseif id == 4 then
					return (sheet.NomeBarrinha4 or "Barrinha 4");
				end;
			end;
		end;
		
		function GetBarrinhaVisivel(blockoverlay, id)
			if sheet ~= nil then
				if not blockoverlay then
					if id == 1 then
						return (sheet.VisibBarrinha1 == "a");
					elseif id == 2 then
						return (sheet.VisibBarrinha2 == "a");
					elseif id == 3 then
						return (sheet.VisibBarrinha3 == "a");
					elseif id == 4 then
						return (sheet.VisibBarrinha4 == "a");
					end;
				else
					return DonoMestre();
				end;
			end;
		end;
		
		function GetBarrinhaNumeros(id)
			if sheet ~= nil then
				if id == 1 then
					return (sheet.NumerosBarrinha1 == "x");
				elseif id == 2 then
					return (sheet.NumerosBarrinha2 == "x");
				elseif id == 3 then
					return (sheet.NumerosBarrinha3 == "x");
				elseif id == 4 then
					return (sheet.NumerosBarrinha4 == "x");
				end;
			end;
		end;
		
		function GetEnviarChat()
			if sheet ~= nil then
				return sheet.EnviarNoChat;
			end;
		end;
	


    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.Listade_NPC_Dock);
    obj.layout12:setAlign("client");
    obj.layout12:setVisible(false);
    obj.layout12:setName("layout12");

    obj.Config = gui.fromHandle(_obj_newObject("popupForm"));
    obj.Config:setParent(obj.layout12);
    obj.Config:setTitle("Configuração de Barrinhas");
    obj.Config:setName("Config");
    obj.Config:setWidth(406);
    obj.Config:setHeight(190);

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.Config);
    obj.label53:setAlign("top");
    obj.label53:setHeight(18);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setText("Configurações de Barrinhas");
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setFontColor("white");
    obj.label53:setName("label53");

    obj.dcsTituloEAbas = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dcsTituloEAbas:setParent(obj.Config);
    obj.dcsTituloEAbas:setName("dcsTituloEAbas");
    obj.dcsTituloEAbas:setAlign("top");
    obj.dcsTituloEAbas:setHeight(18);
    obj.dcsTituloEAbas:setMargins({top=4});

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.dcsTituloEAbas);
    obj.label54:setLeft(5);
    obj.label54:setFontSize(12);
    obj.label54:setAutoSize(true);
    obj.label54:setText("Título da Aba:");
    obj.label54:setName("label54");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.dcsTituloEAbas);
    obj.edit8:setLeft(85);
    obj.edit8:setHeight(18);
    obj.edit8:setFontColor("white");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setFontSize(12);
    obj.edit8:setWidth(108);
    obj.edit8:setField("NomeDaOpcao");
    obj.edit8:setName("edit8");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.dcsTituloEAbas);
    obj.label55:setLeft(210);
    obj.label55:setFontSize(12);
    obj.label55:setAutoSize(true);
    obj.label55:setText("Organização:");
    obj.label55:setMargins({left=12});
    obj.label55:setName("label55");

    obj.comboBox13 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.dcsTituloEAbas);
    obj.comboBox13:setLeft(292);
    obj.comboBox13:setHeight(18);
    obj.comboBox13:setFontColor("white");
    obj.comboBox13:setFontSize(12);
    obj.comboBox13:setWidth(108);
    obj.comboBox13:setField("TipoOrganizar");
    obj.comboBox13:setItems({'Alfabética', 'Alinhamento'});
    obj.comboBox13:setValues({'Alfa', 'Alin'});
    obj.comboBox13:setName("comboBox13");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.Config);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(18);
    obj.layout13:setMargins({top=4});
    obj.layout13:setName("layout13");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(64);
    obj.layout14:setName("layout14");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout13);
    obj.label56:setAlign("left");
    obj.label56:setFontSize(12);
    obj.label56:setWidth(108);
    obj.label56:setText("Nome da Barrinha");
    obj.label56:setMargins({left=4});
    obj.label56:setName("label56");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout13);
    obj.label57:setAlign("left");
    obj.label57:setFontSize(12);
    obj.label57:setWidth(26);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setText("Cor");
    obj.label57:setMargins({left=4});
    obj.label57:setName("label57");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout13);
    obj.label58:setAlign("left");
    obj.label58:setFontSize(12);
    obj.label58:setWidth(82);
    obj.label58:setText("Visibilidade");
    obj.label58:setMargins({left=4});
    obj.label58:setName("label58");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout13);
    obj.label59:setAlign("left");
    obj.label59:setFontSize(12);
    obj.label59:setWidth(108);
    obj.label59:setText("Tipo de Números");
    obj.label59:setMargins({left=4});
    obj.label59:setName("label59");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.Config);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(18);
    obj.layout15:setMargins({top=4});
    obj.layout15:setName("layout15");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout15);
    obj.label60:setAlign("left");
    obj.label60:setFontSize(12);
    obj.label60:setText("Barrinha 1:");
    obj.label60:setHorzTextAlign("trailing");
    obj.label60:setWidth(64);
    obj.label60:setName("label60");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout15);
    obj.edit9:setAlign("left");
    obj.edit9:setFontSize(12);
    obj.edit9:setWidth(108);
    obj.edit9:setVertTextAlign("trailing");
    obj.edit9:setField("NomeBarrinha1");
    obj.edit9:setText("Barrinha 1");
    obj.edit9:setMargins({left=4});
    obj.edit9:setName("edit9");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(26);
    obj.layout16:setMargins({left=4});
    obj.layout16:setName("layout16");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout16);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("white");
    obj.rectangle9:setHitTest(true);
    obj.rectangle9:setMargins({left=4, right=4});
    obj.rectangle9:setName("rectangle9");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.rectangle9);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle10:setHitTest(true);
    obj.rectangle10:setName("rectangle10");

    obj.CorBarrinha1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha1:setParent(obj.rectangle10);
    obj.CorBarrinha1:setName("CorBarrinha1");
    obj.CorBarrinha1:setColor("#808080");
    obj.CorBarrinha1:setAlign("client");
    obj.CorBarrinha1:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha1:setHitTest(true);

    obj.comboBox14 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout15);
    obj.comboBox14:setAlign("left");
    obj.comboBox14:setFontSize(12);
    obj.comboBox14:setWidth(82);
    obj.comboBox14:setText("Visibilidade");
    obj.comboBox14:setFontColor("white");
    obj.comboBox14:setVertTextAlign("trailing");
    obj.comboBox14:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox14:setValues({'a', 'b', 'c'});
    obj.comboBox14:setValue("a");
    obj.comboBox14:setField("VisibBarrinha1");
    obj.comboBox14:setMargins({left=4});
    obj.comboBox14:setName("comboBox14");

    obj.comboBox15 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout15);
    obj.comboBox15:setAlign("left");
    obj.comboBox15:setFontSize(12);
    obj.comboBox15:setWidth(104);
    obj.comboBox15:setText("Tipo de Números");
    obj.comboBox15:setVertTextAlign("trailing");
    obj.comboBox15:setFontColor("white");
    obj.comboBox15:setField("NumerosBarrinha1");
    obj.comboBox15:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox15:setValues({'x', 'y'});
    obj.comboBox15:setValue("x");
    obj.comboBox15:setMargins({left=4});
    obj.comboBox15:setName("comboBox15");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout15);
    obj.dataLink5:setField("CorBarrinha1");
    obj.dataLink5:setDefaultValue("#808080");
    obj.dataLink5:setName("dataLink5");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.Config);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(18);
    obj.layout17:setMargins({top=4});
    obj.layout17:setName("layout17");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout17);
    obj.label61:setAlign("left");
    obj.label61:setFontSize(12);
    obj.label61:setText("Barrinha 1:");
    obj.label61:setHorzTextAlign("trailing");
    obj.label61:setWidth(64);
    obj.label61:setName("label61");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout17);
    obj.edit10:setAlign("left");
    obj.edit10:setFontSize(12);
    obj.edit10:setWidth(108);
    obj.edit10:setVertTextAlign("trailing");
    obj.edit10:setField("NomeBarrinha2");
    obj.edit10:setText("Barrinha 2");
    obj.edit10:setMargins({left=4});
    obj.edit10:setName("edit10");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(26);
    obj.layout18:setMargins({left=4});
    obj.layout18:setName("layout18");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout18);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("white");
    obj.rectangle11:setHitTest(true);
    obj.rectangle11:setMargins({left=4, right=4});
    obj.rectangle11:setName("rectangle11");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle11);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle12:setHitTest(true);
    obj.rectangle12:setName("rectangle12");

    obj.CorBarrinha2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha2:setParent(obj.rectangle12);
    obj.CorBarrinha2:setName("CorBarrinha2");
    obj.CorBarrinha2:setColor("#808080");
    obj.CorBarrinha2:setAlign("client");
    obj.CorBarrinha2:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha2:setHitTest(true);

    obj.comboBox16 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout17);
    obj.comboBox16:setAlign("left");
    obj.comboBox16:setFontSize(12);
    obj.comboBox16:setWidth(82);
    obj.comboBox16:setText("Visibilidade");
    obj.comboBox16:setFontColor("white");
    obj.comboBox16:setVertTextAlign("trailing");
    obj.comboBox16:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox16:setValues({'a', 'b', 'c'});
    obj.comboBox16:setValue("a");
    obj.comboBox16:setField("VisibBarrinha2");
    obj.comboBox16:setMargins({left=4});
    obj.comboBox16:setName("comboBox16");

    obj.comboBox17 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout17);
    obj.comboBox17:setAlign("left");
    obj.comboBox17:setFontSize(12);
    obj.comboBox17:setWidth(104);
    obj.comboBox17:setText("Tipo de Números");
    obj.comboBox17:setVertTextAlign("trailing");
    obj.comboBox17:setFontColor("white");
    obj.comboBox17:setField("NumerosBarrinha2");
    obj.comboBox17:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox17:setValues({'x', 'y'});
    obj.comboBox17:setValue("x");
    obj.comboBox17:setMargins({left=4});
    obj.comboBox17:setName("comboBox17");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout17);
    obj.dataLink6:setField("CorBarrinha2");
    obj.dataLink6:setDefaultValue("#808080");
    obj.dataLink6:setName("dataLink6");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.Config);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(18);
    obj.layout19:setMargins({top=4});
    obj.layout19:setName("layout19");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout19);
    obj.label62:setAlign("left");
    obj.label62:setFontSize(12);
    obj.label62:setText("Barrinha 1:");
    obj.label62:setHorzTextAlign("trailing");
    obj.label62:setWidth(64);
    obj.label62:setName("label62");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout19);
    obj.edit11:setAlign("left");
    obj.edit11:setFontSize(12);
    obj.edit11:setWidth(108);
    obj.edit11:setVertTextAlign("trailing");
    obj.edit11:setField("NomeBarrinha3");
    obj.edit11:setText("Barrinha 3");
    obj.edit11:setMargins({left=4});
    obj.edit11:setName("edit11");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(26);
    obj.layout20:setMargins({left=4});
    obj.layout20:setName("layout20");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout20);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("white");
    obj.rectangle13:setHitTest(true);
    obj.rectangle13:setMargins({left=4, right=4});
    obj.rectangle13:setName("rectangle13");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.rectangle13);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle14:setHitTest(true);
    obj.rectangle14:setName("rectangle14");

    obj.CorBarrinha3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha3:setParent(obj.rectangle14);
    obj.CorBarrinha3:setName("CorBarrinha3");
    obj.CorBarrinha3:setColor("#808080");
    obj.CorBarrinha3:setAlign("client");
    obj.CorBarrinha3:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha3:setHitTest(true);

    obj.comboBox18 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout19);
    obj.comboBox18:setAlign("left");
    obj.comboBox18:setFontSize(12);
    obj.comboBox18:setWidth(82);
    obj.comboBox18:setText("Visibilidade");
    obj.comboBox18:setFontColor("white");
    obj.comboBox18:setVertTextAlign("trailing");
    obj.comboBox18:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox18:setValues({'a', 'b', 'c'});
    obj.comboBox18:setValue("a");
    obj.comboBox18:setField("VisibBarrinha3");
    obj.comboBox18:setMargins({left=4});
    obj.comboBox18:setName("comboBox18");

    obj.comboBox19 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout19);
    obj.comboBox19:setAlign("left");
    obj.comboBox19:setFontSize(12);
    obj.comboBox19:setWidth(104);
    obj.comboBox19:setText("Tipo de Números");
    obj.comboBox19:setVertTextAlign("trailing");
    obj.comboBox19:setFontColor("white");
    obj.comboBox19:setField("NumerosBarrinha3");
    obj.comboBox19:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox19:setValues({'x', 'y'});
    obj.comboBox19:setValue("x");
    obj.comboBox19:setMargins({left=4});
    obj.comboBox19:setName("comboBox19");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout19);
    obj.dataLink7:setField("CorBarrinha3");
    obj.dataLink7:setDefaultValue("#808080");
    obj.dataLink7:setName("dataLink7");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.Config);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(18);
    obj.layout21:setMargins({top=4});
    obj.layout21:setName("layout21");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout21);
    obj.label63:setAlign("left");
    obj.label63:setFontSize(12);
    obj.label63:setText("Barrinha 1:");
    obj.label63:setHorzTextAlign("trailing");
    obj.label63:setWidth(64);
    obj.label63:setName("label63");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout21);
    obj.edit12:setAlign("left");
    obj.edit12:setFontSize(12);
    obj.edit12:setWidth(108);
    obj.edit12:setVertTextAlign("trailing");
    obj.edit12:setField("NomeBarrinha4");
    obj.edit12:setText("Barrinha 4");
    obj.edit12:setMargins({left=4});
    obj.edit12:setName("edit12");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(26);
    obj.layout22:setMargins({left=4});
    obj.layout22:setName("layout22");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout22);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("white");
    obj.rectangle15:setHitTest(true);
    obj.rectangle15:setMargins({left=4, right=4});
    obj.rectangle15:setName("rectangle15");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.rectangle15);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle16:setHitTest(true);
    obj.rectangle16:setName("rectangle16");

    obj.CorBarrinha4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha4:setParent(obj.rectangle16);
    obj.CorBarrinha4:setName("CorBarrinha4");
    obj.CorBarrinha4:setColor("#808080");
    obj.CorBarrinha4:setAlign("client");
    obj.CorBarrinha4:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha4:setHitTest(true);

    obj.comboBox20 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout21);
    obj.comboBox20:setAlign("left");
    obj.comboBox20:setFontSize(12);
    obj.comboBox20:setWidth(82);
    obj.comboBox20:setText("Visibilidade");
    obj.comboBox20:setFontColor("white");
    obj.comboBox20:setVertTextAlign("trailing");
    obj.comboBox20:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox20:setValues({'a', 'b', 'c'});
    obj.comboBox20:setValue("a");
    obj.comboBox20:setField("VisibBarrinha4");
    obj.comboBox20:setMargins({left=4});
    obj.comboBox20:setName("comboBox20");

    obj.comboBox21 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout21);
    obj.comboBox21:setAlign("left");
    obj.comboBox21:setFontSize(12);
    obj.comboBox21:setWidth(104);
    obj.comboBox21:setText("Tipo de Números");
    obj.comboBox21:setVertTextAlign("trailing");
    obj.comboBox21:setFontColor("white");
    obj.comboBox21:setField("NumerosBarrinha4");
    obj.comboBox21:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox21:setValues({'x', 'y'});
    obj.comboBox21:setValue("x");
    obj.comboBox21:setMargins({left=4});
    obj.comboBox21:setName("comboBox21");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout21);
    obj.dataLink8:setField("CorBarrinha4");
    obj.dataLink8:setDefaultValue("#808080");
    obj.dataLink8:setName("dataLink8");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.Config);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(24);
    obj.layout23:setMargins({top=8});
    obj.layout23:setName("layout23");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout23);
    obj.checkBox1:setMargins({left=4});
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setField("EnviarNoChat");
    obj.checkBox1:setWidth(180);
    obj.checkBox1:setFontSize(12);
    obj.checkBox1:setText("Enviar alterações ao chat");
    obj.checkBox1:setName("checkBox1");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout23);
    obj.dataLink9:setField("EnviarNoChat");
    obj.dataLink9:setDefaultValue("false");
    obj.dataLink9:setName("dataLink9");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout23);
    obj.button14:setAlign("right");
    obj.button14:setWidth(80);
    obj.button14:setText("OK!");
    obj.button14:setMargins({right=8});
    obj.button14:setName("button14");

    obj.SelectCor = gui.fromHandle(_obj_newObject("popup"));
    obj.SelectCor:setParent(obj.Config);
    obj.SelectCor:setName("SelectCor");
    obj.SelectCor:setWidth(192);
    obj.SelectCor:setHeight(100);

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.SelectCor);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(24);
    obj.layout24:setName("layout24");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout24);
    obj.label64:setAlign("client");
    obj.label64:setText("Selecione a Cor:");
    obj.label64:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");
    obj.label64:setName("label64");

    obj.Nha = gui.fromHandle(_obj_newObject("layout"));
    obj.Nha:setParent(obj.SelectCor);
    obj.Nha:setName("Nha");
    obj.Nha:setAlign("client");
    obj.Nha:setMargins({left=10, right=10});
    obj.Nha:setHitTest(true);

    obj.Selected = gui.fromHandle(_obj_newObject("layout"));
    obj.Selected:setParent(obj.Nha);
    obj.Selected:setAlign("none");
    obj.Selected:setName("Selected");
    obj.Selected:setWidth(20);
    obj.Selected:setHeight(20);

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.Selected);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("white");
    obj.rectangle17:setName("rectangle17");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.rectangle17);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle18:setName("rectangle18");

    obj.Flow = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.Flow:setParent(obj.Nha);
    obj.Flow:setName("Flow");
    obj.Flow:setAlign("client");
    obj.Flow:setOrientation("horizontal");
    obj.Flow:setMaxControlsPerLine(8);
    obj.Flow:setHitTest(true);
    obj.Flow:setCanFocus(true);

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.Flow);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(20);
    obj.layout25:setHeight(20);
    obj.layout25:setHitTest(true);
    obj.layout25:setName("layout25");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout25);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle19:setHitTest(true);
    obj.rectangle19:setColor("#acacac");
    obj.rectangle19:setName("rectangle19");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.Flow);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(20);
    obj.layout26:setHeight(20);
    obj.layout26:setHitTest(true);
    obj.layout26:setName("layout26");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout26);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle20:setHitTest(true);
    obj.rectangle20:setColor("#5959ff");
    obj.rectangle20:setName("rectangle20");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.Flow);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(20);
    obj.layout27:setHeight(20);
    obj.layout27:setHitTest(true);
    obj.layout27:setName("layout27");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout27);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle21:setHitTest(true);
    obj.rectangle21:setColor("#59ff59");
    obj.rectangle21:setName("rectangle21");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.Flow);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(20);
    obj.layout28:setHeight(20);
    obj.layout28:setHitTest(true);
    obj.layout28:setName("layout28");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout28);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle22:setHitTest(true);
    obj.rectangle22:setColor("#ff5959");
    obj.rectangle22:setName("rectangle22");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.Flow);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(20);
    obj.layout29:setHeight(20);
    obj.layout29:setHitTest(true);
    obj.layout29:setName("layout29");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout29);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle23:setHitTest(true);
    obj.rectangle23:setColor("#ff59ff");
    obj.rectangle23:setName("rectangle23");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.Flow);
    obj.layout30:setAlign("left");
    obj.layout30:setWidth(20);
    obj.layout30:setHeight(20);
    obj.layout30:setHitTest(true);
    obj.layout30:setName("layout30");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout30);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle24:setHitTest(true);
    obj.rectangle24:setColor("#ffac59");
    obj.rectangle24:setName("rectangle24");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.Flow);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(20);
    obj.layout31:setHeight(20);
    obj.layout31:setHitTest(true);
    obj.layout31:setName("layout31");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout31);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle25:setHitTest(true);
    obj.rectangle25:setColor("#ffff59");
    obj.rectangle25:setName("rectangle25");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.Flow);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(20);
    obj.layout32:setHeight(20);
    obj.layout32:setHitTest(true);
    obj.layout32:setName("layout32");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout32);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle26:setHitTest(true);
    obj.rectangle26:setColor("#59ffff");
    obj.rectangle26:setName("rectangle26");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.Flow);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(20);
    obj.layout33:setHeight(20);
    obj.layout33:setHitTest(true);
    obj.layout33:setName("layout33");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout33);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle27:setHitTest(true);
    obj.rectangle27:setColor("#ffd159");
    obj.rectangle27:setName("rectangle27");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.Flow);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(20);
    obj.layout34:setHeight(20);
    obj.layout34:setHitTest(true);
    obj.layout34:setName("layout34");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout34);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle28:setHitTest(true);
    obj.rectangle28:setColor("#5990ff");
    obj.rectangle28:setName("rectangle28");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.Flow);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(20);
    obj.layout35:setHeight(20);
    obj.layout35:setHitTest(true);
    obj.layout35:setName("layout35");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout35);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle29:setHitTest(true);
    obj.rectangle29:setColor("#f4c264");
    obj.rectangle29:setName("rectangle29");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.Flow);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(20);
    obj.layout36:setHeight(20);
    obj.layout36:setHitTest(true);
    obj.layout36:setName("layout36");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout36);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle30:setHitTest(true);
    obj.rectangle30:setColor("#de7a7a");
    obj.rectangle30:setName("rectangle30");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.Flow);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(20);
    obj.layout37:setHeight(20);
    obj.layout37:setHitTest(true);
    obj.layout37:setName("layout37");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout37);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle31:setHitTest(true);
    obj.rectangle31:setColor("#cb83d6");
    obj.rectangle31:setName("rectangle31");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.Flow);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(20);
    obj.layout38:setHeight(20);
    obj.layout38:setHitTest(true);
    obj.layout38:setName("layout38");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout38);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle32:setHitTest(true);
    obj.rectangle32:setColor("#f3658a");
    obj.rectangle32:setName("rectangle32");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.Flow);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(20);
    obj.layout39:setHeight(20);
    obj.layout39:setHitTest(true);
    obj.layout39:setName("layout39");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout39);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle33:setHitTest(true);
    obj.rectangle33:setColor("#8cecb3");
    obj.rectangle33:setName("rectangle33");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.Flow);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(20);
    obj.layout40:setHeight(20);
    obj.layout40:setHitTest(true);
    obj.layout40:setName("layout40");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout40);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle34:setHitTest(true);
    obj.rectangle34:setColor("#ed846b");
    obj.rectangle34:setName("rectangle34");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.SelectCor);
    obj.layout41:setAlign("bottom");
    obj.layout41:setHeight(24);
    obj.layout41:setName("layout41");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout41);
    obj.button15:setAlign("right");
    obj.button15:setText("OK!");
    obj.button15:setMargins({right=4});
    obj.button15:setName("button15");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.Listade_NPC_Dock);
    obj.rectangle35:setColor("#0f0f0f");
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setPadding({top=4, left=4});
    obj.rectangle35:setName("rectangle35");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle35);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(24);
    obj.layout42:setName("layout42");

    obj.NovaAbadeNPCs = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.NovaAbadeNPCs:setParent(obj.layout42);
    obj.NovaAbadeNPCs:setMargins({left=4});
    obj.NovaAbadeNPCs:setAlign("left");
    obj.NovaAbadeNPCs:setWidth(24);
    obj.NovaAbadeNPCs:setName("NovaAbadeNPCs");
    obj.NovaAbadeNPCs:setImageChecked("/GerenciadorDeCampanha/images/addlista.png");
    obj.NovaAbadeNPCs:setImageUnchecked("/GerenciadorDeCampanha/images/addlista.png");

    obj.comboBoxFalsa = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.comboBoxFalsa:setParent(obj.layout42);
    obj.comboBoxFalsa:setAlign("left");
    obj.comboBoxFalsa:setMargins({left=8});
    obj.comboBoxFalsa:setName("comboBoxFalsa");
    obj.comboBoxFalsa:setWidth(128);
    obj.comboBoxFalsa:setHeight(20);
    obj.comboBoxFalsa:setHitTest(true);

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.comboBoxFalsa);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("#333333");
    obj.rectangle36:setXradius(2);
    obj.rectangle36:setYradius(2);
    obj.rectangle36:setHitTest(true);
    obj.rectangle36:setName("rectangle36");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle36);
    obj.label65:setFontColor("white");
    obj.label65:setAlign("client");
    obj.label65:setMargins({left=8});
    obj.label65:setVertTextAlign("center");
    obj.label65:setText("Opções");
    obj.label65:setField("NomeDaOpcao");
    obj.label65:setHitTest(true);
    obj.label65:setName("label65");

    obj.path1 = gui.fromHandle(_obj_newObject("path"));
    obj.path1:setParent(obj.rectangle36);
    obj.path1:setAlign("right");
    obj.path1:setWidth(16);
    obj.path1:setMargins({right=6, left=6, top=8, bottom=8});
    obj.path1:setColor("orange");
    obj.path1:setPathData("M 100 100 L 300 100 L 200 300 z");
    obj.path1:setName("path1");

    obj.dcsMain = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dcsMain:setParent(obj.rectangle35);
    obj.dcsMain:setAlign("client");
    obj.dcsMain:setName("dcsMain");

    obj.ListaDeNPCs = gui.fromHandle(_obj_newObject("form"));
    obj.ListaDeNPCs:setParent(obj.dcsMain);
    obj.ListaDeNPCs:setName("ListaDeNPCs");
    obj.ListaDeNPCs:setAlign("client");
    obj.ListaDeNPCs:setTheme("dark");


		function InvocarOPopupForm(node)
			self.recordNode.scopeNode = node;
			self.dropDownFalso2.scopeNode = sheet;
			self.dropDownFalso2:show();
		end;
	
		function FecharOPopupForm()
			self.dropDownFalso2:close();
		end;
	
		function autoCalcular()
			jogz2 = {}
			mesaDaFicha = rrpg.getMesaDe(sheet);
				for i = 1, #mesaDaFicha.jogadores, 1 do
					jogz2[i] = mesaDaFicha.jogadores[i].login;
				end;
			self.dropDownFalso2.height = (24 * (#jogz2 + 1))		 
			self.opcoesFalsas2:sort();
		end;
		
		function chamarListaDeJogadores()
			if sheet ~= nil then
				self.opcoesFalsas2:sort();
				local nodes = ndb.getChildNodes(sheet.opcoesFalsas2)
				mesaDaFicha = rrpg.getMesaDe(sheet);
				jogz = {}
				jogz[1] = "Nenhum"
				jogz2 = {}
				for i = 1, #nodes, 1 do
					jogz[i+1] = (nodes[i].NomeDaOpcao or "");
				end;
				for i = 1, #mesaDaFicha.jogadores, 1 do
					jogz2[i] = mesaDaFicha.jogadores[i].login;
				end;
				if jogz2 ~= jogz then
					if #nodes >= 2 then
						for i = #nodes, 1, -1 do
						setTimeout( function()
							ndb.deleteNode(nodes[i])
						end,2)
						end;
					end;
					local node = nil;
						node = self.opcoesFalsas2:append();
					setTimeout( function()
					for i = 1, #jogz2, 1 do
						node = self.opcoesFalsas2:append();
					end;
					end,10)
				else
				end;
				setTimeout( function()
					local nodes2 = ndb.getChildNodes(sheet.opcoesFalsas2)
					for i = 1, #nodes2, 1 do
						if i == 1 then
							nodes2[i].NomeDaOpcao = "Nenhum"
							nodes2[1].CodigoInterno = 1;
						else
							nodes2[i].NomeDaOpcao = jogz2[i-1]
							nodes2[i].CodigoInterno = 2;
							nodes2[i].CodigoInterno = 2;
						end
					end;
					autoCalcular();
				end, 20)
			end
		end;
	


    obj.recordNode = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.recordNode:setParent(obj.ListaDeNPCs);
    obj.recordNode:setName("recordNode");
    obj.recordNode:setVisible(false);

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.ListaDeNPCs);
    obj.layout43:setVisible(false);
    obj.layout43:setName("layout43");

    obj.dropDownFalso2 = gui.fromHandle(_obj_newObject("popupForm"));
    obj.dropDownFalso2:setParent(obj.layout43);
    obj.dropDownFalso2:setName("dropDownFalso2");
    obj.dropDownFalso2:setTitle("Jogador?");
    obj.dropDownFalso2:setWidth(128);
    obj.dropDownFalso2:setHeight(128);

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.dropDownFalso2);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.opcoesFalsas2 = gui.fromHandle(_obj_newObject("recordList"));
    obj.opcoesFalsas2:setParent(obj.scrollBox5);
    obj.opcoesFalsas2:setMargins({left=8});
    obj.opcoesFalsas2:setVisible(true);
    obj.opcoesFalsas2:setAlign("top");
    obj.opcoesFalsas2:setTemplateForm("OpcaoDaComboboxFalsa2");
    obj.opcoesFalsas2:setField("opcoesFalsas2");
    obj.opcoesFalsas2:setName("opcoesFalsas2");
    obj.opcoesFalsas2:setLayout("verticalTiles");
    obj.opcoesFalsas2:setAutoHeight(true);
    obj.opcoesFalsas2:setSelectable(true);
    obj.opcoesFalsas2:setMinQt(0);

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.ListaDeNPCs);
    obj.rectangle37:setColor("#0f0f0f");
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setName("rectangle37");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle37);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(24);
    obj.layout44:setMargins({top=4, left=2});
    obj.layout44:setName("layout44");

    obj.Configurar = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Configurar:setParent(obj.layout44);
    obj.Configurar:setMargins({left=4});
    obj.Configurar:setAlign("left");
    obj.Configurar:setWidth(24);
    obj.Configurar:setHint("Configurações da Lista");
    obj.Configurar:setName("Configurar");
    obj.Configurar:setImageChecked("/GerenciadorDeCampanha/images/config.png");
    obj.Configurar:setImageUnchecked("/GerenciadorDeCampanha/images/config.png");

    obj.NovoNPC = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.NovoNPC:setParent(obj.layout44);
    obj.NovoNPC:setMargins({left=4});
    obj.NovoNPC:setAlign("left");
    obj.NovoNPC:setWidth(24);
    obj.NovoNPC:setHint("Adicionar novo NPC");
    obj.NovoNPC:setName("NovoNPC");
    obj.NovoNPC:setImageChecked("/GerenciadorDeCampanha/images/addnpc.png");
    obj.NovoNPC:setImageUnchecked("/GerenciadorDeCampanha/images/addnpc.png");

    obj.Organizar = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Organizar:setParent(obj.layout44);
    obj.Organizar:setMargins({left=4});
    obj.Organizar:setAlign("left");
    obj.Organizar:setWidth(24);
    obj.Organizar:setHint("Ordenar Lista de NPCs");
    obj.Organizar:setName("Organizar");
    obj.Organizar:setImageChecked("/GerenciadorDeCampanha/images/organize.png");
    obj.Organizar:setImageUnchecked("/GerenciadorDeCampanha/images/organize.png");

    obj.MainClient = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.MainClient:setParent(obj.rectangle37);
    obj.MainClient:setName("MainClient");
    obj.MainClient:setAlign("client");
    obj.MainClient:setMargins({top=2});

    obj.rclListaDeNPC = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDeNPC:setParent(obj.MainClient);
    obj.rclListaDeNPC:setName("rclListaDeNPC");
    obj.rclListaDeNPC:setLayout("verticalTiles");
    obj.rclListaDeNPC:setField("campoDosNPC");
    obj.rclListaDeNPC:setTemplateForm("CaixaFichaNPC");
    obj.rclListaDeNPC:setAlign("none");
    obj.rclListaDeNPC:setAutoHeight(true);
    obj.rclListaDeNPC:setSelectable(true);
    obj.rclListaDeNPC:setMinQt(0);

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle37);
    obj.layout45:setAlign("bottom");
    obj.layout45:setHeight(32);
    obj.layout45:setName("layout45");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout45);
    obj.label66:setAlign("right");
    lfm_setPropAsString(obj.label66, "fontStyle",  "italic");
    obj.label66:setFontSize(12);
    obj.label66:setOpacity(0.8);
    obj.label66:setAutoSize(true);
    obj.label66:setText("Criado por Mia\nEditado por Ambesek");
    obj.label66:setName("label66");


			function DEC_HEX(IN)
				local B,K,OUT,I,D = 16,"0123456789ABCDEF","",0
				while IN > 0 do
					I=I+1
					D = (IN % B) + 1
					IN = math.floor(IN/B)
					
					OUT = string.sub(K,D,D) .. OUT
				end
				return OUT
			end;
		
			function DonoMestre(node, foioscript)
				if sheet ~= nil then
					node = (node or sheet);
					foioscript = (foioscript or false)
					local personagem = rrpg.getPersonagemDe(sheet);                                
					
					if (personagem ~= nil) then
						local mesa = personagem.mesa;

						if ndb.testPermission(node, "writePermissions") then               
							return true;
						else
							return false;
					   end;
					else
						
						return ndb.testPermission(node, "writePermissions");
					end; 
				end;
			end;

			function EnviarMudanca(barrinhaid, blockoverlay, nomepers, nome, valor, valormax, pc, pcmax)
				if sheet ~= nil then
					if not blockoverlay then
						publico = GetBarrinhaVisivel(blockoverlay, barrinhaid);
					else
						publico = false
					end;
					porcentagem = not (GetBarrinhaNumeros(barrinhaid));
					nome = tostring(nome or GetBarrinhaNome(barrinhaid));
					
					local text = "[§K2]" .. tostring(nome) .. "[§K3] de [§K2]" .. tostring(nomepers) .. "[§K3]: ";
					
					if tonumber(valor) >= 0 then
						valor = "+" .. tostring(valor);
					end;
					if tonumber(valormax) >= 0 then
						valormax = "+" .. tostring(valormax);
					end;
					if tonumber(pc) >= 0 then
						pc = "+" .. tostring(pc);
					end;
					if tonumber(pcmax) >= 0 then
						pcmax = "+" .. tostring(pcmax);
					end;
					
					if publico then
						if not porcentagem then
							if tonumber(valormax) == 0 then
								text = text .. valor;
							else
								text = text .. valor .. "/" .. valormax;
							end;
						else
							if tonumber(valormax) == 0 then
								text = text .. pc .. "%";
							else
								text = text .. pc .. "%" .. "/" .. pcmax .. "%";
							end;
						end;
					else
						if tonumber(valor) >= 0 then
							valor = "+??";
						else 
							valor = "-??"
						end;
						if tonumber(valormax) >= 0 then
							valormax = "+??";
						else 
							valormax = "-??"
						end;
						
						if not porcentagem then
							if tonumber(valormax) == 0 then
								text = text .. valor;
							else
								text = text .. valor .. "/" .. valormax;
							end;
						else
							if tonumber(valormax) == 0 then
								text = text .. valor .. "%";
							else
								text = text .. valor .. "%" .. "/" .. valormax .. "%";
							end;
						end;
					end;
					
					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
					if mesaDoPersonagem ~= nil then
						mesaDoPersonagem.activeChat:enviarMensagem(text);
					end;
				end;
			end;
			
			function RequestReload(mode)
				if sheet ~= nil then
					if mode == "begin" then
						self.rclListaDeNPC:beginUpdate();
						self.rclListaDeNPC.visible = false;
					elseif mode == "end" then
						self.rclListaDeNPC.visible = true;
						self.rclListaDeNPC:endUpdate();
					end;
				end;
			end;
		


    obj.dropDownFalso = gui.fromHandle(_obj_newObject("popup"));
    obj.dropDownFalso:setParent(obj.Listade_NPC_Dock);
    obj.dropDownFalso:setName("dropDownFalso");
    obj.dropDownFalso:setWidth(128);
    obj.dropDownFalso:setHeight(128);
    obj.dropDownFalso:setBackOpacity(0);
    obj.dropDownFalso:setNodeObject({sheet});
    obj.dropDownFalso:setHitTest(true);

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.dropDownFalso);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.opcoesFalsas = gui.fromHandle(_obj_newObject("recordList"));
    obj.opcoesFalsas:setParent(obj.scrollBox6);
    obj.opcoesFalsas:setVisible(true);
    obj.opcoesFalsas:setAlign("client");
    obj.opcoesFalsas:setTemplateForm("OpcaoDaComboboxFalsa");
    obj.opcoesFalsas:setField("opcoesFalsas");
    obj.opcoesFalsas:setName("opcoesFalsas");
    obj.opcoesFalsas:setLayout("verticalTiles");
    obj.opcoesFalsas:setAutoHeight(true);
    obj.opcoesFalsas:setSelectable(true);
    obj.opcoesFalsas:setMinQt(1);

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.Listade_NPC_Dock);
    obj.dataLink10:setField("opcaoEscolhida");
    obj.dataLink10:setDefaultValue("Opções");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.Listade_NPC_Dock);
    obj.dataLink11:setFields({'VisibBarrinha1', 'VisibBarrinha2', 'VisibBarrinha3', 'VisibBarrinha4'});
    obj.dataLink11:setDefaultValues({'a', 'a', 'a', 'a'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.Listade_NPC_Dock);
    obj.dataLink12:setFields({'NumerosBarrinha1', 'NumerosBarrinha2', 'NumerosBarrinha3', 'NumerosBarrinha4'});
    obj.dataLink12:setDefaultValues({'x', 'x', 'x', 'x'});
    obj.dataLink12:setName("dataLink12");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Iniciativas");
    obj.tab4:setName("tab4");

    obj.frmCombatTracker = gui.fromHandle(_obj_newObject("form"));
    obj.frmCombatTracker:setParent(obj.tab4);
    obj.frmCombatTracker:setName("frmCombatTracker");
    obj.frmCombatTracker:setFormType("tablesDock");
    obj.frmCombatTracker:setDataType("RRPG.TB.COMBAT.TRACKER.v1");
    obj.frmCombatTracker:setTitle("Tracker de Combate");
    obj.frmCombatTracker:setAlign("client");


		local ATOR_VIEW_STATE_VISIVEL = 0;
		local ATOR_VIEW_STATE_PARC_VISIVEL = 1;
		local ATOR_VIEW_STATE_INVISIVEL = 2;
	
		local function getAtoresNDB()
			if sheet.atores == nil then
				sheet.atores = {};
			end;
			
			return sheet.atores;
		end;	

		local function getAtoresNodes()
			local atores = getAtoresNDB();
			return ndb.getChildNodes(atores);
		end;
		
		function self:souMestre()
			local mesa = rrpg.getMesaDe(sheet);

			if mesa ~= nil then
				local j = mesa.meuJogador;
				
				if j ~= nil then
					return j.isMestre;
				else
					return false;
				end;
			else
				return false;
			end;
		end;
		
		function self:narrar(msg)
			local mesa = rrpg.getMesaDe(sheet);
			
			if mesa ~= nil then
				local chat = mesa.chat;
				
				if chat ~= nil then
					chat:enviarNarracao(msg);
				end;
			end;
		end;
		
		function self:escrever(msg)
			local mesa = rrpg.getMesaDe(sheet);
			
			if mesa ~= nil then
				local chat = mesa.chat;
				
				if chat ~= nil then
					chat:escrever(msg);
				end;
			end;
		end;
		
		function self:getNomeColoridoDe(nodeAtor)
			local corAsNumero;
			local fof = nodeAtor.fof;
			
			if fof == 1 then
				corAsNumero = 3; -- Amigo
			elseif fof == 2 then
				corAsNumero = 8;  -- Neutro
			elseif fof == 3 then
				corAsNumero = 4;  -- Inimigo
			else
				corAsNumero = 14; -- Não definido
			end;	

			return "[§K" .. corAsNumero .. "]" .. nodeAtor.nome;			
		end;
		
		function self:ativarTurnoDe(node)
			if not self:souMestre() then
				return nil;
			end;		
		
			local atores = getAtoresNodes();
			local oldEstavaNaVez = node.vez;
			
			for i = 1, #atores, 1 do
				local a = atores[i];
				
				if a ~= node then
					a.vez = false;
				end;
			end;
			
			if node ~= nil then
				node.vez = true;
				self.rclAtores:scrollToNode(node);
			end;
						
			if (type(node.nome) == "string" and node.nome ~= "") and
               (not oldEstavaNaVez)	then
				local headerTralha = "[§K15] >>";
				local footerTralha = "";
				local notificacaoDeTurno = "[§K1]" .. headerTralha .. "[§K1] Turno de " .. self:getNomeColoridoDe(node) .. "[§K1] " .. footerTralha;
			
				if (ndb.getPermission(node, "group", "espectadores", "read") ~= "deny") then			   
					self:narrar(notificacaoDeTurno);
				else					
					self:escrever(notificacaoDeTurno);
				end;
			end;
		end;
		
		local scheduledSort = false;
		
		function self:reordenar()
			self.rclAtores:sort();
			scheduledSort = false;
		end;
		
		function self:agendarReordenacao()
			if not scheduledSort then
				scheduledSort = true;
				
				setTimeout(function()
							  if scheduledSort then
								self:reordenar();
								scheduledSort = false;
							  end;							  
						   end, 200);
			end;
		end;	
		
		function self:compareNodes(nodeA, nodeB)
			local r = (tonumber(nodeB.iniciativa) or 0) - (tonumber(nodeA.iniciativa) or 0);
			
			if r == 0 then
				r = (nodeA._id or 0) - (nodeB._id or 0);
			end;
			
			return r;		
		end;
		
		function self:avancarRelogioDeAtor(ator, relogioAtual, relogioOld)
			if ator.dadosSensiveis ~= nil and ator.dadosSensiveis.efeitos ~= nil then
				local lEfeitos = ndb.getChildNodes(ator.dadosSensiveis.efeitos);
				
				for i = 1, #lEfeitos, 1 do
					local ef = lEfeitos[i];
					local duracao = tonumber(ef.duracao);
										
					if (duracao ~= nil) and (duracao > 0) then
						local duracaoReal = tonumber(ef.duracaoReal);					
					
						if duracaoReal == nil then
							duracaoReal = duracao;
							ef.duracaoReal = duracaoReal;
						end;
						
						local duracaoRealRestante = duracaoReal - (relogioAtual - relogioOld);
						local constanteMargemSuperior = 0.000001;
																		
						if duracaoRealRestante < constanteMargemSuperior then
							local nomeEfeito = ef.descricao;
							ndb.deleteNode(ef);
							
							if nomeEfeito ~= nil and ator.nome ~= nil then
								local fof = ator.fof or 0;
								local enviarNarracao = (ndb.getPermission(ator, "group", "espectadores", "read") ~= "deny") and
								                       (fof ~= 3) and (ator.visibilityState ~= ATOR_VIEW_STATE_PARC_VISIVEL); -- não é inimigo;
													   
								local notificacao = "[§K15] >> [§K1]O efeito [§K7]" .. nomeEfeito .. "[§K1] de " .. self:getNomeColoridoDe(ator) .. "[§K1] chegou ao fim";
								
								if enviarNarracao then
									self:narrar(notificacao);
								else
									self:escrever(notificacao);
								end;
							end;
						else
							ef.duracaoReal = duracaoRealRestante;
							local duracaoRestanteArredondada = math.ceil(duracaoRealRestante - constanteMargemSuperior);							
						
							if duracaoRestanteArredondada ~= duracao then
								ef.duracao = duracaoRestanteArredondada;
							end;
						end;						
						
					end;					
				end;
			end;
		end;
		
		function self:avancarRelogio(rodadas)
			-- esta função avança o relógio do combat tracker, podendo remover automaticamente os efeitos
			-- dos atores
			--  OBS: O parâmetro "rodadas" virá com valor "quebrado", exemplo: 0.5, 0.3, etc..
							
			rodadas = rodadas or 1.0;
			local relogioAtual = tonumber(sheet.relogio) or 0.0;
			local relogioOld = relogioAtual;
			local atores = getAtoresNodes();			
			
			relogioAtual = relogioAtual + rodadas;
			
			for i = 1, #atores, 1 do
				self:avancarRelogioDeAtor(atores[i], relogioAtual, relogioOld);
			end;
						
			sheet.relogio = relogioAtual;
		end;
		
		function self:proximoTurno()
			if not self:souMestre() then
				return;
			end;
		
			local atores = getAtoresNodes();
			local atorComVez = nil;
			local idxAtorComVez = nil;
			local novaRodada = false;
			
			if #atores > 0 then			
				table.sort(atores,
					function(nodeA, nodeB)
						return self:compareNodes(nodeA, nodeB) < 0;
					end);
			
				for i = 1, #atores, 1 do
					local a = atores[i];
					
					if a.vez then
						atorComVez = a;
						idxAtorComVez = i;	
						break;					
					end;
				end;			

				if idxAtorComVez == nil then
					idxAtorComVez = 1;
				else					
					idxAtorComVez = idxAtorComVez + 1;
				end;
				
				if idxAtorComVez < 1 then
					idxAtorComVez = 1;
				elseif idxAtorComVez > #atores then
					idxAtorComVez = 1;
					novaRodada = true;
				end;
				
				self:ativarTurnoDe(atores[idxAtorComVez]);
				
				if novaRodada then
					sheet.rodada = (tonumber(sheet.rodada or 0) or 0) + 1;
				end;
			end;
			
			if tonumber(sheet.rodada) == nil then
				sheet.rodada = 1;
			end;
			
			if #atores > 0 then
				self:avancarRelogio(1 / #atores);
			else
				self:avancarRelogio(1);			
			end;
		end;
		
		function self:tratarNovoAtor(node)
			if node ~= nil then
				local g = (sheet.generator or 0) + 1;
				sheet.generator = g;				
				node._id = g;
			end;
		end;
		
		function self:criarNovoAtor()
			local novoNode = nil;
			ndb.beginUpdate(sheet);
			
			tryFinally(function()
					novoNode = self.rclAtores:append();
					self:tratarNovoAtor(novoNode);
				end,
				
				function()
					ndb.endUpdate(sheet);
				end);
				
			return novoNode;
		end;
		
		function self:limpar()		
			local n = sheet;
			
			dialogs.confirmYesNo("Deseja realmente limpar o Tracker de Combate?",
				function(confirmado)
					if confirmado then
						n.atores = {};
						n.rodada = 1;
						n.relogio = 0;
					end;
				end);
		end;
		
		function self:exibirMenuDoAtor(node, form)
			self.popAtor.node = node;
			self.popAtorForm = form;
			self.popAtor:show("mouseCenter", form);
		end;
		
		function self:scrollToAtor(node)
			self.rclAtores:scrollToNode(node);
		end;

		self.listenersAtivo = false;
		self.listenerHandleChatCommand = nil;
		self.listenerListChatCommands = nil;
			
		local function verificarEstadoMsgEvents()			
			local deveUsarListeners = self.visible and sheet ~= nil;
			local mesaAcoplada = rrpg.getMesaDe(sheet);
			
			if deveUsarListeners and not self.listenersAtivo and mesaAcoplada ~= nil then				
			
				-- ativar listeners
				self.listenersAtivo = true;
				
				self.listenerHandleChatCommand = rrpg.messaging.listen("HandleChatCommand", 
					function(msg)
						if (msg.comando == ">>") and (self:souMestre()) then
							self:proximoTurno();
							msg.response = {handled = true};
						end;					
					end, {mesa = mesaAcoplada});
					
				self.listenerListChatCommands = rrpg.messaging.listen("ListChatCommands", 
					function(msg)
						if self:souMestre() then
							msg.response = {{comando="/>>", descricao="Iniciar o próximo turno (Tracker de Combate)"}};
						end;						
					end, {mesa = mesaAcoplada});					
				
			elseif not deveUsarListeners and self.listenersAtivo then
				-- desativar listeners;				
				self.listenersAtivo = false;
				rrpg.messaging.unlisten(self.listenerHandleChatCommand);
				rrpg.messaging.unlisten(self.listenerListChatCommands);				
				self.listenerHandleChatCommand = nil;
				self.listenerListChatCommands = nil;				
			end
		end;		
			
		self.onScopeNodeChanged = verificarEstadoMsgEvents;							
		self.onShow = verificarEstadoMsgEvents;
		self.onHide = verificarEstadoMsgEvents;
		
		local function dropPersonagemActor(personagem)
			if personagem == nil then
				return;
			end;
		
			local atores = ndb.getChildNodes(getAtoresNDB());
			local atorDoPersonagem = nil;	
		    local chavePer = personagem.codigoInterno;

			for i = 1, #atores, 1 do
				local a = atores[i];
				
				if a.chavePer ~= nil and a.chavePer == chavePer then
					atorDoPersonagem = a;
					break;
				end;
			end;
			
			if atorDoPersonagem == nil then
				atorDoPersonagem = self:criarNovoAtor();
				atorDoPersonagem.chavePer = chavePer;				
			end;
			
			atorDoPersonagem.nome = personagem.nome;
			
			if personagem.loginDono ~= "" then			
				atorDoPersonagem.fof = 1;
			else
				atorDoPersonagem.fof = 2;
			end;
			
			return atorDoPersonagem;			
		end;
		
		local function dropJogadorActor(jogador)					
			local mesa = rrpg.getMesaDe(jogador);
			
			if mesa ~= nil then
				local chavePer = jogador.personagemPrincipal;
				local personagem = mesa:findBibliotecaItem(chavePer);
				
				if personagem ~= nil then
					return dropPersonagemActor(personagem);					
				end;							
			end;
		
			local atores = ndb.getChildNodes(getAtoresNDB());
			local atorDoJogador = nil;
			local loginJogador = string.lower(jogador.login);

			for i = 1, #atores, 1 do
				local a = atores[i];
				
				if a.login ~= nil and string.lower(a.login) == loginJogador then
					atorDoJogador = a;
					break;
				end;
			end;
			
			if atorDoJogador == nil then
				atorDoJogador = self:criarNovoAtor();
				atorDoJogador.login = loginJogador;				
			end;
			
			atorDoJogador.nome = jogador.nick;
			atorDoJogador.fof = 1;
			
			return atorDoJogador;
		end;
		
		function self.handleStartDrop(drop, x, y, drag)
			drop:addAction('characters',
				function(value)
					for i = 1, #value, 1 do
						dropPersonagemActor(value[i]);
					end
				end);		
		
			drop:addAction('character',
				function(value)
					dropPersonagemActor(value);
				end);		
		
			drop:addAction('players',
				function(value)
					for i = 1, #value, 1 do
						dropJogadorActor(value[i]);
					end
				end);		
		
			drop:addAction('player',
				function(value)
					dropJogadorActor(value);
				end);
		end;
		
		function self:createDraggerForAtor(ator)
			local tracker = self;
		
			return function(drag, x, y)
					  drag:addData('text', tostring(ator.nome));
					  local mesa = rrpg.getMesaDe(tracker);
					  
					  if mesa ~= nil then
						local jogador = mesa:findJogador(tostring(ator.login or ""));
						
						if jogador ~= nil then
							drag:addData('player', jogador);
						end;
						
						local personagem = mesa:findBibliotecaItem(tonumber(ator.chavePer) or -1);
						
						if personagem ~= nil then
							drag:addData('character', personagem);
						end;
					  end;					  
				   end;
		end;
	


    obj.layTopTracker = gui.fromHandle(_obj_newObject("layout"));
    obj.layTopTracker:setParent(obj.frmCombatTracker);
    obj.layTopTracker:setName("layTopTracker");
    obj.layTopTracker:setAlign("top");
    obj.layTopTracker:setHeight(18);
    obj.layTopTracker:setMargins({left=2, right=2, top=2});

    obj.btnAddAtor = gui.fromHandle(_obj_newObject("button"));
    obj.btnAddAtor:setParent(obj.layTopTracker);
    obj.btnAddAtor:setName("btnAddAtor");
    obj.btnAddAtor:setText("");
    obj.btnAddAtor:setHint("Adicionar um novo ator ao Tracker");
    obj.btnAddAtor:setWidth(24);
    obj.btnAddAtor:setAlign("left");
    obj.btnAddAtor:setMargins({left=2, right=2});

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.btnAddAtor);
    obj.image1:setAlign("client");
    obj.image1:setSRC("/GerenciadorDeCampanha/images/addIcon.png");
    obj.image1:setName("image1");

    obj.btnRoll = gui.fromHandle(_obj_newObject("button"));
    obj.btnRoll:setParent(obj.layTopTracker);
    obj.btnRoll:setName("btnRoll");
    obj.btnRoll:setText("R");
    obj.btnRoll:setAlign("left");
    obj.btnRoll:setHint("Faz os testes de iniciativa de todos.");
    obj.btnRoll:setWidth(24);
    obj.btnRoll:setMargins({left=2, right=2});

    obj.btnUpdate = gui.fromHandle(_obj_newObject("button"));
    obj.btnUpdate:setParent(obj.layTopTracker);
    obj.btnUpdate:setName("btnUpdate");
    obj.btnUpdate:setText("A");
    obj.btnUpdate:setAlign("left");
    obj.btnUpdate:setHint("Atualiza a ordem de iniciativa");
    obj.btnUpdate:setWidth(24);
    obj.btnUpdate:setMargins({left=2, right=2});

    obj.btnAddAll = gui.fromHandle(_obj_newObject("button"));
    obj.btnAddAll:setParent(obj.layTopTracker);
    obj.btnAddAll:setName("btnAddAll");
    obj.btnAddAll:setText("T");
    obj.btnAddAll:setAlign("left");
    obj.btnAddAll:setHint("Adiciona todos com +Jogador a lista.");
    obj.btnAddAll:setWidth(24);
    obj.btnAddAll:setMargins({left=2, right=2});

    obj.btnLimpar = gui.fromHandle(_obj_newObject("button"));
    obj.btnLimpar:setParent(obj.layTopTracker);
    obj.btnLimpar:setName("btnLimpar");
    obj.btnLimpar:setText("Limpar");
    obj.btnLimpar:setAlign("right");
    obj.btnLimpar:setWidth(60);
    obj.btnLimpar:setMargins({left=2, right=2});

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.frmCombatTracker);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(16);
    obj.layout46:setPadding({left=2, right=2});
    obj.layout46:setName("layout46");
    obj.layout46:setMargins({left=2, right=2});

    obj.layHeader0 = gui.fromHandle(_obj_newObject("layout"));
    obj.layHeader0:setParent(obj.layout46);
    obj.layHeader0:setName("layHeader0");
    obj.layHeader0:setWidth(23);
    obj.layHeader0:setAlign("left");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout46);
    obj.label67:setText(" Teste   Nome");
    obj.label67:setName("label67");
    obj.label67:setFontSize(11);
    obj.label67:setMargins({left=3});
    obj.label67:setWidth(28);
    obj.label67:setAlign("client");

    obj.layRightAlinedTitle = gui.fromHandle(_obj_newObject("layout"));
    obj.layRightAlinedTitle:setParent(obj.layout46);
    obj.layRightAlinedTitle:setName("layRightAlinedTitle");
    obj.layRightAlinedTitle:setAlign("right");
    obj.layRightAlinedTitle:setWidth(78);

    obj.labTitIniciativa = gui.fromHandle(_obj_newObject("label"));
    obj.labTitIniciativa:setParent(obj.layRightAlinedTitle);
    obj.labTitIniciativa:setName("labTitIniciativa");
    obj.labTitIniciativa:setText("Init");
    obj.labTitIniciativa:setHorzTextAlign("center");
    obj.labTitIniciativa:setFontSize(11);
    obj.labTitIniciativa:setMargins({left=3});
    obj.labTitIniciativa:setWidth(28);
    obj.labTitIniciativa:setAlign("left");

    obj.labTitFoF = gui.fromHandle(_obj_newObject("label"));
    obj.labTitFoF:setParent(obj.layRightAlinedTitle);
    obj.labTitFoF:setName("labTitFoF");
    obj.labTitFoF:setText("A/H");
    obj.labTitFoF:setHorzTextAlign("center");
    obj.labTitFoF:setFontSize(11);
    obj.labTitFoF:setMargins({left=3});
    obj.labTitFoF:setWidth(25);
    obj.labTitFoF:setAlign("left");


		if system.isMobile() then
			self.layTopTracker.height = 32;
			self.btnAddAtor.width = self.layTopTracker.height;
			self.layHeader0.width = 32;
			self.layRightAlinedTitle.width = 108;
			self.layRightAlinedTitle.width = 108;
			self.labTitFoF.width = 32;
			self.labTitIniciativa.width = 32;
		end;
	


    obj.rclAtores = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclAtores:setParent(obj.frmCombatTracker);
    obj.rclAtores:setName("rclAtores");
    obj.rclAtores:setAlign("client");
    obj.rclAtores:setField("atores");
    obj.rclAtores:setTemplateForm("frmAtorCombatTracker");
    obj.rclAtores:setMargins({top=1});

    obj.layTrackerBottom = gui.fromHandle(_obj_newObject("layout"));
    obj.layTrackerBottom:setParent(obj.frmCombatTracker);
    obj.layTrackerBottom:setName("layTrackerBottom");
    obj.layTrackerBottom:setAlign("bottom");
    obj.layTrackerBottom:setHeight(28);
    obj.layTrackerBottom:setMargins({top=2, left=2, bottom=2, right=2});

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layTrackerBottom);
    obj.button16:setText("Próx. turno");
    obj.button16:setFontSize(11);
    obj.button16:setWidth(70);
    obj.button16:setAlign("left");
    obj.button16:setName("button16");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layTrackerBottom);
    obj.layout47:setAlign("right");
    obj.layout47:setWidth(68);
    obj.layout47:setName("layout47");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout47);
    obj.label68:setAlign("left");
    obj.label68:setAutoSize(true);
    obj.label68:setText("Rodada");
    obj.label68:setWordWrap(false);
    obj.label68:setFontSize(11);
    obj.label68:setName("label68");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout47);
    obj.edit13:setField("rodada");
    obj.edit13:setAlign("client");
    obj.edit13:setType("number");
    obj.edit13:setMin(0);
    obj.edit13:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");
    obj.edit13:setName("edit13");


		if system.isMobile() then
			self.layTrackerBottom.height = 32;
		end;
		
		self.onStartDrop = self.handleStartDrop;
		self.rclAtores.onStartDrop = self.handleStartDrop;
	


    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Aventuras");
    obj.tab5:setName("tab5");

    obj.frmGerenciador03 = gui.fromHandle(_obj_newObject("form"));
    obj.frmGerenciador03:setParent(obj.tab5);
    obj.frmGerenciador03:setName("frmGerenciador03");
    obj.frmGerenciador03:setAlign("client");
    obj.frmGerenciador03:setTheme("dark");
    obj.frmGerenciador03:setMargins({top=1});

    obj.scrollBox7 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmGerenciador03);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.scrollBox7);
    obj.rectangle38:setLeft(0);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(830);
    obj.rectangle38:setHeight(20);
    obj.rectangle38:setColor("Black");
    obj.rectangle38:setName("rectangle38");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle38);
    obj.label69:setLeft(0);
    obj.label69:setTop(0);
    obj.label69:setWidth(830);
    obj.label69:setHeight(20);
    obj.label69:setText("LISTA DE AVENTURAS");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.rectangle38);
    obj.button17:setLeft(0);
    obj.button17:setTop(0);
    obj.button17:setWidth(20);
    obj.button17:setHeight(20);
    obj.button17:setText("+");
    obj.button17:setHint("Nova Aventura");
    obj.button17:setName("button17");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.rectangle38);
    obj.button18:setLeft(20);
    obj.button18:setTop(0);
    obj.button18:setWidth(20);
    obj.button18:setHeight(20);
    obj.button18:setText("O");
    obj.button18:setHint("Organizar");
    obj.button18:setName("button18");

    obj.scrollBox8 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.scrollBox7);
    obj.scrollBox8:setLeft(0);
    obj.scrollBox8:setTop(20);
    obj.scrollBox8:setWidth(830);
    obj.scrollBox8:setHeight(590);
    obj.scrollBox8:setName("scrollBox8");

    obj.rclAventuras = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclAventuras:setParent(obj.scrollBox8);
    obj.rclAventuras:setLeft(0);
    obj.rclAventuras:setTop(0);
    obj.rclAventuras:setWidth(810);
    obj.rclAventuras:setHeight(600);
    obj.rclAventuras:setItemHeight(200);
    obj.rclAventuras:setAutoHeight(true);
    obj.rclAventuras:setMinQt(1);
    obj.rclAventuras:setName("rclAventuras");
    obj.rclAventuras:setField("aventuras");
    obj.rclAventuras:setTemplateForm("frmGerenciador03_AVENTURA");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Ata");
    obj.tab6:setName("tab6");

    obj.frmGerenciador04 = gui.fromHandle(_obj_newObject("form"));
    obj.frmGerenciador04:setParent(obj.tab6);
    obj.frmGerenciador04:setName("frmGerenciador04");
    obj.frmGerenciador04:setAlign("client");
    obj.frmGerenciador04:setTheme("dark");
    obj.frmGerenciador04:setMargins({top=1});

    obj.scrollBox9 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmGerenciador04);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.scrollBox9);
    obj.rectangle39:setLeft(0);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(1260);
    obj.rectangle39:setHeight(20);
    obj.rectangle39:setColor("Black");
    obj.rectangle39:setName("rectangle39");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle39);
    obj.label70:setLeft(0);
    obj.label70:setTop(0);
    obj.label70:setWidth(1260);
    obj.label70:setHeight(20);
    obj.label70:setText("ATA DE PRESENÇA");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.rectangle39);
    obj.button19:setLeft(0);
    obj.button19:setTop(0);
    obj.button19:setWidth(20);
    obj.button19:setHeight(20);
    obj.button19:setText("+");
    obj.button19:setHint("Novo");
    obj.button19:setName("button19");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.rectangle39);
    obj.button20:setLeft(20);
    obj.button20:setTop(0);
    obj.button20:setWidth(20);
    obj.button20:setHeight(20);
    obj.button20:setText("O");
    obj.button20:setHint("Organizar");
    obj.button20:setName("button20");

    obj.scrollBox10 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.scrollBox9);
    obj.scrollBox10:setLeft(0);
    obj.scrollBox10:setTop(20);
    obj.scrollBox10:setWidth(1260);
    obj.scrollBox10:setHeight(590);
    obj.scrollBox10:setName("scrollBox10");

    obj.rclPresenca = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclPresenca:setParent(obj.scrollBox10);
    obj.rclPresenca:setLeft(0);
    obj.rclPresenca:setTop(0);
    obj.rclPresenca:setWidth(1240);
    obj.rclPresenca:setHeight(600);
    obj.rclPresenca:setItemHeight(200);
    obj.rclPresenca:setAutoHeight(true);
    obj.rclPresenca:setMinQt(1);
    obj.rclPresenca:setLayout("horizontalTiles");
    obj.rclPresenca:setName("rclPresenca");
    obj.rclPresenca:setField("presenca");
    obj.rclPresenca:setTemplateForm("frmGerenciador04_PRESENCA");

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Anotaçoes");
    obj.tab7:setName("tab7");

    obj.frmFichaRPGmeister10_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister10_svg:setParent(obj.tab7);
    obj.frmFichaRPGmeister10_svg:setName("frmFichaRPGmeister10_svg");
    obj.frmFichaRPGmeister10_svg:setAlign("client");
    obj.frmFichaRPGmeister10_svg:setTheme("dark");
    obj.frmFichaRPGmeister10_svg:setMargins({top=1});

    obj.scrollBox11 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox11:setParent(obj.frmFichaRPGmeister10_svg);
    obj.scrollBox11:setAlign("client");
    obj.scrollBox11:setName("scrollBox11");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.scrollBox11);
    obj.rectangle40:setLeft(0);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(1210);
    obj.rectangle40:setHeight(20);
    obj.rectangle40:setColor("Black");
    obj.rectangle40:setName("rectangle40");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle40);
    obj.label71:setLeft(0);
    obj.label71:setTop(0);
    obj.label71:setWidth(1210);
    obj.label71:setHeight(20);
    obj.label71:setText("PAGINA EXCLUSIVA DO MESTRE");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.rectangle40);
    obj.button21:setLeft(0);
    obj.button21:setTop(0);
    obj.button21:setWidth(50);
    obj.button21:setHeight(20);
    obj.button21:setText("Exibir");
    obj.button21:setHint("Exibe as Anotações do Mestre.");
    obj.button21:setName("button21");

    obj.a1 = gui.fromHandle(_obj_newObject("layout"));
    obj.a1:setParent(obj.scrollBox11);
    obj.a1:setLeft(0);
    obj.a1:setTop(0);
    obj.a1:setWidth(400);
    obj.a1:setHeight(605);
    obj.a1:setName("a1");
    obj.a1:setVisible(false);

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.a1);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setName("rectangle41");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.a1);
    obj.label72:setLeft(0);
    obj.label72:setTop(0);
    obj.label72:setWidth(400);
    obj.label72:setHeight(20);
    obj.label72:setText("ANOTAÇÕES");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.a1);
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(380);
    obj.textEditor2:setHeight(575);
    obj.textEditor2:setField("anotacoes1");
    obj.textEditor2:setName("textEditor2");

    obj.a2 = gui.fromHandle(_obj_newObject("layout"));
    obj.a2:setParent(obj.scrollBox11);
    obj.a2:setLeft(405);
    obj.a2:setTop(0);
    obj.a2:setWidth(400);
    obj.a2:setHeight(605);
    obj.a2:setName("a2");
    obj.a2:setVisible(false);

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.a2);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setName("rectangle42");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.a2);
    obj.label73:setLeft(0);
    obj.label73:setTop(0);
    obj.label73:setWidth(400);
    obj.label73:setHeight(20);
    obj.label73:setText("ANOTAÇÕES");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.a2);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(575);
    obj.textEditor3:setField("anotacoes2");
    obj.textEditor3:setName("textEditor3");

    obj.a3 = gui.fromHandle(_obj_newObject("layout"));
    obj.a3:setParent(obj.scrollBox11);
    obj.a3:setLeft(810);
    obj.a3:setTop(0);
    obj.a3:setWidth(400);
    obj.a3:setHeight(605);
    obj.a3:setName("a3");
    obj.a3:setVisible(false);

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.a3);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setColor("black");
    obj.rectangle43:setName("rectangle43");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.a3);
    obj.label74:setLeft(0);
    obj.label74:setTop(0);
    obj.label74:setWidth(400);
    obj.label74:setHeight(20);
    obj.label74:setText("ANOTAÇÕES");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.a3);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(575);
    obj.textEditor4:setField("anotacoes3");
    obj.textEditor4:setName("textEditor4");


				local function secret()
					local mesa = rrpg.getMesaDe(sheet);
					
					if mesa.meuJogador.isMestre then
						self.a1.visible = true;
						self.a2.visible = true;
						self.a3.visible = true;
					else
						self.a1.visible = false;
						self.a2.visible = false;
						self.a3.visible = false;
					end;
				end;
			


    obj.tab8 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Creditos");
    obj.tab8:setName("tab8");

    obj.frmFichaRPGmeister11_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister11_svg:setParent(obj.tab8);
    obj.frmFichaRPGmeister11_svg:setName("frmFichaRPGmeister11_svg");
    obj.frmFichaRPGmeister11_svg:setAlign("client");
    obj.frmFichaRPGmeister11_svg:setTheme("dark");
    obj.frmFichaRPGmeister11_svg:setMargins({top=1});

    obj.scrollBox12 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox12:setParent(obj.frmFichaRPGmeister11_svg);
    obj.scrollBox12:setAlign("client");
    obj.scrollBox12:setName("scrollBox12");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox12);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(600);
    obj.image2:setHeight(600);
    obj.image2:setSRC("/GerenciadorDeCampanha/images/RPGmeister.jpg");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.scrollBox12);
    obj.layout48:setLeft(620);
    obj.layout48:setTop(10);
    obj.layout48:setWidth(200);
    obj.layout48:setHeight(170);
    obj.layout48:setName("layout48");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout48);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("black");
    obj.rectangle44:setXradius(15);
    obj.rectangle44:setYradius(15);
    obj.rectangle44:setCornerType("round");
    obj.rectangle44:setName("rectangle44");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout48);
    obj.label75:setLeft(0);
    obj.label75:setTop(10);
    obj.label75:setWidth(200);
    obj.label75:setHeight(20);
    obj.label75:setText("Programador: Vinny (Ambesek)");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout48);
    obj.label76:setLeft(0);
    obj.label76:setTop(35);
    obj.label76:setWidth(200);
    obj.label76:setHeight(20);
    obj.label76:setText("Arte: Nefer (Nefertyne)");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout48);
    obj.label77:setLeft(0);
    obj.label77:setTop(60);
    obj.label77:setWidth(200);
    obj.label77:setHeight(20);
    obj.label77:setText("Lista de NPCs: Mia");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout48);
    obj.label78:setLeft(0);
    obj.label78:setTop(85);
    obj.label78:setWidth(200);
    obj.label78:setHeight(20);
    obj.label78:setText("Iniciativas: Alysson");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout48);
    obj.label79:setLeft(0);
    obj.label79:setTop(120);
    obj.label79:setWidth(200);
    obj.label79:setHeight(20);
    obj.label79:setText("Ficha feita para a mesa: ");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout48);
    obj.label80:setLeft(0);
    obj.label80:setTop(145);
    obj.label80:setWidth(200);
    obj.label80:setHeight(20);
    obj.label80:setText("RPGmeister");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.scrollBox12);
    obj.label81:setLeft(630);
    obj.label81:setTop(400);
    obj.label81:setWidth(90);
    obj.label81:setHeight(20);
    obj.label81:setText("SUA VERSÃO:");
    obj.label81:setName("label81");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.scrollBox12);
    obj.rectangle45:setLeft(724);
    obj.rectangle45:setTop(399);
    obj.rectangle45:setWidth(102);
    obj.rectangle45:setHeight(22);
    obj.rectangle45:setColor("white");
    obj.rectangle45:setStrokeColor("black");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox12);
    obj.image3:setLeft(725);
    obj.image3:setTop(400);
    obj.image3:setWidth(100);
    obj.image3:setHeight(20);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao07.png");
    obj.image3:setName("image3");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.scrollBox12);
    obj.label82:setLeft(620);
    obj.label82:setTop(430);
    obj.label82:setWidth(100);
    obj.label82:setHeight(20);
    obj.label82:setText("VERSÃO ATUAL:");
    obj.label82:setName("label82");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.scrollBox12);
    obj.rectangle46:setLeft(724);
    obj.rectangle46:setTop(429);
    obj.rectangle46:setWidth(102);
    obj.rectangle46:setHeight(22);
    obj.rectangle46:setColor("white");
    obj.rectangle46:setStrokeColor("black");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox12);
    obj.image4:setLeft(725);
    obj.image4:setTop(430);
    obj.image4:setWidth(100);
    obj.image4:setHeight(20);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Gerenciador%20de%20Campanha%20releases/release.png");
    obj.image4:setName("image4");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.scrollBox12);
    obj.button22:setLeft(620);
    obj.button22:setTop(475);
    obj.button22:setWidth(100);
    obj.button22:setText("Change Log");
    obj.button22:setName("button22");

    obj.button23 = gui.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.scrollBox12);
    obj.button23:setLeft(730);
    obj.button23:setTop(475);
    obj.button23:setWidth(100);
    obj.button23:setText("Atualizar");
    obj.button23:setName("button23");

    obj.button24 = gui.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.scrollBox12);
    obj.button24:setLeft(840);
    obj.button24:setTop(475);
    obj.button24:setWidth(100);
    obj.button24:setText("Tutorial");
    obj.button24:setName("button24");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.scrollBox12);
    obj.label83:setLeft(620);
    obj.label83:setTop(525);
    obj.label83:setWidth(120);
    obj.label83:setHeight(20);
    obj.label83:setText("CONHEÇA A MESA:");
    obj.label83:setName("label83");

    obj.button25 = gui.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.scrollBox12);
    obj.button25:setLeft(740);
    obj.button25:setTop(525);
    obj.button25:setWidth(100);
    obj.button25:setText("RPGmeister");
    obj.button25:setName("button25");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclSessoes:sort();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            						local sessoes = ndb.getChildNodes(sheet.sessoes);
            						local num = 1;
            
            						if #sessoes > 0 then
            							num = (tonumber(sessoes[#sessoes].numero) or 0) + 1
            						end;
            
            						local node = self.rclSessoes:append();
            						if node~=nil then
            							node.numero = num;
            							node.data = os.date("%d/%m/%Y", os.time());
            						end;
            
            						self.rclSessoes:sort();
            					end;
        end, obj);

    obj._e_event2 = obj.rclSessoes:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.numero) or 0) < (tonumber(nodeB.numero) or 0) then
            		                    return 1;
            		                elseif (tonumber(nodeA.numero) or 0) > (tonumber(nodeB.numero) or 0) then
            		                    return -1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            						local jogadores = ndb.getChildNodes(sheet.jogadores);
            						local jogadoresNome = "";
            						local mesa = rrpg.getMesaDe(sheet);
            						local usuarios = mesa.jogadores;
            
            						mesa:requestSetModerada(true);
            						for i=1, #jogadores, 1 do
            							jogadoresNome = jogadoresNome .. jogadores[i].jogador .. " ";
            						end;
            
            						for i=1, #usuarios, 1 do 
            							if string.find(jogadoresNome, usuarios[i].login)== nil then
            								if not usuarios[i].isMestre then
            									usuarios[i]:requestSetJogador(false);
            									usuarios[i]:requestSetVoz(false);
            								end
            							else
            								usuarios[i]:requestSetJogador(true);
            								usuarios[i]:requestSetVoz(true);
            							end;
            						end;
            					end;
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (self)
            self.rclJogadores:sort();
        end, obj);

    obj._e_event5 = obj.button5:addEventListener("onClick",
        function (self)
            self.rclJogadores:append();
        end, obj);

    obj._e_event6 = obj.rclJogadores:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            local mod1 = nodeA.xp;
            						local mod2 = nodeB.xp;
            						if mod1==nil then
            							mod1 = "0";
            						end;
            						if mod2==nil then
            							mod2 = "0";
            						end;
            						return (utils.compareStringPtBr(mod1, mod2) * -1);
        end, obj);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            								local meses = ndb.getChildNodes(sheet.listaMeses);
            								local num = #meses + 1;
            
            								local node = self.rclMeses:append();
            								if node~=nil then
            									node.ordem = num;
            									node.mes = "Mês " .. num;
            									node.dias = 30;
            								end;
            
            								self.rclMeses:sort();
            							end;
        end, obj);

    obj._e_event8 = obj.button7:addEventListener("onClick",
        function (self)
            self.rclMeses:sort();
        end, obj);

    obj._e_event9 = obj.rclMeses:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                    return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                    return 1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event10 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            							if sheet.dias ~= sheet.duracaoEstacao then
            								self.dias.fontColor = "red";
            							else
            								self.dias.fontColor = "white";
            							end;
            						end;
        end, obj);

    obj._e_event11 = obj.button8:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            								local semana = ndb.getChildNodes(sheet.listaSemana);
            								local num = #semana + 1;
            
            								local node = self.rclSemana:append();
            								if node~=nil then
            									node.ordem = num;
            									node.dia = "Dia " .. num;
            								end;
            
            								self.rclSemana:sort();
            							end;
        end, obj);

    obj._e_event12 = obj.button9:addEventListener("onClick",
        function (self)
            self.rclSemana:sort();
        end, obj);

    obj._e_event13 = obj.rclSemana:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                        return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                        return 1;
            		                else   
            		                        return 0;
            		                end;
        end, obj);

    obj._e_event14 = obj.button10:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            								local node = self.rclLuas:append();
            								if node~=nil then
            									node.luas = "Lua";
            									node.ciclo = 28;
            									node.desvio = 0;
            								end;
            
            								self.rclLuas:sort();
            							end;
        end, obj);

    obj._e_event15 = obj.celestialBt:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("popCelestial");
            							
            							if pop ~= nil then
            								pop:setNodeObject(self.sheet);
            								pop:showPopupEx("bottomCenter", self.celestialBt);
            							else
            								showMessage("Ops, bug.. nao encontrei o popup de eventos celestiais para exibir");
            							end;
        end, obj);

    obj._e_event16 = obj.button11:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            								local estacao = ndb.getChildNodes(sheet.listaEstacoes);
            								local num = #estacao + 1;
            
            								local node = self.rclEstacoes:append();
            								if node~=nil then
            									node.ordem = num;
            									node.estacao = "Estação " .. num;
            									node.dias = 90;
            								end;
            
            								self.rclEstacoes:sort();
            							end;
        end, obj);

    obj._e_event17 = obj.button12:addEventListener("onClick",
        function (self)
            self.rclEstacoes:sort();
        end, obj);

    obj._e_event18 = obj.rclEstacoes:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                    return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                    return 1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event19 = obj.button13:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            						local tempo = tonumber(sheet.tempo) or 1;
            						local add = tonumber(sheet.add) or 1;
            
            						tempo = tempo + add;
            						local tempoRestante = tempo;
            
            						local anoDuracao = tonumber(sheet.dias) or 1;
            						local ano = math.floor((tempo-1) / anoDuracao) + 1;
            						tempoRestante = tempoRestante - ((ano-1) * anoDuracao);
            
            						local meses = ndb.getChildNodes(sheet.listaMeses);
            						local mes = #meses;
            						local mesDuracao = 1;
            						local search = true;
            						local aux = 0;
            						for i=1, #meses, 1 do
            							if tempoRestante <= meses[i].cumulativo and search then
            								search = false;
            								mes = i-1;
            								if i > 1 then
            									aux = meses[i-1].cumulativo;
            								end;
            								tempoRestante = tempoRestante - aux;
            							end;
            						end;
            						if mes == #meses then
            							aux = meses[#meses].cumulativo; 
            							tempoRestante = tempoRestante - aux;
            						end;
            
            						sheet.tempo = tempo;
            						sheet.dia = tempoRestante;
            						sheet.mes = mes;
            						sheet.ano = ano;
            					end;
        end, obj);

    obj._e_event20 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            						-- Reading sheet
            
            						local seed;
            						if sheet.seed == nil then
            							seed = math.random(1, 99999);
            							sheet.seed = seed;
            						else
            							seed = tonumber(sheet.seed) or 0;
            						end;
            
            						local dia = tonumber(sheet.dia) or 1;
            						local mes = tonumber(sheet.mes) or 1;
            						local ano = tonumber(sheet.ano) or 1;
            
            						local anoDuracao = tonumber(sheet.dias) or 1;
            						local duracaoEstacao = tonumber(sheet.duracaoEstacao) or 1;
            
            						local desvioSemana = tonumber(sheet.desvioSemana) or 0;
            						local desvioEstacao = tonumber(sheet.desvioEstacao) or 0;
            
            						local meses = ndb.getChildNodes(sheet.listaMeses);
            						local semana = ndb.getChildNodes(sheet.listaSemana); 
            						local estacoes = ndb.getChildNodes(sheet.listaEstacoes); 
            						local luas = ndb.getChildNodes(sheet.listaLuas); 
            
            						-- processing date
            
            						if meses[mes] == nil or #semana < 1 or #estacoes < 1 then
            							return;
            						end;
            						
            						local nomeMes = "not found";
            						for i=1, #meses, 1 do
            							if meses[i].ordem == mes then
            								nomeMes = meses[i].mes;
            							end;
            						end;
            
            						local diaDoAno = dia + meses[mes].cumulativo;
            						local tempo = diaDoAno + (ano-1) * anoDuracao;
            
            						local diaDaSemana = (tempo + desvioSemana) % #semana;
            						if diaDaSemana == 0 then
            							diaDaSemana = #semana;
            						end;
            						local nomeDiaDaSemana = "not found";
            						for i=1, #semana, 1 do
            							if semana[i].ordem == diaDaSemana then
            								nomeDiaDaSemana = semana[i].dia;
            							end;
            						end;
            
            						-- defining season
            						local estacao = 0;
            						local diaDaEstacao = (tempo - desvioEstacao) % duracaoEstacao;
            						if diaDaEstacao == 0 then
            							diaDaEstacao = duracaoEstacao;
            						end;
            						local estacaoPos = 0;
            						for i=1, #estacoes, 1 do
            							if diaDaEstacao > estacoes[i].cumulativo then
            								estacao = i;
            								estacaoPos = diaDaEstacao - estacoes[i].cumulativo;
            							end
            						end;
            						local estacaoNome = estacoes[estacao].estacao;
            
            						local estacaoEpoca = "fim";
            						local porcEstacao = estacaoPos / (tonumber(estacoes[estacao].dias) or 1);
            						if porcEstacao < 0.33 then
            							estacaoEpoca = "começo";
            						elseif porcEstacao < 0.67 then
            							estacaoEpoca = "meio";
            						end;
            
            						-- defining temperatures
            						math.randomseed(tempo + seed);
            
            						local mimTemp = 0;
            						local maxTemp = 0;
            
            						local temperatures;
            						local temperaturesVar;
            						local variances = {1, 2, 3, 4, 5};
            						local selected = 5;
            						if estacoes[estacao].temperatura == "Infernal" then
            							temperatures = {31, 35, 41, 49, 57};
            							temperaturesVar = {4, 6, 8, 8, 8};
            						elseif estacoes[estacao].temperatura == "Quente" then
            							temperatures = {25, 27, 29, 33, 39};
            							temperaturesVar = {2, 2, 4, 6, 6};
            						elseif estacoes[estacao].temperatura == "Morno" then
            							temperatures = {20, 22, 24, 26, 30};
            							temperaturesVar = {3, 2, 2, 4, 6};
            						elseif estacoes[estacao].temperatura == "Frio" then
            							temperatures = {-31, -23, -15, -7, 1};
            							temperaturesVar = {8, 8, 8, 8, 8};
            						elseif estacoes[estacao].temperatura == "Glacial" then
            							temperatures = {-46, -36, -26, -16, -6};
            							temperaturesVar = {10, 10, 10, 10, 10};
            						else
            							temperatures = {10, 14, 18, 22, 26};
            							temperaturesVar = {4, 4, 4, 4, 4};
            						end;
            
            						local sensacao = "";
            						local dice1 = math.random(1, 100);
            						if dice1 <= 5 then
            							selected = 1;
            							sensacao = "muito mais frio que o normal"
            						elseif dice1 <= 25 then
            							selected = 2;
            							sensacao = "mais frio que o normal"
            						elseif dice1 <= 75 then
            							selected = 3;
            							sensacao = "com a temperatura padrão"
            						elseif dice1 <= 95 then
            							selected = 4;
            							sensacao = "mais quente que o normal"
            						else
            							selected = 5;
            							sensacao = "muito mais quente que o normal"
            						end;
            
            						local dice2 = math.random(1, temperaturesVar[selected]);
            						local baseTemp = temperatures[selected] + dice2;
            
            						local dice3 = math.random(1, 100);
            						if dice3 <= 5 then
            							selected = 1;
            						elseif dice3 <= 25 then
            							selected = 2;
            						elseif dice3 <= 75 then
            							selected = 3;
            						elseif dice3 <= 95 then
            							selected = 4;
            						else
            							selected = 5;
            						end;
            
            						minTemp = 0 - variances[selected];
            						maxTemp = 0 + variances[selected];
            
            						-- defining rain
            
            						local intensidade;
            						local nevoa = false;
            						local intensidadeChance;
            						if estacoes[estacao].chuvas == "Nenhuma" then
            							intensidadeChance = {100, 101, 101, 101, 101, 101};
            						elseif estacoes[estacao].chuvas == "Razoável" then
            							intensidadeChance = {80, 86, 92, 97, 99, 100};
            						elseif estacoes[estacao].chuvas == "Muita" then
            							intensidadeChance = {60, 70, 83, 92, 97, 100};
            						elseif estacoes[estacao].chuvas == "Constante" then
            							intensidadeChance = {0, 10, 45, 80, 95, 100};
            						else
            							intensidadeChance = {90, 93, 96, 99, 100, 101};
            						end;
            
            						local dice4 = math.random(1, 100);
            						local dice5;
            						if dice4 <= intensidadeChance[1] then
            							intensidade = 1;
            							dice5 = 0;
            						elseif dice4 <= intensidadeChance[2] then
            							intensidade = 2;
            							dice5 = math.random(1, 10);
            						elseif dice4 <= intensidadeChance[3] then
            							intensidade = 3;
            							dice5 = 0 - math.random(1, 3);
            						elseif dice4 <= intensidadeChance[4] then
            							intensidade = 4;
            							dice5 = 0 - math.random(1, 6);
            						elseif dice4 <= intensidadeChance[5] then
            							intensidade = 5;
            							dice5 = 0 - math.random(1, 8);
            						else
            							intensidade = 6;
            							dice5 = 0 - math.random(1, 10);
            						end;
            						baseTemp = baseTemp + dice5;
            
            						local dice6 = math.random(1, 100);
            						if dice6 > intensidadeChance[3] and dice6 <= intensidadeChance[4] then
            							nevoa = true;
            						end;
            
            						-- defining wind
            
            						local ventosChance;
            						local ventos;
            						local ventosVelocidade;
            
            						if estacoes[estacao].ventos == "Nenhum" then
            							ventosChance = {100, 101, 101, 101, 101, 101, 101, 101};
            						elseif estacoes[estacao].ventos == "Razoável" then
            							ventosChance = {0, 70, 85, 95, 99, 100, 101, 101};
            						elseif estacoes[estacao].ventos == "Muito" then
            							ventosChance = {0, 50, 70, 80, 90, 95, 99, 100};
            						elseif estacoes[estacao].ventos == "Constante" then
            							ventosChance = {0, 25, 50, 65, 80, 90, 98, 100};
            						else
            							ventosChance = {0, 89, 99, 100, 101, 101, 101, 101};
            						end;
            
            						local dice7 = math.random(1, 100);
            
            						if dice7 <= ventosChance[1] then
            							ventos = 1;
            							ventosVelocidade = 0;
            							baseTemp = baseTemp + math.random(1, 10);
            						elseif dice7 <= ventosChance[2] then
            							ventos = 2;
            							ventosVelocidade = math.random(1, 16) - 1;
            							if ventosVelocidade == 0 then
            								ventos = 1;
            								baseTemp = baseTemp + math.random(1, 10);
            							end
            						elseif dice7 <= ventosChance[3] then
            							ventos = 3;
            							ventosVelocidade = math.random(1, 15) + 15;
            							baseTemp = baseTemp - math.random(1, 2);
            						elseif dice7 <= ventosChance[4] then
            							ventos = 4;
            							ventosVelocidade = math.random(1, 15) + 30;
            							baseTemp = baseTemp - math.random(1, 3);
            						elseif dice7 <= ventosChance[5] then
            							ventos = 5;
            							ventosVelocidade = math.random(1, 35) + 45;
            							baseTemp = baseTemp - math.random(1, 4);
            						elseif dice7 <= ventosChance[6] then
            							ventos = 6;
            							ventosVelocidade = math.random(1, 40) + 80;
            							baseTemp = baseTemp - math.random(1, 5);
            						elseif dice7 <= ventosChance[7] then
            							ventos = 7;
            							ventosVelocidade = math.random(1, 160) + 120;
            							baseTemp = baseTemp - math.random(1, 6);
            						else
            							ventos = 8;
            							ventosVelocidade = math.random(1, 200) + 280;
            							baseTemp = baseTemp - math.random(1, 8);
            						end;
            
            						-- Defining sand
            
            						local areia = false;
            						if estacoes[estacao].areia == "Pouca" and intensidade == 1 and ventos >= 6 then
            							areia = true;
            						elseif estacoes[estacao].areia == "Razoável" and intensidade == 1 and ventos >= 5 then
            							areia = true;
            						elseif estacoes[estacao].areia == "Muita" and intensidade == 1 and ventos >= 4 then
            							areia = true;
            						elseif estacoes[estacao].areia == "Constante" and intensidade == 1 and ventos >= 3 then
            							areia = true;
            						end;
            
            						-- defining moons
            
            						local luasInfo = "";
            						local luasLabel = "";
            						if #luas > 1 then
            							luasInfo = "No céu as luas ";
            							luasLabel = "Luas: ";
            						elseif #luas > 0 then
            							luasInfo = "No céu a lua ";
            							luasLabel = "Lua: ";
            						end;
            						for i=1, #luas, 1 do
            							local ciclo = tonumber(luas[i].ciclo) or 1;
            							local desvio = tonumber(luas[i].desvio) or 0;
            
            							local diaCiclo = (tempo+desvio) % ciclo;
            							if diaCiclo == 0 then
            								diaCiclo = ciclo;
            							end;
            
            							local porcentagemCiclo = diaCiclo / ciclo;
            
            							if luas[i].luas == nil then
            								luas[i].luas = "Lua";
            							end;
            
            							if porcentagemCiclo <= 0.125 then
            								luasInfo = luasInfo .. luas[i].luas .. " cheia";
            								luasLabel = luasLabel .. luas[i].luas .. " (cheia)";
            							elseif porcentagemCiclo <= 0.25 then
            								luasInfo = luasInfo .. luas[i].luas .. " em minguante convexo";
            								luasLabel = luasLabel .. luas[i].luas .. " (minguante convexo)";
            							elseif porcentagemCiclo <= 0.375 then
            								luasInfo = luasInfo .. luas[i].luas .. " em quarto minguante";
            								luasLabel = luasLabel .. luas[i].luas .. " (quarto minguante)";
            							elseif porcentagemCiclo <= 0.5 then
            								luasInfo = luasInfo .. luas[i].luas .. " em minguante concavo";
            								luasLabel = luasLabel .. luas[i].luas .. " (minguante concavo)";
            							elseif porcentagemCiclo <= 0.625 then
            								luasInfo = luasInfo .. luas[i].luas .. " em lua nova";
            								luasLabel = luasLabel .. luas[i].luas .. " (lua nova)";
            							elseif porcentagemCiclo <= 0.75 then
            								luasInfo = luasInfo .. luas[i].luas .. " em crescente concavo";
            								luasLabel = luasLabel .. luas[i].luas .. " (crescente concavo)";
            							elseif porcentagemCiclo <= 0.875 then
            								luasInfo = luasInfo .. luas[i].luas .. " em quarto crescente";
            								luasLabel = luasLabel .. luas[i].luas .. " (quarto crescente)";
            							else
            								luasInfo = luasInfo .. luas[i].luas .. " em crescente convexo";
            								luasLabel = luasLabel .. luas[i].luas .. " (crescente convexo)";
            							end;
            
            							if i < #luas then
            								luasInfo = luasInfo .. ", ";
            								luasLabel = luasLabel .. ", ";
            							else
            								luasInfo = luasInfo .. ". ";
            								luasLabel = luasLabel .. ". ";
            							end;
            						end;
            						sheet.luasLabel = luasLabel;
            
            						-- defining celestial events
            
            						local eventChance = {};
            						eventChance[0] = 0;
            						local eventType = {sheet.sobrentural, sheet.auroras, sheet.cometas, sheet.cadentes, sheet.lunar, sheet.solar, sheet.meteoros, sheet.terremotos};
            
            						for i = 1, 8, 1 do 
            							if eventType[i] == "Raro" then
            								eventChance[i] = eventChance[i-1] + 1;
            							elseif eventType[i] == "Incomum" then
            								eventChance[i] = eventChance[i-1] + 3;
            							elseif eventType[i] == "Comum" then
            								eventChance[i] = eventChance[i-1] + 7;
            							elseif eventType[i] == "Constante" then
            								eventChance[i] = eventChance[i-1] + 14;
            							else
            								eventChance[i] = eventChance[i-1];
            							end;
            						end;
            						
            						local dice8 = math.random(1, 100);
            						local event = 0;
            						local subEvent = math.random(1, 10);
            						if dice8 <= eventChance[1] then
            							event = 1;
            						elseif dice8 <= eventChance[2] then
            							event = 2;
            						elseif dice8 <= eventChance[3] then
            							event = 3;
            						elseif dice8 <= eventChance[4] then
            							event = 4;
            						elseif dice8 <= eventChance[5] then
            							event = 5;
            							if #luas <1 then
            								event = 0;
            							end;
            						elseif dice8 <= eventChance[6] then
            							event = 6;
            						elseif dice8 <= eventChance[7] then
            							event = 7;
            						elseif dice8 <= eventChance[8] then
            							event = 8;
            						end;
            
            						-- finalazing
            						minTemp = minTemp + baseTemp;
            						maxTemp = maxTemp + baseTemp;
            
            						-- saving variables
            						sheet.tempo = tempo;
            						-- sheet.era = tempo;
            
            						-- Cleaning hints
            
            						self.temperaturaLabel.hint="A temperatura atinge seu ponto mais baixo de meia noite e mais alto de meio dia. ";
            						self.precipitacaoLabel.hint="";
            						self.ventoLabel.hint="";
            						self.eventosLabel.hint="";
            
            						-- defining message
            						local data = dia .. " de " .. nomeMes .. " de " .. ano .. "; " .. nomeDiaDaSemana .. ". Era o " .. estacaoEpoca .. " do " .. estacaoNome .. ". Estava " .. sensacao .. " pra época, variando entre " .. minTemp .. "º C e " .. maxTemp .. "º C entre a noite e o dia. ";
            						sheet.dataLabel = dia .. " de " .. nomeMes .. " de " .. ano .. "; " .. nomeDiaDaSemana;
            						sheet.estacaoLabel = estacaoNome .. " (" .. estacaoEpoca .. ")";
            						sheet.temperaturaLabel = "Temperatura: " .. minTemp .. "º C - " .. maxTemp .. "º C";
            
            						if minTemp < 5 then
            							self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Muito Frio: CD15 + 1/teste a cada hora contra 1d6 dano.";
            						elseif minTemp < -15 then
            							self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Frio Severo: CD15 + 1/teste a cada 10 minutos contra 1d6 dano. Personagem fica fatigado enquanto não recuperar esse dano. ";
            						elseif minTemp < -30 then
            							self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Frio Extremo: CD15 + 1/teste a cada minuto contra 1d4 dano. Criaturas vestindo armaduras de metal são afetadas por esfriar metais. Personagem fica fatigado enquanto não recuperar esse dano. ";
            						elseif maxTemp > 32 then
            							self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Muito Quente: CD15 + 1/teste a cada hora contra 1d4 dano. Penalidade de -4 se tiver usando armaduras ou roupas pesadas. ";
            						elseif maxTemp > 43 then
            							self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Calor Severo: CD15 + 1/teste a cada 10 minutos contra 1d4 dano. Penalidade de -4 se tiver usando armaduras ou roupas pesadas. Personagem fica fatigado enquanto não recuperar esse dano. ";
            						elseif maxTemp > 60 then
            							self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Calor Severo: CD15 + 1/teste a cada minuto contra 1d6 dano. Penalidade de -4 se tiver usando armaduras ou roupas pesadas. riaturas vestindo armaduras de metal são afetadas por esquentar metais. Personagem fica fatigado enquanto não recuperar esse dano. ";
            						end;
            
            						if intensidade > 1 then
            							local precipitacao;
            							local labels;
            							local penalidades;
            							if baseTemp < 0 then
            								precipitacao = {"", "O dia estava nublado. ", "Pequenos flocos de neve caiam lentamente e durante todo o dia. ", "Nevava ao longo do dia, com pequenas e raras pausas. ", "Uma forte nevasca atingia a região cobrindo tudo com neve. ", "Estava caindo uma tempestade de granizo. Grandes pedras de gelo atingiam o chão. "};
            								labels = {"", "Nublado.", "Neve leve.", "Neve.", "Nevasca.", "Granizo."};
            								penalidades = {"", "", "", "Visibilidade reduzida pela metade, -4 em Observar, -4 Ouvir, -4 Ataques a distancia. Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas. Deslocamento na neve custa 2 quadrados. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. . Deslocamento na neve custa 4 quadrados. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. Pedras de gelo que causam 1d8 de dano por minuto caem em todos na região. Deslocamento na neve custa 4 quadrados. "};
            							else
            								precipitacao = {"", "O dia estava nublado. ", "Chuviscava, deixando tudo coberto por uma fina camada de água. ", "Chuvia ao longo do dia, com pequenas e raras pausas. ", "Um temporal atingia a região. ", "Uma forte tempestade atingia a região. Raios e trovões eram ouvidos ao longe. "};
            								labels = {"", "Nublado.", "Chuviscando.", "Chuva.", "Temporal.", "Tempestade."};
            								penalidades = {"", "", "", "Visibilidade reduzida pela metade, -4 em Observar, -4 Ouvir, -4 Ataques a distancia. Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. Raios que causam (1d10)d8 de dano caem aleatoriamente. "};
            							end;
            							data = data .. precipitacao[intensidade];
            							sheet.precipitacaoLabel = "Precipitação: " .. labels[intensidade];
            							self.precipitacaoLabel.hint = penalidades[intensidade];
            						else
            							sheet.precipitacaoLabel = "Precipitação: Nenhuma."
            						end;
            						if nevoa and baseTemp < 20 then
            							data = data .. "Uma forte neblina se espalhava, cobrindo tudo. ";
            							sheet.precipitacaoLabel = sheet.precipitacaoLabel .. " Névoa.";
            							self.precipitacaoLabel.hint = self.precipitacaoLabel.hint .. "\n Neblina obscurece visão além de 1,5m dando camuflagem (20%) a alvos distantes. ";
            						end;
            						if areia then
            							if ventos == 1 then
            								data = data .. "Não ventava naquele dia. ";
            								sheet.ventoLabel = "Ventos: Sem vento."
            							elseif ventos == 2 then
            								data = data .. "Uma leve Brisa de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            								sheet.ventoLabel = "Ventos: Brisa (" .. ventosVelocidade .. "Km/h)."
            							elseif ventos == 3 then
            								data = data .. "Um vento Moderado de " .. ventosVelocidade .. "Km/h levantava a areia, criando uma nuvem de poeira. ";
            								sheet.ventoLabel = "Ventos: Moderado (" .. ventosVelocidade .. "Km/h) com areia.";
            								self.ventoLabel.hint="50% de chance de apagar chamas desprotegidas. Visibilidade reduzida pela metade, -4 em Observar.";
            							elseif ventos == 4 then
            								data = data .. "Um vento Forte de " .. ventosVelocidade .. "Km/h levantava a areia, criando uma nuvem de poeira. ";
            								sheet.ventoLabel = "Ventos: Forte (" .. ventosVelocidade .. "Km/h) com areia.";
            								self.ventoLabel.hint="Apaga chamas desprotegidas. Visibilidade reduzida pela metade, -4 em Observar, -2 Ouvir e -2 ataques a distancia.";
            							elseif ventos == 5 then
            								data = data .. "Um vento Severo de " .. ventosVelocidade .. "Km/h levantava a areia criando uma tempestade de areia que cobria tudo. ";
            								sheet.ventoLabel = "Ventos: Severo (" .. ventosVelocidade .. "Km/h) com areia.";
            								self.ventoLabel.hint="Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas. Visibilidade reduzida pela metade, -4 em Observar, -4 Ouvir e -4 ataques a distancia.";
            							elseif ventos == 6 then
            								data = data .. "Uma Ventania de " .. ventosVelocidade .. "Km/h cria uma perigosa tempestade de areia. ";
            								sheet.ventoLabel = "Ventos: Ventania (" .. ventosVelocidade .. "Km/h) com areia.";
            								self.ventoLabel.hint="Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir e impossivel fazer ataques a distancia. 1d3 de dano contusivo por rodada. ";
            							elseif ventos == 7 then
            								data = data .. "Um Furação de " .. ventosVelocidade .. "Km/h  se forma, a areia da região segue os fortes ventos criando uma terrivel tempestade de areia. ";
            								sheet.ventoLabel = "Ventos: Furacão (" .. ventosVelocidade .. "Km/h) com areia.";
            								self.ventoLabel.hint="Apaga todas chamas. Visibilidade reduzida pela metade, -8 em Observar, impossivel ouvir e impossivel fazer ataques a distancia. 1d3 de dano contusivo por rodada. Impossivel respirar sem proteção facial e 10xcon rodadas com proteção. ";
            							else
            								data = data .. "Um Tornado de " .. ventosVelocidade .. "Km/h  se forma, a areia da região segue os fortes ventos criando uma terrivel tempestade de areia. ";
            								sheet.ventoLabel = "Ventos: Tornado (" .. ventosVelocidade .. "Km/h) com areia.";
            								self.ventoLabel.hint="Apaga todas chamas. Visibilidade reduzida pela metade, -8 em Observar, impossivel ouvir e impossivel fazer ataques a distancia. 1d3 de dano contusivo por rodada. Impossivel respirar sem proteção facial e 10xcon rodadas com proteção. Fortitude CD30, para evitar ser arrastado por 1d10 rodadas. Tomando 6d6 dano por rodada e depois dano por queda. ";
            							end;
            						else
            							if ventos == 1 then
            								data = data .. "Não ventava naquele dia. ";
            								sheet.ventoLabel = "Ventos: Sem vento.";
            							elseif ventos == 2 then
            								data = data .. "Uma leve Brisa de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            								sheet.ventoLabel = "Ventos: Brisa (" .. ventosVelocidade .. "Km/h).";
            							elseif ventos == 3 then
            								data = data .. "Uma vento Moderado " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            								sheet.ventoLabel = "Ventos: Moderado (" .. ventosVelocidade .. "Km/h).";
            								self.ventoLabel.hint="50% de chance de apagar chamas desprotegidas. ";
            							elseif ventos == 4 then
            								data = data .. "Uma vento Forte de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            								sheet.ventoLabel = "Ventos: Forte (" .. ventosVelocidade .. "Km/h).";
            								self.ventoLabel.hint="Apaga chamas desprotegidas, -2 Ouvir e -2 ataques a distancia.";
            							elseif ventos == 5 then
            								data = data .. "Uma vento Severo de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            								sheet.ventoLabel = "Ventos: Severo (" .. ventosVelocidade .. "Km/h).";
            								self.ventoLabel.hint="Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas, -4 Ouvir e -4 ataques a distancia.";
            							elseif ventos == 6 then
            								data = data .. "Uma Ventania de " .. ventosVelocidade .. "Km/h se formava e arrastava consigo tudo que podia. ";
            								sheet.ventoLabel = "Ventos: Ventania (" .. ventosVelocidade .. "Km/h).";
            								self.ventoLabel.hint="Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas, -8 Ouvir e impossivel fazer ataques a distancia.";
            							elseif ventos == 7 then
            								data = data .. "Um Furacão se formava com ventos de " .. ventosVelocidade .. "Km/h destruindo por onde passava. ";
            								sheet.ventoLabel = "Ventos: Furacão (" .. ventosVelocidade .. "Km/h).";
            								self.ventoLabel.hint="Apaga todas chamas. Impossivel ouvir e impossivel fazer ataques a distancia. ";
            							else
            								data = data .. "Um Tornado se formava com ventos de " .. ventosVelocidade .. "Km/h destruindo por onde passava. ";
            								sheet.ventoLabel = "Ventos: Tornado (" .. ventosVelocidade .. "Km/h)."
            								self.ventoLabel.hint="Apaga todas chamas. Impossivel ouvir e impossivel fazer ataques a distancia. Fortitude CD30, para evitar ser arrastado por 1d10 rodadas. Tomando 6d6 dano por rodada e depois dano por queda. ";
            							end;
            						end;
            
            						data = data .. luasInfo;
            
            						if event > 0 then
            							if event == 1 then
            								local subEvent = math.random(1, 36);
            								
            								local sobrenatural = {"Toda vez que o vento soprava naquele dia era possivel ouvir estranhos sons trazidos de longe. Não se podia ver a origem daqueles sons nas proximidades. ", "Toda vez que o vento soprava naquele dia todos se sentiam como se ficassem leves e levitassem um pouco. ", "Uma estranha chuva de granizo começa. Cada granizo que toca o chão explode soltando um som como o de um trovão. ", "Durante a noite um estranho fenomeno ocorre. As estrelas do céu começam a cair num chuva de estrelas. Em pouco menos de uma hora todo céu ficava escuro. ", "As nuvens assumem a forma de teias e se espalham pelo céu de forma intricada. ", "Uma estranha nevoa surge pela manhã. Ela era densa e ficava muito difícil de atravessa-la. ", "Em certo ponto do dia diversas rachaduras começam a surgir no céu, causando ondas de choque e estrondos. ", "Todos acordam calmos, incapazes de sentir emoções fortes ou raiva. ", "Uma estranha chuva começa. Cada gota de chuva tinha uma cor diferente e brilhava. Ficando mais dificil de enchergar coisas distantes com precisão por conta de todas cores e brilhos. ", "Uma estranha neve começa a cair. Ela se espalhava mesmo sem vento, e caminhar por ela não deixava pegadas. ", "As nuvens adquirem uma luminosidade natural, como o sol ou a lua. Ficando tudo claro mesmo a noite. ", "Uma estranha chuva começa. Quanto mais vão ficando molhados, mais leves vão se tornando. Após alguns minutos os objetos molhados começam a flutuar. ", "Uma estranha neve começa a cair. Ela fazia um som relaxante e caia lentamente, deixando todos sonolentos. ", "Uma estranha neve começa a cair. Ela era pesada. Quanto mais se acumulava sobre algo mais seu peso ficava evidente. ", "Um estranho vento começa a soprar. Ele entrava mesmo em lugares completamente fechados, como se fosse incorporeo. ", "Grandes nuvens escuras de fumaça surgem no céu. Era possivel ver faiscas e chamas brancas saindo de seu interior. ", "Uma estranha chuva começa a cair. Assim que a água toca algo ela se congela. Cobrindo tudo em gelo. ", "Estranhas nuvens de tempestade negra surgem. Raios a atravessam sem ir em direção ao chão. O barulho dos trovões e do vento forte dificultam a audição. ", "Toda vez que o vento soprava era possivel ouvir os gritos dos mortos. Vozes do além, felizes ou tristes, podiam ser ouvidas em qualquer lugar. ", "Uma estranha tempestade começa. Cada vez que um raio parte o céu uma rachadura se abre, por onde é possivel ver outros mundos. ", "Estranhas nuvens de fumaça surgem no céu. Começa uma chuva estranha que se incendeia ao tocar qualquer coisa. ", "Um estranho vento começa a soprar, sempre vindo pelas costas e empurrando todos para frente. ", "Uma estranha neblina surge. Vez ou outra as pessoas que tentavam atravessa-la se encontram longe de onde estavam, em outro ponto da neblina. ", "O céu fica coberto de luzes douradas, algumas pessoas se sentem inspiradas e mais felizes. ", "Nuvens em forma de monstros surgem no céu. Sempre que o vento empurra uma para perto de outro elas brigam e se despedaçam. ", "Uma estranha chuva de granizo começa. Ao invés de blocos de gelo liso, pedras de gelo cheias de espinhos começam a cair. ", "Uma estranha nevoa vermelha cobre tudo. Dela era possivel ouvir o som de batalhas distantes e o sofrimento dos soldados. ", "O céu estava especialmente limpo. Nenhum sinal de nuvens. Tambem estava especialmente claro, mesmo em lugares de sombra. ", "Uma estranha chuva começa a cair de nuvens negra. Assim que a água escura toca algo ela se congela. Cobrindo tudo em gelo negro. ", "Uma tempestade estranha surge. As nuvens pareciam ter estranhas runas e grande quantidade de energia pode ser sentida emanando delas. ", "Uma estranha neve começa a cair. Ela era acizentada e fazia aqueles que a tocavam se sentirem mal. ", "O céu parece estranho e distorcido, sendo dificil entender sua forma. As nuvens pareciam retorcidas e as luzes pareciam fraquejar como se estivessem falhando. ", "Uma estranha chuva começa. Tudo que ela tocava começava a se dissolver lentamente. ", "Estranhos ventos quentes começam, acompanhados por faiscas e pequenas chamas. ", "Começa a chover de baixo pra cima. Água, de poços, lagos e rios começa a subir. ", "As núvens assumem a forma de engrenagens e começam a se conectar e girar, formando complexos mecanismos. "};
            								
            								local label = {"Vento Sussurrante", "Vento Ágil ", "Granizo Trovão", "Granizo Estrelar", "Nuvens de Teia", "Nevoa Solida", "Ceurremoto", "Calma Psiquica", "Chuva Prismatica", "Neve Fantasma", "Nuvens Brilhantes", "Chuva Levitante", "Neve do Sono", "Neve de Chumbo", "Vento Incorporeo", "Nuvens Incendiarias", "Chuva Congelante", "Tempestade Alucinogena", "Tempestade Fantasma", "Tempestade Planar", "Tempestade de Fogo", "Vento de Cauda", "Nevoa Eterea", "Céu Dourado", "Nuvens Monstro", "Nevasca Atroz", "Nevoa Vermelha", "Claridade Celestial", "Chuva Negra", "Tempestade Arcana", "Nevasca Negra", "Céu Aberrante", "Chuva Ácida", "Sopro Draconico", "Chuva Reversa", "Núvens Mecanicas"};
            
            								local efeitos = {"Qualquer criatura pode mandar uma mensagem ou som pra um local familiar escolhido. 50% de chance de apagar chamas desprotegidas. ", "Personagens podem voar com deslocamento de voo 12m bom, ou 9m se usar armadura media ou superior. 50% de chance de apagar chamas desprotegidas. ", "Causa 1d6 de dano por minuto. Torna testes de ouvir impossiveis. ", "Deixa o céu totalmente escuro. Barulho das estrelas caindo impoe -4 em ouvir. Estrelas voltam ao céu no dia seguinte. ", "Como a magia teia contra criaturas voadoras. ", "Como a magia nevoa solida. ", "Fortitude CD15 pra evitar surdez por uma hora. Fortitude CD15 para evitar 2d6 de dano em criaturas voadoras. ", "Remove todos efeitos de moral, furia, inspirar coragem, ou confusão. Criaturas não conseguem tomar ações violetas, mas podem se defender. ", "-8 em Observar. ", "+4 Furtividade, -4 Observar. Impossivel rastrear pegadas. Custa 2 quadrados para se mover pela neve. ", "Criaturas fracas contra luz do dia são afetadas como se fosse dia. ", "Criatuas molhadas voam subindo 6m por rodada. Chuva apaga chamas desprotegidas e tem 75% de chance de apagar chamas protegidas. -4 em ouvir, observar, e ataques a distancia. ", "Fortidude CD15 a cada hora para não dormir por 1h. -4 Observar, ouvir e ataques a distancia. Deslocamento custa o dobro. ", "Criatuas cobertas pela neve tomam 1d6 de dano por minuto. -8 Observar, ouvir e impossivel atacar a distancia. Apaga chamas desprotegidas e 50% de chance de apagar protegidas. Deslocamento custa o dobro. ", "Nega efeitos contra frio ou calor de roupas. Apenas bloqueado por energia. Apaga todas chamas. ", "Como a magia nuvem incendiaria", "Fortitude CD15 a cada hora. Na primeira falha deslocamento cai pela metade e -1 em ataques, CA e Reflexos. Na segunda falha Sofre de lentidão e penalidade aumenta pra -2. Na terceira falha fica presa em gelo e paralisada. Na quarta falha a criatura morre congelada. ", "-4 Ouvir e Observar. ", "Um personagem que passe 10 minutos chamando um espirito consegue sua atenção por 1d6 rodadas antes dele ser carregado pelo vento. -8 em ouvir, impossivel atacar a distancia. Apaga chamas desprotegidas, 75% de chance de apagar chamas protegidas. ", "Fortitude ou Vontade CD15 para criaturas voadoras não serem tragadas pra um plano aleatorio. ", "1d6 de dano por rodada por fogo. -4 Observar, Ouvir, e impossivel atacar a distancia. ", "Aumenta em 9m todos deslocamentos terrestres e de voo. ", "Vontade CD15 pra não ser teleportado pra lugar aleatorio da neblina a cada movimento. ", "Bonus moral de +1 em ataques e +2 em pericias para criaturas neutras e o dobro pra criaturas boas. ", "", "1d6 de dano por minuto, -4 em ouvir. ", "Vontade CD15 por minuto ou sofrer os efeitos de confusão. ", "+4 Observar, Ouvir, Sentir motivação. Dissipa confusão, medo ou ilusões. ", "Fortitude CD15 pra evitar nível negativo. -4 Observar, Ouvir e ataques a distancia. Apaga chamas desprotegidas e 75% das chamas protegidas. Deslocamento custa o dobro. ", "Aumenta em 1 a CD de todas magias. Aumenta em 1 os níveis de todos conjuradores. ", "Qualquer criatura morta durante a nevasca volta como uma aparição 1d4 rodadas depois. ", "Vontade 18 contra a magia insanidade, dura 1d6 horas. ", "1d6 de dano ácido por minuto. Reduz visibilidade a metade, -4 Observar, ouvir e ataques a distancia. Apaga chamas desprotegidas e 50% das chamas protegidas. ", "50% de chance de incendiar objetos inflamaveis. ", "Reduz visibilidade a metade, -4 Observar, ouvir e ataques a distancia. Apaga chamas desprotegidas e 50% das chamas protegidas. ", ""};
            
            								data = data .. sobrenatural[subEvent];
            								sheet.eventosLabel = "Eventos: " .. label[subEvent] .. ".";
            								self.eventosLabel.hint = efeitos[subEvent];
            							elseif event == 2 then
            								data = data .. "Durante a noite, o céu ficava coberto por uma Aurora. As grandes luzes se espalhavam pelo céu como panos de luz colorida. "
            								sheet.eventosLabel = "Eventos: Aurora."
            							elseif event == 3 then
            								data = data .. "Durante a noite, um cometa é visto atravessando os céus lentamente. Atravessando-o como uma linha de fogo. "
            								sheet.eventosLabel = "Eventos: Cometa."
            							elseif event == 4 then
            								if subEvent <= 7 then
            									data = data .. "Durante a noite, uma estrela cadente é vista cruzando o céu com velocidade. "
            									sheet.eventosLabel = "Eventos: Estrela Cadente."
            								elseif subEvent <= 9 then
            									data = data .. "Durante a noite, algumas estrelas cadentes podem ser vistas cruzando o céu com velocidade. "
            									sheet.eventosLabel = "Eventos: Estrelas Cadentes."
            								else
            									data = data .. "Durante a noite, frequentemente se pode ver estrelas cadentes cruzando o céu com velocidade. "
            									sheet.eventosLabel = "Eventos: Estrelas Cadentes."
            								end;
            							elseif event == 5 then
            								if subEvent <= 3 then
            									data = data .. "Durante a noite, um eclipse lunar penumbral ocorre. A lua fica vermelha, deixando tudo com uma aparencia avermelhada. "
            									sheet.eventosLabel = "Eventos: Lua de Sangue."
            								else
            									data = data .. "Durante a noite, um eclipse lunar ocorre. Deixando tudo escuro. "
            									sheet.eventosLabel = "Eventos: Eclipse Lunar."
            								end;
            							elseif event == 6 then
            								if subEvent <= 3 then
            									data = data .. "Durante o dia, um eclipse solar anular ocorre. O sol fica coberto por uma mancha negra, mas era possivel ver o circulo de fogo em volta da mancha. "
            									sheet.eventosLabel = "Eventos: Eclipse Solar Anular."
            								else
            									data = data .. "Durante o dia, um eclipse solar ocorre. Deixando tudo escuro por alguns minutos. "
            									sheet.eventosLabel = "Eventos: Eclipse Solar."
            								end;
            							elseif event == 7 then
            								if subEvent <= 7 then
            									data = data .. "Durante a noite, uma fraca chuva de meteoros é vista. Algumas vezes era possivel ver pequenos meteoros cruzando o céu. "
            									sheet.eventosLabel = "Eventos: Chuva de Meteoros."
            								elseif subEvent <= 9 then
            									data = data .. "Durante a noite, uma chuva de meteoros é vista. Varias vezes era possivel perceber os pequenos meteoros cruzando o céu. "
            									sheet.eventosLabel = "Eventos: Chuva de Meteoros."
            								else
            									data = data .. "Durante a noite, uma forte chuva de meteoros é vista. Dezenas de meteoros iluminam o céu. "
            									sheet.eventosLabel = "Eventos: Chuva de Meteoros."
            								end;
            							elseif event == 8 then
            								data = data .. "Em certo momento do dia um terremoto começa, fazendo o chão se tremer e derrubando construções e objetos. ";
            								sheet.eventosLabel = "Eventos: Terremoto."
            							end;
            						else
            							sheet.eventosLabel = "Eventos: Nenhum."
            						end;
            						sheet.data = data;
            					end;
        end, obj);

    obj._e_event21 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Selected.left = 20 * (tonumber(sheet.CorIndex or 0) % 8);
            			self.Selected.top = 20 * math.floor(tonumber(sheet.CorIndex or 0) / 8);
        end, obj);

    obj._e_event22 = obj.rectangle9:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 1;
            					sheet.CorIndex = sheet.IndexBarrinha1;
            					sheet.ColorString = sheet.CorBarrinha1;
            					self.SelectCor:show();
        end, obj);

    obj._e_event23 = obj.rectangle10:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 1;
            							sheet.CorIndex = sheet.IndexBarrinha1;
            							sheet.ColorString = sheet.CorBarrinha1;
            							self.SelectCor:show();
        end, obj);

    obj._e_event24 = obj.CorBarrinha1:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 1;
            								sheet.CorIndex = sheet.IndexBarrinha1;
            								sheet.ColorString = sheet.CorBarrinha1;
            								self.SelectCor:show();
        end, obj);

    obj._e_event25 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.CorBarrinha1.color = sheet.CorBarrinha1;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha1 = sheet.CorBarrinha1;
            				end;
        end, obj);

    obj._e_event26 = obj.rectangle11:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 2;
            					sheet.CorIndex = sheet.IndexBarrinha2;
            					sheet.ColorString = sheet.CorBarrinha2;
            					self.SelectCor:show();
        end, obj);

    obj._e_event27 = obj.rectangle12:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 2;
            							sheet.CorIndex = sheet.IndexBarrinha2;
            							sheet.ColorString = sheet.CorBarrinha2;
            							self.SelectCor:show();
        end, obj);

    obj._e_event28 = obj.CorBarrinha2:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 2;
            								sheet.CorIndex = sheet.IndexBarrinha2;
            								sheet.ColorString = sheet.CorBarrinha2;
            								self.SelectCor:show();
        end, obj);

    obj._e_event29 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.CorBarrinha2.color = sheet.CorBarrinha2;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha2 = sheet.CorBarrinha2;
            				end;
        end, obj);

    obj._e_event30 = obj.rectangle13:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 3;
            					sheet.CorIndex = sheet.IndexBarrinha3;
            					sheet.ColorString = sheet.CorBarrinha3;
            					self.SelectCor:show();
        end, obj);

    obj._e_event31 = obj.rectangle14:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 3;
            							sheet.CorIndex = sheet.IndexBarrinha3;
            							sheet.ColorString = sheet.CorBarrinha3;
            							self.SelectCor:show();
        end, obj);

    obj._e_event32 = obj.CorBarrinha3:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 3;
            								sheet.CorIndex = sheet.IndexBarrinha3;
            								sheet.ColorString = sheet.CorBarrinha3;
            								self.SelectCor:show();
        end, obj);

    obj._e_event33 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.CorBarrinha3.color = sheet.CorBarrinha3;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha3 = sheet.CorBarrinha3;
            				end;
        end, obj);

    obj._e_event34 = obj.rectangle15:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 4;
            					sheet.CorIndex = sheet.IndexBarrinha4;
            					sheet.ColorString = sheet.CorBarrinha4;
            					self.SelectCor:show();
        end, obj);

    obj._e_event35 = obj.rectangle16:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 4;
            							sheet.CorIndex = sheet.IndexBarrinha4;
            							sheet.ColorString = sheet.CorBarrinha4;
            							self.SelectCor:show();
        end, obj);

    obj._e_event36 = obj.CorBarrinha4:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 4;
            								sheet.CorIndex = sheet.IndexBarrinha4;
            								sheet.ColorString = sheet.CorBarrinha4;
            								self.SelectCor:show();
        end, obj);

    obj._e_event37 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.CorBarrinha4.color = sheet.CorBarrinha4;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha4 = sheet.CorBarrinha4;
            				end;
        end, obj);

    obj._e_event38 = obj.button14:addEventListener("onClick",
        function (self)
            self.Config:close();
        end, obj);

    obj._e_event39 = obj.layout25:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "0";
            				sheet.ColorString = "#acacac";
        end, obj);

    obj._e_event40 = obj.rectangle19:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "0";
            					sheet.ColorString = "#acacac";
        end, obj);

    obj._e_event41 = obj.layout26:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "1";
            				sheet.ColorString = "#5959ff";
        end, obj);

    obj._e_event42 = obj.rectangle20:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "1";
            					sheet.ColorString = "#5959ff";
        end, obj);

    obj._e_event43 = obj.layout27:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "2";
            				sheet.ColorString = "#59ff59";
        end, obj);

    obj._e_event44 = obj.rectangle21:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "2";
            					sheet.ColorString = "#59ff59";
        end, obj);

    obj._e_event45 = obj.layout28:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "3";
            				sheet.ColorString = "#ff5959";
        end, obj);

    obj._e_event46 = obj.rectangle22:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "3";
            					sheet.ColorString = "#ff5959";
        end, obj);

    obj._e_event47 = obj.layout29:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "4";
            				sheet.ColorString = "#ff59ff";
        end, obj);

    obj._e_event48 = obj.rectangle23:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "4";
            					sheet.ColorString = "#ff59ff";
        end, obj);

    obj._e_event49 = obj.layout30:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "5";
            				sheet.ColorString = "#ffac59";
        end, obj);

    obj._e_event50 = obj.rectangle24:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "5";
            					sheet.ColorString = "#ffac59";
        end, obj);

    obj._e_event51 = obj.layout31:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "6";
            				sheet.ColorString = "#ffff59";
        end, obj);

    obj._e_event52 = obj.rectangle25:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "6";
            					sheet.ColorString = "#ffff59";
        end, obj);

    obj._e_event53 = obj.layout32:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "7";
            				sheet.ColorString = "#59ffff";
        end, obj);

    obj._e_event54 = obj.rectangle26:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "7";
            					sheet.ColorString = "#59ffff";
        end, obj);

    obj._e_event55 = obj.layout33:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "8";
            				sheet.ColorString = "#ffd159";
        end, obj);

    obj._e_event56 = obj.rectangle27:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "8";
            					sheet.ColorString = "#ffd159";
        end, obj);

    obj._e_event57 = obj.layout34:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "9";
            				sheet.ColorString = "#5990ff";
        end, obj);

    obj._e_event58 = obj.rectangle28:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "9";
            					sheet.ColorString = "#5990ff";
        end, obj);

    obj._e_event59 = obj.layout35:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "10";
            				sheet.ColorString = "#f4c264";
        end, obj);

    obj._e_event60 = obj.rectangle29:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "10";
            					sheet.ColorString = "#f4c264";
        end, obj);

    obj._e_event61 = obj.layout36:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "11";
            				sheet.ColorString = "#de7a7a";
        end, obj);

    obj._e_event62 = obj.rectangle30:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "11";
            					sheet.ColorString = "#de7a7a";
        end, obj);

    obj._e_event63 = obj.layout37:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "12";
            				sheet.ColorString = "#cb83d6";
        end, obj);

    obj._e_event64 = obj.rectangle31:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "12";
            					sheet.ColorString = "#cb83d6";
        end, obj);

    obj._e_event65 = obj.layout38:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "13";
            				sheet.ColorString = "#f3658a";
        end, obj);

    obj._e_event66 = obj.rectangle32:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "13";
            					sheet.ColorString = "#f3658a";
        end, obj);

    obj._e_event67 = obj.layout39:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "14";
            				sheet.ColorString = "#8cecb3";
        end, obj);

    obj._e_event68 = obj.rectangle33:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "14";
            					sheet.ColorString = "#8cecb3";
        end, obj);

    obj._e_event69 = obj.layout40:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "15";
            				sheet.ColorString = "#ed846b";
        end, obj);

    obj._e_event70 = obj.rectangle34:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "15";
            					sheet.ColorString = "#ed846b";
        end, obj);

    obj._e_event71 = obj.button15:addEventListener("onClick",
        function (self)
            if sheet.IndexBarrinha == 1 then
            								sheet.IndexBarrinha1 = sheet.CorIndex;
            								sheet.CorBarrinha1 = sheet.ColorString;
            							elseif sheet.IndexBarrinha == 2 then
            								sheet.IndexBarrinha2 = sheet.CorIndex;
            								sheet.CorBarrinha2 = sheet.ColorString;
            							elseif sheet.IndexBarrinha == 3 then
            								sheet.IndexBarrinha3 = sheet.CorIndex;
            								sheet.CorBarrinha3 = sheet.ColorString;
            							elseif sheet.IndexBarrinha == 4 then
            								sheet.IndexBarrinha4 = sheet.CorIndex;
            								sheet.CorBarrinha4 = sheet.ColorString;
            							end;
            							self.SelectCor:close();
        end, obj);

    obj._e_event72 = obj.NovaAbadeNPCs:addEventListener("onClick",
        function (self)
            if DonoMestre() then			
            						node = self.opcoesFalsas:append();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event73 = obj.rectangle36:addEventListener("onClick",
        function (self)
            self.dropDownFalso.scopeNode = sheet;
            						 self:autoCalcular();
        end, obj);

    obj._e_event74 = obj.label65:addEventListener("onClick",
        function (self)
            self.dropDownFalso.scopeNode = sheet;
            						 self:autoCalcular();
        end, obj);

    obj._e_event75 = obj.path1:addEventListener("onClick",
        function (self)
            self.dropDownFalso.scopeNode = sheet;
            							 self:autoCalcular();
        end, obj);

    obj._e_event76 = obj.ListaDeNPCs:addEventListener("onShow",
        function (self)
            if self.opcoesFalsas2.selectedNode == nil and sheet ~= nil then
            			chamarListaDeJogadores();
            			autoCalcular();
                        local nodes = ndb.getChildNodes(sheet.opcoesFalsas2);               
                        if #nodes > 0 then
                            self.opcoesFalsas2.selectedNode = nodes[1];
                        end;
                    end;
        end, obj);

    obj._e_event77 = obj.opcoesFalsas2:addEventListener("onSelect",
        function (self)
            local node = self.opcoesFalsas2.selectedNode;
            						 setTimeout(function()
            							if node ~= nil then
            								self.recordNode.scopeNode.opcaoEscolhida2 = node.NomeDaOpcao;
            							end;
            						 end,10);
        end, obj);

    obj._e_event78 = obj.opcoesFalsas2:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (nodeA.CodigoInterno == nil) then
            							if (nodeA.NomeDaOpcao == "Nenhum") then
            								nodeA.CodigoInterno = 1;
            							else
            								nodeA.CodigoInterno = 2;
            							end;
            						end;
            						if (nodeB.CodigoInterno == nil) then
            							if (nodeB.NomeDaOpcao == "Nenhum") then
            								nodeB.CodigoInterno = 1;
            							else
            								nodeB.CodigoInterno = 2;
            							end;
            						end;
            					 
            						if nodeB.CodigoInterno > nodeA.CodigoInterno then
            							return -1;
            						elseif not (nodeB.CodigoInterno >= nodeA.CodigoInterno) then
            							return 1;
            						else
            							return 1 * utils.compareStringPtBr(nodeA.NomeDaOpcao, nodeB.NomeDaOpcao);
            						end;
        end, obj);

    obj._e_event79 = obj.rectangle37:addEventListener("onResize",
        function (self)
            if self.width >= 270 then
            				self.rclListaDeNPC.width = self.width;
            			else
            				self.rclListaDeNPC.width = 270;
            			end;
        end, obj);

    obj._e_event80 = obj.Configurar:addEventListener("onClick",
        function (self)
            if DonoMestre() then
            						self.Config.scopeNode = sheet;
            						self.Config:show();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event81 = obj.NovoNPC:addEventListener("onClick",
        function (self)
            if DonoMestre() then			
            						node = self.rclListaDeNPC:append();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event82 = obj.Organizar:addEventListener("onClick",
        function (self)
            if DonoMestre() then			
            						self.rclListaDeNPC:sort();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event83 = obj.rclListaDeNPC:addEventListener("onBeginEnumeration",
        function (self)
        end, obj);

    obj._e_event84 = obj.rclListaDeNPC:addEventListener("onItemAdded",
        function (self, node, form)
            node.CorBarrinha1 = (sheet.CorBarrinha1 or "#808080");
            					node.CorBarrinha2 = (sheet.CorBarrinha2 or "#808080");
            					node.CorBarrinha3 = (sheet.CorBarrinha3 or "#808080");
            					node.CorBarrinha4 = (sheet.CorBarrinha4 or "#808080");
            					form.Barrinha1.color = sheet.CorBarrinha1;
            					form.Barrinha2.color = sheet.CorBarrinha2;
            					form.Barrinha3.color = sheet.CorBarrinha3;
            					form.Barrinha4.color = sheet.CorBarrinha4;
        end, obj);

    obj._e_event85 = obj.rclListaDeNPC:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            org = getOrganizacao();
            					if nodeA.hideNPC and not nodeB.hideNPC then
            						return 1;
            					elseif not nodeA.hideNPC and nodeB.hideNPC then
            						return -1;
            					end;
            					if org == "Alfa" then
            						return utils.compareStringPtBr(nodeA.NomeGrande, nodeB.NomeGrande);
            					else
            						if ((nodeB.alinhamentoNPC or "Padrão") > (nodeA.alinhamentoNPC or "Padrão")) then
            							return -1;
            						elseif (nodeA.alinhamentoNPC or "Padrão") == (nodeB.alinhamentoNPC or "Padrão") then
            							return utils.compareStringPtBr(nodeA.NomePequeno, nodeB.NomePequeno);
            						else
            							return 1;
            						end;
            					end;
        end, obj);

    obj._e_event86 = obj.opcoesFalsas:addEventListener("onSelect",
        function (self)
            local node = self.opcoesFalsas.selectedNode;
            					 setTimeout(function()
            						if node ~= nil then
            							 self.dcsMain.scopeNode = node;
            							 self.dcsTituloEAbas.scopeNode = node;
            							 self.comboBoxFalsa.scopeNode = node;
            						end;
            					 end,10);
            					 self.dropDownFalso:close();
        end, obj);

    obj._e_event87 = obj.opcoesFalsas:addEventListener("onBeginEnumeration",
        function (self)
            if sheet ~= nil then
            						local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            						if #nodes == 0 then
            							local node = self.opcoesFalsas:append();
            							node.NomeDaOpcao = "Principal";
            						end;
            					end;
        end, obj);

    obj._e_event88 = obj.opcoesFalsas:addEventListener("onEndEnumeration",
        function (self)
            local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            					if self.dcsMain.scopeNode == nil then
            						self.dcsMain.scopeNode = nodes[1];
            						self.dcsTituloEAbas.scopeNode = nodes[1];
            						self.comboBoxFalsa.scopeNode = nodes[1];
            					end;
        end, obj);

    obj._e_event89 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            				local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            				if #nodes == 0 then
            					local node = self.opcoesFalsas:append();
            				else
            					if self.dcsMain.scopeNode == nil then
            						self.dcsMain.scopeNode = nodes[1];
            						self.dcsTituloEAbas.scopeNode = nodes[1];
            						self.comboBoxFalsa.scopeNode = nodes[1];
            					end;			
            				end;
            			end;
        end, obj);

    obj._e_event90 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local nudes = ndb.getChildNodes(sheet.opcoesFalsas);               
            			for i = 1, #nudes, 1 do
            				local nodes = ndb.getChildNodes(nudes[i].campoDosNPC);       
            				self:beginUpdate();
            				for i = 1,#nodes, 1 do
            					if sheet.VisibBarrinha1 ~= "c" then
            						nodes[i].Barrinha1Invisivel = false;
            					else
            						nodes[i].Barrinha1Invisivel = true;
            					end;
            				
            					if sheet.VisibBarrinha2 ~= "c" then
            						nodes[i].Barrinha2Invisivel = false;
            					else
            						nodes[i].Barrinha2Invisivel = true;
            					end;
            					
            					if sheet.VisibBarrinha3 ~= "c" then
            						nodes[i].Barrinha3Invisivel = false;
            					else
            						nodes[i].Barrinha3Invisivel = true;
            					end;
            					
            					if sheet.VisibBarrinha4 ~= "c" then
            						nodes[i].Barrinha4Invisivel = false;
            					else
            						nodes[i].Barrinha4Invisivel = true;
            					end;
            				end;
            				self:endUpdate();
            			end;
        end, obj);

    obj._e_event91 = obj.dataLink12:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local nudes = ndb.getChildNodes(sheet.opcoesFalsas);               
            			for i = 1, #nudes, 1 do
            				local nodes = ndb.getChildNodes(nudes[i].campoDosNPC);    
            				self:beginUpdate();
            				for i = 1,#nodes, 1 do
            				setTimeout( function ()
            					local test = GetBarrinhaNumeros(1);
            					local d0 = (tonumber(nodes[i].Barrinha1ValorMax or 0) == 0)
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha1ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha1 = (nodes[i].Barrinha1Valor or 0) .. "/" .. (nodes[i].Barrinha1ValorMax  or 0);
            						nodes[i].InfoBarrinha1Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha1 = tostring(math.floor((100 * (nodes[i].Barrinha1Valor or 0)) / d0)) .. "%";
            						nodes[i].InfoBarrinha1Oculto = "??%";
            					end;
            					
            					local test = GetBarrinhaNumeros(2);
            					local d0 = (tonumber(nodes[i].Barrinha2ValorMax or 0) == 0)
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha2ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha2 = (nodes[i].Barrinha2Valor  or 0) .. "/" .. (nodes[i].Barrinha2ValorMax  or 0);
            						nodes[i].InfoBarrinha2Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha2 = tostring(math.floor((100 * (nodes[i].Barrinha2Valor  or 0)) / d0)) .. "%";
            						nodes[i].InfoBarrinha2Oculto = "??%";
            					end;
            					local test = GetBarrinhaNumeros(3);
            					local d0 = (tonumber(nodes[i].Barrinha3ValorMax or 0) == 0);
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha3ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha3 = (nodes[i].Barrinha3Valor or 0) .. "/" .. (nodes[i].Barrinha3ValorMax  or 0);
            						nodes[i].InfoBarrinha3Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha3 = tostring(math.floor((100 * (nodes[i].Barrinha3Valor or 0) ) / d0)) .. "%";
            						nodes[i].InfoBarrinha3Oculto = "??%";
            					end;
            					local test = GetBarrinhaNumeros(4);
            					local d0 = (tonumber(nodes[i].Barrinha4ValorMax or 0) == 0);
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha4ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha4 = (nodes[i].Barrinha4Valor or 0) .. "/" .. (nodes[i].Barrinha4ValorMax or 0);
            						nodes[i].InfoBarrinha4Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha4 = tostring(math.floor((100 * (nodes[i].Barrinha4Valor or 0)) / d0)) .. "%";
            						nodes[i].InfoBarrinha4Oculto = "??%";
            					end;
            					end, 100);
            				end;
            				self:endUpdate();
            			end;
        end, obj);

    obj._e_event92 = obj.btnAddAtor:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            				if not mesaDoPersonagem.meuJogador.isGold then
            					shoMessage("Apenas para usuarios Gold!");
            					return;
            				end;
            
            				self:criarNovoAtor();
        end, obj);

    obj._e_event93 = obj.btnRoll:addEventListener("onClick",
        function (self)
            local nodes = ndb.getChildNodes(sheet.atores);
            				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            				if not mesaDoPersonagem.meuJogador.isGold then
            					shoMessage("Apenas para usuarios Gold!");
            					return;
            				end;
            
            				for i=1, #nodes, 1 do
            					if nodes[i].iniciativaBonus ~= nil then
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. nodes[i].iniciativaBonus);
            
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Iniciativa de " .. (nodes[i].nome or "Nome"),
            								function (rolado)
            									nodes[i].iniciativa = rolado.resultado;
            									self.rclAtores:sort();
            								end); 
            					end;
            				end
        end, obj);

    obj._e_event94 = obj.btnUpdate:addEventListener("onClick",
        function (self)
            self.rclAtores:sort()
        end, obj);

    obj._e_event95 = obj.btnAddAll:addEventListener("onClick",
        function (self)
            local jogadores = rrpg.getMesaDe(sheet).jogadores;
            				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            				if not mesaDoPersonagem.meuJogador.isGold then
            					shoMessage("Apenas para usuarios Gold!");
            					return;
            				end;
            
            				for i=1, #jogadores, 1 do
            					if jogadores[i].isJogador then
            						local ator = self:criarNovoAtor();
            						ator.nome = utils.removerFmtChat(jogadores[i].nick)
            						ator.fof = 1;
            					end;
            				end
        end, obj);

    obj._e_event96 = obj.btnLimpar:addEventListener("onClick",
        function (self)
            self:limpar();
        end, obj);

    obj._e_event97 = obj.rclAtores:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return self:compareNodes(nodeA, nodeB);
        end, obj);

    obj._e_event98 = obj.button16:addEventListener("onClick",
        function (self)
            self:proximoTurno();
        end, obj);

    obj._e_event99 = obj.button17:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            								local aventuras = ndb.getChildNodes(sheet.aventuras);
            								local num = #aventuras + 1;
            
            								local node = self.rclAventuras:append();
            								if node~=nil then
            									node.numero = num;
            								end;
            
            								self.rclAventuras:sort();
            							end;
        end, obj);

    obj._e_event100 = obj.button18:addEventListener("onClick",
        function (self)
            self.rclAventuras:sort();
        end, obj);

    obj._e_event101 = obj.rclAventuras:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.numero) or 0) < (tonumber(nodeB.numero) or 0) then
            		                    return 1;
            		                elseif (tonumber(nodeA.numero) or 0) > (tonumber(nodeB.numero) or 0) then
            		                    return -1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event102 = obj.button19:addEventListener("onClick",
        function (self)
            self.rclPresenca:append();
        end, obj);

    obj._e_event103 = obj.button20:addEventListener("onClick",
        function (self)
            self.rclPresenca:sort();
        end, obj);

    obj._e_event104 = obj.rclPresenca:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            local mod1 = nodeA.nick;
            						local mod2 = nodeB.nick;
            						local modR = utils.compareStringPtBr(mod1, mod2);
            						return modR;
        end, obj);

    obj._e_event105 = obj.button21:addEventListener("onClick",
        function (self)
            secret();
        end, obj);

    obj._e_event106 = obj.button22:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Gerenciador%20de%20Campanha%20releases/Change%20Log.txt')
        end, obj);

    obj._e_event107 = obj.button23:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Gerenciador%20de%20Campanha%20releases/Gerenciador%20de%20Campanha.rpk')
        end, obj);

    obj._e_event108 = obj.button24:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/3eodkgih3aq6hfz/Tutorial.docx?dl=0')
        end, obj);

    obj._e_event109 = obj.button25:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dcsMain ~= nil then self.dcsMain:destroy(); self.dcsMain = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layRightAlinedTitle ~= nil then self.layRightAlinedTitle:destroy(); self.layRightAlinedTitle = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLabel ~= nil then self.dataLabel:destroy(); self.dataLabel = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rclJogadores ~= nil then self.rclJogadores:destroy(); self.rclJogadores = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.popClima ~= nil then self.popClima:destroy(); self.popClima = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.rclSemana ~= nil then self.rclSemana:destroy(); self.rclSemana = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.Nha ~= nil then self.Nha:destroy(); self.Nha = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.path1 ~= nil then self.path1:destroy(); self.path1 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.frmFichaRPGmeister11_svg ~= nil then self.frmFichaRPGmeister11_svg:destroy(); self.frmFichaRPGmeister11_svg = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.Organizar ~= nil then self.Organizar:destroy(); self.Organizar = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.btnLimpar ~= nil then self.btnLimpar:destroy(); self.btnLimpar = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.rclMeses ~= nil then self.rclMeses:destroy(); self.rclMeses = nil; end;
        if self.CorBarrinha4 ~= nil then self.CorBarrinha4:destroy(); self.CorBarrinha4 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.btnAddAll ~= nil then self.btnAddAll:destroy(); self.btnAddAll = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.layTopTracker ~= nil then self.layTopTracker:destroy(); self.layTopTracker = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.btnUpdate ~= nil then self.btnUpdate:destroy(); self.btnUpdate = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.celestialBt ~= nil then self.celestialBt:destroy(); self.celestialBt = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.a1 ~= nil then self.a1:destroy(); self.a1 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.frmGerenciador04 ~= nil then self.frmGerenciador04:destroy(); self.frmGerenciador04 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.labTitFoF ~= nil then self.labTitFoF:destroy(); self.labTitFoF = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.estacaoLabel ~= nil then self.estacaoLabel:destroy(); self.estacaoLabel = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.CorBarrinha3 ~= nil then self.CorBarrinha3:destroy(); self.CorBarrinha3 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.comboBoxFalsa ~= nil then self.comboBoxFalsa:destroy(); self.comboBoxFalsa = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.recordNode ~= nil then self.recordNode:destroy(); self.recordNode = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.ventoLabel ~= nil then self.ventoLabel:destroy(); self.ventoLabel = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.SelectCor ~= nil then self.SelectCor:destroy(); self.SelectCor = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.btnAddAtor ~= nil then self.btnAddAtor:destroy(); self.btnAddAtor = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.opcoesFalsas2 ~= nil then self.opcoesFalsas2:destroy(); self.opcoesFalsas2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.btnRoll ~= nil then self.btnRoll:destroy(); self.btnRoll = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.Listade_NPC_Dock ~= nil then self.Listade_NPC_Dock:destroy(); self.Listade_NPC_Dock = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.NovaAbadeNPCs ~= nil then self.NovaAbadeNPCs:destroy(); self.NovaAbadeNPCs = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.frmCombatTracker ~= nil then self.frmCombatTracker:destroy(); self.frmCombatTracker = nil; end;
        if self.CorBarrinha2 ~= nil then self.CorBarrinha2:destroy(); self.CorBarrinha2 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.eventosLabel ~= nil then self.eventosLabel:destroy(); self.eventosLabel = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.frmFichaRPGmeister10_svg ~= nil then self.frmFichaRPGmeister10_svg:destroy(); self.frmFichaRPGmeister10_svg = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.a2 ~= nil then self.a2:destroy(); self.a2 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.scrollBox12 ~= nil then self.scrollBox12:destroy(); self.scrollBox12 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.scrollBox11 ~= nil then self.scrollBox11:destroy(); self.scrollBox11 = nil; end;
        if self.Configurar ~= nil then self.Configurar:destroy(); self.Configurar = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.dropDownFalso ~= nil then self.dropDownFalso:destroy(); self.dropDownFalso = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.labTitIniciativa ~= nil then self.labTitIniciativa:destroy(); self.labTitIniciativa = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.frmGerenciador03 ~= nil then self.frmGerenciador03:destroy(); self.frmGerenciador03 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.rclEstacoes ~= nil then self.rclEstacoes:destroy(); self.rclEstacoes = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.rclListaDeNPC ~= nil then self.rclListaDeNPC:destroy(); self.rclListaDeNPC = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.dropDownFalso2 ~= nil then self.dropDownFalso2:destroy(); self.dropDownFalso2 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.popCelestial ~= nil then self.popCelestial:destroy(); self.popCelestial = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.luasLabel ~= nil then self.luasLabel:destroy(); self.luasLabel = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.rclAtores ~= nil then self.rclAtores:destroy(); self.rclAtores = nil; end;
        if self.Config ~= nil then self.Config:destroy(); self.Config = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.MainClient ~= nil then self.MainClient:destroy(); self.MainClient = nil; end;
        if self.a3 ~= nil then self.a3:destroy(); self.a3 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.NovoNPC ~= nil then self.NovoNPC:destroy(); self.NovoNPC = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rclPresenca ~= nil then self.rclPresenca:destroy(); self.rclPresenca = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rclLuas ~= nil then self.rclLuas:destroy(); self.rclLuas = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layHeader0 ~= nil then self.layHeader0:destroy(); self.layHeader0 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.opcoesFalsas ~= nil then self.opcoesFalsas:destroy(); self.opcoesFalsas = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.temperaturaLabel ~= nil then self.temperaturaLabel:destroy(); self.temperaturaLabel = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.rclSessoes ~= nil then self.rclSessoes:destroy(); self.rclSessoes = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.dcsTituloEAbas ~= nil then self.dcsTituloEAbas:destroy(); self.dcsTituloEAbas = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.Selected ~= nil then self.Selected:destroy(); self.Selected = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.CorBarrinha1 ~= nil then self.CorBarrinha1:destroy(); self.CorBarrinha1 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.Flow ~= nil then self.Flow:destroy(); self.Flow = nil; end;
        if self.rclAventuras ~= nil then self.rclAventuras:destroy(); self.rclAventuras = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.frmGerenciador02 ~= nil then self.frmGerenciador02:destroy(); self.frmGerenciador02 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.dias ~= nil then self.dias:destroy(); self.dias = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.layTrackerBottom ~= nil then self.layTrackerBottom:destroy(); self.layTrackerBottom = nil; end;
        if self.frmGerenciador01 ~= nil then self.frmGerenciador01:destroy(); self.frmGerenciador01 = nil; end;
        if self.ListaDeNPCs ~= nil then self.ListaDeNPCs:destroy(); self.ListaDeNPCs = nil; end;
        if self.precipitacaoLabel ~= nil then self.precipitacaoLabel:destroy(); self.precipitacaoLabel = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmBibliotecaRPGmeister = {
    newEditor = newfrmBibliotecaRPGmeister, 
    new = newfrmBibliotecaRPGmeister, 
    name = "frmBibliotecaRPGmeister", 
    dataType = "Ambesek.Gerenciador.RPGmeister", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Gerenciador de Campanha", 
    description=""};

frmBibliotecaRPGmeister = _frmBibliotecaRPGmeister;
rrpg.registrarForm(_frmBibliotecaRPGmeister);
rrpg.registrarDataType(_frmBibliotecaRPGmeister);

return _frmBibliotecaRPGmeister;
