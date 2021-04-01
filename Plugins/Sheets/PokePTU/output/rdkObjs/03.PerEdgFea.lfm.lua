require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPokePerEdgeFea()
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
    obj:setName("frmPokePerEdgeFea");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.popHabilidade1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade1:setParent(obj);
    obj.popHabilidade1:setName("popHabilidade1");
    obj.popHabilidade1:setWidth(300);
    obj.popHabilidade1:setHeight(240);
    obj.popHabilidade1:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popHabilidade1, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popHabilidade1);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(90);
    obj.flowPart1:setMaxWidth(100);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(10);
    obj.label1:setText("Nível");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("nivelHabilidade");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(180);
    obj.flowPart2:setMaxWidth(200);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("Requisitos");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("client");
    obj.edit2:setField("obtencaoHabilidade");
    obj.edit2:setFontSize(12);
    obj.edit2:setName("edit2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.flowLayout1);
    obj.dataLink1:setField("nivelHabilidade");
    obj.dataLink1:setName("dataLink1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popHabilidade1);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.popHabilidade2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade2:setParent(obj);
    obj.popHabilidade2:setName("popHabilidade2");
    obj.popHabilidade2:setWidth(300);
    obj.popHabilidade2:setHeight(240);
    obj.popHabilidade2:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popHabilidade2, "autoScopeNode",  "false");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popHabilidade2);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(3);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("Nível");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("client");
    obj.edit3:setField("nivelHabilidade");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(12);
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout2);
    obj.flowPart4:setMinWidth(180);
    obj.flowPart4:setMaxWidth(200);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("top");
    obj.label4:setFontSize(10);
    obj.label4:setText("Requisitos");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart4);
    obj.edit4:setAlign("client");
    obj.edit4:setField("obtencaoHabilidade");
    obj.edit4:setFontSize(12);
    obj.edit4:setName("edit4");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout2);
    obj.flowPart5:setMinWidth(90);
    obj.flowPart5:setMaxWidth(100);
    obj.flowPart5:setHeight(35);
    obj.flowPart5:setName("flowPart5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart5);
    obj.label5:setAlign("top");
    obj.label5:setFontSize(10);
    obj.label5:setText("Gatilho");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWordWrap(true);
    obj.label5:setTextTrimming("none");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart5);
    obj.edit5:setAlign("client");
    obj.edit5:setField("gatHabilidade");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(12);
    obj.edit5:setName("edit5");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout2);
    obj.flowPart6:setMinWidth(180);
    obj.flowPart6:setMaxWidth(200);
    obj.flowPart6:setHeight(35);
    obj.flowPart6:setName("flowPart6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart6);
    obj.label6:setAlign("top");
    obj.label6:setFontSize(10);
    obj.label6:setText("Frequência");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWordWrap(true);
    obj.label6:setTextTrimming("none");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart6);
    obj.edit6:setAlign("client");
    obj.edit6:setField("freqHabilidade");
    obj.edit6:setFontSize(12);
    obj.edit6:setName("edit6");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.flowLayout2);
    obj.dataLink2:setField("nivelHabilidade");
    obj.dataLink2:setName("dataLink2");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popHabilidade2);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setName("textEditor2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setLeft(000);
    obj.layout1:setTop(000);
    obj.layout1:setHeight(600);
    obj.layout1:setWidth(1095);
    obj.layout1:setName("layout1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout1);
    obj.image1:setLeft(000);
    obj.image1:setTop(000);
    obj.image1:setHeight(650);
    obj.image1:setWidth(1100);
    obj.image1:setSRC("/img/Pokeball.jpg");
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setLeft(295);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(400);
    obj.layout2:setHeight(520);
    obj.layout2:setName("layout2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0000007F");
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setLeft(000);
    obj.rectangle2:setTop(000);
    obj.rectangle2:setWidth(390);
    obj.rectangle2:setHeight(40);
    obj.rectangle2:setColor("darkred");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(0);
    obj.label7:setTop(0);
    obj.label7:setWidth(400);
    obj.label7:setHeight(20);
    obj.label7:setText("EDGES");
    obj.label7:setAutoSize(true);
    obj.label7:setFontColor("White");
    obj.label7:setFontSize(18);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setText("Novo Edge");
    obj.button1:setLeft(0);
    obj.button1:setTop(25);
    obj.button1:setWidth(390);
    obj.button1:setHeight(20);
    obj.button1:setName("button1");

    obj.rclListaDosOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosOutros:setParent(obj.layout2);
    obj.rclListaDosOutros:setName("rclListaDosOutros");
    obj.rclListaDosOutros:setField("campoDosOutros");
    obj.rclListaDosOutros:setTemplateForm("frmPokePerEdgeFea1");
    obj.rclListaDosOutros:setLeft(0);
    obj.rclListaDosOutros:setTop(50);
    obj.rclListaDosOutros:setWidth(390);
    obj.rclListaDosOutros:setHeight(460);
    obj.rclListaDosOutros:setLayout("vertical");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj);
    obj.layout3:setLeft(690);
    obj.layout3:setTop(25);
    obj.layout3:setWidth(400);
    obj.layout3:setHeight(520);
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#0000007F");
    obj.rectangle3:setName("rectangle3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout3);
    obj.rectangle4:setLeft(000);
    obj.rectangle4:setTop(000);
    obj.rectangle4:setWidth(390);
    obj.rectangle4:setHeight(40);
    obj.rectangle4:setColor("darkred");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setLeft(0);
    obj.label8:setTop(0);
    obj.label8:setWidth(400);
    obj.label8:setHeight(20);
    obj.label8:setText("FEATURES");
    obj.label8:setAutoSize(true);
    obj.label8:setFontColor("White");
    obj.label8:setFontSize(18);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout3);
    obj.button2:setText("Nova Feature");
    obj.button2:setLeft(0);
    obj.button2:setTop(25);
    obj.button2:setWidth(390);
    obj.button2:setHeight(20);
    obj.button2:setName("button2");

    obj.rclListaDasCaracteristicasClasse = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasCaracteristicasClasse:setParent(obj.layout3);
    obj.rclListaDasCaracteristicasClasse:setName("rclListaDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setField("campoDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setTemplateForm("frmPokePerEdgeFea2");
    obj.rclListaDasCaracteristicasClasse:setLeft(0);
    obj.rclListaDasCaracteristicasClasse:setTop(50);
    obj.rclListaDasCaracteristicasClasse:setWidth(390);
    obj.rclListaDasCaracteristicasClasse:setHeight(460);
    obj.rclListaDasCaracteristicasClasse:setLayout("vertical");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj);
    obj.layout4:setLeft(010);
    obj.layout4:setTop(020);
    obj.layout4:setHeight(200);
    obj.layout4:setWidth(1000);
    obj.layout4:setName("layout4");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout4);
    obj.label9:setLeft(00);
    obj.label9:setTop(00);
    obj.label9:setHeight(20);
    obj.label9:setWidth(120);
    obj.label9:setText("Perícias de Corpo");
    obj.label9:setAutoSize(true);
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout4);
    obj.label10:setLeft(125);
    obj.label10:setTop(00);
    obj.label10:setWidth(40);
    obj.label10:setHeight(100);
    obj.label10:setText("Nível");
    obj.label10:setAutoSize(true);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout4);
    obj.label11:setLeft(230);
    obj.label11:setTop(00);
    obj.label11:setWidth(40);
    obj.label11:setHeight(20);
    obj.label11:setText("Bônus");
    obj.label11:setAutoSize(true);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout4);
    obj.button3:setLeft(00);
    obj.button3:setTop(025);
    obj.button3:setHeight(20);
    obj.button3:setWidth(120);
    obj.button3:setText("Acrobacias");
    obj.button3:setHorzTextAlign("leading");
    obj.button3:setName("button3");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout4);
    obj.comboBox1:setLeft(125);
    obj.comboBox1:setTop(025);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setField("niv_ACRO");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox1:setName("comboBox1");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout4);
    obj.dataLink3:setField("niv_ACRO");
    obj.dataLink3:setDefaultValue("2");
    obj.dataLink3:setName("dataLink3");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout4);
    obj.edit7:setLeft(230);
    obj.edit7:setTop(025);
    obj.edit7:setWidth(40);
    obj.edit7:setHeight(20);
    obj.edit7:setField("bon_ACRO");
    obj.edit7:setName("edit7");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout4);
    obj.button4:setLeft(00);
    obj.button4:setTop(050);
    obj.button4:setHeight(20);
    obj.button4:setWidth(120);
    obj.button4:setText("Atletismo");
    obj.button4:setHorzTextAlign("leading");
    obj.button4:setName("button4");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout4);
    obj.comboBox2:setLeft(125);
    obj.comboBox2:setTop(050);
    obj.comboBox2:setHeight(20);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setField("niv_ATLE");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox2:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout4);
    obj.dataLink4:setField("niv_ATLE");
    obj.dataLink4:setDefaultValue("2");
    obj.dataLink4:setName("dataLink4");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout4);
    obj.edit8:setLeft(230);
    obj.edit8:setTop(050);
    obj.edit8:setWidth(40);
    obj.edit8:setHeight(20);
    obj.edit8:setField("bon_ATLE");
    obj.edit8:setName("edit8");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout4);
    obj.button5:setLeft(00);
    obj.button5:setTop(075);
    obj.button5:setHeight(20);
    obj.button5:setWidth(120);
    obj.button5:setText("Combate");
    obj.button5:setHorzTextAlign("leading");
    obj.button5:setName("button5");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout4);
    obj.comboBox3:setLeft(125);
    obj.comboBox3:setTop(075);
    obj.comboBox3:setHeight(20);
    obj.comboBox3:setWidth(100);
    obj.comboBox3:setField("niv_COMB");
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox3:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout4);
    obj.dataLink5:setField("niv_COMB");
    obj.dataLink5:setDefaultValue("2");
    obj.dataLink5:setName("dataLink5");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout4);
    obj.edit9:setLeft(230);
    obj.edit9:setTop(075);
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(20);
    obj.edit9:setField("bon_COMB");
    obj.edit9:setName("edit9");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout4);
    obj.button6:setLeft(00);
    obj.button6:setTop(100);
    obj.button6:setHeight(20);
    obj.button6:setWidth(120);
    obj.button6:setText("Furtividade");
    obj.button6:setHorzTextAlign("leading");
    obj.button6:setName("button6");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout4);
    obj.comboBox4:setLeft(125);
    obj.comboBox4:setTop(100);
    obj.comboBox4:setHeight(20);
    obj.comboBox4:setWidth(100);
    obj.comboBox4:setField("niv_FURT");
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox4:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout4);
    obj.dataLink6:setField("niv_FURT");
    obj.dataLink6:setDefaultValue("2");
    obj.dataLink6:setName("dataLink6");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout4);
    obj.edit10:setLeft(230);
    obj.edit10:setTop(100);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(20);
    obj.edit10:setField("bon_FURT");
    obj.edit10:setName("edit10");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout4);
    obj.button7:setLeft(00);
    obj.button7:setTop(125);
    obj.button7:setHeight(20);
    obj.button7:setWidth(120);
    obj.button7:setText("Intimidação");
    obj.button7:setHorzTextAlign("leading");
    obj.button7:setName("button7");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout4);
    obj.comboBox5:setLeft(125);
    obj.comboBox5:setTop(125);
    obj.comboBox5:setHeight(20);
    obj.comboBox5:setWidth(100);
    obj.comboBox5:setField("niv_INTI");
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox5:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout4);
    obj.dataLink7:setField("niv_INTI");
    obj.dataLink7:setDefaultValue("2");
    obj.dataLink7:setName("dataLink7");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout4);
    obj.edit11:setLeft(230);
    obj.edit11:setTop(125);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(20);
    obj.edit11:setField("bon_INTI");
    obj.edit11:setName("edit11");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout4);
    obj.button8:setLeft(00);
    obj.button8:setTop(150);
    obj.button8:setHeight(20);
    obj.button8:setWidth(120);
    obj.button8:setText("Sobrevivência");
    obj.button8:setHorzTextAlign("leading");
    obj.button8:setName("button8");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout4);
    obj.comboBox6:setLeft(125);
    obj.comboBox6:setTop(150);
    obj.comboBox6:setHeight(20);
    obj.comboBox6:setWidth(100);
    obj.comboBox6:setField("niv_SOBR");
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox6:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox6:setName("comboBox6");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout4);
    obj.dataLink8:setField("niv_SOBR");
    obj.dataLink8:setDefaultValue("2");
    obj.dataLink8:setName("dataLink8");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout4);
    obj.edit12:setLeft(230);
    obj.edit12:setTop(150);
    obj.edit12:setWidth(40);
    obj.edit12:setHeight(20);
    obj.edit12:setField("bon_SOBR");
    obj.edit12:setName("edit12");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj);
    obj.layout5:setLeft(010);
    obj.layout5:setTop(210);
    obj.layout5:setHeight(200);
    obj.layout5:setWidth(1000);
    obj.layout5:setName("layout5");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout5);
    obj.label12:setLeft(00);
    obj.label12:setTop(00);
    obj.label12:setHeight(20);
    obj.label12:setWidth(120);
    obj.label12:setText("Perícias de Mente");
    obj.label12:setAutoSize(true);
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout5);
    obj.label13:setLeft(125);
    obj.label13:setTop(00);
    obj.label13:setWidth(40);
    obj.label13:setHeight(100);
    obj.label13:setText("Nível");
    obj.label13:setAutoSize(true);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout5);
    obj.label14:setLeft(230);
    obj.label14:setTop(00);
    obj.label14:setWidth(40);
    obj.label14:setHeight(20);
    obj.label14:setText("Bônus");
    obj.label14:setAutoSize(true);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout5);
    obj.button9:setLeft(00);
    obj.button9:setTop(025);
    obj.button9:setHeight(20);
    obj.button9:setWidth(120);
    obj.button9:setText("Astúcia");
    obj.button9:setHorzTextAlign("leading");
    obj.button9:setName("button9");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout5);
    obj.comboBox7:setLeft(125);
    obj.comboBox7:setTop(025);
    obj.comboBox7:setHeight(20);
    obj.comboBox7:setWidth(100);
    obj.comboBox7:setField("niv_ASTU");
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox7:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox7:setName("comboBox7");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout5);
    obj.dataLink9:setField("niv_ASTU");
    obj.dataLink9:setDefaultValue("2");
    obj.dataLink9:setName("dataLink9");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout5);
    obj.edit13:setLeft(230);
    obj.edit13:setTop(025);
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(20);
    obj.edit13:setField("bon_ASTU");
    obj.edit13:setName("edit13");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout5);
    obj.button10:setLeft(00);
    obj.button10:setTop(050);
    obj.button10:setHeight(20);
    obj.button10:setWidth(120);
    obj.button10:setText("Ed.Geral");
    obj.button10:setHorzTextAlign("leading");
    obj.button10:setName("button10");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout5);
    obj.comboBox8:setLeft(125);
    obj.comboBox8:setTop(050);
    obj.comboBox8:setHeight(20);
    obj.comboBox8:setWidth(100);
    obj.comboBox8:setField("niv_EGER");
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox8:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox8:setName("comboBox8");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout5);
    obj.dataLink10:setField("niv_EGER");
    obj.dataLink10:setDefaultValue("2");
    obj.dataLink10:setName("dataLink10");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout5);
    obj.edit14:setLeft(230);
    obj.edit14:setTop(050);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(20);
    obj.edit14:setField("bon_EGER");
    obj.edit14:setName("edit14");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout5);
    obj.button11:setLeft(00);
    obj.button11:setTop(075);
    obj.button11:setHeight(20);
    obj.button11:setWidth(120);
    obj.button11:setText("Ed.Oculta");
    obj.button11:setHorzTextAlign("leading");
    obj.button11:setName("button11");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout5);
    obj.comboBox9:setLeft(125);
    obj.comboBox9:setTop(075);
    obj.comboBox9:setHeight(20);
    obj.comboBox9:setWidth(100);
    obj.comboBox9:setField("niv_EOCU");
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox9:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox9:setName("comboBox9");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout5);
    obj.dataLink11:setField("niv_EOCU");
    obj.dataLink11:setDefaultValue("2");
    obj.dataLink11:setName("dataLink11");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout5);
    obj.edit15:setLeft(230);
    obj.edit15:setTop(075);
    obj.edit15:setWidth(40);
    obj.edit15:setHeight(20);
    obj.edit15:setField("bon_EOCU");
    obj.edit15:setName("edit15");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout5);
    obj.button12:setLeft(00);
    obj.button12:setTop(100);
    obj.button12:setHeight(20);
    obj.button12:setWidth(120);
    obj.button12:setText("Ed.Pokémon");
    obj.button12:setHorzTextAlign("leading");
    obj.button12:setName("button12");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout5);
    obj.comboBox10:setLeft(125);
    obj.comboBox10:setTop(100);
    obj.comboBox10:setHeight(20);
    obj.comboBox10:setWidth(100);
    obj.comboBox10:setField("niv_EPOK");
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox10:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox10:setName("comboBox10");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout5);
    obj.dataLink12:setField("niv_EPOK");
    obj.dataLink12:setDefaultValue("2");
    obj.dataLink12:setName("dataLink12");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout5);
    obj.edit16:setLeft(230);
    obj.edit16:setTop(100);
    obj.edit16:setWidth(40);
    obj.edit16:setHeight(20);
    obj.edit16:setField("bon_EPOK");
    obj.edit16:setName("edit16");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout5);
    obj.button13:setLeft(00);
    obj.button13:setTop(125);
    obj.button13:setHeight(20);
    obj.button13:setWidth(120);
    obj.button13:setText("Ed.Tecnológica");
    obj.button13:setHorzTextAlign("leading");
    obj.button13:setName("button13");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout5);
    obj.comboBox11:setLeft(125);
    obj.comboBox11:setTop(125);
    obj.comboBox11:setHeight(20);
    obj.comboBox11:setWidth(100);
    obj.comboBox11:setField("niv_ETEC");
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox11:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox11:setName("comboBox11");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout5);
    obj.dataLink13:setField("niv_ETEC");
    obj.dataLink13:setDefaultValue("2");
    obj.dataLink13:setName("dataLink13");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout5);
    obj.edit17:setLeft(230);
    obj.edit17:setTop(125);
    obj.edit17:setWidth(40);
    obj.edit17:setHeight(20);
    obj.edit17:setField("bon_ETEC");
    obj.edit17:setName("edit17");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout5);
    obj.button14:setLeft(00);
    obj.button14:setTop(150);
    obj.button14:setHeight(20);
    obj.button14:setWidth(120);
    obj.button14:setText("Medicina");
    obj.button14:setHorzTextAlign("leading");
    obj.button14:setName("button14");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout5);
    obj.comboBox12:setLeft(125);
    obj.comboBox12:setTop(150);
    obj.comboBox12:setHeight(20);
    obj.comboBox12:setWidth(100);
    obj.comboBox12:setField("niv_MEDI");
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox12:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox12:setName("comboBox12");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout5);
    obj.dataLink14:setField("niv_MEDI");
    obj.dataLink14:setDefaultValue("2");
    obj.dataLink14:setName("dataLink14");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout5);
    obj.edit18:setLeft(230);
    obj.edit18:setTop(150);
    obj.edit18:setWidth(40);
    obj.edit18:setHeight(20);
    obj.edit18:setField("bon_MEDI");
    obj.edit18:setName("edit18");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout5);
    obj.button15:setLeft(00);
    obj.button15:setTop(175);
    obj.button15:setHeight(20);
    obj.button15:setWidth(120);
    obj.button15:setText("Percepção");
    obj.button15:setHorzTextAlign("leading");
    obj.button15:setName("button15");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout5);
    obj.comboBox13:setLeft(125);
    obj.comboBox13:setTop(175);
    obj.comboBox13:setHeight(20);
    obj.comboBox13:setWidth(100);
    obj.comboBox13:setField("niv_PERC");
    obj.comboBox13:setHorzTextAlign("center");
    obj.comboBox13:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox13:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox13:setName("comboBox13");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout5);
    obj.dataLink15:setField("niv_PERC");
    obj.dataLink15:setDefaultValue("2");
    obj.dataLink15:setName("dataLink15");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout5);
    obj.edit19:setLeft(230);
    obj.edit19:setTop(175);
    obj.edit19:setWidth(40);
    obj.edit19:setHeight(20);
    obj.edit19:setField("bon_PERC");
    obj.edit19:setName("edit19");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj);
    obj.layout6:setLeft(10);
    obj.layout6:setTop(430);
    obj.layout6:setHeight(125);
    obj.layout6:setWidth(1000);
    obj.layout6:setName("layout6");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout6);
    obj.label15:setLeft(00);
    obj.label15:setTop(00);
    obj.label15:setHeight(20);
    obj.label15:setWidth(120);
    obj.label15:setText("Perícias de Espírito");
    obj.label15:setAutoSize(true);
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout6);
    obj.label16:setLeft(125);
    obj.label16:setTop(00);
    obj.label16:setWidth(40);
    obj.label16:setHeight(100);
    obj.label16:setText("Nível");
    obj.label16:setAutoSize(true);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout6);
    obj.label17:setLeft(230);
    obj.label17:setTop(00);
    obj.label17:setWidth(40);
    obj.label17:setHeight(20);
    obj.label17:setText("Bônus");
    obj.label17:setAutoSize(true);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout6);
    obj.button16:setLeft(00);
    obj.button16:setTop(025);
    obj.button16:setHeight(20);
    obj.button16:setWidth(120);
    obj.button16:setText("Charme");
    obj.button16:setHorzTextAlign("leading");
    obj.button16:setName("button16");

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout6);
    obj.comboBox14:setLeft(125);
    obj.comboBox14:setTop(025);
    obj.comboBox14:setHeight(20);
    obj.comboBox14:setWidth(100);
    obj.comboBox14:setField("niv_CHAR");
    obj.comboBox14:setHorzTextAlign("center");
    obj.comboBox14:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox14:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox14:setName("comboBox14");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout6);
    obj.dataLink16:setField("niv_CHAR");
    obj.dataLink16:setDefaultValue("2");
    obj.dataLink16:setName("dataLink16");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout6);
    obj.edit20:setLeft(230);
    obj.edit20:setTop(025);
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(20);
    obj.edit20:setField("bon_CHAR");
    obj.edit20:setName("edit20");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout6);
    obj.button17:setLeft(00);
    obj.button17:setTop(050);
    obj.button17:setHeight(20);
    obj.button17:setWidth(120);
    obj.button17:setText("Comando");
    obj.button17:setHorzTextAlign("leading");
    obj.button17:setName("button17");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout6);
    obj.comboBox15:setLeft(125);
    obj.comboBox15:setTop(050);
    obj.comboBox15:setHeight(20);
    obj.comboBox15:setWidth(100);
    obj.comboBox15:setField("niv_COMA");
    obj.comboBox15:setHorzTextAlign("center");
    obj.comboBox15:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox15:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox15:setName("comboBox15");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout6);
    obj.dataLink17:setField("niv_COMA");
    obj.dataLink17:setDefaultValue("2");
    obj.dataLink17:setName("dataLink17");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout6);
    obj.edit21:setLeft(230);
    obj.edit21:setTop(050);
    obj.edit21:setWidth(40);
    obj.edit21:setHeight(20);
    obj.edit21:setField("bon_COMA");
    obj.edit21:setName("edit21");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout6);
    obj.button18:setLeft(00);
    obj.button18:setTop(075);
    obj.button18:setHeight(20);
    obj.button18:setWidth(120);
    obj.button18:setText("Foco");
    obj.button18:setHorzTextAlign("leading");
    obj.button18:setName("button18");

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout6);
    obj.comboBox16:setLeft(125);
    obj.comboBox16:setTop(075);
    obj.comboBox16:setHeight(20);
    obj.comboBox16:setWidth(100);
    obj.comboBox16:setField("niv_FOCO");
    obj.comboBox16:setHorzTextAlign("center");
    obj.comboBox16:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox16:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox16:setName("comboBox16");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout6);
    obj.dataLink18:setField("niv_FOCO");
    obj.dataLink18:setDefaultValue("2");
    obj.dataLink18:setName("dataLink18");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout6);
    obj.edit22:setLeft(230);
    obj.edit22:setTop(075);
    obj.edit22:setWidth(40);
    obj.edit22:setHeight(20);
    obj.edit22:setField("bon_FOCO");
    obj.edit22:setName("edit22");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout6);
    obj.button19:setLeft(00);
    obj.button19:setTop(100);
    obj.button19:setHeight(20);
    obj.button19:setWidth(120);
    obj.button19:setText("Intuição");
    obj.button19:setHorzTextAlign("leading");
    obj.button19:setName("button19");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout6);
    obj.comboBox17:setLeft(125);
    obj.comboBox17:setTop(100);
    obj.comboBox17:setHeight(20);
    obj.comboBox17:setWidth(100);
    obj.comboBox17:setField("niv_INTU");
    obj.comboBox17:setHorzTextAlign("center");
    obj.comboBox17:setItems({'Patético', 'Destreinado', 'Noviço', 'Adepto', 'Expert', 'Mestre', 'Virtuoso'});
    obj.comboBox17:setValues({'1', '2', '3', '4', '5', '6', '8'});
    obj.comboBox17:setName("comboBox17");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout6);
    obj.dataLink19:setField("niv_INTU");
    obj.dataLink19:setDefaultValue("2");
    obj.dataLink19:setName("dataLink19");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout6);
    obj.edit23:setLeft(230);
    obj.edit23:setTop(100);
    obj.edit23:setWidth(40);
    obj.edit23:setHeight(20);
    obj.edit23:setField("bon_INTU");
    obj.edit23:setName("edit23");


		local function realizarTesteDePericia()            
			local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
			local Nivel = tonumber(sheet.nivPER) or 1;
			if (Nivel == 8) then
				Nivel = 6;
				end
			local Bonus = tonumber(sheet.bonPER) or 0;
			local NameP = sheet.namPER or "";
			local NameC = sheet.namUSE or sheet.baseName or "";
			mesaDoPersonagem.activeChat:rolarDados(Nivel .. "d6 + " .. Bonus, "Teste da Perícia " .. NameP .. " usada por " .. NameC); 	
			end;               
		


    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local rcl = self:findControlByName("rclListaDosTalentos");
            					if rcl~= nil then
            						rcl:sort();
            					end;
            					rcl = self:findControlByName("rclListaDosOutros");
            					if rcl~= nil then
            						rcl:sort();
            					end;
            					rcl = self:findControlByName("rclListaDasCaracteristicasClasse");
            					if rcl~= nil then
            						rcl:sort();
            					end;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local rcl = self:findControlByName("rclListaDosTalentos");
            					if rcl~= nil then
            						rcl:sort();
            					end;
            					rcl = self:findControlByName("rclListaDosOutros");
            					if rcl~= nil then
            						rcl:sort();
            					end;
            					rcl = self:findControlByName("rclListaDasCaracteristicasClasse");
            					if rcl~= nil then
            						rcl:sort();
            					end;
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclListaDosOutros:append();
        end, obj);

    obj._e_event3 = obj.rclListaDosOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclListaDasCaracteristicasClasse:append();
        end, obj);

    obj._e_event5 = obj.rclListaDasCaracteristicasClasse:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event6 = obj.button3:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_ACRO;
            				sheet.bonPER = sheet.bon_ACRO;
            				sheet.namPER = "Acrobacias";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_ATLE;
            				sheet.bonPER = sheet.bon_ATLE;
            				sheet.namPER = "Atletismo";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event8 = obj.button5:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_COMB;
            				sheet.bonPER = sheet.bon_COMB;
            				sheet.namPER = "Combate";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event9 = obj.button6:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_FURT;
            				sheet.bonPER = sheet.bon_FURT;
            				sheet.namPER = "Furtividade";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event10 = obj.button7:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_INTI;
            				sheet.bonPER = sheet.bon_INTI;
            				sheet.namPER = "Intimidação";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event11 = obj.button8:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_SOBR;
            				sheet.bonPER = sheet.bon_SOBR;
            				sheet.namPER = "Sobrevivência";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event12 = obj.button9:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_ASTU;
            				sheet.bonPER = sheet.bon_ASTU;
            				sheet.namPER = "Astúcia";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event13 = obj.button10:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_EGER;
            				sheet.bonPER = sheet.bon_EGER;
            				sheet.namPER = "Ed.Geral";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event14 = obj.button11:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_EOCU;
            				sheet.bonPER = sheet.bon_EOCU;
            				sheet.namPER = "Ed.Oculta";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event15 = obj.button12:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_EPOK;
            				sheet.bonPER = sheet.bon_EPOK;
            				sheet.namPER = "Ed.Pokémon";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event16 = obj.button13:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_ETEC;
            				sheet.bonPER = sheet.bon_ETEC;
            				sheet.namPER = "Ed.Tecnológica";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event17 = obj.button14:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_MEDI;
            				sheet.bonPER = sheet.bon_MEDI;
            				sheet.namPER = "Medicina";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event18 = obj.button15:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_PERC;
            				sheet.bonPER = sheet.bon_PERC;
            				sheet.namPER = "Percepção";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event19 = obj.button16:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_CHAR;
            				sheet.bonPER = sheet.bon_CHAR;
            				sheet.namPER = "Charme";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event20 = obj.button17:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_COMA;
            				sheet.bonPER = sheet.bon_COMA;
            				sheet.namPER = "Comando";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event21 = obj.button18:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_FOCO;
            				sheet.bonPER = sheet.bon_FOCO;
            				sheet.namPER = "Foco";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    obj._e_event22 = obj.button19:addEventListener("onClick",
        function (_)
            sheet.nivPER = sheet.niv_INTU;
            				sheet.bonPER = sheet.bon_INTU;
            				sheet.namPER = "Intuição";
            				sheet.namUSE = sheet.baseName or "Treinador";
            				realizarTesteDePericia()
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.popHabilidade2 ~= nil then self.popHabilidade2:destroy(); self.popHabilidade2 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rclListaDasCaracteristicasClasse ~= nil then self.rclListaDasCaracteristicasClasse:destroy(); self.rclListaDasCaracteristicasClasse = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.rclListaDosOutros ~= nil then self.rclListaDosOutros:destroy(); self.rclListaDosOutros = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.popHabilidade1 ~= nil then self.popHabilidade1:destroy(); self.popHabilidade1 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPokePerEdgeFea()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPokePerEdgeFea();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPokePerEdgeFea = {
    newEditor = newfrmPokePerEdgeFea, 
    new = newfrmPokePerEdgeFea, 
    name = "frmPokePerEdgeFea", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPokePerEdgeFea = _frmPokePerEdgeFea;
Firecast.registrarForm(_frmPokePerEdgeFea);

return _frmPokePerEdgeFea;
