require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmMain()
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
    obj:setName("frmMain");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.Numenera");
    obj:setTitle("Ficha Numenéra");
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

    obj.frmGeneral = gui.fromHandle(_obj_newObject("form"));
    obj.frmGeneral:setParent(obj.tab1);
    obj.frmGeneral:setName("frmGeneral");
    obj.frmGeneral:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmGeneral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(410);
    obj.rectangle1:setHeight(110);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setText("NOME");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(100);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(300);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(100);
    obj.label2:setHeight(25);
    obj.label2:setText("TIPO");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(100);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(300);
    obj.edit2:setHeight(25);
    obj.edit2:setField("tipo");
    obj.edit2:setName("edit2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(5);
    obj.label3:setTop(55);
    obj.label3:setWidth(100);
    obj.label3:setHeight(25);
    obj.label3:setText("DESCRITOR");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(100);
    obj.edit3:setTop(55);
    obj.edit3:setWidth(300);
    obj.edit3:setHeight(25);
    obj.edit3:setField("descritor");
    obj.edit3:setName("edit3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(5);
    obj.label4:setTop(80);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setText("FOCO");
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(100);
    obj.edit4:setTop(80);
    obj.edit4:setWidth(300);
    obj.edit4:setHeight(25);
    obj.edit4:setField("foco");
    obj.edit4:setName("edit4");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(120);
    obj.rectangle2:setWidth(410);
    obj.rectangle2:setHeight(300);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle2);
    obj.button1:setLeft(5);
    obj.button1:setTop(5);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setHint("Adicionar Antecedente");
    obj.button1:setName("button1");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setLeft(35);
    obj.label5:setTop(5);
    obj.label5:setWidth(100);
    obj.label5:setHeight(25);
    obj.label5:setText("ANTECEDENTE");
    obj.label5:setName("label5");

    obj.rclAntecedente = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclAntecedente:setParent(obj.rectangle2);
    obj.rclAntecedente:setLeft(5);
    obj.rclAntecedente:setTop(30);
    obj.rclAntecedente:setWidth(400);
    obj.rclAntecedente:setHeight(260);
    obj.rclAntecedente:setName("rclAntecedente");
    obj.rclAntecedente:setField("listaDeAntecedentes");
    obj.rclAntecedente:setTemplateForm("frmSimpleListItem");
    obj.rclAntecedente:setLayout("verticalTiles");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(420);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(410);
    obj.rectangle3:setHeight(300);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle3);
    obj.button2:setLeft(5);
    obj.button2:setTop(5);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setHint("Adicionar Habilidade Especial");
    obj.button2:setName("button2");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle3);
    obj.label6:setLeft(35);
    obj.label6:setTop(5);
    obj.label6:setWidth(200);
    obj.label6:setHeight(25);
    obj.label6:setText("HABILIDADES ESPECIAIS");
    obj.label6:setName("label6");

    obj.rclHabilidadesEspeciais = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesEspeciais:setParent(obj.rectangle3);
    obj.rclHabilidadesEspeciais:setLeft(5);
    obj.rclHabilidadesEspeciais:setTop(30);
    obj.rclHabilidadesEspeciais:setWidth(400);
    obj.rclHabilidadesEspeciais:setHeight(260);
    obj.rclHabilidadesEspeciais:setName("rclHabilidadesEspeciais");
    obj.rclHabilidadesEspeciais:setField("listaDeHabilidadesEspeciais");
    obj.rclHabilidadesEspeciais:setTemplateForm("frmSimpleListItem");
    obj.rclHabilidadesEspeciais:setLayout("verticalTiles");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(420);
    obj.rectangle4:setTop(310);
    obj.rectangle4:setWidth(410);
    obj.rectangle4:setHeight(120);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle4);
    obj.label7:setLeft(35);
    obj.label7:setTop(5);
    obj.label7:setWidth(200);
    obj.label7:setHeight(25);
    obj.label7:setText("DESENVOLVIMENTO");
    obj.label7:setName("label7");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle4);
    obj.checkBox1:setField("desenvolvimento0");
    obj.checkBox1:setLeft(5);
    obj.checkBox1:setTop(35);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setText("AUMENTAR HABILIDADES");
    obj.checkBox1:setHint("4 pontos nos atributos.");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.rectangle4);
    obj.checkBox2:setField("desenvolvimento1");
    obj.checkBox2:setLeft(5);
    obj.checkBox2:setTop(55);
    obj.checkBox2:setWidth(200);
    obj.checkBox2:setText("IR EM DIREÇÃO A PERFEIÇÃO.");
    obj.checkBox2:setHint("Adicione um a uma de suas margens. ");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.rectangle4);
    obj.checkBox3:setField("desenvolvimento2");
    obj.checkBox3:setLeft(5);
    obj.checkBox3:setTop(75);
    obj.checkBox3:setWidth(200);
    obj.checkBox3:setText("ESFORÇO EXTRA.");
    obj.checkBox3:setHint("Aumente esforço em 1.");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.rectangle4);
    obj.checkBox4:setField("desenvolvimento3");
    obj.checkBox4:setLeft(5);
    obj.checkBox4:setTop(95);
    obj.checkBox4:setWidth(200);
    obj.checkBox4:setText("TREINAMENTO DE PERICIAS.");
    obj.checkBox4:setHint("Torne-se treinado em uma perícia a sua escolha, ou especialize-se em uma que já for treinado. ");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.rectangle4);
    obj.checkBox5:setField("desenvolvimento4");
    obj.checkBox5:setLeft(205);
    obj.checkBox5:setTop(35);
    obj.checkBox5:setWidth(70);
    obj.checkBox5:setText("OUTRO");
    obj.checkBox5:setName("checkBox5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle4);
    obj.edit5:setLeft(275);
    obj.edit5:setTop(35);
    obj.edit5:setWidth(125);
    obj.edit5:setHeight(20);
    obj.edit5:setField("outroDesenvolvimento4");
    obj.edit5:setFontSize(11);
    obj.edit5:setName("edit5");

    obj.checkBox6 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.rectangle4);
    obj.checkBox6:setField("desenvolvimento5");
    obj.checkBox6:setLeft(205);
    obj.checkBox6:setTop(55);
    obj.checkBox6:setWidth(70);
    obj.checkBox6:setText("OUTRO");
    obj.checkBox6:setName("checkBox6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle4);
    obj.edit6:setLeft(275);
    obj.edit6:setTop(55);
    obj.edit6:setWidth(125);
    obj.edit6:setHeight(20);
    obj.edit6:setField("outroDesenvolvimento5");
    obj.edit6:setFontSize(11);
    obj.edit6:setName("edit6");

    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.rectangle4);
    obj.checkBox7:setField("desenvolvimento6");
    obj.checkBox7:setLeft(205);
    obj.checkBox7:setTop(75);
    obj.checkBox7:setWidth(70);
    obj.checkBox7:setText("OUTRO");
    obj.checkBox7:setName("checkBox7");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle4);
    obj.edit7:setLeft(275);
    obj.edit7:setTop(75);
    obj.edit7:setWidth(125);
    obj.edit7:setHeight(20);
    obj.edit7:setField("outroDesenvolvimento6");
    obj.edit7:setFontSize(11);
    obj.edit7:setName("edit7");

    obj.checkBox8 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.rectangle4);
    obj.checkBox8:setField("desenvolvimento7");
    obj.checkBox8:setLeft(205);
    obj.checkBox8:setTop(95);
    obj.checkBox8:setWidth(70);
    obj.checkBox8:setText("OUTRO");
    obj.checkBox8:setName("checkBox8");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle4);
    obj.edit8:setLeft(275);
    obj.edit8:setTop(95);
    obj.edit8:setWidth(125);
    obj.edit8:setHeight(20);
    obj.edit8:setField("outroDesenvolvimento7");
    obj.edit8:setFontSize(11);
    obj.edit8:setName("edit8");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(840);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(362);
    obj.rectangle5:setHeight(362);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(841);
    obj.image1:setTop(1);
    obj.image1:setWidth(360);
    obj.image1:setHeight(360);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Habilidades");
    obj.tab2:setName("tab2");

    obj.frmAbilities = gui.fromHandle(_obj_newObject("form"));
    obj.frmAbilities:setParent(obj.tab2);
    obj.frmAbilities:setName("frmAbilities");
    obj.frmAbilities:setAlign("client");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmAbilities);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.scrollBox2);
    obj.rectangle6:setLeft(0);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(370);
    obj.rectangle6:setHeight(35);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle6);
    obj.label8:setLeft(5);
    obj.label8:setTop(5);
    obj.label8:setWidth(50);
    obj.label8:setHeight(25);
    obj.label8:setText("GRAU");
    obj.label8:setName("label8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle6);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(50);
    obj.edit9:setTop(5);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("grau");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle6);
    obj.label9:setLeft(110);
    obj.label9:setTop(5);
    obj.label9:setWidth(50);
    obj.label9:setHeight(25);
    obj.label9:setText("ESFORÇO");
    obj.label9:setFontSize(10);
    obj.label9:setName("label9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle6);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(160);
    obj.edit10:setTop(5);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("esforco");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle6);
    obj.label10:setLeft(215);
    obj.label10:setTop(5);
    obj.label10:setWidth(50);
    obj.label10:setHeight(25);
    obj.label10:setText("XP");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle6);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(265);
    obj.edit11:setTop(5);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("xp");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.scrollBox2);
    obj.rectangle7:setLeft(0);
    obj.rectangle7:setTop(45);
    obj.rectangle7:setWidth(370);
    obj.rectangle7:setHeight(110);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle7);
    obj.label11:setLeft(55);
    obj.label11:setTop(5);
    obj.label11:setWidth(100);
    obj.label11:setHeight(25);
    obj.label11:setText("POTÊNCIA");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle7);
    obj.label12:setLeft(160);
    obj.label12:setTop(5);
    obj.label12:setWidth(100);
    obj.label12:setHeight(25);
    obj.label12:setText("VELOCIDADE");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle7);
    obj.label13:setLeft(265);
    obj.label13:setTop(5);
    obj.label13:setWidth(100);
    obj.label13:setHeight(25);
    obj.label13:setText("INTELECTO");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle7);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(55);
    obj.edit12:setTop(30);
    obj.edit12:setWidth(100);
    obj.edit12:setHeight(25);
    obj.edit12:setField("potencia");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle7);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(160);
    obj.edit13:setTop(30);
    obj.edit13:setWidth(100);
    obj.edit13:setHeight(25);
    obj.edit13:setField("velocidade");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle7);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(265);
    obj.edit14:setTop(30);
    obj.edit14:setWidth(100);
    obj.edit14:setHeight(25);
    obj.edit14:setField("intelecto");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle7);
    obj.label14:setLeft(5);
    obj.label14:setTop(55);
    obj.label14:setWidth(100);
    obj.label14:setHeight(25);
    obj.label14:setText("Margem");
    obj.label14:setName("label14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle7);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(80);
    obj.edit15:setTop(55);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("potenciaMargem");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle7);
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(185);
    obj.edit16:setTop(55);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("velocidadeMargem");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle7);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(290);
    obj.edit17:setTop(55);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("intelectoMargem");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle7);
    obj.label15:setLeft(5);
    obj.label15:setTop(80);
    obj.label15:setWidth(100);
    obj.label15:setHeight(25);
    obj.label15:setText("Reserva");
    obj.label15:setName("label15");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle7);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(80);
    obj.edit18:setTop(80);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setField("potenciaReserva");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle7);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(185);
    obj.edit19:setTop(80);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(25);
    obj.edit19:setField("velocidadeReserva");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle7);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(290);
    obj.edit20:setTop(80);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(25);
    obj.edit20:setField("intelectoReserva");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.scrollBox2);
    obj.rectangle8:setLeft(0);
    obj.rectangle8:setTop(165);
    obj.rectangle8:setWidth(370);
    obj.rectangle8:setHeight(60);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle8);
    obj.label16:setLeft(35);
    obj.label16:setTop(5);
    obj.label16:setWidth(200);
    obj.label16:setHeight(25);
    obj.label16:setText("DANO");
    obj.label16:setName("label16");

    obj.checkBox9 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.rectangle8);
    obj.checkBox9:setField("dano0");
    obj.checkBox9:setLeft(5);
    obj.checkBox9:setTop(35);
    obj.checkBox9:setWidth(180);
    obj.checkBox9:setText("ENFRAQUECIDO");
    obj.checkBox9:setHint("Esforço custa  ponto extra por nível aplicado. Todos os efeitos maiores e menores rolados são ignorados. 17-20 +1 Dano.");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.rectangle8);
    obj.checkBox10:setField("dano1");
    obj.checkBox10:setLeft(180);
    obj.checkBox10:setTop(35);
    obj.checkBox10:setWidth(180);
    obj.checkBox10:setText("DEBILITADO");
    obj.checkBox10:setHint("Não pode realizar ações exceto mover / rastejar. Não pode se mover se velocidade for zero. ");
    obj.checkBox10:setName("checkBox10");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.scrollBox2);
    obj.rectangle9:setLeft(0);
    obj.rectangle9:setTop(235);
    obj.rectangle9:setWidth(370);
    obj.rectangle9:setHeight(60);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle9);
    obj.label17:setLeft(35);
    obj.label17:setTop(5);
    obj.label17:setWidth(100);
    obj.label17:setHeight(25);
    obj.label17:setText("RECUPERAÇÃO");
    obj.label17:setName("label17");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle9);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(130);
    obj.edit21:setTop(5);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(25);
    obj.edit21:setField("recuperacao");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.checkBox11 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.rectangle9);
    obj.checkBox11:setField("recuperacao0");
    obj.checkBox11:setLeft(5);
    obj.checkBox11:setTop(35);
    obj.checkBox11:setWidth(90);
    obj.checkBox11:setText("1 Ação");
    obj.checkBox11:setHorzTextAlign("center");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.rectangle9);
    obj.checkBox12:setField("recuperacao1");
    obj.checkBox12:setLeft(90);
    obj.checkBox12:setTop(35);
    obj.checkBox12:setWidth(90);
    obj.checkBox12:setText("10 Minutos");
    obj.checkBox12:setHorzTextAlign("center");
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.rectangle9);
    obj.checkBox13:setField("recuperacao2");
    obj.checkBox13:setLeft(180);
    obj.checkBox13:setTop(35);
    obj.checkBox13:setWidth(90);
    obj.checkBox13:setText("1 Hora");
    obj.checkBox13:setHorzTextAlign("center");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.rectangle9);
    obj.checkBox14:setField("recuperacao3");
    obj.checkBox14:setLeft(270);
    obj.checkBox14:setTop(35);
    obj.checkBox14:setWidth(90);
    obj.checkBox14:setText("10 Horas");
    obj.checkBox14:setHorzTextAlign("center");
    obj.checkBox14:setName("checkBox14");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.scrollBox2);
    obj.rectangle10:setLeft(0);
    obj.rectangle10:setTop(305);
    obj.rectangle10:setWidth(370);
    obj.rectangle10:setHeight(35);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle10);
    obj.label18:setLeft(35);
    obj.label18:setTop(5);
    obj.label18:setWidth(100);
    obj.label18:setHeight(25);
    obj.label18:setText("ARMADURA");
    obj.label18:setName("label18");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle10);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(130);
    obj.edit22:setTop(5);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setField("armadura");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.scrollBox2);
    obj.rectangle11:setLeft(380);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(520);
    obj.rectangle11:setHeight(340);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle11);
    obj.button3:setLeft(5);
    obj.button3:setTop(5);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("+");
    obj.button3:setHint("Adicionar Pericia");
    obj.button3:setName("button3");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle11);
    obj.label19:setLeft(35);
    obj.label19:setTop(5);
    obj.label19:setWidth(100);
    obj.label19:setHeight(25);
    obj.label19:setText("PERÍCIAS");
    obj.label19:setName("label19");

    obj.rclPericias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclPericias:setParent(obj.rectangle11);
    obj.rclPericias:setLeft(5);
    obj.rclPericias:setTop(30);
    obj.rclPericias:setWidth(510);
    obj.rclPericias:setHeight(300);
    obj.rclPericias:setName("rclPericias");
    obj.rclPericias:setField("listaDePericias");
    obj.rclPericias:setTemplateForm("frmSkillItem");
    obj.rclPericias:setLayout("verticalTiles");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Inventario");
    obj.tab3:setName("tab3");

    obj.frmInventory = gui.fromHandle(_obj_newObject("form"));
    obj.frmInventory:setParent(obj.tab3);
    obj.frmInventory:setName("frmInventory");
    obj.frmInventory:setAlign("client");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmInventory);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.scrollBox3);
    obj.rectangle12:setLeft(0);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(275);
    obj.rectangle12:setHeight(600);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle12);
    obj.button4:setLeft(5);
    obj.button4:setTop(5);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setText("+");
    obj.button4:setHint("Adicionar Cifra");
    obj.button4:setName("button4");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle12);
    obj.label20:setLeft(35);
    obj.label20:setTop(5);
    obj.label20:setWidth(100);
    obj.label20:setHeight(25);
    obj.label20:setText("CIFRAS");
    obj.label20:setName("label20");

    obj.rclCifras = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclCifras:setParent(obj.rectangle12);
    obj.rclCifras:setLeft(5);
    obj.rclCifras:setTop(30);
    obj.rclCifras:setWidth(265);
    obj.rclCifras:setHeight(560);
    obj.rclCifras:setName("rclCifras");
    obj.rclCifras:setField("listaDeCifras");
    obj.rclCifras:setTemplateForm("frmCypherItem");
    obj.rclCifras:setLayout("vertical");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox3);
    obj.rectangle13:setLeft(285);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(205);
    obj.rectangle13:setHeight(600);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle13);
    obj.button5:setLeft(5);
    obj.button5:setTop(5);
    obj.button5:setWidth(25);
    obj.button5:setHeight(25);
    obj.button5:setText("+");
    obj.button5:setHint("Adicionar Cifra");
    obj.button5:setName("button5");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle13);
    obj.label21:setLeft(35);
    obj.label21:setTop(5);
    obj.label21:setWidth(200);
    obj.label21:setHeight(25);
    obj.label21:setText("ARTEFATOS e ESQUISITICES");
    obj.label21:setName("label21");

    obj.rclArtifacts = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclArtifacts:setParent(obj.rectangle13);
    obj.rclArtifacts:setLeft(5);
    obj.rclArtifacts:setTop(30);
    obj.rclArtifacts:setWidth(200);
    obj.rclArtifacts:setHeight(560);
    obj.rclArtifacts:setName("rclArtifacts");
    obj.rclArtifacts:setField("listaDeArtefatos");
    obj.rclArtifacts:setTemplateForm("frmSimpleListItem");
    obj.rclArtifacts:setLayout("vertical");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.scrollBox3);
    obj.rectangle14:setLeft(500);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(205);
    obj.rectangle14:setHeight(600);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setName("rectangle14");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle14);
    obj.button6:setLeft(5);
    obj.button6:setTop(5);
    obj.button6:setWidth(25);
    obj.button6:setHeight(25);
    obj.button6:setText("+");
    obj.button6:setHint("Adicionar Equipamento");
    obj.button6:setName("button6");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle14);
    obj.label22:setLeft(35);
    obj.label22:setTop(5);
    obj.label22:setWidth(200);
    obj.label22:setHeight(25);
    obj.label22:setText("EQUIPAMENTOS   Shins");
    obj.label22:setName("label22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle14);
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(175);
    obj.edit23:setTop(5);
    obj.edit23:setWidth(25);
    obj.edit23:setHeight(25);
    obj.edit23:setField("shins");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.rclEquipment = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclEquipment:setParent(obj.rectangle14);
    obj.rclEquipment:setLeft(5);
    obj.rclEquipment:setTop(30);
    obj.rclEquipment:setWidth(200);
    obj.rclEquipment:setHeight(560);
    obj.rclEquipment:setName("rclEquipment");
    obj.rclEquipment:setField("listaDeEquipamentos");
    obj.rclEquipment:setTemplateForm("frmSimpleListItem");
    obj.rclEquipment:setLayout("vertical");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.scrollBox3);
    obj.rectangle15:setLeft(715);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(295);
    obj.rectangle15:setHeight(600);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setName("rectangle15");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle15);
    obj.button7:setLeft(5);
    obj.button7:setTop(5);
    obj.button7:setWidth(25);
    obj.button7:setHeight(25);
    obj.button7:setText("+");
    obj.button7:setHint("Adicionar Ataque");
    obj.button7:setName("button7");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle15);
    obj.label23:setLeft(35);
    obj.label23:setTop(5);
    obj.label23:setWidth(250);
    obj.label23:setHeight(25);
    obj.label23:setText("ATAQUES                   MOD  DANO");
    obj.label23:setName("label23");

    obj.rclAtaques = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclAtaques:setParent(obj.rectangle15);
    obj.rclAtaques:setLeft(5);
    obj.rclAtaques:setTop(30);
    obj.rclAtaques:setWidth(285);
    obj.rclAtaques:setHeight(560);
    obj.rclAtaques:setName("rclAtaques");
    obj.rclAtaques:setField("listaDeAtaques");
    obj.rclAtaques:setTemplateForm("frmAttackItem");
    obj.rclAtaques:setLayout("vertical");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Descrição");
    obj.tab4:setName("tab4");

    obj.frmTemplateDescription = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab4);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmTemplateDescription);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.scrollBox4);
    obj.rectangle16:setLeft(0);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(1205);
    obj.rectangle16:setHeight(105);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setName("rectangle16");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle16);
    obj.label24:setLeft(3);
    obj.label24:setTop(1);
    obj.label24:setWidth(100);
    obj.label24:setHeight(20);
    obj.label24:setText("DESCRIÇÃO");
    obj.label24:setName("label24");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle16);
    obj.label25:setLeft(10);
    obj.label25:setTop(25);
    obj.label25:setWidth(90);
    obj.label25:setHeight(20);
    obj.label25:setText("TAMANHO");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle16);
    obj.edit24:setLeft(100);
    obj.edit24:setTop(25);
    obj.edit24:setWidth(200);
    obj.edit24:setHeight(25);
    obj.edit24:setField("tamanho");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setName("edit24");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle16);
    obj.label26:setLeft(10);
    obj.label26:setTop(50);
    obj.label26:setWidth(90);
    obj.label26:setHeight(20);
    obj.label26:setText("ALTURA");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangle16);
    obj.edit25:setLeft(100);
    obj.edit25:setTop(50);
    obj.edit25:setWidth(200);
    obj.edit25:setHeight(25);
    obj.edit25:setField("altura");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setName("edit25");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle16);
    obj.label27:setLeft(10);
    obj.label27:setTop(75);
    obj.label27:setWidth(90);
    obj.label27:setHeight(20);
    obj.label27:setText("PESO");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle16);
    obj.edit26:setLeft(100);
    obj.edit26:setTop(75);
    obj.edit26:setWidth(200);
    obj.edit26:setHeight(25);
    obj.edit26:setField("peso");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setName("edit26");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle16);
    obj.label28:setLeft(310);
    obj.label28:setTop(25);
    obj.label28:setWidth(90);
    obj.label28:setHeight(20);
    obj.label28:setText("IDADE");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle16);
    obj.edit27:setLeft(400);
    obj.edit27:setTop(25);
    obj.edit27:setWidth(200);
    obj.edit27:setHeight(25);
    obj.edit27:setField("idade");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setName("edit27");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle16);
    obj.label29:setLeft(310);
    obj.label29:setTop(50);
    obj.label29:setWidth(90);
    obj.label29:setHeight(20);
    obj.label29:setText("SEXO");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle16);
    obj.edit28:setLeft(400);
    obj.edit28:setTop(50);
    obj.edit28:setWidth(200);
    obj.edit28:setHeight(25);
    obj.edit28:setField("sexo");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setName("edit28");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle16);
    obj.label30:setLeft(310);
    obj.label30:setTop(75);
    obj.label30:setWidth(90);
    obj.label30:setHeight(20);
    obj.label30:setText("OUTROS");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle16);
    obj.edit29:setLeft(400);
    obj.edit29:setTop(75);
    obj.edit29:setWidth(200);
    obj.edit29:setHeight(25);
    obj.edit29:setField("aparenciaOutros");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setName("edit29");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle16);
    obj.label31:setLeft(610);
    obj.label31:setTop(25);
    obj.label31:setWidth(90);
    obj.label31:setHeight(20);
    obj.label31:setText("OLHOS");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle16);
    obj.edit30:setLeft(700);
    obj.edit30:setTop(25);
    obj.edit30:setWidth(200);
    obj.edit30:setHeight(25);
    obj.edit30:setField("aparenciaOlhos");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setName("edit30");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle16);
    obj.label32:setLeft(610);
    obj.label32:setTop(50);
    obj.label32:setWidth(90);
    obj.label32:setHeight(20);
    obj.label32:setText("PELE");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle16);
    obj.edit31:setLeft(700);
    obj.edit31:setTop(50);
    obj.edit31:setWidth(200);
    obj.edit31:setHeight(25);
    obj.edit31:setField("pele");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setName("edit31");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle16);
    obj.label33:setLeft(610);
    obj.label33:setTop(75);
    obj.label33:setWidth(90);
    obj.label33:setHeight(20);
    obj.label33:setText("CABELO");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle16);
    obj.edit32:setLeft(700);
    obj.edit32:setTop(75);
    obj.edit32:setWidth(200);
    obj.edit32:setHeight(25);
    obj.edit32:setField("cabelo");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setName("edit32");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle16);
    obj.label34:setLeft(910);
    obj.label34:setTop(25);
    obj.label34:setWidth(90);
    obj.label34:setHeight(20);
    obj.label34:setText("PLANO");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle16);
    obj.edit33:setLeft(1000);
    obj.edit33:setTop(25);
    obj.edit33:setWidth(200);
    obj.edit33:setHeight(25);
    obj.edit33:setField("plano");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setName("edit33");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle16);
    obj.label35:setLeft(910);
    obj.label35:setTop(50);
    obj.label35:setWidth(90);
    obj.label35:setHeight(20);
    obj.label35:setText("REGIÃO");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle16);
    obj.edit34:setLeft(1000);
    obj.edit34:setTop(50);
    obj.edit34:setWidth(200);
    obj.edit34:setHeight(25);
    obj.edit34:setField("regiao");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setName("edit34");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle16);
    obj.label36:setLeft(910);
    obj.label36:setTop(75);
    obj.label36:setWidth(90);
    obj.label36:setHeight(20);
    obj.label36:setText("REINO");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle16);
    obj.edit35:setLeft(1000);
    obj.edit35:setTop(75);
    obj.edit35:setWidth(200);
    obj.edit35:setHeight(25);
    obj.edit35:setField("reino");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setName("edit35");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox4);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(110);
    obj.layout1:setWidth(375);
    obj.layout1:setHeight(240);
    obj.layout1:setName("layout1");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout1);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("black");
    obj.rectangle17:setName("rectangle17");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout1);
    obj.label37:setLeft(5);
    obj.label37:setTop(1);
    obj.label37:setWidth(100);
    obj.label37:setHeight(20);
    obj.label37:setText("APARÊNCIA");
    obj.label37:setName("label37");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(365);
    obj.textEditor1:setHeight(210);
    obj.textEditor1:setField("aparencia");
    obj.textEditor1:setName("textEditor1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox4);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(355);
    obj.layout2:setWidth(375);
    obj.layout2:setHeight(250);
    obj.layout2:setName("layout2");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout2);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setName("rectangle18");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout2);
    obj.label38:setLeft(5);
    obj.label38:setTop(1);
    obj.label38:setWidth(100);
    obj.label38:setHeight(20);
    obj.label38:setText("PERSONALIDADE");
    obj.label38:setName("label38");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout2);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(365);
    obj.textEditor2:setHeight(220);
    obj.textEditor2:setField("personalidade");
    obj.textEditor2:setName("textEditor2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox4);
    obj.layout3:setLeft(380);
    obj.layout3:setTop(110);
    obj.layout3:setWidth(825);
    obj.layout3:setHeight(495);
    obj.layout3:setName("layout3");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout3);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("black");
    obj.rectangle19:setName("rectangle19");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout3);
    obj.label39:setLeft(5);
    obj.label39:setTop(1);
    obj.label39:setWidth(100);
    obj.label39:setHeight(20);
    obj.label39:setText("HISTORIA");
    obj.label39:setName("label39");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout3);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.frmTemplateNotes = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab5);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmTemplateNotes);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox5);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(400);
    obj.layout4:setHeight(580);
    obj.layout4:setName("layout4");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout4);
    obj.rectangle20:setLeft(0);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(400);
    obj.rectangle20:setHeight(580);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setXradius(5);
    obj.rectangle20:setYradius(15);
    obj.rectangle20:setCornerType("round");
    obj.rectangle20:setName("rectangle20");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout4);
    obj.label40:setLeft(0);
    obj.label40:setTop(0);
    obj.label40:setWidth(400);
    obj.label40:setHeight(20);
    obj.label40:setText("Anotações");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout4);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(540);
    obj.textEditor3:setField("anotacoes1");
    obj.textEditor3:setName("textEditor3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox5);
    obj.layout5:setLeft(410);
    obj.layout5:setTop(0);
    obj.layout5:setWidth(400);
    obj.layout5:setHeight(580);
    obj.layout5:setName("layout5");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout5);
    obj.rectangle21:setLeft(0);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(400);
    obj.rectangle21:setHeight(580);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setXradius(5);
    obj.rectangle21:setYradius(15);
    obj.rectangle21:setCornerType("round");
    obj.rectangle21:setName("rectangle21");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout5);
    obj.label41:setLeft(0);
    obj.label41:setTop(0);
    obj.label41:setWidth(400);
    obj.label41:setHeight(20);
    obj.label41:setText("Anotações");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout5);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(540);
    obj.textEditor4:setField("anotacoes2");
    obj.textEditor4:setName("textEditor4");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox5);
    obj.layout6:setLeft(820);
    obj.layout6:setTop(0);
    obj.layout6:setWidth(400);
    obj.layout6:setHeight(580);
    obj.layout6:setName("layout6");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout6);
    obj.rectangle22:setLeft(0);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(400);
    obj.rectangle22:setHeight(580);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setXradius(5);
    obj.rectangle22:setYradius(15);
    obj.rectangle22:setCornerType("round");
    obj.rectangle22:setName("rectangle22");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout6);
    obj.label42:setLeft(0);
    obj.label42:setTop(0);
    obj.label42:setWidth(400);
    obj.label42:setHeight(20);
    obj.label42:setText("Anotações");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout6);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(540);
    obj.textEditor5:setField("anotacoes3");
    obj.textEditor5:setName("textEditor5");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Creditos");
    obj.tab6:setName("tab6");

    obj.frmTemplateCreditos = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab6);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmTemplateCreditos);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox6);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(480);
    obj.image2:setHeight(320);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/Numenera/images/numenera.jpg");
    obj.image2:setName("image2");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox6);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Numenera/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox6);
    obj.layout7:setLeft(850);
    obj.layout7:setTop(0);
    obj.layout7:setWidth(200);
    obj.layout7:setHeight(160);
    obj.layout7:setName("layout7");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout7);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("black");
    obj.rectangle23:setXradius(5);
    obj.rectangle23:setYradius(15);
    obj.rectangle23:setCornerType("round");
    obj.rectangle23:setName("rectangle23");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout7);
    obj.label43:setLeft(0);
    obj.label43:setTop(10);
    obj.label43:setWidth(200);
    obj.label43:setHeight(20);
    obj.label43:setText("Programador: Vinny (Ambesek)");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout7);
    obj.label44:setLeft(0);
    obj.label44:setTop(35);
    obj.label44:setWidth(200);
    obj.label44:setHeight(20);
    obj.label44:setText("Sistema: Numenéra");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.scrollBox6);
    obj.label45:setLeft(555);
    obj.label45:setTop(300);
    obj.label45:setWidth(100);
    obj.label45:setHeight(20);
    obj.label45:setText("Versão Atual: ");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox6);
    obj.image4:setLeft(667);
    obj.image4:setTop(300);
    obj.image4:setWidth(100);
    obj.image4:setHeight(20);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20Numenera/release.png");
    obj.image4:setName("image4");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.scrollBox6);
    obj.label46:setLeft(555);
    obj.label46:setTop(325);
    obj.label46:setWidth(100);
    obj.label46:setHeight(20);
    obj.label46:setText("Ultima Versão: ");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox6);
    obj.image5:setLeft(667);
    obj.image5:setTop(325);
    obj.image5:setWidth(100);
    obj.image5:setHeight(20);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao01.png");
    obj.image5:setName("image5");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox6);
    obj.button8:setLeft(555);
    obj.button8:setTop(350);
    obj.button8:setWidth(100);
    obj.button8:setText("Change Log");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox6);
    obj.button9:setLeft(667);
    obj.button9:setTop(350);
    obj.button9:setWidth(100);
    obj.button9:setText("Atualizar");
    obj.button9:setName("button9");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.scrollBox6);
    obj.label47:setLeft(555);
    obj.label47:setTop(400);
    obj.label47:setWidth(200);
    obj.label47:setHeight(20);
    obj.label47:setText("Conheça as Mesas:");
    obj.label47:setName("label47");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox6);
    obj.button10:setLeft(555);
    obj.button10:setTop(425);
    obj.button10:setWidth(100);
    obj.button10:setText("RPGmeister");
    obj.button10:setName("button10");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclAntecedente:append();
        end, obj);

    obj._e_event1 = obj.rclAntecedente:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclHabilidadesEspeciais:append();
        end, obj);

    obj._e_event3 = obj.rclHabilidadesEspeciais:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event4 = obj.image1:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclPericias:append();
        end, obj);

    obj._e_event6 = obj.rclPericias:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (self)
            self.rclCifras:append();
        end, obj);

    obj._e_event8 = obj.rclCifras:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (self)
            self.rclArtifacts:append();
        end, obj);

    obj._e_event10 = obj.rclArtifacts:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (self)
            self.rclEquipment:append();
        end, obj);

    obj._e_event12 = obj.rclEquipment:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event13 = obj.button7:addEventListener("onClick",
        function (self)
            self.rclAtaques:append();
        end, obj);

    obj._e_event14 = obj.rclAtaques:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Numenera/README.md')
        end, obj);

    obj._e_event16 = obj.button9:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20Numenera/Ficha%20Numenera.rpk')
        end, obj);

    obj._e_event17 = obj.button10:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    function obj:_releaseEvents()
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

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rclCifras ~= nil then self.rclCifras:destroy(); self.rclCifras = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rclAntecedente ~= nil then self.rclAntecedente:destroy(); self.rclAntecedente = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.frmInventory ~= nil then self.frmInventory:destroy(); self.frmInventory = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.frmGeneral ~= nil then self.frmGeneral:destroy(); self.frmGeneral = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.frmAbilities ~= nil then self.frmAbilities:destroy(); self.frmAbilities = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.rclEquipment ~= nil then self.rclEquipment:destroy(); self.rclEquipment = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.rclArtifacts ~= nil then self.rclArtifacts:destroy(); self.rclArtifacts = nil; end;
        if self.rclAtaques ~= nil then self.rclAtaques:destroy(); self.rclAtaques = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.rclPericias ~= nil then self.rclPericias:destroy(); self.rclPericias = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rclHabilidadesEspeciais ~= nil then self.rclHabilidadesEspeciais:destroy(); self.rclHabilidadesEspeciais = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmMain = {
    newEditor = newfrmMain, 
    new = newfrmMain, 
    name = "frmMain", 
    dataType = "Ambesek.Nefertyne.Numenera", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Numenéra", 
    description=""};

frmMain = _frmMain;
rrpg.registrarForm(_frmMain);
rrpg.registrarDataType(_frmMain);

return _frmMain;
