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
    obj:setDataType("Ambesek.Biblioteca.RPGmeister");
    obj:setTitle("Biblioteca RPGmeister");
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

    obj.frmBibliotecaRPGmeister01 = gui.fromHandle(_obj_newObject("form"));
    obj.frmBibliotecaRPGmeister01:setParent(obj.tab1);
    obj.frmBibliotecaRPGmeister01:setName("frmBibliotecaRPGmeister01");
    obj.frmBibliotecaRPGmeister01:setAlign("client");
    obj.frmBibliotecaRPGmeister01:setTheme("dark");
    obj.frmBibliotecaRPGmeister01:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmBibliotecaRPGmeister01);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(600);
    obj.image1:setHeight(600);
    obj.image1:setSRC("/BibliotecaRPGmeister/images/RPGmeister.jpg");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(620);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(600);
    obj.rectangle1:setHeight(150);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(10);
    obj.label1:setTop(5);
    obj.label1:setWidth(590);
    obj.label1:setHeight(140);
    obj.label1:setText("Sumario:\nAba 2: Racas e Classes\nAba 3: Pericias, Talentos, Magias e Descricoes\nAba 4: Equipamentos, Combates e Aventuras\nAba 5: Cenario e Monstros.");
    obj.label1:setName("label1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(620);
    obj.layout1:setTop(450);
    obj.layout1:setWidth(200);
    obj.layout1:setHeight(150);
    obj.layout1:setName("layout1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(5);
    obj.label2:setTop(5);
    obj.label2:setWidth(190);
    obj.label2:setHeight(140);
    obj.label2:setFontSize(12);
    obj.label2:setAutoSize(true);
    obj.label2:setText(" Programador: Vinny (Ambesek)\n\n  Esse plugin foi criando tanto para\n  facilitar o acesso aos links do\n  dropbox quanto para permitir o\n  acesso por jogadores mobile da\n  biblioteca do cenario.");
    obj.label2:setName("label2");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(840);
    obj.button1:setTop(475);
    obj.button1:setWidth(100);
    obj.button1:setText("Plugin Ficha");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(950);
    obj.button2:setTop(475);
    obj.button2:setWidth(100);
    obj.button2:setText("Copiar Link");
    obj.button2:setName("button2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setLeft(851);
    obj.label3:setTop(500);
    obj.label3:setWidth(90);
    obj.label3:setHeight(20);
    obj.label3:setText("SUA VERSAO:");
    obj.label3:setName("label3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(950);
    obj.rectangle3:setTop(499);
    obj.rectangle3:setWidth(102);
    obj.rectangle3:setHeight(22);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(951);
    obj.image2:setTop(500);
    obj.image2:setWidth(100);
    obj.image2:setHeight(20);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao02.png");
    obj.image2:setName("image2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox1);
    obj.label4:setLeft(851);
    obj.label4:setTop(525);
    obj.label4:setWidth(100);
    obj.label4:setHeight(20);
    obj.label4:setText("VERSAO ATUAL:");
    obj.label4:setName("label4");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(950);
    obj.rectangle4:setTop(524);
    obj.rectangle4:setWidth(102);
    obj.rectangle4:setHeight(22);
    obj.rectangle4:setColor("white");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setLeft(951);
    obj.image3:setTop(525);
    obj.image3:setWidth(100);
    obj.image3:setHeight(20);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Biblioteca%20RPG%20meister%20releases/release.png");
    obj.image3:setName("image3");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(840);
    obj.button3:setTop(550);
    obj.button3:setWidth(100);
    obj.button3:setText("Change Log");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(950);
    obj.button4:setTop(550);
    obj.button4:setWidth(100);
    obj.button4:setText("Atualizar");
    obj.button4:setName("button4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.scrollBox1);
    obj.label5:setLeft(830);
    obj.label5:setTop(575);
    obj.label5:setWidth(120);
    obj.label5:setHeight(20);
    obj.label5:setText("CONHECA A MESA:");
    obj.label5:setName("label5");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(950);
    obj.button5:setTop(575);
    obj.button5:setWidth(100);
    obj.button5:setText("RPGmeister");
    obj.button5:setName("button5");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Raça/Classe");
    obj.tab2:setName("tab2");

    obj.frmBibliotecaRPGmeister02 = gui.fromHandle(_obj_newObject("form"));
    obj.frmBibliotecaRPGmeister02:setParent(obj.tab2);
    obj.frmBibliotecaRPGmeister02:setName("frmBibliotecaRPGmeister02");
    obj.frmBibliotecaRPGmeister02:setAlign("client");
    obj.frmBibliotecaRPGmeister02:setTheme("dark");
    obj.frmBibliotecaRPGmeister02:setMargins({top=1});

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmBibliotecaRPGmeister02);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox2);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(400);
    obj.rectangle5:setHeight(605);
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setName("rectangle5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle5);
    obj.label6:setLeft(5);
    obj.label6:setTop(5);
    obj.label6:setWidth(395);
    obj.label6:setHeight(25);
    obj.label6:setText("RAÇAS");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle5);
    obj.button6:setLeft(5);
    obj.button6:setTop(50);
    obj.button6:setWidth(200);
    obj.button6:setText("Súmario");
    obj.button6:setName("button6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle5);
    obj.label7:setLeft(5);
    obj.label7:setTop(70);
    obj.label7:setWidth(395);
    obj.label7:setHeight(25);
    obj.label7:setFontSize(11);
    obj.label7:setText(" - Resumo das raças disponíveis. ");
    obj.label7:setName("label7");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle5);
    obj.button7:setLeft(5);
    obj.button7:setTop(100);
    obj.button7:setWidth(200);
    obj.button7:setText("Raças Hibridas");
    obj.button7:setName("button7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle5);
    obj.label8:setLeft(5);
    obj.label8:setTop(120);
    obj.label8:setWidth(395);
    obj.label8:setHeight(25);
    obj.label8:setFontSize(11);
    obj.label8:setText(" - Raças mestiças e suas regras. ");
    obj.label8:setName("label8");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle5);
    obj.button8:setLeft(5);
    obj.button8:setTop(150);
    obj.button8:setWidth(200);
    obj.button8:setText("Raças por Plano");
    obj.button8:setName("button8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle5);
    obj.label9:setLeft(5);
    obj.label9:setTop(170);
    obj.label9:setWidth(395);
    obj.label9:setHeight(25);
    obj.label9:setFontSize(11);
    obj.label9:setText(" - Separação das raças por plano de origem e onde existem.");
    obj.label9:setName("label9");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle5);
    obj.button9:setLeft(5);
    obj.button9:setTop(200);
    obj.button9:setWidth(200);
    obj.button9:setText("Ajuste de Nível");
    obj.button9:setName("button9");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle5);
    obj.button10:setLeft(55);
    obj.button10:setTop(225);
    obj.button10:setWidth(200);
    obj.button10:setText("Reduzindo o Ajuste");
    obj.button10:setName("button10");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle5);
    obj.button11:setLeft(5);
    obj.button11:setTop(275);
    obj.button11:setWidth(200);
    obj.button11:setText("Raças");
    obj.button11:setName("button11");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle5);
    obj.button12:setLeft(55);
    obj.button12:setTop(300);
    obj.button12:setWidth(200);
    obj.button12:setText("Primatas");
    obj.button12:setName("button12");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle5);
    obj.button13:setLeft(55);
    obj.button13:setTop(325);
    obj.button13:setWidth(200);
    obj.button13:setText("Elfos");
    obj.button13:setName("button13");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle5);
    obj.button14:setLeft(55);
    obj.button14:setTop(350);
    obj.button14:setWidth(200);
    obj.button14:setText("Anões");
    obj.button14:setName("button14");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle5);
    obj.button15:setLeft(55);
    obj.button15:setTop(375);
    obj.button15:setWidth(200);
    obj.button15:setText("Gnomos");
    obj.button15:setName("button15");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.rectangle5);
    obj.button16:setLeft(55);
    obj.button16:setTop(400);
    obj.button16:setWidth(200);
    obj.button16:setText("Halflings");
    obj.button16:setName("button16");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.rectangle5);
    obj.button17:setLeft(55);
    obj.button17:setTop(425);
    obj.button17:setWidth(200);
    obj.button17:setText("Repteis");
    obj.button17:setName("button17");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.rectangle5);
    obj.button18:setLeft(55);
    obj.button18:setTop(450);
    obj.button18:setWidth(200);
    obj.button18:setText("Leporideos");
    obj.button18:setName("button18");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.rectangle5);
    obj.button19:setLeft(55);
    obj.button19:setTop(475);
    obj.button19:setWidth(200);
    obj.button19:setText("Felinos");
    obj.button19:setName("button19");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.rectangle5);
    obj.button20:setLeft(55);
    obj.button20:setTop(500);
    obj.button20:setWidth(200);
    obj.button20:setText("Caninos");
    obj.button20:setName("button20");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.rectangle5);
    obj.button21:setLeft(55);
    obj.button21:setTop(525);
    obj.button21:setWidth(200);
    obj.button21:setText("Humanoides Monstruosos");
    obj.button21:setName("button21");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.rectangle5);
    obj.button22:setLeft(55);
    obj.button22:setTop(550);
    obj.button22:setWidth(200);
    obj.button22:setText("Fadas");
    obj.button22:setName("button22");

    obj.button23 = gui.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.rectangle5);
    obj.button23:setLeft(55);
    obj.button23:setTop(575);
    obj.button23:setWidth(200);
    obj.button23:setText("Extraplanares Nativos");
    obj.button23:setName("button23");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.scrollBox2);
    obj.rectangle6:setLeft(405);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(400);
    obj.rectangle6:setHeight(605);
    obj.rectangle6:setColor("Black");
    obj.rectangle6:setName("rectangle6");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle6);
    obj.label10:setLeft(5);
    obj.label10:setTop(5);
    obj.label10:setWidth(395);
    obj.label10:setHeight(25);
    obj.label10:setText("CLASSES");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.button24 = gui.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.rectangle6);
    obj.button24:setLeft(5);
    obj.button24:setTop(50);
    obj.button24:setWidth(200);
    obj.button24:setText("Súmario");
    obj.button24:setName("button24");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle6);
    obj.label11:setLeft(5);
    obj.label11:setTop(70);
    obj.label11:setWidth(395);
    obj.label11:setHeight(25);
    obj.label11:setFontSize(10);
    obj.label11:setText(" - Lista das classes e seus planos de origem.");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle6);
    obj.label12:setLeft(5);
    obj.label12:setTop(80);
    obj.label12:setWidth(395);
    obj.label12:setHeight(25);
    obj.label12:setFontSize(10);
    obj.label12:setText(" - Observe que mesmo as classes básicas as vezes possuem alterações.");
    obj.label12:setName("label12");

    obj.button25 = gui.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.rectangle6);
    obj.button25:setLeft(5);
    obj.button25:setTop(100);
    obj.button25:setWidth(200);
    obj.button25:setText("Classe Favorecida");
    obj.button25:setName("button25");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle6);
    obj.label13:setLeft(5);
    obj.label13:setTop(120);
    obj.label13:setWidth(395);
    obj.label13:setHeight(25);
    obj.label13:setFontSize(11);
    obj.label13:setText(" - Nova regra para classes favorecidas. ");
    obj.label13:setName("label13");

    obj.button26 = gui.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.rectangle6);
    obj.button26:setLeft(5);
    obj.button26:setTop(150);
    obj.button26:setWidth(200);
    obj.button26:setText("Multiclasse");
    obj.button26:setName("button26");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle6);
    obj.label14:setLeft(5);
    obj.label14:setTop(170);
    obj.label14:setWidth(395);
    obj.label14:setHeight(25);
    obj.label14:setFontSize(11);
    obj.label14:setText(" - Regras da mesa para personagem multiclasse.");
    obj.label14:setName("label14");

    obj.button27 = gui.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.rectangle6);
    obj.button27:setLeft(5);
    obj.button27:setTop(200);
    obj.button27:setWidth(200);
    obj.button27:setText("Descrição das Classes");
    obj.button27:setName("button27");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle6);
    obj.label15:setLeft(5);
    obj.label15:setTop(220);
    obj.label15:setWidth(395);
    obj.label15:setHeight(25);
    obj.label15:setFontSize(11);
    obj.label15:setText(" - Descrição individual de cada classe. ");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle6);
    obj.label16:setLeft(5);
    obj.label16:setTop(250);
    obj.label16:setWidth(395);
    obj.label16:setHeight(25);
    obj.label16:setText("Alternativas de Classe");
    obj.label16:setName("label16");

    obj.button28 = gui.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.rectangle6);
    obj.button28:setLeft(55);
    obj.button28:setTop(275);
    obj.button28:setWidth(200);
    obj.button28:setText("Companheiro Animal");
    obj.button28:setName("button28");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Habilidades");
    obj.tab3:setName("tab3");

    obj.frmBibliotecaRPGmeister03 = gui.fromHandle(_obj_newObject("form"));
    obj.frmBibliotecaRPGmeister03:setParent(obj.tab3);
    obj.frmBibliotecaRPGmeister03:setName("frmBibliotecaRPGmeister03");
    obj.frmBibliotecaRPGmeister03:setAlign("client");
    obj.frmBibliotecaRPGmeister03:setTheme("dark");
    obj.frmBibliotecaRPGmeister03:setMargins({top=1});

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmBibliotecaRPGmeister03);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.scrollBox3);
    obj.rectangle7:setLeft(0);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(400);
    obj.rectangle7:setHeight(200);
    obj.rectangle7:setColor("Black");
    obj.rectangle7:setName("rectangle7");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle7);
    obj.label17:setLeft(5);
    obj.label17:setTop(5);
    obj.label17:setWidth(395);
    obj.label17:setHeight(25);
    obj.label17:setText("PERICIAS");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle7);
    obj.label18:setLeft(5);
    obj.label18:setTop(50);
    obj.label18:setWidth(395);
    obj.label18:setHeight(25);
    obj.label18:setText("Usos Diferentes");
    obj.label18:setName("label18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle7);
    obj.label19:setLeft(5);
    obj.label19:setTop(75);
    obj.label19:setWidth(395);
    obj.label19:setHeight(25);
    obj.label19:setFontSize(11);
    obj.label19:setText(" - Algumas perícias podem ter uso diferente do padrão.");
    obj.label19:setName("label19");

    obj.button29 = gui.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.rectangle7);
    obj.button29:setLeft(55);
    obj.button29:setTop(100);
    obj.button29:setWidth(200);
    obj.button29:setText("Diplomacia");
    obj.button29:setName("button29");

    obj.button30 = gui.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.rectangle7);
    obj.button30:setLeft(55);
    obj.button30:setTop(125);
    obj.button30:setWidth(200);
    obj.button30:setText("Falar Idioma");
    obj.button30:setName("button30");

    obj.button31 = gui.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.rectangle7);
    obj.button31:setLeft(5);
    obj.button31:setTop(150);
    obj.button31:setWidth(200);
    obj.button31:setText("Perícias Raciais");
    obj.button31:setName("button31");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.scrollBox3);
    obj.rectangle8:setLeft(0);
    obj.rectangle8:setTop(205);
    obj.rectangle8:setWidth(400);
    obj.rectangle8:setHeight(400);
    obj.rectangle8:setColor("Black");
    obj.rectangle8:setName("rectangle8");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle8);
    obj.label20:setLeft(5);
    obj.label20:setTop(5);
    obj.label20:setWidth(395);
    obj.label20:setHeight(25);
    obj.label20:setText("TALENTOS");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.button32 = gui.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.rectangle8);
    obj.button32:setLeft(5);
    obj.button32:setTop(50);
    obj.button32:setWidth(200);
    obj.button32:setText("Novos Talentos");
    obj.button32:setName("button32");

    obj.button33 = gui.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.rectangle8);
    obj.button33:setLeft(5);
    obj.button33:setTop(100);
    obj.button33:setWidth(200);
    obj.button33:setText("Novos Talentos Épicos");
    obj.button33:setName("button33");

    obj.button34 = gui.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.rectangle8);
    obj.button34:setLeft(5);
    obj.button34:setTop(150);
    obj.button34:setWidth(200);
    obj.button34:setText("Talentos Equivalentes");
    obj.button34:setName("button34");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle8);
    obj.label21:setLeft(5);
    obj.label21:setTop(170);
    obj.label21:setWidth(395);
    obj.label21:setHeight(25);
    obj.label21:setFontSize(11);
    obj.label21:setText(" - Regras para habilidades pegas múltiplas vezes por conta de características de classe duplicadas.");
    obj.label21:setName("label21");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.scrollBox3);
    obj.rectangle9:setLeft(405);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(400);
    obj.rectangle9:setHeight(605);
    obj.rectangle9:setColor("Black");
    obj.rectangle9:setName("rectangle9");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle9);
    obj.label22:setLeft(5);
    obj.label22:setTop(5);
    obj.label22:setWidth(395);
    obj.label22:setHeight(25);
    obj.label22:setText("MAGIAS");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.button35 = gui.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.rectangle9);
    obj.button35:setLeft(5);
    obj.button35:setTop(50);
    obj.button35:setWidth(200);
    obj.button35:setText("Signos");
    obj.button35:setName("button35");

    obj.button36 = gui.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.rectangle9);
    obj.button36:setLeft(55);
    obj.button36:setTop(75);
    obj.button36:setWidth(200);
    obj.button36:setText("Doutrinas");
    obj.button36:setName("button36");

    obj.button37 = gui.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.rectangle9);
    obj.button37:setLeft(5);
    obj.button37:setTop(125);
    obj.button37:setWidth(200);
    obj.button37:setText("Domínios");
    obj.button37:setName("button37");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle9);
    obj.label23:setLeft(5);
    obj.label23:setTop(175);
    obj.label23:setWidth(395);
    obj.label23:setHeight(25);
    obj.label23:setText("Listas de Magias de Classe");
    obj.label23:setName("label23");

    obj.button38 = gui.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.rectangle9);
    obj.button38:setLeft(55);
    obj.button38:setTop(200);
    obj.button38:setWidth(200);
    obj.button38:setText("Alquimista");
    obj.button38:setName("button38");

    obj.button39 = gui.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.rectangle9);
    obj.button39:setLeft(55);
    obj.button39:setTop(225);
    obj.button39:setWidth(200);
    obj.button39:setText("Cultivador");
    obj.button39:setName("button39");

    obj.button40 = gui.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.rectangle9);
    obj.button40:setLeft(55);
    obj.button40:setTop(250);
    obj.button40:setWidth(200);
    obj.button40:setText("Duelista Arcano");
    obj.button40:setName("button40");

    obj.button41 = gui.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.rectangle9);
    obj.button41:setLeft(55);
    obj.button41:setTop(275);
    obj.button41:setWidth(200);
    obj.button41:setText("Elementalista");
    obj.button41:setName("button41");

    obj.button42 = gui.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.rectangle9);
    obj.button42:setLeft(55);
    obj.button42:setTop(300);
    obj.button42:setWidth(200);
    obj.button42:setText("Execrador");
    obj.button42:setName("button42");

    obj.button43 = gui.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.rectangle9);
    obj.button43:setLeft(55);
    obj.button43:setTop(325);
    obj.button43:setWidth(200);
    obj.button43:setText("Executor");
    obj.button43:setName("button43");

    obj.button44 = gui.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.rectangle9);
    obj.button44:setLeft(55);
    obj.button44:setTop(350);
    obj.button44:setWidth(200);
    obj.button44:setText("Lâmina Arcana");
    obj.button44:setName("button44");

    obj.button45 = gui.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.rectangle9);
    obj.button45:setLeft(55);
    obj.button45:setTop(375);
    obj.button45:setWidth(200);
    obj.button45:setText("Mestre dos Itens Mágicos");
    obj.button45:setName("button45");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.scrollBox3);
    obj.rectangle10:setLeft(810);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(400);
    obj.rectangle10:setHeight(605);
    obj.rectangle10:setColor("Black");
    obj.rectangle10:setName("rectangle10");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle10);
    obj.label24:setLeft(5);
    obj.label24:setTop(5);
    obj.label24:setWidth(395);
    obj.label24:setHeight(25);
    obj.label24:setText("DESCRIÇÕES");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.button46 = gui.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.rectangle10);
    obj.button46:setLeft(5);
    obj.button46:setTop(50);
    obj.button46:setWidth(200);
    obj.button46:setText("Tendência");
    obj.button46:setName("button46");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle10);
    obj.label25:setLeft(5);
    obj.label25:setTop(100);
    obj.label25:setWidth(395);
    obj.label25:setHeight(25);
    obj.label25:setText("Religião");
    obj.label25:setName("label25");

    obj.button47 = gui.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.rectangle10);
    obj.button47:setLeft(55);
    obj.button47:setTop(125);
    obj.button47:setWidth(200);
    obj.button47:setText("Cultos");
    obj.button47:setName("button47");

    obj.button48 = gui.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.rectangle10);
    obj.button48:setLeft(55);
    obj.button48:setTop(150);
    obj.button48:setWidth(200);
    obj.button48:setText("Relações entre Cultos");
    obj.button48:setName("button48");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle10);
    obj.label26:setLeft(55);
    obj.label26:setTop(170);
    obj.label26:setWidth(395);
    obj.label26:setHeight(25);
    obj.label26:setFontSize(11);
    obj.label26:setText(" - A tabela está incompleta.");
    obj.label26:setName("label26");

    obj.button49 = gui.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.rectangle10);
    obj.button49:setLeft(55);
    obj.button49:setTop(200);
    obj.button49:setWidth(200);
    obj.button49:setText("Panteões");
    obj.button49:setName("button49");

    obj.button50 = gui.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.rectangle10);
    obj.button50:setLeft(5);
    obj.button50:setTop(250);
    obj.button50:setWidth(200);
    obj.button50:setText("Idades");
    obj.button50:setName("button50");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Regras");
    obj.tab4:setName("tab4");

    obj.frmBibliotecaRPGmeister04 = gui.fromHandle(_obj_newObject("form"));
    obj.frmBibliotecaRPGmeister04:setParent(obj.tab4);
    obj.frmBibliotecaRPGmeister04:setName("frmBibliotecaRPGmeister04");
    obj.frmBibliotecaRPGmeister04:setAlign("client");
    obj.frmBibliotecaRPGmeister04:setTheme("dark");
    obj.frmBibliotecaRPGmeister04:setMargins({top=1});

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmBibliotecaRPGmeister04);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.scrollBox4);
    obj.rectangle11:setLeft(0);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(400);
    obj.rectangle11:setHeight(605);
    obj.rectangle11:setColor("Black");
    obj.rectangle11:setName("rectangle11");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle11);
    obj.label27:setLeft(5);
    obj.label27:setTop(5);
    obj.label27:setWidth(395);
    obj.label27:setHeight(25);
    obj.label27:setText("EQUIPAMENTOS");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.button51 = gui.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.rectangle11);
    obj.button51:setLeft(5);
    obj.button51:setTop(50);
    obj.button51:setWidth(200);
    obj.button51:setText("Armas");
    obj.button51:setName("button51");

    obj.button52 = gui.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.rectangle11);
    obj.button52:setLeft(55);
    obj.button52:setTop(75);
    obj.button52:setWidth(200);
    obj.button52:setText("Armas Mágicas");
    obj.button52:setName("button52");

    obj.button53 = gui.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.rectangle11);
    obj.button53:setLeft(55);
    obj.button53:setTop(100);
    obj.button53:setWidth(200);
    obj.button53:setText("Armas Únicas");
    obj.button53:setName("button53");

    obj.button54 = gui.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.rectangle11);
    obj.button54:setLeft(55);
    obj.button54:setTop(125);
    obj.button54:setWidth(200);
    obj.button54:setText("Munição");
    obj.button54:setName("button54");

    obj.button55 = gui.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.rectangle11);
    obj.button55:setLeft(55);
    obj.button55:setTop(150);
    obj.button55:setWidth(200);
    obj.button55:setText("Regras para novas Armas");
    obj.button55:setName("button55");

    obj.button56 = gui.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.rectangle11);
    obj.button56:setLeft(5);
    obj.button56:setTop(200);
    obj.button56:setWidth(200);
    obj.button56:setText("Armaduras e Escudos");
    obj.button56:setName("button56");

    obj.button57 = gui.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.rectangle11);
    obj.button57:setLeft(55);
    obj.button57:setTop(225);
    obj.button57:setWidth(200);
    obj.button57:setText("Armaduras e Escudos Mágicos");
    obj.button57:setName("button57");

    obj.button58 = gui.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.rectangle11);
    obj.button58:setLeft(55);
    obj.button58:setTop(250);
    obj.button58:setWidth(200);
    obj.button58:setText("Armaduras e Escudos Únicos");
    obj.button58:setName("button58");

    obj.button59 = gui.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.rectangle11);
    obj.button59:setLeft(5);
    obj.button59:setTop(300);
    obj.button59:setWidth(200);
    obj.button59:setText("Equipamento de Aventura");
    obj.button59:setName("button59");

    obj.button60 = gui.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.rectangle11);
    obj.button60:setLeft(5);
    obj.button60:setTop(350);
    obj.button60:setWidth(200);
    obj.button60:setText("Itens Alquímicos");
    obj.button60:setName("button60");

    obj.button61 = gui.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.rectangle11);
    obj.button61:setLeft(55);
    obj.button61:setTop(375);
    obj.button61:setWidth(200);
    obj.button61:setText("Capsulas");
    obj.button61:setName("button61");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle11);
    obj.label28:setLeft(5);
    obj.label28:setTop(400);
    obj.label28:setWidth(395);
    obj.label28:setHeight(25);
    obj.label28:setText("Armadilhas");
    obj.label28:setName("label28");

    obj.button62 = gui.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.rectangle11);
    obj.button62:setLeft(55);
    obj.button62:setTop(425);
    obj.button62:setWidth(200);
    obj.button62:setText("Armadilhas de Bolso");
    obj.button62:setName("button62");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle11);
    obj.label29:setLeft(5);
    obj.label29:setTop(450);
    obj.label29:setWidth(395);
    obj.label29:setHeight(25);
    obj.label29:setText("Transporte");
    obj.label29:setName("label29");

    obj.button63 = gui.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.rectangle11);
    obj.button63:setLeft(55);
    obj.button63:setTop(475);
    obj.button63:setWidth(200);
    obj.button63:setText("Embarcações");
    obj.button63:setName("button63");

    obj.button64 = gui.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.rectangle11);
    obj.button64:setLeft(55);
    obj.button64:setTop(500);
    obj.button64:setWidth(200);
    obj.button64:setText("Trens");
    obj.button64:setName("button64");

    obj.button65 = gui.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.rectangle11);
    obj.button65:setLeft(55);
    obj.button65:setTop(525);
    obj.button65:setWidth(200);
    obj.button65:setText("Montarias");
    obj.button65:setName("button65");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.scrollBox4);
    obj.rectangle12:setLeft(405);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(400);
    obj.rectangle12:setHeight(605);
    obj.rectangle12:setColor("Black");
    obj.rectangle12:setName("rectangle12");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle12);
    obj.label30:setLeft(5);
    obj.label30:setTop(5);
    obj.label30:setWidth(395);
    obj.label30:setHeight(25);
    obj.label30:setText("EQUIPAMENTOS");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.button66 = gui.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.rectangle12);
    obj.button66:setLeft(5);
    obj.button66:setTop(50);
    obj.button66:setWidth(200);
    obj.button66:setText("Engenhocas a Vapor");
    obj.button66:setName("button66");

    obj.button67 = gui.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.rectangle12);
    obj.button67:setLeft(5);
    obj.button67:setTop(100);
    obj.button67:setWidth(200);
    obj.button67:setText("Imóveis");
    obj.button67:setName("button67");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle12);
    obj.label31:setLeft(5);
    obj.label31:setTop(150);
    obj.label31:setWidth(395);
    obj.label31:setHeight(25);
    obj.label31:setText("Itens Mágicos");
    obj.label31:setName("label31");

    obj.button68 = gui.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.rectangle12);
    obj.button68:setLeft(55);
    obj.button68:setTop(175);
    obj.button68:setWidth(200);
    obj.button68:setText("Objetos Maravilhosos");
    obj.button68:setName("button68");

    obj.button69 = gui.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.rectangle12);
    obj.button69:setLeft(55);
    obj.button69:setTop(200);
    obj.button69:setWidth(200);
    obj.button69:setText("Itens Semi-Mágicos");
    obj.button69:setName("button69");

    obj.button70 = gui.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.rectangle12);
    obj.button70:setLeft(55);
    obj.button70:setTop(225);
    obj.button70:setWidth(200);
    obj.button70:setText("Tatuagens");
    obj.button70:setName("button70");

    obj.button71 = gui.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.rectangle12);
    obj.button71:setLeft(55);
    obj.button71:setTop(250);
    obj.button71:setWidth(200);
    obj.button71:setText("Pergaminhos de Permanência");
    obj.button71:setName("button71");

    obj.button72 = gui.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.rectangle12);
    obj.button72:setLeft(55);
    obj.button72:setTop(275);
    obj.button72:setWidth(200);
    obj.button72:setText("Poções e Óleos");
    obj.button72:setName("button72");

    obj.button73 = gui.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.rectangle12);
    obj.button73:setLeft(55);
    obj.button73:setTop(300);
    obj.button73:setWidth(200);
    obj.button73:setText("Criando Itens Mágicos");
    obj.button73:setName("button73");

    obj.button74 = gui.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.rectangle12);
    obj.button74:setLeft(105);
    obj.button74:setTop(325);
    obj.button74:setWidth(200);
    obj.button74:setText("Tabela de Preços Comuns");
    obj.button74:setName("button74");

    obj.button75 = gui.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.rectangle12);
    obj.button75:setLeft(55);
    obj.button75:setTop(350);
    obj.button75:setWidth(200);
    obj.button75:setText("Artefatos");
    obj.button75:setName("button75");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle12);
    obj.label32:setLeft(5);
    obj.label32:setTop(400);
    obj.label32:setWidth(395);
    obj.label32:setHeight(25);
    obj.label32:setText("Materiais");
    obj.label32:setName("label32");

    obj.button76 = gui.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.rectangle12);
    obj.button76:setLeft(55);
    obj.button76:setTop(425);
    obj.button76:setWidth(200);
    obj.button76:setText("Materiais Especiais");
    obj.button76:setName("button76");

    obj.button77 = gui.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.rectangle12);
    obj.button77:setLeft(55);
    obj.button77:setTop(450);
    obj.button77:setWidth(200);
    obj.button77:setText("Materiais Especiais Épicos");
    obj.button77:setName("button77");

    obj.button78 = gui.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.rectangle12);
    obj.button78:setLeft(55);
    obj.button78:setTop(475);
    obj.button78:setWidth(200);
    obj.button78:setText("Minérios Especiais");
    obj.button78:setName("button78");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox4);
    obj.rectangle13:setLeft(810);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(400);
    obj.rectangle13:setHeight(200);
    obj.rectangle13:setColor("Black");
    obj.rectangle13:setName("rectangle13");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle13);
    obj.label33:setLeft(5);
    obj.label33:setTop(5);
    obj.label33:setWidth(395);
    obj.label33:setHeight(25);
    obj.label33:setText("COMBATES");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.button79 = gui.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.rectangle13);
    obj.button79:setLeft(5);
    obj.button79:setTop(50);
    obj.button79:setWidth(200);
    obj.button79:setText("Encontros");
    obj.button79:setName("button79");

    obj.button80 = gui.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.rectangle13);
    obj.button80:setLeft(5);
    obj.button80:setTop(100);
    obj.button80:setWidth(200);
    obj.button80:setText("Pontos de Vida");
    obj.button80:setName("button80");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.scrollBox4);
    obj.rectangle14:setLeft(810);
    obj.rectangle14:setTop(205);
    obj.rectangle14:setWidth(400);
    obj.rectangle14:setHeight(400);
    obj.rectangle14:setColor("Black");
    obj.rectangle14:setName("rectangle14");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle14);
    obj.label34:setLeft(5);
    obj.label34:setTop(5);
    obj.label34:setWidth(395);
    obj.label34:setHeight(25);
    obj.label34:setText("AVENTURAS");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.button81 = gui.fromHandle(_obj_newObject("button"));
    obj.button81:setParent(obj.rectangle14);
    obj.button81:setLeft(5);
    obj.button81:setTop(50);
    obj.button81:setWidth(200);
    obj.button81:setText("Tesouros");
    obj.button81:setName("button81");

    obj.button82 = gui.fromHandle(_obj_newObject("button"));
    obj.button82:setParent(obj.rectangle14);
    obj.button82:setLeft(5);
    obj.button82:setTop(100);
    obj.button82:setWidth(200);
    obj.button82:setText("Reputação");
    obj.button82:setName("button82");

    obj.button83 = gui.fromHandle(_obj_newObject("button"));
    obj.button83:setParent(obj.rectangle14);
    obj.button83:setLeft(5);
    obj.button83:setTop(150);
    obj.button83:setWidth(200);
    obj.button83:setText("Viajantes Planares");
    obj.button83:setName("button83");

    obj.button84 = gui.fromHandle(_obj_newObject("button"));
    obj.button84:setParent(obj.rectangle14);
    obj.button84:setLeft(5);
    obj.button84:setTop(200);
    obj.button84:setWidth(200);
    obj.button84:setText("Aflições");
    obj.button84:setName("button84");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Cenario");
    obj.tab5:setName("tab5");

    obj.frmBibliotecaRPGmeister05 = gui.fromHandle(_obj_newObject("form"));
    obj.frmBibliotecaRPGmeister05:setParent(obj.tab5);
    obj.frmBibliotecaRPGmeister05:setName("frmBibliotecaRPGmeister05");
    obj.frmBibliotecaRPGmeister05:setAlign("client");
    obj.frmBibliotecaRPGmeister05:setTheme("dark");
    obj.frmBibliotecaRPGmeister05:setMargins({top=1});

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmBibliotecaRPGmeister05);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.scrollBox5);
    obj.rectangle15:setLeft(0);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(400);
    obj.rectangle15:setHeight(605);
    obj.rectangle15:setColor("Black");
    obj.rectangle15:setName("rectangle15");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle15);
    obj.label35:setLeft(5);
    obj.label35:setTop(5);
    obj.label35:setWidth(395);
    obj.label35:setHeight(25);
    obj.label35:setText("CENARIO");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.button85 = gui.fromHandle(_obj_newObject("button"));
    obj.button85:setParent(obj.rectangle15);
    obj.button85:setLeft(5);
    obj.button85:setTop(50);
    obj.button85:setWidth(200);
    obj.button85:setText("Os Planos");
    obj.button85:setName("button85");

    obj.button86 = gui.fromHandle(_obj_newObject("button"));
    obj.button86:setParent(obj.rectangle15);
    obj.button86:setLeft(55);
    obj.button86:setTop(75);
    obj.button86:setWidth(200);
    obj.button86:setText("Paraiso");
    obj.button86:setName("button86");

    obj.button87 = gui.fromHandle(_obj_newObject("button"));
    obj.button87:setParent(obj.rectangle15);
    obj.button87:setLeft(55);
    obj.button87:setTop(100);
    obj.button87:setWidth(200);
    obj.button87:setText("Efíria");
    obj.button87:setName("button87");

    obj.button88 = gui.fromHandle(_obj_newObject("button"));
    obj.button88:setParent(obj.rectangle15);
    obj.button88:setLeft(55);
    obj.button88:setTop(125);
    obj.button88:setWidth(200);
    obj.button88:setText("Centelha");
    obj.button88:setName("button88");

    obj.button89 = gui.fromHandle(_obj_newObject("button"));
    obj.button89:setParent(obj.rectangle15);
    obj.button89:setLeft(55);
    obj.button89:setTop(150);
    obj.button89:setWidth(200);
    obj.button89:setText("SobAlec");
    obj.button89:setName("button89");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle15);
    obj.label36:setLeft(80);
    obj.label36:setTop(175);
    obj.label36:setWidth(395);
    obj.label36:setHeight(25);
    obj.label36:setText("Sob");
    obj.label36:setName("label36");

    obj.button90 = gui.fromHandle(_obj_newObject("button"));
    obj.button90:setParent(obj.rectangle15);
    obj.button90:setLeft(105);
    obj.button90:setTop(200);
    obj.button90:setWidth(200);
    obj.button90:setText("Republica Arcana");
    obj.button90:setName("button90");

    obj.button91 = gui.fromHandle(_obj_newObject("button"));
    obj.button91:setParent(obj.rectangle15);
    obj.button91:setLeft(55);
    obj.button91:setTop(225);
    obj.button91:setWidth(200);
    obj.button91:setText("Ardeal");
    obj.button91:setName("button91");

    obj.button92 = gui.fromHandle(_obj_newObject("button"));
    obj.button92:setParent(obj.rectangle15);
    obj.button92:setLeft(105);
    obj.button92:setTop(250);
    obj.button92:setWidth(200);
    obj.button92:setText("Imperio do Oriente");
    obj.button92:setName("button92");

    obj.button93 = gui.fromHandle(_obj_newObject("button"));
    obj.button93:setParent(obj.rectangle15);
    obj.button93:setLeft(55);
    obj.button93:setTop(275);
    obj.button93:setWidth(200);
    obj.button93:setText("Abismo");
    obj.button93:setName("button93");

    obj.button94 = gui.fromHandle(_obj_newObject("button"));
    obj.button94:setParent(obj.rectangle15);
    obj.button94:setLeft(55);
    obj.button94:setTop(300);
    obj.button94:setWidth(200);
    obj.button94:setText("Diaféle");
    obj.button94:setName("button94");

    obj.button95 = gui.fromHandle(_obj_newObject("button"));
    obj.button95:setParent(obj.rectangle15);
    obj.button95:setLeft(55);
    obj.button95:setTop(325);
    obj.button95:setWidth(200);
    obj.button95:setText("Inferno");
    obj.button95:setName("button95");

    obj.button96 = gui.fromHandle(_obj_newObject("button"));
    obj.button96:setParent(obj.rectangle15);
    obj.button96:setLeft(5);
    obj.button96:setTop(375);
    obj.button96:setWidth(200);
    obj.button96:setText("Escravidão");
    obj.button96:setName("button96");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.scrollBox5);
    obj.rectangle16:setLeft(405);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(400);
    obj.rectangle16:setHeight(605);
    obj.rectangle16:setColor("Black");
    obj.rectangle16:setName("rectangle16");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle16);
    obj.label37:setLeft(5);
    obj.label37:setTop(5);
    obj.label37:setWidth(395);
    obj.label37:setHeight(25);
    obj.label37:setText("MONSTROS");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.button97 = gui.fromHandle(_obj_newObject("button"));
    obj.button97:setParent(obj.rectangle16);
    obj.button97:setLeft(5);
    obj.button97:setTop(50);
    obj.button97:setWidth(200);
    obj.button97:setText("Monstros Diferentes");
    obj.button97:setName("button97");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle16);
    obj.label38:setLeft(5);
    obj.label38:setTop(100);
    obj.label38:setWidth(395);
    obj.label38:setHeight(25);
    obj.label38:setText("Novos Monstros");
    obj.label38:setName("label38");

    obj.button98 = gui.fromHandle(_obj_newObject("button"));
    obj.button98:setParent(obj.rectangle16);
    obj.button98:setLeft(5);
    obj.button98:setTop(125);
    obj.button98:setWidth(200);
    obj.button98:setText("Espirito Possessor");
    obj.button98:setName("button98");

    obj.button99 = gui.fromHandle(_obj_newObject("button"));
    obj.button99:setParent(obj.rectangle16);
    obj.button99:setLeft(5);
    obj.button99:setTop(175);
    obj.button99:setWidth(200);
    obj.button99:setText("Progressão Selvagem");
    obj.button99:setName("button99");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/Ficha%20RPG%20meister.rpk')
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            system.setClipboardText('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/Ficha%20RPG%20meister.rpk')
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Biblioteca%20RPG%20meister%20releases/Change%20Log.txt')
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Biblioteca%20RPG%20meister%20releases/BibliotecaRPGmeister.rpk')
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/zc4131x9qj0rh1t/Ra%C3%A7as.docx?dl=0');
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/br7f1g2ahjy6508/Ra%C3%A7as%20hibridas.docx?dl=0');
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/u33asu0jw6xacyt/Ra%C3%A7as%20por%20plano.docx?dl=0');
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/95rrwibxq2icbpg/Ajuste%20de%20N%C3%ADvel.docx?dl=0');
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/3d6fndbbpj67574/Reduzindo%20ajuste%20de%20n%C3%ADvel.docx?dl=0');
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/g80mv7wohkxb5wf/AACcknnLASBp5jeXUg85bLO9a?dl=0');
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/niq3hkmfcuyus8t/AABbUhvHcInnMcLSMniiIoqFa?dl=0');
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/ylq1dq1d7z23870/AAAKQVYpkGdmCMPNwaCUsnbZa?dl=0');
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/r7o5fbd85lslou2/AABBSX10dINbsOiAU9WqgTgNa?dl=0');
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/r4xp6imj97hx60t/AABUSzB0apDBtHFrC2-F4EG2a?dl=0');
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/cf1a1sb1s4kw061/AADzGHb5VV7CCX2T1Zq6eIKPa?dl=0');
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/qfrkxqu3bkffpzv/AABFrS8PnadoC6RavbLd2QUka?dl=0');
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/0v5ih8us8g5sdwv/AAC1lkFupID6bxqXpAYduMOUa?dl=0');
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/jgmac3hptgbswze/AABHUfMRwuzoxCyGa7aO8bN1a?dl=0');
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/daftbg5sw3kcje9/AADNDrYtQWXaIlka5ZtS-ccYa?dl=0');
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/ozbnjl0ktzzxe0t/AACznpMEeELx-NSNMaPpqUNva?dl=0');
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/l9q0ate5gkg6tvy/AAACvwxQ_WLNw4kbGjsAgrK8a?dl=0');
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/2umf17hzoags2ql/AAB6TzxdzE5VPMmNQa21xDHTa?dl=0');
        end, obj);

    obj._e_event23 = obj.button24:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/7jn484upuwrs5o9/Classes.docx?dl=0');
        end, obj);

    obj._e_event24 = obj.button25:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/y58v5caoovnohzv/Classes%20Favorecidas.docx?dl=0');
        end, obj);

    obj._e_event25 = obj.button26:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/fbt7v6i1fssk0i2/Multiclasse.docx?dl=0');
        end, obj);

    obj._e_event26 = obj.button27:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/fdkfgge18b7grtn/AABBoaLP49SVZm9YH-Vh_fVta?dl=0');
        end, obj);

    obj._e_event27 = obj.button28:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/srjih41d70ng1g4/Companheiro%20Animal.docx?dl=0');
        end, obj);

    obj._e_event28 = obj.button29:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/9tfqbf4hwcu0j6t/Diplomacia.docx?dl=0');
        end, obj);

    obj._e_event29 = obj.button30:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/16l6yd03ksqikcg/Idiomas.docx?dl=0');
        end, obj);

    obj._e_event30 = obj.button31:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ifavh0i1ysypxqm/Pericias%20Raciais.docx?dl=0');
        end, obj);

    obj._e_event31 = obj.button32:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/alp56fyooxhaks0/Novos%20Talentos.docx?dl=0');
        end, obj);

    obj._e_event32 = obj.button33:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/p2ipjp3z88to50h/Novos%20Talentos%20%C3%89picos.docx?dl=0');
        end, obj);

    obj._e_event33 = obj.button34:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ikiwxpl01h7cvqn/Talentos%20equivalentes.docx?dl=0');
        end, obj);

    obj._e_event34 = obj.button35:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/c0iuyky0cpsdedv/Signos.docx?dl=0');
        end, obj);

    obj._e_event35 = obj.button36:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/jimcg230bymgqv4/Doutrinas.docx?dl=0');
        end, obj);

    obj._e_event36 = obj.button37:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/v6p4wgd4z6391a4/Novos%20dominios.docx?dl=0');
        end, obj);

    obj._e_event37 = obj.button38:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/yym7ur8l7ogire8/Lista%20de%20formulas%20do%20alquimista.docx?dl=0');
        end, obj);

    obj._e_event38 = obj.button39:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/30q95h1mw2mvbky/Extratos%20de%20Essencias.docx?dl=0');
        end, obj);

    obj._e_event39 = obj.button40:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/risnouhziu69oj4/Magias%20do%20Duelista%20Arcano.docx?dl=0');
        end, obj);

    obj._e_event40 = obj.button41:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ptdzac0l271e7jv/Elementalismo.docx?dl=0');
        end, obj);

    obj._e_event41 = obj.button42:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ydb523lhcmn768q/Magias%20do%20Execrador.docx?dl=0');
        end, obj);

    obj._e_event42 = obj.button43:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/izeyj7s6i5s0dq4/Lista%20de%20formulas%20do%20executor.docx?dl=0');
        end, obj);

    obj._e_event43 = obj.button44:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/bkr407bs379n2pt/Magias%20do%20L%C3%A2mina%20Arcana.docx?dl=0');
        end, obj);

    obj._e_event44 = obj.button45:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/skdiw7e179audqy/Magias%20do%20Mestre%20dos%20Itens%20Magicos.docx?dl=0');
        end, obj);

    obj._e_event45 = obj.button46:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/8tyws2w55r8yirw/Tend%C3%AAncias.docx?dl=0');
        end, obj);

    obj._e_event46 = obj.button47:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/1t2alvgjonoad3y/Religi%C3%A3o.docx?dl=0');
        end, obj);

    obj._e_event47 = obj.button48:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/2vpa4samjs0moxk/Rela%C3%A7%C3%B5es.docx?dl=0');
        end, obj);

    obj._e_event48 = obj.button49:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/j2o8ucsmjuv9smy/Pante%C3%B5es.docx?dl=0');
        end, obj);

    obj._e_event49 = obj.button50:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/wnkzixhjjfyte3m/Idades.docx?dl=0');
        end, obj);

    obj._e_event50 = obj.button51:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/lndl6jmrulyqnxj/Armas.docx?dl=0');
        end, obj);

    obj._e_event51 = obj.button52:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ql85oxst00yja9h/Armas%20Magicas.docx?dl=0');
        end, obj);

    obj._e_event52 = obj.button53:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/7esdqqograh6dfp/Armas%20Especificas.docx?dl=0');
        end, obj);

    obj._e_event53 = obj.button54:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/rbyy4n626ltke1e/Municao.docx?dl=0');
        end, obj);

    obj._e_event54 = obj.button55:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/vt4tnzqtx5t2cd0/Criando%20regras%20para%20novas%20armas.docx?dl=0');
        end, obj);

    obj._e_event55 = obj.button56:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/errboycithawyqy/Armaduras.docx?dl=0');
        end, obj);

    obj._e_event56 = obj.button57:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/6xx7ea8son0b9m5/Armaduras%20Magicas.docx?dl=0');
        end, obj);

    obj._e_event57 = obj.button58:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/35q20wcjw39u45u/Armaduras%20Espec%C3%ADficas.docx?dl=0');
        end, obj);

    obj._e_event58 = obj.button59:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/zarfvtto7k9u151/Equipamento%20de%20Aventura.docx?dl=0');
        end, obj);

    obj._e_event59 = obj.button60:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/r13wz5zjyv0pq39/Itens%20Alquimicos.docx?dl=0');
        end, obj);

    obj._e_event60 = obj.button61:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/j522t8pqeburd16/Capsulas%20Alquimicas%20para%20Armas.docx?dl=0');
        end, obj);

    obj._e_event61 = obj.button62:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/sw0qq2wqbjvb9yv/Armadilhas%20de%20bolso.docx?dl=0');
        end, obj);

    obj._e_event62 = obj.button63:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/07ekmm6xjsa4iht/Embarca%C3%A7%C3%B5es.docx?dl=0');
        end, obj);

    obj._e_event63 = obj.button64:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/s2vwy3hbvbjep7r/Trens.docx?dl=0');
        end, obj);

    obj._e_event64 = obj.button65:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/2k9og5zf7ivsenz/Montarias%20e%20animais%20treinados.docx?dl=0');
        end, obj);

    obj._e_event65 = obj.button66:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/4c9c8emfwy6gsi3/Engenhocas%20a%20Vapor.docx?dl=0');
        end, obj);

    obj._e_event66 = obj.button67:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/vnpzg60e8310303/Constru%C3%A7%C3%B5es.docx?dl=0');
        end, obj);

    obj._e_event67 = obj.button68:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/s2k4rpegaqw4f2p/Objetos%20Maravilhosos.docx?dl=0');
        end, obj);

    obj._e_event68 = obj.button69:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/zaxd5ctg5j9gn7j/Itens%20Semi%20Magicos.docx?dl=0');
        end, obj);

    obj._e_event69 = obj.button70:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/si17f1sa6cd2fkz/Tatuagens%20m%C3%A1gicas.docx?dl=0');
        end, obj);

    obj._e_event70 = obj.button71:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/h74lv8li44m8ydf/Permanencias.docx?dl=0');
        end, obj);

    obj._e_event71 = obj.button72:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/eq9jn7uq5titrs1/Po%C3%A7%C3%B5es%20e%20%C3%B3leos.docx?dl=0');
        end, obj);

    obj._e_event72 = obj.button73:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/desamzckfsqwns7/Criando%20Itens%20Magicos.docx?dl=0');
        end, obj);

    obj._e_event73 = obj.button74:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/mfsud2fmbi4m2gj/Tabela%20de%20pre%C3%A7os%20comuns%20para%20itens.docx?dl=0');
        end, obj);

    obj._e_event74 = obj.button75:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/ugaaq8i5pkwsb07/Artefatos.docx?dl=0');
        end, obj);

    obj._e_event75 = obj.button76:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/2nupgkolby6skii/Materiais%20Especiais.docx?dl=0');
        end, obj);

    obj._e_event76 = obj.button77:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/q61v9rj8e35ughq/Materiais%20Especiais%20%C3%89picos.docx?dl=0');
        end, obj);

    obj._e_event77 = obj.button78:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/1kqe5xulj4pekvp/Minerios%20Especiais.docx?dl=0');
        end, obj);

    obj._e_event78 = obj.button79:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/fvgux8l7vcc3oyu/Lidando%20com%20Encontros.docx?dl=0');
        end, obj);

    obj._e_event79 = obj.button80:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/fv3s150m8t05txs/Novo%20sistema%20para%20pontos%20de%20vida.docx?dl=0');
        end, obj);

    obj._e_event80 = obj.button81:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/j81pnwwy0nrj528/Dinheiro%20por%20n%C3%ADvel.xlsx?dl=0');
        end, obj);

    obj._e_event81 = obj.button82:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/qiwhwbcge46sdvn/Reputa%C3%A7%C3%A3o.docx?dl=0');
        end, obj);

    obj._e_event82 = obj.button83:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/v7xpo0g5i2z0ofp/Viajantes%20Planares.docx?dl=0');
        end, obj);

    obj._e_event83 = obj.button84:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/y42yy8aap8tmbxw/AAC1A6GGnTCUPfNyp2OpYEtja?dl=0');
        end, obj);

    obj._e_event84 = obj.button85:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/1aw740u9b3wvjrt/Os%20Planos.docx?dl=0');
        end, obj);

    obj._e_event85 = obj.button86:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/9g61gaiqp1w26pj/AAB6L8e2tCRr-SIpuT3USDu8a?dl=0');
        end, obj);

    obj._e_event86 = obj.button87:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/y2k6m6txanthymt/AABWdGLGGHmf5Zm5SZ5NuyBGa?dl=0');
        end, obj);

    obj._e_event87 = obj.button88:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/dhm0ej851nwvajd/AABBIgmm9z1vtlTFtv1vzyTFa?dl=0');
        end, obj);

    obj._e_event88 = obj.button89:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/ra93f3459bm1599/AAC8ddVoiSn2s4MAHdtTYkHCa?dl=0');
        end, obj);

    obj._e_event89 = obj.button90:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/z8d3w39ohi7d30z/AACuzzRRpK7q0i6P8PZMhM8ka?dl=0');
        end, obj);

    obj._e_event90 = obj.button91:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/ufgop6i95f291wt/AAAlAuAEkRhwJR07fDe-OhVZa?dl=0');
        end, obj);

    obj._e_event91 = obj.button92:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/w9n6kypcgp26tcr/AABo3e-AU3b3iYYBmeSQ2Bq2a?dl=0');
        end, obj);

    obj._e_event92 = obj.button93:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/qtxprhcc5wg67m7/AAD42F9E38y91g9Vs5-FIccta?dl=0');
        end, obj);

    obj._e_event93 = obj.button94:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/ck4kjvwoyq18mqq/AACdzNfXQecCv3WFS9y5TaPTa?dl=0');
        end, obj);

    obj._e_event94 = obj.button95:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/sh/wut4r54ypjdsvtm/AAAROtZ746UjrJInElkn_xS9a?dl=0');
        end, obj);

    obj._e_event95 = obj.button96:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/10b630bqoul2iv1/Como%20a%20Escravid%C3%A3o%20%C3%A9%20vista%20em%20cada%20plano.docx?dl=0');
        end, obj);

    obj._e_event96 = obj.button97:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/92oujsl7fxdovyw/Monstros%20Diferentes.docx?dl=0');
        end, obj);

    obj._e_event97 = obj.button98:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/rrr5b02wow5uksp/Espirito%20Possessor.docx?dl=0');
        end, obj);

    obj._e_event98 = obj.button99:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://www.dropbox.com/s/e0e1afgbzhv93qk/Progress%C3%B5es%20Selvagens.docx?dl=0');
        end, obj);

    function obj:_releaseEvents()
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

        if self.frmBibliotecaRPGmeister04 ~= nil then self.frmBibliotecaRPGmeister04:destroy(); self.frmBibliotecaRPGmeister04 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.button96 ~= nil then self.button96:destroy(); self.button96 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.button85 ~= nil then self.button85:destroy(); self.button85 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.button93 ~= nil then self.button93:destroy(); self.button93 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.button88 ~= nil then self.button88:destroy(); self.button88 = nil; end;
        if self.button91 ~= nil then self.button91:destroy(); self.button91 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.frmBibliotecaRPGmeister05 ~= nil then self.frmBibliotecaRPGmeister05:destroy(); self.frmBibliotecaRPGmeister05 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.button95 ~= nil then self.button95:destroy(); self.button95 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.button94 ~= nil then self.button94:destroy(); self.button94 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.frmBibliotecaRPGmeister02 ~= nil then self.frmBibliotecaRPGmeister02:destroy(); self.frmBibliotecaRPGmeister02 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.button90 ~= nil then self.button90:destroy(); self.button90 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.button99 ~= nil then self.button99:destroy(); self.button99 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.button87 ~= nil then self.button87:destroy(); self.button87 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.button81 ~= nil then self.button81:destroy(); self.button81 = nil; end;
        if self.button98 ~= nil then self.button98:destroy(); self.button98 = nil; end;
        if self.button83 ~= nil then self.button83:destroy(); self.button83 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.button84 ~= nil then self.button84:destroy(); self.button84 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.button82 ~= nil then self.button82:destroy(); self.button82 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.frmBibliotecaRPGmeister01 ~= nil then self.frmBibliotecaRPGmeister01:destroy(); self.frmBibliotecaRPGmeister01 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.frmBibliotecaRPGmeister03 ~= nil then self.frmBibliotecaRPGmeister03:destroy(); self.frmBibliotecaRPGmeister03 = nil; end;
        if self.button86 ~= nil then self.button86:destroy(); self.button86 = nil; end;
        if self.button92 ~= nil then self.button92:destroy(); self.button92 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.button97 ~= nil then self.button97:destroy(); self.button97 = nil; end;
        if self.button89 ~= nil then self.button89:destroy(); self.button89 = nil; end;
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
    dataType = "Ambesek.Biblioteca.RPGmeister", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Biblioteca RPGmeister", 
    description=""};

frmBibliotecaRPGmeister = _frmBibliotecaRPGmeister;
rrpg.registrarForm(_frmBibliotecaRPGmeister);
rrpg.registrarDataType(_frmBibliotecaRPGmeister);

return _frmBibliotecaRPGmeister;
