require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDobras()
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
    obj:setName("frmDobras");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

	
		local function rollTest()
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);

			local mod = (tonumber(sheet.testeDobra) or 0);
			local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);

			mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Dobra de " .. (sheet.nome or "Nome"));
		end;

		


    obj.popDobra = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDobra:setParent(obj);
    obj.popDobra:setName("popDobra");
    obj.popDobra:setWidth(250);
    obj.popDobra:setHeight(250);
    obj.popDobra:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popDobra, "autoScopeNode",  "false");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popDobra);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.popTecnica = GUI.fromHandle(_obj_newObject("popup"));
    obj.popTecnica:setParent(obj);
    obj.popTecnica:setName("popTecnica");
    obj.popTecnica:setWidth(250);
    obj.popTecnica:setHeight(250);
    obj.popTecnica:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popTecnica, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popTecnica);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(125);
    obj.flowPart1:setMaxWidth(250);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(10);
    obj.label1:setText("Elementos");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("elementos");
    obj.edit1:setFontSize(12);
    obj.edit1:setName("edit1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(125);
    obj.flowPart2:setMaxWidth(250);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("Duração");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("client");
    obj.edit2:setField("duracao");
    obj.edit2:setFontSize(12);
    obj.edit2:setName("edit2");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(125);
    obj.flowPart3:setMaxWidth(250);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("CD");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("client");
    obj.edit3:setField("cd");
    obj.edit3:setFontSize(12);
    obj.edit3:setName("edit3");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(125);
    obj.flowPart4:setMaxWidth(250);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("top");
    obj.label4:setFontSize(10);
    obj.label4:setText("Material");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart4);
    obj.edit4:setAlign("client");
    obj.edit4:setField("material");
    obj.edit4:setFontSize(12);
    obj.edit4:setName("edit4");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popTecnica);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setName("textEditor2");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(335);
    obj.layout1:setHeight(455);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0000007F");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("+");
    obj.button1:setLeft(5);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(0);
    obj.label5:setTop(0);
    obj.label5:setWidth(335);
    obj.label5:setHeight(20);
    obj.label5:setText("DOBRAS");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setLeft(5);
    obj.label6:setTop(25);
    obj.label6:setWidth(150);
    obj.label6:setHeight(20);
    obj.label6:setText("TIPO");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setLeft(155);
    obj.label7:setTop(25);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setText("NÍVEL");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setLeft(205);
    obj.label8:setTop(25);
    obj.label8:setWidth(50);
    obj.label8:setHeight(20);
    obj.label8:setText("PT");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.rclListaDasDobras = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasDobras:setParent(obj.layout1);
    obj.rclListaDasDobras:setName("rclListaDasDobras");
    obj.rclListaDasDobras:setField("campoDasDobras");
    obj.rclListaDasDobras:setTemplateForm("frmDobra");
    obj.rclListaDasDobras:setLeft(5);
    obj.rclListaDasDobras:setTop(50);
    obj.rclListaDasDobras:setWidth(320);
    obj.rclListaDasDobras:setHeight(400);
    obj.rclListaDasDobras:setLayout("vertical");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(465);
    obj.layout2:setWidth(335);
    obj.layout2:setHeight(135);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#0000007F");
    obj.rectangle2:setName("rectangle2");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(5);
    obj.label9:setTop(5);
    obj.label9:setWidth(150);
    obj.label9:setHeight(20);
    obj.label9:setText("Atributo de Dobra");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setVertTextAlign("center");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setLeft(155);
    obj.comboBox1:setTop(5);
    obj.comboBox1:setWidth(60);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("chaveDobra");
    obj.comboBox1:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setName("comboBox1");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setLeft(220);
    obj.rectangle3:setTop(5);
    obj.rectangle3:setWidth(35);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setField("atributoDobra");
    obj.label10:setText("0");
    obj.label10:setLeft(220);
    obj.label10:setTop(5);
    obj.label10:setWidth(35);
    obj.label10:setHeight(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout2);
    obj.rectangle4:setLeft(260);
    obj.rectangle4:setTop(5);
    obj.rectangle4:setWidth(35);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setField("atributoDobraMod");
    obj.label11:setText("0");
    obj.label11:setLeft(260);
    obj.label11:setTop(5);
    obj.label11:setWidth(35);
    obj.label11:setHeight(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setLeft(5);
    obj.label12:setTop(35);
    obj.label12:setWidth(150);
    obj.label12:setHeight(20);
    obj.label12:setText("Capacidade de Dobra");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout2);
    obj.rectangle5:setLeft(155);
    obj.rectangle5:setTop(35);
    obj.rectangle5:setWidth(35);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setField("capacidadeDobra");
    obj.label13:setText("0");
    obj.label13:setLeft(155);
    obj.label13:setTop(35);
    obj.label13:setWidth(35);
    obj.label13:setHeight(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setLeft(200);
    obj.edit5:setTop(35);
    obj.edit5:setWidth(30);
    obj.edit5:setHeight(25);
    obj.edit5:setField("capacidadeDobraAdicional");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setLeft(230);
    obj.edit6:setTop(35);
    obj.edit6:setWidth(30);
    obj.edit6:setHeight(25);
    obj.edit6:setField("capacidadeDobraOutros");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setLeft(5);
    obj.label14:setTop(65);
    obj.label14:setWidth(150);
    obj.label14:setHeight(20);
    obj.label14:setText("Nível de Dobrador");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout2);
    obj.rectangle6:setLeft(155);
    obj.rectangle6:setTop(65);
    obj.rectangle6:setWidth(35);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout2);
    obj.label15:setField("nivelDobrador");
    obj.label15:setText("0");
    obj.label15:setLeft(155);
    obj.label15:setTop(65);
    obj.label15:setWidth(35);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setLeft(200);
    obj.edit7:setTop(65);
    obj.edit7:setWidth(30);
    obj.edit7:setHeight(25);
    obj.edit7:setField("nivelDobradorAdicional");
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setLeft(230);
    obj.edit8:setTop(65);
    obj.edit8:setWidth(30);
    obj.edit8:setHeight(25);
    obj.edit8:setField("nivelDobradorOutros");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(15);
    obj.button2:setTop(95);
    obj.button2:setWidth(130);
    obj.button2:setHeight(25);
    obj.button2:setText("Teste de Dobra");
    obj.button2:setHorzTextAlign("center");
    obj.button2:setName("button2");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout2);
    obj.rectangle7:setLeft(155);
    obj.rectangle7:setTop(95);
    obj.rectangle7:setWidth(35);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setField("testeDobra");
    obj.label16:setText("0");
    obj.label16:setLeft(155);
    obj.label16:setTop(95);
    obj.label16:setWidth(35);
    obj.label16:setHeight(25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout2);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setLeft(200);
    obj.edit9:setTop(95);
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(25);
    obj.edit9:setField("testeDobraAdicional");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setLeft(230);
    obj.edit10:setTop(95);
    obj.edit10:setWidth(30);
    obj.edit10:setHeight(25);
    obj.edit10:setField("testeDobraOutros");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setFields({'nep','atributoDobraMod','capacidadeDobraAdicional','nivelDobradorAdicional','testeDobraAdicional','capacidadeDobraOutros','nivelDobradorOutros','testeDobraOutros'});
    obj.dataLink1:setName("dataLink1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(345);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(335);
    obj.layout3:setHeight(600);
    obj.layout3:setName("layout3");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout3);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("#0000007F");
    obj.rectangle8:setName("rectangle8");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout3);
    obj.button3:setText("+");
    obj.button3:setLeft(5);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setName("button3");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout3);
    obj.label17:setLeft(0);
    obj.label17:setTop(0);
    obj.label17:setWidth(335);
    obj.label17:setHeight(20);
    obj.label17:setText("TECNICAS");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout3);
    obj.label18:setLeft(5);
    obj.label18:setTop(25);
    obj.label18:setWidth(150);
    obj.label18:setHeight(20);
    obj.label18:setText("TIPO");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout3);
    obj.label19:setLeft(155);
    obj.label19:setTop(25);
    obj.label19:setWidth(50);
    obj.label19:setHeight(20);
    obj.label19:setText("NÍVEL");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout3);
    obj.label20:setLeft(205);
    obj.label20:setTop(25);
    obj.label20:setWidth(50);
    obj.label20:setHeight(20);
    obj.label20:setText("PT");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.rclListaDasTecnicas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasTecnicas:setParent(obj.layout3);
    obj.rclListaDasTecnicas:setName("rclListaDasTecnicas");
    obj.rclListaDasTecnicas:setField("campoDasTecnicas");
    obj.rclListaDasTecnicas:setTemplateForm("frmTecnica");
    obj.rclListaDasTecnicas:setLeft(5);
    obj.rclListaDasTecnicas:setTop(50);
    obj.rclListaDasTecnicas:setWidth(320);
    obj.rclListaDasTecnicas:setHeight(545);
    obj.rclListaDasTecnicas:setLayout("vertical");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(690);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(385);
    obj.layout4:setHeight(600);
    obj.layout4:setName("layout4");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout4);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("#0000007F");
    obj.rectangle9:setName("rectangle9");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout4);
    obj.button4:setText("+");
    obj.button4:setLeft(5);
    obj.button4:setTop(0);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setName("button4");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout4);
    obj.label21:setLeft(0);
    obj.label21:setTop(0);
    obj.label21:setWidth(385);
    obj.label21:setHeight(20);
    obj.label21:setText("TECNICAS AVANÇADAS");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout4);
    obj.label22:setLeft(5);
    obj.label22:setTop(25);
    obj.label22:setWidth(150);
    obj.label22:setHeight(20);
    obj.label22:setText("TIPO");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout4);
    obj.label23:setLeft(155);
    obj.label23:setTop(25);
    obj.label23:setWidth(50);
    obj.label23:setHeight(20);
    obj.label23:setText("NÍVEL");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout4);
    obj.label24:setLeft(205);
    obj.label24:setTop(25);
    obj.label24:setWidth(50);
    obj.label24:setHeight(20);
    obj.label24:setText("AJUSTE");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout4);
    obj.label25:setLeft(255);
    obj.label25:setTop(25);
    obj.label25:setWidth(50);
    obj.label25:setHeight(20);
    obj.label25:setText("PT");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.rclListaDasTecnicasAvancadas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasTecnicasAvancadas:setParent(obj.layout4);
    obj.rclListaDasTecnicasAvancadas:setName("rclListaDasTecnicasAvancadas");
    obj.rclListaDasTecnicasAvancadas:setField("campoDasTecnicasAvancadas");
    obj.rclListaDasTecnicasAvancadas:setTemplateForm("frmAvancado");
    obj.rclListaDasTecnicasAvancadas:setLeft(5);
    obj.rclListaDasTecnicasAvancadas:setTop(50);
    obj.rclListaDasTecnicasAvancadas:setWidth(375);
    obj.rclListaDasTecnicasAvancadas:setHeight(545);
    obj.rclListaDasTecnicasAvancadas:setLayout("vertical");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclListaDasDobras:append();
        end, obj);

    obj._e_event1 = obj.rclListaDasDobras:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nome) or 0) - (tonumber(nodeB.nome) or 0));
        end, obj);

    obj._e_event2 = obj.comboBox1:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            
            					if sheet.chaveDobra == "1" then
            						sheet.atributoDobra = tonumber(sheet.efetFor) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModFor) or 0;
            					elseif sheet.chaveDobra == "2" then
            						sheet.atributoDobra = tonumber(sheet.efetDes) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModDes) or 0;
            					elseif sheet.chaveDobra == "3" then
            						sheet.atributoDobra = tonumber(sheet.efetCon) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModCon) or 0;
            					elseif sheet.chaveDobra == "4" then
            						sheet.atributoDobra = tonumber(sheet.efetInt) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModInt) or 0;
            					elseif sheet.chaveDobra == "5" then
            						sheet.atributoDobra = tonumber(sheet.efetSab) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModSab) or 0;
            					elseif sheet.chaveDobra == "6" then
            						sheet.atributoDobra = tonumber(sheet.efetCar) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModCar) or 0;
            					else
            						sheet.atributoDobra = "";
            						sheet.atributoDobraMod = "";
            					end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            rollTest();
        end, obj);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					sheet.capacidadeDobra = (tonumber(sheet.nep) or 0) + 
            											(tonumber(sheet.atributoDobraMod) or 0) + 
            											(tonumber(sheet.capacidadeDobraAdicional) or 0) + 
            											(tonumber(sheet.capacidadeDobraOutros) or 0);
            
            					sheet.nivelDobrador = (tonumber(sheet.nep) or 0) + 
            											(tonumber(sheet.nivelDobradorAdicional) or 0) + 
            											(tonumber(sheet.nivelDobradorOutros) or 0);
            
            					sheet.testeDobra = 	(tonumber(sheet.nep) or 0) + 
            										(tonumber(sheet.atributoDobraMod) or 0) + 
            										(tonumber(sheet.testeDobraAdicional) or 0) + 
            										(tonumber(sheet.testeDobraOutros) or 0);
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclListaDasTecnicas:append();
        end, obj);

    obj._e_event6 = obj.rclListaDasTecnicas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nome) or 0) - (tonumber(nodeB.nome) or 0));
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclListaDasTecnicasAvancadas:append();
        end, obj);

    obj._e_event8 = obj.rclListaDasTecnicasAvancadas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nome) or 0) - (tonumber(nodeB.nome) or 0));
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.popTecnica ~= nil then self.popTecnica:destroy(); self.popTecnica = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rclListaDasTecnicas ~= nil then self.rclListaDasTecnicas:destroy(); self.rclListaDasTecnicas = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.popDobra ~= nil then self.popDobra:destroy(); self.popDobra = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rclListaDasDobras ~= nil then self.rclListaDasDobras:destroy(); self.rclListaDasDobras = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclListaDasTecnicasAvancadas ~= nil then self.rclListaDasTecnicasAvancadas:destroy(); self.rclListaDasTecnicasAvancadas = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDobras()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDobras();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDobras = {
    newEditor = newfrmDobras, 
    new = newfrmDobras, 
    name = "frmDobras", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDobras = _frmDobras;
Firecast.registrarForm(_frmDobras);

return _frmDobras;
