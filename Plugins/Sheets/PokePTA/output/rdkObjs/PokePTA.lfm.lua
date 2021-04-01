require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmHITOPOKE2()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("HITO_PLAYER_POKEMON");
    obj:setTitle("Hitoshura - Pokemon PTA (Caio)");
    obj:setName("frmHITOPOKE2");
    obj:setTheme("dark");
    obj:setPadding({left=4, top=4, right=4, bottom=4});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.scrollBox1);
    obj.tabControl1:setLeft(20);
    obj.tabControl1:setTop(20);
    obj.tabControl1:setHeight(650);
    obj.tabControl1:setWidth(1100);
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.frmGeral = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGeral:setParent(obj.tab1);
    obj.frmGeral:setName("frmGeral");
    obj.frmGeral:setAlign("client");
    obj.frmGeral:setTheme("dark");
    obj.frmGeral:setMargins({top=1});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.frmGeral);
    obj.layout1:setLeft(000);
    obj.layout1:setTop(000);
    obj.layout1:setHeight(650);
    obj.layout1:setWidth(1100);
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
    obj.layout2:setParent(obj.frmGeral);
    obj.layout2:setLeft(10);
    obj.layout2:setTop(010);
    obj.layout2:setHeight(260);
    obj.layout2:setWidth(800);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(000);
    obj.label1:setTop(000);
    obj.label1:setHeight(20);
    obj.label1:setWidth(80);
    obj.label1:setText("Nome");
    obj.label1:setAutoSize(true);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(085);
    obj.edit1:setTop(000);
    obj.edit1:setHeight(20);
    obj.edit1:setWidth(500);
    obj.edit1:setField("baseName");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(000);
    obj.label2:setTop(025);
    obj.label2:setHeight(20);
    obj.label2:setWidth(80);
    obj.label2:setText("Classe #1");
    obj.label2:setAutoSize(true);
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setLeft(085);
    obj.edit2:setTop(025);
    obj.edit2:setHeight(20);
    obj.edit2:setWidth(200);
    obj.edit2:setField("baseClasses1");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(300);
    obj.label3:setTop(025);
    obj.label3:setHeight(20);
    obj.label3:setWidth(80);
    obj.label3:setText("Classe #2");
    obj.label3:setAutoSize(true);
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setLeft(385);
    obj.edit3:setTop(025);
    obj.edit3:setHeight(20);
    obj.edit3:setWidth(200);
    obj.edit3:setField("baseClasses2");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(000);
    obj.label4:setTop(050);
    obj.label4:setHeight(20);
    obj.label4:setWidth(80);
    obj.label4:setText("Classe #3");
    obj.label4:setAutoSize(true);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setLeft(085);
    obj.edit4:setTop(050);
    obj.edit4:setHeight(20);
    obj.edit4:setWidth(200);
    obj.edit4:setField("baseClasses3");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(300);
    obj.label5:setTop(050);
    obj.label5:setHeight(20);
    obj.label5:setWidth(80);
    obj.label5:setText("Classe #4");
    obj.label5:setAutoSize(true);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setLeft(385);
    obj.edit5:setTop(050);
    obj.edit5:setHeight(20);
    obj.edit5:setWidth(200);
    obj.edit5:setField("baseClasses4");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(000);
    obj.label6:setTop(75);
    obj.label6:setHeight(20);
    obj.label6:setWidth(80);
    obj.label6:setText("Idade");
    obj.label6:setAutoSize(true);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setLeft(085);
    obj.edit6:setTop(75);
    obj.edit6:setHeight(20);
    obj.edit6:setWidth(200);
    obj.edit6:setField("baseIdade");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(300);
    obj.label7:setTop(75);
    obj.label7:setHeight(20);
    obj.label7:setWidth(80);
    obj.label7:setText("Gênero");
    obj.label7:setAutoSize(true);
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setLeft(385);
    obj.edit7:setTop(75);
    obj.edit7:setHeight(20);
    obj.edit7:setWidth(200);
    obj.edit7:setField("baseGenero");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(000);
    obj.label8:setTop(100);
    obj.label8:setHeight(20);
    obj.label8:setWidth(80);
    obj.label8:setText("Altura");
    obj.label8:setAutoSize(true);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setLeft(085);
    obj.edit8:setTop(100);
    obj.edit8:setHeight(20);
    obj.edit8:setWidth(200);
    obj.edit8:setField("baseAltura");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setLeft(300);
    obj.label9:setTop(100);
    obj.label9:setHeight(20);
    obj.label9:setWidth(80);
    obj.label9:setText("Peso");
    obj.label9:setAutoSize(true);
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout2);
    obj.edit9:setLeft(385);
    obj.edit9:setTop(100);
    obj.edit9:setHeight(20);
    obj.edit9:setWidth(200);
    obj.edit9:setField("basePeso");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setLeft(000);
    obj.label10:setTop(125);
    obj.label10:setHeight(20);
    obj.label10:setWidth(80);
    obj.label10:setText("Arma");
    obj.label10:setAutoSize(true);
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setLeft(085);
    obj.edit10:setTop(125);
    obj.edit10:setHeight(20);
    obj.edit10:setWidth(200);
    obj.edit10:setField("baseArma");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setLeft(300);
    obj.label11:setTop(125);
    obj.label11:setHeight(20);
    obj.label11:setWidth(80);
    obj.label11:setText("Tendência");
    obj.label11:setAutoSize(true);
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setName("label11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout2);
    obj.edit11:setLeft(385);
    obj.edit11:setTop(125);
    obj.edit11:setHeight(20);
    obj.edit11:setWidth(200);
    obj.edit11:setField("baseTEND");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setLeft(000);
    obj.label12:setTop(150);
    obj.label12:setHeight(20);
    obj.label12:setWidth(80);
    obj.label12:setText("Aniversário");
    obj.label12:setAutoSize(true);
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setName("label12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout2);
    obj.edit12:setLeft(085);
    obj.edit12:setTop(150);
    obj.edit12:setHeight(20);
    obj.edit12:setWidth(200);
    obj.edit12:setField("baseNIVER");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setLeft(300);
    obj.label13:setTop(150);
    obj.label13:setHeight(20);
    obj.label13:setWidth(80);
    obj.label13:setText("Dinheiro");
    obj.label13:setAutoSize(true);
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setName("label13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout2);
    obj.edit13:setLeft(385);
    obj.edit13:setTop(150);
    obj.edit13:setHeight(20);
    obj.edit13:setWidth(200);
    obj.edit13:setField("baseMONY");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setLeft(000);
    obj.label14:setTop(175);
    obj.label14:setHeight(20);
    obj.label14:setWidth(80);
    obj.label14:setText("Nível");
    obj.label14:setAutoSize(true);
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setName("label14");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout2);
    obj.edit14:setLeft(085);
    obj.edit14:setTop(175);
    obj.edit14:setHeight(20);
    obj.edit14:setWidth(200);
    obj.edit14:setField("basLV");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout2);
    obj.label15:setLeft(300);
    obj.label15:setTop(175);
    obj.label15:setHeight(20);
    obj.label15:setWidth(80);
    obj.label15:setText("HP");
    obj.label15:setAutoSize(true);
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setName("label15");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout2);
    obj.edit15:setLeft(385);
    obj.edit15:setTop(175);
    obj.edit15:setHeight(20);
    obj.edit15:setWidth(90);
    obj.edit15:setField("baseHPAtual");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setLeft(485);
    obj.label16:setTop(175);
    obj.label16:setHeight(20);
    obj.label16:setWidth(16);
    obj.label16:setText("/");
    obj.label16:setAutoSize(true);
    obj.label16:setName("label16");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout2);
    obj.edit16:setLeft(495);
    obj.edit16:setTop(175);
    obj.edit16:setHeight(20);
    obj.edit16:setWidth(90);
    obj.edit16:setField("baseHPMAX");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setEnabled(false);
    obj.edit16:setName("edit16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout2);
    obj.label17:setLeft(485);
    obj.label17:setTop(200);
    obj.label17:setHeight(20);
    obj.label17:setWidth(16);
    obj.label17:setText("+");
    obj.label17:setAutoSize(true);
    obj.label17:setName("label17");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout2);
    obj.edit17:setLeft(495);
    obj.edit17:setTop(200);
    obj.edit17:setHeight(20);
    obj.edit17:setWidth(90);
    obj.edit17:setField("baseHPMAXEXTRA");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.frmGeral);
    obj.layout3:setLeft(620);
    obj.layout3:setTop(10);
    obj.layout3:setHeight(512);
    obj.layout3:setWidth(512);
    obj.layout3:setName("layout3");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout3);
    obj.rectangle1:setLeft(000);
    obj.rectangle1:setTop(000);
    obj.rectangle1:setWidth(360);
    obj.rectangle1:setHeight(360);
    obj.rectangle1:setColor("Red");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(3);
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setLeft(005);
    obj.rectangle2:setTop(005);
    obj.rectangle2:setWidth(350);
    obj.rectangle2:setHeight(350);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(4);
    obj.rectangle2:setName("rectangle2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout3);
    obj.image2:setLeft(005);
    obj.image2:setTop(005);
    obj.image2:setWidth(350);
    obj.image2:setHeight(350);
    obj.image2:setField("basPERS");
    obj.image2:setEditable(true);
    obj.image2:setStyle("proportional");
    obj.image2:setHint("Imagem do Personagem");
    lfm_setPropAsString(obj.image2, "animate",  "true");
    obj.image2:setName("image2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.frmGeral);
    obj.layout4:setLeft(10);
    obj.layout4:setTop(250);
    obj.layout4:setHeight(320);
    obj.layout4:setWidth(420);
    obj.layout4:setName("layout4");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout4);
    obj.label18:setLeft(000);
    obj.label18:setTop(000);
    obj.label18:setHeight(20);
    obj.label18:setWidth(120);
    obj.label18:setText("Atributo");
    obj.label18:setAutoSize(true);
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout4);
    obj.label19:setLeft(100);
    obj.label19:setTop(000);
    obj.label19:setHeight(20);
    obj.label19:setWidth(30);
    obj.label19:setText("Valor");
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout4);
    obj.label20:setLeft(135);
    obj.label20:setTop(000);
    obj.label20:setHeight(20);
    obj.label20:setWidth(50);
    obj.label20:setText("Estágios");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout4);
    obj.label21:setLeft(185);
    obj.label21:setTop(000);
    obj.label21:setHeight(20);
    obj.label21:setWidth(30);
    obj.label21:setText("Total");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout4);
    obj.label22:setLeft(220);
    obj.label22:setTop(000);
    obj.label22:setHeight(20);
    obj.label22:setWidth(30);
    obj.label22:setText("Mod");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout4);
    obj.label23:setLeft(000);
    obj.label23:setTop(025);
    obj.label23:setHeight(20);
    obj.label23:setWidth(120);
    obj.label23:setText("HP");
    obj.label23:setAutoSize(true);
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setName("label23");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout4);
    obj.edit18:setLeft(100);
    obj.edit18:setTop(025);
    obj.edit18:setHeight(20);
    obj.edit18:setWidth(30);
    obj.edit18:setField("HP_val");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout4);
    obj.edit19:setLeft(185);
    obj.edit19:setTop(025);
    obj.edit19:setHeight(20);
    obj.edit19:setWidth(30);
    obj.edit19:setField("HP_tot");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setType("number");
    obj.edit19:setEnabled(false);
    obj.edit19:setName("edit19");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout4);
    obj.label24:setLeft(000);
    obj.label24:setTop(050);
    obj.label24:setHeight(20);
    obj.label24:setWidth(120);
    obj.label24:setText("Ataque");
    obj.label24:setAutoSize(true);
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setName("label24");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout4);
    obj.edit20:setLeft(100);
    obj.edit20:setTop(050);
    obj.edit20:setHeight(20);
    obj.edit20:setWidth(30);
    obj.edit20:setField("ATK_val");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout4);
    obj.comboBox1:setLeft(135);
    obj.comboBox1:setTop(050);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setWidth(45);
    obj.comboBox1:setField("ATK_edc");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox1:setName("comboBox1");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout4);
    obj.edit21:setLeft(185);
    obj.edit21:setTop(050);
    obj.edit21:setHeight(20);
    obj.edit21:setWidth(30);
    obj.edit21:setField("ATK_tot");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setType("number");
    obj.edit21:setEnabled(false);
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout4);
    obj.edit22:setLeft(220);
    obj.edit22:setTop(050);
    obj.edit22:setHeight(20);
    obj.edit22:setWidth(30);
    obj.edit22:setField("ATK_mod");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setType("number");
    obj.edit22:setEnabled(false);
    obj.edit22:setName("edit22");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout4);
    obj.dataLink1:setField("ATK_val");
    obj.dataLink1:setDefaultValue("8");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout4);
    obj.dataLink2:setField("ATK_edc");
    obj.dataLink2:setDefaultValue("7");
    obj.dataLink2:setName("dataLink2");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout4);
    obj.label25:setLeft(000);
    obj.label25:setTop(075);
    obj.label25:setHeight(20);
    obj.label25:setWidth(120);
    obj.label25:setText("Defesa");
    obj.label25:setAutoSize(true);
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setName("label25");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout4);
    obj.edit23:setLeft(100);
    obj.edit23:setTop(075);
    obj.edit23:setHeight(20);
    obj.edit23:setWidth(30);
    obj.edit23:setField("DEF_val");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout4);
    obj.comboBox2:setLeft(135);
    obj.comboBox2:setTop(075);
    obj.comboBox2:setHeight(20);
    obj.comboBox2:setWidth(45);
    obj.comboBox2:setField("DEF_edc");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox2:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox2:setName("comboBox2");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout4);
    obj.edit24:setLeft(185);
    obj.edit24:setTop(075);
    obj.edit24:setHeight(20);
    obj.edit24:setWidth(30);
    obj.edit24:setField("DEF_tot");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setType("number");
    obj.edit24:setEnabled(false);
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout4);
    obj.edit25:setLeft(220);
    obj.edit25:setTop(075);
    obj.edit25:setHeight(20);
    obj.edit25:setWidth(30);
    obj.edit25:setField("DEF_mod");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setType("number");
    obj.edit25:setEnabled(false);
    obj.edit25:setName("edit25");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout4);
    obj.dataLink3:setField("DEF_val");
    obj.dataLink3:setDefaultValue("8");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout4);
    obj.dataLink4:setField("DEF_edc");
    obj.dataLink4:setDefaultValue("7");
    obj.dataLink4:setName("dataLink4");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout4);
    obj.label26:setLeft(000);
    obj.label26:setTop(100);
    obj.label26:setHeight(20);
    obj.label26:setWidth(120);
    obj.label26:setText("Ataque Especial");
    obj.label26:setAutoSize(true);
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");
    obj.label26:setName("label26");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout4);
    obj.edit26:setLeft(100);
    obj.edit26:setTop(100);
    obj.edit26:setHeight(20);
    obj.edit26:setWidth(30);
    obj.edit26:setField("SPATK_val");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout4);
    obj.comboBox3:setLeft(135);
    obj.comboBox3:setTop(100);
    obj.comboBox3:setHeight(20);
    obj.comboBox3:setWidth(45);
    obj.comboBox3:setField("SPATK_edc");
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox3:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox3:setName("comboBox3");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout4);
    obj.edit27:setLeft(185);
    obj.edit27:setTop(100);
    obj.edit27:setHeight(20);
    obj.edit27:setWidth(30);
    obj.edit27:setField("SPATK_tot");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setEnabled(false);
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout4);
    obj.edit28:setLeft(220);
    obj.edit28:setTop(100);
    obj.edit28:setHeight(20);
    obj.edit28:setWidth(30);
    obj.edit28:setField("SPATK_mod");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setType("number");
    obj.edit28:setEnabled(false);
    obj.edit28:setName("edit28");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout4);
    obj.dataLink5:setField("SPATK_val");
    obj.dataLink5:setDefaultValue("8");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout4);
    obj.dataLink6:setField("SPATK_edc");
    obj.dataLink6:setDefaultValue("7");
    obj.dataLink6:setName("dataLink6");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout4);
    obj.label27:setLeft(000);
    obj.label27:setTop(125);
    obj.label27:setHeight(20);
    obj.label27:setWidth(120);
    obj.label27:setText("Defesa Especial");
    obj.label27:setAutoSize(true);
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setName("label27");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout4);
    obj.edit29:setLeft(100);
    obj.edit29:setTop(125);
    obj.edit29:setHeight(20);
    obj.edit29:setWidth(30);
    obj.edit29:setField("SPDEF_val");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout4);
    obj.comboBox4:setLeft(135);
    obj.comboBox4:setTop(125);
    obj.comboBox4:setHeight(20);
    obj.comboBox4:setWidth(45);
    obj.comboBox4:setField("SPDEF_edc");
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox4:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox4:setName("comboBox4");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout4);
    obj.edit30:setLeft(185);
    obj.edit30:setTop(125);
    obj.edit30:setHeight(20);
    obj.edit30:setWidth(30);
    obj.edit30:setField("SPDEF_tot");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setType("number");
    obj.edit30:setEnabled(false);
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout4);
    obj.edit31:setLeft(220);
    obj.edit31:setTop(125);
    obj.edit31:setHeight(20);
    obj.edit31:setWidth(30);
    obj.edit31:setField("SPDEF_mod");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setType("number");
    obj.edit31:setEnabled(false);
    obj.edit31:setName("edit31");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout4);
    obj.dataLink7:setField("SPDEF_val");
    obj.dataLink7:setDefaultValue("8");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout4);
    obj.dataLink8:setField("SPDEF_edc");
    obj.dataLink8:setDefaultValue("7");
    obj.dataLink8:setName("dataLink8");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout4);
    obj.label28:setLeft(000);
    obj.label28:setTop(150);
    obj.label28:setHeight(20);
    obj.label28:setWidth(120);
    obj.label28:setText("Velocidade");
    obj.label28:setAutoSize(true);
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setName("label28");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout4);
    obj.edit32:setLeft(100);
    obj.edit32:setTop(150);
    obj.edit32:setHeight(20);
    obj.edit32:setWidth(30);
    obj.edit32:setField("SPD_val");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout4);
    obj.comboBox5:setLeft(135);
    obj.comboBox5:setTop(150);
    obj.comboBox5:setHeight(20);
    obj.comboBox5:setWidth(45);
    obj.comboBox5:setField("SPD_edc");
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox5:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox5:setName("comboBox5");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout4);
    obj.edit33:setLeft(185);
    obj.edit33:setTop(150);
    obj.edit33:setHeight(20);
    obj.edit33:setWidth(30);
    obj.edit33:setField("SPD_tot");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setType("number");
    obj.edit33:setEnabled(false);
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout4);
    obj.edit34:setLeft(220);
    obj.edit34:setTop(150);
    obj.edit34:setHeight(20);
    obj.edit34:setWidth(30);
    obj.edit34:setField("SPD_mod");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setType("number");
    obj.edit34:setEnabled(false);
    obj.edit34:setName("edit34");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout4);
    obj.dataLink9:setField("SPD_val");
    obj.dataLink9:setDefaultValue("8");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout4);
    obj.dataLink10:setField("SPD_edc");
    obj.dataLink10:setDefaultValue("7");
    obj.dataLink10:setName("dataLink10");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.frmGeral);
    obj.layout5:setLeft(275);
    obj.layout5:setTop(300);
    obj.layout5:setHeight(320);
    obj.layout5:setWidth(420);
    obj.layout5:setName("layout5");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout5);
    obj.label29:setLeft(00);
    obj.label29:setTop(000);
    obj.label29:setHeight(20);
    obj.label29:setWidth(80);
    obj.label29:setText("Evasão");
    obj.label29:setAutoSize(true);
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout5);
    obj.label30:setLeft(55);
    obj.label30:setTop(000);
    obj.label30:setHeight(20);
    obj.label30:setWidth(30);
    obj.label30:setText("Tot.");
    obj.label30:setAutoSize(true);
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout5);
    obj.label31:setLeft(90);
    obj.label31:setTop(000);
    obj.label31:setHeight(20);
    obj.label31:setWidth(30);
    obj.label31:setText("Bôn.");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout5);
    obj.label32:setLeft(000);
    obj.label32:setTop(025);
    obj.label32:setHeight(20);
    obj.label32:setWidth(50);
    obj.label32:setText("Física");
    obj.label32:setAutoSize(true);
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setName("label32");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout5);
    obj.edit35:setLeft(55);
    obj.edit35:setTop(025);
    obj.edit35:setHeight(20);
    obj.edit35:setWidth(30);
    obj.edit35:setField("EVA_FIS");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setType("number");
    obj.edit35:setEnabled(false);
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout5);
    obj.edit36:setLeft(90);
    obj.edit36:setTop(025);
    obj.edit36:setHeight(20);
    obj.edit36:setWidth(30);
    obj.edit36:setField("pers_bonEVAF");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout5);
    obj.label33:setLeft(000);
    obj.label33:setTop(050);
    obj.label33:setHeight(20);
    obj.label33:setWidth(50);
    obj.label33:setText("Especial");
    obj.label33:setAutoSize(true);
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setName("label33");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout5);
    obj.edit37:setLeft(55);
    obj.edit37:setTop(050);
    obj.edit37:setHeight(20);
    obj.edit37:setWidth(30);
    obj.edit37:setField("EVA_ESP");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setType("number");
    obj.edit37:setEnabled(false);
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout5);
    obj.edit38:setLeft(90);
    obj.edit38:setTop(050);
    obj.edit38:setHeight(20);
    obj.edit38:setWidth(30);
    obj.edit38:setField("pers_bonEVAE");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout5);
    obj.label34:setLeft(000);
    obj.label34:setTop(075);
    obj.label34:setHeight(20);
    obj.label34:setWidth(50);
    obj.label34:setText("Veloz");
    obj.label34:setAutoSize(true);
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setName("label34");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout5);
    obj.edit39:setLeft(55);
    obj.edit39:setTop(075);
    obj.edit39:setHeight(20);
    obj.edit39:setWidth(30);
    obj.edit39:setField("EVA_VEL");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setType("number");
    obj.edit39:setEnabled(false);
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout5);
    obj.edit40:setLeft(90);
    obj.edit40:setTop(075);
    obj.edit40:setHeight(20);
    obj.edit40:setWidth(30);
    obj.edit40:setField("pers_bonEVAV");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.frmGeral);
    obj.layout6:setLeft(410);
    obj.layout6:setTop(275);
    obj.layout6:setHeight(320);
    obj.layout6:setWidth(420);
    obj.layout6:setName("layout6");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout6);
    obj.label35:setLeft(000);
    obj.label35:setTop(000);
    obj.label35:setHeight(20);
    obj.label35:setWidth(110);
    obj.label35:setText("Desloc.");
    obj.label35:setAutoSize(true);
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout6);
    obj.label36:setLeft(80);
    obj.label36:setTop(000);
    obj.label36:setHeight(20);
    obj.label36:setWidth(100);
    obj.label36:setText("Total");
    obj.label36:setAutoSize(true);
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout6);
    obj.label37:setLeft(115);
    obj.label37:setTop(000);
    obj.label37:setHeight(20);
    obj.label37:setWidth(100);
    obj.label37:setText("Base");
    obj.label37:setAutoSize(true);
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout6);
    obj.label38:setLeft(150);
    obj.label38:setTop(000);
    obj.label38:setHeight(20);
    obj.label38:setWidth(100);
    obj.label38:setText("Bônus");
    obj.label38:setAutoSize(true);
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout6);
    obj.label39:setLeft(000);
    obj.label39:setTop(025);
    obj.label39:setHeight(20);
    obj.label39:setWidth(110);
    obj.label39:setText("Terrestre");
    obj.label39:setAutoSize(true);
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setName("label39");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout6);
    obj.edit41:setLeft(80);
    obj.edit41:setTop(025);
    obj.edit41:setHeight(20);
    obj.edit41:setWidth(30);
    obj.edit41:setField("DES_TER");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setType("number");
    obj.edit41:setEnabled(false);
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout6);
    obj.edit42:setLeft(115);
    obj.edit42:setTop(025);
    obj.edit42:setHeight(20);
    obj.edit42:setWidth(30);
    obj.edit42:setField("bas_DES_TER");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setType("number");
    obj.edit42:setEnabled(false);
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout6);
    obj.edit43:setLeft(150);
    obj.edit43:setTop(025);
    obj.edit43:setHeight(20);
    obj.edit43:setWidth(30);
    obj.edit43:setField("bon_DES_TER");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout6);
    obj.label40:setLeft(000);
    obj.label40:setTop(050);
    obj.label40:setHeight(20);
    obj.label40:setWidth(110);
    obj.label40:setText("Natação");
    obj.label40:setAutoSize(true);
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setName("label40");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout6);
    obj.edit44:setLeft(80);
    obj.edit44:setTop(050);
    obj.edit44:setHeight(20);
    obj.edit44:setWidth(30);
    obj.edit44:setField("DES_NAT");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setType("number");
    obj.edit44:setEnabled(false);
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout6);
    obj.edit45:setLeft(115);
    obj.edit45:setTop(050);
    obj.edit45:setHeight(20);
    obj.edit45:setWidth(30);
    obj.edit45:setField("bas_DES_NAT");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setType("number");
    obj.edit45:setEnabled(false);
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout6);
    obj.edit46:setLeft(150);
    obj.edit46:setTop(050);
    obj.edit46:setHeight(20);
    obj.edit46:setWidth(30);
    obj.edit46:setField("bon_DES_NAT");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout6);
    obj.label41:setLeft(000);
    obj.label41:setTop(075);
    obj.label41:setHeight(20);
    obj.label41:setWidth(110);
    obj.label41:setText("Subaquático");
    obj.label41:setAutoSize(true);
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setName("label41");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout6);
    obj.edit47:setLeft(80);
    obj.edit47:setTop(075);
    obj.edit47:setHeight(20);
    obj.edit47:setWidth(30);
    obj.edit47:setField("DES_SUB");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setType("number");
    obj.edit47:setEnabled(false);
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout6);
    obj.edit48:setLeft(115);
    obj.edit48:setTop(075);
    obj.edit48:setHeight(20);
    obj.edit48:setWidth(30);
    obj.edit48:setField("bas_DES_SUB");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setType("number");
    obj.edit48:setEnabled(false);
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout6);
    obj.edit49:setLeft(150);
    obj.edit49:setTop(075);
    obj.edit49:setHeight(20);
    obj.edit49:setWidth(30);
    obj.edit49:setField("bon_DES_SUB");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout6);
    obj.label42:setLeft(000);
    obj.label42:setTop(100);
    obj.label42:setHeight(20);
    obj.label42:setWidth(110);
    obj.label42:setText("Escavação");
    obj.label42:setAutoSize(true);
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");
    obj.label42:setName("label42");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout6);
    obj.edit50:setLeft(80);
    obj.edit50:setTop(100);
    obj.edit50:setHeight(20);
    obj.edit50:setWidth(30);
    obj.edit50:setField("DES_ESC");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setType("number");
    obj.edit50:setEnabled(false);
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout6);
    obj.edit51:setLeft(115);
    obj.edit51:setTop(100);
    obj.edit51:setHeight(20);
    obj.edit51:setWidth(30);
    obj.edit51:setField("bas_DES_ESC");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout6);
    obj.edit52:setLeft(150);
    obj.edit52:setTop(100);
    obj.edit52:setHeight(20);
    obj.edit52:setWidth(30);
    obj.edit52:setField("bon_DES_ESC");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout6);
    obj.label43:setLeft(000);
    obj.label43:setTop(125);
    obj.label43:setHeight(20);
    obj.label43:setWidth(110);
    obj.label43:setText("Voo");
    obj.label43:setAutoSize(true);
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setName("label43");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout6);
    obj.edit53:setLeft(80);
    obj.edit53:setTop(125);
    obj.edit53:setHeight(20);
    obj.edit53:setWidth(30);
    obj.edit53:setField("DES_VOO");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setType("number");
    obj.edit53:setEnabled(false);
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout6);
    obj.edit54:setLeft(115);
    obj.edit54:setTop(125);
    obj.edit54:setHeight(20);
    obj.edit54:setWidth(30);
    obj.edit54:setField("bas_DES_VOO");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout6);
    obj.edit55:setLeft(150);
    obj.edit55:setTop(125);
    obj.edit55:setHeight(20);
    obj.edit55:setWidth(30);
    obj.edit55:setField("bon_DES_VOO");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setType("number");
    obj.edit55:setName("edit55");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.frmGeral);
    obj.layout7:setLeft(60);
    obj.layout7:setTop(460);
    obj.layout7:setHeight(650);
    obj.layout7:setWidth(1100);
    obj.layout7:setName("layout7");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout7);
    obj.rectangle3:setLeft(0);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(285);
    obj.rectangle3:setHeight(75);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("red");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout7);
    obj.image3:setLeft(005);
    obj.image3:setTop(10);
    obj.image3:setHeight(50);
    obj.image3:setWidth(50);
    obj.image3:setField("ImagemSlot1");
    obj.image3:setStyle("stretch");
    lfm_setPropAsString(obj.image3, "animate",  "true");
    obj.image3:setName("image3");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout7);
    obj.edit56:setLeft(060);
    obj.edit56:setTop(5);
    obj.edit56:setHeight(20);
    obj.edit56:setWidth(120);
    obj.edit56:setField("NomeSlot1");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setEnabled(false);
    obj.edit56:setName("edit56");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout7);
    obj.label44:setLeft(060);
    obj.label44:setTop(30);
    obj.label44:setHeight(20);
    obj.label44:setWidth(20);
    obj.label44:setText("HP");
    obj.label44:setAutoSize(true);
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setName("label44");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout7);
    obj.progressBar1:setLeft(080);
    obj.progressBar1:setTop(30);
    obj.progressBar1:setWidth(100);
    obj.progressBar1:setHeight(15);
    obj.progressBar1:setColor("green");
    obj.progressBar1:setField("baseHPAtual1");
    obj.progressBar1:setFieldMax("baseHPMAX1");
    obj.progressBar1:setName("progressBar1");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout7);
    obj.image4:setLeft(235);
    obj.image4:setTop(25);
    obj.image4:setHeight(30);
    obj.image4:setWidth(30);
    obj.image4:setField("GenderSlot1");
    obj.image4:setStyle("stretch");
    obj.image4:setName("image4");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout7);
    obj.label45:setLeft(190);
    obj.label45:setTop(5);
    obj.label45:setHeight(20);
    obj.label45:setWidth(20);
    obj.label45:setText("Lv.");
    obj.label45:setAutoSize(true);
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setName("label45");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout7);
    obj.edit57:setLeft(210);
    obj.edit57:setTop(5);
    obj.edit57:setHeight(20);
    obj.edit57:setWidth(30);
    obj.edit57:setField("LevelSlot1");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setEnabled(false);
    obj.edit57:setName("edit57");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout7);
    obj.button1:setLeft(262);
    obj.button1:setTop(51);
    obj.button1:setHeight(20);
    obj.button1:setWidth(20);
    obj.button1:setText("A");
    obj.button1:setHint("Apagar");
    obj.button1:setName("button1");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout7);
    obj.edit58:setLeft(95);
    obj.edit58:setTop(50);
    obj.edit58:setHeight(20);
    obj.edit58:setWidth(30);
    obj.edit58:setField("baseHPAtual1");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setEnabled(false);
    obj.edit58:setName("edit58");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout7);
    obj.label46:setLeft(125);
    obj.label46:setTop(50);
    obj.label46:setHeight(20);
    obj.label46:setWidth(5);
    obj.label46:setText("/");
    obj.label46:setAutoSize(true);
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");
    obj.label46:setName("label46");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout7);
    obj.edit59:setLeft(130);
    obj.edit59:setTop(50);
    obj.edit59:setHeight(20);
    obj.edit59:setWidth(30);
    obj.edit59:setField("baseHPMAX1");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setEnabled(false);
    obj.edit59:setName("edit59");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout7);
    obj.dataLink11:setField("baseHPAtual1");
    obj.dataLink11:setDefaultValue("0");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout7);
    obj.dataLink12:setField("baseHPMAX1");
    obj.dataLink12:setDefaultValue("0");
    obj.dataLink12:setName("dataLink12");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.frmGeral);
    obj.layout8:setLeft(60);
    obj.layout8:setTop(545);
    obj.layout8:setHeight(650);
    obj.layout8:setWidth(1100);
    obj.layout8:setName("layout8");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout8);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(285);
    obj.rectangle4:setHeight(75);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("red");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout8);
    obj.image5:setLeft(005);
    obj.image5:setTop(10);
    obj.image5:setHeight(50);
    obj.image5:setWidth(50);
    obj.image5:setField("ImagemSlot2");
    obj.image5:setStyle("stretch");
    lfm_setPropAsString(obj.image5, "animate",  "true");
    obj.image5:setName("image5");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout8);
    obj.edit60:setLeft(060);
    obj.edit60:setTop(5);
    obj.edit60:setHeight(20);
    obj.edit60:setWidth(120);
    obj.edit60:setField("NomeSlot2");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setEnabled(false);
    obj.edit60:setName("edit60");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout8);
    obj.label47:setLeft(060);
    obj.label47:setTop(30);
    obj.label47:setHeight(20);
    obj.label47:setWidth(20);
    obj.label47:setText("HP");
    obj.label47:setAutoSize(true);
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setName("label47");

    obj.progressBar2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.layout8);
    obj.progressBar2:setLeft(080);
    obj.progressBar2:setTop(30);
    obj.progressBar2:setWidth(100);
    obj.progressBar2:setHeight(15);
    obj.progressBar2:setColor("green");
    obj.progressBar2:setField("baseHPAtual2");
    obj.progressBar2:setFieldMax("baseHPMAX2");
    obj.progressBar2:setName("progressBar2");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout8);
    obj.image6:setLeft(235);
    obj.image6:setTop(25);
    obj.image6:setHeight(30);
    obj.image6:setWidth(30);
    obj.image6:setField("GenderSlot2");
    obj.image6:setStyle("stretch");
    obj.image6:setName("image6");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout8);
    obj.label48:setLeft(190);
    obj.label48:setTop(5);
    obj.label48:setHeight(20);
    obj.label48:setWidth(20);
    obj.label48:setText("Lv.");
    obj.label48:setAutoSize(true);
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");
    obj.label48:setName("label48");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout8);
    obj.edit61:setLeft(210);
    obj.edit61:setTop(5);
    obj.edit61:setHeight(20);
    obj.edit61:setWidth(30);
    obj.edit61:setField("LevelSlot2");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setEnabled(false);
    obj.edit61:setName("edit61");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout8);
    obj.button2:setLeft(262);
    obj.button2:setTop(51);
    obj.button2:setHeight(20);
    obj.button2:setWidth(20);
    obj.button2:setText("A");
    obj.button2:setHint("Apagar");
    obj.button2:setName("button2");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout8);
    obj.edit62:setLeft(95);
    obj.edit62:setTop(50);
    obj.edit62:setHeight(20);
    obj.edit62:setWidth(30);
    obj.edit62:setField("baseHPAtual2");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setEnabled(false);
    obj.edit62:setName("edit62");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout8);
    obj.label49:setLeft(125);
    obj.label49:setTop(50);
    obj.label49:setHeight(20);
    obj.label49:setWidth(5);
    obj.label49:setText("/");
    obj.label49:setAutoSize(true);
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");
    obj.label49:setName("label49");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout8);
    obj.edit63:setLeft(130);
    obj.edit63:setTop(50);
    obj.edit63:setHeight(20);
    obj.edit63:setWidth(30);
    obj.edit63:setField("baseHPMAX2");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setEnabled(false);
    obj.edit63:setName("edit63");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout8);
    obj.dataLink13:setField("baseHPAtual2");
    obj.dataLink13:setDefaultValue("0");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout8);
    obj.dataLink14:setField("baseHPMAX2");
    obj.dataLink14:setDefaultValue("0");
    obj.dataLink14:setName("dataLink14");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.frmGeral);
    obj.layout9:setLeft(350);
    obj.layout9:setTop(460);
    obj.layout9:setHeight(650);
    obj.layout9:setWidth(1100);
    obj.layout9:setName("layout9");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout9);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(285);
    obj.rectangle5:setHeight(75);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("red");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setName("rectangle5");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout9);
    obj.image7:setLeft(005);
    obj.image7:setTop(10);
    obj.image7:setHeight(50);
    obj.image7:setWidth(50);
    obj.image7:setField("ImagemSlot3");
    obj.image7:setStyle("stretch");
    lfm_setPropAsString(obj.image7, "animate",  "true");
    obj.image7:setName("image7");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout9);
    obj.edit64:setLeft(060);
    obj.edit64:setTop(5);
    obj.edit64:setHeight(20);
    obj.edit64:setWidth(120);
    obj.edit64:setField("NomeSlot3");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setEnabled(false);
    obj.edit64:setName("edit64");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout9);
    obj.label50:setLeft(060);
    obj.label50:setTop(30);
    obj.label50:setHeight(20);
    obj.label50:setWidth(20);
    obj.label50:setText("HP");
    obj.label50:setAutoSize(true);
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setName("label50");

    obj.progressBar3 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar3:setParent(obj.layout9);
    obj.progressBar3:setLeft(080);
    obj.progressBar3:setTop(30);
    obj.progressBar3:setWidth(100);
    obj.progressBar3:setHeight(15);
    obj.progressBar3:setColor("green");
    obj.progressBar3:setField("baseHPAtual3");
    obj.progressBar3:setFieldMax("baseHPMAX3");
    obj.progressBar3:setName("progressBar3");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout9);
    obj.image8:setLeft(235);
    obj.image8:setTop(25);
    obj.image8:setHeight(30);
    obj.image8:setWidth(30);
    obj.image8:setField("GenderSlot3");
    obj.image8:setStyle("stretch");
    obj.image8:setName("image8");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout9);
    obj.label51:setLeft(190);
    obj.label51:setTop(5);
    obj.label51:setHeight(20);
    obj.label51:setWidth(20);
    obj.label51:setText("Lv.");
    obj.label51:setAutoSize(true);
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setName("label51");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout9);
    obj.edit65:setLeft(210);
    obj.edit65:setTop(5);
    obj.edit65:setHeight(20);
    obj.edit65:setWidth(30);
    obj.edit65:setField("LevelSlot3");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setEnabled(false);
    obj.edit65:setName("edit65");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout9);
    obj.button3:setLeft(262);
    obj.button3:setTop(51);
    obj.button3:setHeight(20);
    obj.button3:setWidth(20);
    obj.button3:setText("A");
    obj.button3:setHint("Apagar");
    obj.button3:setName("button3");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout9);
    obj.edit66:setLeft(95);
    obj.edit66:setTop(50);
    obj.edit66:setHeight(20);
    obj.edit66:setWidth(30);
    obj.edit66:setField("baseHPAtual3");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setEnabled(false);
    obj.edit66:setName("edit66");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout9);
    obj.label52:setLeft(125);
    obj.label52:setTop(50);
    obj.label52:setHeight(20);
    obj.label52:setWidth(5);
    obj.label52:setText("/");
    obj.label52:setAutoSize(true);
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setName("label52");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout9);
    obj.edit67:setLeft(130);
    obj.edit67:setTop(50);
    obj.edit67:setHeight(20);
    obj.edit67:setWidth(30);
    obj.edit67:setField("baseHPMAX3");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setEnabled(false);
    obj.edit67:setName("edit67");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout9);
    obj.dataLink15:setField("baseHPAtual3");
    obj.dataLink15:setDefaultValue("0");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout9);
    obj.dataLink16:setField("baseHPMAX3");
    obj.dataLink16:setDefaultValue("0");
    obj.dataLink16:setName("dataLink16");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.frmGeral);
    obj.layout10:setLeft(350);
    obj.layout10:setTop(545);
    obj.layout10:setHeight(650);
    obj.layout10:setWidth(1100);
    obj.layout10:setName("layout10");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout10);
    obj.rectangle6:setLeft(0);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(285);
    obj.rectangle6:setHeight(75);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("red");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout10);
    obj.image9:setLeft(005);
    obj.image9:setTop(10);
    obj.image9:setHeight(50);
    obj.image9:setWidth(50);
    obj.image9:setField("ImagemSlot4");
    obj.image9:setStyle("stretch");
    lfm_setPropAsString(obj.image9, "animate",  "true");
    obj.image9:setName("image9");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout10);
    obj.edit68:setLeft(060);
    obj.edit68:setTop(5);
    obj.edit68:setHeight(20);
    obj.edit68:setWidth(120);
    obj.edit68:setField("NomeSlot4");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setEnabled(false);
    obj.edit68:setName("edit68");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout10);
    obj.label53:setLeft(060);
    obj.label53:setTop(30);
    obj.label53:setHeight(20);
    obj.label53:setWidth(20);
    obj.label53:setText("HP");
    obj.label53:setAutoSize(true);
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setName("label53");

    obj.progressBar4 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar4:setParent(obj.layout10);
    obj.progressBar4:setLeft(080);
    obj.progressBar4:setTop(30);
    obj.progressBar4:setWidth(100);
    obj.progressBar4:setHeight(15);
    obj.progressBar4:setColor("green");
    obj.progressBar4:setField("baseHPAtual4");
    obj.progressBar4:setFieldMax("baseHPMAX4");
    obj.progressBar4:setName("progressBar4");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout10);
    obj.image10:setLeft(235);
    obj.image10:setTop(25);
    obj.image10:setHeight(30);
    obj.image10:setWidth(30);
    obj.image10:setField("GenderSlot4");
    obj.image10:setStyle("stretch");
    obj.image10:setName("image10");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout10);
    obj.label54:setLeft(190);
    obj.label54:setTop(5);
    obj.label54:setHeight(20);
    obj.label54:setWidth(20);
    obj.label54:setText("Lv.");
    obj.label54:setAutoSize(true);
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");
    obj.label54:setName("label54");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout10);
    obj.edit69:setLeft(210);
    obj.edit69:setTop(5);
    obj.edit69:setHeight(20);
    obj.edit69:setWidth(30);
    obj.edit69:setField("LevelSlot4");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setEnabled(false);
    obj.edit69:setName("edit69");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout10);
    obj.button4:setLeft(262);
    obj.button4:setTop(51);
    obj.button4:setHeight(20);
    obj.button4:setWidth(20);
    obj.button4:setText("A");
    obj.button4:setHint("Apagar");
    obj.button4:setName("button4");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout10);
    obj.edit70:setLeft(95);
    obj.edit70:setTop(50);
    obj.edit70:setHeight(20);
    obj.edit70:setWidth(30);
    obj.edit70:setField("baseHPAtual4");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setEnabled(false);
    obj.edit70:setName("edit70");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout10);
    obj.label55:setLeft(125);
    obj.label55:setTop(50);
    obj.label55:setHeight(20);
    obj.label55:setWidth(5);
    obj.label55:setText("/");
    obj.label55:setAutoSize(true);
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setName("label55");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout10);
    obj.edit71:setLeft(130);
    obj.edit71:setTop(50);
    obj.edit71:setHeight(20);
    obj.edit71:setWidth(30);
    obj.edit71:setField("baseHPMAX4");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setEnabled(false);
    obj.edit71:setName("edit71");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout10);
    obj.dataLink17:setField("baseHPAtual4");
    obj.dataLink17:setDefaultValue("0");
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout10);
    obj.dataLink18:setField("baseHPMAX4");
    obj.dataLink18:setDefaultValue("0");
    obj.dataLink18:setName("dataLink18");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.frmGeral);
    obj.layout11:setLeft(640);
    obj.layout11:setTop(460);
    obj.layout11:setHeight(650);
    obj.layout11:setWidth(1100);
    obj.layout11:setName("layout11");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout11);
    obj.rectangle7:setLeft(0);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(285);
    obj.rectangle7:setHeight(75);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("red");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setName("rectangle7");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.layout11);
    obj.image11:setLeft(005);
    obj.image11:setTop(10);
    obj.image11:setHeight(50);
    obj.image11:setWidth(50);
    obj.image11:setField("ImagemSlot5");
    obj.image11:setStyle("stretch");
    lfm_setPropAsString(obj.image11, "animate",  "true");
    obj.image11:setName("image11");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout11);
    obj.edit72:setLeft(060);
    obj.edit72:setTop(5);
    obj.edit72:setHeight(20);
    obj.edit72:setWidth(120);
    obj.edit72:setField("NomeSlot5");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setEnabled(false);
    obj.edit72:setName("edit72");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout11);
    obj.label56:setLeft(060);
    obj.label56:setTop(30);
    obj.label56:setHeight(20);
    obj.label56:setWidth(20);
    obj.label56:setText("HP");
    obj.label56:setAutoSize(true);
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");
    obj.label56:setName("label56");

    obj.progressBar5 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar5:setParent(obj.layout11);
    obj.progressBar5:setLeft(080);
    obj.progressBar5:setTop(30);
    obj.progressBar5:setWidth(100);
    obj.progressBar5:setHeight(15);
    obj.progressBar5:setColor("green");
    obj.progressBar5:setField("baseHPAtual5");
    obj.progressBar5:setFieldMax("baseHPMAX5");
    obj.progressBar5:setName("progressBar5");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.layout11);
    obj.image12:setLeft(235);
    obj.image12:setTop(25);
    obj.image12:setHeight(30);
    obj.image12:setWidth(30);
    obj.image12:setField("GenderSlot5");
    obj.image12:setStyle("stretch");
    obj.image12:setName("image12");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout11);
    obj.label57:setLeft(190);
    obj.label57:setTop(5);
    obj.label57:setHeight(20);
    obj.label57:setWidth(20);
    obj.label57:setText("Lv.");
    obj.label57:setAutoSize(true);
    lfm_setPropAsString(obj.label57, "fontStyle",  "bold");
    obj.label57:setName("label57");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout11);
    obj.edit73:setLeft(210);
    obj.edit73:setTop(5);
    obj.edit73:setHeight(20);
    obj.edit73:setWidth(30);
    obj.edit73:setField("LevelSlot5");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setEnabled(false);
    obj.edit73:setName("edit73");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout11);
    obj.button5:setLeft(262);
    obj.button5:setTop(51);
    obj.button5:setHeight(20);
    obj.button5:setWidth(20);
    obj.button5:setText("A");
    obj.button5:setHint("Apagar");
    obj.button5:setName("button5");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout11);
    obj.edit74:setLeft(95);
    obj.edit74:setTop(50);
    obj.edit74:setHeight(20);
    obj.edit74:setWidth(30);
    obj.edit74:setField("baseHPAtual5");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setEnabled(false);
    obj.edit74:setName("edit74");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout11);
    obj.label58:setLeft(125);
    obj.label58:setTop(50);
    obj.label58:setHeight(20);
    obj.label58:setWidth(5);
    obj.label58:setText("/");
    obj.label58:setAutoSize(true);
    lfm_setPropAsString(obj.label58, "fontStyle",  "bold");
    obj.label58:setName("label58");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout11);
    obj.edit75:setLeft(130);
    obj.edit75:setTop(50);
    obj.edit75:setHeight(20);
    obj.edit75:setWidth(30);
    obj.edit75:setField("baseHPMAX5");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setEnabled(false);
    obj.edit75:setName("edit75");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout11);
    obj.dataLink19:setField("baseHPAtual5");
    obj.dataLink19:setDefaultValue("0");
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout11);
    obj.dataLink20:setField("baseHPMAX5");
    obj.dataLink20:setDefaultValue("0");
    obj.dataLink20:setName("dataLink20");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.frmGeral);
    obj.layout12:setLeft(640);
    obj.layout12:setTop(545);
    obj.layout12:setHeight(650);
    obj.layout12:setWidth(1100);
    obj.layout12:setName("layout12");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout12);
    obj.rectangle8:setLeft(0);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(285);
    obj.rectangle8:setHeight(75);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("red");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setName("rectangle8");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.layout12);
    obj.image13:setLeft(005);
    obj.image13:setTop(10);
    obj.image13:setHeight(50);
    obj.image13:setWidth(50);
    obj.image13:setField("ImagemSlot6");
    obj.image13:setStyle("stretch");
    lfm_setPropAsString(obj.image13, "animate",  "true");
    obj.image13:setName("image13");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout12);
    obj.edit76:setLeft(060);
    obj.edit76:setTop(5);
    obj.edit76:setHeight(20);
    obj.edit76:setWidth(120);
    obj.edit76:setField("NomeSlot6");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setEnabled(false);
    obj.edit76:setName("edit76");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout12);
    obj.label59:setLeft(060);
    obj.label59:setTop(30);
    obj.label59:setHeight(20);
    obj.label59:setWidth(20);
    obj.label59:setText("HP");
    obj.label59:setAutoSize(true);
    lfm_setPropAsString(obj.label59, "fontStyle",  "bold");
    obj.label59:setName("label59");

    obj.progressBar6 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar6:setParent(obj.layout12);
    obj.progressBar6:setLeft(080);
    obj.progressBar6:setTop(30);
    obj.progressBar6:setWidth(100);
    obj.progressBar6:setHeight(15);
    obj.progressBar6:setColor("green");
    obj.progressBar6:setField("baseHPAtual6");
    obj.progressBar6:setFieldMax("baseHPMAX6");
    obj.progressBar6:setName("progressBar6");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.layout12);
    obj.image14:setLeft(235);
    obj.image14:setTop(25);
    obj.image14:setHeight(30);
    obj.image14:setWidth(30);
    obj.image14:setField("GenderSlot6");
    obj.image14:setStyle("stretch");
    obj.image14:setName("image14");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout12);
    obj.label60:setLeft(190);
    obj.label60:setTop(5);
    obj.label60:setHeight(20);
    obj.label60:setWidth(20);
    obj.label60:setText("Lv.");
    obj.label60:setAutoSize(true);
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");
    obj.label60:setName("label60");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout12);
    obj.edit77:setLeft(210);
    obj.edit77:setTop(5);
    obj.edit77:setHeight(20);
    obj.edit77:setWidth(30);
    obj.edit77:setField("LevelSlot6");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setEnabled(false);
    obj.edit77:setName("edit77");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout12);
    obj.button6:setLeft(262);
    obj.button6:setTop(51);
    obj.button6:setHeight(20);
    obj.button6:setWidth(20);
    obj.button6:setText("A");
    obj.button6:setHint("Apagar");
    obj.button6:setName("button6");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout12);
    obj.edit78:setLeft(95);
    obj.edit78:setTop(50);
    obj.edit78:setHeight(20);
    obj.edit78:setWidth(30);
    obj.edit78:setField("baseHPAtual6");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setEnabled(false);
    obj.edit78:setName("edit78");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout12);
    obj.label61:setLeft(125);
    obj.label61:setTop(50);
    obj.label61:setHeight(20);
    obj.label61:setWidth(5);
    obj.label61:setText("/");
    obj.label61:setAutoSize(true);
    lfm_setPropAsString(obj.label61, "fontStyle",  "bold");
    obj.label61:setName("label61");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout12);
    obj.edit79:setLeft(130);
    obj.edit79:setTop(50);
    obj.edit79:setHeight(20);
    obj.edit79:setWidth(30);
    obj.edit79:setField("baseHPMAX6");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setEnabled(false);
    obj.edit79:setName("edit79");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout12);
    obj.dataLink21:setField("baseHPAtual6");
    obj.dataLink21:setDefaultValue("0");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout12);
    obj.dataLink22:setField("baseHPMAX6");
    obj.dataLink22:setDefaultValue("0");
    obj.dataLink22:setName("dataLink22");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.frmGeral);
    obj.layout13:setLeft(990);
    obj.layout13:setTop(13);
    obj.layout13:setHeight(800);
    obj.layout13:setWidth(100);
    obj.layout13:setName("layout13");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout13);
    obj.rectangle9:setLeft(000);
    obj.rectangle9:setTop(00);
    obj.rectangle9:setWidth(40);
    obj.rectangle9:setHeight(40);
    obj.rectangle9:setColor("Red");
    obj.rectangle9:setStrokeColor("black");
    obj.rectangle9:setStrokeSize(4);
    obj.rectangle9:setName("rectangle9");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout13);
    obj.rectangle10:setLeft(005);
    obj.rectangle10:setTop(05);
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setHeight(30);
    obj.rectangle10:setColor("Black");
    obj.rectangle10:setStrokeColor("black");
    obj.rectangle10:setStrokeSize(4);
    obj.rectangle10:setName("rectangle10");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.layout13);
    obj.image15:setLeft(005);
    obj.image15:setTop(00);
    obj.image15:setWidth(30);
    obj.image15:setHeight(30);
    obj.image15:setField("basBADGE11");
    obj.image15:setEditable(true);
    obj.image15:setStyle("proportional");
    obj.image15:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image15:setName("image15");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout13);
    obj.rectangle11:setLeft(000);
    obj.rectangle11:setTop(45);
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(40);
    obj.rectangle11:setColor("Red");
    obj.rectangle11:setStrokeColor("black");
    obj.rectangle11:setStrokeSize(4);
    obj.rectangle11:setName("rectangle11");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout13);
    obj.rectangle12:setLeft(005);
    obj.rectangle12:setTop(50);
    obj.rectangle12:setWidth(30);
    obj.rectangle12:setHeight(30);
    obj.rectangle12:setColor("Black");
    obj.rectangle12:setStrokeColor("black");
    obj.rectangle12:setStrokeSize(4);
    obj.rectangle12:setName("rectangle12");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.layout13);
    obj.image16:setLeft(005);
    obj.image16:setTop(45);
    obj.image16:setWidth(30);
    obj.image16:setHeight(30);
    obj.image16:setField("basBADGE12");
    obj.image16:setEditable(true);
    obj.image16:setStyle("proportional");
    obj.image16:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image16:setName("image16");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout13);
    obj.rectangle13:setLeft(000);
    obj.rectangle13:setTop(90);
    obj.rectangle13:setWidth(40);
    obj.rectangle13:setHeight(40);
    obj.rectangle13:setColor("Red");
    obj.rectangle13:setStrokeColor("black");
    obj.rectangle13:setStrokeSize(4);
    obj.rectangle13:setName("rectangle13");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout13);
    obj.rectangle14:setLeft(005);
    obj.rectangle14:setTop(95);
    obj.rectangle14:setWidth(30);
    obj.rectangle14:setHeight(30);
    obj.rectangle14:setColor("Black");
    obj.rectangle14:setStrokeColor("black");
    obj.rectangle14:setStrokeSize(4);
    obj.rectangle14:setName("rectangle14");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.layout13);
    obj.image17:setLeft(005);
    obj.image17:setTop(90);
    obj.image17:setWidth(30);
    obj.image17:setHeight(30);
    obj.image17:setField("basBADGE13");
    obj.image17:setEditable(true);
    obj.image17:setStyle("proportional");
    obj.image17:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image17:setName("image17");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout13);
    obj.rectangle15:setLeft(000);
    obj.rectangle15:setTop(135);
    obj.rectangle15:setWidth(40);
    obj.rectangle15:setHeight(40);
    obj.rectangle15:setColor("Red");
    obj.rectangle15:setStrokeColor("black");
    obj.rectangle15:setStrokeSize(4);
    obj.rectangle15:setName("rectangle15");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout13);
    obj.rectangle16:setLeft(005);
    obj.rectangle16:setTop(140);
    obj.rectangle16:setWidth(30);
    obj.rectangle16:setHeight(30);
    obj.rectangle16:setColor("Black");
    obj.rectangle16:setStrokeColor("black");
    obj.rectangle16:setStrokeSize(4);
    obj.rectangle16:setName("rectangle16");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.layout13);
    obj.image18:setLeft(005);
    obj.image18:setTop(135);
    obj.image18:setWidth(30);
    obj.image18:setHeight(30);
    obj.image18:setField("basBADGE14");
    obj.image18:setEditable(true);
    obj.image18:setStyle("proportional");
    obj.image18:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image18:setName("image18");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout13);
    obj.rectangle17:setLeft(000);
    obj.rectangle17:setTop(180);
    obj.rectangle17:setWidth(40);
    obj.rectangle17:setHeight(40);
    obj.rectangle17:setColor("Red");
    obj.rectangle17:setStrokeColor("black");
    obj.rectangle17:setStrokeSize(4);
    obj.rectangle17:setName("rectangle17");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout13);
    obj.rectangle18:setLeft(005);
    obj.rectangle18:setTop(185);
    obj.rectangle18:setWidth(30);
    obj.rectangle18:setHeight(30);
    obj.rectangle18:setColor("Black");
    obj.rectangle18:setStrokeColor("black");
    obj.rectangle18:setStrokeSize(4);
    obj.rectangle18:setName("rectangle18");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.layout13);
    obj.image19:setLeft(005);
    obj.image19:setTop(180);
    obj.image19:setWidth(30);
    obj.image19:setHeight(30);
    obj.image19:setField("basBADGE15");
    obj.image19:setEditable(true);
    obj.image19:setStyle("proportional");
    obj.image19:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image19:setName("image19");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout13);
    obj.rectangle19:setLeft(000);
    obj.rectangle19:setTop(225);
    obj.rectangle19:setWidth(40);
    obj.rectangle19:setHeight(40);
    obj.rectangle19:setColor("Red");
    obj.rectangle19:setStrokeColor("black");
    obj.rectangle19:setStrokeSize(4);
    obj.rectangle19:setName("rectangle19");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout13);
    obj.rectangle20:setLeft(005);
    obj.rectangle20:setTop(230);
    obj.rectangle20:setWidth(30);
    obj.rectangle20:setHeight(30);
    obj.rectangle20:setColor("Black");
    obj.rectangle20:setStrokeColor("black");
    obj.rectangle20:setStrokeSize(4);
    obj.rectangle20:setName("rectangle20");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.layout13);
    obj.image20:setLeft(005);
    obj.image20:setTop(225);
    obj.image20:setWidth(30);
    obj.image20:setHeight(30);
    obj.image20:setField("basBADGE16");
    obj.image20:setEditable(true);
    obj.image20:setStyle("proportional");
    obj.image20:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image20:setName("image20");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout13);
    obj.rectangle21:setLeft(000);
    obj.rectangle21:setTop(270);
    obj.rectangle21:setWidth(40);
    obj.rectangle21:setHeight(40);
    obj.rectangle21:setColor("Red");
    obj.rectangle21:setStrokeColor("black");
    obj.rectangle21:setStrokeSize(4);
    obj.rectangle21:setName("rectangle21");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout13);
    obj.rectangle22:setLeft(005);
    obj.rectangle22:setTop(275);
    obj.rectangle22:setWidth(30);
    obj.rectangle22:setHeight(30);
    obj.rectangle22:setColor("Black");
    obj.rectangle22:setStrokeColor("black");
    obj.rectangle22:setStrokeSize(4);
    obj.rectangle22:setName("rectangle22");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.layout13);
    obj.image21:setLeft(005);
    obj.image21:setTop(270);
    obj.image21:setWidth(30);
    obj.image21:setHeight(30);
    obj.image21:setField("basBADGE17");
    obj.image21:setEditable(true);
    obj.image21:setStyle("proportional");
    obj.image21:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image21:setName("image21");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout13);
    obj.rectangle23:setLeft(000);
    obj.rectangle23:setTop(315);
    obj.rectangle23:setWidth(40);
    obj.rectangle23:setHeight(40);
    obj.rectangle23:setColor("Red");
    obj.rectangle23:setStrokeColor("black");
    obj.rectangle23:setStrokeSize(4);
    obj.rectangle23:setName("rectangle23");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout13);
    obj.rectangle24:setLeft(005);
    obj.rectangle24:setTop(320);
    obj.rectangle24:setWidth(30);
    obj.rectangle24:setHeight(30);
    obj.rectangle24:setColor("Black");
    obj.rectangle24:setStrokeColor("black");
    obj.rectangle24:setStrokeSize(4);
    obj.rectangle24:setName("rectangle24");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.layout13);
    obj.image22:setLeft(005);
    obj.image22:setTop(315);
    obj.image22:setWidth(30);
    obj.image22:setHeight(30);
    obj.image22:setField("basBADGE18");
    obj.image22:setEditable(true);
    obj.image22:setStyle("proportional");
    obj.image22:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image22:setName("image22");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.frmGeral);
    obj.layout14:setLeft(1040);
    obj.layout14:setTop(13);
    obj.layout14:setHeight(800);
    obj.layout14:setWidth(100);
    obj.layout14:setName("layout14");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout14);
    obj.rectangle25:setLeft(000);
    obj.rectangle25:setTop(00);
    obj.rectangle25:setWidth(40);
    obj.rectangle25:setHeight(40);
    obj.rectangle25:setColor("Red");
    obj.rectangle25:setStrokeColor("black");
    obj.rectangle25:setStrokeSize(4);
    obj.rectangle25:setName("rectangle25");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout14);
    obj.rectangle26:setLeft(005);
    obj.rectangle26:setTop(05);
    obj.rectangle26:setWidth(30);
    obj.rectangle26:setHeight(30);
    obj.rectangle26:setColor("Black");
    obj.rectangle26:setStrokeColor("black");
    obj.rectangle26:setStrokeSize(4);
    obj.rectangle26:setName("rectangle26");

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.layout14);
    obj.image23:setLeft(005);
    obj.image23:setTop(00);
    obj.image23:setWidth(30);
    obj.image23:setHeight(30);
    obj.image23:setField("basBADGE19");
    obj.image23:setEditable(true);
    obj.image23:setStyle("proportional");
    obj.image23:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image23:setName("image23");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout14);
    obj.rectangle27:setLeft(000);
    obj.rectangle27:setTop(45);
    obj.rectangle27:setWidth(40);
    obj.rectangle27:setHeight(40);
    obj.rectangle27:setColor("Red");
    obj.rectangle27:setStrokeColor("black");
    obj.rectangle27:setStrokeSize(4);
    obj.rectangle27:setName("rectangle27");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout14);
    obj.rectangle28:setLeft(005);
    obj.rectangle28:setTop(50);
    obj.rectangle28:setWidth(30);
    obj.rectangle28:setHeight(30);
    obj.rectangle28:setColor("Black");
    obj.rectangle28:setStrokeColor("black");
    obj.rectangle28:setStrokeSize(4);
    obj.rectangle28:setName("rectangle28");

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.layout14);
    obj.image24:setLeft(005);
    obj.image24:setTop(45);
    obj.image24:setWidth(30);
    obj.image24:setHeight(30);
    obj.image24:setField("basBADGE110");
    obj.image24:setEditable(true);
    obj.image24:setStyle("proportional");
    obj.image24:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image24:setName("image24");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout14);
    obj.rectangle29:setLeft(000);
    obj.rectangle29:setTop(90);
    obj.rectangle29:setWidth(40);
    obj.rectangle29:setHeight(40);
    obj.rectangle29:setColor("Red");
    obj.rectangle29:setStrokeColor("black");
    obj.rectangle29:setStrokeSize(4);
    obj.rectangle29:setName("rectangle29");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout14);
    obj.rectangle30:setLeft(005);
    obj.rectangle30:setTop(95);
    obj.rectangle30:setWidth(30);
    obj.rectangle30:setHeight(30);
    obj.rectangle30:setColor("Black");
    obj.rectangle30:setStrokeColor("black");
    obj.rectangle30:setStrokeSize(4);
    obj.rectangle30:setName("rectangle30");

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.layout14);
    obj.image25:setLeft(005);
    obj.image25:setTop(90);
    obj.image25:setWidth(30);
    obj.image25:setHeight(30);
    obj.image25:setField("basBADGE111");
    obj.image25:setEditable(true);
    obj.image25:setStyle("proportional");
    obj.image25:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image25:setName("image25");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout14);
    obj.rectangle31:setLeft(000);
    obj.rectangle31:setTop(135);
    obj.rectangle31:setWidth(40);
    obj.rectangle31:setHeight(40);
    obj.rectangle31:setColor("Red");
    obj.rectangle31:setStrokeColor("black");
    obj.rectangle31:setStrokeSize(4);
    obj.rectangle31:setName("rectangle31");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout14);
    obj.rectangle32:setLeft(005);
    obj.rectangle32:setTop(140);
    obj.rectangle32:setWidth(30);
    obj.rectangle32:setHeight(30);
    obj.rectangle32:setColor("Black");
    obj.rectangle32:setStrokeColor("black");
    obj.rectangle32:setStrokeSize(4);
    obj.rectangle32:setName("rectangle32");

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.layout14);
    obj.image26:setLeft(005);
    obj.image26:setTop(135);
    obj.image26:setWidth(30);
    obj.image26:setHeight(30);
    obj.image26:setField("basBADGE112");
    obj.image26:setEditable(true);
    obj.image26:setStyle("proportional");
    obj.image26:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image26:setName("image26");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout14);
    obj.rectangle33:setLeft(000);
    obj.rectangle33:setTop(180);
    obj.rectangle33:setWidth(40);
    obj.rectangle33:setHeight(40);
    obj.rectangle33:setColor("Red");
    obj.rectangle33:setStrokeColor("black");
    obj.rectangle33:setStrokeSize(4);
    obj.rectangle33:setName("rectangle33");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout14);
    obj.rectangle34:setLeft(005);
    obj.rectangle34:setTop(185);
    obj.rectangle34:setWidth(30);
    obj.rectangle34:setHeight(30);
    obj.rectangle34:setColor("Black");
    obj.rectangle34:setStrokeColor("black");
    obj.rectangle34:setStrokeSize(4);
    obj.rectangle34:setName("rectangle34");

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.layout14);
    obj.image27:setLeft(005);
    obj.image27:setTop(180);
    obj.image27:setWidth(30);
    obj.image27:setHeight(30);
    obj.image27:setField("basBADGE113");
    obj.image27:setEditable(true);
    obj.image27:setStyle("proportional");
    obj.image27:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image27:setName("image27");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout14);
    obj.rectangle35:setLeft(000);
    obj.rectangle35:setTop(225);
    obj.rectangle35:setWidth(40);
    obj.rectangle35:setHeight(40);
    obj.rectangle35:setColor("Red");
    obj.rectangle35:setStrokeColor("black");
    obj.rectangle35:setStrokeSize(4);
    obj.rectangle35:setName("rectangle35");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout14);
    obj.rectangle36:setLeft(005);
    obj.rectangle36:setTop(230);
    obj.rectangle36:setWidth(30);
    obj.rectangle36:setHeight(30);
    obj.rectangle36:setColor("Black");
    obj.rectangle36:setStrokeColor("black");
    obj.rectangle36:setStrokeSize(4);
    obj.rectangle36:setName("rectangle36");

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.layout14);
    obj.image28:setLeft(005);
    obj.image28:setTop(225);
    obj.image28:setWidth(30);
    obj.image28:setHeight(30);
    obj.image28:setField("basBADGE114");
    obj.image28:setEditable(true);
    obj.image28:setStyle("proportional");
    obj.image28:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image28:setName("image28");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout14);
    obj.rectangle37:setLeft(000);
    obj.rectangle37:setTop(270);
    obj.rectangle37:setWidth(40);
    obj.rectangle37:setHeight(40);
    obj.rectangle37:setColor("Red");
    obj.rectangle37:setStrokeColor("black");
    obj.rectangle37:setStrokeSize(4);
    obj.rectangle37:setName("rectangle37");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout14);
    obj.rectangle38:setLeft(005);
    obj.rectangle38:setTop(275);
    obj.rectangle38:setWidth(30);
    obj.rectangle38:setHeight(30);
    obj.rectangle38:setColor("Black");
    obj.rectangle38:setStrokeColor("black");
    obj.rectangle38:setStrokeSize(4);
    obj.rectangle38:setName("rectangle38");

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.layout14);
    obj.image29:setLeft(005);
    obj.image29:setTop(270);
    obj.image29:setWidth(30);
    obj.image29:setHeight(30);
    obj.image29:setField("basBADGE115");
    obj.image29:setEditable(true);
    obj.image29:setStyle("proportional");
    obj.image29:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image29:setName("image29");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout14);
    obj.rectangle39:setLeft(000);
    obj.rectangle39:setTop(315);
    obj.rectangle39:setWidth(40);
    obj.rectangle39:setHeight(40);
    obj.rectangle39:setColor("Red");
    obj.rectangle39:setStrokeColor("black");
    obj.rectangle39:setStrokeSize(4);
    obj.rectangle39:setName("rectangle39");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout14);
    obj.rectangle40:setLeft(005);
    obj.rectangle40:setTop(320);
    obj.rectangle40:setWidth(30);
    obj.rectangle40:setHeight(30);
    obj.rectangle40:setColor("Black");
    obj.rectangle40:setStrokeColor("black");
    obj.rectangle40:setStrokeSize(4);
    obj.rectangle40:setName("rectangle40");

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.layout14);
    obj.image30:setLeft(005);
    obj.image30:setTop(315);
    obj.image30:setWidth(30);
    obj.image30:setHeight(30);
    obj.image30:setField("basBADGE116");
    obj.image30:setEditable(true);
    obj.image30:setStyle("proportional");
    obj.image30:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image30:setName("image30");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.frmGeral);
    obj.dataLink23:setFields({'HP_val', 'basLV', 'HP_val','ATK_val','ATK_edc', 'DEF_edc', 'DEF_val', 'SPATK_edc','SPATK_val','baseHPMAXEXTRA', 'HP_val','SPD_tot','SPD_mod','bas_DES_ESC','bon_DES_ESC','bon_DES_VOO',
						'SPDEF_edc', 'SPDEF_val', 'SPD_edc', 'SPD_val', 'bon_DES_TER', 'bon_DES_NAT', 'bon_DES_SUB', 'pers_bonEVAF', 'pers_bonEVAE', 'pers_bonEVAV', 'bas_DES_VOO','bas_DES_ESCA'});
    obj.dataLink23:setName("dataLink23");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Pokemons");
    obj.tab2:setName("tab2");

    obj.frmPokemon1 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPokemon1:setParent(obj.tab2);
    obj.frmPokemon1:setName("frmPokemon1");
    obj.frmPokemon1:setAlign("client");
    obj.frmPokemon1:setTheme("dark");
    obj.frmPokemon1:setMargins({top=1});

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.frmPokemon1);
    obj.layout15:setLeft(000);
    obj.layout15:setTop(000);
    obj.layout15:setHeight(650);
    obj.layout15:setWidth(1100);
    obj.layout15:setName("layout15");

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.layout15);
    obj.image31:setLeft(000);
    obj.image31:setTop(000);
    obj.image31:setHeight(650);
    obj.image31:setWidth(1100);
    obj.image31:setSRC("/img/Pokeball.jpg");
    obj.image31:setStyle("autoFit");
    obj.image31:setName("image31");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmPokemon1);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox2);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(30);
    obj.layout16:setMargins({bottom=4});
    obj.layout16:setName("layout16");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout16);
    obj.button7:setText("Novo Pokémon");
    obj.button7:setWidth(150);
    obj.button7:setAlign("left");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout16);
    obj.button8:setText("Organizar");
    obj.button8:setWidth(150);
    obj.button8:setAlign("left");
    obj.button8:setName("button8");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.scrollBox2);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmItemDaLista");
    obj.rclListaDosItens:setAlign("client");
    obj.rclListaDosItens:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.scrollBox2);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("right");
    obj.boxDetalhesDoItem:setWidth(900);
    obj.boxDetalhesDoItem:setMargins({left=4, right=8});

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.boxDetalhesDoItem);
    obj.tabControl2:setLeft(20);
    obj.tabControl2:setTop(20);
    obj.tabControl2:setHeight(560);
    obj.tabControl2:setWidth(1000);
    obj.tabControl2:setName("tabControl2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("Geral");
    obj.tab3:setName("tab3");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.tab3);
    obj.rectangle41:setAlign("top");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setXradius(10);
    obj.rectangle41:setYradius(10);
    obj.rectangle41:setHeight(880);
    obj.rectangle41:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle41:setName("rectangle41");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle41);
    obj.layout17:setLeft(005);
    obj.layout17:setTop(10);
    obj.layout17:setWidth(800);
    obj.layout17:setHeight(560);
    obj.layout17:setName("layout17");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout17);
    obj.rectangle42:setLeft(00);
    obj.rectangle42:setTop(00);
    obj.rectangle42:setWidth(30);
    obj.rectangle42:setHeight(30);
    obj.rectangle42:setColor("gray");
    obj.rectangle42:setName("rectangle42");

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.layout17);
    obj.image32:setLeft(00);
    obj.image32:setTop(00);
    obj.image32:setWidth(30);
    obj.image32:setHeight(30);
    obj.image32:setEditable(true);
    obj.image32:setField("campoPokebola");
    obj.image32:setName("image32");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout17);
    obj.dataLink24:setField("campoPokebola");
    obj.dataLink24:setDefaultValue("https://cdn.bulbagarden.net/upload/9/93/Bag_Pok%C3%A9_Ball_Sprite.png");
    obj.dataLink24:setName("dataLink24");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout17);
    obj.rectangle43:setLeft(35);
    obj.rectangle43:setTop(00);
    obj.rectangle43:setWidth(160);
    obj.rectangle43:setHeight(160);
    obj.rectangle43:setColor("gray");
    obj.rectangle43:setName("rectangle43");

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.layout17);
    obj.image33:setLeft(35);
    obj.image33:setTop(00);
    obj.image33:setWidth(160);
    obj.image33:setHeight(160);
    obj.image33:setEditable(true);
    obj.image33:setField("campoPokemon");
    lfm_setPropAsString(obj.image33, "animate",  "true");
    obj.image33:setName("image33");

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.layout17);
    obj.image34:setLeft(000);
    obj.image34:setTop(45);
    obj.image34:setWidth(30);
    obj.image34:setHeight(30);
    obj.image34:setField("basSEX");
    obj.image34:setStyle("proportional");
    obj.image34:setEditable(false);
    obj.image34:setName("image34");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout17);
    obj.button9:setLeft(0);
    obj.button9:setTop(135);
    obj.button9:setWidth(15);
    obj.button9:setHeight(20);
    obj.button9:setText("E");
    obj.button9:setHint("Exportar uma ficha");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout17);
    obj.button10:setLeft(17);
    obj.button10:setTop(135);
    obj.button10:setWidth(15);
    obj.button10:setHeight(20);
    obj.button10:setText("I");
    obj.button10:setHint("Importar uma ficha");
    obj.button10:setName("button10");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout17);
    obj.dataLink25:setField("active");
    obj.dataLink25:setDefaultValue("true");
    obj.dataLink25:setName("dataLink25");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout17);
    obj.imageCheckBox1:setLeft(00);
    obj.imageCheckBox1:setTop(90);
    obj.imageCheckBox1:setHeight(30);
    obj.imageCheckBox1:setWidth(30);
    obj.imageCheckBox1:setField("PokShiny");
    obj.imageCheckBox1:setHint("Padrão ou Shiny");
    obj.imageCheckBox1:setImageChecked("/img/Shiny_ON.png");
    obj.imageCheckBox1:setImageUnchecked("/img/Shiny_OFF.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout17);
    obj.dataLink26:setField("PokShiny");
    obj.dataLink26:setDefaultValue("false");
    obj.dataLink26:setName("dataLink26");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle41);
    obj.layout18:setLeft(210);
    obj.layout18:setTop(10);
    obj.layout18:setWidth(800);
    obj.layout18:setHeight(800);
    obj.layout18:setName("layout18");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout18);
    obj.label62:setLeft(0);
    obj.label62:setTop(00);
    obj.label62:setWidth(80);
    obj.label62:setHeight(20);
    obj.label62:setText("Número:");
    obj.label62:setAutoSize(true);
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");
    obj.label62:setName("label62");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout18);
    obj.edit80:setLeft(75);
    obj.edit80:setTop(00);
    obj.edit80:setWidth(60);
    obj.edit80:setHeight(20);
    obj.edit80:setField("campoNumero");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout18);
    obj.comboBox6:setLeft(140);
    obj.comboBox6:setTop(00);
    obj.comboBox6:setWidth(110);
    obj.comboBox6:setHeight(20);
    obj.comboBox6:setField("campoGenero");
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'Masculino', 'Feminino', 'Agênero'});
    obj.comboBox6:setValues({'1', '2', '3'});
    obj.comboBox6:setName("comboBox6");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout18);
    obj.label63:setLeft(0);
    obj.label63:setTop(25);
    obj.label63:setWidth(80);
    obj.label63:setHeight(20);
    obj.label63:setText("Espécie:");
    obj.label63:setAutoSize(true);
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");
    obj.label63:setName("label63");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout18);
    obj.edit81:setLeft(75);
    obj.edit81:setTop(25);
    obj.edit81:setWidth(175);
    obj.edit81:setHeight(20);
    obj.edit81:setField("campoNome");
    obj.edit81:setName("edit81");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout18);
    obj.label64:setLeft(0);
    obj.label64:setTop(50);
    obj.label64:setWidth(80);
    obj.label64:setHeight(20);
    obj.label64:setText("Apelido:");
    obj.label64:setAutoSize(true);
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");
    obj.label64:setName("label64");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout18);
    obj.edit82:setLeft(75);
    obj.edit82:setTop(50);
    obj.edit82:setWidth(175);
    obj.edit82:setHeight(20);
    obj.edit82:setField("campoApelido");
    obj.edit82:setName("edit82");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout18);
    obj.label65:setLeft(0);
    obj.label65:setTop(75);
    obj.label65:setWidth(80);
    obj.label65:setHeight(20);
    obj.label65:setText("Tipo(s):");
    obj.label65:setAutoSize(true);
    lfm_setPropAsString(obj.label65, "fontStyle",  "bold");
    obj.label65:setName("label65");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout18);
    obj.comboBox7:setLeft(75);
    obj.comboBox7:setTop(75);
    obj.comboBox7:setWidth(85);
    obj.comboBox7:setHeight(20);
    obj.comboBox7:setField("campoElem1");
    obj.comboBox7:setHorzTextAlign("leading");
    obj.comboBox7:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox7:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox7:setName("comboBox7");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout18);
    obj.comboBox8:setLeft(165);
    obj.comboBox8:setTop(75);
    obj.comboBox8:setWidth(85);
    obj.comboBox8:setHeight(20);
    obj.comboBox8:setField("campoElem2");
    obj.comboBox8:setHorzTextAlign("leading");
    obj.comboBox8:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox8:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox8:setName("comboBox8");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout18);
    obj.dataLink27:setField("campoElem1");
    obj.dataLink27:setDefaultValue("19");
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout18);
    obj.dataLink28:setField("campoElem1");
    obj.dataLink28:setDefaultValue("19");
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout18);
    obj.dataLink29:setFields({'campoElem1', 'campoElem2'});
    obj.dataLink29:setName("dataLink29");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout18);
    obj.label66:setLeft(0);
    obj.label66:setTop(100);
    obj.label66:setWidth(80);
    obj.label66:setHeight(20);
    obj.label66:setText("Natureza:");
    obj.label66:setAutoSize(true);
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");
    obj.label66:setName("label66");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout18);
    obj.edit83:setLeft(75);
    obj.edit83:setTop(100);
    obj.edit83:setWidth(175);
    obj.edit83:setHeight(20);
    obj.edit83:setField("campoNatureza");
    obj.edit83:setName("edit83");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout18);
    obj.label67:setLeft(95);
    obj.label67:setTop(125);
    obj.label67:setWidth(68);
    obj.label67:setHeight(20);
    obj.label67:setText("Aumenta");
    obj.label67:setAutoSize(true);
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout18);
    obj.label68:setLeft(168);
    obj.label68:setTop(125);
    obj.label68:setWidth(68);
    obj.label68:setHeight(20);
    obj.label68:setText("Diminui");
    obj.label68:setAutoSize(true);
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout18);
    obj.comboBox9:setLeft(95);
    obj.comboBox9:setTop(145);
    obj.comboBox9:setWidth(68);
    obj.comboBox9:setHeight(20);
    obj.comboBox9:setField("campoNatPlus");
    obj.comboBox9:setHorzTextAlign("leading");
    obj.comboBox9:setItems({'HP', 'ATK', 'DEF', 'AES', 'DES', 'VEL'});
    obj.comboBox9:setValues({'1', '2', '3', '4','5','6'});
    obj.comboBox9:setName("comboBox9");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout18);
    obj.comboBox10:setLeft(168);
    obj.comboBox10:setTop(145);
    obj.comboBox10:setWidth(68);
    obj.comboBox10:setHeight(20);
    obj.comboBox10:setField("campoNatMinus");
    obj.comboBox10:setHorzTextAlign("leading");
    obj.comboBox10:setItems({'HP', 'ATK', 'DEF', 'AES', 'DES', 'VEL'});
    obj.comboBox10:setValues({'1', '2', '3', '4','5','6'});
    obj.comboBox10:setName("comboBox10");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout18);
    obj.dataLink30:setFields({'campoNatPlus', 'campoNatMinus'});
    obj.dataLink30:setName("dataLink30");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle41);
    obj.layout19:setLeft(500);
    obj.layout19:setTop(20);
    obj.layout19:setWidth(800);
    obj.layout19:setHeight(800);
    obj.layout19:setName("layout19");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout19);
    obj.label69:setLeft(0);
    obj.label69:setTop(00);
    obj.label69:setWidth(100);
    obj.label69:setHeight(20);
    obj.label69:setText("Terrestre:");
    obj.label69:setAutoSize(true);
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setName("label69");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout19);
    obj.edit84:setLeft(105);
    obj.edit84:setTop(00);
    obj.edit84:setWidth(60);
    obj.edit84:setHeight(20);
    obj.edit84:setField("campoTerrestre");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout19);
    obj.label70:setLeft(0);
    obj.label70:setTop(25);
    obj.label70:setWidth(100);
    obj.label70:setHeight(20);
    obj.label70:setText("Natação:");
    obj.label70:setAutoSize(true);
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");
    obj.label70:setName("label70");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout19);
    obj.edit85:setLeft(105);
    obj.edit85:setTop(25);
    obj.edit85:setWidth(60);
    obj.edit85:setHeight(20);
    obj.edit85:setField("campoNatacao");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout19);
    obj.label71:setLeft(0);
    obj.label71:setTop(50);
    obj.label71:setWidth(100);
    obj.label71:setHeight(20);
    obj.label71:setText("Subaquático:");
    obj.label71:setAutoSize(true);
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");
    obj.label71:setName("label71");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout19);
    obj.edit86:setLeft(105);
    obj.edit86:setTop(50);
    obj.edit86:setWidth(60);
    obj.edit86:setHeight(20);
    obj.edit86:setField("campoSubaquatico");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setName("edit86");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout19);
    obj.label72:setLeft(0);
    obj.label72:setTop(75);
    obj.label72:setWidth(100);
    obj.label72:setHeight(20);
    obj.label72:setText("Escavação:");
    obj.label72:setAutoSize(true);
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setName("label72");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout19);
    obj.edit87:setLeft(105);
    obj.edit87:setTop(75);
    obj.edit87:setWidth(60);
    obj.edit87:setHeight(20);
    obj.edit87:setField("campoEscavacao");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setName("edit87");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout19);
    obj.label73:setLeft(0);
    obj.label73:setTop(100);
    obj.label73:setWidth(100);
    obj.label73:setHeight(20);
    obj.label73:setText("Voo:");
    obj.label73:setAutoSize(true);
    lfm_setPropAsString(obj.label73, "fontStyle",  "bold");
    obj.label73:setName("label73");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout19);
    obj.edit88:setLeft(105);
    obj.edit88:setTop(100);
    obj.edit88:setWidth(60);
    obj.edit88:setHeight(20);
    obj.edit88:setField("campoVoo");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout19);
    obj.label74:setLeft(190);
    obj.label74:setTop(00);
    obj.label74:setWidth(100);
    obj.label74:setHeight(20);
    obj.label74:setText("Força:");
    obj.label74:setAutoSize(true);
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");
    obj.label74:setName("label74");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout19);
    obj.edit89:setLeft(270);
    obj.edit89:setTop(00);
    obj.edit89:setWidth(95);
    obj.edit89:setHeight(20);
    obj.edit89:setField("campoForca");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout19);
    obj.label75:setLeft(190);
    obj.label75:setTop(25);
    obj.label75:setWidth(100);
    obj.label75:setHeight(20);
    obj.label75:setText("Inteligência:");
    obj.label75:setAutoSize(true);
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold");
    obj.label75:setName("label75");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout19);
    obj.edit90:setLeft(270);
    obj.edit90:setTop(25);
    obj.edit90:setWidth(95);
    obj.edit90:setHeight(20);
    obj.edit90:setField("campoInteligencia");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout19);
    obj.label76:setLeft(190);
    obj.label76:setTop(50);
    obj.label76:setWidth(100);
    obj.label76:setHeight(20);
    obj.label76:setText("Salto:");
    obj.label76:setAutoSize(true);
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setName("label76");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout19);
    obj.edit91:setLeft(270);
    obj.edit91:setTop(50);
    obj.edit91:setWidth(95);
    obj.edit91:setHeight(20);
    obj.edit91:setField("campoSalto");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setName("edit91");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout19);
    obj.label77:setLeft(190);
    obj.label77:setTop(75);
    obj.label77:setWidth(100);
    obj.label77:setHeight(20);
    obj.label77:setText("Altura:");
    obj.label77:setAutoSize(true);
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");
    obj.label77:setName("label77");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout19);
    obj.edit92:setLeft(270);
    obj.edit92:setTop(75);
    obj.edit92:setWidth(95);
    obj.edit92:setHeight(20);
    obj.edit92:setField("campoAltura");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout19);
    obj.label78:setLeft(190);
    obj.label78:setTop(100);
    obj.label78:setWidth(100);
    obj.label78:setHeight(20);
    obj.label78:setText("Categoria:");
    obj.label78:setAutoSize(true);
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");
    obj.label78:setName("label78");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout19);
    obj.comboBox11:setLeft(270);
    obj.comboBox11:setTop(100);
    obj.comboBox11:setWidth(95);
    obj.comboBox11:setHeight(20);
    obj.comboBox11:setField("catAltura");
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setItems({'Pequeno', 'Médio', 'Grande', 'Enorme', 'Gigante'});
    obj.comboBox11:setValues({'Pequeno', 'Médio', 'Grande', 'Enorme', 'Gigante'});
    obj.comboBox11:setName("comboBox11");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout19);
    obj.label79:setLeft(190);
    obj.label79:setTop(125);
    obj.label79:setWidth(100);
    obj.label79:setHeight(20);
    obj.label79:setText("Peso:");
    obj.label79:setAutoSize(true);
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");
    obj.label79:setName("label79");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout19);
    obj.edit93:setLeft(270);
    obj.edit93:setTop(125);
    obj.edit93:setWidth(95);
    obj.edit93:setHeight(20);
    obj.edit93:setField("campoPeso");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setName("edit93");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout19);
    obj.label80:setLeft(190);
    obj.label80:setTop(150);
    obj.label80:setWidth(100);
    obj.label80:setHeight(20);
    obj.label80:setText("Categoria:");
    obj.label80:setAutoSize(true);
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setName("label80");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout19);
    obj.comboBox12:setLeft(270);
    obj.comboBox12:setTop(150);
    obj.comboBox12:setWidth(95);
    obj.comboBox12:setHeight(20);
    obj.comboBox12:setField("catPeso");
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setItems({'Muito Leve', 'Leve', 'Médio', 'Pesado', 'Muito Pesado', 'Ext. Pesado'});
    obj.comboBox12:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox12:setName("comboBox12");

    obj.popExemplo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popExemplo:setParent(obj.rectangle41);
    obj.popExemplo:setName("popExemplo");
    obj.popExemplo:setWidth(300);
    obj.popExemplo:setHeight(200);
    obj.popExemplo:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popExemplo, "autoScopeNode",  "false");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.popExemplo);
    obj.label81:setLeft(0);
    obj.label81:setTop(5);
    obj.label81:setWidth(60);
    obj.label81:setHeight(20);
    obj.label81:setText("Efeito:");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popExemplo);
    obj.textEditor1:setLeft(005);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setHeight(165);
    obj.textEditor1:setWidth(290);
    obj.textEditor1:setField("Descricao1");
    obj.textEditor1:setName("textEditor1");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle41);
    obj.layout20:setLeft(50);
    obj.layout20:setTop(200);
    obj.layout20:setHeight(500);
    obj.layout20:setWidth(300);
    obj.layout20:setName("layout20");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout20);
    obj.label82:setLeft(000);
    obj.label82:setTop(00);
    obj.label82:setHeight(20);
    obj.label82:setWidth(100);
    obj.label82:setText("Item");
    obj.label82:setAutoSize(true);
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");
    obj.label82:setName("label82");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout20);
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setLeft(105);
    obj.edit94:setTop(00);
    obj.edit94:setWidth(130);
    obj.edit94:setHeight(20);
    obj.edit94:setField("nomeItem1");
    obj.edit94:setName("edit94");

    obj.BotaoItemA = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoItemA:setParent(obj.layout20);
    obj.BotaoItemA:setLeft(240);
    obj.BotaoItemA:setTop(00);
    obj.BotaoItemA:setWidth(23);
    obj.BotaoItemA:setHeight(20);
    obj.BotaoItemA:setText("i");
    obj.BotaoItemA:setName("BotaoItemA");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout20);
    obj.label83:setLeft(0);
    obj.label83:setTop(25);
    obj.label83:setWidth(100);
    obj.label83:setHeight(20);
    obj.label83:setText("Dieta:");
    obj.label83:setAutoSize(true);
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setName("label83");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout20);
    obj.edit95:setLeft(105);
    obj.edit95:setTop(25);
    obj.edit95:setWidth(130);
    obj.edit95:setHeight(20);
    obj.edit95:setField("campoDieta");
    obj.edit95:setName("edit95");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout20);
    obj.label84:setLeft(000);
    obj.label84:setTop(50);
    obj.label84:setHeight(20);
    obj.label84:setWidth(100);
    obj.label84:setText("Gosta de:");
    obj.label84:setAutoSize(true);
    lfm_setPropAsString(obj.label84, "fontStyle",  "bold");
    obj.label84:setName("label84");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout20);
    obj.edit96:setLeft(105);
    obj.edit96:setTop(50);
    obj.edit96:setHeight(20);
    obj.edit96:setWidth(130);
    obj.edit96:setField("Sabor_Fav");
    obj.edit96:setHorzTextAlign("leading");
    obj.edit96:setEnabled(false);
    obj.edit96:setName("edit96");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout20);
    obj.label85:setLeft(000);
    obj.label85:setTop(75);
    obj.label85:setHeight(20);
    obj.label85:setWidth(100);
    obj.label85:setText("Não gosta de:");
    obj.label85:setAutoSize(true);
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");
    obj.label85:setName("label85");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout20);
    obj.edit97:setLeft(105);
    obj.edit97:setTop(75);
    obj.edit97:setHeight(20);
    obj.edit97:setWidth(130);
    obj.edit97:setField("Sabor_Desg");
    obj.edit97:setHorzTextAlign("leading");
    obj.edit97:setEnabled(false);
    obj.edit97:setName("edit97");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle41);
    obj.layout21:setLeft(360);
    obj.layout21:setTop(195);
    obj.layout21:setWidth(900);
    obj.layout21:setHeight(800);
    obj.layout21:setName("layout21");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout21);
    obj.label86:setLeft(0);
    obj.label86:setTop(00);
    obj.label86:setWidth(100);
    obj.label86:setHeight(20);
    obj.label86:setText("Nível:");
    obj.label86:setAutoSize(true);
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setName("label86");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout21);
    obj.edit98:setLeft(100);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(45);
    obj.edit98:setHeight(20);
    obj.edit98:setField("pokeLevel");
    obj.edit98:setType("number");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout21);
    obj.label87:setLeft(0);
    obj.label87:setTop(25);
    obj.label87:setWidth(100);
    obj.label87:setHeight(20);
    obj.label87:setText("Experiência:");
    obj.label87:setAutoSize(true);
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");
    obj.label87:setName("label87");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout21);
    obj.edit99:setLeft(100);
    obj.edit99:setTop(25);
    obj.edit99:setWidth(45);
    obj.edit99:setHeight(20);
    obj.edit99:setField("campoExpAt");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setName("edit99");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout21);
    obj.label88:setLeft(147);
    obj.label88:setTop(25);
    obj.label88:setHeight(20);
    obj.label88:setWidth(8);
    obj.label88:setText("/");
    obj.label88:setAutoSize(true);
    obj.label88:setName("label88");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout21);
    obj.edit100:setLeft(155);
    obj.edit100:setTop(25);
    obj.edit100:setHeight(20);
    obj.edit100:setWidth(45);
    obj.edit100:setField("nextLVEXP");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setEnabled(false);
    obj.edit100:setName("edit100");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout21);
    obj.label89:setLeft(0);
    obj.label89:setTop(50);
    obj.label89:setWidth(100);
    obj.label89:setHeight(20);
    obj.label89:setText("Lealdade:");
    obj.label89:setAutoSize(true);
    lfm_setPropAsString(obj.label89, "fontStyle",  "bold");
    obj.label89:setName("label89");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout21);
    obj.edit101:setLeft(100);
    obj.edit101:setTop(50);
    obj.edit101:setWidth(45);
    obj.edit101:setHeight(20);
    obj.edit101:setField("campoLealdade");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setName("edit101");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout21);
    obj.label90:setLeft(0);
    obj.label90:setTop(75);
    obj.label90:setWidth(100);
    obj.label90:setHeight(20);
    obj.label90:setText("Vida");
    obj.label90:setAutoSize(true);
    lfm_setPropAsString(obj.label90, "fontStyle",  "bold");
    obj.label90:setName("label90");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout21);
    obj.edit102:setLeft(100);
    obj.edit102:setTop(75);
    obj.edit102:setHeight(20);
    obj.edit102:setWidth(45);
    obj.edit102:setField("baseHPAtual");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setType("number");
    obj.edit102:setName("edit102");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout21);
    obj.label91:setLeft(147);
    obj.label91:setTop(75);
    obj.label91:setHeight(20);
    obj.label91:setWidth(8);
    obj.label91:setText("/");
    obj.label91:setAutoSize(true);
    obj.label91:setName("label91");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout21);
    obj.edit103:setLeft(155);
    obj.edit103:setTop(75);
    obj.edit103:setHeight(20);
    obj.edit103:setWidth(45);
    obj.edit103:setField("baseHPMAX");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setEnabled(false);
    obj.edit103:setName("edit103");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout21);
    obj.label92:setLeft(0);
    obj.label92:setTop(100);
    obj.label92:setWidth(100);
    obj.label92:setHeight(20);
    obj.label92:setText("Amizade:");
    obj.label92:setAutoSize(true);
    lfm_setPropAsString(obj.label92, "fontStyle",  "bold");
    obj.label92:setName("label92");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout21);
    obj.edit104:setLeft(100);
    obj.edit104:setTop(100);
    obj.edit104:setHeight(20);
    obj.edit104:setWidth(45);
    obj.edit104:setField("campoAmizade1");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setName("edit104");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout21);
    obj.edit105:setLeft(155);
    obj.edit105:setTop(100);
    obj.edit105:setHeight(20);
    obj.edit105:setWidth(90);
    obj.edit105:setField("campoAmizade2");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setName("edit105");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle41);
    obj.layout22:setLeft(640);
    obj.layout22:setTop(220);
    obj.layout22:setHeight(320);
    obj.layout22:setWidth(420);
    obj.layout22:setName("layout22");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout22);
    obj.label93:setLeft(00);
    obj.label93:setTop(000);
    obj.label93:setHeight(20);
    obj.label93:setWidth(80);
    obj.label93:setText("Evasão");
    obj.label93:setAutoSize(true);
    lfm_setPropAsString(obj.label93, "fontStyle",  "bold");
    obj.label93:setName("label93");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout22);
    obj.label94:setLeft(75);
    obj.label94:setTop(000);
    obj.label94:setHeight(20);
    obj.label94:setWidth(30);
    obj.label94:setText("Tot.");
    obj.label94:setAutoSize(true);
    obj.label94:setName("label94");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout22);
    obj.label95:setLeft(110);
    obj.label95:setTop(000);
    obj.label95:setHeight(20);
    obj.label95:setWidth(30);
    obj.label95:setText("Bôn.");
    obj.label95:setAutoSize(true);
    obj.label95:setName("label95");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout22);
    obj.label96:setLeft(000);
    obj.label96:setTop(025);
    obj.label96:setHeight(20);
    obj.label96:setWidth(80);
    obj.label96:setText("Física");
    obj.label96:setAutoSize(true);
    lfm_setPropAsString(obj.label96, "fontStyle",  "bold");
    obj.label96:setName("label96");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout22);
    obj.edit106:setLeft(75);
    obj.edit106:setTop(025);
    obj.edit106:setHeight(20);
    obj.edit106:setWidth(30);
    obj.edit106:setField("campoEFIS");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setType("number");
    obj.edit106:setEnabled(false);
    obj.edit106:setName("edit106");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout22);
    obj.edit107:setLeft(110);
    obj.edit107:setTop(025);
    obj.edit107:setHeight(20);
    obj.edit107:setWidth(30);
    obj.edit107:setField("pok_bonEVAF");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setType("number");
    obj.edit107:setName("edit107");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout22);
    obj.label97:setLeft(000);
    obj.label97:setTop(050);
    obj.label97:setHeight(20);
    obj.label97:setWidth(80);
    obj.label97:setText("Especial");
    obj.label97:setAutoSize(true);
    lfm_setPropAsString(obj.label97, "fontStyle",  "bold");
    obj.label97:setName("label97");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout22);
    obj.edit108:setLeft(75);
    obj.edit108:setTop(050);
    obj.edit108:setHeight(20);
    obj.edit108:setWidth(30);
    obj.edit108:setField("campoEESP");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setType("number");
    obj.edit108:setEnabled(false);
    obj.edit108:setName("edit108");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout22);
    obj.edit109:setLeft(110);
    obj.edit109:setTop(050);
    obj.edit109:setHeight(20);
    obj.edit109:setWidth(30);
    obj.edit109:setField("pok_bonEVAE");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setType("number");
    obj.edit109:setName("edit109");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout22);
    obj.label98:setLeft(000);
    obj.label98:setTop(075);
    obj.label98:setHeight(20);
    obj.label98:setWidth(80);
    obj.label98:setText("Veloz");
    obj.label98:setAutoSize(true);
    lfm_setPropAsString(obj.label98, "fontStyle",  "bold");
    obj.label98:setName("label98");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout22);
    obj.edit110:setLeft(75);
    obj.edit110:setTop(075);
    obj.edit110:setHeight(20);
    obj.edit110:setWidth(30);
    obj.edit110:setField("campoEVEL");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setType("number");
    obj.edit110:setEnabled(false);
    obj.edit110:setName("edit110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout22);
    obj.edit111:setLeft(110);
    obj.edit111:setTop(075);
    obj.edit111:setHeight(20);
    obj.edit111:setWidth(30);
    obj.edit111:setField("Pok_bonEVAV");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setType("number");
    obj.edit111:setName("edit111");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle41);
    obj.layout23:setLeft(800);
    obj.layout23:setTop(210);
    obj.layout23:setHeight(320);
    obj.layout23:setWidth(420);
    obj.layout23:setName("layout23");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout23);
    obj.imageCheckBox2:setLeft(00);
    obj.imageCheckBox2:setTop(0);
    obj.imageCheckBox2:setHeight(30);
    obj.imageCheckBox2:setWidth(30);
    obj.imageCheckBox2:setField("SlotActive1");
    obj.imageCheckBox2:setHint("Aba 1, Slot 1");
    obj.imageCheckBox2:setImageChecked("/img/Poke1T.png");
    obj.imageCheckBox2:setImageUnchecked("/img/Poke1F.png");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout23);
    obj.dataLink31:setField("SlotActive1");
    obj.dataLink31:setDefaultValue("false");
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout23);
    obj.dataLink32:setField("SlotActive2");
    obj.dataLink32:setDefaultValue("false");
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout23);
    obj.dataLink33:setField("SlotActive3");
    obj.dataLink33:setDefaultValue("false");
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout23);
    obj.dataLink34:setField("SlotActive4");
    obj.dataLink34:setDefaultValue("false");
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout23);
    obj.dataLink35:setField("SlotActive5");
    obj.dataLink35:setDefaultValue("false");
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout23);
    obj.dataLink36:setField("SlotActive6");
    obj.dataLink36:setDefaultValue("false");
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout23);
    obj.dataLink37:setField("SlotActive7");
    obj.dataLink37:setDefaultValue("true");
    obj.dataLink37:setName("dataLink37");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout23);
    obj.imageCheckBox3:setLeft(00);
    obj.imageCheckBox3:setTop(35);
    obj.imageCheckBox3:setHeight(30);
    obj.imageCheckBox3:setWidth(30);
    obj.imageCheckBox3:setField("SlotActive2");
    obj.imageCheckBox3:setHint("Aba 1, Slot 2");
    obj.imageCheckBox3:setImageChecked("/img/Poke2T.png");
    obj.imageCheckBox3:setImageUnchecked("/img/Poke2F.png");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout23);
    obj.dataLink38:setField("SlotActive1");
    obj.dataLink38:setDefaultValue("false");
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout23);
    obj.dataLink39:setField("SlotActive2");
    obj.dataLink39:setDefaultValue("false");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout23);
    obj.dataLink40:setField("SlotActive3");
    obj.dataLink40:setDefaultValue("false");
    obj.dataLink40:setName("dataLink40");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout23);
    obj.dataLink41:setField("SlotActive4");
    obj.dataLink41:setDefaultValue("false");
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout23);
    obj.dataLink42:setField("SlotActive5");
    obj.dataLink42:setDefaultValue("false");
    obj.dataLink42:setName("dataLink42");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout23);
    obj.dataLink43:setField("SlotActive6");
    obj.dataLink43:setDefaultValue("false");
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout23);
    obj.dataLink44:setField("SlotActive7");
    obj.dataLink44:setDefaultValue("true");
    obj.dataLink44:setName("dataLink44");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout23);
    obj.imageCheckBox4:setLeft(00);
    obj.imageCheckBox4:setTop(70);
    obj.imageCheckBox4:setHeight(30);
    obj.imageCheckBox4:setWidth(30);
    obj.imageCheckBox4:setField("SlotActive3");
    obj.imageCheckBox4:setHint("Aba 1, Slot 3");
    obj.imageCheckBox4:setImageChecked("/img/Poke3T.png");
    obj.imageCheckBox4:setImageUnchecked("/img/Poke3F.png");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout23);
    obj.dataLink45:setField("SlotActive1");
    obj.dataLink45:setDefaultValue("false");
    obj.dataLink45:setName("dataLink45");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout23);
    obj.dataLink46:setField("SlotActive2");
    obj.dataLink46:setDefaultValue("false");
    obj.dataLink46:setName("dataLink46");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout23);
    obj.dataLink47:setField("SlotActive3");
    obj.dataLink47:setDefaultValue("false");
    obj.dataLink47:setName("dataLink47");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout23);
    obj.dataLink48:setField("SlotActive4");
    obj.dataLink48:setDefaultValue("false");
    obj.dataLink48:setName("dataLink48");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout23);
    obj.dataLink49:setField("SlotActive5");
    obj.dataLink49:setDefaultValue("false");
    obj.dataLink49:setName("dataLink49");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout23);
    obj.dataLink50:setField("SlotActive6");
    obj.dataLink50:setDefaultValue("false");
    obj.dataLink50:setName("dataLink50");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout23);
    obj.dataLink51:setField("SlotActive7");
    obj.dataLink51:setDefaultValue("true");
    obj.dataLink51:setName("dataLink51");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout23);
    obj.imageCheckBox5:setLeft(40);
    obj.imageCheckBox5:setTop(0);
    obj.imageCheckBox5:setHeight(30);
    obj.imageCheckBox5:setWidth(30);
    obj.imageCheckBox5:setField("SlotActive4");
    obj.imageCheckBox5:setHint("Aba 1, Slot 4");
    obj.imageCheckBox5:setImageChecked("/img/Poke4T.png");
    obj.imageCheckBox5:setImageUnchecked("/img/Poke4F.png");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout23);
    obj.dataLink52:setField("SlotActive1");
    obj.dataLink52:setDefaultValue("false");
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout23);
    obj.dataLink53:setField("SlotActive2");
    obj.dataLink53:setDefaultValue("false");
    obj.dataLink53:setName("dataLink53");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout23);
    obj.dataLink54:setField("SlotActive3");
    obj.dataLink54:setDefaultValue("false");
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout23);
    obj.dataLink55:setField("SlotActive4");
    obj.dataLink55:setDefaultValue("false");
    obj.dataLink55:setName("dataLink55");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout23);
    obj.dataLink56:setField("SlotActive5");
    obj.dataLink56:setDefaultValue("false");
    obj.dataLink56:setName("dataLink56");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout23);
    obj.dataLink57:setField("SlotActive6");
    obj.dataLink57:setDefaultValue("false");
    obj.dataLink57:setName("dataLink57");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout23);
    obj.dataLink58:setField("SlotActive7");
    obj.dataLink58:setDefaultValue("true");
    obj.dataLink58:setName("dataLink58");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout23);
    obj.imageCheckBox6:setLeft(40);
    obj.imageCheckBox6:setTop(35);
    obj.imageCheckBox6:setHeight(30);
    obj.imageCheckBox6:setWidth(30);
    obj.imageCheckBox6:setField("SlotActive5");
    obj.imageCheckBox6:setHint("Aba 1, Slot 5");
    obj.imageCheckBox6:setImageChecked("/img/Poke5T.png");
    obj.imageCheckBox6:setImageUnchecked("/img/Poke5F.png");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout23);
    obj.dataLink59:setField("SlotActive1");
    obj.dataLink59:setDefaultValue("false");
    obj.dataLink59:setName("dataLink59");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout23);
    obj.dataLink60:setField("SlotActive2");
    obj.dataLink60:setDefaultValue("false");
    obj.dataLink60:setName("dataLink60");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout23);
    obj.dataLink61:setField("SlotActive3");
    obj.dataLink61:setDefaultValue("false");
    obj.dataLink61:setName("dataLink61");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout23);
    obj.dataLink62:setField("SlotActive4");
    obj.dataLink62:setDefaultValue("false");
    obj.dataLink62:setName("dataLink62");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout23);
    obj.dataLink63:setField("SlotActive5");
    obj.dataLink63:setDefaultValue("false");
    obj.dataLink63:setName("dataLink63");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout23);
    obj.dataLink64:setField("SlotActive6");
    obj.dataLink64:setDefaultValue("false");
    obj.dataLink64:setName("dataLink64");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout23);
    obj.dataLink65:setField("SlotActive7");
    obj.dataLink65:setDefaultValue("true");
    obj.dataLink65:setName("dataLink65");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout23);
    obj.imageCheckBox7:setLeft(40);
    obj.imageCheckBox7:setTop(70);
    obj.imageCheckBox7:setHeight(30);
    obj.imageCheckBox7:setWidth(30);
    obj.imageCheckBox7:setField("SlotActive6");
    obj.imageCheckBox7:setHint("Aba 1, Slot 6");
    obj.imageCheckBox7:setImageChecked("/img/Poke6T.png");
    obj.imageCheckBox7:setImageUnchecked("/img/Poke6F.png");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout23);
    obj.dataLink66:setField("SlotActive1");
    obj.dataLink66:setDefaultValue("false");
    obj.dataLink66:setName("dataLink66");

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.layout23);
    obj.dataLink67:setField("SlotActive2");
    obj.dataLink67:setDefaultValue("false");
    obj.dataLink67:setName("dataLink67");

    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.layout23);
    obj.dataLink68:setField("SlotActive3");
    obj.dataLink68:setDefaultValue("false");
    obj.dataLink68:setName("dataLink68");

    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout23);
    obj.dataLink69:setField("SlotActive4");
    obj.dataLink69:setDefaultValue("false");
    obj.dataLink69:setName("dataLink69");

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.layout23);
    obj.dataLink70:setField("SlotActive5");
    obj.dataLink70:setDefaultValue("false");
    obj.dataLink70:setName("dataLink70");

    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.layout23);
    obj.dataLink71:setField("SlotActive6");
    obj.dataLink71:setDefaultValue("false");
    obj.dataLink71:setName("dataLink71");

    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.layout23);
    obj.dataLink72:setField("SlotActive7");
    obj.dataLink72:setDefaultValue("true");
    obj.dataLink72:setName("dataLink72");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout23);
    obj.imageCheckBox8:setLeft(20);
    obj.imageCheckBox8:setTop(105);
    obj.imageCheckBox8:setHeight(30);
    obj.imageCheckBox8:setWidth(30);
    obj.imageCheckBox8:setField("SlotActive7");
    obj.imageCheckBox8:setHint("Na Reserva");
    obj.imageCheckBox8:setImageChecked("/img/Computer_ON.png");
    obj.imageCheckBox8:setImageUnchecked("/img/Computer_OFF.png");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.layout23);
    obj.dataLink73:setField("SlotActive1");
    obj.dataLink73:setDefaultValue("false");
    obj.dataLink73:setName("dataLink73");

    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.layout23);
    obj.dataLink74:setField("SlotActive2");
    obj.dataLink74:setDefaultValue("false");
    obj.dataLink74:setName("dataLink74");

    obj.dataLink75 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.layout23);
    obj.dataLink75:setField("SlotActive3");
    obj.dataLink75:setDefaultValue("false");
    obj.dataLink75:setName("dataLink75");

    obj.dataLink76 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.layout23);
    obj.dataLink76:setField("SlotActive4");
    obj.dataLink76:setDefaultValue("false");
    obj.dataLink76:setName("dataLink76");

    obj.dataLink77 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.layout23);
    obj.dataLink77:setField("SlotActive5");
    obj.dataLink77:setDefaultValue("false");
    obj.dataLink77:setName("dataLink77");

    obj.dataLink78 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.layout23);
    obj.dataLink78:setField("SlotActive6");
    obj.dataLink78:setDefaultValue("false");
    obj.dataLink78:setName("dataLink78");

    obj.dataLink79 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.layout23);
    obj.dataLink79:setField("SlotActive7");
    obj.dataLink79:setDefaultValue("true");
    obj.dataLink79:setName("dataLink79");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle41);
    obj.layout24:setLeft(10);
    obj.layout24:setTop(340);
    obj.layout24:setHeight(600);
    obj.layout24:setWidth(800);
    obj.layout24:setName("layout24");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout24);
    obj.label99:setLeft(000);
    obj.label99:setTop(000);
    obj.label99:setHeight(20);
    obj.label99:setWidth(30);
    obj.label99:setText("R.B.");
    obj.label99:setAutoSize(true);
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout24);
    obj.label100:setLeft(035);
    obj.label100:setTop(000);
    obj.label100:setHeight(20);
    obj.label100:setWidth(100);
    obj.label100:setText("Atributo");
    obj.label100:setAutoSize(true);
    obj.label100:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label100, "fontStyle",  "bold");
    obj.label100:setName("label100");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout24);
    obj.label101:setLeft(140);
    obj.label101:setTop(000);
    obj.label101:setHeight(20);
    obj.label101:setWidth(50);
    obj.label101:setText("Total");
    obj.label101:setAutoSize(true);
    obj.label101:setName("label101");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout24);
    obj.label102:setLeft(185);
    obj.label102:setTop(000);
    obj.label102:setHeight(20);
    obj.label102:setWidth(50);
    obj.label102:setText("Base");
    obj.label102:setAutoSize(true);
    obj.label102:setName("label102");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout24);
    obj.label103:setLeft(230);
    obj.label103:setTop(000);
    obj.label103:setHeight(20);
    obj.label103:setWidth(50);
    obj.label103:setText("Nível");
    obj.label103:setAutoSize(true);
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout24);
    obj.label104:setLeft(275);
    obj.label104:setTop(000);
    obj.label104:setHeight(20);
    obj.label104:setWidth(50);
    obj.label104:setText("Bôn");
    obj.label104:setAutoSize(true);
    obj.label104:setName("label104");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout24);
    obj.label105:setLeft(320);
    obj.label105:setTop(000);
    obj.label105:setHeight(20);
    obj.label105:setWidth(50);
    obj.label105:setText("Vit.");
    obj.label105:setAutoSize(true);
    obj.label105:setName("label105");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout24);
    obj.imageCheckBox9:setLeft(370);
    obj.imageCheckBox9:setTop(000);
    obj.imageCheckBox9:setHeight(40);
    obj.imageCheckBox9:setWidth(20);
    obj.imageCheckBox9:setField("MegaEvo");
    obj.imageCheckBox9:setHint("Normal ou Mega");
    obj.imageCheckBox9:setImageChecked("/img/Mega_ON.png");
    obj.imageCheckBox9:setImageUnchecked("/img/Mega_OFF.png");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout24);
    obj.edit112:setLeft(000);
    obj.edit112:setTop(025);
    obj.edit112:setHeight(20);
    obj.edit112:setWidth(30);
    obj.edit112:setField("Vida_Pri");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setType("number");
    obj.edit112:setName("edit112");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout24);
    obj.label106:setLeft(035);
    obj.label106:setTop(025);
    obj.label106:setHeight(20);
    obj.label106:setWidth(100);
    obj.label106:setText("HP");
    obj.label106:setAutoSize(true);
    lfm_setPropAsString(obj.label106, "fontStyle",  "bold");
    obj.label106:setName("label106");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout24);
    obj.edit113:setLeft(140);
    obj.edit113:setTop(025);
    obj.edit113:setHeight(20);
    obj.edit113:setWidth(30);
    obj.edit113:setField("Vida_Form1");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setType("number");
    obj.edit113:setEnabled(false);
    obj.edit113:setName("edit113");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout24);
    obj.edit114:setLeft(185);
    obj.edit114:setTop(025);
    obj.edit114:setHeight(20);
    obj.edit114:setWidth(30);
    obj.edit114:setField("Vida_Base1");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setType("number");
    obj.edit114:setName("edit114");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout24);
    obj.edit115:setLeft(230);
    obj.edit115:setTop(025);
    obj.edit115:setHeight(20);
    obj.edit115:setWidth(30);
    obj.edit115:setField("Vida_Nivel");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setType("number");
    obj.edit115:setName("edit115");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout24);
    obj.edit116:setLeft(275);
    obj.edit116:setTop(025);
    obj.edit116:setHeight(20);
    obj.edit116:setWidth(30);
    obj.edit116:setField("Vida_Bon1");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setType("number");
    obj.edit116:setName("edit116");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout24);
    obj.edit117:setLeft(320);
    obj.edit117:setTop(025);
    obj.edit117:setHeight(20);
    obj.edit117:setWidth(30);
    obj.edit117:setField("Vida_Vit");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setType("number");
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout24);
    obj.edit118:setLeft(000);
    obj.edit118:setTop(050);
    obj.edit118:setHeight(20);
    obj.edit118:setWidth(30);
    obj.edit118:setField("Ataque_Pri");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setType("number");
    obj.edit118:setName("edit118");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout24);
    obj.label107:setLeft(035);
    obj.label107:setTop(050);
    obj.label107:setHeight(20);
    obj.label107:setWidth(100);
    obj.label107:setText("Ataque");
    obj.label107:setAutoSize(true);
    lfm_setPropAsString(obj.label107, "fontStyle",  "bold");
    obj.label107:setName("label107");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout24);
    obj.edit119:setLeft(140);
    obj.edit119:setTop(050);
    obj.edit119:setHeight(20);
    obj.edit119:setWidth(30);
    obj.edit119:setField("Ataque_Form1");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setType("number");
    obj.edit119:setEnabled(false);
    obj.edit119:setName("edit119");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout24);
    obj.edit120:setLeft(185);
    obj.edit120:setTop(050);
    obj.edit120:setHeight(20);
    obj.edit120:setWidth(30);
    obj.edit120:setField("Ataque_Base1");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setType("number");
    obj.edit120:setName("edit120");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout24);
    obj.edit121:setLeft(230);
    obj.edit121:setTop(050);
    obj.edit121:setHeight(20);
    obj.edit121:setWidth(30);
    obj.edit121:setField("Ataque_Nivel");
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setType("number");
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout24);
    obj.edit122:setLeft(275);
    obj.edit122:setTop(050);
    obj.edit122:setHeight(20);
    obj.edit122:setWidth(30);
    obj.edit122:setField("Ataque_Bon1");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setType("number");
    obj.edit122:setName("edit122");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout24);
    obj.edit123:setLeft(320);
    obj.edit123:setTop(050);
    obj.edit123:setHeight(20);
    obj.edit123:setWidth(30);
    obj.edit123:setField("Ataque_Vit");
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setType("number");
    obj.edit123:setName("edit123");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout24);
    obj.edit124:setLeft(365);
    obj.edit124:setTop(050);
    obj.edit124:setHeight(20);
    obj.edit124:setWidth(30);
    obj.edit124:setField("Ataque_Bon2");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setType("number");
    obj.edit124:setName("edit124");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout24);
    obj.comboBox13:setLeft(400);
    obj.comboBox13:setTop(050);
    obj.comboBox13:setHeight(20);
    obj.comboBox13:setWidth(45);
    obj.comboBox13:setField("Ataque_edc");
    obj.comboBox13:setHorzTextAlign("center");
    obj.comboBox13:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox13:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox13:setName("comboBox13");

    obj.dataLink80 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink80:setParent(obj.layout24);
    obj.dataLink80:setField("Ataque_edc");
    obj.dataLink80:setDefaultValue("7");
    obj.dataLink80:setName("dataLink80");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout24);
    obj.edit125:setLeft(000);
    obj.edit125:setTop(075);
    obj.edit125:setHeight(20);
    obj.edit125:setWidth(30);
    obj.edit125:setField("Defesa_Pri");
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setType("number");
    obj.edit125:setName("edit125");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout24);
    obj.label108:setLeft(035);
    obj.label108:setTop(075);
    obj.label108:setHeight(20);
    obj.label108:setWidth(100);
    obj.label108:setText("Defesa");
    obj.label108:setAutoSize(true);
    lfm_setPropAsString(obj.label108, "fontStyle",  "bold");
    obj.label108:setName("label108");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout24);
    obj.edit126:setLeft(140);
    obj.edit126:setTop(075);
    obj.edit126:setHeight(20);
    obj.edit126:setWidth(30);
    obj.edit126:setField("Defesa_Form1");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setType("number");
    obj.edit126:setEnabled(false);
    obj.edit126:setName("edit126");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout24);
    obj.edit127:setLeft(185);
    obj.edit127:setTop(075);
    obj.edit127:setHeight(20);
    obj.edit127:setWidth(30);
    obj.edit127:setField("Defesa_Base1");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setType("number");
    obj.edit127:setName("edit127");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout24);
    obj.edit128:setLeft(230);
    obj.edit128:setTop(075);
    obj.edit128:setHeight(20);
    obj.edit128:setWidth(30);
    obj.edit128:setField("Defesa_Nivel");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setType("number");
    obj.edit128:setName("edit128");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout24);
    obj.edit129:setLeft(275);
    obj.edit129:setTop(075);
    obj.edit129:setHeight(20);
    obj.edit129:setWidth(30);
    obj.edit129:setField("Defesa_Bon1");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setType("number");
    obj.edit129:setName("edit129");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout24);
    obj.edit130:setLeft(320);
    obj.edit130:setTop(075);
    obj.edit130:setHeight(20);
    obj.edit130:setWidth(30);
    obj.edit130:setField("Defesa_Vit");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setType("number");
    obj.edit130:setName("edit130");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout24);
    obj.edit131:setLeft(365);
    obj.edit131:setTop(075);
    obj.edit131:setHeight(20);
    obj.edit131:setWidth(30);
    obj.edit131:setField("Defesa_Bon2");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setType("number");
    obj.edit131:setName("edit131");

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout24);
    obj.comboBox14:setLeft(400);
    obj.comboBox14:setTop(075);
    obj.comboBox14:setHeight(20);
    obj.comboBox14:setWidth(45);
    obj.comboBox14:setField("Defesa_edc");
    obj.comboBox14:setHorzTextAlign("center");
    obj.comboBox14:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox14:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox14:setName("comboBox14");

    obj.dataLink81 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink81:setParent(obj.layout24);
    obj.dataLink81:setField("Defesa_edc");
    obj.dataLink81:setDefaultValue("7");
    obj.dataLink81:setName("dataLink81");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout24);
    obj.edit132:setLeft(000);
    obj.edit132:setTop(100);
    obj.edit132:setHeight(20);
    obj.edit132:setWidth(30);
    obj.edit132:setField("AtaqueEsp_Pri");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setType("number");
    obj.edit132:setName("edit132");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout24);
    obj.label109:setLeft(035);
    obj.label109:setTop(100);
    obj.label109:setHeight(20);
    obj.label109:setWidth(100);
    obj.label109:setText("Ataque Especial");
    obj.label109:setAutoSize(true);
    lfm_setPropAsString(obj.label109, "fontStyle",  "bold");
    obj.label109:setName("label109");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout24);
    obj.edit133:setLeft(140);
    obj.edit133:setTop(100);
    obj.edit133:setHeight(20);
    obj.edit133:setWidth(30);
    obj.edit133:setField("AtaqueEsp_Form1");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setType("number");
    obj.edit133:setEnabled(false);
    obj.edit133:setName("edit133");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout24);
    obj.edit134:setLeft(185);
    obj.edit134:setTop(100);
    obj.edit134:setHeight(20);
    obj.edit134:setWidth(30);
    obj.edit134:setField("AtaqueEsp_Base1");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setType("number");
    obj.edit134:setName("edit134");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout24);
    obj.edit135:setLeft(230);
    obj.edit135:setTop(100);
    obj.edit135:setHeight(20);
    obj.edit135:setWidth(30);
    obj.edit135:setField("AtaqueEsp_Nivel");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setType("number");
    obj.edit135:setName("edit135");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout24);
    obj.edit136:setLeft(275);
    obj.edit136:setTop(100);
    obj.edit136:setHeight(20);
    obj.edit136:setWidth(30);
    obj.edit136:setField("AtaqueEsp_Bon1");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setType("number");
    obj.edit136:setName("edit136");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout24);
    obj.edit137:setLeft(320);
    obj.edit137:setTop(100);
    obj.edit137:setHeight(20);
    obj.edit137:setWidth(30);
    obj.edit137:setField("AtaqueEsp_Vit");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setType("number");
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout24);
    obj.edit138:setLeft(365);
    obj.edit138:setTop(100);
    obj.edit138:setHeight(20);
    obj.edit138:setWidth(30);
    obj.edit138:setField("AtaqueEsp_Bon2");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setType("number");
    obj.edit138:setName("edit138");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout24);
    obj.comboBox15:setLeft(400);
    obj.comboBox15:setTop(100);
    obj.comboBox15:setHeight(20);
    obj.comboBox15:setWidth(45);
    obj.comboBox15:setField("AtaqueEsp_edc");
    obj.comboBox15:setHorzTextAlign("center");
    obj.comboBox15:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox15:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox15:setName("comboBox15");

    obj.dataLink82 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink82:setParent(obj.layout24);
    obj.dataLink82:setField("AtaqueEsp_edc");
    obj.dataLink82:setDefaultValue("7");
    obj.dataLink82:setName("dataLink82");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout24);
    obj.edit139:setLeft(000);
    obj.edit139:setTop(125);
    obj.edit139:setHeight(20);
    obj.edit139:setWidth(30);
    obj.edit139:setField("DefesaEsp_Pri");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setType("number");
    obj.edit139:setName("edit139");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout24);
    obj.label110:setLeft(035);
    obj.label110:setTop(125);
    obj.label110:setHeight(20);
    obj.label110:setWidth(100);
    obj.label110:setText("Defesa Especial");
    obj.label110:setAutoSize(true);
    lfm_setPropAsString(obj.label110, "fontStyle",  "bold");
    obj.label110:setName("label110");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout24);
    obj.edit140:setLeft(140);
    obj.edit140:setTop(125);
    obj.edit140:setHeight(20);
    obj.edit140:setWidth(30);
    obj.edit140:setField("DefesaEsp_Form1");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setType("number");
    obj.edit140:setEnabled(false);
    obj.edit140:setName("edit140");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout24);
    obj.edit141:setLeft(185);
    obj.edit141:setTop(125);
    obj.edit141:setHeight(20);
    obj.edit141:setWidth(30);
    obj.edit141:setField("DefesaEsp_Base1");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setType("number");
    obj.edit141:setName("edit141");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout24);
    obj.edit142:setLeft(230);
    obj.edit142:setTop(125);
    obj.edit142:setHeight(20);
    obj.edit142:setWidth(30);
    obj.edit142:setField("DefesaEsp_Nivel");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setType("number");
    obj.edit142:setName("edit142");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout24);
    obj.edit143:setLeft(275);
    obj.edit143:setTop(125);
    obj.edit143:setHeight(20);
    obj.edit143:setWidth(30);
    obj.edit143:setField("DefesaEsp_Bon1");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setType("number");
    obj.edit143:setName("edit143");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout24);
    obj.edit144:setLeft(320);
    obj.edit144:setTop(125);
    obj.edit144:setHeight(20);
    obj.edit144:setWidth(30);
    obj.edit144:setField("DefesaEsp_Vit");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setType("number");
    obj.edit144:setName("edit144");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout24);
    obj.edit145:setLeft(365);
    obj.edit145:setTop(125);
    obj.edit145:setHeight(20);
    obj.edit145:setWidth(30);
    obj.edit145:setField("DefesaEsp_Bon2");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setType("number");
    obj.edit145:setName("edit145");

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout24);
    obj.comboBox16:setLeft(400);
    obj.comboBox16:setTop(125);
    obj.comboBox16:setHeight(20);
    obj.comboBox16:setWidth(45);
    obj.comboBox16:setField("DefesaEsp_edc");
    obj.comboBox16:setHorzTextAlign("center");
    obj.comboBox16:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox16:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox16:setName("comboBox16");

    obj.dataLink83 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink83:setParent(obj.layout24);
    obj.dataLink83:setField("DefesaEsp_edc");
    obj.dataLink83:setDefaultValue("7");
    obj.dataLink83:setName("dataLink83");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout24);
    obj.edit146:setLeft(000);
    obj.edit146:setTop(150);
    obj.edit146:setHeight(20);
    obj.edit146:setWidth(30);
    obj.edit146:setField("Velocidade_Pri");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setType("number");
    obj.edit146:setName("edit146");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout24);
    obj.label111:setLeft(035);
    obj.label111:setTop(150);
    obj.label111:setHeight(20);
    obj.label111:setWidth(100);
    obj.label111:setText("Velocidade");
    obj.label111:setAutoSize(true);
    lfm_setPropAsString(obj.label111, "fontStyle",  "bold");
    obj.label111:setName("label111");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout24);
    obj.edit147:setLeft(140);
    obj.edit147:setTop(150);
    obj.edit147:setHeight(20);
    obj.edit147:setWidth(30);
    obj.edit147:setField("Velocidade_Form1");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setType("number");
    obj.edit147:setEnabled(false);
    obj.edit147:setName("edit147");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout24);
    obj.edit148:setLeft(185);
    obj.edit148:setTop(150);
    obj.edit148:setHeight(20);
    obj.edit148:setWidth(30);
    obj.edit148:setField("Velocidade_Base1");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setType("number");
    obj.edit148:setName("edit148");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout24);
    obj.edit149:setLeft(230);
    obj.edit149:setTop(150);
    obj.edit149:setHeight(20);
    obj.edit149:setWidth(30);
    obj.edit149:setField("Velocidade_Nivel");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setType("number");
    obj.edit149:setName("edit149");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout24);
    obj.edit150:setLeft(275);
    obj.edit150:setTop(150);
    obj.edit150:setHeight(20);
    obj.edit150:setWidth(30);
    obj.edit150:setField("Velocidade_Bon1");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setType("number");
    obj.edit150:setName("edit150");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout24);
    obj.edit151:setLeft(320);
    obj.edit151:setTop(150);
    obj.edit151:setHeight(20);
    obj.edit151:setWidth(30);
    obj.edit151:setField("Velocidade_Vit");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setType("number");
    obj.edit151:setName("edit151");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout24);
    obj.edit152:setLeft(365);
    obj.edit152:setTop(150);
    obj.edit152:setHeight(20);
    obj.edit152:setWidth(30);
    obj.edit152:setField("Velocidade_Bon2");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setType("number");
    obj.edit152:setName("edit152");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout24);
    obj.comboBox17:setLeft(400);
    obj.comboBox17:setTop(150);
    obj.comboBox17:setHeight(20);
    obj.comboBox17:setWidth(45);
    obj.comboBox17:setField("Velocidade_edc");
    obj.comboBox17:setHorzTextAlign("center");
    obj.comboBox17:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox17:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox17:setName("comboBox17");

    obj.dataLink84 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink84:setParent(obj.layout24);
    obj.dataLink84:setField("Velocidade_edc");
    obj.dataLink84:setDefaultValue("7");
    obj.dataLink84:setName("dataLink84");

    obj.dataLink85 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink85:setParent(obj.rectangle41);
    obj.dataLink85:setFields({	'pokeLevel', 'Vida_Base1','Vida_Bon1', 'Vida_Bon2','Vida_Nivel','Vida_Vit','pokHP_Les','basSEX',
							'Ataque_Base1', 'Ataque_Bon1', 'Ataque_Bon2','Ataque_Nivel','Ataque_Vit','Ataque_edc','campoPokemon',
							'Defesa_Base1', 'Defesa_Bon1', 'Defesa_Bon2','Defesa_Nivel','Defesa_Vit','Defesa_edc',
							'AtaqueEsp_Base1', 'AtaqueEsp_Bon1', 'AtaqueEsp_Bon2','AtaqueEsp_Nivel','AtaqueEsp_Vit','AtaqueEsp_edc',
							'DefesaEsp_Base1', 'DefesaEsp_Bon1', 'DefesaEsp_Bon2','DefesaEsp_Nivel','DefesaEsp_Vit','DefesaEsp_edc',
							'Velocidade_Nivel','Velocidade_Base1','Velocidade_Bon1','Velocidade_Bon2','Velocidade_Vit','Velocidade_edc',
							'pok_bonEVAF', 'pok_bonEVAE', 'pok_bonEVAV', 'pok_bonINI','Treino_Bonus', 'MegaEvo', 'active','baseHPAtual', 'baseHPMAX',
							'SlotActive1', 'SlotActive2', 'SlotActive3', 'SlotActive4', 'SlotActive5', 'SlotActive6', 'SlotActive7'});
    obj.dataLink85:setName("dataLink85");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle41);
    obj.layout25:setLeft(470);
    obj.layout25:setTop(365);
    obj.layout25:setHeight(600);
    obj.layout25:setWidth(1000);
    obj.layout25:setName("layout25");

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.layout25);
    obj.image35:setLeft(000);
    obj.image35:setTop(000);
    obj.image35:setWidth(40);
    obj.image35:setHeight(40);
    obj.image35:setSRC("/img/normal2.gif");
    obj.image35:setName("image35");

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.layout25);
    obj.image36:setLeft(045);
    obj.image36:setTop(000);
    obj.image36:setWidth(40);
    obj.image36:setHeight(40);
    obj.image36:setSRC("/img/fire2.gif");
    obj.image36:setName("image36");

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.layout25);
    obj.image37:setLeft(090);
    obj.image37:setTop(000);
    obj.image37:setWidth(40);
    obj.image37:setHeight(40);
    obj.image37:setSRC("/img/water2.gif");
    obj.image37:setName("image37");

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.layout25);
    obj.image38:setLeft(135);
    obj.image38:setTop(000);
    obj.image38:setWidth(40);
    obj.image38:setHeight(40);
    obj.image38:setSRC("/img/electric2.gif");
    obj.image38:setName("image38");

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.layout25);
    obj.image39:setLeft(180);
    obj.image39:setTop(000);
    obj.image39:setWidth(40);
    obj.image39:setHeight(40);
    obj.image39:setSRC("/img/grass2.gif");
    obj.image39:setName("image39");

    obj.image40 = GUI.fromHandle(_obj_newObject("image"));
    obj.image40:setParent(obj.layout25);
    obj.image40:setLeft(225);
    obj.image40:setTop(000);
    obj.image40:setWidth(40);
    obj.image40:setHeight(40);
    obj.image40:setSRC("/img/ice2.gif");
    obj.image40:setName("image40");

    obj.image41 = GUI.fromHandle(_obj_newObject("image"));
    obj.image41:setParent(obj.layout25);
    obj.image41:setLeft(270);
    obj.image41:setTop(000);
    obj.image41:setWidth(40);
    obj.image41:setHeight(40);
    obj.image41:setSRC("/img/fighting2.gif");
    obj.image41:setName("image41");

    obj.image42 = GUI.fromHandle(_obj_newObject("image"));
    obj.image42:setParent(obj.layout25);
    obj.image42:setLeft(315);
    obj.image42:setTop(000);
    obj.image42:setWidth(40);
    obj.image42:setHeight(40);
    obj.image42:setSRC("/img/poison2.gif");
    obj.image42:setName("image42");

    obj.image43 = GUI.fromHandle(_obj_newObject("image"));
    obj.image43:setParent(obj.layout25);
    obj.image43:setLeft(360);
    obj.image43:setTop(000);
    obj.image43:setWidth(40);
    obj.image43:setHeight(40);
    obj.image43:setSRC("/img/ground2.gif");
    obj.image43:setName("image43");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout25);
    obj.edit153:setLeft(000);
    obj.edit153:setTop(045);
    obj.edit153:setHeight(20);
    obj.edit153:setWidth(40);
    obj.edit153:setField("weakTot1");
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setEnabled(false);
    obj.edit153:setName("edit153");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout25);
    obj.edit154:setLeft(045);
    obj.edit154:setTop(045);
    obj.edit154:setHeight(20);
    obj.edit154:setWidth(40);
    obj.edit154:setField("weakTot2");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setEnabled(false);
    obj.edit154:setName("edit154");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout25);
    obj.edit155:setLeft(090);
    obj.edit155:setTop(045);
    obj.edit155:setHeight(20);
    obj.edit155:setWidth(40);
    obj.edit155:setField("weakTot3");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setEnabled(false);
    obj.edit155:setName("edit155");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout25);
    obj.edit156:setLeft(135);
    obj.edit156:setTop(045);
    obj.edit156:setHeight(20);
    obj.edit156:setWidth(40);
    obj.edit156:setField("weakTot4");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setEnabled(false);
    obj.edit156:setName("edit156");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout25);
    obj.edit157:setLeft(180);
    obj.edit157:setTop(045);
    obj.edit157:setHeight(20);
    obj.edit157:setWidth(40);
    obj.edit157:setField("weakTot5");
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setEnabled(false);
    obj.edit157:setName("edit157");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout25);
    obj.edit158:setLeft(225);
    obj.edit158:setTop(045);
    obj.edit158:setHeight(20);
    obj.edit158:setWidth(40);
    obj.edit158:setField("weakTot6");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setEnabled(false);
    obj.edit158:setName("edit158");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout25);
    obj.edit159:setLeft(270);
    obj.edit159:setTop(045);
    obj.edit159:setHeight(20);
    obj.edit159:setWidth(40);
    obj.edit159:setField("weakTot7");
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setEnabled(false);
    obj.edit159:setName("edit159");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout25);
    obj.edit160:setLeft(315);
    obj.edit160:setTop(045);
    obj.edit160:setHeight(20);
    obj.edit160:setWidth(40);
    obj.edit160:setField("weakTot8");
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setEnabled(false);
    obj.edit160:setName("edit160");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout25);
    obj.edit161:setLeft(360);
    obj.edit161:setTop(045);
    obj.edit161:setHeight(20);
    obj.edit161:setWidth(40);
    obj.edit161:setField("weakTot9");
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setEnabled(false);
    obj.edit161:setName("edit161");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle41);
    obj.layout26:setLeft(065);
    obj.layout26:setTop(435);
    obj.layout26:setHeight(600);
    obj.layout26:setWidth(1000);
    obj.layout26:setName("layout26");

    obj.image44 = GUI.fromHandle(_obj_newObject("image"));
    obj.image44:setParent(obj.layout26);
    obj.image44:setLeft(405);
    obj.image44:setTop(000);
    obj.image44:setWidth(40);
    obj.image44:setHeight(40);
    obj.image44:setSRC("/img/flying2.gif");
    obj.image44:setName("image44");

    obj.image45 = GUI.fromHandle(_obj_newObject("image"));
    obj.image45:setParent(obj.layout26);
    obj.image45:setLeft(450);
    obj.image45:setTop(000);
    obj.image45:setWidth(40);
    obj.image45:setHeight(40);
    obj.image45:setSRC("/img/psychic2.gif");
    obj.image45:setName("image45");

    obj.image46 = GUI.fromHandle(_obj_newObject("image"));
    obj.image46:setParent(obj.layout26);
    obj.image46:setLeft(495);
    obj.image46:setTop(000);
    obj.image46:setWidth(40);
    obj.image46:setHeight(40);
    obj.image46:setSRC("/img/bug2.gif");
    obj.image46:setName("image46");

    obj.image47 = GUI.fromHandle(_obj_newObject("image"));
    obj.image47:setParent(obj.layout26);
    obj.image47:setLeft(540);
    obj.image47:setTop(000);
    obj.image47:setWidth(40);
    obj.image47:setHeight(40);
    obj.image47:setSRC("/img/rock2.gif");
    obj.image47:setName("image47");

    obj.image48 = GUI.fromHandle(_obj_newObject("image"));
    obj.image48:setParent(obj.layout26);
    obj.image48:setLeft(585);
    obj.image48:setTop(000);
    obj.image48:setWidth(40);
    obj.image48:setHeight(40);
    obj.image48:setSRC("/img/ghost2.gif");
    obj.image48:setName("image48");

    obj.image49 = GUI.fromHandle(_obj_newObject("image"));
    obj.image49:setParent(obj.layout26);
    obj.image49:setLeft(630);
    obj.image49:setTop(000);
    obj.image49:setWidth(40);
    obj.image49:setHeight(40);
    obj.image49:setSRC("/img/dragon2.gif");
    obj.image49:setName("image49");

    obj.image50 = GUI.fromHandle(_obj_newObject("image"));
    obj.image50:setParent(obj.layout26);
    obj.image50:setLeft(675);
    obj.image50:setTop(000);
    obj.image50:setWidth(40);
    obj.image50:setHeight(40);
    obj.image50:setSRC("/img/dark2.gif");
    obj.image50:setName("image50");

    obj.image51 = GUI.fromHandle(_obj_newObject("image"));
    obj.image51:setParent(obj.layout26);
    obj.image51:setLeft(720);
    obj.image51:setTop(000);
    obj.image51:setWidth(40);
    obj.image51:setHeight(40);
    obj.image51:setSRC("/img/steel2.gif");
    obj.image51:setName("image51");

    obj.image52 = GUI.fromHandle(_obj_newObject("image"));
    obj.image52:setParent(obj.layout26);
    obj.image52:setLeft(765);
    obj.image52:setTop(000);
    obj.image52:setWidth(40);
    obj.image52:setHeight(40);
    obj.image52:setSRC("/img/fairy2.gif");
    obj.image52:setName("image52");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout26);
    obj.edit162:setLeft(405);
    obj.edit162:setTop(045);
    obj.edit162:setHeight(20);
    obj.edit162:setWidth(40);
    obj.edit162:setField("weakTot10");
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setEnabled(false);
    obj.edit162:setName("edit162");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout26);
    obj.edit163:setLeft(450);
    obj.edit163:setTop(045);
    obj.edit163:setHeight(20);
    obj.edit163:setWidth(40);
    obj.edit163:setField("weakTot11");
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setEnabled(false);
    obj.edit163:setName("edit163");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout26);
    obj.edit164:setLeft(495);
    obj.edit164:setTop(045);
    obj.edit164:setHeight(20);
    obj.edit164:setWidth(40);
    obj.edit164:setField("weakTot12");
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setEnabled(false);
    obj.edit164:setName("edit164");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout26);
    obj.edit165:setLeft(540);
    obj.edit165:setTop(045);
    obj.edit165:setHeight(20);
    obj.edit165:setWidth(40);
    obj.edit165:setField("weakTot13");
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setEnabled(false);
    obj.edit165:setName("edit165");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout26);
    obj.edit166:setLeft(585);
    obj.edit166:setTop(045);
    obj.edit166:setHeight(20);
    obj.edit166:setWidth(40);
    obj.edit166:setField("weakTot14");
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setEnabled(false);
    obj.edit166:setName("edit166");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout26);
    obj.edit167:setLeft(630);
    obj.edit167:setTop(045);
    obj.edit167:setHeight(20);
    obj.edit167:setWidth(40);
    obj.edit167:setField("weakTot15");
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setEnabled(false);
    obj.edit167:setName("edit167");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout26);
    obj.edit168:setLeft(675);
    obj.edit168:setTop(045);
    obj.edit168:setHeight(20);
    obj.edit168:setWidth(40);
    obj.edit168:setField("weakTot16");
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setEnabled(false);
    obj.edit168:setName("edit168");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout26);
    obj.edit169:setLeft(720);
    obj.edit169:setTop(045);
    obj.edit169:setHeight(20);
    obj.edit169:setWidth(40);
    obj.edit169:setField("weakTot17");
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setEnabled(false);
    obj.edit169:setName("edit169");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout26);
    obj.edit170:setLeft(765);
    obj.edit170:setTop(045);
    obj.edit170:setHeight(20);
    obj.edit170:setWidth(40);
    obj.edit170:setField("weakTot18");
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setEnabled(false);
    obj.edit170:setName("edit170");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl2);
    obj.tab4:setTitle("Golpes");
    obj.tab4:setName("tab4");

    obj.frmFichaRPGmeister3_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister3_svg:setParent(obj.tab4);
    obj.frmFichaRPGmeister3_svg:setName("frmFichaRPGmeister3_svg");
    obj.frmFichaRPGmeister3_svg:setAlign("client");
    obj.frmFichaRPGmeister3_svg:setTheme("dark");
    obj.frmFichaRPGmeister3_svg:setMargins({top=1});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmFichaRPGmeister3_svg);
    obj.scrollBox3:setAlign("left");
    obj.scrollBox3:setWidth(880);
    obj.scrollBox3:setName("scrollBox3");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox3);
    obj.layout27:setLeft(0);
    obj.layout27:setTop(0);
    obj.layout27:setWidth(865);
    obj.layout27:setHeight(760);
    obj.layout27:setName("layout27");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout27);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("#0000007F");
    obj.rectangle44:setName("rectangle44");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28:setLeft(2);
    obj.layout28:setTop(2);
    obj.layout28:setWidth(880);
    obj.layout28:setHeight(92);
    obj.layout28:setName("layout28");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout28);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("black");
    obj.rectangle45:setName("rectangle45");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout28);
    obj.label112:setLeft(5);
    obj.label112:setTop(5);
    obj.label112:setWidth(70);
    obj.label112:setHeight(25);
    obj.label112:setText("Golpe");
    lfm_setPropAsString(obj.label112, "fontStyle",  "bold");
    obj.label112:setName("label112");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout28);
    obj.edit171:setVertTextAlign("center");
    obj.edit171:setLeft(75);
    obj.edit171:setTop(5);
    obj.edit171:setWidth(160);
    obj.edit171:setHeight(25);
    obj.edit171:setField("golpeP1");
    obj.edit171:setName("edit171");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout28);
    obj.label113:setLeft(5);
    obj.label113:setTop(30);
    obj.label113:setWidth(80);
    obj.label113:setHeight(25);
    obj.label113:setText("Descritores");
    lfm_setPropAsString(obj.label113, "fontStyle",  "bold");
    obj.label113:setName("label113");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout28);
    obj.edit172:setVertTextAlign("center");
    obj.edit172:setLeft(75);
    obj.edit172:setTop(30);
    obj.edit172:setWidth(160);
    obj.edit172:setHeight(25);
    obj.edit172:setField("DescritoresP1");
    obj.edit172:setName("edit172");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout28);
    obj.label114:setLeft(5);
    obj.label114:setTop(55);
    obj.label114:setWidth(70);
    obj.label114:setHeight(25);
    obj.label114:setText("Alcance");
    lfm_setPropAsString(obj.label114, "fontStyle",  "bold");
    obj.label114:setName("label114");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout28);
    obj.edit173:setVertTextAlign("center");
    obj.edit173:setLeft(75);
    obj.edit173:setTop(55);
    obj.edit173:setWidth(160);
    obj.edit173:setHeight(25);
    obj.edit173:setField("alcanceP1");
    obj.edit173:setName("edit173");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout28);
    obj.label115:setLeft(240);
    obj.label115:setTop(6);
    obj.label115:setWidth(50);
    obj.label115:setHeight(25);
    obj.label115:setText("Tipo");
    lfm_setPropAsString(obj.label115, "fontStyle",  "bold");
    obj.label115:setName("label115");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout28);
    obj.edit174:setVertTextAlign("center");
    obj.edit174:setLeft(282);
    obj.edit174:setTop(6);
    obj.edit174:setWidth(82);
    obj.edit174:setHeight(25);
    obj.edit174:setField("tipoP1");
    obj.edit174:setName("edit174");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout28);
    obj.label116:setLeft(240);
    obj.label116:setTop(31);
    obj.label116:setWidth(50);
    obj.label116:setHeight(25);
    obj.label116:setText("Classe");
    lfm_setPropAsString(obj.label116, "fontStyle",  "bold");
    obj.label116:setName("label116");

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout28);
    obj.comboBox18:setLeft(282);
    obj.comboBox18:setTop(31);
    obj.comboBox18:setWidth(82);
    obj.comboBox18:setHeight(25);
    obj.comboBox18:setField("classeP1");
    obj.comboBox18:setHorzTextAlign("center");
    obj.comboBox18:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox18:setValues({'1', '2', '3'});
    obj.comboBox18:setName("comboBox18");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout28);
    obj.label117:setLeft(240);
    obj.label117:setTop(55);
    obj.label117:setWidth(50);
    obj.label117:setHeight(25);
    obj.label117:setText("Freq.");
    lfm_setPropAsString(obj.label117, "fontStyle",  "bold");
    obj.label117:setName("label117");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout28);
    obj.edit175:setVertTextAlign("center");
    obj.edit175:setLeft(282);
    obj.edit175:setTop(55);
    obj.edit175:setWidth(82);
    obj.edit175:setHeight(25);
    obj.edit175:setField("frequenciaP1");
    obj.edit175:setName("edit175");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout28);
    obj.label118:setLeft(370);
    obj.label118:setTop(6);
    obj.label118:setWidth(70);
    obj.label118:setHeight(25);
    obj.label118:setText("Acurácia");
    lfm_setPropAsString(obj.label118, "fontStyle",  "bold");
    obj.label118:setName("label118");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout28);
    obj.edit176:setVertTextAlign("center");
    obj.edit176:setLeft(425);
    obj.edit176:setTop(6);
    obj.edit176:setWidth(53);
    obj.edit176:setHeight(25);
    obj.edit176:setField("AccP1");
    obj.edit176:setType("number");
    obj.edit176:setName("edit176");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout28);
    obj.label119:setLeft(370);
    obj.label119:setTop(31);
    obj.label119:setWidth(70);
    obj.label119:setHeight(25);
    obj.label119:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label119, "fontStyle",  "bold");
    obj.label119:setName("label119");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout28);
    obj.edit177:setVertTextAlign("center");
    obj.edit177:setLeft(425);
    obj.edit177:setTop(31);
    obj.edit177:setWidth(53);
    obj.edit177:setHeight(25);
    obj.edit177:setField("ataqueP1");
    obj.edit177:setType("number");
    obj.edit177:setName("edit177");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout28);
    obj.label120:setLeft(370);
    obj.label120:setTop(55);
    obj.label120:setWidth(70);
    obj.label120:setHeight(25);
    obj.label120:setText("D. Base");
    lfm_setPropAsString(obj.label120, "fontStyle",  "bold");
    obj.label120:setName("label120");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout28);
    obj.edit178:setVertTextAlign("center");
    obj.edit178:setLeft(425);
    obj.edit178:setTop(55);
    obj.edit178:setWidth(53);
    obj.edit178:setHeight(25);
    obj.edit178:setField("danoP1");
    obj.edit178:setName("edit178");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout28);
    obj.button11:setLeft(488);
    obj.button11:setTop(6);
    obj.button11:setWidth(82);
    obj.button11:setText("Acerto");
    obj.button11:setFontSize(11);
    lfm_setPropAsString(obj.button11, "fontStyle",  "bold");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout28);
    obj.button12:setLeft(488);
    obj.button12:setTop(31);
    obj.button12:setWidth(82);
    obj.button12:setText("Dano");
    obj.button12:setFontSize(11);
    lfm_setPropAsString(obj.button12, "fontStyle",  "bold");
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout28);
    obj.button13:setLeft(488);
    obj.button13:setTop(55);
    obj.button13:setWidth(82);
    obj.button13:setText("Crítico");
    obj.button13:setFontSize(11);
    lfm_setPropAsString(obj.button13, "fontStyle",  "bold");
    obj.button13:setName("button13");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout28);
    obj.textEditor2:setLeft(575);
    obj.textEditor2:setTop(5);
    obj.textEditor2:setWidth(280);
    obj.textEditor2:setHeight(50);
    obj.textEditor2:setField("campoEfeitoGolpesP1");
    obj.textEditor2:setName("textEditor2");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout28);
    obj.label121:setLeft(575);
    obj.label121:setTop(55);
    obj.label121:setWidth(60);
    obj.label121:setHeight(25);
    obj.label121:setText("Aptidão");
    lfm_setPropAsString(obj.label121, "fontStyle",  "bold");
    obj.label121:setName("label121");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout28);
    obj.edit179:setVertTextAlign("center");
    obj.edit179:setLeft(625);
    obj.edit179:setTop(60);
    obj.edit179:setWidth(55);
    obj.edit179:setHeight(25);
    obj.edit179:setField("tipoContestP1");
    obj.edit179:setName("edit179");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout28);
    obj.label122:setLeft(685);
    obj.label122:setTop(55);
    obj.label122:setWidth(40);
    obj.label122:setHeight(25);
    obj.label122:setText("Conc.");
    lfm_setPropAsString(obj.label122, "fontStyle",  "bold");
    obj.label122:setName("label122");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout28);
    obj.edit180:setVertTextAlign("center");
    obj.edit180:setLeft(730);
    obj.edit180:setTop(60);
    obj.edit180:setWidth(125);
    obj.edit180:setHeight(25);
    obj.edit180:setField("efeitoContestP1");
    obj.edit180:setName("edit180");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout27);
    obj.layout29:setLeft(2);
    obj.layout29:setTop(97);
    obj.layout29:setWidth(880);
    obj.layout29:setHeight(92);
    obj.layout29:setName("layout29");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout29);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setName("rectangle46");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout29);
    obj.label123:setLeft(5);
    obj.label123:setTop(5);
    obj.label123:setWidth(70);
    obj.label123:setHeight(25);
    obj.label123:setText("Golpe");
    lfm_setPropAsString(obj.label123, "fontStyle",  "bold");
    obj.label123:setName("label123");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout29);
    obj.edit181:setVertTextAlign("center");
    obj.edit181:setLeft(75);
    obj.edit181:setTop(5);
    obj.edit181:setWidth(160);
    obj.edit181:setHeight(25);
    obj.edit181:setField("golpeP2");
    obj.edit181:setName("edit181");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout29);
    obj.label124:setLeft(5);
    obj.label124:setTop(30);
    obj.label124:setWidth(80);
    obj.label124:setHeight(25);
    obj.label124:setText("Descritores");
    lfm_setPropAsString(obj.label124, "fontStyle",  "bold");
    obj.label124:setName("label124");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout29);
    obj.edit182:setVertTextAlign("center");
    obj.edit182:setLeft(75);
    obj.edit182:setTop(30);
    obj.edit182:setWidth(160);
    obj.edit182:setHeight(25);
    obj.edit182:setField("DescritoresP2");
    obj.edit182:setName("edit182");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout29);
    obj.label125:setLeft(5);
    obj.label125:setTop(55);
    obj.label125:setWidth(70);
    obj.label125:setHeight(25);
    obj.label125:setText("Alcance");
    lfm_setPropAsString(obj.label125, "fontStyle",  "bold");
    obj.label125:setName("label125");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout29);
    obj.edit183:setVertTextAlign("center");
    obj.edit183:setLeft(75);
    obj.edit183:setTop(55);
    obj.edit183:setWidth(160);
    obj.edit183:setHeight(25);
    obj.edit183:setField("alcanceP2");
    obj.edit183:setName("edit183");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout29);
    obj.label126:setLeft(240);
    obj.label126:setTop(6);
    obj.label126:setWidth(50);
    obj.label126:setHeight(25);
    obj.label126:setText("Tipo");
    lfm_setPropAsString(obj.label126, "fontStyle",  "bold");
    obj.label126:setName("label126");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout29);
    obj.edit184:setVertTextAlign("center");
    obj.edit184:setLeft(282);
    obj.edit184:setTop(6);
    obj.edit184:setWidth(82);
    obj.edit184:setHeight(25);
    obj.edit184:setField("tipoP2");
    obj.edit184:setName("edit184");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout29);
    obj.label127:setLeft(240);
    obj.label127:setTop(31);
    obj.label127:setWidth(50);
    obj.label127:setHeight(25);
    obj.label127:setText("Classe");
    lfm_setPropAsString(obj.label127, "fontStyle",  "bold");
    obj.label127:setName("label127");

    obj.comboBox19 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout29);
    obj.comboBox19:setLeft(282);
    obj.comboBox19:setTop(31);
    obj.comboBox19:setWidth(82);
    obj.comboBox19:setHeight(25);
    obj.comboBox19:setField("classeP2");
    obj.comboBox19:setHorzTextAlign("center");
    obj.comboBox19:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox19:setValues({'1', '2', '3'});
    obj.comboBox19:setName("comboBox19");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout29);
    obj.label128:setLeft(240);
    obj.label128:setTop(55);
    obj.label128:setWidth(50);
    obj.label128:setHeight(25);
    obj.label128:setText("Freq.");
    lfm_setPropAsString(obj.label128, "fontStyle",  "bold");
    obj.label128:setName("label128");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout29);
    obj.edit185:setVertTextAlign("center");
    obj.edit185:setLeft(282);
    obj.edit185:setTop(55);
    obj.edit185:setWidth(82);
    obj.edit185:setHeight(25);
    obj.edit185:setField("frequenciaP2");
    obj.edit185:setName("edit185");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout29);
    obj.label129:setLeft(370);
    obj.label129:setTop(6);
    obj.label129:setWidth(70);
    obj.label129:setHeight(25);
    obj.label129:setText("Acurácia");
    lfm_setPropAsString(obj.label129, "fontStyle",  "bold");
    obj.label129:setName("label129");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout29);
    obj.edit186:setVertTextAlign("center");
    obj.edit186:setLeft(425);
    obj.edit186:setTop(6);
    obj.edit186:setWidth(53);
    obj.edit186:setHeight(25);
    obj.edit186:setField("AccP2");
    obj.edit186:setType("number");
    obj.edit186:setName("edit186");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout29);
    obj.label130:setLeft(370);
    obj.label130:setTop(31);
    obj.label130:setWidth(70);
    obj.label130:setHeight(25);
    obj.label130:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label130, "fontStyle",  "bold");
    obj.label130:setName("label130");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout29);
    obj.edit187:setVertTextAlign("center");
    obj.edit187:setLeft(425);
    obj.edit187:setTop(31);
    obj.edit187:setWidth(53);
    obj.edit187:setHeight(25);
    obj.edit187:setField("ataqueP2");
    obj.edit187:setType("number");
    obj.edit187:setName("edit187");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout29);
    obj.label131:setLeft(370);
    obj.label131:setTop(55);
    obj.label131:setWidth(70);
    obj.label131:setHeight(25);
    obj.label131:setText("D. Base");
    lfm_setPropAsString(obj.label131, "fontStyle",  "bold");
    obj.label131:setName("label131");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout29);
    obj.edit188:setVertTextAlign("center");
    obj.edit188:setLeft(425);
    obj.edit188:setTop(55);
    obj.edit188:setWidth(53);
    obj.edit188:setHeight(25);
    obj.edit188:setField("danoP2");
    obj.edit188:setName("edit188");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout29);
    obj.button14:setLeft(488);
    obj.button14:setTop(6);
    obj.button14:setWidth(82);
    obj.button14:setText("Acerto");
    obj.button14:setFontSize(11);
    lfm_setPropAsString(obj.button14, "fontStyle",  "bold");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout29);
    obj.button15:setLeft(488);
    obj.button15:setTop(31);
    obj.button15:setWidth(82);
    obj.button15:setText("Dano");
    obj.button15:setFontSize(11);
    lfm_setPropAsString(obj.button15, "fontStyle",  "bold");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout29);
    obj.button16:setLeft(488);
    obj.button16:setTop(55);
    obj.button16:setWidth(82);
    obj.button16:setText("Crítico");
    obj.button16:setFontSize(11);
    lfm_setPropAsString(obj.button16, "fontStyle",  "bold");
    obj.button16:setName("button16");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout29);
    obj.textEditor3:setLeft(575);
    obj.textEditor3:setTop(5);
    obj.textEditor3:setWidth(280);
    obj.textEditor3:setHeight(50);
    obj.textEditor3:setField("campoEfeitoGolpesP2");
    obj.textEditor3:setName("textEditor3");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout29);
    obj.label132:setLeft(575);
    obj.label132:setTop(55);
    obj.label132:setWidth(60);
    obj.label132:setHeight(25);
    obj.label132:setText("Aptidão");
    lfm_setPropAsString(obj.label132, "fontStyle",  "bold");
    obj.label132:setName("label132");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout29);
    obj.edit189:setVertTextAlign("center");
    obj.edit189:setLeft(625);
    obj.edit189:setTop(60);
    obj.edit189:setWidth(55);
    obj.edit189:setHeight(25);
    obj.edit189:setField("tipoContestP2");
    obj.edit189:setName("edit189");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout29);
    obj.label133:setLeft(685);
    obj.label133:setTop(55);
    obj.label133:setWidth(40);
    obj.label133:setHeight(25);
    obj.label133:setText("Conc.");
    lfm_setPropAsString(obj.label133, "fontStyle",  "bold");
    obj.label133:setName("label133");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout29);
    obj.edit190:setVertTextAlign("center");
    obj.edit190:setLeft(730);
    obj.edit190:setTop(60);
    obj.edit190:setWidth(125);
    obj.edit190:setHeight(25);
    obj.edit190:setField("efeitoContestP2");
    obj.edit190:setName("edit190");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout27);
    obj.layout30:setLeft(2);
    obj.layout30:setTop(192);
    obj.layout30:setWidth(880);
    obj.layout30:setHeight(92);
    obj.layout30:setName("layout30");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout30);
    obj.rectangle47:setAlign("client");
    obj.rectangle47:setColor("black");
    obj.rectangle47:setName("rectangle47");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout30);
    obj.label134:setLeft(5);
    obj.label134:setTop(5);
    obj.label134:setWidth(70);
    obj.label134:setHeight(25);
    obj.label134:setText("Golpe");
    lfm_setPropAsString(obj.label134, "fontStyle",  "bold");
    obj.label134:setName("label134");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout30);
    obj.edit191:setVertTextAlign("center");
    obj.edit191:setLeft(75);
    obj.edit191:setTop(5);
    obj.edit191:setWidth(160);
    obj.edit191:setHeight(25);
    obj.edit191:setField("golpeP3");
    obj.edit191:setName("edit191");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout30);
    obj.label135:setLeft(5);
    obj.label135:setTop(30);
    obj.label135:setWidth(80);
    obj.label135:setHeight(25);
    obj.label135:setText("Descritores");
    lfm_setPropAsString(obj.label135, "fontStyle",  "bold");
    obj.label135:setName("label135");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout30);
    obj.edit192:setVertTextAlign("center");
    obj.edit192:setLeft(75);
    obj.edit192:setTop(30);
    obj.edit192:setWidth(160);
    obj.edit192:setHeight(25);
    obj.edit192:setField("DescritoresP3");
    obj.edit192:setName("edit192");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout30);
    obj.label136:setLeft(5);
    obj.label136:setTop(55);
    obj.label136:setWidth(70);
    obj.label136:setHeight(25);
    obj.label136:setText("Alcance");
    lfm_setPropAsString(obj.label136, "fontStyle",  "bold");
    obj.label136:setName("label136");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout30);
    obj.edit193:setVertTextAlign("center");
    obj.edit193:setLeft(75);
    obj.edit193:setTop(55);
    obj.edit193:setWidth(160);
    obj.edit193:setHeight(25);
    obj.edit193:setField("alcanceP3");
    obj.edit193:setName("edit193");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout30);
    obj.label137:setLeft(240);
    obj.label137:setTop(6);
    obj.label137:setWidth(50);
    obj.label137:setHeight(25);
    obj.label137:setText("Tipo");
    lfm_setPropAsString(obj.label137, "fontStyle",  "bold");
    obj.label137:setName("label137");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout30);
    obj.edit194:setVertTextAlign("center");
    obj.edit194:setLeft(282);
    obj.edit194:setTop(6);
    obj.edit194:setWidth(82);
    obj.edit194:setHeight(25);
    obj.edit194:setField("tipoP3");
    obj.edit194:setName("edit194");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout30);
    obj.label138:setLeft(240);
    obj.label138:setTop(31);
    obj.label138:setWidth(50);
    obj.label138:setHeight(25);
    obj.label138:setText("Classe");
    lfm_setPropAsString(obj.label138, "fontStyle",  "bold");
    obj.label138:setName("label138");

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout30);
    obj.comboBox20:setLeft(282);
    obj.comboBox20:setTop(31);
    obj.comboBox20:setWidth(82);
    obj.comboBox20:setHeight(25);
    obj.comboBox20:setField("classeP3");
    obj.comboBox20:setHorzTextAlign("center");
    obj.comboBox20:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox20:setValues({'1', '2', '3'});
    obj.comboBox20:setName("comboBox20");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout30);
    obj.label139:setLeft(240);
    obj.label139:setTop(55);
    obj.label139:setWidth(50);
    obj.label139:setHeight(25);
    obj.label139:setText("Freq.");
    lfm_setPropAsString(obj.label139, "fontStyle",  "bold");
    obj.label139:setName("label139");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout30);
    obj.edit195:setVertTextAlign("center");
    obj.edit195:setLeft(282);
    obj.edit195:setTop(55);
    obj.edit195:setWidth(82);
    obj.edit195:setHeight(25);
    obj.edit195:setField("frequenciaP3");
    obj.edit195:setName("edit195");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout30);
    obj.label140:setLeft(370);
    obj.label140:setTop(6);
    obj.label140:setWidth(70);
    obj.label140:setHeight(25);
    obj.label140:setText("Acurácia");
    lfm_setPropAsString(obj.label140, "fontStyle",  "bold");
    obj.label140:setName("label140");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout30);
    obj.edit196:setVertTextAlign("center");
    obj.edit196:setLeft(425);
    obj.edit196:setTop(6);
    obj.edit196:setWidth(53);
    obj.edit196:setHeight(25);
    obj.edit196:setField("AccP3");
    obj.edit196:setType("number");
    obj.edit196:setName("edit196");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout30);
    obj.label141:setLeft(370);
    obj.label141:setTop(31);
    obj.label141:setWidth(70);
    obj.label141:setHeight(25);
    obj.label141:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label141, "fontStyle",  "bold");
    obj.label141:setName("label141");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout30);
    obj.edit197:setVertTextAlign("center");
    obj.edit197:setLeft(425);
    obj.edit197:setTop(31);
    obj.edit197:setWidth(53);
    obj.edit197:setHeight(25);
    obj.edit197:setField("ataqueP3");
    obj.edit197:setType("number");
    obj.edit197:setName("edit197");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout30);
    obj.label142:setLeft(370);
    obj.label142:setTop(55);
    obj.label142:setWidth(70);
    obj.label142:setHeight(25);
    obj.label142:setText("D. Base");
    lfm_setPropAsString(obj.label142, "fontStyle",  "bold");
    obj.label142:setName("label142");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout30);
    obj.edit198:setVertTextAlign("center");
    obj.edit198:setLeft(425);
    obj.edit198:setTop(55);
    obj.edit198:setWidth(53);
    obj.edit198:setHeight(25);
    obj.edit198:setField("danoP3");
    obj.edit198:setName("edit198");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout30);
    obj.button17:setLeft(488);
    obj.button17:setTop(6);
    obj.button17:setWidth(82);
    obj.button17:setText("Acerto");
    obj.button17:setFontSize(11);
    lfm_setPropAsString(obj.button17, "fontStyle",  "bold");
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout30);
    obj.button18:setLeft(488);
    obj.button18:setTop(31);
    obj.button18:setWidth(82);
    obj.button18:setText("Dano");
    obj.button18:setFontSize(11);
    lfm_setPropAsString(obj.button18, "fontStyle",  "bold");
    obj.button18:setName("button18");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout30);
    obj.button19:setLeft(488);
    obj.button19:setTop(55);
    obj.button19:setWidth(82);
    obj.button19:setText("Crítico");
    obj.button19:setFontSize(11);
    lfm_setPropAsString(obj.button19, "fontStyle",  "bold");
    obj.button19:setName("button19");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout30);
    obj.textEditor4:setLeft(575);
    obj.textEditor4:setTop(5);
    obj.textEditor4:setWidth(280);
    obj.textEditor4:setHeight(50);
    obj.textEditor4:setField("campoEfeitoGolpesP3");
    obj.textEditor4:setName("textEditor4");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout30);
    obj.label143:setLeft(575);
    obj.label143:setTop(55);
    obj.label143:setWidth(60);
    obj.label143:setHeight(25);
    obj.label143:setText("Aptidão");
    lfm_setPropAsString(obj.label143, "fontStyle",  "bold");
    obj.label143:setName("label143");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout30);
    obj.edit199:setVertTextAlign("center");
    obj.edit199:setLeft(625);
    obj.edit199:setTop(60);
    obj.edit199:setWidth(55);
    obj.edit199:setHeight(25);
    obj.edit199:setField("tipoContestP3");
    obj.edit199:setName("edit199");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout30);
    obj.label144:setLeft(685);
    obj.label144:setTop(55);
    obj.label144:setWidth(40);
    obj.label144:setHeight(25);
    obj.label144:setText("Conc.");
    lfm_setPropAsString(obj.label144, "fontStyle",  "bold");
    obj.label144:setName("label144");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout30);
    obj.edit200:setVertTextAlign("center");
    obj.edit200:setLeft(730);
    obj.edit200:setTop(60);
    obj.edit200:setWidth(125);
    obj.edit200:setHeight(25);
    obj.edit200:setField("efeitoContestP3");
    obj.edit200:setName("edit200");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout27);
    obj.layout31:setLeft(2);
    obj.layout31:setTop(288);
    obj.layout31:setWidth(880);
    obj.layout31:setHeight(92);
    obj.layout31:setName("layout31");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout31);
    obj.rectangle48:setAlign("client");
    obj.rectangle48:setColor("black");
    obj.rectangle48:setName("rectangle48");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout31);
    obj.label145:setLeft(5);
    obj.label145:setTop(5);
    obj.label145:setWidth(70);
    obj.label145:setHeight(25);
    obj.label145:setText("Golpe");
    lfm_setPropAsString(obj.label145, "fontStyle",  "bold");
    obj.label145:setName("label145");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout31);
    obj.edit201:setVertTextAlign("center");
    obj.edit201:setLeft(75);
    obj.edit201:setTop(5);
    obj.edit201:setWidth(160);
    obj.edit201:setHeight(25);
    obj.edit201:setField("golpeP4");
    obj.edit201:setName("edit201");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout31);
    obj.label146:setLeft(5);
    obj.label146:setTop(30);
    obj.label146:setWidth(80);
    obj.label146:setHeight(25);
    obj.label146:setText("Descritores");
    lfm_setPropAsString(obj.label146, "fontStyle",  "bold");
    obj.label146:setName("label146");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout31);
    obj.edit202:setVertTextAlign("center");
    obj.edit202:setLeft(75);
    obj.edit202:setTop(30);
    obj.edit202:setWidth(160);
    obj.edit202:setHeight(25);
    obj.edit202:setField("DescritoresP4");
    obj.edit202:setName("edit202");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout31);
    obj.label147:setLeft(5);
    obj.label147:setTop(55);
    obj.label147:setWidth(70);
    obj.label147:setHeight(25);
    obj.label147:setText("Alcance");
    lfm_setPropAsString(obj.label147, "fontStyle",  "bold");
    obj.label147:setName("label147");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout31);
    obj.edit203:setVertTextAlign("center");
    obj.edit203:setLeft(75);
    obj.edit203:setTop(55);
    obj.edit203:setWidth(160);
    obj.edit203:setHeight(25);
    obj.edit203:setField("alcanceP4");
    obj.edit203:setName("edit203");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout31);
    obj.label148:setLeft(240);
    obj.label148:setTop(6);
    obj.label148:setWidth(50);
    obj.label148:setHeight(25);
    obj.label148:setText("Tipo");
    lfm_setPropAsString(obj.label148, "fontStyle",  "bold");
    obj.label148:setName("label148");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout31);
    obj.edit204:setVertTextAlign("center");
    obj.edit204:setLeft(282);
    obj.edit204:setTop(6);
    obj.edit204:setWidth(82);
    obj.edit204:setHeight(25);
    obj.edit204:setField("tipoP4");
    obj.edit204:setName("edit204");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout31);
    obj.label149:setLeft(240);
    obj.label149:setTop(31);
    obj.label149:setWidth(50);
    obj.label149:setHeight(25);
    obj.label149:setText("Classe");
    lfm_setPropAsString(obj.label149, "fontStyle",  "bold");
    obj.label149:setName("label149");

    obj.comboBox21 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout31);
    obj.comboBox21:setLeft(282);
    obj.comboBox21:setTop(31);
    obj.comboBox21:setWidth(82);
    obj.comboBox21:setHeight(25);
    obj.comboBox21:setField("classeP4");
    obj.comboBox21:setHorzTextAlign("center");
    obj.comboBox21:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox21:setValues({'1', '2', '3'});
    obj.comboBox21:setName("comboBox21");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout31);
    obj.label150:setLeft(240);
    obj.label150:setTop(55);
    obj.label150:setWidth(50);
    obj.label150:setHeight(25);
    obj.label150:setText("Freq.");
    lfm_setPropAsString(obj.label150, "fontStyle",  "bold");
    obj.label150:setName("label150");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout31);
    obj.edit205:setVertTextAlign("center");
    obj.edit205:setLeft(282);
    obj.edit205:setTop(55);
    obj.edit205:setWidth(82);
    obj.edit205:setHeight(25);
    obj.edit205:setField("frequenciaP4");
    obj.edit205:setName("edit205");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout31);
    obj.label151:setLeft(370);
    obj.label151:setTop(6);
    obj.label151:setWidth(70);
    obj.label151:setHeight(25);
    obj.label151:setText("Acurácia");
    lfm_setPropAsString(obj.label151, "fontStyle",  "bold");
    obj.label151:setName("label151");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout31);
    obj.edit206:setVertTextAlign("center");
    obj.edit206:setLeft(425);
    obj.edit206:setTop(6);
    obj.edit206:setWidth(53);
    obj.edit206:setHeight(25);
    obj.edit206:setField("AccP4");
    obj.edit206:setType("number");
    obj.edit206:setName("edit206");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout31);
    obj.label152:setLeft(370);
    obj.label152:setTop(31);
    obj.label152:setWidth(70);
    obj.label152:setHeight(25);
    obj.label152:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label152, "fontStyle",  "bold");
    obj.label152:setName("label152");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout31);
    obj.edit207:setVertTextAlign("center");
    obj.edit207:setLeft(425);
    obj.edit207:setTop(31);
    obj.edit207:setWidth(53);
    obj.edit207:setHeight(25);
    obj.edit207:setField("ataqueP4");
    obj.edit207:setType("number");
    obj.edit207:setName("edit207");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout31);
    obj.label153:setLeft(370);
    obj.label153:setTop(55);
    obj.label153:setWidth(70);
    obj.label153:setHeight(25);
    obj.label153:setText("D. Base");
    lfm_setPropAsString(obj.label153, "fontStyle",  "bold");
    obj.label153:setName("label153");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout31);
    obj.edit208:setVertTextAlign("center");
    obj.edit208:setLeft(425);
    obj.edit208:setTop(55);
    obj.edit208:setWidth(53);
    obj.edit208:setHeight(25);
    obj.edit208:setField("danoP4");
    obj.edit208:setName("edit208");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout31);
    obj.button20:setLeft(488);
    obj.button20:setTop(6);
    obj.button20:setWidth(82);
    obj.button20:setText("Acerto");
    obj.button20:setFontSize(11);
    lfm_setPropAsString(obj.button20, "fontStyle",  "bold");
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout31);
    obj.button21:setLeft(488);
    obj.button21:setTop(31);
    obj.button21:setWidth(82);
    obj.button21:setText("Dano");
    obj.button21:setFontSize(11);
    lfm_setPropAsString(obj.button21, "fontStyle",  "bold");
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout31);
    obj.button22:setLeft(488);
    obj.button22:setTop(55);
    obj.button22:setWidth(82);
    obj.button22:setText("Crítico");
    obj.button22:setFontSize(11);
    lfm_setPropAsString(obj.button22, "fontStyle",  "bold");
    obj.button22:setName("button22");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout31);
    obj.textEditor5:setLeft(575);
    obj.textEditor5:setTop(5);
    obj.textEditor5:setWidth(280);
    obj.textEditor5:setHeight(50);
    obj.textEditor5:setField("campoEfeitoGolpesP4");
    obj.textEditor5:setName("textEditor5");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout31);
    obj.label154:setLeft(575);
    obj.label154:setTop(55);
    obj.label154:setWidth(60);
    obj.label154:setHeight(25);
    obj.label154:setText("Aptidão");
    lfm_setPropAsString(obj.label154, "fontStyle",  "bold");
    obj.label154:setName("label154");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout31);
    obj.edit209:setVertTextAlign("center");
    obj.edit209:setLeft(625);
    obj.edit209:setTop(60);
    obj.edit209:setWidth(55);
    obj.edit209:setHeight(25);
    obj.edit209:setField("tipoContestP4");
    obj.edit209:setName("edit209");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout31);
    obj.label155:setLeft(685);
    obj.label155:setTop(55);
    obj.label155:setWidth(40);
    obj.label155:setHeight(25);
    obj.label155:setText("Conc.");
    lfm_setPropAsString(obj.label155, "fontStyle",  "bold");
    obj.label155:setName("label155");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout31);
    obj.edit210:setVertTextAlign("center");
    obj.edit210:setLeft(730);
    obj.edit210:setTop(60);
    obj.edit210:setWidth(125);
    obj.edit210:setHeight(25);
    obj.edit210:setField("efeitoContestP4");
    obj.edit210:setName("edit210");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout27);
    obj.layout32:setLeft(2);
    obj.layout32:setTop(383);
    obj.layout32:setWidth(880);
    obj.layout32:setHeight(92);
    obj.layout32:setName("layout32");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout32);
    obj.rectangle49:setAlign("client");
    obj.rectangle49:setColor("black");
    obj.rectangle49:setName("rectangle49");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout32);
    obj.label156:setLeft(5);
    obj.label156:setTop(5);
    obj.label156:setWidth(70);
    obj.label156:setHeight(25);
    obj.label156:setText("Golpe");
    lfm_setPropAsString(obj.label156, "fontStyle",  "bold");
    obj.label156:setName("label156");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout32);
    obj.edit211:setVertTextAlign("center");
    obj.edit211:setLeft(75);
    obj.edit211:setTop(5);
    obj.edit211:setWidth(160);
    obj.edit211:setHeight(25);
    obj.edit211:setField("golpeP5");
    obj.edit211:setName("edit211");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout32);
    obj.label157:setLeft(5);
    obj.label157:setTop(30);
    obj.label157:setWidth(80);
    obj.label157:setHeight(25);
    obj.label157:setText("Descritores");
    lfm_setPropAsString(obj.label157, "fontStyle",  "bold");
    obj.label157:setName("label157");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout32);
    obj.edit212:setVertTextAlign("center");
    obj.edit212:setLeft(75);
    obj.edit212:setTop(30);
    obj.edit212:setWidth(160);
    obj.edit212:setHeight(25);
    obj.edit212:setField("DescritoresP5");
    obj.edit212:setName("edit212");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout32);
    obj.label158:setLeft(5);
    obj.label158:setTop(55);
    obj.label158:setWidth(70);
    obj.label158:setHeight(25);
    obj.label158:setText("Alcance");
    lfm_setPropAsString(obj.label158, "fontStyle",  "bold");
    obj.label158:setName("label158");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout32);
    obj.edit213:setVertTextAlign("center");
    obj.edit213:setLeft(75);
    obj.edit213:setTop(55);
    obj.edit213:setWidth(160);
    obj.edit213:setHeight(25);
    obj.edit213:setField("alcanceP5");
    obj.edit213:setName("edit213");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout32);
    obj.label159:setLeft(240);
    obj.label159:setTop(6);
    obj.label159:setWidth(50);
    obj.label159:setHeight(25);
    obj.label159:setText("Tipo");
    lfm_setPropAsString(obj.label159, "fontStyle",  "bold");
    obj.label159:setName("label159");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout32);
    obj.edit214:setVertTextAlign("center");
    obj.edit214:setLeft(282);
    obj.edit214:setTop(6);
    obj.edit214:setWidth(82);
    obj.edit214:setHeight(25);
    obj.edit214:setField("tipoP5");
    obj.edit214:setName("edit214");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout32);
    obj.label160:setLeft(240);
    obj.label160:setTop(31);
    obj.label160:setWidth(50);
    obj.label160:setHeight(25);
    obj.label160:setText("Classe");
    lfm_setPropAsString(obj.label160, "fontStyle",  "bold");
    obj.label160:setName("label160");

    obj.comboBox22 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout32);
    obj.comboBox22:setLeft(282);
    obj.comboBox22:setTop(31);
    obj.comboBox22:setWidth(82);
    obj.comboBox22:setHeight(25);
    obj.comboBox22:setField("classeP5");
    obj.comboBox22:setHorzTextAlign("center");
    obj.comboBox22:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox22:setValues({'1', '2', '3'});
    obj.comboBox22:setName("comboBox22");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout32);
    obj.label161:setLeft(240);
    obj.label161:setTop(55);
    obj.label161:setWidth(50);
    obj.label161:setHeight(25);
    obj.label161:setText("Freq.");
    lfm_setPropAsString(obj.label161, "fontStyle",  "bold");
    obj.label161:setName("label161");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout32);
    obj.edit215:setVertTextAlign("center");
    obj.edit215:setLeft(282);
    obj.edit215:setTop(55);
    obj.edit215:setWidth(82);
    obj.edit215:setHeight(25);
    obj.edit215:setField("frequenciaP5");
    obj.edit215:setName("edit215");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout32);
    obj.label162:setLeft(370);
    obj.label162:setTop(6);
    obj.label162:setWidth(70);
    obj.label162:setHeight(25);
    obj.label162:setText("Acurácia");
    lfm_setPropAsString(obj.label162, "fontStyle",  "bold");
    obj.label162:setName("label162");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout32);
    obj.edit216:setVertTextAlign("center");
    obj.edit216:setLeft(425);
    obj.edit216:setTop(6);
    obj.edit216:setWidth(53);
    obj.edit216:setHeight(25);
    obj.edit216:setField("AccP5");
    obj.edit216:setType("number");
    obj.edit216:setName("edit216");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout32);
    obj.label163:setLeft(370);
    obj.label163:setTop(31);
    obj.label163:setWidth(70);
    obj.label163:setHeight(25);
    obj.label163:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label163, "fontStyle",  "bold");
    obj.label163:setName("label163");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout32);
    obj.edit217:setVertTextAlign("center");
    obj.edit217:setLeft(425);
    obj.edit217:setTop(31);
    obj.edit217:setWidth(53);
    obj.edit217:setHeight(25);
    obj.edit217:setField("ataqueP5");
    obj.edit217:setType("number");
    obj.edit217:setName("edit217");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout32);
    obj.label164:setLeft(370);
    obj.label164:setTop(55);
    obj.label164:setWidth(70);
    obj.label164:setHeight(25);
    obj.label164:setText("D. Base");
    lfm_setPropAsString(obj.label164, "fontStyle",  "bold");
    obj.label164:setName("label164");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout32);
    obj.edit218:setVertTextAlign("center");
    obj.edit218:setLeft(425);
    obj.edit218:setTop(55);
    obj.edit218:setWidth(53);
    obj.edit218:setHeight(25);
    obj.edit218:setField("danoP5");
    obj.edit218:setName("edit218");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout32);
    obj.button23:setLeft(488);
    obj.button23:setTop(6);
    obj.button23:setWidth(82);
    obj.button23:setText("Acerto");
    obj.button23:setFontSize(11);
    lfm_setPropAsString(obj.button23, "fontStyle",  "bold");
    obj.button23:setName("button23");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout32);
    obj.button24:setLeft(488);
    obj.button24:setTop(31);
    obj.button24:setWidth(82);
    obj.button24:setText("Dano");
    obj.button24:setFontSize(11);
    lfm_setPropAsString(obj.button24, "fontStyle",  "bold");
    obj.button24:setName("button24");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout32);
    obj.button25:setLeft(488);
    obj.button25:setTop(55);
    obj.button25:setWidth(82);
    obj.button25:setText("Crítico");
    obj.button25:setFontSize(11);
    lfm_setPropAsString(obj.button25, "fontStyle",  "bold");
    obj.button25:setName("button25");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout32);
    obj.textEditor6:setLeft(575);
    obj.textEditor6:setTop(5);
    obj.textEditor6:setWidth(280);
    obj.textEditor6:setHeight(50);
    obj.textEditor6:setField("campoEfeitoGolpesP5");
    obj.textEditor6:setName("textEditor6");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout32);
    obj.label165:setLeft(575);
    obj.label165:setTop(55);
    obj.label165:setWidth(60);
    obj.label165:setHeight(25);
    obj.label165:setText("Aptidão");
    lfm_setPropAsString(obj.label165, "fontStyle",  "bold");
    obj.label165:setName("label165");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout32);
    obj.edit219:setVertTextAlign("center");
    obj.edit219:setLeft(625);
    obj.edit219:setTop(60);
    obj.edit219:setWidth(55);
    obj.edit219:setHeight(25);
    obj.edit219:setField("tipoContestP5");
    obj.edit219:setName("edit219");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout32);
    obj.label166:setLeft(685);
    obj.label166:setTop(55);
    obj.label166:setWidth(40);
    obj.label166:setHeight(25);
    obj.label166:setText("Conc.");
    lfm_setPropAsString(obj.label166, "fontStyle",  "bold");
    obj.label166:setName("label166");

    obj.edit220 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout32);
    obj.edit220:setVertTextAlign("center");
    obj.edit220:setLeft(730);
    obj.edit220:setTop(60);
    obj.edit220:setWidth(125);
    obj.edit220:setHeight(25);
    obj.edit220:setField("efeitoContestP5");
    obj.edit220:setName("edit220");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout27);
    obj.layout33:setLeft(2);
    obj.layout33:setTop(478);
    obj.layout33:setWidth(880);
    obj.layout33:setHeight(92);
    obj.layout33:setName("layout33");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout33);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setName("rectangle50");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout33);
    obj.label167:setLeft(5);
    obj.label167:setTop(5);
    obj.label167:setWidth(70);
    obj.label167:setHeight(25);
    obj.label167:setText("Golpe");
    lfm_setPropAsString(obj.label167, "fontStyle",  "bold");
    obj.label167:setName("label167");

    obj.edit221 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout33);
    obj.edit221:setVertTextAlign("center");
    obj.edit221:setLeft(75);
    obj.edit221:setTop(5);
    obj.edit221:setWidth(160);
    obj.edit221:setHeight(25);
    obj.edit221:setField("golpeP6");
    obj.edit221:setName("edit221");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout33);
    obj.label168:setLeft(5);
    obj.label168:setTop(30);
    obj.label168:setWidth(80);
    obj.label168:setHeight(25);
    obj.label168:setText("Descritores");
    lfm_setPropAsString(obj.label168, "fontStyle",  "bold");
    obj.label168:setName("label168");

    obj.edit222 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout33);
    obj.edit222:setVertTextAlign("center");
    obj.edit222:setLeft(75);
    obj.edit222:setTop(30);
    obj.edit222:setWidth(160);
    obj.edit222:setHeight(25);
    obj.edit222:setField("DescritoresP6");
    obj.edit222:setName("edit222");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout33);
    obj.label169:setLeft(5);
    obj.label169:setTop(55);
    obj.label169:setWidth(70);
    obj.label169:setHeight(25);
    obj.label169:setText("Alcance");
    lfm_setPropAsString(obj.label169, "fontStyle",  "bold");
    obj.label169:setName("label169");

    obj.edit223 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout33);
    obj.edit223:setVertTextAlign("center");
    obj.edit223:setLeft(75);
    obj.edit223:setTop(55);
    obj.edit223:setWidth(160);
    obj.edit223:setHeight(25);
    obj.edit223:setField("alcanceP6");
    obj.edit223:setName("edit223");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout33);
    obj.label170:setLeft(240);
    obj.label170:setTop(6);
    obj.label170:setWidth(50);
    obj.label170:setHeight(25);
    obj.label170:setText("Tipo");
    lfm_setPropAsString(obj.label170, "fontStyle",  "bold");
    obj.label170:setName("label170");

    obj.edit224 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout33);
    obj.edit224:setVertTextAlign("center");
    obj.edit224:setLeft(282);
    obj.edit224:setTop(6);
    obj.edit224:setWidth(82);
    obj.edit224:setHeight(25);
    obj.edit224:setField("tipoP6");
    obj.edit224:setName("edit224");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout33);
    obj.label171:setLeft(240);
    obj.label171:setTop(31);
    obj.label171:setWidth(50);
    obj.label171:setHeight(25);
    obj.label171:setText("Classe");
    lfm_setPropAsString(obj.label171, "fontStyle",  "bold");
    obj.label171:setName("label171");

    obj.comboBox23 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout33);
    obj.comboBox23:setLeft(282);
    obj.comboBox23:setTop(31);
    obj.comboBox23:setWidth(82);
    obj.comboBox23:setHeight(25);
    obj.comboBox23:setField("classeP6");
    obj.comboBox23:setHorzTextAlign("center");
    obj.comboBox23:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox23:setValues({'1', '2', '3'});
    obj.comboBox23:setName("comboBox23");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout33);
    obj.label172:setLeft(240);
    obj.label172:setTop(55);
    obj.label172:setWidth(50);
    obj.label172:setHeight(25);
    obj.label172:setText("Freq.");
    lfm_setPropAsString(obj.label172, "fontStyle",  "bold");
    obj.label172:setName("label172");

    obj.edit225 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout33);
    obj.edit225:setVertTextAlign("center");
    obj.edit225:setLeft(282);
    obj.edit225:setTop(55);
    obj.edit225:setWidth(82);
    obj.edit225:setHeight(25);
    obj.edit225:setField("frequenciaP6");
    obj.edit225:setName("edit225");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout33);
    obj.label173:setLeft(370);
    obj.label173:setTop(6);
    obj.label173:setWidth(70);
    obj.label173:setHeight(25);
    obj.label173:setText("Acurácia");
    lfm_setPropAsString(obj.label173, "fontStyle",  "bold");
    obj.label173:setName("label173");

    obj.edit226 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout33);
    obj.edit226:setVertTextAlign("center");
    obj.edit226:setLeft(425);
    obj.edit226:setTop(6);
    obj.edit226:setWidth(53);
    obj.edit226:setHeight(25);
    obj.edit226:setField("AccP6");
    obj.edit226:setType("number");
    obj.edit226:setName("edit226");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout33);
    obj.label174:setLeft(370);
    obj.label174:setTop(31);
    obj.label174:setWidth(70);
    obj.label174:setHeight(25);
    obj.label174:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label174, "fontStyle",  "bold");
    obj.label174:setName("label174");

    obj.edit227 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout33);
    obj.edit227:setVertTextAlign("center");
    obj.edit227:setLeft(425);
    obj.edit227:setTop(31);
    obj.edit227:setWidth(53);
    obj.edit227:setHeight(25);
    obj.edit227:setField("ataqueP6");
    obj.edit227:setType("number");
    obj.edit227:setName("edit227");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout33);
    obj.label175:setLeft(370);
    obj.label175:setTop(55);
    obj.label175:setWidth(70);
    obj.label175:setHeight(25);
    obj.label175:setText("D. Base");
    lfm_setPropAsString(obj.label175, "fontStyle",  "bold");
    obj.label175:setName("label175");

    obj.edit228 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout33);
    obj.edit228:setVertTextAlign("center");
    obj.edit228:setLeft(425);
    obj.edit228:setTop(55);
    obj.edit228:setWidth(53);
    obj.edit228:setHeight(25);
    obj.edit228:setField("danoP6");
    obj.edit228:setName("edit228");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout33);
    obj.button26:setLeft(488);
    obj.button26:setTop(6);
    obj.button26:setWidth(82);
    obj.button26:setText("Acerto");
    obj.button26:setFontSize(11);
    lfm_setPropAsString(obj.button26, "fontStyle",  "bold");
    obj.button26:setName("button26");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout33);
    obj.button27:setLeft(488);
    obj.button27:setTop(31);
    obj.button27:setWidth(82);
    obj.button27:setText("Dano");
    obj.button27:setFontSize(11);
    lfm_setPropAsString(obj.button27, "fontStyle",  "bold");
    obj.button27:setName("button27");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout33);
    obj.button28:setLeft(488);
    obj.button28:setTop(55);
    obj.button28:setWidth(82);
    obj.button28:setText("Crítico");
    obj.button28:setFontSize(11);
    lfm_setPropAsString(obj.button28, "fontStyle",  "bold");
    obj.button28:setName("button28");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout33);
    obj.textEditor7:setLeft(575);
    obj.textEditor7:setTop(5);
    obj.textEditor7:setWidth(280);
    obj.textEditor7:setHeight(50);
    obj.textEditor7:setField("campoEfeitoGolpesP6");
    obj.textEditor7:setName("textEditor7");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout33);
    obj.label176:setLeft(575);
    obj.label176:setTop(55);
    obj.label176:setWidth(60);
    obj.label176:setHeight(25);
    obj.label176:setText("Aptidão");
    lfm_setPropAsString(obj.label176, "fontStyle",  "bold");
    obj.label176:setName("label176");

    obj.edit229 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout33);
    obj.edit229:setVertTextAlign("center");
    obj.edit229:setLeft(625);
    obj.edit229:setTop(60);
    obj.edit229:setWidth(55);
    obj.edit229:setHeight(25);
    obj.edit229:setField("tipoContestP6");
    obj.edit229:setName("edit229");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout33);
    obj.label177:setLeft(685);
    obj.label177:setTop(55);
    obj.label177:setWidth(40);
    obj.label177:setHeight(25);
    obj.label177:setText("Conc.");
    lfm_setPropAsString(obj.label177, "fontStyle",  "bold");
    obj.label177:setName("label177");

    obj.edit230 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout33);
    obj.edit230:setVertTextAlign("center");
    obj.edit230:setLeft(730);
    obj.edit230:setTop(60);
    obj.edit230:setWidth(125);
    obj.edit230:setHeight(25);
    obj.edit230:setField("efeitoContestP6");
    obj.edit230:setName("edit230");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout27);
    obj.layout34:setLeft(2);
    obj.layout34:setTop(573);
    obj.layout34:setWidth(880);
    obj.layout34:setHeight(92);
    obj.layout34:setName("layout34");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout34);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setName("rectangle51");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout34);
    obj.label178:setLeft(5);
    obj.label178:setTop(5);
    obj.label178:setWidth(70);
    obj.label178:setHeight(25);
    obj.label178:setText("Golpe");
    lfm_setPropAsString(obj.label178, "fontStyle",  "bold");
    obj.label178:setName("label178");

    obj.edit231 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout34);
    obj.edit231:setVertTextAlign("center");
    obj.edit231:setLeft(75);
    obj.edit231:setTop(5);
    obj.edit231:setWidth(160);
    obj.edit231:setHeight(25);
    obj.edit231:setField("golpeP7");
    obj.edit231:setName("edit231");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout34);
    obj.label179:setLeft(5);
    obj.label179:setTop(30);
    obj.label179:setWidth(80);
    obj.label179:setHeight(25);
    obj.label179:setText("Descritores");
    lfm_setPropAsString(obj.label179, "fontStyle",  "bold");
    obj.label179:setName("label179");

    obj.edit232 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout34);
    obj.edit232:setVertTextAlign("center");
    obj.edit232:setLeft(75);
    obj.edit232:setTop(30);
    obj.edit232:setWidth(160);
    obj.edit232:setHeight(25);
    obj.edit232:setField("DescritoresP7");
    obj.edit232:setName("edit232");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout34);
    obj.label180:setLeft(5);
    obj.label180:setTop(55);
    obj.label180:setWidth(70);
    obj.label180:setHeight(25);
    obj.label180:setText("Alcance");
    lfm_setPropAsString(obj.label180, "fontStyle",  "bold");
    obj.label180:setName("label180");

    obj.edit233 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout34);
    obj.edit233:setVertTextAlign("center");
    obj.edit233:setLeft(75);
    obj.edit233:setTop(55);
    obj.edit233:setWidth(160);
    obj.edit233:setHeight(25);
    obj.edit233:setField("alcanceP7");
    obj.edit233:setName("edit233");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout34);
    obj.label181:setLeft(240);
    obj.label181:setTop(6);
    obj.label181:setWidth(50);
    obj.label181:setHeight(25);
    obj.label181:setText("Tipo");
    lfm_setPropAsString(obj.label181, "fontStyle",  "bold");
    obj.label181:setName("label181");

    obj.edit234 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout34);
    obj.edit234:setVertTextAlign("center");
    obj.edit234:setLeft(282);
    obj.edit234:setTop(6);
    obj.edit234:setWidth(82);
    obj.edit234:setHeight(25);
    obj.edit234:setField("tipoP7");
    obj.edit234:setName("edit234");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout34);
    obj.label182:setLeft(240);
    obj.label182:setTop(31);
    obj.label182:setWidth(50);
    obj.label182:setHeight(25);
    obj.label182:setText("Classe");
    lfm_setPropAsString(obj.label182, "fontStyle",  "bold");
    obj.label182:setName("label182");

    obj.comboBox24 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.layout34);
    obj.comboBox24:setLeft(282);
    obj.comboBox24:setTop(31);
    obj.comboBox24:setWidth(82);
    obj.comboBox24:setHeight(25);
    obj.comboBox24:setField("classeP7");
    obj.comboBox24:setHorzTextAlign("center");
    obj.comboBox24:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox24:setValues({'1', '2', '3'});
    obj.comboBox24:setName("comboBox24");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout34);
    obj.label183:setLeft(240);
    obj.label183:setTop(55);
    obj.label183:setWidth(50);
    obj.label183:setHeight(25);
    obj.label183:setText("Freq.");
    lfm_setPropAsString(obj.label183, "fontStyle",  "bold");
    obj.label183:setName("label183");

    obj.edit235 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout34);
    obj.edit235:setVertTextAlign("center");
    obj.edit235:setLeft(282);
    obj.edit235:setTop(55);
    obj.edit235:setWidth(82);
    obj.edit235:setHeight(25);
    obj.edit235:setField("frequenciaP7");
    obj.edit235:setName("edit235");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout34);
    obj.label184:setLeft(370);
    obj.label184:setTop(6);
    obj.label184:setWidth(70);
    obj.label184:setHeight(25);
    obj.label184:setText("Acurácia");
    lfm_setPropAsString(obj.label184, "fontStyle",  "bold");
    obj.label184:setName("label184");

    obj.edit236 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout34);
    obj.edit236:setVertTextAlign("center");
    obj.edit236:setLeft(425);
    obj.edit236:setTop(6);
    obj.edit236:setWidth(53);
    obj.edit236:setHeight(25);
    obj.edit236:setField("AccP7");
    obj.edit236:setType("number");
    obj.edit236:setName("edit236");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout34);
    obj.label185:setLeft(370);
    obj.label185:setTop(31);
    obj.label185:setWidth(70);
    obj.label185:setHeight(25);
    obj.label185:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label185, "fontStyle",  "bold");
    obj.label185:setName("label185");

    obj.edit237 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout34);
    obj.edit237:setVertTextAlign("center");
    obj.edit237:setLeft(425);
    obj.edit237:setTop(31);
    obj.edit237:setWidth(53);
    obj.edit237:setHeight(25);
    obj.edit237:setField("ataqueP7");
    obj.edit237:setType("number");
    obj.edit237:setName("edit237");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout34);
    obj.label186:setLeft(370);
    obj.label186:setTop(55);
    obj.label186:setWidth(70);
    obj.label186:setHeight(25);
    obj.label186:setText("D. Base");
    lfm_setPropAsString(obj.label186, "fontStyle",  "bold");
    obj.label186:setName("label186");

    obj.edit238 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout34);
    obj.edit238:setVertTextAlign("center");
    obj.edit238:setLeft(425);
    obj.edit238:setTop(55);
    obj.edit238:setWidth(53);
    obj.edit238:setHeight(25);
    obj.edit238:setField("danoP7");
    obj.edit238:setName("edit238");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout34);
    obj.button29:setLeft(488);
    obj.button29:setTop(6);
    obj.button29:setWidth(82);
    obj.button29:setText("Acerto");
    obj.button29:setFontSize(11);
    lfm_setPropAsString(obj.button29, "fontStyle",  "bold");
    obj.button29:setName("button29");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout34);
    obj.button30:setLeft(488);
    obj.button30:setTop(31);
    obj.button30:setWidth(82);
    obj.button30:setText("Dano");
    obj.button30:setFontSize(11);
    lfm_setPropAsString(obj.button30, "fontStyle",  "bold");
    obj.button30:setName("button30");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout34);
    obj.button31:setLeft(488);
    obj.button31:setTop(55);
    obj.button31:setWidth(82);
    obj.button31:setText("Crítico");
    obj.button31:setFontSize(11);
    lfm_setPropAsString(obj.button31, "fontStyle",  "bold");
    obj.button31:setName("button31");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout34);
    obj.textEditor8:setLeft(575);
    obj.textEditor8:setTop(5);
    obj.textEditor8:setWidth(280);
    obj.textEditor8:setHeight(50);
    obj.textEditor8:setField("campoEfeitoGolpesP7");
    obj.textEditor8:setName("textEditor8");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout34);
    obj.label187:setLeft(575);
    obj.label187:setTop(55);
    obj.label187:setWidth(60);
    obj.label187:setHeight(25);
    obj.label187:setText("Aptidão");
    lfm_setPropAsString(obj.label187, "fontStyle",  "bold");
    obj.label187:setName("label187");

    obj.edit239 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout34);
    obj.edit239:setVertTextAlign("center");
    obj.edit239:setLeft(625);
    obj.edit239:setTop(60);
    obj.edit239:setWidth(55);
    obj.edit239:setHeight(25);
    obj.edit239:setField("tipoContestP7");
    obj.edit239:setName("edit239");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout34);
    obj.label188:setLeft(685);
    obj.label188:setTop(55);
    obj.label188:setWidth(40);
    obj.label188:setHeight(25);
    obj.label188:setText("Conc.");
    lfm_setPropAsString(obj.label188, "fontStyle",  "bold");
    obj.label188:setName("label188");

    obj.edit240 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout34);
    obj.edit240:setVertTextAlign("center");
    obj.edit240:setLeft(730);
    obj.edit240:setTop(60);
    obj.edit240:setWidth(125);
    obj.edit240:setHeight(25);
    obj.edit240:setField("efeitoContestP7");
    obj.edit240:setName("edit240");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout27);
    obj.layout35:setLeft(2);
    obj.layout35:setTop(668);
    obj.layout35:setWidth(880);
    obj.layout35:setHeight(92);
    obj.layout35:setName("layout35");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout35);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("black");
    obj.rectangle52:setName("rectangle52");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout35);
    obj.label189:setLeft(5);
    obj.label189:setTop(5);
    obj.label189:setWidth(70);
    obj.label189:setHeight(25);
    obj.label189:setText("Golpe");
    lfm_setPropAsString(obj.label189, "fontStyle",  "bold");
    obj.label189:setName("label189");

    obj.edit241 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout35);
    obj.edit241:setVertTextAlign("center");
    obj.edit241:setLeft(75);
    obj.edit241:setTop(5);
    obj.edit241:setWidth(160);
    obj.edit241:setHeight(25);
    obj.edit241:setField("golpeP8");
    obj.edit241:setName("edit241");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout35);
    obj.label190:setLeft(5);
    obj.label190:setTop(30);
    obj.label190:setWidth(80);
    obj.label190:setHeight(25);
    obj.label190:setText("Descritores");
    lfm_setPropAsString(obj.label190, "fontStyle",  "bold");
    obj.label190:setName("label190");

    obj.edit242 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout35);
    obj.edit242:setVertTextAlign("center");
    obj.edit242:setLeft(75);
    obj.edit242:setTop(30);
    obj.edit242:setWidth(160);
    obj.edit242:setHeight(25);
    obj.edit242:setField("DescritoresP8");
    obj.edit242:setName("edit242");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout35);
    obj.label191:setLeft(5);
    obj.label191:setTop(55);
    obj.label191:setWidth(70);
    obj.label191:setHeight(25);
    obj.label191:setText("Alcance");
    lfm_setPropAsString(obj.label191, "fontStyle",  "bold");
    obj.label191:setName("label191");

    obj.edit243 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout35);
    obj.edit243:setVertTextAlign("center");
    obj.edit243:setLeft(75);
    obj.edit243:setTop(55);
    obj.edit243:setWidth(160);
    obj.edit243:setHeight(25);
    obj.edit243:setField("alcanceP8");
    obj.edit243:setName("edit243");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout35);
    obj.label192:setLeft(240);
    obj.label192:setTop(6);
    obj.label192:setWidth(50);
    obj.label192:setHeight(25);
    obj.label192:setText("Tipo");
    lfm_setPropAsString(obj.label192, "fontStyle",  "bold");
    obj.label192:setName("label192");

    obj.edit244 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout35);
    obj.edit244:setVertTextAlign("center");
    obj.edit244:setLeft(282);
    obj.edit244:setTop(6);
    obj.edit244:setWidth(82);
    obj.edit244:setHeight(25);
    obj.edit244:setField("tipoP8");
    obj.edit244:setName("edit244");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout35);
    obj.label193:setLeft(240);
    obj.label193:setTop(31);
    obj.label193:setWidth(50);
    obj.label193:setHeight(25);
    obj.label193:setText("Classe");
    lfm_setPropAsString(obj.label193, "fontStyle",  "bold");
    obj.label193:setName("label193");

    obj.comboBox25 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.layout35);
    obj.comboBox25:setLeft(282);
    obj.comboBox25:setTop(31);
    obj.comboBox25:setWidth(82);
    obj.comboBox25:setHeight(25);
    obj.comboBox25:setField("classeP8");
    obj.comboBox25:setHorzTextAlign("center");
    obj.comboBox25:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox25:setValues({'1', '2', '3'});
    obj.comboBox25:setName("comboBox25");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout35);
    obj.label194:setLeft(240);
    obj.label194:setTop(55);
    obj.label194:setWidth(50);
    obj.label194:setHeight(25);
    obj.label194:setText("Freq.");
    lfm_setPropAsString(obj.label194, "fontStyle",  "bold");
    obj.label194:setName("label194");

    obj.edit245 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout35);
    obj.edit245:setVertTextAlign("center");
    obj.edit245:setLeft(282);
    obj.edit245:setTop(55);
    obj.edit245:setWidth(82);
    obj.edit245:setHeight(25);
    obj.edit245:setField("frequenciaP8");
    obj.edit245:setName("edit245");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout35);
    obj.label195:setLeft(370);
    obj.label195:setTop(6);
    obj.label195:setWidth(70);
    obj.label195:setHeight(25);
    obj.label195:setText("Acurácia");
    lfm_setPropAsString(obj.label195, "fontStyle",  "bold");
    obj.label195:setName("label195");

    obj.edit246 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout35);
    obj.edit246:setVertTextAlign("center");
    obj.edit246:setLeft(425);
    obj.edit246:setTop(6);
    obj.edit246:setWidth(53);
    obj.edit246:setHeight(25);
    obj.edit246:setField("AccP8");
    obj.edit246:setType("number");
    obj.edit246:setName("edit246");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout35);
    obj.label196:setLeft(370);
    obj.label196:setTop(31);
    obj.label196:setWidth(70);
    obj.label196:setHeight(25);
    obj.label196:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label196, "fontStyle",  "bold");
    obj.label196:setName("label196");

    obj.edit247 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout35);
    obj.edit247:setVertTextAlign("center");
    obj.edit247:setLeft(425);
    obj.edit247:setTop(31);
    obj.edit247:setWidth(53);
    obj.edit247:setHeight(25);
    obj.edit247:setField("ataqueP8");
    obj.edit247:setType("number");
    obj.edit247:setName("edit247");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout35);
    obj.label197:setLeft(370);
    obj.label197:setTop(55);
    obj.label197:setWidth(70);
    obj.label197:setHeight(25);
    obj.label197:setText("D. Base");
    lfm_setPropAsString(obj.label197, "fontStyle",  "bold");
    obj.label197:setName("label197");

    obj.edit248 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout35);
    obj.edit248:setVertTextAlign("center");
    obj.edit248:setLeft(425);
    obj.edit248:setTop(55);
    obj.edit248:setWidth(53);
    obj.edit248:setHeight(25);
    obj.edit248:setField("danoP8");
    obj.edit248:setName("edit248");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout35);
    obj.button32:setLeft(488);
    obj.button32:setTop(6);
    obj.button32:setWidth(82);
    obj.button32:setText("Acerto");
    obj.button32:setFontSize(11);
    lfm_setPropAsString(obj.button32, "fontStyle",  "bold");
    obj.button32:setName("button32");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout35);
    obj.button33:setLeft(488);
    obj.button33:setTop(31);
    obj.button33:setWidth(82);
    obj.button33:setText("Dano");
    obj.button33:setFontSize(11);
    lfm_setPropAsString(obj.button33, "fontStyle",  "bold");
    obj.button33:setName("button33");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout35);
    obj.button34:setLeft(488);
    obj.button34:setTop(55);
    obj.button34:setWidth(82);
    obj.button34:setText("Crítico");
    obj.button34:setFontSize(11);
    lfm_setPropAsString(obj.button34, "fontStyle",  "bold");
    obj.button34:setName("button34");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout35);
    obj.textEditor9:setLeft(575);
    obj.textEditor9:setTop(5);
    obj.textEditor9:setWidth(280);
    obj.textEditor9:setHeight(50);
    obj.textEditor9:setField("campoEfeitoGolpesP8");
    obj.textEditor9:setName("textEditor9");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout35);
    obj.label198:setLeft(575);
    obj.label198:setTop(55);
    obj.label198:setWidth(60);
    obj.label198:setHeight(25);
    obj.label198:setText("Aptidão");
    lfm_setPropAsString(obj.label198, "fontStyle",  "bold");
    obj.label198:setName("label198");

    obj.edit249 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout35);
    obj.edit249:setVertTextAlign("center");
    obj.edit249:setLeft(625);
    obj.edit249:setTop(60);
    obj.edit249:setWidth(55);
    obj.edit249:setHeight(25);
    obj.edit249:setField("tipoContestP8");
    obj.edit249:setName("edit249");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout35);
    obj.label199:setLeft(685);
    obj.label199:setTop(55);
    obj.label199:setWidth(40);
    obj.label199:setHeight(25);
    obj.label199:setText("Conc.");
    lfm_setPropAsString(obj.label199, "fontStyle",  "bold");
    obj.label199:setName("label199");

    obj.edit250 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout35);
    obj.edit250:setVertTextAlign("center");
    obj.edit250:setLeft(730);
    obj.edit250:setTop(60);
    obj.edit250:setWidth(125);
    obj.edit250:setHeight(25);
    obj.edit250:setField("efeitoContestP8");
    obj.edit250:setName("edit250");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl2);
    obj.tab5:setTitle("Habilidades");
    obj.tab5:setName("tab5");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.tab5);
    obj.rectangle53:setAlign("top");
    obj.rectangle53:setColor("black");
    obj.rectangle53:setXradius(10);
    obj.rectangle53:setYradius(10);
    obj.rectangle53:setHeight(880);
    obj.rectangle53:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle53:setName("rectangle53");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle53);
    obj.layout36:setLeft(10);
    obj.layout36:setTop(10);
    obj.layout36:setHeight(600);
    obj.layout36:setWidth(900);
    obj.layout36:setName("layout36");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout36);
    obj.textEditor10:setLeft(07);
    obj.textEditor10:setTop(07);
    obj.textEditor10:setWidth(846);
    obj.textEditor10:setHeight(475);
    obj.textEditor10:setField("campoHabilidades2");
    obj.textEditor10:setName("textEditor10");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl2);
    obj.tab6:setTitle("Capacidades/Contests");
    obj.tab6:setName("tab6");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.tab6);
    obj.rectangle54:setAlign("top");
    obj.rectangle54:setColor("black");
    obj.rectangle54:setXradius(10);
    obj.rectangle54:setYradius(10);
    obj.rectangle54:setHeight(880);
    obj.rectangle54:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle54:setName("rectangle54");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle54);
    obj.layout37:setLeft(10);
    obj.layout37:setTop(10);
    obj.layout37:setHeight(600);
    obj.layout37:setWidth(900);
    obj.layout37:setName("layout37");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout37);
    obj.textEditor11:setLeft(07);
    obj.textEditor11:setTop(07);
    obj.textEditor11:setWidth(600);
    obj.textEditor11:setHeight(475);
    obj.textEditor11:setField("campoCapacidades2");
    obj.textEditor11:setName("textEditor11");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle54);
    obj.layout38:setLeft(660);
    obj.layout38:setTop(10);
    obj.layout38:setHeight(320);
    obj.layout38:setWidth(420);
    obj.layout38:setName("layout38");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout38);
    obj.label200:setLeft(000);
    obj.label200:setTop(000);
    obj.label200:setHeight(20);
    obj.label200:setWidth(80);
    obj.label200:setText("Aptidão");
    obj.label200:setAutoSize(true);
    lfm_setPropAsString(obj.label200, "fontStyle",  "bold");
    obj.label200:setName("label200");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout38);
    obj.label201:setLeft(85);
    obj.label201:setTop(000);
    obj.label201:setHeight(20);
    obj.label201:setWidth(30);
    obj.label201:setText("Rank");
    obj.label201:setAutoSize(true);
    obj.label201:setName("label201");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout38);
    obj.label202:setLeft(120);
    obj.label202:setTop(000);
    obj.label202:setHeight(20);
    obj.label202:setWidth(30);
    obj.label202:setText("Total");
    obj.label202:setAutoSize(true);
    obj.label202:setName("label202");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout38);
    obj.label203:setLeft(155);
    obj.label203:setTop(000);
    obj.label203:setHeight(20);
    obj.label203:setWidth(30);
    obj.label203:setText("Atual");
    obj.label203:setAutoSize(true);
    obj.label203:setName("label203");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout38);
    obj.label204:setLeft(000);
    obj.label204:setTop(025);
    obj.label204:setHeight(20);
    obj.label204:setWidth(80);
    obj.label204:setText("Estilo");
    obj.label204:setAutoSize(true);
    lfm_setPropAsString(obj.label204, "fontStyle",  "bold");
    obj.label204:setName("label204");

    obj.edit251 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout38);
    obj.edit251:setLeft(85);
    obj.edit251:setTop(025);
    obj.edit251:setHeight(20);
    obj.edit251:setWidth(30);
    obj.edit251:setField("Estilo_Rank");
    obj.edit251:setHorzTextAlign("center");
    obj.edit251:setType("number");
    obj.edit251:setName("edit251");

    obj.edit252 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout38);
    obj.edit252:setLeft(120);
    obj.edit252:setTop(025);
    obj.edit252:setHeight(20);
    obj.edit252:setWidth(30);
    obj.edit252:setField("Estilo_Total");
    obj.edit252:setHorzTextAlign("center");
    obj.edit252:setType("number");
    obj.edit252:setName("edit252");

    obj.edit253 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout38);
    obj.edit253:setLeft(155);
    obj.edit253:setTop(025);
    obj.edit253:setHeight(20);
    obj.edit253:setWidth(30);
    obj.edit253:setField("Estilo_Atual");
    obj.edit253:setHorzTextAlign("center");
    obj.edit253:setType("number");
    obj.edit253:setName("edit253");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout38);
    obj.label205:setLeft(000);
    obj.label205:setTop(050);
    obj.label205:setHeight(20);
    obj.label205:setWidth(80);
    obj.label205:setText("Beleza");
    obj.label205:setAutoSize(true);
    lfm_setPropAsString(obj.label205, "fontStyle",  "bold");
    obj.label205:setName("label205");

    obj.edit254 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout38);
    obj.edit254:setLeft(85);
    obj.edit254:setTop(050);
    obj.edit254:setHeight(20);
    obj.edit254:setWidth(30);
    obj.edit254:setField("Beleza_Rank");
    obj.edit254:setHorzTextAlign("center");
    obj.edit254:setType("number");
    obj.edit254:setName("edit254");

    obj.edit255 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout38);
    obj.edit255:setLeft(120);
    obj.edit255:setTop(050);
    obj.edit255:setHeight(20);
    obj.edit255:setWidth(30);
    obj.edit255:setField("Beleza_Total");
    obj.edit255:setHorzTextAlign("center");
    obj.edit255:setType("number");
    obj.edit255:setName("edit255");

    obj.edit256 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout38);
    obj.edit256:setLeft(155);
    obj.edit256:setTop(050);
    obj.edit256:setHeight(20);
    obj.edit256:setWidth(30);
    obj.edit256:setField("Beleza_Atual");
    obj.edit256:setHorzTextAlign("center");
    obj.edit256:setType("number");
    obj.edit256:setName("edit256");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout38);
    obj.label206:setLeft(000);
    obj.label206:setTop(075);
    obj.label206:setHeight(20);
    obj.label206:setWidth(80);
    obj.label206:setText("Ternura");
    obj.label206:setAutoSize(true);
    lfm_setPropAsString(obj.label206, "fontStyle",  "bold");
    obj.label206:setName("label206");

    obj.edit257 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout38);
    obj.edit257:setLeft(85);
    obj.edit257:setTop(075);
    obj.edit257:setHeight(20);
    obj.edit257:setWidth(30);
    obj.edit257:setField("Ternura_Rank");
    obj.edit257:setHorzTextAlign("center");
    obj.edit257:setType("number");
    obj.edit257:setName("edit257");

    obj.edit258 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout38);
    obj.edit258:setLeft(120);
    obj.edit258:setTop(075);
    obj.edit258:setHeight(20);
    obj.edit258:setWidth(30);
    obj.edit258:setField("Ternura_Total");
    obj.edit258:setHorzTextAlign("center");
    obj.edit258:setType("number");
    obj.edit258:setName("edit258");

    obj.edit259 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout38);
    obj.edit259:setLeft(155);
    obj.edit259:setTop(075);
    obj.edit259:setHeight(20);
    obj.edit259:setWidth(30);
    obj.edit259:setField("Ternura_Atual");
    obj.edit259:setHorzTextAlign("center");
    obj.edit259:setType("number");
    obj.edit259:setName("edit259");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout38);
    obj.label207:setLeft(000);
    obj.label207:setTop(100);
    obj.label207:setHeight(20);
    obj.label207:setWidth(80);
    obj.label207:setText("Perspicácia");
    obj.label207:setAutoSize(true);
    lfm_setPropAsString(obj.label207, "fontStyle",  "bold");
    obj.label207:setName("label207");

    obj.edit260 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout38);
    obj.edit260:setLeft(85);
    obj.edit260:setTop(100);
    obj.edit260:setHeight(20);
    obj.edit260:setWidth(30);
    obj.edit260:setField("Perspicácia_Rank");
    obj.edit260:setHorzTextAlign("center");
    obj.edit260:setType("number");
    obj.edit260:setName("edit260");

    obj.edit261 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout38);
    obj.edit261:setLeft(120);
    obj.edit261:setTop(100);
    obj.edit261:setHeight(20);
    obj.edit261:setWidth(30);
    obj.edit261:setField("Perspicácia_Total");
    obj.edit261:setHorzTextAlign("center");
    obj.edit261:setType("number");
    obj.edit261:setName("edit261");

    obj.edit262 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout38);
    obj.edit262:setLeft(155);
    obj.edit262:setTop(100);
    obj.edit262:setHeight(20);
    obj.edit262:setWidth(30);
    obj.edit262:setField("Perspicácia_Atual");
    obj.edit262:setHorzTextAlign("center");
    obj.edit262:setType("number");
    obj.edit262:setName("edit262");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout38);
    obj.label208:setLeft(000);
    obj.label208:setTop(125);
    obj.label208:setHeight(20);
    obj.label208:setWidth(80);
    obj.label208:setText("Vigor");
    obj.label208:setAutoSize(true);
    lfm_setPropAsString(obj.label208, "fontStyle",  "bold");
    obj.label208:setName("label208");

    obj.edit263 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout38);
    obj.edit263:setLeft(85);
    obj.edit263:setTop(125);
    obj.edit263:setHeight(20);
    obj.edit263:setWidth(30);
    obj.edit263:setField("Vigor_Rank");
    obj.edit263:setHorzTextAlign("center");
    obj.edit263:setType("number");
    obj.edit263:setName("edit263");

    obj.edit264 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout38);
    obj.edit264:setLeft(120);
    obj.edit264:setTop(125);
    obj.edit264:setHeight(20);
    obj.edit264:setWidth(30);
    obj.edit264:setField("Vigor_Total");
    obj.edit264:setHorzTextAlign("center");
    obj.edit264:setType("number");
    obj.edit264:setName("edit264");

    obj.edit265 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout38);
    obj.edit265:setLeft(155);
    obj.edit265:setTop(125);
    obj.edit265:setHeight(20);
    obj.edit265:setWidth(30);
    obj.edit265:setField("Vigor_Atual");
    obj.edit265:setHorzTextAlign("center");
    obj.edit265:setType("number");
    obj.edit265:setName("edit265");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle54);
    obj.layout39:setLeft(640);
    obj.layout39:setTop(175);
    obj.layout39:setHeight(350);
    obj.layout39:setWidth(250);
    obj.layout39:setName("layout39");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout39);
    obj.label209:setLeft(000);
    obj.label209:setTop(0);
    obj.label209:setHeight(20);
    obj.label209:setWidth(200);
    obj.label209:setText("Conquistas em Contests");
    obj.label209:setAutoSize(true);
    obj.label209:setHorzTextAlign("center");
    obj.label209:setName("label209");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout39);
    obj.textEditor12:setLeft(0);
    obj.textEditor12:setTop(25);
    obj.textEditor12:setHeight(290);
    obj.textEditor12:setWidth(225);
    obj.textEditor12:setField("CampoContestsP2");
    obj.textEditor12:setName("textEditor12");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Perícias");
    obj.tab7:setName("tab7");

    obj.frmPericias = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPericias:setParent(obj.tab7);
    obj.frmPericias:setName("frmPericias");
    obj.frmPericias:setAlign("client");
    obj.frmPericias:setTheme("dark");
    obj.frmPericias:setMargins({top=1});

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.frmPericias);
    obj.layout40:setLeft(000);
    obj.layout40:setTop(000);
    obj.layout40:setHeight(650);
    obj.layout40:setWidth(1100);
    obj.layout40:setName("layout40");

    obj.image53 = GUI.fromHandle(_obj_newObject("image"));
    obj.image53:setParent(obj.layout40);
    obj.image53:setLeft(000);
    obj.image53:setTop(000);
    obj.image53:setHeight(650);
    obj.image53:setWidth(1100);
    obj.image53:setSRC("/img/Pokeball.jpg");
    obj.image53:setStyle("autoFit");
    obj.image53:setName("image53");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.frmPericias);
    obj.layout41:setLeft(010);
    obj.layout41:setTop(030);
    obj.layout41:setHeight(150);
    obj.layout41:setWidth(300);
    obj.layout41:setName("layout41");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout41);
    obj.label210:setTop(00);
    obj.label210:setLeft(05);
    obj.label210:setWidth(20);
    obj.label210:setHeight(20);
    obj.label210:setText("0");
    obj.label210:setAutoSize(true);
    obj.label210:setName("label210");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout41);
    obj.label211:setTop(00);
    obj.label211:setLeft(30);
    obj.label211:setWidth(20);
    obj.label211:setHeight(20);
    obj.label211:setText("1");
    obj.label211:setAutoSize(true);
    obj.label211:setName("label211");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout41);
    obj.label212:setTop(00);
    obj.label212:setLeft(55);
    obj.label212:setWidth(20);
    obj.label212:setHeight(20);
    obj.label212:setText("2");
    obj.label212:setAutoSize(true);
    obj.label212:setName("label212");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout41);
    obj.label213:setLeft(75);
    obj.label213:setTop(00);
    obj.label213:setHeight(20);
    obj.label213:setWidth(120);
    obj.label213:setText("Perícias de Ataque");
    obj.label213:setAutoSize(true);
    obj.label213:setName("label213");

    obj.radioButton1 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.layout41);
    obj.radioButton1:setTop(025);
    obj.radioButton1:setLeft(00);
    obj.radioButton1:setWidth(20);
    obj.radioButton1:setHeight(20);
    obj.radioButton1:setGroupName("grupoCorrida");
    obj.radioButton1:setField("perCorrida");
    obj.radioButton1:setFieldValue("0");
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.layout41);
    obj.radioButton2:setTop(025);
    obj.radioButton2:setLeft(25);
    obj.radioButton2:setWidth(20);
    obj.radioButton2:setHeight(20);
    obj.radioButton2:setGroupName("grupoCorrida");
    obj.radioButton2:setField("perCorrida");
    obj.radioButton2:setFieldValue("1");
    obj.radioButton2:setName("radioButton2");

    obj.radioButton3 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.layout41);
    obj.radioButton3:setTop(025);
    obj.radioButton3:setLeft(50);
    obj.radioButton3:setWidth(20);
    obj.radioButton3:setHeight(20);
    obj.radioButton3:setGroupName("grupoCorrida");
    obj.radioButton3:setField("perCorrida");
    obj.radioButton3:setFieldValue("2");
    obj.radioButton3:setName("radioButton3");

    obj.dataLink86 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink86:setParent(obj.layout41);
    obj.dataLink86:setField("perCorrida");
    obj.dataLink86:setDefaultValue("0");
    obj.dataLink86:setName("dataLink86");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout41);
    obj.button35:setLeft(75);
    obj.button35:setTop(025);
    obj.button35:setHeight(20);
    obj.button35:setWidth(120);
    obj.button35:setText("Corrida");
    obj.button35:setHorzTextAlign("leading");
    obj.button35:setName("button35");

    obj.radioButton4 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.layout41);
    obj.radioButton4:setTop(050);
    obj.radioButton4:setLeft(00);
    obj.radioButton4:setWidth(20);
    obj.radioButton4:setHeight(20);
    obj.radioButton4:setGroupName("grupoForca");
    obj.radioButton4:setField("perForca");
    obj.radioButton4:setFieldValue("0");
    obj.radioButton4:setName("radioButton4");

    obj.radioButton5 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.layout41);
    obj.radioButton5:setTop(050);
    obj.radioButton5:setLeft(25);
    obj.radioButton5:setWidth(20);
    obj.radioButton5:setHeight(20);
    obj.radioButton5:setGroupName("grupoForca");
    obj.radioButton5:setField("perForca");
    obj.radioButton5:setFieldValue("1");
    obj.radioButton5:setName("radioButton5");

    obj.radioButton6 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton6:setParent(obj.layout41);
    obj.radioButton6:setTop(050);
    obj.radioButton6:setLeft(50);
    obj.radioButton6:setWidth(20);
    obj.radioButton6:setHeight(20);
    obj.radioButton6:setGroupName("grupoForca");
    obj.radioButton6:setField("perForca");
    obj.radioButton6:setFieldValue("2");
    obj.radioButton6:setName("radioButton6");

    obj.dataLink87 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink87:setParent(obj.layout41);
    obj.dataLink87:setField("perForca");
    obj.dataLink87:setDefaultValue("0");
    obj.dataLink87:setName("dataLink87");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout41);
    obj.button36:setLeft(75);
    obj.button36:setTop(050);
    obj.button36:setHeight(20);
    obj.button36:setWidth(120);
    obj.button36:setText("Força");
    obj.button36:setHorzTextAlign("leading");
    obj.button36:setName("button36");

    obj.radioButton7 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton7:setParent(obj.layout41);
    obj.radioButton7:setTop(075);
    obj.radioButton7:setLeft(00);
    obj.radioButton7:setWidth(20);
    obj.radioButton7:setHeight(20);
    obj.radioButton7:setGroupName("grupoIntimidacao");
    obj.radioButton7:setField("perIntimidacao");
    obj.radioButton7:setFieldValue("0");
    obj.radioButton7:setName("radioButton7");

    obj.radioButton8 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton8:setParent(obj.layout41);
    obj.radioButton8:setTop(075);
    obj.radioButton8:setLeft(25);
    obj.radioButton8:setWidth(20);
    obj.radioButton8:setHeight(20);
    obj.radioButton8:setGroupName("grupoIntimidacao");
    obj.radioButton8:setField("perIntimidacao");
    obj.radioButton8:setFieldValue("1");
    obj.radioButton8:setName("radioButton8");

    obj.radioButton9 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton9:setParent(obj.layout41);
    obj.radioButton9:setTop(075);
    obj.radioButton9:setLeft(50);
    obj.radioButton9:setWidth(20);
    obj.radioButton9:setHeight(20);
    obj.radioButton9:setGroupName("grupoIntimidacao");
    obj.radioButton9:setField("perIntimidacao");
    obj.radioButton9:setFieldValue("2");
    obj.radioButton9:setName("radioButton9");

    obj.dataLink88 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink88:setParent(obj.layout41);
    obj.dataLink88:setField("perIntimidacao");
    obj.dataLink88:setDefaultValue("0");
    obj.dataLink88:setName("dataLink88");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout41);
    obj.button37:setLeft(75);
    obj.button37:setTop(075);
    obj.button37:setHeight(20);
    obj.button37:setWidth(120);
    obj.button37:setText("Intimidação");
    obj.button37:setHorzTextAlign("leading");
    obj.button37:setName("button37");

    obj.radioButton10 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton10:setParent(obj.layout41);
    obj.radioButton10:setTop(100);
    obj.radioButton10:setLeft(00);
    obj.radioButton10:setWidth(20);
    obj.radioButton10:setHeight(20);
    obj.radioButton10:setGroupName("grupoSalto");
    obj.radioButton10:setField("perSalto");
    obj.radioButton10:setFieldValue("0");
    obj.radioButton10:setName("radioButton10");

    obj.radioButton11 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton11:setParent(obj.layout41);
    obj.radioButton11:setTop(100);
    obj.radioButton11:setLeft(25);
    obj.radioButton11:setWidth(20);
    obj.radioButton11:setHeight(20);
    obj.radioButton11:setGroupName("grupoSalto");
    obj.radioButton11:setField("perSalto");
    obj.radioButton11:setFieldValue("1");
    obj.radioButton11:setName("radioButton11");

    obj.radioButton12 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton12:setParent(obj.layout41);
    obj.radioButton12:setTop(100);
    obj.radioButton12:setLeft(50);
    obj.radioButton12:setWidth(20);
    obj.radioButton12:setHeight(20);
    obj.radioButton12:setGroupName("grupoSalto");
    obj.radioButton12:setField("perSalto");
    obj.radioButton12:setFieldValue("2");
    obj.radioButton12:setName("radioButton12");

    obj.dataLink89 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink89:setParent(obj.layout41);
    obj.dataLink89:setField("perSalto");
    obj.dataLink89:setDefaultValue("0");
    obj.dataLink89:setName("dataLink89");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout41);
    obj.button38:setLeft(75);
    obj.button38:setTop(100);
    obj.button38:setHeight(20);
    obj.button38:setWidth(120);
    obj.button38:setText("Salto");
    obj.button38:setHorzTextAlign("leading");
    obj.button38:setName("button38");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.frmPericias);
    obj.layout42:setLeft(010);
    obj.layout42:setTop(250);
    obj.layout42:setHeight(150);
    obj.layout42:setWidth(300);
    obj.layout42:setName("layout42");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout42);
    obj.label214:setTop(00);
    obj.label214:setLeft(05);
    obj.label214:setWidth(20);
    obj.label214:setHeight(20);
    obj.label214:setText("0");
    obj.label214:setAutoSize(true);
    obj.label214:setName("label214");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout42);
    obj.label215:setTop(00);
    obj.label215:setLeft(30);
    obj.label215:setWidth(20);
    obj.label215:setHeight(20);
    obj.label215:setText("1");
    obj.label215:setAutoSize(true);
    obj.label215:setName("label215");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout42);
    obj.label216:setTop(00);
    obj.label216:setLeft(55);
    obj.label216:setWidth(20);
    obj.label216:setHeight(20);
    obj.label216:setText("2");
    obj.label216:setAutoSize(true);
    obj.label216:setName("label216");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout42);
    obj.label217:setLeft(75);
    obj.label217:setTop(00);
    obj.label217:setHeight(20);
    obj.label217:setWidth(120);
    obj.label217:setText("Perícias de Defesa");
    obj.label217:setAutoSize(true);
    obj.label217:setName("label217");

    obj.radioButton13 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton13:setParent(obj.layout42);
    obj.radioButton13:setTop(025);
    obj.radioButton13:setLeft(00);
    obj.radioButton13:setWidth(20);
    obj.radioButton13:setHeight(20);
    obj.radioButton13:setGroupName("grupoConcentra");
    obj.radioButton13:setField("perConcentra");
    obj.radioButton13:setFieldValue("0");
    obj.radioButton13:setName("radioButton13");

    obj.radioButton14 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton14:setParent(obj.layout42);
    obj.radioButton14:setTop(025);
    obj.radioButton14:setLeft(25);
    obj.radioButton14:setWidth(20);
    obj.radioButton14:setHeight(20);
    obj.radioButton14:setGroupName("grupoConcentra");
    obj.radioButton14:setField("perConcentra");
    obj.radioButton14:setFieldValue("1");
    obj.radioButton14:setName("radioButton14");

    obj.radioButton15 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton15:setParent(obj.layout42);
    obj.radioButton15:setTop(025);
    obj.radioButton15:setLeft(50);
    obj.radioButton15:setWidth(20);
    obj.radioButton15:setHeight(20);
    obj.radioButton15:setGroupName("grupoConcentra");
    obj.radioButton15:setField("perConcentra");
    obj.radioButton15:setFieldValue("2");
    obj.radioButton15:setName("radioButton15");

    obj.dataLink90 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink90:setParent(obj.layout42);
    obj.dataLink90:setField("perConcentra");
    obj.dataLink90:setDefaultValue("0");
    obj.dataLink90:setName("dataLink90");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout42);
    obj.button39:setLeft(75);
    obj.button39:setTop(025);
    obj.button39:setHeight(20);
    obj.button39:setWidth(120);
    obj.button39:setText("Concentração");
    obj.button39:setHorzTextAlign("leading");
    obj.button39:setName("button39");

    obj.radioButton16 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton16:setParent(obj.layout42);
    obj.radioButton16:setTop(050);
    obj.radioButton16:setLeft(00);
    obj.radioButton16:setWidth(20);
    obj.radioButton16:setHeight(20);
    obj.radioButton16:setGroupName("grupoDeflex");
    obj.radioButton16:setField("perDeflex");
    obj.radioButton16:setFieldValue("0");
    obj.radioButton16:setName("radioButton16");

    obj.radioButton17 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton17:setParent(obj.layout42);
    obj.radioButton17:setTop(050);
    obj.radioButton17:setLeft(25);
    obj.radioButton17:setWidth(20);
    obj.radioButton17:setHeight(20);
    obj.radioButton17:setGroupName("grupoDeflex");
    obj.radioButton17:setField("perDeflex");
    obj.radioButton17:setFieldValue("1");
    obj.radioButton17:setName("radioButton17");

    obj.radioButton18 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton18:setParent(obj.layout42);
    obj.radioButton18:setTop(050);
    obj.radioButton18:setLeft(50);
    obj.radioButton18:setWidth(20);
    obj.radioButton18:setHeight(20);
    obj.radioButton18:setGroupName("grupoDeflex");
    obj.radioButton18:setField("perDeflex");
    obj.radioButton18:setFieldValue("2");
    obj.radioButton18:setName("radioButton18");

    obj.dataLink91 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink91:setParent(obj.layout42);
    obj.dataLink91:setField("perDeflex");
    obj.dataLink91:setDefaultValue("0");
    obj.dataLink91:setName("dataLink91");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout42);
    obj.button40:setLeft(75);
    obj.button40:setTop(050);
    obj.button40:setHeight(20);
    obj.button40:setWidth(120);
    obj.button40:setText("Deflexão");
    obj.button40:setHorzTextAlign("leading");
    obj.button40:setName("button40");

    obj.radioButton19 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton19:setParent(obj.layout42);
    obj.radioButton19:setTop(075);
    obj.radioButton19:setLeft(00);
    obj.radioButton19:setWidth(20);
    obj.radioButton19:setHeight(20);
    obj.radioButton19:setGroupName("grupoIncansa");
    obj.radioButton19:setField("perIncansa");
    obj.radioButton19:setFieldValue("0");
    obj.radioButton19:setName("radioButton19");

    obj.radioButton20 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton20:setParent(obj.layout42);
    obj.radioButton20:setTop(075);
    obj.radioButton20:setLeft(25);
    obj.radioButton20:setWidth(20);
    obj.radioButton20:setHeight(20);
    obj.radioButton20:setGroupName("grupoIncansa");
    obj.radioButton20:setField("perIncansa");
    obj.radioButton20:setFieldValue("1");
    obj.radioButton20:setName("radioButton20");

    obj.radioButton21 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton21:setParent(obj.layout42);
    obj.radioButton21:setTop(075);
    obj.radioButton21:setLeft(50);
    obj.radioButton21:setWidth(20);
    obj.radioButton21:setHeight(20);
    obj.radioButton21:setGroupName("grupoIncansa");
    obj.radioButton21:setField("perIncansa");
    obj.radioButton21:setFieldValue("2");
    obj.radioButton21:setName("radioButton21");

    obj.dataLink92 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink92:setParent(obj.layout42);
    obj.dataLink92:setField("perIncansa");
    obj.dataLink92:setDefaultValue("0");
    obj.dataLink92:setName("dataLink92");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout42);
    obj.button41:setLeft(75);
    obj.button41:setTop(075);
    obj.button41:setHeight(20);
    obj.button41:setWidth(120);
    obj.button41:setText("Incansável");
    obj.button41:setHorzTextAlign("leading");
    obj.button41:setName("button41");

    obj.radioButton22 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton22:setParent(obj.layout42);
    obj.radioButton22:setTop(100);
    obj.radioButton22:setLeft(00);
    obj.radioButton22:setWidth(20);
    obj.radioButton22:setHeight(20);
    obj.radioButton22:setGroupName("grupoRegen");
    obj.radioButton22:setField("perRegen");
    obj.radioButton22:setFieldValue("0");
    obj.radioButton22:setName("radioButton22");

    obj.radioButton23 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton23:setParent(obj.layout42);
    obj.radioButton23:setTop(100);
    obj.radioButton23:setLeft(25);
    obj.radioButton23:setWidth(20);
    obj.radioButton23:setHeight(20);
    obj.radioButton23:setGroupName("grupoRegen");
    obj.radioButton23:setField("perRegen");
    obj.radioButton23:setFieldValue("1");
    obj.radioButton23:setName("radioButton23");

    obj.radioButton24 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton24:setParent(obj.layout42);
    obj.radioButton24:setTop(100);
    obj.radioButton24:setLeft(50);
    obj.radioButton24:setWidth(20);
    obj.radioButton24:setHeight(20);
    obj.radioButton24:setGroupName("grupoRegen");
    obj.radioButton24:setField("perRegen");
    obj.radioButton24:setFieldValue("2");
    obj.radioButton24:setName("radioButton24");

    obj.dataLink93 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink93:setParent(obj.layout42);
    obj.dataLink93:setField("perRegen");
    obj.dataLink93:setDefaultValue("0");
    obj.dataLink93:setName("dataLink93");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout42);
    obj.button42:setLeft(75);
    obj.button42:setTop(100);
    obj.button42:setHeight(20);
    obj.button42:setWidth(120);
    obj.button42:setText("Regeneração");
    obj.button42:setHorzTextAlign("leading");
    obj.button42:setName("button42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.frmPericias);
    obj.layout43:setLeft(310);
    obj.layout43:setTop(030);
    obj.layout43:setHeight(150);
    obj.layout43:setWidth(300);
    obj.layout43:setName("layout43");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout43);
    obj.label218:setTop(00);
    obj.label218:setLeft(05);
    obj.label218:setWidth(20);
    obj.label218:setHeight(20);
    obj.label218:setText("0");
    obj.label218:setAutoSize(true);
    obj.label218:setName("label218");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout43);
    obj.label219:setTop(00);
    obj.label219:setLeft(30);
    obj.label219:setWidth(20);
    obj.label219:setHeight(20);
    obj.label219:setText("1");
    obj.label219:setAutoSize(true);
    obj.label219:setName("label219");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout43);
    obj.label220:setTop(00);
    obj.label220:setLeft(55);
    obj.label220:setWidth(20);
    obj.label220:setHeight(20);
    obj.label220:setText("2");
    obj.label220:setAutoSize(true);
    obj.label220:setName("label220");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout43);
    obj.label221:setLeft(75);
    obj.label221:setTop(00);
    obj.label221:setHeight(20);
    obj.label221:setWidth(150);
    obj.label221:setText("Perícias de A. Especial");
    obj.label221:setAutoSize(true);
    obj.label221:setName("label221");

    obj.radioButton25 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton25:setParent(obj.layout43);
    obj.radioButton25:setTop(025);
    obj.radioButton25:setLeft(00);
    obj.radioButton25:setWidth(20);
    obj.radioButton25:setHeight(20);
    obj.radioButton25:setGroupName("grupoEngenha");
    obj.radioButton25:setField("perEngenha");
    obj.radioButton25:setFieldValue("0");
    obj.radioButton25:setName("radioButton25");

    obj.radioButton26 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton26:setParent(obj.layout43);
    obj.radioButton26:setTop(025);
    obj.radioButton26:setLeft(25);
    obj.radioButton26:setWidth(20);
    obj.radioButton26:setHeight(20);
    obj.radioButton26:setGroupName("grupoEngenha");
    obj.radioButton26:setField("perEngenha");
    obj.radioButton26:setFieldValue("1");
    obj.radioButton26:setName("radioButton26");

    obj.radioButton27 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton27:setParent(obj.layout43);
    obj.radioButton27:setTop(025);
    obj.radioButton27:setLeft(50);
    obj.radioButton27:setWidth(20);
    obj.radioButton27:setHeight(20);
    obj.radioButton27:setGroupName("grupoEngenha");
    obj.radioButton27:setField("perEngenha");
    obj.radioButton27:setFieldValue("2");
    obj.radioButton27:setName("radioButton27");

    obj.dataLink94 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink94:setParent(obj.layout43);
    obj.dataLink94:setField("perEngenha");
    obj.dataLink94:setDefaultValue("0");
    obj.dataLink94:setName("dataLink94");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout43);
    obj.button43:setLeft(75);
    obj.button43:setTop(025);
    obj.button43:setHeight(20);
    obj.button43:setWidth(120);
    obj.button43:setText("Engenharia");
    obj.button43:setHorzTextAlign("leading");
    obj.button43:setName("button43");

    obj.radioButton28 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton28:setParent(obj.layout43);
    obj.radioButton28:setTop(050);
    obj.radioButton28:setLeft(00);
    obj.radioButton28:setWidth(20);
    obj.radioButton28:setHeight(20);
    obj.radioButton28:setGroupName("grupoHistoria");
    obj.radioButton28:setField("perHistoria");
    obj.radioButton28:setFieldValue("0");
    obj.radioButton28:setName("radioButton28");

    obj.radioButton29 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton29:setParent(obj.layout43);
    obj.radioButton29:setTop(050);
    obj.radioButton29:setLeft(25);
    obj.radioButton29:setWidth(20);
    obj.radioButton29:setHeight(20);
    obj.radioButton29:setGroupName("grupoHistoria");
    obj.radioButton29:setField("perHistoria");
    obj.radioButton29:setFieldValue("1");
    obj.radioButton29:setName("radioButton29");

    obj.radioButton30 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton30:setParent(obj.layout43);
    obj.radioButton30:setTop(050);
    obj.radioButton30:setLeft(50);
    obj.radioButton30:setWidth(20);
    obj.radioButton30:setHeight(20);
    obj.radioButton30:setGroupName("grupoHistoria");
    obj.radioButton30:setField("perHistoria");
    obj.radioButton30:setFieldValue("2");
    obj.radioButton30:setName("radioButton30");

    obj.dataLink95 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink95:setParent(obj.layout43);
    obj.dataLink95:setField("perHistoria");
    obj.dataLink95:setDefaultValue("0");
    obj.dataLink95:setName("dataLink95");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout43);
    obj.button44:setLeft(75);
    obj.button44:setTop(050);
    obj.button44:setHeight(20);
    obj.button44:setWidth(120);
    obj.button44:setText("História");
    obj.button44:setHorzTextAlign("leading");
    obj.button44:setName("button44");

    obj.radioButton31 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton31:setParent(obj.layout43);
    obj.radioButton31:setTop(075);
    obj.radioButton31:setLeft(00);
    obj.radioButton31:setWidth(20);
    obj.radioButton31:setHeight(20);
    obj.radioButton31:setGroupName("grupoInvestig");
    obj.radioButton31:setField("perInvestig");
    obj.radioButton31:setFieldValue("0");
    obj.radioButton31:setName("radioButton31");

    obj.radioButton32 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton32:setParent(obj.layout43);
    obj.radioButton32:setTop(075);
    obj.radioButton32:setLeft(25);
    obj.radioButton32:setWidth(20);
    obj.radioButton32:setHeight(20);
    obj.radioButton32:setGroupName("grupoInvestig");
    obj.radioButton32:setField("perInvestig");
    obj.radioButton32:setFieldValue("1");
    obj.radioButton32:setName("radioButton32");

    obj.radioButton33 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton33:setParent(obj.layout43);
    obj.radioButton33:setTop(075);
    obj.radioButton33:setLeft(50);
    obj.radioButton33:setWidth(20);
    obj.radioButton33:setHeight(20);
    obj.radioButton33:setGroupName("grupoInvestig");
    obj.radioButton33:setField("perInvestig");
    obj.radioButton33:setFieldValue("2");
    obj.radioButton33:setName("radioButton33");

    obj.dataLink96 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink96:setParent(obj.layout43);
    obj.dataLink96:setField("perInvestig");
    obj.dataLink96:setDefaultValue("0");
    obj.dataLink96:setName("dataLink96");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout43);
    obj.button45:setLeft(75);
    obj.button45:setTop(075);
    obj.button45:setHeight(20);
    obj.button45:setWidth(120);
    obj.button45:setText("Investigação");
    obj.button45:setHorzTextAlign("leading");
    obj.button45:setName("button45");

    obj.radioButton34 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton34:setParent(obj.layout43);
    obj.radioButton34:setTop(100);
    obj.radioButton34:setLeft(00);
    obj.radioButton34:setWidth(20);
    obj.radioButton34:setHeight(20);
    obj.radioButton34:setGroupName("grupoProgram");
    obj.radioButton34:setField("perProgram");
    obj.radioButton34:setFieldValue("0");
    obj.radioButton34:setName("radioButton34");

    obj.radioButton35 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton35:setParent(obj.layout43);
    obj.radioButton35:setTop(100);
    obj.radioButton35:setLeft(25);
    obj.radioButton35:setWidth(20);
    obj.radioButton35:setHeight(20);
    obj.radioButton35:setGroupName("grupoProgram");
    obj.radioButton35:setField("perProgram");
    obj.radioButton35:setFieldValue("1");
    obj.radioButton35:setName("radioButton35");

    obj.radioButton36 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton36:setParent(obj.layout43);
    obj.radioButton36:setTop(100);
    obj.radioButton36:setLeft(50);
    obj.radioButton36:setWidth(20);
    obj.radioButton36:setHeight(20);
    obj.radioButton36:setGroupName("grupoProgram");
    obj.radioButton36:setField("perProgram");
    obj.radioButton36:setFieldValue("2");
    obj.radioButton36:setName("radioButton36");

    obj.dataLink97 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink97:setParent(obj.layout43);
    obj.dataLink97:setField("perProgram");
    obj.dataLink97:setDefaultValue("0");
    obj.dataLink97:setName("dataLink97");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout43);
    obj.button46:setLeft(75);
    obj.button46:setTop(100);
    obj.button46:setHeight(20);
    obj.button46:setWidth(120);
    obj.button46:setText("Programação");
    obj.button46:setHorzTextAlign("leading");
    obj.button46:setName("button46");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.frmPericias);
    obj.layout44:setLeft(310);
    obj.layout44:setTop(250);
    obj.layout44:setHeight(150);
    obj.layout44:setWidth(300);
    obj.layout44:setName("layout44");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout44);
    obj.label222:setTop(00);
    obj.label222:setLeft(05);
    obj.label222:setWidth(20);
    obj.label222:setHeight(20);
    obj.label222:setText("0");
    obj.label222:setAutoSize(true);
    obj.label222:setName("label222");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout44);
    obj.label223:setTop(00);
    obj.label223:setLeft(30);
    obj.label223:setWidth(20);
    obj.label223:setHeight(20);
    obj.label223:setText("1");
    obj.label223:setAutoSize(true);
    obj.label223:setName("label223");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout44);
    obj.label224:setTop(00);
    obj.label224:setLeft(55);
    obj.label224:setWidth(20);
    obj.label224:setHeight(20);
    obj.label224:setText("2");
    obj.label224:setAutoSize(true);
    obj.label224:setName("label224");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout44);
    obj.label225:setLeft(75);
    obj.label225:setTop(00);
    obj.label225:setHeight(20);
    obj.label225:setWidth(150);
    obj.label225:setText("Perícias de D. Especial");
    obj.label225:setAutoSize(true);
    obj.label225:setName("label225");

    obj.radioButton37 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton37:setParent(obj.layout44);
    obj.radioButton37:setTop(025);
    obj.radioButton37:setLeft(00);
    obj.radioButton37:setWidth(20);
    obj.radioButton37:setHeight(20);
    obj.radioButton37:setGroupName("grupoEmpatia");
    obj.radioButton37:setField("perEmpatia");
    obj.radioButton37:setFieldValue("0");
    obj.radioButton37:setName("radioButton37");

    obj.radioButton38 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton38:setParent(obj.layout44);
    obj.radioButton38:setTop(025);
    obj.radioButton38:setLeft(25);
    obj.radioButton38:setWidth(20);
    obj.radioButton38:setHeight(20);
    obj.radioButton38:setGroupName("grupoEmpatia");
    obj.radioButton38:setField("perEmpatia");
    obj.radioButton38:setFieldValue("1");
    obj.radioButton38:setName("radioButton38");

    obj.radioButton39 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton39:setParent(obj.layout44);
    obj.radioButton39:setTop(025);
    obj.radioButton39:setLeft(50);
    obj.radioButton39:setWidth(20);
    obj.radioButton39:setHeight(20);
    obj.radioButton39:setGroupName("grupoEmpatia");
    obj.radioButton39:setField("perEmpatia");
    obj.radioButton39:setFieldValue("2");
    obj.radioButton39:setName("radioButton39");

    obj.dataLink98 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink98:setParent(obj.layout44);
    obj.dataLink98:setField("perEmpatia");
    obj.dataLink98:setDefaultValue("0");
    obj.dataLink98:setName("dataLink98");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout44);
    obj.button47:setLeft(75);
    obj.button47:setTop(025);
    obj.button47:setHeight(20);
    obj.button47:setWidth(120);
    obj.button47:setText("Empatia");
    obj.button47:setHorzTextAlign("leading");
    obj.button47:setName("button47");

    obj.radioButton40 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton40:setParent(obj.layout44);
    obj.radioButton40:setTop(050);
    obj.radioButton40:setLeft(00);
    obj.radioButton40:setWidth(20);
    obj.radioButton40:setHeight(20);
    obj.radioButton40:setGroupName("grupoManha");
    obj.radioButton40:setField("perManha");
    obj.radioButton40:setFieldValue("0");
    obj.radioButton40:setName("radioButton40");

    obj.radioButton41 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton41:setParent(obj.layout44);
    obj.radioButton41:setTop(050);
    obj.radioButton41:setLeft(25);
    obj.radioButton41:setWidth(20);
    obj.radioButton41:setHeight(20);
    obj.radioButton41:setGroupName("grupoManha");
    obj.radioButton41:setField("perManha");
    obj.radioButton41:setFieldValue("1");
    obj.radioButton41:setName("radioButton41");

    obj.radioButton42 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton42:setParent(obj.layout44);
    obj.radioButton42:setTop(050);
    obj.radioButton42:setLeft(50);
    obj.radioButton42:setWidth(20);
    obj.radioButton42:setHeight(20);
    obj.radioButton42:setGroupName("grupoManha");
    obj.radioButton42:setField("perManha");
    obj.radioButton42:setFieldValue("2");
    obj.radioButton42:setName("radioButton42");

    obj.dataLink99 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink99:setParent(obj.layout44);
    obj.dataLink99:setField("perManha");
    obj.dataLink99:setDefaultValue("0");
    obj.dataLink99:setName("dataLink99");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout44);
    obj.button48:setLeft(75);
    obj.button48:setTop(050);
    obj.button48:setHeight(20);
    obj.button48:setWidth(120);
    obj.button48:setText("Manha");
    obj.button48:setHorzTextAlign("leading");
    obj.button48:setName("button48");

    obj.radioButton43 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton43:setParent(obj.layout44);
    obj.radioButton43:setTop(075);
    obj.radioButton43:setLeft(00);
    obj.radioButton43:setWidth(20);
    obj.radioButton43:setHeight(20);
    obj.radioButton43:setGroupName("grupoManipul");
    obj.radioButton43:setField("perManipul");
    obj.radioButton43:setFieldValue("0");
    obj.radioButton43:setName("radioButton43");

    obj.radioButton44 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton44:setParent(obj.layout44);
    obj.radioButton44:setTop(075);
    obj.radioButton44:setLeft(25);
    obj.radioButton44:setWidth(20);
    obj.radioButton44:setHeight(20);
    obj.radioButton44:setGroupName("grupoManipul");
    obj.radioButton44:setField("perManipul");
    obj.radioButton44:setFieldValue("1");
    obj.radioButton44:setName("radioButton44");

    obj.radioButton45 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton45:setParent(obj.layout44);
    obj.radioButton45:setTop(075);
    obj.radioButton45:setLeft(50);
    obj.radioButton45:setWidth(20);
    obj.radioButton45:setHeight(20);
    obj.radioButton45:setGroupName("grupoManipul");
    obj.radioButton45:setField("perManipul");
    obj.radioButton45:setFieldValue("2");
    obj.radioButton45:setName("radioButton45");

    obj.dataLink100 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink100:setParent(obj.layout44);
    obj.dataLink100:setField("perManipul");
    obj.dataLink100:setDefaultValue("0");
    obj.dataLink100:setName("dataLink100");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout44);
    obj.button49:setLeft(75);
    obj.button49:setTop(075);
    obj.button49:setHeight(20);
    obj.button49:setWidth(120);
    obj.button49:setText("Manipulação");
    obj.button49:setHorzTextAlign("leading");
    obj.button49:setName("button49");

    obj.radioButton46 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton46:setParent(obj.layout44);
    obj.radioButton46:setTop(100);
    obj.radioButton46:setLeft(00);
    obj.radioButton46:setWidth(20);
    obj.radioButton46:setHeight(20);
    obj.radioButton46:setGroupName("grupoPercepcao");
    obj.radioButton46:setField("perPercepcao");
    obj.radioButton46:setFieldValue("0");
    obj.radioButton46:setName("radioButton46");

    obj.radioButton47 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton47:setParent(obj.layout44);
    obj.radioButton47:setTop(100);
    obj.radioButton47:setLeft(25);
    obj.radioButton47:setWidth(20);
    obj.radioButton47:setHeight(20);
    obj.radioButton47:setGroupName("grupoPercepcao");
    obj.radioButton47:setField("perPercepcao");
    obj.radioButton47:setFieldValue("1");
    obj.radioButton47:setName("radioButton47");

    obj.radioButton48 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton48:setParent(obj.layout44);
    obj.radioButton48:setTop(100);
    obj.radioButton48:setLeft(50);
    obj.radioButton48:setWidth(20);
    obj.radioButton48:setHeight(20);
    obj.radioButton48:setGroupName("grupoPercepcao");
    obj.radioButton48:setField("perPercepcao");
    obj.radioButton48:setFieldValue("2");
    obj.radioButton48:setName("radioButton48");

    obj.dataLink101 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink101:setParent(obj.layout44);
    obj.dataLink101:setField("perPercepcao");
    obj.dataLink101:setDefaultValue("0");
    obj.dataLink101:setName("dataLink101");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout44);
    obj.button50:setLeft(75);
    obj.button50:setTop(100);
    obj.button50:setHeight(20);
    obj.button50:setWidth(120);
    obj.button50:setText("Percepção");
    obj.button50:setHorzTextAlign("leading");
    obj.button50:setName("button50");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.frmPericias);
    obj.layout45:setLeft(610);
    obj.layout45:setTop(030);
    obj.layout45:setHeight(600);
    obj.layout45:setWidth(1000);
    obj.layout45:setName("layout45");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout45);
    obj.label226:setTop(00);
    obj.label226:setLeft(05);
    obj.label226:setWidth(20);
    obj.label226:setHeight(20);
    obj.label226:setText("0");
    obj.label226:setAutoSize(true);
    obj.label226:setName("label226");

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout45);
    obj.label227:setTop(00);
    obj.label227:setLeft(30);
    obj.label227:setWidth(20);
    obj.label227:setHeight(20);
    obj.label227:setText("1");
    obj.label227:setAutoSize(true);
    obj.label227:setName("label227");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout45);
    obj.label228:setTop(00);
    obj.label228:setLeft(55);
    obj.label228:setWidth(20);
    obj.label228:setHeight(20);
    obj.label228:setText("2");
    obj.label228:setAutoSize(true);
    obj.label228:setName("label228");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout45);
    obj.label229:setLeft(75);
    obj.label229:setTop(00);
    obj.label229:setHeight(20);
    obj.label229:setWidth(150);
    obj.label229:setText("Perícias de Velocidade");
    obj.label229:setAutoSize(true);
    obj.label229:setName("label229");

    obj.radioButton49 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton49:setParent(obj.layout45);
    obj.radioButton49:setTop(025);
    obj.radioButton49:setLeft(00);
    obj.radioButton49:setWidth(20);
    obj.radioButton49:setHeight(20);
    obj.radioButton49:setGroupName("grupoAcrobacia");
    obj.radioButton49:setField("perAcrobacia");
    obj.radioButton49:setFieldValue("0");
    obj.radioButton49:setName("radioButton49");

    obj.radioButton50 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton50:setParent(obj.layout45);
    obj.radioButton50:setTop(025);
    obj.radioButton50:setLeft(25);
    obj.radioButton50:setWidth(20);
    obj.radioButton50:setHeight(20);
    obj.radioButton50:setGroupName("grupoAcrobacia");
    obj.radioButton50:setField("perAcrobacia");
    obj.radioButton50:setFieldValue("1");
    obj.radioButton50:setName("radioButton50");

    obj.radioButton51 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton51:setParent(obj.layout45);
    obj.radioButton51:setTop(025);
    obj.radioButton51:setLeft(50);
    obj.radioButton51:setWidth(20);
    obj.radioButton51:setHeight(20);
    obj.radioButton51:setGroupName("grupoAcrobacia");
    obj.radioButton51:setField("perAcrobacia");
    obj.radioButton51:setFieldValue("2");
    obj.radioButton51:setName("radioButton51");

    obj.dataLink102 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink102:setParent(obj.layout45);
    obj.dataLink102:setField("perAcrobacia");
    obj.dataLink102:setDefaultValue("0");
    obj.dataLink102:setName("dataLink102");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout45);
    obj.button51:setLeft(75);
    obj.button51:setTop(025);
    obj.button51:setHeight(20);
    obj.button51:setWidth(120);
    obj.button51:setText("Acrobacia");
    obj.button51:setHorzTextAlign("leading");
    obj.button51:setName("button51");

    obj.radioButton52 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton52:setParent(obj.layout45);
    obj.radioButton52:setTop(050);
    obj.radioButton52:setLeft(00);
    obj.radioButton52:setWidth(20);
    obj.radioButton52:setHeight(20);
    obj.radioButton52:setGroupName("grupoFurtiv");
    obj.radioButton52:setField("perFurtiv");
    obj.radioButton52:setFieldValue("0");
    obj.radioButton52:setName("radioButton52");

    obj.radioButton53 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton53:setParent(obj.layout45);
    obj.radioButton53:setTop(050);
    obj.radioButton53:setLeft(25);
    obj.radioButton53:setWidth(20);
    obj.radioButton53:setHeight(20);
    obj.radioButton53:setGroupName("grupoFurtiv");
    obj.radioButton53:setField("perFurtiv");
    obj.radioButton53:setFieldValue("1");
    obj.radioButton53:setName("radioButton53");

    obj.radioButton54 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton54:setParent(obj.layout45);
    obj.radioButton54:setTop(050);
    obj.radioButton54:setLeft(50);
    obj.radioButton54:setWidth(20);
    obj.radioButton54:setHeight(20);
    obj.radioButton54:setGroupName("grupoFurtiv");
    obj.radioButton54:setField("perFurtiv");
    obj.radioButton54:setFieldValue("2");
    obj.radioButton54:setName("radioButton54");

    obj.dataLink103 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink103:setParent(obj.layout45);
    obj.dataLink103:setField("perFurtiv");
    obj.dataLink103:setDefaultValue("0");
    obj.dataLink103:setName("dataLink103");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout45);
    obj.button52:setLeft(75);
    obj.button52:setTop(050);
    obj.button52:setHeight(20);
    obj.button52:setWidth(120);
    obj.button52:setText("Furtividade");
    obj.button52:setHorzTextAlign("leading");
    obj.button52:setName("button52");

    obj.radioButton55 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton55:setParent(obj.layout45);
    obj.radioButton55:setTop(075);
    obj.radioButton55:setLeft(00);
    obj.radioButton55:setWidth(20);
    obj.radioButton55:setHeight(20);
    obj.radioButton55:setGroupName("grupoPerfomace");
    obj.radioButton55:setField("perPerfomace");
    obj.radioButton55:setFieldValue("0");
    obj.radioButton55:setName("radioButton55");

    obj.radioButton56 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton56:setParent(obj.layout45);
    obj.radioButton56:setTop(075);
    obj.radioButton56:setLeft(25);
    obj.radioButton56:setWidth(20);
    obj.radioButton56:setHeight(20);
    obj.radioButton56:setGroupName("grupoPerfomace");
    obj.radioButton56:setField("perPerfomace");
    obj.radioButton56:setFieldValue("1");
    obj.radioButton56:setName("radioButton56");

    obj.radioButton57 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton57:setParent(obj.layout45);
    obj.radioButton57:setTop(075);
    obj.radioButton57:setLeft(50);
    obj.radioButton57:setWidth(20);
    obj.radioButton57:setHeight(20);
    obj.radioButton57:setGroupName("grupoPerfomace");
    obj.radioButton57:setField("perPerfomace");
    obj.radioButton57:setFieldValue("2");
    obj.radioButton57:setName("radioButton57");

    obj.dataLink104 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink104:setParent(obj.layout45);
    obj.dataLink104:setField("perPerfomace");
    obj.dataLink104:setDefaultValue("0");
    obj.dataLink104:setName("dataLink104");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout45);
    obj.button53:setLeft(75);
    obj.button53:setTop(075);
    obj.button53:setHeight(20);
    obj.button53:setWidth(120);
    obj.button53:setText("Performance");
    obj.button53:setHorzTextAlign("leading");
    obj.button53:setName("button53");

    obj.radioButton58 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton58:setParent(obj.layout45);
    obj.radioButton58:setTop(100);
    obj.radioButton58:setLeft(00);
    obj.radioButton58:setWidth(20);
    obj.radioButton58:setHeight(20);
    obj.radioButton58:setGroupName("grupoPrestid");
    obj.radioButton58:setField("perPrestid");
    obj.radioButton58:setFieldValue("0");
    obj.radioButton58:setName("radioButton58");

    obj.radioButton59 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton59:setParent(obj.layout45);
    obj.radioButton59:setTop(100);
    obj.radioButton59:setLeft(25);
    obj.radioButton59:setWidth(20);
    obj.radioButton59:setHeight(20);
    obj.radioButton59:setGroupName("grupoPrestid");
    obj.radioButton59:setField("perPrestid");
    obj.radioButton59:setFieldValue("1");
    obj.radioButton59:setName("radioButton59");

    obj.radioButton60 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton60:setParent(obj.layout45);
    obj.radioButton60:setTop(100);
    obj.radioButton60:setLeft(50);
    obj.radioButton60:setWidth(20);
    obj.radioButton60:setHeight(20);
    obj.radioButton60:setGroupName("grupoPrestid");
    obj.radioButton60:setField("perPrestid");
    obj.radioButton60:setFieldValue("2");
    obj.radioButton60:setName("radioButton60");

    obj.dataLink105 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink105:setParent(obj.layout45);
    obj.dataLink105:setField("perPrestid");
    obj.dataLink105:setDefaultValue("0");
    obj.dataLink105:setName("dataLink105");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout45);
    obj.button54:setLeft(75);
    obj.button54:setTop(100);
    obj.button54:setHeight(20);
    obj.button54:setWidth(120);
    obj.button54:setText("Prestidigitação");
    obj.button54:setHorzTextAlign("leading");
    obj.button54:setName("button54");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.frmPericias);
    obj.layout46:setLeft(610);
    obj.layout46:setTop(250);
    obj.layout46:setHeight(320);
    obj.layout46:setWidth(420);
    obj.layout46:setName("layout46");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout46);
    obj.label230:setLeft(000);
    obj.label230:setTop(000);
    obj.label230:setHeight(20);
    obj.label230:setWidth(120);
    obj.label230:setText("Capacidades");
    obj.label230:setAutoSize(true);
    obj.label230:setName("label230");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout46);
    obj.checkBox1:setLeft(000);
    obj.checkBox1:setTop(025);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setWidth(120);
    obj.checkBox1:setText("Apneia");
    obj.checkBox1:setField("cap_APN");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout46);
    obj.checkBox2:setLeft(000);
    obj.checkBox2:setTop(050);
    obj.checkBox2:setHeight(20);
    obj.checkBox2:setWidth(120);
    obj.checkBox2:setText("Imunidade");
    obj.checkBox2:setField("cap_IMU");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout46);
    obj.checkBox3:setLeft(000);
    obj.checkBox3:setTop(075);
    obj.checkBox3:setHeight(20);
    obj.checkBox3:setWidth(120);
    obj.checkBox3:setText("Jejum");
    obj.checkBox3:setField("cap_JEJ");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout46);
    obj.checkBox4:setLeft(000);
    obj.checkBox4:setTop(100);
    obj.checkBox4:setHeight(20);
    obj.checkBox4:setWidth(120);
    obj.checkBox4:setText("Resiliência");
    obj.checkBox4:setField("cap_RES");
    obj.checkBox4:setName("checkBox4");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Talentos");
    obj.tab8:setName("tab8");

    obj.frmTalentos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTalentos:setParent(obj.tab8);
    obj.frmTalentos:setName("frmTalentos");
    obj.frmTalentos:setAlign("client");
    obj.frmTalentos:setTheme("dark");
    obj.frmTalentos:setMargins({top=1});

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.frmTalentos);
    obj.layout47:setLeft(000);
    obj.layout47:setTop(000);
    obj.layout47:setHeight(650);
    obj.layout47:setWidth(1100);
    obj.layout47:setName("layout47");

    obj.image54 = GUI.fromHandle(_obj_newObject("image"));
    obj.image54:setParent(obj.layout47);
    obj.image54:setLeft(000);
    obj.image54:setTop(000);
    obj.image54:setHeight(650);
    obj.image54:setWidth(1100);
    obj.image54:setSRC("/img/Pokeball.jpg");
    obj.image54:setStyle("autoFit");
    obj.image54:setName("image54");

    obj.popHabilidade = GUI.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade:setParent(obj.frmTalentos);
    obj.popHabilidade:setName("popHabilidade");
    obj.popHabilidade:setWidth(300);
    obj.popHabilidade:setHeight(280);
    obj.popHabilidade:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popHabilidade, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popHabilidade);
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

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.flowPart1);
    obj.label231:setAlign("top");
    obj.label231:setFontSize(10);
    obj.label231:setText("Nível");
    obj.label231:setHorzTextAlign("center");
    obj.label231:setWordWrap(true);
    obj.label231:setTextTrimming("none");
    obj.label231:setAutoSize(true);
    obj.label231:setName("label231");

    obj.edit266 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.flowPart1);
    obj.edit266:setAlign("client");
    obj.edit266:setField("nivelHabilidade");
    obj.edit266:setHorzTextAlign("center");
    obj.edit266:setFontSize(12);
    obj.edit266:setType("number");
    obj.edit266:setName("edit266");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(180);
    obj.flowPart2:setMaxWidth(200);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.flowPart2);
    obj.label232:setAlign("top");
    obj.label232:setFontSize(10);
    obj.label232:setText("Nome");
    obj.label232:setHorzTextAlign("center");
    obj.label232:setWordWrap(true);
    obj.label232:setTextTrimming("none");
    obj.label232:setAutoSize(true);
    obj.label232:setName("label232");

    obj.edit267 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.flowPart2);
    obj.edit267:setAlign("client");
    obj.edit267:setField("nomeHabilidade");
    obj.edit267:setFontSize(12);
    obj.edit267:setName("edit267");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.flowPart3);
    obj.label233:setAlign("top");
    obj.label233:setFontSize(10);
    obj.label233:setText("Freq.");
    obj.label233:setHorzTextAlign("center");
    obj.label233:setWordWrap(true);
    obj.label233:setTextTrimming("none");
    obj.label233:setAutoSize(true);
    obj.label233:setName("label233");

    obj.edit268 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.flowPart3);
    obj.edit268:setAlign("client");
    obj.edit268:setField("freqHabilidade");
    obj.edit268:setHorzTextAlign("center");
    obj.edit268:setFontSize(12);
    obj.edit268:setName("edit268");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(180);
    obj.flowPart4:setMaxWidth(200);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.flowPart4);
    obj.label234:setAlign("top");
    obj.label234:setFontSize(10);
    obj.label234:setText("Gatilho/Alvo");
    obj.label234:setHorzTextAlign("center");
    obj.label234:setWordWrap(true);
    obj.label234:setTextTrimming("none");
    obj.label234:setAutoSize(true);
    obj.label234:setName("label234");

    obj.edit269 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.flowPart4);
    obj.edit269:setAlign("client");
    obj.edit269:setField("gatHabilidade");
    obj.edit269:setFontSize(12);
    obj.edit269:setName("edit269");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(90);
    obj.flowPart5:setMaxWidth(100);
    obj.flowPart5:setHeight(35);
    obj.flowPart5:setName("flowPart5");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.flowPart5);
    obj.label235:setAlign("top");
    obj.label235:setFontSize(10);
    obj.label235:setText("Íncones");
    obj.label235:setHorzTextAlign("center");
    obj.label235:setWordWrap(true);
    obj.label235:setTextTrimming("none");
    obj.label235:setAutoSize(true);
    obj.label235:setName("label235");

    obj.edit270 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.flowPart5);
    obj.edit270:setAlign("client");
    obj.edit270:setField("incHabilidade");
    obj.edit270:setHorzTextAlign("center");
    obj.edit270:setFontSize(12);
    obj.edit270:setName("edit270");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(180);
    obj.flowPart6:setMaxWidth(200);
    obj.flowPart6:setHeight(35);
    obj.flowPart6:setName("flowPart6");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.flowPart6);
    obj.label236:setAlign("top");
    obj.label236:setFontSize(10);
    obj.label236:setText("Requisitos");
    obj.label236:setHorzTextAlign("center");
    obj.label236:setWordWrap(true);
    obj.label236:setTextTrimming("none");
    obj.label236:setAutoSize(true);
    obj.label236:setName("label236");

    obj.edit271 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.flowPart6);
    obj.edit271:setAlign("client");
    obj.edit271:setField("reqHabilidade");
    obj.edit271:setFontSize(12);
    obj.edit271:setName("edit271");

    obj.dataLink106 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink106:setParent(obj.flowLayout1);
    obj.dataLink106:setField("nivelHabilidade");
    obj.dataLink106:setName("dataLink106");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.popHabilidade);
    obj.textEditor13:setAlign("client");
    obj.textEditor13:setField("descricao");
    obj.textEditor13:setName("textEditor13");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.frmTalentos);
    obj.layout48:setLeft(50);
    obj.layout48:setTop(25);
    obj.layout48:setWidth(400);
    obj.layout48:setHeight(520);
    obj.layout48:setName("layout48");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout48);
    obj.rectangle55:setAlign("client");
    obj.rectangle55:setColor("#0000007F");
    obj.rectangle55:setName("rectangle55");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout48);
    obj.rectangle56:setLeft(000);
    obj.rectangle56:setTop(000);
    obj.rectangle56:setWidth(390);
    obj.rectangle56:setHeight(40);
    obj.rectangle56:setColor("darkred");
    obj.rectangle56:setStrokeColor("black");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout48);
    obj.label237:setLeft(0);
    obj.label237:setTop(0);
    obj.label237:setWidth(400);
    obj.label237:setHeight(20);
    obj.label237:setText("Talentos Comuns e de Classes Básicas");
    obj.label237:setAutoSize(true);
    obj.label237:setFontColor("White");
    obj.label237:setFontSize(18);
    obj.label237:setHorzTextAlign("center");
    obj.label237:setName("label237");

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout48);
    obj.button55:setText("Novo Talento");
    obj.button55:setLeft(0);
    obj.button55:setTop(25);
    obj.button55:setWidth(390);
    obj.button55:setHeight(20);
    obj.button55:setName("button55");

    obj.rclListaDosTalentosBase = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTalentosBase:setParent(obj.layout48);
    obj.rclListaDosTalentosBase:setName("rclListaDosTalentosBase");
    obj.rclListaDosTalentosBase:setField("campoDosTalB");
    obj.rclListaDosTalentosBase:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDosTalentosBase:setLeft(0);
    obj.rclListaDosTalentosBase:setTop(50);
    obj.rclListaDosTalentosBase:setWidth(390);
    obj.rclListaDosTalentosBase:setHeight(460);
    obj.rclListaDosTalentosBase:setLayout("vertical");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.frmTalentos);
    obj.layout49:setLeft(590);
    obj.layout49:setTop(25);
    obj.layout49:setWidth(400);
    obj.layout49:setHeight(520);
    obj.layout49:setName("layout49");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout49);
    obj.rectangle57:setAlign("client");
    obj.rectangle57:setColor("#0000007F");
    obj.rectangle57:setName("rectangle57");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout49);
    obj.rectangle58:setLeft(000);
    obj.rectangle58:setTop(000);
    obj.rectangle58:setWidth(390);
    obj.rectangle58:setHeight(40);
    obj.rectangle58:setColor("darkred");
    obj.rectangle58:setStrokeColor("black");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout49);
    obj.label238:setLeft(0);
    obj.label238:setTop(0);
    obj.label238:setWidth(400);
    obj.label238:setHeight(20);
    obj.label238:setText("Talentos de Classes Avançadas");
    obj.label238:setAutoSize(true);
    obj.label238:setFontColor("White");
    obj.label238:setFontSize(18);
    obj.label238:setHorzTextAlign("center");
    obj.label238:setName("label238");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.layout49);
    obj.button56:setText("Novo Talento");
    obj.button56:setLeft(0);
    obj.button56:setTop(25);
    obj.button56:setWidth(390);
    obj.button56:setHeight(20);
    obj.button56:setName("button56");

    obj.rclListaDosTalentosAvanc = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTalentosAvanc:setParent(obj.layout49);
    obj.rclListaDosTalentosAvanc:setName("rclListaDosTalentosAvanc");
    obj.rclListaDosTalentosAvanc:setField("campoDosTalA");
    obj.rclListaDosTalentosAvanc:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDosTalentosAvanc:setLeft(0);
    obj.rclListaDosTalentosAvanc:setTop(50);
    obj.rclListaDosTalentosAvanc:setWidth(390);
    obj.rclListaDosTalentosAvanc:setHeight(460);
    obj.rclListaDosTalentosAvanc:setLayout("vertical");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Golpes");
    obj.tab9:setName("tab9");

    obj.frmFichaRPGmeister2_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister2_svg:setParent(obj.tab9);
    obj.frmFichaRPGmeister2_svg:setName("frmFichaRPGmeister2_svg");
    obj.frmFichaRPGmeister2_svg:setAlign("client");
    obj.frmFichaRPGmeister2_svg:setTheme("dark");
    obj.frmFichaRPGmeister2_svg:setMargins({top=1});

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmFichaRPGmeister2_svg);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.scrollBox4);
    obj.layout50:setLeft(0);
    obj.layout50:setTop(0);
    obj.layout50:setWidth(1080);
    obj.layout50:setHeight(760);
    obj.layout50:setName("layout50");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout50);
    obj.rectangle59:setAlign("client");
    obj.rectangle59:setColor("#0000007F");
    obj.rectangle59:setName("rectangle59");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout50);
    obj.layout51:setLeft(2);
    obj.layout51:setTop(2);
    obj.layout51:setWidth(1207);
    obj.layout51:setHeight(92);
    obj.layout51:setName("layout51");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout51);
    obj.rectangle60:setAlign("client");
    obj.rectangle60:setColor("black");
    obj.rectangle60:setName("rectangle60");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout51);
    obj.label239:setLeft(5);
    obj.label239:setTop(5);
    obj.label239:setWidth(70);
    obj.label239:setHeight(25);
    obj.label239:setText("Golpe");
    lfm_setPropAsString(obj.label239, "fontStyle",  "bold");
    obj.label239:setName("label239");

    obj.edit272 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout51);
    obj.edit272:setVertTextAlign("center");
    obj.edit272:setLeft(75);
    obj.edit272:setTop(5);
    obj.edit272:setWidth(160);
    obj.edit272:setHeight(25);
    obj.edit272:setField("golpe1");
    obj.edit272:setName("edit272");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout51);
    obj.label240:setLeft(5);
    obj.label240:setTop(30);
    obj.label240:setWidth(80);
    obj.label240:setHeight(25);
    obj.label240:setText("Descritores");
    lfm_setPropAsString(obj.label240, "fontStyle",  "bold");
    obj.label240:setName("label240");

    obj.edit273 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout51);
    obj.edit273:setVertTextAlign("center");
    obj.edit273:setLeft(75);
    obj.edit273:setTop(30);
    obj.edit273:setWidth(160);
    obj.edit273:setHeight(25);
    obj.edit273:setField("Descritores1");
    obj.edit273:setName("edit273");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout51);
    obj.label241:setLeft(5);
    obj.label241:setTop(55);
    obj.label241:setWidth(70);
    obj.label241:setHeight(25);
    obj.label241:setText("Alcance");
    lfm_setPropAsString(obj.label241, "fontStyle",  "bold");
    obj.label241:setName("label241");

    obj.edit274 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout51);
    obj.edit274:setVertTextAlign("center");
    obj.edit274:setLeft(75);
    obj.edit274:setTop(55);
    obj.edit274:setWidth(160);
    obj.edit274:setHeight(25);
    obj.edit274:setField("alcance1");
    obj.edit274:setName("edit274");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout51);
    obj.label242:setLeft(240);
    obj.label242:setTop(6);
    obj.label242:setWidth(50);
    obj.label242:setHeight(25);
    obj.label242:setText("Tipo");
    lfm_setPropAsString(obj.label242, "fontStyle",  "bold");
    obj.label242:setName("label242");

    obj.edit275 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout51);
    obj.edit275:setVertTextAlign("center");
    obj.edit275:setLeft(282);
    obj.edit275:setTop(6);
    obj.edit275:setWidth(82);
    obj.edit275:setHeight(25);
    obj.edit275:setField("tipo1");
    obj.edit275:setName("edit275");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.layout51);
    obj.label243:setLeft(240);
    obj.label243:setTop(31);
    obj.label243:setWidth(50);
    obj.label243:setHeight(25);
    obj.label243:setText("Classe");
    lfm_setPropAsString(obj.label243, "fontStyle",  "bold");
    obj.label243:setName("label243");

    obj.comboBox26 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.layout51);
    obj.comboBox26:setLeft(282);
    obj.comboBox26:setTop(31);
    obj.comboBox26:setWidth(82);
    obj.comboBox26:setHeight(25);
    obj.comboBox26:setField("classe1");
    obj.comboBox26:setHorzTextAlign("center");
    obj.comboBox26:setItems({'Ataque', 'Especial', 'Efeito','Arma'});
    obj.comboBox26:setValues({'1', '2', '3','4'});
    obj.comboBox26:setName("comboBox26");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout51);
    obj.label244:setLeft(240);
    obj.label244:setTop(55);
    obj.label244:setWidth(50);
    obj.label244:setHeight(25);
    obj.label244:setText("Freq.");
    lfm_setPropAsString(obj.label244, "fontStyle",  "bold");
    obj.label244:setName("label244");

    obj.edit276 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout51);
    obj.edit276:setVertTextAlign("center");
    obj.edit276:setLeft(282);
    obj.edit276:setTop(55);
    obj.edit276:setWidth(82);
    obj.edit276:setHeight(25);
    obj.edit276:setField("frequencia1");
    obj.edit276:setName("edit276");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.layout51);
    obj.label245:setLeft(370);
    obj.label245:setTop(6);
    obj.label245:setWidth(70);
    obj.label245:setHeight(25);
    obj.label245:setText("Acurácia");
    lfm_setPropAsString(obj.label245, "fontStyle",  "bold");
    obj.label245:setName("label245");

    obj.edit277 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout51);
    obj.edit277:setVertTextAlign("center");
    obj.edit277:setLeft(425);
    obj.edit277:setTop(6);
    obj.edit277:setWidth(53);
    obj.edit277:setHeight(25);
    obj.edit277:setField("Acc1");
    obj.edit277:setType("number");
    obj.edit277:setName("edit277");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.layout51);
    obj.label246:setLeft(370);
    obj.label246:setTop(31);
    obj.label246:setWidth(70);
    obj.label246:setHeight(25);
    obj.label246:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label246, "fontStyle",  "bold");
    obj.label246:setName("label246");

    obj.edit278 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout51);
    obj.edit278:setVertTextAlign("center");
    obj.edit278:setLeft(425);
    obj.edit278:setTop(31);
    obj.edit278:setWidth(53);
    obj.edit278:setHeight(25);
    obj.edit278:setField("ataque1");
    obj.edit278:setType("number");
    obj.edit278:setName("edit278");

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.layout51);
    obj.label247:setLeft(370);
    obj.label247:setTop(55);
    obj.label247:setWidth(70);
    obj.label247:setHeight(25);
    obj.label247:setText("D. Base");
    lfm_setPropAsString(obj.label247, "fontStyle",  "bold");
    obj.label247:setName("label247");

    obj.edit279 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout51);
    obj.edit279:setVertTextAlign("center");
    obj.edit279:setLeft(425);
    obj.edit279:setTop(55);
    obj.edit279:setWidth(53);
    obj.edit279:setHeight(25);
    obj.edit279:setField("dano1");
    obj.edit279:setName("edit279");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.layout51);
    obj.button57:setLeft(488);
    obj.button57:setTop(6);
    obj.button57:setWidth(82);
    obj.button57:setText("Acerto");
    obj.button57:setFontSize(11);
    lfm_setPropAsString(obj.button57, "fontStyle",  "bold");
    obj.button57:setName("button57");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.layout51);
    obj.button58:setLeft(488);
    obj.button58:setTop(31);
    obj.button58:setWidth(82);
    obj.button58:setText("Dano");
    obj.button58:setFontSize(11);
    lfm_setPropAsString(obj.button58, "fontStyle",  "bold");
    obj.button58:setName("button58");

    obj.button59 = GUI.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.layout51);
    obj.button59:setLeft(488);
    obj.button59:setTop(55);
    obj.button59:setWidth(82);
    obj.button59:setText("Crítico");
    obj.button59:setFontSize(11);
    lfm_setPropAsString(obj.button59, "fontStyle",  "bold");
    obj.button59:setName("button59");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout51);
    obj.textEditor14:setLeft(575);
    obj.textEditor14:setTop(5);
    obj.textEditor14:setWidth(295);
    obj.textEditor14:setHeight(75);
    obj.textEditor14:setField("campoEfeitoGolpes1");
    obj.textEditor14:setName("textEditor14");

    obj.label248 = GUI.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.layout51);
    obj.label248:setLeft(875);
    obj.label248:setTop(5);
    obj.label248:setWidth(80);
    obj.label248:setHeight(25);
    obj.label248:setText("Aptidão");
    lfm_setPropAsString(obj.label248, "fontStyle",  "bold");
    obj.label248:setName("label248");

    obj.edit280 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout51);
    obj.edit280:setVertTextAlign("center");
    obj.edit280:setLeft(940);
    obj.edit280:setTop(5);
    obj.edit280:setWidth(120);
    obj.edit280:setHeight(25);
    obj.edit280:setField("tipoContest1");
    obj.edit280:setName("edit280");

    obj.label249 = GUI.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.layout51);
    obj.label249:setLeft(875);
    obj.label249:setTop(30);
    obj.label249:setWidth(80);
    obj.label249:setHeight(25);
    obj.label249:setText("Concursos");
    lfm_setPropAsString(obj.label249, "fontStyle",  "bold");
    obj.label249:setName("label249");

    obj.edit281 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout51);
    obj.edit281:setVertTextAlign("center");
    obj.edit281:setLeft(940);
    obj.edit281:setTop(30);
    obj.edit281:setWidth(120);
    obj.edit281:setHeight(25);
    obj.edit281:setField("efeitoContest1");
    obj.edit281:setName("edit281");

    obj.label250 = GUI.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.layout51);
    obj.label250:setLeft(875);
    obj.label250:setTop(55);
    obj.label250:setWidth(80);
    obj.label250:setHeight(25);
    obj.label250:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label250, "fontStyle",  "bold");
    obj.label250:setName("label250");

    obj.edit282 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout51);
    obj.edit282:setVertTextAlign("center");
    obj.edit282:setLeft(940);
    obj.edit282:setTop(55);
    obj.edit282:setWidth(120);
    obj.edit282:setHeight(25);
    obj.edit282:setField("BDano1");
    obj.edit282:setName("edit282");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout50);
    obj.layout52:setLeft(2);
    obj.layout52:setTop(97);
    obj.layout52:setWidth(1207);
    obj.layout52:setHeight(92);
    obj.layout52:setName("layout52");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout52);
    obj.rectangle61:setAlign("client");
    obj.rectangle61:setColor("black");
    obj.rectangle61:setName("rectangle61");

    obj.label251 = GUI.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.layout52);
    obj.label251:setLeft(5);
    obj.label251:setTop(5);
    obj.label251:setWidth(70);
    obj.label251:setHeight(25);
    obj.label251:setText("Golpe");
    lfm_setPropAsString(obj.label251, "fontStyle",  "bold");
    obj.label251:setName("label251");

    obj.edit283 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout52);
    obj.edit283:setVertTextAlign("center");
    obj.edit283:setLeft(75);
    obj.edit283:setTop(5);
    obj.edit283:setWidth(160);
    obj.edit283:setHeight(25);
    obj.edit283:setField("golpe2");
    obj.edit283:setName("edit283");

    obj.label252 = GUI.fromHandle(_obj_newObject("label"));
    obj.label252:setParent(obj.layout52);
    obj.label252:setLeft(5);
    obj.label252:setTop(30);
    obj.label252:setWidth(80);
    obj.label252:setHeight(25);
    obj.label252:setText("Descritores");
    lfm_setPropAsString(obj.label252, "fontStyle",  "bold");
    obj.label252:setName("label252");

    obj.edit284 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout52);
    obj.edit284:setVertTextAlign("center");
    obj.edit284:setLeft(75);
    obj.edit284:setTop(30);
    obj.edit284:setWidth(160);
    obj.edit284:setHeight(25);
    obj.edit284:setField("Descritores2");
    obj.edit284:setName("edit284");

    obj.label253 = GUI.fromHandle(_obj_newObject("label"));
    obj.label253:setParent(obj.layout52);
    obj.label253:setLeft(5);
    obj.label253:setTop(55);
    obj.label253:setWidth(70);
    obj.label253:setHeight(25);
    obj.label253:setText("Alcance");
    lfm_setPropAsString(obj.label253, "fontStyle",  "bold");
    obj.label253:setName("label253");

    obj.edit285 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout52);
    obj.edit285:setVertTextAlign("center");
    obj.edit285:setLeft(75);
    obj.edit285:setTop(55);
    obj.edit285:setWidth(160);
    obj.edit285:setHeight(25);
    obj.edit285:setField("alcance2");
    obj.edit285:setName("edit285");

    obj.label254 = GUI.fromHandle(_obj_newObject("label"));
    obj.label254:setParent(obj.layout52);
    obj.label254:setLeft(240);
    obj.label254:setTop(6);
    obj.label254:setWidth(50);
    obj.label254:setHeight(25);
    obj.label254:setText("Tipo");
    lfm_setPropAsString(obj.label254, "fontStyle",  "bold");
    obj.label254:setName("label254");

    obj.edit286 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout52);
    obj.edit286:setVertTextAlign("center");
    obj.edit286:setLeft(282);
    obj.edit286:setTop(6);
    obj.edit286:setWidth(82);
    obj.edit286:setHeight(25);
    obj.edit286:setField("tipo2");
    obj.edit286:setName("edit286");

    obj.label255 = GUI.fromHandle(_obj_newObject("label"));
    obj.label255:setParent(obj.layout52);
    obj.label255:setLeft(240);
    obj.label255:setTop(31);
    obj.label255:setWidth(50);
    obj.label255:setHeight(25);
    obj.label255:setText("Classe");
    lfm_setPropAsString(obj.label255, "fontStyle",  "bold");
    obj.label255:setName("label255");

    obj.comboBox27 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.layout52);
    obj.comboBox27:setLeft(282);
    obj.comboBox27:setTop(31);
    obj.comboBox27:setWidth(82);
    obj.comboBox27:setHeight(25);
    obj.comboBox27:setField("classe2");
    obj.comboBox27:setHorzTextAlign("center");
    obj.comboBox27:setItems({'Ataque', 'Especial', 'Efeito','Arma'});
    obj.comboBox27:setValues({'1', '2', '3','4'});
    obj.comboBox27:setName("comboBox27");

    obj.label256 = GUI.fromHandle(_obj_newObject("label"));
    obj.label256:setParent(obj.layout52);
    obj.label256:setLeft(240);
    obj.label256:setTop(55);
    obj.label256:setWidth(50);
    obj.label256:setHeight(25);
    obj.label256:setText("Freq.");
    lfm_setPropAsString(obj.label256, "fontStyle",  "bold");
    obj.label256:setName("label256");

    obj.edit287 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout52);
    obj.edit287:setVertTextAlign("center");
    obj.edit287:setLeft(282);
    obj.edit287:setTop(55);
    obj.edit287:setWidth(82);
    obj.edit287:setHeight(25);
    obj.edit287:setField("frequencia2");
    obj.edit287:setName("edit287");

    obj.label257 = GUI.fromHandle(_obj_newObject("label"));
    obj.label257:setParent(obj.layout52);
    obj.label257:setLeft(370);
    obj.label257:setTop(6);
    obj.label257:setWidth(70);
    obj.label257:setHeight(25);
    obj.label257:setText("Acurácia");
    lfm_setPropAsString(obj.label257, "fontStyle",  "bold");
    obj.label257:setName("label257");

    obj.edit288 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout52);
    obj.edit288:setVertTextAlign("center");
    obj.edit288:setLeft(425);
    obj.edit288:setTop(6);
    obj.edit288:setWidth(53);
    obj.edit288:setHeight(25);
    obj.edit288:setField("Acc2");
    obj.edit288:setType("number");
    obj.edit288:setName("edit288");

    obj.label258 = GUI.fromHandle(_obj_newObject("label"));
    obj.label258:setParent(obj.layout52);
    obj.label258:setLeft(370);
    obj.label258:setTop(31);
    obj.label258:setWidth(70);
    obj.label258:setHeight(25);
    obj.label258:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label258, "fontStyle",  "bold");
    obj.label258:setName("label258");

    obj.edit289 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout52);
    obj.edit289:setVertTextAlign("center");
    obj.edit289:setLeft(425);
    obj.edit289:setTop(31);
    obj.edit289:setWidth(53);
    obj.edit289:setHeight(25);
    obj.edit289:setField("ataque2");
    obj.edit289:setType("number");
    obj.edit289:setName("edit289");

    obj.label259 = GUI.fromHandle(_obj_newObject("label"));
    obj.label259:setParent(obj.layout52);
    obj.label259:setLeft(370);
    obj.label259:setTop(55);
    obj.label259:setWidth(70);
    obj.label259:setHeight(25);
    obj.label259:setText("D. Base");
    lfm_setPropAsString(obj.label259, "fontStyle",  "bold");
    obj.label259:setName("label259");

    obj.edit290 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout52);
    obj.edit290:setVertTextAlign("center");
    obj.edit290:setLeft(425);
    obj.edit290:setTop(55);
    obj.edit290:setWidth(53);
    obj.edit290:setHeight(25);
    obj.edit290:setField("dano2");
    obj.edit290:setName("edit290");

    obj.button60 = GUI.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.layout52);
    obj.button60:setLeft(488);
    obj.button60:setTop(6);
    obj.button60:setWidth(82);
    obj.button60:setText("Acerto");
    obj.button60:setFontSize(11);
    lfm_setPropAsString(obj.button60, "fontStyle",  "bold");
    obj.button60:setName("button60");

    obj.button61 = GUI.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.layout52);
    obj.button61:setLeft(488);
    obj.button61:setTop(31);
    obj.button61:setWidth(82);
    obj.button61:setText("Dano");
    obj.button61:setFontSize(11);
    lfm_setPropAsString(obj.button61, "fontStyle",  "bold");
    obj.button61:setName("button61");

    obj.button62 = GUI.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.layout52);
    obj.button62:setLeft(488);
    obj.button62:setTop(55);
    obj.button62:setWidth(82);
    obj.button62:setText("Crítico");
    obj.button62:setFontSize(11);
    lfm_setPropAsString(obj.button62, "fontStyle",  "bold");
    obj.button62:setName("button62");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout52);
    obj.textEditor15:setLeft(575);
    obj.textEditor15:setTop(5);
    obj.textEditor15:setWidth(295);
    obj.textEditor15:setHeight(75);
    obj.textEditor15:setField("campoEfeitoGolpes2");
    obj.textEditor15:setName("textEditor15");

    obj.label260 = GUI.fromHandle(_obj_newObject("label"));
    obj.label260:setParent(obj.layout52);
    obj.label260:setLeft(875);
    obj.label260:setTop(5);
    obj.label260:setWidth(80);
    obj.label260:setHeight(25);
    obj.label260:setText("Aptidão");
    lfm_setPropAsString(obj.label260, "fontStyle",  "bold");
    obj.label260:setName("label260");

    obj.edit291 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout52);
    obj.edit291:setVertTextAlign("center");
    obj.edit291:setLeft(940);
    obj.edit291:setTop(5);
    obj.edit291:setWidth(120);
    obj.edit291:setHeight(25);
    obj.edit291:setField("tipoContest2");
    obj.edit291:setName("edit291");

    obj.label261 = GUI.fromHandle(_obj_newObject("label"));
    obj.label261:setParent(obj.layout52);
    obj.label261:setLeft(875);
    obj.label261:setTop(30);
    obj.label261:setWidth(80);
    obj.label261:setHeight(25);
    obj.label261:setText("Concursos");
    lfm_setPropAsString(obj.label261, "fontStyle",  "bold");
    obj.label261:setName("label261");

    obj.edit292 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout52);
    obj.edit292:setVertTextAlign("center");
    obj.edit292:setLeft(940);
    obj.edit292:setTop(30);
    obj.edit292:setWidth(120);
    obj.edit292:setHeight(25);
    obj.edit292:setField("efeitoContest2");
    obj.edit292:setName("edit292");

    obj.label262 = GUI.fromHandle(_obj_newObject("label"));
    obj.label262:setParent(obj.layout52);
    obj.label262:setLeft(875);
    obj.label262:setTop(55);
    obj.label262:setWidth(80);
    obj.label262:setHeight(25);
    obj.label262:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label262, "fontStyle",  "bold");
    obj.label262:setName("label262");

    obj.edit293 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout52);
    obj.edit293:setVertTextAlign("center");
    obj.edit293:setLeft(940);
    obj.edit293:setTop(55);
    obj.edit293:setWidth(120);
    obj.edit293:setHeight(25);
    obj.edit293:setField("BDano2");
    obj.edit293:setName("edit293");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout50);
    obj.layout53:setLeft(2);
    obj.layout53:setTop(192);
    obj.layout53:setWidth(1207);
    obj.layout53:setHeight(92);
    obj.layout53:setName("layout53");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout53);
    obj.rectangle62:setAlign("client");
    obj.rectangle62:setColor("black");
    obj.rectangle62:setName("rectangle62");

    obj.label263 = GUI.fromHandle(_obj_newObject("label"));
    obj.label263:setParent(obj.layout53);
    obj.label263:setLeft(5);
    obj.label263:setTop(5);
    obj.label263:setWidth(70);
    obj.label263:setHeight(25);
    obj.label263:setText("Golpe");
    lfm_setPropAsString(obj.label263, "fontStyle",  "bold");
    obj.label263:setName("label263");

    obj.edit294 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.layout53);
    obj.edit294:setVertTextAlign("center");
    obj.edit294:setLeft(75);
    obj.edit294:setTop(5);
    obj.edit294:setWidth(160);
    obj.edit294:setHeight(25);
    obj.edit294:setField("golpe3");
    obj.edit294:setName("edit294");

    obj.label264 = GUI.fromHandle(_obj_newObject("label"));
    obj.label264:setParent(obj.layout53);
    obj.label264:setLeft(5);
    obj.label264:setTop(30);
    obj.label264:setWidth(80);
    obj.label264:setHeight(25);
    obj.label264:setText("Descritores");
    lfm_setPropAsString(obj.label264, "fontStyle",  "bold");
    obj.label264:setName("label264");

    obj.edit295 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.layout53);
    obj.edit295:setVertTextAlign("center");
    obj.edit295:setLeft(75);
    obj.edit295:setTop(30);
    obj.edit295:setWidth(160);
    obj.edit295:setHeight(25);
    obj.edit295:setField("Descritores3");
    obj.edit295:setName("edit295");

    obj.label265 = GUI.fromHandle(_obj_newObject("label"));
    obj.label265:setParent(obj.layout53);
    obj.label265:setLeft(5);
    obj.label265:setTop(55);
    obj.label265:setWidth(70);
    obj.label265:setHeight(25);
    obj.label265:setText("Alcance");
    lfm_setPropAsString(obj.label265, "fontStyle",  "bold");
    obj.label265:setName("label265");

    obj.edit296 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit296:setParent(obj.layout53);
    obj.edit296:setVertTextAlign("center");
    obj.edit296:setLeft(75);
    obj.edit296:setTop(55);
    obj.edit296:setWidth(160);
    obj.edit296:setHeight(25);
    obj.edit296:setField("alcance3");
    obj.edit296:setName("edit296");

    obj.label266 = GUI.fromHandle(_obj_newObject("label"));
    obj.label266:setParent(obj.layout53);
    obj.label266:setLeft(240);
    obj.label266:setTop(6);
    obj.label266:setWidth(50);
    obj.label266:setHeight(25);
    obj.label266:setText("Tipo");
    lfm_setPropAsString(obj.label266, "fontStyle",  "bold");
    obj.label266:setName("label266");

    obj.edit297 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit297:setParent(obj.layout53);
    obj.edit297:setVertTextAlign("center");
    obj.edit297:setLeft(282);
    obj.edit297:setTop(6);
    obj.edit297:setWidth(82);
    obj.edit297:setHeight(25);
    obj.edit297:setField("tipo3");
    obj.edit297:setName("edit297");

    obj.label267 = GUI.fromHandle(_obj_newObject("label"));
    obj.label267:setParent(obj.layout53);
    obj.label267:setLeft(240);
    obj.label267:setTop(31);
    obj.label267:setWidth(50);
    obj.label267:setHeight(25);
    obj.label267:setText("Classe");
    lfm_setPropAsString(obj.label267, "fontStyle",  "bold");
    obj.label267:setName("label267");

    obj.comboBox28 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.layout53);
    obj.comboBox28:setLeft(282);
    obj.comboBox28:setTop(31);
    obj.comboBox28:setWidth(82);
    obj.comboBox28:setHeight(25);
    obj.comboBox28:setField("classe3");
    obj.comboBox28:setHorzTextAlign("center");
    obj.comboBox28:setItems({'Ataque', 'Especial', 'Efeito','Arma'});
    obj.comboBox28:setValues({'1', '2', '3','4'});
    obj.comboBox28:setName("comboBox28");

    obj.label268 = GUI.fromHandle(_obj_newObject("label"));
    obj.label268:setParent(obj.layout53);
    obj.label268:setLeft(240);
    obj.label268:setTop(55);
    obj.label268:setWidth(50);
    obj.label268:setHeight(25);
    obj.label268:setText("Freq.");
    lfm_setPropAsString(obj.label268, "fontStyle",  "bold");
    obj.label268:setName("label268");

    obj.edit298 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit298:setParent(obj.layout53);
    obj.edit298:setVertTextAlign("center");
    obj.edit298:setLeft(282);
    obj.edit298:setTop(55);
    obj.edit298:setWidth(82);
    obj.edit298:setHeight(25);
    obj.edit298:setField("frequencia3");
    obj.edit298:setName("edit298");

    obj.label269 = GUI.fromHandle(_obj_newObject("label"));
    obj.label269:setParent(obj.layout53);
    obj.label269:setLeft(370);
    obj.label269:setTop(6);
    obj.label269:setWidth(70);
    obj.label269:setHeight(25);
    obj.label269:setText("Acurácia");
    lfm_setPropAsString(obj.label269, "fontStyle",  "bold");
    obj.label269:setName("label269");

    obj.edit299 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit299:setParent(obj.layout53);
    obj.edit299:setVertTextAlign("center");
    obj.edit299:setLeft(425);
    obj.edit299:setTop(6);
    obj.edit299:setWidth(53);
    obj.edit299:setHeight(25);
    obj.edit299:setField("Acc3");
    obj.edit299:setType("number");
    obj.edit299:setName("edit299");

    obj.label270 = GUI.fromHandle(_obj_newObject("label"));
    obj.label270:setParent(obj.layout53);
    obj.label270:setLeft(370);
    obj.label270:setTop(31);
    obj.label270:setWidth(70);
    obj.label270:setHeight(25);
    obj.label270:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label270, "fontStyle",  "bold");
    obj.label270:setName("label270");

    obj.edit300 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit300:setParent(obj.layout53);
    obj.edit300:setVertTextAlign("center");
    obj.edit300:setLeft(425);
    obj.edit300:setTop(31);
    obj.edit300:setWidth(53);
    obj.edit300:setHeight(25);
    obj.edit300:setField("ataque3");
    obj.edit300:setType("number");
    obj.edit300:setName("edit300");

    obj.label271 = GUI.fromHandle(_obj_newObject("label"));
    obj.label271:setParent(obj.layout53);
    obj.label271:setLeft(370);
    obj.label271:setTop(55);
    obj.label271:setWidth(70);
    obj.label271:setHeight(25);
    obj.label271:setText("D. Base");
    lfm_setPropAsString(obj.label271, "fontStyle",  "bold");
    obj.label271:setName("label271");

    obj.edit301 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit301:setParent(obj.layout53);
    obj.edit301:setVertTextAlign("center");
    obj.edit301:setLeft(425);
    obj.edit301:setTop(55);
    obj.edit301:setWidth(53);
    obj.edit301:setHeight(25);
    obj.edit301:setField("dano3");
    obj.edit301:setName("edit301");

    obj.button63 = GUI.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.layout53);
    obj.button63:setLeft(488);
    obj.button63:setTop(6);
    obj.button63:setWidth(82);
    obj.button63:setText("Acerto");
    obj.button63:setFontSize(11);
    lfm_setPropAsString(obj.button63, "fontStyle",  "bold");
    obj.button63:setName("button63");

    obj.button64 = GUI.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.layout53);
    obj.button64:setLeft(488);
    obj.button64:setTop(31);
    obj.button64:setWidth(82);
    obj.button64:setText("Dano");
    obj.button64:setFontSize(11);
    lfm_setPropAsString(obj.button64, "fontStyle",  "bold");
    obj.button64:setName("button64");

    obj.button65 = GUI.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.layout53);
    obj.button65:setLeft(488);
    obj.button65:setTop(55);
    obj.button65:setWidth(82);
    obj.button65:setText("Crítico");
    obj.button65:setFontSize(11);
    lfm_setPropAsString(obj.button65, "fontStyle",  "bold");
    obj.button65:setName("button65");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout53);
    obj.textEditor16:setLeft(575);
    obj.textEditor16:setTop(5);
    obj.textEditor16:setWidth(295);
    obj.textEditor16:setHeight(75);
    obj.textEditor16:setField("campoEfeitoGolpes3");
    obj.textEditor16:setName("textEditor16");

    obj.label272 = GUI.fromHandle(_obj_newObject("label"));
    obj.label272:setParent(obj.layout53);
    obj.label272:setLeft(875);
    obj.label272:setTop(5);
    obj.label272:setWidth(80);
    obj.label272:setHeight(25);
    obj.label272:setText("Aptidão");
    lfm_setPropAsString(obj.label272, "fontStyle",  "bold");
    obj.label272:setName("label272");

    obj.edit302 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit302:setParent(obj.layout53);
    obj.edit302:setVertTextAlign("center");
    obj.edit302:setLeft(940);
    obj.edit302:setTop(5);
    obj.edit302:setWidth(120);
    obj.edit302:setHeight(25);
    obj.edit302:setField("tipoContest3");
    obj.edit302:setName("edit302");

    obj.label273 = GUI.fromHandle(_obj_newObject("label"));
    obj.label273:setParent(obj.layout53);
    obj.label273:setLeft(875);
    obj.label273:setTop(30);
    obj.label273:setWidth(80);
    obj.label273:setHeight(25);
    obj.label273:setText("Concursos");
    lfm_setPropAsString(obj.label273, "fontStyle",  "bold");
    obj.label273:setName("label273");

    obj.edit303 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit303:setParent(obj.layout53);
    obj.edit303:setVertTextAlign("center");
    obj.edit303:setLeft(940);
    obj.edit303:setTop(30);
    obj.edit303:setWidth(120);
    obj.edit303:setHeight(25);
    obj.edit303:setField("efeitoContest3");
    obj.edit303:setName("edit303");

    obj.label274 = GUI.fromHandle(_obj_newObject("label"));
    obj.label274:setParent(obj.layout53);
    obj.label274:setLeft(875);
    obj.label274:setTop(55);
    obj.label274:setWidth(80);
    obj.label274:setHeight(25);
    obj.label274:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label274, "fontStyle",  "bold");
    obj.label274:setName("label274");

    obj.edit304 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit304:setParent(obj.layout53);
    obj.edit304:setVertTextAlign("center");
    obj.edit304:setLeft(940);
    obj.edit304:setTop(55);
    obj.edit304:setWidth(120);
    obj.edit304:setHeight(25);
    obj.edit304:setField("BDano3");
    obj.edit304:setName("edit304");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout50);
    obj.layout54:setLeft(2);
    obj.layout54:setTop(288);
    obj.layout54:setWidth(1207);
    obj.layout54:setHeight(92);
    obj.layout54:setName("layout54");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout54);
    obj.rectangle63:setAlign("client");
    obj.rectangle63:setColor("black");
    obj.rectangle63:setName("rectangle63");

    obj.label275 = GUI.fromHandle(_obj_newObject("label"));
    obj.label275:setParent(obj.layout54);
    obj.label275:setLeft(5);
    obj.label275:setTop(5);
    obj.label275:setWidth(70);
    obj.label275:setHeight(25);
    obj.label275:setText("Golpe");
    lfm_setPropAsString(obj.label275, "fontStyle",  "bold");
    obj.label275:setName("label275");

    obj.edit305 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit305:setParent(obj.layout54);
    obj.edit305:setVertTextAlign("center");
    obj.edit305:setLeft(75);
    obj.edit305:setTop(5);
    obj.edit305:setWidth(160);
    obj.edit305:setHeight(25);
    obj.edit305:setField("golpe4");
    obj.edit305:setName("edit305");

    obj.label276 = GUI.fromHandle(_obj_newObject("label"));
    obj.label276:setParent(obj.layout54);
    obj.label276:setLeft(5);
    obj.label276:setTop(30);
    obj.label276:setWidth(80);
    obj.label276:setHeight(25);
    obj.label276:setText("Descritores");
    lfm_setPropAsString(obj.label276, "fontStyle",  "bold");
    obj.label276:setName("label276");

    obj.edit306 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit306:setParent(obj.layout54);
    obj.edit306:setVertTextAlign("center");
    obj.edit306:setLeft(75);
    obj.edit306:setTop(30);
    obj.edit306:setWidth(160);
    obj.edit306:setHeight(25);
    obj.edit306:setField("Descritores4");
    obj.edit306:setName("edit306");

    obj.label277 = GUI.fromHandle(_obj_newObject("label"));
    obj.label277:setParent(obj.layout54);
    obj.label277:setLeft(5);
    obj.label277:setTop(55);
    obj.label277:setWidth(70);
    obj.label277:setHeight(25);
    obj.label277:setText("Alcance");
    lfm_setPropAsString(obj.label277, "fontStyle",  "bold");
    obj.label277:setName("label277");

    obj.edit307 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit307:setParent(obj.layout54);
    obj.edit307:setVertTextAlign("center");
    obj.edit307:setLeft(75);
    obj.edit307:setTop(55);
    obj.edit307:setWidth(160);
    obj.edit307:setHeight(25);
    obj.edit307:setField("alcance4");
    obj.edit307:setName("edit307");

    obj.label278 = GUI.fromHandle(_obj_newObject("label"));
    obj.label278:setParent(obj.layout54);
    obj.label278:setLeft(240);
    obj.label278:setTop(6);
    obj.label278:setWidth(50);
    obj.label278:setHeight(25);
    obj.label278:setText("Tipo");
    lfm_setPropAsString(obj.label278, "fontStyle",  "bold");
    obj.label278:setName("label278");

    obj.edit308 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit308:setParent(obj.layout54);
    obj.edit308:setVertTextAlign("center");
    obj.edit308:setLeft(282);
    obj.edit308:setTop(6);
    obj.edit308:setWidth(82);
    obj.edit308:setHeight(25);
    obj.edit308:setField("tipo4");
    obj.edit308:setName("edit308");

    obj.label279 = GUI.fromHandle(_obj_newObject("label"));
    obj.label279:setParent(obj.layout54);
    obj.label279:setLeft(240);
    obj.label279:setTop(31);
    obj.label279:setWidth(50);
    obj.label279:setHeight(25);
    obj.label279:setText("Classe");
    lfm_setPropAsString(obj.label279, "fontStyle",  "bold");
    obj.label279:setName("label279");

    obj.comboBox29 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.layout54);
    obj.comboBox29:setLeft(282);
    obj.comboBox29:setTop(31);
    obj.comboBox29:setWidth(82);
    obj.comboBox29:setHeight(25);
    obj.comboBox29:setField("classe4");
    obj.comboBox29:setHorzTextAlign("center");
    obj.comboBox29:setItems({'Ataque', 'Especial', 'Efeito','Arma'});
    obj.comboBox29:setValues({'1', '2', '3','4'});
    obj.comboBox29:setName("comboBox29");

    obj.label280 = GUI.fromHandle(_obj_newObject("label"));
    obj.label280:setParent(obj.layout54);
    obj.label280:setLeft(240);
    obj.label280:setTop(55);
    obj.label280:setWidth(50);
    obj.label280:setHeight(25);
    obj.label280:setText("Freq.");
    lfm_setPropAsString(obj.label280, "fontStyle",  "bold");
    obj.label280:setName("label280");

    obj.edit309 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit309:setParent(obj.layout54);
    obj.edit309:setVertTextAlign("center");
    obj.edit309:setLeft(282);
    obj.edit309:setTop(55);
    obj.edit309:setWidth(82);
    obj.edit309:setHeight(25);
    obj.edit309:setField("frequencia4");
    obj.edit309:setName("edit309");

    obj.label281 = GUI.fromHandle(_obj_newObject("label"));
    obj.label281:setParent(obj.layout54);
    obj.label281:setLeft(370);
    obj.label281:setTop(6);
    obj.label281:setWidth(70);
    obj.label281:setHeight(25);
    obj.label281:setText("Acurácia");
    lfm_setPropAsString(obj.label281, "fontStyle",  "bold");
    obj.label281:setName("label281");

    obj.edit310 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit310:setParent(obj.layout54);
    obj.edit310:setVertTextAlign("center");
    obj.edit310:setLeft(425);
    obj.edit310:setTop(6);
    obj.edit310:setWidth(53);
    obj.edit310:setHeight(25);
    obj.edit310:setField("Acc4");
    obj.edit310:setType("number");
    obj.edit310:setName("edit310");

    obj.label282 = GUI.fromHandle(_obj_newObject("label"));
    obj.label282:setParent(obj.layout54);
    obj.label282:setLeft(370);
    obj.label282:setTop(31);
    obj.label282:setWidth(70);
    obj.label282:setHeight(25);
    obj.label282:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label282, "fontStyle",  "bold");
    obj.label282:setName("label282");

    obj.edit311 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit311:setParent(obj.layout54);
    obj.edit311:setVertTextAlign("center");
    obj.edit311:setLeft(425);
    obj.edit311:setTop(31);
    obj.edit311:setWidth(53);
    obj.edit311:setHeight(25);
    obj.edit311:setField("ataque4");
    obj.edit311:setType("number");
    obj.edit311:setName("edit311");

    obj.label283 = GUI.fromHandle(_obj_newObject("label"));
    obj.label283:setParent(obj.layout54);
    obj.label283:setLeft(370);
    obj.label283:setTop(55);
    obj.label283:setWidth(70);
    obj.label283:setHeight(25);
    obj.label283:setText("D. Base");
    lfm_setPropAsString(obj.label283, "fontStyle",  "bold");
    obj.label283:setName("label283");

    obj.edit312 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit312:setParent(obj.layout54);
    obj.edit312:setVertTextAlign("center");
    obj.edit312:setLeft(425);
    obj.edit312:setTop(55);
    obj.edit312:setWidth(53);
    obj.edit312:setHeight(25);
    obj.edit312:setField("dano4");
    obj.edit312:setName("edit312");

    obj.button66 = GUI.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.layout54);
    obj.button66:setLeft(488);
    obj.button66:setTop(6);
    obj.button66:setWidth(82);
    obj.button66:setText("Acerto");
    obj.button66:setFontSize(11);
    lfm_setPropAsString(obj.button66, "fontStyle",  "bold");
    obj.button66:setName("button66");

    obj.button67 = GUI.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.layout54);
    obj.button67:setLeft(488);
    obj.button67:setTop(31);
    obj.button67:setWidth(82);
    obj.button67:setText("Dano");
    obj.button67:setFontSize(11);
    lfm_setPropAsString(obj.button67, "fontStyle",  "bold");
    obj.button67:setName("button67");

    obj.button68 = GUI.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.layout54);
    obj.button68:setLeft(488);
    obj.button68:setTop(55);
    obj.button68:setWidth(82);
    obj.button68:setText("Crítico");
    obj.button68:setFontSize(11);
    lfm_setPropAsString(obj.button68, "fontStyle",  "bold");
    obj.button68:setName("button68");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout54);
    obj.textEditor17:setLeft(575);
    obj.textEditor17:setTop(5);
    obj.textEditor17:setWidth(295);
    obj.textEditor17:setHeight(75);
    obj.textEditor17:setField("campoEfeitoGolpes4");
    obj.textEditor17:setName("textEditor17");

    obj.label284 = GUI.fromHandle(_obj_newObject("label"));
    obj.label284:setParent(obj.layout54);
    obj.label284:setLeft(875);
    obj.label284:setTop(5);
    obj.label284:setWidth(80);
    obj.label284:setHeight(25);
    obj.label284:setText("Aptidão");
    lfm_setPropAsString(obj.label284, "fontStyle",  "bold");
    obj.label284:setName("label284");

    obj.edit313 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit313:setParent(obj.layout54);
    obj.edit313:setVertTextAlign("center");
    obj.edit313:setLeft(940);
    obj.edit313:setTop(5);
    obj.edit313:setWidth(120);
    obj.edit313:setHeight(25);
    obj.edit313:setField("tipoContest4");
    obj.edit313:setName("edit313");

    obj.label285 = GUI.fromHandle(_obj_newObject("label"));
    obj.label285:setParent(obj.layout54);
    obj.label285:setLeft(875);
    obj.label285:setTop(30);
    obj.label285:setWidth(80);
    obj.label285:setHeight(25);
    obj.label285:setText("Concursos");
    lfm_setPropAsString(obj.label285, "fontStyle",  "bold");
    obj.label285:setName("label285");

    obj.edit314 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit314:setParent(obj.layout54);
    obj.edit314:setVertTextAlign("center");
    obj.edit314:setLeft(940);
    obj.edit314:setTop(30);
    obj.edit314:setWidth(120);
    obj.edit314:setHeight(25);
    obj.edit314:setField("efeitoContest4");
    obj.edit314:setName("edit314");

    obj.label286 = GUI.fromHandle(_obj_newObject("label"));
    obj.label286:setParent(obj.layout54);
    obj.label286:setLeft(875);
    obj.label286:setTop(55);
    obj.label286:setWidth(80);
    obj.label286:setHeight(25);
    obj.label286:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label286, "fontStyle",  "bold");
    obj.label286:setName("label286");

    obj.edit315 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit315:setParent(obj.layout54);
    obj.edit315:setVertTextAlign("center");
    obj.edit315:setLeft(940);
    obj.edit315:setTop(55);
    obj.edit315:setWidth(120);
    obj.edit315:setHeight(25);
    obj.edit315:setField("BDano4");
    obj.edit315:setName("edit315");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout50);
    obj.layout55:setLeft(2);
    obj.layout55:setTop(383);
    obj.layout55:setWidth(1207);
    obj.layout55:setHeight(92);
    obj.layout55:setName("layout55");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout55);
    obj.rectangle64:setAlign("client");
    obj.rectangle64:setColor("black");
    obj.rectangle64:setName("rectangle64");

    obj.label287 = GUI.fromHandle(_obj_newObject("label"));
    obj.label287:setParent(obj.layout55);
    obj.label287:setLeft(5);
    obj.label287:setTop(5);
    obj.label287:setWidth(70);
    obj.label287:setHeight(25);
    obj.label287:setText("Golpe");
    lfm_setPropAsString(obj.label287, "fontStyle",  "bold");
    obj.label287:setName("label287");

    obj.edit316 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit316:setParent(obj.layout55);
    obj.edit316:setVertTextAlign("center");
    obj.edit316:setLeft(75);
    obj.edit316:setTop(5);
    obj.edit316:setWidth(160);
    obj.edit316:setHeight(25);
    obj.edit316:setField("golpe5");
    obj.edit316:setName("edit316");

    obj.label288 = GUI.fromHandle(_obj_newObject("label"));
    obj.label288:setParent(obj.layout55);
    obj.label288:setLeft(5);
    obj.label288:setTop(30);
    obj.label288:setWidth(80);
    obj.label288:setHeight(25);
    obj.label288:setText("Descritores");
    lfm_setPropAsString(obj.label288, "fontStyle",  "bold");
    obj.label288:setName("label288");

    obj.edit317 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit317:setParent(obj.layout55);
    obj.edit317:setVertTextAlign("center");
    obj.edit317:setLeft(75);
    obj.edit317:setTop(30);
    obj.edit317:setWidth(160);
    obj.edit317:setHeight(25);
    obj.edit317:setField("Descritores5");
    obj.edit317:setName("edit317");

    obj.label289 = GUI.fromHandle(_obj_newObject("label"));
    obj.label289:setParent(obj.layout55);
    obj.label289:setLeft(5);
    obj.label289:setTop(55);
    obj.label289:setWidth(70);
    obj.label289:setHeight(25);
    obj.label289:setText("Alcance");
    lfm_setPropAsString(obj.label289, "fontStyle",  "bold");
    obj.label289:setName("label289");

    obj.edit318 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit318:setParent(obj.layout55);
    obj.edit318:setVertTextAlign("center");
    obj.edit318:setLeft(75);
    obj.edit318:setTop(55);
    obj.edit318:setWidth(160);
    obj.edit318:setHeight(25);
    obj.edit318:setField("alcance5");
    obj.edit318:setName("edit318");

    obj.label290 = GUI.fromHandle(_obj_newObject("label"));
    obj.label290:setParent(obj.layout55);
    obj.label290:setLeft(240);
    obj.label290:setTop(6);
    obj.label290:setWidth(50);
    obj.label290:setHeight(25);
    obj.label290:setText("Tipo");
    lfm_setPropAsString(obj.label290, "fontStyle",  "bold");
    obj.label290:setName("label290");

    obj.edit319 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit319:setParent(obj.layout55);
    obj.edit319:setVertTextAlign("center");
    obj.edit319:setLeft(282);
    obj.edit319:setTop(6);
    obj.edit319:setWidth(82);
    obj.edit319:setHeight(25);
    obj.edit319:setField("tipo5");
    obj.edit319:setName("edit319");

    obj.label291 = GUI.fromHandle(_obj_newObject("label"));
    obj.label291:setParent(obj.layout55);
    obj.label291:setLeft(240);
    obj.label291:setTop(31);
    obj.label291:setWidth(50);
    obj.label291:setHeight(25);
    obj.label291:setText("Classe");
    lfm_setPropAsString(obj.label291, "fontStyle",  "bold");
    obj.label291:setName("label291");

    obj.comboBox30 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox30:setParent(obj.layout55);
    obj.comboBox30:setLeft(282);
    obj.comboBox30:setTop(31);
    obj.comboBox30:setWidth(82);
    obj.comboBox30:setHeight(25);
    obj.comboBox30:setField("classe5");
    obj.comboBox30:setHorzTextAlign("center");
    obj.comboBox30:setItems({'Ataque', 'Especial', 'Efeito','Arma'});
    obj.comboBox30:setValues({'1', '2', '3','4'});
    obj.comboBox30:setName("comboBox30");

    obj.label292 = GUI.fromHandle(_obj_newObject("label"));
    obj.label292:setParent(obj.layout55);
    obj.label292:setLeft(240);
    obj.label292:setTop(55);
    obj.label292:setWidth(50);
    obj.label292:setHeight(25);
    obj.label292:setText("Freq.");
    lfm_setPropAsString(obj.label292, "fontStyle",  "bold");
    obj.label292:setName("label292");

    obj.edit320 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit320:setParent(obj.layout55);
    obj.edit320:setVertTextAlign("center");
    obj.edit320:setLeft(282);
    obj.edit320:setTop(55);
    obj.edit320:setWidth(82);
    obj.edit320:setHeight(25);
    obj.edit320:setField("frequencia5");
    obj.edit320:setName("edit320");

    obj.label293 = GUI.fromHandle(_obj_newObject("label"));
    obj.label293:setParent(obj.layout55);
    obj.label293:setLeft(370);
    obj.label293:setTop(6);
    obj.label293:setWidth(70);
    obj.label293:setHeight(25);
    obj.label293:setText("Acurácia");
    lfm_setPropAsString(obj.label293, "fontStyle",  "bold");
    obj.label293:setName("label293");

    obj.edit321 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit321:setParent(obj.layout55);
    obj.edit321:setVertTextAlign("center");
    obj.edit321:setLeft(425);
    obj.edit321:setTop(6);
    obj.edit321:setWidth(53);
    obj.edit321:setHeight(25);
    obj.edit321:setField("Acc5");
    obj.edit321:setType("number");
    obj.edit321:setName("edit321");

    obj.label294 = GUI.fromHandle(_obj_newObject("label"));
    obj.label294:setParent(obj.layout55);
    obj.label294:setLeft(370);
    obj.label294:setTop(31);
    obj.label294:setWidth(70);
    obj.label294:setHeight(25);
    obj.label294:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label294, "fontStyle",  "bold");
    obj.label294:setName("label294");

    obj.edit322 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit322:setParent(obj.layout55);
    obj.edit322:setVertTextAlign("center");
    obj.edit322:setLeft(425);
    obj.edit322:setTop(31);
    obj.edit322:setWidth(53);
    obj.edit322:setHeight(25);
    obj.edit322:setField("ataque5");
    obj.edit322:setType("number");
    obj.edit322:setName("edit322");

    obj.label295 = GUI.fromHandle(_obj_newObject("label"));
    obj.label295:setParent(obj.layout55);
    obj.label295:setLeft(370);
    obj.label295:setTop(55);
    obj.label295:setWidth(70);
    obj.label295:setHeight(25);
    obj.label295:setText("D. Base");
    lfm_setPropAsString(obj.label295, "fontStyle",  "bold");
    obj.label295:setName("label295");

    obj.edit323 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit323:setParent(obj.layout55);
    obj.edit323:setVertTextAlign("center");
    obj.edit323:setLeft(425);
    obj.edit323:setTop(55);
    obj.edit323:setWidth(53);
    obj.edit323:setHeight(25);
    obj.edit323:setField("dano5");
    obj.edit323:setName("edit323");

    obj.button69 = GUI.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.layout55);
    obj.button69:setLeft(488);
    obj.button69:setTop(6);
    obj.button69:setWidth(82);
    obj.button69:setText("Acerto");
    obj.button69:setFontSize(11);
    lfm_setPropAsString(obj.button69, "fontStyle",  "bold");
    obj.button69:setName("button69");

    obj.button70 = GUI.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.layout55);
    obj.button70:setLeft(488);
    obj.button70:setTop(31);
    obj.button70:setWidth(82);
    obj.button70:setText("Dano");
    obj.button70:setFontSize(11);
    lfm_setPropAsString(obj.button70, "fontStyle",  "bold");
    obj.button70:setName("button70");

    obj.button71 = GUI.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.layout55);
    obj.button71:setLeft(488);
    obj.button71:setTop(55);
    obj.button71:setWidth(82);
    obj.button71:setText("Crítico");
    obj.button71:setFontSize(11);
    lfm_setPropAsString(obj.button71, "fontStyle",  "bold");
    obj.button71:setName("button71");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout55);
    obj.textEditor18:setLeft(575);
    obj.textEditor18:setTop(5);
    obj.textEditor18:setWidth(295);
    obj.textEditor18:setHeight(75);
    obj.textEditor18:setField("campoEfeitoGolpes5");
    obj.textEditor18:setName("textEditor18");

    obj.label296 = GUI.fromHandle(_obj_newObject("label"));
    obj.label296:setParent(obj.layout55);
    obj.label296:setLeft(875);
    obj.label296:setTop(5);
    obj.label296:setWidth(80);
    obj.label296:setHeight(25);
    obj.label296:setText("Aptidão");
    lfm_setPropAsString(obj.label296, "fontStyle",  "bold");
    obj.label296:setName("label296");

    obj.edit324 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit324:setParent(obj.layout55);
    obj.edit324:setVertTextAlign("center");
    obj.edit324:setLeft(940);
    obj.edit324:setTop(5);
    obj.edit324:setWidth(120);
    obj.edit324:setHeight(25);
    obj.edit324:setField("tipoContest5");
    obj.edit324:setName("edit324");

    obj.label297 = GUI.fromHandle(_obj_newObject("label"));
    obj.label297:setParent(obj.layout55);
    obj.label297:setLeft(875);
    obj.label297:setTop(30);
    obj.label297:setWidth(80);
    obj.label297:setHeight(25);
    obj.label297:setText("Concursos");
    lfm_setPropAsString(obj.label297, "fontStyle",  "bold");
    obj.label297:setName("label297");

    obj.edit325 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit325:setParent(obj.layout55);
    obj.edit325:setVertTextAlign("center");
    obj.edit325:setLeft(940);
    obj.edit325:setTop(30);
    obj.edit325:setWidth(120);
    obj.edit325:setHeight(25);
    obj.edit325:setField("efeitoContest5");
    obj.edit325:setName("edit325");

    obj.label298 = GUI.fromHandle(_obj_newObject("label"));
    obj.label298:setParent(obj.layout55);
    obj.label298:setLeft(875);
    obj.label298:setTop(55);
    obj.label298:setWidth(80);
    obj.label298:setHeight(25);
    obj.label298:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label298, "fontStyle",  "bold");
    obj.label298:setName("label298");

    obj.edit326 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit326:setParent(obj.layout55);
    obj.edit326:setVertTextAlign("center");
    obj.edit326:setLeft(940);
    obj.edit326:setTop(55);
    obj.edit326:setWidth(120);
    obj.edit326:setHeight(25);
    obj.edit326:setField("BDano5");
    obj.edit326:setName("edit326");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout50);
    obj.layout56:setLeft(2);
    obj.layout56:setTop(478);
    obj.layout56:setWidth(1207);
    obj.layout56:setHeight(92);
    obj.layout56:setName("layout56");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout56);
    obj.rectangle65:setAlign("client");
    obj.rectangle65:setColor("black");
    obj.rectangle65:setName("rectangle65");

    obj.label299 = GUI.fromHandle(_obj_newObject("label"));
    obj.label299:setParent(obj.layout56);
    obj.label299:setLeft(5);
    obj.label299:setTop(5);
    obj.label299:setWidth(70);
    obj.label299:setHeight(25);
    obj.label299:setText("Golpe");
    lfm_setPropAsString(obj.label299, "fontStyle",  "bold");
    obj.label299:setName("label299");

    obj.edit327 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit327:setParent(obj.layout56);
    obj.edit327:setVertTextAlign("center");
    obj.edit327:setLeft(75);
    obj.edit327:setTop(5);
    obj.edit327:setWidth(160);
    obj.edit327:setHeight(25);
    obj.edit327:setField("golpe6");
    obj.edit327:setName("edit327");

    obj.label300 = GUI.fromHandle(_obj_newObject("label"));
    obj.label300:setParent(obj.layout56);
    obj.label300:setLeft(5);
    obj.label300:setTop(30);
    obj.label300:setWidth(80);
    obj.label300:setHeight(25);
    obj.label300:setText("Descritores");
    lfm_setPropAsString(obj.label300, "fontStyle",  "bold");
    obj.label300:setName("label300");

    obj.edit328 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit328:setParent(obj.layout56);
    obj.edit328:setVertTextAlign("center");
    obj.edit328:setLeft(75);
    obj.edit328:setTop(30);
    obj.edit328:setWidth(160);
    obj.edit328:setHeight(25);
    obj.edit328:setField("Descritores6");
    obj.edit328:setName("edit328");

    obj.label301 = GUI.fromHandle(_obj_newObject("label"));
    obj.label301:setParent(obj.layout56);
    obj.label301:setLeft(5);
    obj.label301:setTop(55);
    obj.label301:setWidth(70);
    obj.label301:setHeight(25);
    obj.label301:setText("Alcance");
    lfm_setPropAsString(obj.label301, "fontStyle",  "bold");
    obj.label301:setName("label301");

    obj.edit329 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit329:setParent(obj.layout56);
    obj.edit329:setVertTextAlign("center");
    obj.edit329:setLeft(75);
    obj.edit329:setTop(55);
    obj.edit329:setWidth(160);
    obj.edit329:setHeight(25);
    obj.edit329:setField("alcance6");
    obj.edit329:setName("edit329");

    obj.label302 = GUI.fromHandle(_obj_newObject("label"));
    obj.label302:setParent(obj.layout56);
    obj.label302:setLeft(240);
    obj.label302:setTop(6);
    obj.label302:setWidth(50);
    obj.label302:setHeight(25);
    obj.label302:setText("Tipo");
    lfm_setPropAsString(obj.label302, "fontStyle",  "bold");
    obj.label302:setName("label302");

    obj.edit330 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit330:setParent(obj.layout56);
    obj.edit330:setVertTextAlign("center");
    obj.edit330:setLeft(282);
    obj.edit330:setTop(6);
    obj.edit330:setWidth(82);
    obj.edit330:setHeight(25);
    obj.edit330:setField("tipo6");
    obj.edit330:setName("edit330");

    obj.label303 = GUI.fromHandle(_obj_newObject("label"));
    obj.label303:setParent(obj.layout56);
    obj.label303:setLeft(240);
    obj.label303:setTop(31);
    obj.label303:setWidth(50);
    obj.label303:setHeight(25);
    obj.label303:setText("Classe");
    lfm_setPropAsString(obj.label303, "fontStyle",  "bold");
    obj.label303:setName("label303");

    obj.comboBox31 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox31:setParent(obj.layout56);
    obj.comboBox31:setLeft(282);
    obj.comboBox31:setTop(31);
    obj.comboBox31:setWidth(82);
    obj.comboBox31:setHeight(25);
    obj.comboBox31:setField("classe6");
    obj.comboBox31:setHorzTextAlign("center");
    obj.comboBox31:setItems({'Ataque', 'Especial', 'Efeito','Arma'});
    obj.comboBox31:setValues({'1', '2', '3','4'});
    obj.comboBox31:setName("comboBox31");

    obj.label304 = GUI.fromHandle(_obj_newObject("label"));
    obj.label304:setParent(obj.layout56);
    obj.label304:setLeft(240);
    obj.label304:setTop(55);
    obj.label304:setWidth(50);
    obj.label304:setHeight(25);
    obj.label304:setText("Freq.");
    lfm_setPropAsString(obj.label304, "fontStyle",  "bold");
    obj.label304:setName("label304");

    obj.edit331 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit331:setParent(obj.layout56);
    obj.edit331:setVertTextAlign("center");
    obj.edit331:setLeft(282);
    obj.edit331:setTop(55);
    obj.edit331:setWidth(82);
    obj.edit331:setHeight(25);
    obj.edit331:setField("frequencia6");
    obj.edit331:setName("edit331");

    obj.label305 = GUI.fromHandle(_obj_newObject("label"));
    obj.label305:setParent(obj.layout56);
    obj.label305:setLeft(370);
    obj.label305:setTop(6);
    obj.label305:setWidth(70);
    obj.label305:setHeight(25);
    obj.label305:setText("Acurácia");
    lfm_setPropAsString(obj.label305, "fontStyle",  "bold");
    obj.label305:setName("label305");

    obj.edit332 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit332:setParent(obj.layout56);
    obj.edit332:setVertTextAlign("center");
    obj.edit332:setLeft(425);
    obj.edit332:setTop(6);
    obj.edit332:setWidth(53);
    obj.edit332:setHeight(25);
    obj.edit332:setField("Acc6");
    obj.edit332:setType("number");
    obj.edit332:setName("edit332");

    obj.label306 = GUI.fromHandle(_obj_newObject("label"));
    obj.label306:setParent(obj.layout56);
    obj.label306:setLeft(370);
    obj.label306:setTop(31);
    obj.label306:setWidth(70);
    obj.label306:setHeight(25);
    obj.label306:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label306, "fontStyle",  "bold");
    obj.label306:setName("label306");

    obj.edit333 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit333:setParent(obj.layout56);
    obj.edit333:setVertTextAlign("center");
    obj.edit333:setLeft(425);
    obj.edit333:setTop(31);
    obj.edit333:setWidth(53);
    obj.edit333:setHeight(25);
    obj.edit333:setField("ataque6");
    obj.edit333:setType("number");
    obj.edit333:setName("edit333");

    obj.label307 = GUI.fromHandle(_obj_newObject("label"));
    obj.label307:setParent(obj.layout56);
    obj.label307:setLeft(370);
    obj.label307:setTop(55);
    obj.label307:setWidth(70);
    obj.label307:setHeight(25);
    obj.label307:setText("D. Base");
    lfm_setPropAsString(obj.label307, "fontStyle",  "bold");
    obj.label307:setName("label307");

    obj.edit334 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit334:setParent(obj.layout56);
    obj.edit334:setVertTextAlign("center");
    obj.edit334:setLeft(425);
    obj.edit334:setTop(55);
    obj.edit334:setWidth(53);
    obj.edit334:setHeight(25);
    obj.edit334:setField("dano6");
    obj.edit334:setName("edit334");

    obj.button72 = GUI.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.layout56);
    obj.button72:setLeft(488);
    obj.button72:setTop(6);
    obj.button72:setWidth(82);
    obj.button72:setText("Acerto");
    obj.button72:setFontSize(11);
    lfm_setPropAsString(obj.button72, "fontStyle",  "bold");
    obj.button72:setName("button72");

    obj.button73 = GUI.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.layout56);
    obj.button73:setLeft(488);
    obj.button73:setTop(31);
    obj.button73:setWidth(82);
    obj.button73:setText("Dano");
    obj.button73:setFontSize(11);
    lfm_setPropAsString(obj.button73, "fontStyle",  "bold");
    obj.button73:setName("button73");

    obj.button74 = GUI.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.layout56);
    obj.button74:setLeft(488);
    obj.button74:setTop(55);
    obj.button74:setWidth(82);
    obj.button74:setText("Crítico");
    obj.button74:setFontSize(11);
    lfm_setPropAsString(obj.button74, "fontStyle",  "bold");
    obj.button74:setName("button74");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout56);
    obj.textEditor19:setLeft(575);
    obj.textEditor19:setTop(5);
    obj.textEditor19:setWidth(295);
    obj.textEditor19:setHeight(75);
    obj.textEditor19:setField("campoEfeitoGolpes6");
    obj.textEditor19:setName("textEditor19");

    obj.label308 = GUI.fromHandle(_obj_newObject("label"));
    obj.label308:setParent(obj.layout56);
    obj.label308:setLeft(875);
    obj.label308:setTop(5);
    obj.label308:setWidth(80);
    obj.label308:setHeight(25);
    obj.label308:setText("Aptidão");
    lfm_setPropAsString(obj.label308, "fontStyle",  "bold");
    obj.label308:setName("label308");

    obj.edit335 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit335:setParent(obj.layout56);
    obj.edit335:setVertTextAlign("center");
    obj.edit335:setLeft(940);
    obj.edit335:setTop(5);
    obj.edit335:setWidth(120);
    obj.edit335:setHeight(25);
    obj.edit335:setField("tipoContest6");
    obj.edit335:setName("edit335");

    obj.label309 = GUI.fromHandle(_obj_newObject("label"));
    obj.label309:setParent(obj.layout56);
    obj.label309:setLeft(875);
    obj.label309:setTop(30);
    obj.label309:setWidth(80);
    obj.label309:setHeight(25);
    obj.label309:setText("Concursos");
    lfm_setPropAsString(obj.label309, "fontStyle",  "bold");
    obj.label309:setName("label309");

    obj.edit336 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit336:setParent(obj.layout56);
    obj.edit336:setVertTextAlign("center");
    obj.edit336:setLeft(940);
    obj.edit336:setTop(30);
    obj.edit336:setWidth(120);
    obj.edit336:setHeight(25);
    obj.edit336:setField("efeitoContest6");
    obj.edit336:setName("edit336");

    obj.label310 = GUI.fromHandle(_obj_newObject("label"));
    obj.label310:setParent(obj.layout56);
    obj.label310:setLeft(875);
    obj.label310:setTop(55);
    obj.label310:setWidth(80);
    obj.label310:setHeight(25);
    obj.label310:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label310, "fontStyle",  "bold");
    obj.label310:setName("label310");

    obj.edit337 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit337:setParent(obj.layout56);
    obj.edit337:setVertTextAlign("center");
    obj.edit337:setLeft(940);
    obj.edit337:setTop(55);
    obj.edit337:setWidth(120);
    obj.edit337:setHeight(25);
    obj.edit337:setField("BDano6");
    obj.edit337:setName("edit337");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout50);
    obj.layout57:setLeft(2);
    obj.layout57:setTop(573);
    obj.layout57:setWidth(1207);
    obj.layout57:setHeight(92);
    obj.layout57:setName("layout57");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout57);
    obj.rectangle66:setAlign("client");
    obj.rectangle66:setColor("black");
    obj.rectangle66:setName("rectangle66");

    obj.label311 = GUI.fromHandle(_obj_newObject("label"));
    obj.label311:setParent(obj.layout57);
    obj.label311:setLeft(5);
    obj.label311:setTop(5);
    obj.label311:setWidth(70);
    obj.label311:setHeight(25);
    obj.label311:setText("Golpe");
    lfm_setPropAsString(obj.label311, "fontStyle",  "bold");
    obj.label311:setName("label311");

    obj.edit338 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit338:setParent(obj.layout57);
    obj.edit338:setVertTextAlign("center");
    obj.edit338:setLeft(75);
    obj.edit338:setTop(5);
    obj.edit338:setWidth(160);
    obj.edit338:setHeight(25);
    obj.edit338:setField("golpe7");
    obj.edit338:setName("edit338");

    obj.label312 = GUI.fromHandle(_obj_newObject("label"));
    obj.label312:setParent(obj.layout57);
    obj.label312:setLeft(5);
    obj.label312:setTop(30);
    obj.label312:setWidth(80);
    obj.label312:setHeight(25);
    obj.label312:setText("Descritores");
    lfm_setPropAsString(obj.label312, "fontStyle",  "bold");
    obj.label312:setName("label312");

    obj.edit339 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit339:setParent(obj.layout57);
    obj.edit339:setVertTextAlign("center");
    obj.edit339:setLeft(75);
    obj.edit339:setTop(30);
    obj.edit339:setWidth(160);
    obj.edit339:setHeight(25);
    obj.edit339:setField("Descritores7");
    obj.edit339:setName("edit339");

    obj.label313 = GUI.fromHandle(_obj_newObject("label"));
    obj.label313:setParent(obj.layout57);
    obj.label313:setLeft(5);
    obj.label313:setTop(55);
    obj.label313:setWidth(70);
    obj.label313:setHeight(25);
    obj.label313:setText("Alcance");
    lfm_setPropAsString(obj.label313, "fontStyle",  "bold");
    obj.label313:setName("label313");

    obj.edit340 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit340:setParent(obj.layout57);
    obj.edit340:setVertTextAlign("center");
    obj.edit340:setLeft(75);
    obj.edit340:setTop(55);
    obj.edit340:setWidth(160);
    obj.edit340:setHeight(25);
    obj.edit340:setField("alcance7");
    obj.edit340:setName("edit340");

    obj.label314 = GUI.fromHandle(_obj_newObject("label"));
    obj.label314:setParent(obj.layout57);
    obj.label314:setLeft(240);
    obj.label314:setTop(6);
    obj.label314:setWidth(50);
    obj.label314:setHeight(25);
    obj.label314:setText("Tipo");
    lfm_setPropAsString(obj.label314, "fontStyle",  "bold");
    obj.label314:setName("label314");

    obj.edit341 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit341:setParent(obj.layout57);
    obj.edit341:setVertTextAlign("center");
    obj.edit341:setLeft(282);
    obj.edit341:setTop(6);
    obj.edit341:setWidth(82);
    obj.edit341:setHeight(25);
    obj.edit341:setField("tipo7");
    obj.edit341:setName("edit341");

    obj.label315 = GUI.fromHandle(_obj_newObject("label"));
    obj.label315:setParent(obj.layout57);
    obj.label315:setLeft(240);
    obj.label315:setTop(31);
    obj.label315:setWidth(50);
    obj.label315:setHeight(25);
    obj.label315:setText("Classe");
    lfm_setPropAsString(obj.label315, "fontStyle",  "bold");
    obj.label315:setName("label315");

    obj.comboBox32 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox32:setParent(obj.layout57);
    obj.comboBox32:setLeft(282);
    obj.comboBox32:setTop(31);
    obj.comboBox32:setWidth(82);
    obj.comboBox32:setHeight(25);
    obj.comboBox32:setField("classe7");
    obj.comboBox32:setHorzTextAlign("center");
    obj.comboBox32:setItems({'Ataque', 'Especial', 'Efeito','Arma'});
    obj.comboBox32:setValues({'1', '2', '3','4'});
    obj.comboBox32:setName("comboBox32");

    obj.label316 = GUI.fromHandle(_obj_newObject("label"));
    obj.label316:setParent(obj.layout57);
    obj.label316:setLeft(240);
    obj.label316:setTop(55);
    obj.label316:setWidth(50);
    obj.label316:setHeight(25);
    obj.label316:setText("Freq.");
    lfm_setPropAsString(obj.label316, "fontStyle",  "bold");
    obj.label316:setName("label316");

    obj.edit342 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit342:setParent(obj.layout57);
    obj.edit342:setVertTextAlign("center");
    obj.edit342:setLeft(282);
    obj.edit342:setTop(55);
    obj.edit342:setWidth(82);
    obj.edit342:setHeight(25);
    obj.edit342:setField("frequencia7");
    obj.edit342:setName("edit342");

    obj.label317 = GUI.fromHandle(_obj_newObject("label"));
    obj.label317:setParent(obj.layout57);
    obj.label317:setLeft(370);
    obj.label317:setTop(6);
    obj.label317:setWidth(70);
    obj.label317:setHeight(25);
    obj.label317:setText("Acurácia");
    lfm_setPropAsString(obj.label317, "fontStyle",  "bold");
    obj.label317:setName("label317");

    obj.edit343 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit343:setParent(obj.layout57);
    obj.edit343:setVertTextAlign("center");
    obj.edit343:setLeft(425);
    obj.edit343:setTop(6);
    obj.edit343:setWidth(53);
    obj.edit343:setHeight(25);
    obj.edit343:setField("Acc7");
    obj.edit343:setType("number");
    obj.edit343:setName("edit343");

    obj.label318 = GUI.fromHandle(_obj_newObject("label"));
    obj.label318:setParent(obj.layout57);
    obj.label318:setLeft(370);
    obj.label318:setTop(31);
    obj.label318:setWidth(70);
    obj.label318:setHeight(25);
    obj.label318:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label318, "fontStyle",  "bold");
    obj.label318:setName("label318");

    obj.edit344 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit344:setParent(obj.layout57);
    obj.edit344:setVertTextAlign("center");
    obj.edit344:setLeft(425);
    obj.edit344:setTop(31);
    obj.edit344:setWidth(53);
    obj.edit344:setHeight(25);
    obj.edit344:setField("ataque7");
    obj.edit344:setType("number");
    obj.edit344:setName("edit344");

    obj.label319 = GUI.fromHandle(_obj_newObject("label"));
    obj.label319:setParent(obj.layout57);
    obj.label319:setLeft(370);
    obj.label319:setTop(55);
    obj.label319:setWidth(70);
    obj.label319:setHeight(25);
    obj.label319:setText("D. Base");
    lfm_setPropAsString(obj.label319, "fontStyle",  "bold");
    obj.label319:setName("label319");

    obj.edit345 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit345:setParent(obj.layout57);
    obj.edit345:setVertTextAlign("center");
    obj.edit345:setLeft(425);
    obj.edit345:setTop(55);
    obj.edit345:setWidth(53);
    obj.edit345:setHeight(25);
    obj.edit345:setField("dano7");
    obj.edit345:setName("edit345");

    obj.button75 = GUI.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.layout57);
    obj.button75:setLeft(488);
    obj.button75:setTop(6);
    obj.button75:setWidth(82);
    obj.button75:setText("Acerto");
    obj.button75:setFontSize(11);
    lfm_setPropAsString(obj.button75, "fontStyle",  "bold");
    obj.button75:setName("button75");

    obj.button76 = GUI.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.layout57);
    obj.button76:setLeft(488);
    obj.button76:setTop(31);
    obj.button76:setWidth(82);
    obj.button76:setText("Dano");
    obj.button76:setFontSize(11);
    lfm_setPropAsString(obj.button76, "fontStyle",  "bold");
    obj.button76:setName("button76");

    obj.button77 = GUI.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.layout57);
    obj.button77:setLeft(488);
    obj.button77:setTop(55);
    obj.button77:setWidth(82);
    obj.button77:setText("Crítico");
    obj.button77:setFontSize(11);
    lfm_setPropAsString(obj.button77, "fontStyle",  "bold");
    obj.button77:setName("button77");

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.layout57);
    obj.textEditor20:setLeft(575);
    obj.textEditor20:setTop(5);
    obj.textEditor20:setWidth(295);
    obj.textEditor20:setHeight(75);
    obj.textEditor20:setField("campoEfeitoGolpes7");
    obj.textEditor20:setName("textEditor20");

    obj.label320 = GUI.fromHandle(_obj_newObject("label"));
    obj.label320:setParent(obj.layout57);
    obj.label320:setLeft(875);
    obj.label320:setTop(5);
    obj.label320:setWidth(80);
    obj.label320:setHeight(25);
    obj.label320:setText("Aptidão");
    lfm_setPropAsString(obj.label320, "fontStyle",  "bold");
    obj.label320:setName("label320");

    obj.edit346 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit346:setParent(obj.layout57);
    obj.edit346:setVertTextAlign("center");
    obj.edit346:setLeft(940);
    obj.edit346:setTop(5);
    obj.edit346:setWidth(120);
    obj.edit346:setHeight(25);
    obj.edit346:setField("tipoContest7");
    obj.edit346:setName("edit346");

    obj.label321 = GUI.fromHandle(_obj_newObject("label"));
    obj.label321:setParent(obj.layout57);
    obj.label321:setLeft(875);
    obj.label321:setTop(30);
    obj.label321:setWidth(80);
    obj.label321:setHeight(25);
    obj.label321:setText("Concursos");
    lfm_setPropAsString(obj.label321, "fontStyle",  "bold");
    obj.label321:setName("label321");

    obj.edit347 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit347:setParent(obj.layout57);
    obj.edit347:setVertTextAlign("center");
    obj.edit347:setLeft(940);
    obj.edit347:setTop(30);
    obj.edit347:setWidth(120);
    obj.edit347:setHeight(25);
    obj.edit347:setField("efeitoContest7");
    obj.edit347:setName("edit347");

    obj.label322 = GUI.fromHandle(_obj_newObject("label"));
    obj.label322:setParent(obj.layout57);
    obj.label322:setLeft(875);
    obj.label322:setTop(55);
    obj.label322:setWidth(80);
    obj.label322:setHeight(25);
    obj.label322:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label322, "fontStyle",  "bold");
    obj.label322:setName("label322");

    obj.edit348 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit348:setParent(obj.layout57);
    obj.edit348:setVertTextAlign("center");
    obj.edit348:setLeft(940);
    obj.edit348:setTop(55);
    obj.edit348:setWidth(120);
    obj.edit348:setHeight(25);
    obj.edit348:setField("BDano7");
    obj.edit348:setName("edit348");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout50);
    obj.layout58:setLeft(2);
    obj.layout58:setTop(668);
    obj.layout58:setWidth(1207);
    obj.layout58:setHeight(92);
    obj.layout58:setName("layout58");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout58);
    obj.rectangle67:setAlign("client");
    obj.rectangle67:setColor("black");
    obj.rectangle67:setName("rectangle67");

    obj.label323 = GUI.fromHandle(_obj_newObject("label"));
    obj.label323:setParent(obj.layout58);
    obj.label323:setLeft(5);
    obj.label323:setTop(5);
    obj.label323:setWidth(70);
    obj.label323:setHeight(25);
    obj.label323:setText("Golpe");
    lfm_setPropAsString(obj.label323, "fontStyle",  "bold");
    obj.label323:setName("label323");

    obj.edit349 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit349:setParent(obj.layout58);
    obj.edit349:setVertTextAlign("center");
    obj.edit349:setLeft(75);
    obj.edit349:setTop(5);
    obj.edit349:setWidth(160);
    obj.edit349:setHeight(25);
    obj.edit349:setField("golpe8");
    obj.edit349:setName("edit349");

    obj.label324 = GUI.fromHandle(_obj_newObject("label"));
    obj.label324:setParent(obj.layout58);
    obj.label324:setLeft(5);
    obj.label324:setTop(30);
    obj.label324:setWidth(80);
    obj.label324:setHeight(25);
    obj.label324:setText("Descritores");
    lfm_setPropAsString(obj.label324, "fontStyle",  "bold");
    obj.label324:setName("label324");

    obj.edit350 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit350:setParent(obj.layout58);
    obj.edit350:setVertTextAlign("center");
    obj.edit350:setLeft(75);
    obj.edit350:setTop(30);
    obj.edit350:setWidth(160);
    obj.edit350:setHeight(25);
    obj.edit350:setField("Descritores8");
    obj.edit350:setName("edit350");

    obj.label325 = GUI.fromHandle(_obj_newObject("label"));
    obj.label325:setParent(obj.layout58);
    obj.label325:setLeft(5);
    obj.label325:setTop(55);
    obj.label325:setWidth(70);
    obj.label325:setHeight(25);
    obj.label325:setText("Alcance");
    lfm_setPropAsString(obj.label325, "fontStyle",  "bold");
    obj.label325:setName("label325");

    obj.edit351 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit351:setParent(obj.layout58);
    obj.edit351:setVertTextAlign("center");
    obj.edit351:setLeft(75);
    obj.edit351:setTop(55);
    obj.edit351:setWidth(160);
    obj.edit351:setHeight(25);
    obj.edit351:setField("alcance8");
    obj.edit351:setName("edit351");

    obj.label326 = GUI.fromHandle(_obj_newObject("label"));
    obj.label326:setParent(obj.layout58);
    obj.label326:setLeft(240);
    obj.label326:setTop(6);
    obj.label326:setWidth(50);
    obj.label326:setHeight(25);
    obj.label326:setText("Tipo");
    lfm_setPropAsString(obj.label326, "fontStyle",  "bold");
    obj.label326:setName("label326");

    obj.edit352 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit352:setParent(obj.layout58);
    obj.edit352:setVertTextAlign("center");
    obj.edit352:setLeft(282);
    obj.edit352:setTop(6);
    obj.edit352:setWidth(82);
    obj.edit352:setHeight(25);
    obj.edit352:setField("tipo8");
    obj.edit352:setName("edit352");

    obj.label327 = GUI.fromHandle(_obj_newObject("label"));
    obj.label327:setParent(obj.layout58);
    obj.label327:setLeft(240);
    obj.label327:setTop(31);
    obj.label327:setWidth(50);
    obj.label327:setHeight(25);
    obj.label327:setText("Classe");
    lfm_setPropAsString(obj.label327, "fontStyle",  "bold");
    obj.label327:setName("label327");

    obj.comboBox33 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox33:setParent(obj.layout58);
    obj.comboBox33:setLeft(282);
    obj.comboBox33:setTop(31);
    obj.comboBox33:setWidth(82);
    obj.comboBox33:setHeight(25);
    obj.comboBox33:setField("classe8");
    obj.comboBox33:setHorzTextAlign("center");
    obj.comboBox33:setItems({'Ataque', 'Especial', 'Efeito','Arma'});
    obj.comboBox33:setValues({'1', '2', '3','4'});
    obj.comboBox33:setName("comboBox33");

    obj.label328 = GUI.fromHandle(_obj_newObject("label"));
    obj.label328:setParent(obj.layout58);
    obj.label328:setLeft(240);
    obj.label328:setTop(55);
    obj.label328:setWidth(50);
    obj.label328:setHeight(25);
    obj.label328:setText("Freq.");
    lfm_setPropAsString(obj.label328, "fontStyle",  "bold");
    obj.label328:setName("label328");

    obj.edit353 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit353:setParent(obj.layout58);
    obj.edit353:setVertTextAlign("center");
    obj.edit353:setLeft(282);
    obj.edit353:setTop(55);
    obj.edit353:setWidth(82);
    obj.edit353:setHeight(25);
    obj.edit353:setField("frequencia8");
    obj.edit353:setName("edit353");

    obj.label329 = GUI.fromHandle(_obj_newObject("label"));
    obj.label329:setParent(obj.layout58);
    obj.label329:setLeft(370);
    obj.label329:setTop(6);
    obj.label329:setWidth(70);
    obj.label329:setHeight(25);
    obj.label329:setText("Acurácia");
    lfm_setPropAsString(obj.label329, "fontStyle",  "bold");
    obj.label329:setName("label329");

    obj.edit354 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit354:setParent(obj.layout58);
    obj.edit354:setVertTextAlign("center");
    obj.edit354:setLeft(425);
    obj.edit354:setTop(6);
    obj.edit354:setWidth(53);
    obj.edit354:setHeight(25);
    obj.edit354:setField("Acc8");
    obj.edit354:setType("number");
    obj.edit354:setName("edit354");

    obj.label330 = GUI.fromHandle(_obj_newObject("label"));
    obj.label330:setParent(obj.layout58);
    obj.label330:setLeft(370);
    obj.label330:setTop(31);
    obj.label330:setWidth(70);
    obj.label330:setHeight(25);
    obj.label330:setText("Prec.Bôn.");
    lfm_setPropAsString(obj.label330, "fontStyle",  "bold");
    obj.label330:setName("label330");

    obj.edit355 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit355:setParent(obj.layout58);
    obj.edit355:setVertTextAlign("center");
    obj.edit355:setLeft(425);
    obj.edit355:setTop(31);
    obj.edit355:setWidth(53);
    obj.edit355:setHeight(25);
    obj.edit355:setField("ataque8");
    obj.edit355:setType("number");
    obj.edit355:setName("edit355");

    obj.label331 = GUI.fromHandle(_obj_newObject("label"));
    obj.label331:setParent(obj.layout58);
    obj.label331:setLeft(370);
    obj.label331:setTop(55);
    obj.label331:setWidth(70);
    obj.label331:setHeight(25);
    obj.label331:setText("D. Base");
    lfm_setPropAsString(obj.label331, "fontStyle",  "bold");
    obj.label331:setName("label331");

    obj.edit356 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit356:setParent(obj.layout58);
    obj.edit356:setVertTextAlign("center");
    obj.edit356:setLeft(425);
    obj.edit356:setTop(55);
    obj.edit356:setWidth(53);
    obj.edit356:setHeight(25);
    obj.edit356:setField("dano8");
    obj.edit356:setName("edit356");

    obj.button78 = GUI.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.layout58);
    obj.button78:setLeft(488);
    obj.button78:setTop(6);
    obj.button78:setWidth(82);
    obj.button78:setText("Acerto");
    obj.button78:setFontSize(11);
    lfm_setPropAsString(obj.button78, "fontStyle",  "bold");
    obj.button78:setName("button78");

    obj.button79 = GUI.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.layout58);
    obj.button79:setLeft(488);
    obj.button79:setTop(31);
    obj.button79:setWidth(82);
    obj.button79:setText("Dano");
    obj.button79:setFontSize(11);
    lfm_setPropAsString(obj.button79, "fontStyle",  "bold");
    obj.button79:setName("button79");

    obj.button80 = GUI.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.layout58);
    obj.button80:setLeft(488);
    obj.button80:setTop(55);
    obj.button80:setWidth(82);
    obj.button80:setText("Crítico");
    obj.button80:setFontSize(11);
    lfm_setPropAsString(obj.button80, "fontStyle",  "bold");
    obj.button80:setName("button80");

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.layout58);
    obj.textEditor21:setLeft(575);
    obj.textEditor21:setTop(5);
    obj.textEditor21:setWidth(295);
    obj.textEditor21:setHeight(75);
    obj.textEditor21:setField("campoEfeitoGolpes8");
    obj.textEditor21:setName("textEditor21");

    obj.label332 = GUI.fromHandle(_obj_newObject("label"));
    obj.label332:setParent(obj.layout58);
    obj.label332:setLeft(875);
    obj.label332:setTop(5);
    obj.label332:setWidth(80);
    obj.label332:setHeight(25);
    obj.label332:setText("Aptidão");
    lfm_setPropAsString(obj.label332, "fontStyle",  "bold");
    obj.label332:setName("label332");

    obj.edit357 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit357:setParent(obj.layout58);
    obj.edit357:setVertTextAlign("center");
    obj.edit357:setLeft(940);
    obj.edit357:setTop(5);
    obj.edit357:setWidth(120);
    obj.edit357:setHeight(25);
    obj.edit357:setField("tipoContest8");
    obj.edit357:setName("edit357");

    obj.label333 = GUI.fromHandle(_obj_newObject("label"));
    obj.label333:setParent(obj.layout58);
    obj.label333:setLeft(875);
    obj.label333:setTop(30);
    obj.label333:setWidth(80);
    obj.label333:setHeight(25);
    obj.label333:setText("Concursos");
    lfm_setPropAsString(obj.label333, "fontStyle",  "bold");
    obj.label333:setName("label333");

    obj.edit358 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit358:setParent(obj.layout58);
    obj.edit358:setVertTextAlign("center");
    obj.edit358:setLeft(940);
    obj.edit358:setTop(30);
    obj.edit358:setWidth(120);
    obj.edit358:setHeight(25);
    obj.edit358:setField("efeitoContest8");
    obj.edit358:setName("edit358");

    obj.label334 = GUI.fromHandle(_obj_newObject("label"));
    obj.label334:setParent(obj.layout58);
    obj.label334:setLeft(875);
    obj.label334:setTop(55);
    obj.label334:setWidth(80);
    obj.label334:setHeight(25);
    obj.label334:setText("Bôn.Dano");
    lfm_setPropAsString(obj.label334, "fontStyle",  "bold");
    obj.label334:setName("label334");

    obj.edit359 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit359:setParent(obj.layout58);
    obj.edit359:setVertTextAlign("center");
    obj.edit359:setLeft(940);
    obj.edit359:setTop(55);
    obj.edit359:setWidth(120);
    obj.edit359:setHeight(25);
    obj.edit359:setField("BDano8");
    obj.edit359:setName("edit359");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Mochila");
    obj.tab10:setName("tab10");

    obj.frmMochilaB = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMochilaB:setParent(obj.tab10);
    obj.frmMochilaB:setName("frmMochilaB");
    obj.frmMochilaB:setAlign("client");
    obj.frmMochilaB:setTheme("dark");
    obj.frmMochilaB:setMargins({top=1});

    obj.popItem = GUI.fromHandle(_obj_newObject("popup"));
    obj.popItem:setParent(obj.frmMochilaB);
    obj.popItem:setName("popItem");
    obj.popItem:setWidth(300);
    obj.popItem:setHeight(250);
    obj.popItem:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popItem, "autoScopeNode",  "false");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popItem);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(3);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout2);
    obj.flowPart7:setMinWidth(90);
    obj.flowPart7:setMaxWidth(150);
    obj.flowPart7:setHeight(35);
    obj.flowPart7:setName("flowPart7");

    obj.label335 = GUI.fromHandle(_obj_newObject("label"));
    obj.label335:setParent(obj.flowPart7);
    obj.label335:setAlign("top");
    obj.label335:setFontSize(10);
    obj.label335:setText("Nome");
    obj.label335:setHorzTextAlign("center");
    obj.label335:setWordWrap(true);
    obj.label335:setTextTrimming("none");
    obj.label335:setAutoSize(true);
    obj.label335:setHint("");
    obj.label335:setHitTest(true);
    obj.label335:setName("label335");

    obj.edit360 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit360:setParent(obj.flowPart7);
    obj.edit360:setAlign("client");
    obj.edit360:setField("nome");
    obj.edit360:setFontSize(12);
    obj.edit360:setName("edit360");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout2);
    obj.flowPart8:setMinWidth(90);
    obj.flowPart8:setMaxWidth(150);
    obj.flowPart8:setHeight(35);
    obj.flowPart8:setName("flowPart8");

    obj.label336 = GUI.fromHandle(_obj_newObject("label"));
    obj.label336:setParent(obj.flowPart8);
    obj.label336:setAlign("top");
    obj.label336:setFontSize(10);
    obj.label336:setText("Preço");
    obj.label336:setHorzTextAlign("center");
    obj.label336:setWordWrap(true);
    obj.label336:setTextTrimming("none");
    obj.label336:setAutoSize(true);
    obj.label336:setHint("");
    obj.label336:setHitTest(true);
    obj.label336:setName("label336");

    obj.edit361 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit361:setParent(obj.flowPart8);
    obj.edit361:setAlign("client");
    obj.edit361:setField("preco");
    obj.edit361:setFontSize(12);
    obj.edit361:setType("number");
    obj.edit361:setName("edit361");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout2);
    obj.flowPart9:setMinWidth(90);
    obj.flowPart9:setMaxWidth(150);
    obj.flowPart9:setHeight(35);
    obj.flowPart9:setName("flowPart9");

    obj.label337 = GUI.fromHandle(_obj_newObject("label"));
    obj.label337:setParent(obj.flowPart9);
    obj.label337:setAlign("top");
    obj.label337:setFontSize(10);
    obj.label337:setText("Rolagem");
    obj.label337:setHorzTextAlign("center");
    obj.label337:setWordWrap(true);
    obj.label337:setTextTrimming("none");
    obj.label337:setAutoSize(true);
    obj.label337:setHint("Se usar o item envolver dados, colocar a rolagem");
    obj.label337:setHitTest(true);
    obj.label337:setName("label337");

    obj.edit362 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit362:setParent(obj.flowPart9);
    obj.edit362:setAlign("client");
    obj.edit362:setField("Roll");
    obj.edit362:setFontSize(12);
    obj.edit362:setName("edit362");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.popItem);
    obj.textEditor22:setAlign("client");
    obj.textEditor22:setField("descricao");
    obj.textEditor22:setName("textEditor22");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.frmMochilaB);
    obj.layout59:setLeft(000);
    obj.layout59:setTop(000);
    obj.layout59:setHeight(650);
    obj.layout59:setWidth(1100);
    obj.layout59:setName("layout59");

    obj.image55 = GUI.fromHandle(_obj_newObject("image"));
    obj.image55:setParent(obj.layout59);
    obj.image55:setLeft(000);
    obj.image55:setTop(000);
    obj.image55:setHeight(650);
    obj.image55:setWidth(1100);
    obj.image55:setSRC("/img/Pokeball.jpg");
    obj.image55:setStyle("autoFit");
    obj.image55:setName("image55");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.frmMochilaB);
    obj.layout60:setLeft(30);
    obj.layout60:setTop(10);
    obj.layout60:setWidth(315);
    obj.layout60:setHeight(300);
    obj.layout60:setName("layout60");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout60);
    obj.rectangle68:setAlign("client");
    obj.rectangle68:setColor("#0000007F");
    obj.rectangle68:setStrokeColor("black");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setName("rectangle68");

    obj.button81 = GUI.fromHandle(_obj_newObject("button"));
    obj.button81:setParent(obj.layout60);
    obj.button81:setLeft(5);
    obj.button81:setTop(5);
    obj.button81:setHeight(20);
    obj.button81:setWidth(305);
    obj.button81:setText("Itens Medicinais");
    obj.button81:setName("button81");

    obj.rclConsumiveis = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclConsumiveis:setParent(obj.layout60);
    obj.rclConsumiveis:setLeft(5);
    obj.rclConsumiveis:setTop(30);
    obj.rclConsumiveis:setWidth(305);
    obj.rclConsumiveis:setHeight(263);
    obj.rclConsumiveis:setName("rclConsumiveis");
    obj.rclConsumiveis:setField("itensConsumiveis");
    obj.rclConsumiveis:setTemplateForm("frmConsumiveis");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.frmMochilaB);
    obj.layout61:setLeft(380);
    obj.layout61:setTop(10);
    obj.layout61:setWidth(315);
    obj.layout61:setHeight(300);
    obj.layout61:setName("layout61");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout61);
    obj.rectangle69:setAlign("client");
    obj.rectangle69:setColor("#0000007F");
    obj.rectangle69:setStrokeColor("black");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.button82 = GUI.fromHandle(_obj_newObject("button"));
    obj.button82:setParent(obj.layout61);
    obj.button82:setLeft(5);
    obj.button82:setTop(5);
    obj.button82:setHeight(20);
    obj.button82:setWidth(305);
    obj.button82:setText("Pokébolas");
    obj.button82:setName("button82");

    obj.rclItens2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclItens2:setParent(obj.layout61);
    obj.rclItens2:setLeft(5);
    obj.rclItens2:setTop(30);
    obj.rclItens2:setWidth(305);
    obj.rclItens2:setHeight(263);
    obj.rclItens2:setName("rclItens2");
    obj.rclItens2:setField("itens2");
    obj.rclItens2:setTemplateForm("frmConsumiveis");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.frmMochilaB);
    obj.layout62:setLeft(730);
    obj.layout62:setTop(10);
    obj.layout62:setWidth(315);
    obj.layout62:setHeight(300);
    obj.layout62:setName("layout62");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout62);
    obj.rectangle70:setAlign("client");
    obj.rectangle70:setColor("#0000007F");
    obj.rectangle70:setStrokeColor("black");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setName("rectangle70");

    obj.button83 = GUI.fromHandle(_obj_newObject("button"));
    obj.button83:setParent(obj.layout62);
    obj.button83:setLeft(5);
    obj.button83:setTop(5);
    obj.button83:setHeight(20);
    obj.button83:setWidth(305);
    obj.button83:setText("Abricós e Frutas");
    obj.button83:setName("button83");

    obj.rclItens3 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclItens3:setParent(obj.layout62);
    obj.rclItens3:setLeft(5);
    obj.rclItens3:setTop(30);
    obj.rclItens3:setWidth(305);
    obj.rclItens3:setHeight(263);
    obj.rclItens3:setName("rclItens3");
    obj.rclItens3:setField("itens3");
    obj.rclItens3:setTemplateForm("frmConsumiveis");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.frmMochilaB);
    obj.layout63:setLeft(30);
    obj.layout63:setTop(310);
    obj.layout63:setWidth(315);
    obj.layout63:setHeight(300);
    obj.layout63:setName("layout63");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout63);
    obj.rectangle71:setAlign("client");
    obj.rectangle71:setColor("#0000007F");
    obj.rectangle71:setStrokeColor("black");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.button84 = GUI.fromHandle(_obj_newObject("button"));
    obj.button84:setParent(obj.layout63);
    obj.button84:setLeft(5);
    obj.button84:setTop(5);
    obj.button84:setHeight(20);
    obj.button84:setWidth(305);
    obj.button84:setText("Itens Pokémons (Mantidos, Pedras e Registros)");
    obj.button84:setName("button84");

    obj.rclItens4 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclItens4:setParent(obj.layout63);
    obj.rclItens4:setLeft(5);
    obj.rclItens4:setTop(30);
    obj.rclItens4:setWidth(305);
    obj.rclItens4:setHeight(263);
    obj.rclItens4:setName("rclItens4");
    obj.rclItens4:setField("itens4");
    obj.rclItens4:setTemplateForm("frmConsumiveis");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.frmMochilaB);
    obj.layout64:setLeft(380);
    obj.layout64:setTop(310);
    obj.layout64:setWidth(315);
    obj.layout64:setHeight(300);
    obj.layout64:setName("layout64");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout64);
    obj.rectangle72:setAlign("client");
    obj.rectangle72:setColor("#0000007F");
    obj.rectangle72:setStrokeColor("black");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setName("rectangle72");

    obj.button85 = GUI.fromHandle(_obj_newObject("button"));
    obj.button85:setParent(obj.layout64);
    obj.button85:setLeft(5);
    obj.button85:setTop(5);
    obj.button85:setHeight(20);
    obj.button85:setWidth(305);
    obj.button85:setText("Itens, Itens Mágicos e Repelentes");
    obj.button85:setName("button85");

    obj.rclItens5 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclItens5:setParent(obj.layout64);
    obj.rclItens5:setLeft(5);
    obj.rclItens5:setTop(30);
    obj.rclItens5:setWidth(305);
    obj.rclItens5:setHeight(263);
    obj.rclItens5:setName("rclItens5");
    obj.rclItens5:setField("itens5");
    obj.rclItens5:setTemplateForm("frmConsumiveis");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.frmMochilaB);
    obj.layout65:setLeft(730);
    obj.layout65:setTop(310);
    obj.layout65:setWidth(315);
    obj.layout65:setHeight(300);
    obj.layout65:setName("layout65");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout65);
    obj.rectangle73:setAlign("client");
    obj.rectangle73:setColor("#0000007F");
    obj.rectangle73:setStrokeColor("black");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.button86 = GUI.fromHandle(_obj_newObject("button"));
    obj.button86:setParent(obj.layout65);
    obj.button86:setLeft(5);
    obj.button86:setTop(5);
    obj.button86:setHeight(20);
    obj.button86:setWidth(305);
    obj.button86:setText("Itens-Chave");
    obj.button86:setName("button86");

    obj.rclItens6 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclItens6:setParent(obj.layout65);
    obj.rclItens6:setLeft(5);
    obj.rclItens6:setTop(30);
    obj.rclItens6:setWidth(305);
    obj.rclItens6:setHeight(263);
    obj.rclItens6:setName("rclItens6");
    obj.rclItens6:setField("itens6");
    obj.rclItens6:setTemplateForm("frmConsumiveis");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl1);
    obj.tab11:setTitle("Pokédex");
    obj.tab11:setName("tab11");

    obj.frmPokedex = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPokedex:setParent(obj.tab11);
    obj.frmPokedex:setName("frmPokedex");
    obj.frmPokedex:setAlign("client");
    obj.frmPokedex:setTheme("dark");
    obj.frmPokedex:setMargins({top=1});

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.frmPokedex);
    obj.layout66:setLeft(000);
    obj.layout66:setTop(000);
    obj.layout66:setHeight(650);
    obj.layout66:setWidth(1100);
    obj.layout66:setName("layout66");

    obj.image56 = GUI.fromHandle(_obj_newObject("image"));
    obj.image56:setParent(obj.layout66);
    obj.image56:setLeft(000);
    obj.image56:setTop(000);
    obj.image56:setHeight(650);
    obj.image56:setWidth(1100);
    obj.image56:setSRC("/img/Pokeball.jpg");
    obj.image56:setStyle("autoFit");
    obj.image56:setName("image56");

    obj.button87 = GUI.fromHandle(_obj_newObject("button"));
    obj.button87:setParent(obj.frmPokedex);
    obj.button87:setAlign("top");
    obj.button87:setHeight(25);
    obj.button87:setText("Adicionar Entrada");
    obj.button87:setName("button87");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.frmPokedex);
    obj.layout67:setAlign("top");
    obj.layout67:setWidth(170);
    obj.layout67:setHeight(30);
    obj.layout67:setMargins({top=5, bottom=5, left=15});
    obj.layout67:setName("layout67");

    obj.label338 = GUI.fromHandle(_obj_newObject("label"));
    obj.label338:setParent(obj.layout67);
    obj.label338:setText("Capturados:");
    obj.label338:setAlign("left");
    obj.label338:setWidth(80);
    obj.label338:setName("label338");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout67);
    obj.rectangle74:setColor("darkred");
    obj.rectangle74:setAlign("left");
    obj.rectangle74:setMargins({left=5});
    obj.rectangle74:setName("rectangle74");

    obj.label339 = GUI.fromHandle(_obj_newObject("label"));
    obj.label339:setParent(obj.rectangle74);
    obj.label339:setField("trainerPokeCaught");
    obj.label339:setAlign("client");
    obj.label339:setHorzTextAlign("center");
    obj.label339:setName("label339");

    obj.label340 = GUI.fromHandle(_obj_newObject("label"));
    obj.label340:setParent(obj.layout67);
    obj.label340:setText("Vistos:");
    obj.label340:setAlign("left");
    obj.label340:setWidth(80);
    obj.label340:setMargins({left=80});
    obj.label340:setName("label340");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout67);
    obj.rectangle75:setColor("darkred");
    obj.rectangle75:setAlign("left");
    obj.rectangle75:setMargins({left=10});
    obj.rectangle75:setName("rectangle75");

    obj.label341 = GUI.fromHandle(_obj_newObject("label"));
    obj.label341:setParent(obj.rectangle75);
    obj.label341:setField("trainerPokeSeen");
    obj.label341:setAlign("client");
    obj.label341:setHorzTextAlign("center");
    obj.label341:setName("label341");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.frmPokedex);
    obj.layout68:setAlign("client");
    obj.layout68:setTop(35);
    obj.layout68:setName("layout68");

    obj.rclDex = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDex:setParent(obj.layout68);
    obj.rclDex:setName("rclDex");
    obj.rclDex:setField("recDex");
    obj.rclDex:setTemplateForm("frmDex");
    obj.rclDex:setAlign("client");
    obj.rclDex:setLayout("horizontalTiles");
    obj.rclDex:setMinQt(1);
    obj.rclDex:setSelectable(true);


				function self.recalcDex()
					if sheet ~= nil then
						local pokeSeenTotal = 0;
						local pokeCaughtTotal = 0;
						local nodes = NDB.getChildNodes(sheet.recDex);
						for i=1, #nodes, 1 do
							pokeSeenTotal = pokeSeenTotal + 1;
							if nodes[i].pokeCaught then
								pokeCaughtTotal = pokeCaughtTotal +1;
								end					
							end	
						sheet.trainerPokeSeen = pokeSeenTotal;
						sheet.trainerPokeCaught = pokeCaughtTotal;

						for i=1, #nodes, 1 do
							if (nodes[i].pokeNumber == nil) then
								nodes[i].urlDexNum = 0;
							elseif (string.len(nodes[i].pokeNumber) == 2) then
								nodes[i].urlDexNum = "0" .. nodes[i].pokeNumber;
							elseif (string.len(nodes[i].pokeNumber) == 3) then
								nodes[i].urlDexNum = nodes[i].pokeNumber;
							elseif (string.len(nodes[i].pokeNumber) == 1) then
								nodes[i].urlDexNum = "00" .. nodes[i].pokeNumber;
								end;
							nodes[i].pokeImgUrl = "https://www.serebii.net/xy/pokemon/" .. nodes[i].urlDexNum .. ".png";
							end
						end;
					end
				


    obj.dataLink107 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink107:setParent(obj.frmPokedex);
    obj.dataLink107:setFields({'recDex', 'trainerPokeCaught', 'trainerPokeSeen', 'pokeNumber','pokeCaught'});
    obj.dataLink107:setName("dataLink107");

    obj.tab12 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.tabControl1);
    obj.tab12:setTitle("Background");
    obj.tab12:setName("tab12");

    obj.frmBackground = GUI.fromHandle(_obj_newObject("form"));
    obj.frmBackground:setParent(obj.tab12);
    obj.frmBackground:setName("frmBackground");
    obj.frmBackground:setAlign("client");
    obj.frmBackground:setTheme("dark");
    obj.frmBackground:setMargins({top=1});

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.frmBackground);
    obj.layout69:setLeft(000);
    obj.layout69:setTop(000);
    obj.layout69:setHeight(650);
    obj.layout69:setWidth(1100);
    obj.layout69:setName("layout69");

    obj.image57 = GUI.fromHandle(_obj_newObject("image"));
    obj.image57:setParent(obj.layout69);
    obj.image57:setLeft(000);
    obj.image57:setTop(000);
    obj.image57:setHeight(650);
    obj.image57:setWidth(1100);
    obj.image57:setSRC("/img/Pokeball.jpg");
    obj.image57:setStyle("autoFit");
    obj.image57:setName("image57");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.frmBackground);
    obj.layout70:setLeft(10);
    obj.layout70:setTop(10);
    obj.layout70:setHeight(800);
    obj.layout70:setWidth(1000);
    obj.layout70:setName("layout70");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout70);
    obj.rectangle76:setLeft(000);
    obj.rectangle76:setTop(000);
    obj.rectangle76:setWidth(710);
    obj.rectangle76:setHeight(575);
    obj.rectangle76:setColor("darkred");
    obj.rectangle76:setStrokeColor("black");
    obj.rectangle76:setStrokeSize(5);
    obj.rectangle76:setName("rectangle76");

    obj.label342 = GUI.fromHandle(_obj_newObject("label"));
    obj.label342:setParent(obj.layout70);
    obj.label342:setLeft(000);
    obj.label342:setTop(005);
    obj.label342:setHeight(20);
    obj.label342:setWidth(700);
    obj.label342:setFontColor("White");
    obj.label342:setFontSize(18);
    obj.label342:setText("História");
    obj.label342:setAutoSize(true);
    obj.label342:setHorzTextAlign("center");
    obj.label342:setName("label342");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout70);
    obj.richEdit1:setLeft(005);
    obj.richEdit1:setTop(030);
    obj.richEdit1:setWidth(700);
    obj.richEdit1:setHeight(540);
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setField("campoHistoria");
    obj.richEdit1:setName("richEdit1");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.frmBackground);
    obj.layout71:setLeft(740);
    obj.layout71:setTop(10);
    obj.layout71:setHeight(600);
    obj.layout71:setWidth(1000);
    obj.layout71:setName("layout71");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout71);
    obj.rectangle77:setLeft(000);
    obj.rectangle77:setTop(000);
    obj.rectangle77:setWidth(340);
    obj.rectangle77:setHeight(435);
    obj.rectangle77:setColor("darkred");
    obj.rectangle77:setStrokeColor("black");
    obj.rectangle77:setStrokeSize(5);
    obj.rectangle77:setName("rectangle77");

    obj.label343 = GUI.fromHandle(_obj_newObject("label"));
    obj.label343:setParent(obj.layout71);
    obj.label343:setLeft(000);
    obj.label343:setTop(005);
    obj.label343:setHeight(20);
    obj.label343:setWidth(330);
    obj.label343:setFontColor("White");
    obj.label343:setFontSize(18);
    obj.label343:setText("Personalidade");
    obj.label343:setAutoSize(true);
    obj.label343:setHorzTextAlign("center");
    obj.label343:setName("label343");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout71);
    obj.richEdit2:setLeft(005);
    obj.richEdit2:setTop(030);
    obj.richEdit2:setWidth(330);
    obj.richEdit2:setHeight(400);
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    obj.richEdit2:setField("campoPersonalidade");
    obj.richEdit2:setName("richEdit2");

    obj.tab13 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab13:setParent(obj.tabControl1);
    obj.tab13:setTitle("Anotações");
    obj.tab13:setName("tab13");

    obj.frmNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmNotes:setParent(obj.tab13);
    obj.frmNotes:setName("frmNotes");
    obj.frmNotes:setAlign("client");
    obj.frmNotes:setTheme("dark");
    obj.frmNotes:setMargins({top=1});

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.frmNotes);
    obj.layout72:setLeft(000);
    obj.layout72:setTop(000);
    obj.layout72:setHeight(650);
    obj.layout72:setWidth(1100);
    obj.layout72:setName("layout72");

    obj.image58 = GUI.fromHandle(_obj_newObject("image"));
    obj.image58:setParent(obj.layout72);
    obj.image58:setLeft(000);
    obj.image58:setTop(000);
    obj.image58:setHeight(650);
    obj.image58:setWidth(1100);
    obj.image58:setSRC("/img/Pokeball.jpg");
    obj.image58:setStyle("autoFit");
    obj.image58:setName("image58");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.frmNotes);
    obj.layout73:setLeft(10);
    obj.layout73:setTop(10);
    obj.layout73:setHeight(600);
    obj.layout73:setWidth(465);
    obj.layout73:setName("layout73");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout73);
    obj.rectangle78:setLeft(000);
    obj.rectangle78:setTop(000);
    obj.rectangle78:setWidth(465);
    obj.rectangle78:setHeight(540);
    obj.rectangle78:setColor("Red");
    obj.rectangle78:setStrokeColor("black");
    obj.rectangle78:setStrokeSize(5);
    obj.rectangle78:setName("rectangle78");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.layout73);
    obj.richEdit3:setLeft(005);
    obj.richEdit3:setTop(005);
    obj.richEdit3:setWidth(455);
    obj.richEdit3:setHeight(530);
    lfm_setPropAsString(obj.richEdit3, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit3, "defaultFontColor",  "white");
    obj.richEdit3:setField("campoTextoGrande");
    obj.richEdit3:setName("richEdit3");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.frmNotes);
    obj.layout74:setLeft(510);
    obj.layout74:setTop(10);
    obj.layout74:setHeight(600);
    obj.layout74:setWidth(465);
    obj.layout74:setName("layout74");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout74);
    obj.rectangle79:setLeft(000);
    obj.rectangle79:setTop(000);
    obj.rectangle79:setWidth(465);
    obj.rectangle79:setHeight(540);
    obj.rectangle79:setColor("Red");
    obj.rectangle79:setStrokeColor("black");
    obj.rectangle79:setStrokeSize(5);
    obj.rectangle79:setName("rectangle79");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.layout74);
    obj.richEdit4:setLeft(005);
    obj.richEdit4:setTop(005);
    obj.richEdit4:setWidth(455);
    obj.richEdit4:setHeight(530);
    lfm_setPropAsString(obj.richEdit4, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit4, "defaultFontColor",  "white");
    obj.richEdit4:setField("campoTextoGrande2");
    obj.richEdit4:setName("richEdit4");

    obj.tab14 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab14:setParent(obj.tabControl1);
    obj.tab14:setTitle("Créditos");
    obj.tab14:setName("tab14");

    obj.frmCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmCreditos:setParent(obj.tab14);
    obj.frmCreditos:setName("frmCreditos");
    obj.frmCreditos:setAlign("client");
    obj.frmCreditos:setTheme("dark");
    obj.frmCreditos:setMargins({top=1});

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.frmCreditos);
    obj.layout75:setLeft(000);
    obj.layout75:setTop(000);
    obj.layout75:setHeight(650);
    obj.layout75:setWidth(1100);
    obj.layout75:setName("layout75");

    obj.image59 = GUI.fromHandle(_obj_newObject("image"));
    obj.image59:setParent(obj.layout75);
    obj.image59:setLeft(000);
    obj.image59:setTop(000);
    obj.image59:setHeight(650);
    obj.image59:setWidth(1100);
    obj.image59:setSRC("/img/Pokeball.jpg");
    obj.image59:setStyle("autoFit");
    obj.image59:setName("image59");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.frmCreditos);
    obj.layout76:setLeft(400);
    obj.layout76:setTop(200);
    obj.layout76:setHeight(600);
    obj.layout76:setWidth(665);
    obj.layout76:setName("layout76");

    obj.label344 = GUI.fromHandle(_obj_newObject("label"));
    obj.label344:setParent(obj.layout76);
    obj.label344:setLeft(0);
    obj.label344:setTop(000);
    obj.label344:setHeight(20);
    obj.label344:setWidth(600);
    obj.label344:setText("Hitoshura (Criador do Plugin)");
    obj.label344:setAutoSize(true);
    obj.label344:setName("label344");

    obj.label345 = GUI.fromHandle(_obj_newObject("label"));
    obj.label345:setParent(obj.layout76);
    obj.label345:setLeft(0);
    obj.label345:setTop(025);
    obj.label345:setHeight(20);
    obj.label345:setWidth(600);
    obj.label345:setText("Shakerskj (Aba pokedéx)");
    obj.label345:setAutoSize(true);
    obj.label345:setName("label345");

    obj.label346 = GUI.fromHandle(_obj_newObject("label"));
    obj.label346:setParent(obj.layout76);
    obj.label346:setLeft(0);
    obj.label346:setTop(050);
    obj.label346:setHeight(20);
    obj.label346:setWidth(600);
    obj.label346:setText("Dragontail (Testes e sugestões)");
    obj.label346:setAutoSize(true);
    obj.label346:setName("label346");

    obj.label347 = GUI.fromHandle(_obj_newObject("label"));
    obj.label347:setParent(obj.layout76);
    obj.label347:setLeft(0);
    obj.label347:setTop(075);
    obj.label347:setHeight(20);
    obj.label347:setWidth(600);
    obj.label347:setText("Ambesek (Ajudou BASTANTE no Código)");
    obj.label347:setAutoSize(true);
    obj.label347:setName("label347");

    obj.label348 = GUI.fromHandle(_obj_newObject("label"));
    obj.label348:setParent(obj.layout76);
    obj.label348:setLeft(0);
    obj.label348:setTop(100);
    obj.label348:setHeight(20);
    obj.label348:setWidth(600);
    obj.label348:setText("Mia (Ajudou no código)");
    obj.label348:setAutoSize(true);
    obj.label348:setName("label348");

    obj.label349 = GUI.fromHandle(_obj_newObject("label"));
    obj.label349:setParent(obj.layout76);
    obj.label349:setLeft(0);
    obj.label349:setTop(125);
    obj.label349:setHeight(20);
    obj.label349:setWidth(600);
    obj.label349:setText("Bloody (Ajudou no código)");
    obj.label349:setAutoSize(true);
    obj.label349:setName("label349");

    obj.label350 = GUI.fromHandle(_obj_newObject("label"));
    obj.label350:setParent(obj.layout76);
    obj.label350:setLeft(0);
    obj.label350:setTop(150);
    obj.label350:setHeight(20);
    obj.label350:setWidth(600);
    obj.label350:setText("Webrian (Dicas e sugestões)");
    obj.label350:setAutoSize(true);
    obj.label350:setName("label350");

    obj.label351 = GUI.fromHandle(_obj_newObject("label"));
    obj.label351:setParent(obj.layout76);
    obj.label351:setLeft(0);
    obj.label351:setTop(175);
    obj.label351:setHeight(20);
    obj.label351:setWidth(600);
    obj.label351:setText("Lucasedu19 (Dicas e sugestões)");
    obj.label351:setAutoSize(true);
    obj.label351:setName("label351");

    obj.label352 = GUI.fromHandle(_obj_newObject("label"));
    obj.label352:setParent(obj.layout76);
    obj.label352:setLeft(0);
    obj.label352:setTop(200);
    obj.label352:setHeight(20);
    obj.label352:setWidth(600);
    obj.label352:setText("Caio Graco Pimenta (Adaptou o Sistema)");
    obj.label352:setAutoSize(true);
    obj.label352:setName("label352");

    obj.button88 = GUI.fromHandle(_obj_newObject("button"));
    obj.button88:setParent(obj.layout76);
    obj.button88:setLeft(400);
    obj.button88:setTop(50);
    obj.button88:setHeight(20);
    obj.button88:setWidth(200);
    obj.button88:setText("Livro do Jogador");
    obj.button88:setHint("Link para baixar");
    obj.button88:setName("button88");

    obj.button89 = GUI.fromHandle(_obj_newObject("button"));
    obj.button89:setParent(obj.layout76);
    obj.button89:setLeft(400);
    obj.button89:setTop(75);
    obj.button89:setHeight(20);
    obj.button89:setWidth(200);
    obj.button89:setText("Livro do Mestre");
    obj.button89:setHint("Link para baixar");
    obj.button89:setName("button89");

    obj.button90 = GUI.fromHandle(_obj_newObject("button"));
    obj.button90:setParent(obj.layout76);
    obj.button90:setLeft(400);
    obj.button90:setTop(100);
    obj.button90:setHeight(20);
    obj.button90:setWidth(200);
    obj.button90:setText("Livro dos Pokémons");
    obj.button90:setHint("Link para baixar");
    obj.button90:setName("button90");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot1 = "";
            				sheet.NomeSlot1 = "";
            				sheet.LevelSlot1 = "";
            				sheet.GenderSlot1 = "";
            				sheet.baseHPAtual1 = 0;
            				sheet.baseHPMAX1 = 0;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot2 = "";
            				sheet.NomeSlot2 = "";
            				sheet.LevelSlot2 = "";
            				sheet.GenderSlot2 = "";
            				sheet.baseHPAtual2 = 0;
            				sheet.baseHPMAX2 = 0;
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot3 = "";
            				sheet.NomeSlot3 = "";
            				sheet.LevelSlot3 = "";
            				sheet.GenderSlot3 = "";
            				sheet.baseHPAtual3 = 0;
            				sheet.baseHPMAX3 = 0;
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot4 = "";
            				sheet.NomeSlot4 = "";
            				sheet.LevelSlot4 = "";
            				sheet.GenderSlot4 = "";
            				sheet.baseHPAtual4 = 0;
            				sheet.baseHPMAX4 = 0;
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot5 = "";
            				sheet.NomeSlot5 = "";
            				sheet.LevelSlot5 = "";
            				sheet.GenderSlot5 = "";
            				sheet.baseHPAtual5 = 0;
            				sheet.baseHPMAX5 = 0;
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot6 = "";
            				sheet.NomeSlot6 = "";
            				sheet.LevelSlot6 = "";
            				sheet.GenderSlot6 = "";
            				sheet.baseHPAtual6 = 0;
            				sheet.baseHPMAX6 = 0;
        end, obj);

    obj._e_event6 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet== nil then return end;
            			
            			local Nivel = tonumber(sheet.basLV) or 1
            			local attHP = sheet.HP_val or 0;
            			local bonHP = sheet.baseHPMAXEXTRA or 0;
            			
            			sheet.baseHPMAX = math.floor(Nivel*4 + attHP*4 + bonHP);
            
            			local SPDedcDES = {-2,-1,-1,-1,0,0,0,0,1,1,2,2,3};
            			local SPDedc = tonumber(sheet.SPD_edc) or 7
            			
            			local EdCtable = {0.4,0.5,0.6,0.7,0.8,0.9,1,1.25,1.5,1.75,2,2.25,2.5};
            			
            
            			local Ataque = {}	
            			Ataque.var1 = tonumber(sheet.ATK_val) or 8;
            			Ataque.var2 = tonumber(sheet.ATK_edc) or 7			
            			if 1 > Ataque.var2 then 
            				Ataque.var2 = 7 
            				end;
            			if Ataque.var2 > 13 then 
            				Ataque.var2 = 7 
            				end;
            			Ataque.var3 = math.floor(EdCtable[Ataque.var2]*Ataque.var1)
            			Ataque.var4 = 0;
            			if (10 > Ataque.var3) then
            				Ataque.var4	= Ataque.var3-10;
            				end
            			if (Ataque.var3 >= 10) then
            				Ataque.var4 = math.floor((Ataque.var3-10)/2);
            				end				
            			sheet.ATK_tot = Ataque.var3
            			sheet.ATK_mod = Ataque.var4
            			
            			local Defesa = {}	
            			Defesa.var1 = tonumber(sheet.DEF_val) or 8;
            			Defesa.var2 = tonumber(sheet.DEF_edc) or 7			
            			if 1 > Defesa.var2 then 
            				Defesa.var2 = 7 
            				end;
            			if Defesa.var2 > 13 then 
            				Defesa.var2 = 7 
            				end;
            			Defesa.var3 = math.floor(EdCtable[Defesa.var2]*Defesa.var1)
            			Defesa.var4 = 0;
            			if (10 > Defesa.var3) then
            				Defesa.var4	= Defesa.var3-10;
            				end
            			if (Defesa.var3 >= 10) then
            				Defesa.var4 = math.floor((Defesa.var3-10)/2);
            				end				
            			sheet.DEF_tot = Defesa.var3
            			sheet.DEF_mod = Defesa.var4
            					
            			local AtaEsp = {}	
            			AtaEsp.var1 = tonumber(sheet.SPATK_val) or 8;
            			AtaEsp.var2 = tonumber(sheet.SPATK_edc) or 7			
            			if 1 > AtaEsp.var2 then 
            				AtaEsp.var2 = 7 
            				end;
            			if AtaEsp.var2 > 13 then 
            				AtaEsp.var2 = 7 
            				end;
            			AtaEsp.var3 = math.floor(EdCtable[AtaEsp.var2]*AtaEsp.var1)
            			AtaEsp.var4 = 0;
            			if (10 > AtaEsp.var3) then
            				AtaEsp.var4	= AtaEsp.var3-10;
            				end
            			if (AtaEsp.var3 >= 10) then
            				AtaEsp.var4 = math.floor((AtaEsp.var3-10)/2);
            				end				
            			sheet.SPATK_tot = AtaEsp.var3
            			sheet.SPATK_mod = AtaEsp.var4	
            
            			local DefEsp = {}	
            			DefEsp.var1 = tonumber(sheet.SPDEF_val) or 8;
            			DefEsp.var2 = tonumber(sheet.SPDEF_edc) or 7			
            			if 1 > DefEsp.var2 then 
            				DefEsp.var2 = 7 
            				end;
            			if DefEsp.var2 > 13 then 
            				DefEsp.var2 = 7 
            				end;
            			DefEsp.var3 = math.floor(EdCtable[DefEsp.var2]*DefEsp.var1)
            			DefEsp.var4 = 0;
            			if (10 > DefEsp.var3) then
            				DefEsp.var4	= DefEsp.var3-10;
            				end
            			if (DefEsp.var3 >= 10) then
            				DefEsp.var4 = math.floor((DefEsp.var3-10)/2);
            				end				
            			sheet.SPDEF_tot = DefEsp.var3
            			sheet.SPDEF_mod = DefEsp.var4	
            
            			local Veloc = {}	
            			Veloc.var1 = tonumber(sheet.SPD_val) or 8;
            			Veloc.var2 = tonumber(sheet.SPD_edc) or 7			
            			if 1 > Veloc.var2 then 
            				Veloc.var2 = 7 
            				end;
            			if Veloc.var2 > 13 then 
            				Veloc.var2 = 7 
            				end;
            			Veloc.var3 = math.floor(EdCtable[Veloc.var2]*Veloc.var1)
            			Veloc.var4 = 0;
            			if (10 > Veloc.var3) then
            				Veloc.var4	= Veloc.var3-10;
            				end
            			if (Veloc.var3 >= 10) then
            				Veloc.var4 = math.floor((Veloc.var3-10)/2);
            				end				
            			sheet.SPD_tot = Veloc.var3
            			sheet.SPD_mod = Veloc.var4	
            					
            			local def_temp = Defesa.var3;
            			local def_bon = tonumber(sheet.pers_bonEVAF) or 0;
            			if (def_temp >= 31) then 
            				def_temp = 30; 	
            				end
            			sheet.EVA_FIS = math.floor(def_temp/5) + def_bon;
            
            			local spdef_temp = DefEsp.var3
            			local spdef_bon = tonumber(sheet.pers_bonEVAE) or 0;
            			if (spdef_temp >= 31) then 
            				spdef_temp = 30; 	
            				end			
            			sheet.EVA_ESP = math.floor(spdef_temp/5) + spdef_bon;
            			
            			local spd_temp = Veloc.var3;
            			local spd_bon = tonumber(sheet.pers_bonEVAV) or 0;
            			if (spd_temp >= 61) then 
            				spd_temp = 60; 	
            				end
            			sheet.EVA_VEL = math.floor(spd_temp/10) + spd_bon;
            	
            			local bonus_DES_TER = 0;
            			if (Ataque.var4) >= (Defesa.var4) then 
            				bonus_DES_TER = math.floor(Ataque.var4/2) or 0;	
            				end
            			if (Defesa.var4) >= (Ataque.var4) then 
            				bonus_DES_TER = math.floor(Defesa.var4/2) or 0;	
            				end
            			sheet.bas_DES_TER = 3 + bonus_DES_TER;
            			sheet.DES_TER = (sheet.bas_DES_TER or 0) + (sheet.bon_DES_TER or 0) + (SPDedcDES[SPDedc] or 0)
            			if (5 >= (sheet.DES_TER or 0)) then 
            				sheet.DES_TER = 5; 
            				end
            				
            			sheet.bas_DES_NAT = 2 + math.floor((Defesa.var4)/2) or 0;
            			sheet.DES_NAT = (sheet.bas_DES_NAT or 0) + (sheet.bon_DES_NAT or 0) + (SPDedcDES[SPDedc] or 0)
            			if (4 > (sheet.DES_NAT or 0)) then 
            				sheet.DES_NAT = 4;
            				end
            			
            			local bonus_DES_SUB = 0;			
            			if (((Ataque.var4) >= 4) or ((Defesa.var4) >= 3)) then
            				bonus_DES_SUB=1;
            				end			
            			sheet.bas_DES_SUB = 3 + (bonus_DES_SUB or 0);
            			sheet.DES_SUB = (sheet.bas_DES_SUB or 0) + (sheet.bon_DES_SUB or 0) + (SPDedcDES[SPDedc] or 0)
            			if (1 > (sheet.DES_SUB or 0)) then 
            				sheet.DES_SUB = 1; 
            				end				
            			
            			if (sheet.bas_DES_VOO or 0 > 0) then
            				sheet.DES_VOO = (sheet.bas_DES_VOO or 0) + (sheet.bon_DES_VOO or 0) + (SPDedcDES[SPDedc] or 0)
            				if (0 > (sheet.DES_VOO or 0)) then 
            					sheet.DES_VOO = 0; 
            					end
            				end
            			if (sheet.bas_DES_VOO == nil) then 
            				sheet.DES_VOO = nil; 
            				end
            				
            			if (sheet.bas_DES_ESC or 0 > 0) then
            				sheet.DES_ESC = (sheet.bas_DES_ESC or 0) + (sheet.bon_DES_ESC or 0) + (SPDedcDES[SPDedc] or 0)
            				if (0 > (sheet.DES_ESC or 0)) then 
            					sheet.DES_ESC = 0; 
            					end
            				end
            			if (sheet.bas_DES_ESC == nil) then 
            				sheet.DES_ESC = nil; 
            				end
        end, obj);

    obj._e_event7 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclListaDosItens:append();
        end, obj);

    obj._e_event8 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclListaDosItens:sort();
        end, obj);

    obj._e_event9 = obj.rclListaDosItens:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosItens.selectedNode;
                            self.boxDetalhesDoItem.node = node;                    
                            self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event10 = obj.rclListaDosItens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (nodeA.active and not nodeB.active) then
            			return -1;
            		elseif (not nodeA.active and nodeB.active) then
            			return 1;
            		else
            			return Utils.compareStringPtBr(nodeA.campoNome, nodeB.campoNome);
            		end;
        end, obj);

    obj._e_event11 = obj.button9:addEventListener("onClick",
        function (_)
            local xml = NDB.exportXML(self.boxDetalhesDoItem.node);
            
            				local export = {};
            				local bytes = Utils.binaryEncode(export, "utf8", xml);
            
            				local stream = Utils.newMemoryStream();
            				local bytes = stream:write(export);
            
            				Dialogs.saveFile("Salvar Ficha como XML", stream, "ficha.xml", "application/xml",
            					function()
            						stream:close();
            						showMessage("Ficha Exportada.");
            					end);
        end, obj);

    obj._e_event12 = obj.button10:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "application/xml", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            
            						local import = {};
            						local bytes = arq.stream:read(import, arq.stream.size);
            
            						local xml = Utils.binaryDecode(import, "utf8");
            
            						NDB.importXML(self.boxDetalhesDoItem.node, xml);
            					end);
        end, obj);

    obj._e_event13 = obj.comboBox6:addEventListener("onChange",
        function (_)
            if self.boxDetalhesDoItem.node==nil 					then    return end
            												if self.boxDetalhesDoItem.node.campoGenero == "1" 		then	self.boxDetalhesDoItem.node.basSEX = "/img/Gender_Male.png"	end
            												if self.boxDetalhesDoItem.node.campoGenero == "2" 		then	self.boxDetalhesDoItem.node.basSEX = "/img/Gender_Female.png"	end
            												if self.boxDetalhesDoItem.node.campoGenero == "3" 		then	self.boxDetalhesDoItem.node.basSEX = "/img/Gender_Less.png"	end
        end, obj);

    obj._e_event14 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local PweakTot = {"1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x"};
            			local weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm"}
            			local CampoElem1Aux = self.boxDetalhesDoItem.node.campoElem1 or 0;
            			if CampoElem1Aux == "1" 		then	weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Norm","Norm","Norm","Immu","Norm","Norm","Norm","Norm"}	end
            			if CampoElem1Aux == "2" 		then	weakElem1 = {"Norm","Resi","Weak","Norm","Resi","Resi","Norm","Norm","Weak","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Resi","Resi"}	end
            			if CampoElem1Aux == "3" 		then	weakElem1 = {"Norm","Resi","Resi","Weak","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm"}	end
            			if CampoElem1Aux == "4" 		then	weakElem1 = {"Norm","Norm","Norm","Resi","Norm","Norm","Norm","Norm","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm"}	end
            			if CampoElem1Aux == "5" 		then	weakElem1 = {"Norm","Weak","Resi","Resi","Resi","Weak","Norm","Weak","Resi","Weak","Norm","Weak","Norm","Norm","Norm","Norm","Norm","Norm"}	end
            			if CampoElem1Aux == "6" 		then	weakElem1 = {"Norm","Weak","Norm","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Weak","Norm"}	end
            			if CampoElem1Aux == "7" 		then	weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Weak","Resi","Resi","Norm","Norm","Resi","Norm","Weak"}	end
            			if CampoElem1Aux == "8" 		then	weakElem1 = {"Norm","Norm","Norm","Norm","Resi","Norm","Resi","Resi","Weak","Norm","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Resi"}	end
            			if CampoElem1Aux == "9" 		then	weakElem1 = {"Norm","Norm","Weak","Immu","Weak","Weak","Norm","Resi","Norm","Norm","Norm","Norm","Resi","Norm","Norm","Norm","Norm","Norm"}	end
            			if CampoElem1Aux == "10" 		then	weakElem1 = {"Norm","Norm","Norm","Weak","Resi","Weak","Resi","Norm","Immu","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Norm","Norm"}	end
            			if CampoElem1Aux == "11" 		then	weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm","Norm","Norm","Resi","Weak","Norm","Weak","Norm","Weak","Norm","Norm"}	end
            			if CampoElem1Aux == "12" 		then	weakElem1 = {"Norm","Weak","Norm","Norm","Resi","Norm","Resi","Norm","Resi","Weak","Norm","Norm","Weak","Norm","Norm","Norm","Norm","Norm"}	end
            			if CampoElem1Aux == "13" 		then	weakElem1 = {"Resi","Resi","Weak","Norm","Weak","Norm","Weak","Resi","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm"}	end
            			if CampoElem1Aux == "14" 		then	weakElem1 = {"Immu","Norm","Norm","Norm","Norm","Norm","Immu","Resi","Norm","Norm","Norm","Resi","Norm","Weak","Norm","Weak","Norm","Norm"}	end
            			if CampoElem1Aux == "15" 		then	weakElem1 = {"Norm","Resi","Resi","Resi","Resi","Weak","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Weak"}	end
            			if CampoElem1Aux == "16" 		then	weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Immu","Weak","Norm","Resi","Norm","Resi","Norm","Weak"}	end
            			if CampoElem1Aux == "17" 		then	weakElem1 = {"Resi","Weak","Norm","Norm","Resi","Resi","Weak","Immu","Weak","Resi","Resi","Resi","Resi","Norm","Resi","Norm","Resi","Resi"}	end
            			if CampoElem1Aux == "18" 		then	weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Resi","Norm","Norm","Immu","Resi","Weak","Norm"}	end			
            			if CampoElem1Aux == "19" 		then	weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm"}	end
            			local weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm"}
            			local CampoElem2Aux = self.boxDetalhesDoItem.node.campoElem2 or 0;
            			if CampoElem2Aux == "1" 		then	weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Norm","Norm","Norm","Immu","Norm","Norm","Norm","Norm"}	end
            			if CampoElem2Aux == "2" 		then	weakElem2 = {"Norm","Resi","Weak","Norm","Resi","Resi","Norm","Norm","Weak","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Resi","Resi"}	end
            			if CampoElem2Aux == "3" 		then	weakElem2 = {"Norm","Resi","Resi","Weak","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm"}	end
            			if CampoElem2Aux == "4" 		then	weakElem2 = {"Norm","Norm","Norm","Resi","Norm","Norm","Norm","Norm","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm"}	end
            			if CampoElem2Aux == "5" 		then	weakElem2 = {"Norm","Weak","Resi","Resi","Resi","Weak","Norm","Weak","Resi","Weak","Norm","Weak","Norm","Norm","Norm","Norm","Norm","Norm"}	end
            			if CampoElem2Aux == "6" 		then	weakElem2 = {"Norm","Weak","Norm","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Weak","Norm"}	end
            			if CampoElem2Aux == "7" 		then	weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Weak","Resi","Resi","Norm","Norm","Resi","Norm","Weak"}	end
            			if CampoElem2Aux == "8" 		then	weakElem2 = {"Norm","Norm","Norm","Norm","Resi","Norm","Resi","Resi","Weak","Norm","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Resi"}	end
            			if CampoElem2Aux == "9" 		then	weakElem2 = {"Norm","Norm","Weak","Immu","Weak","Weak","Norm","Resi","Norm","Norm","Norm","Norm","Resi","Norm","Norm","Norm","Norm","Norm"}	end
            			if CampoElem2Aux == "10" 		then	weakElem2 = {"Norm","Norm","Norm","Weak","Resi","Weak","Resi","Norm","Immu","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Norm","Norm"}	end
            			if CampoElem2Aux == "11" 		then	weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm","Norm","Norm","Resi","Weak","Norm","Weak","Norm","Weak","Norm","Norm"}	end
            			if CampoElem2Aux == "12" 		then	weakElem2 = {"Norm","Weak","Norm","Norm","Resi","Norm","Resi","Norm","Resi","Weak","Norm","Norm","Weak","Norm","Norm","Norm","Norm","Norm"}	end
            			if CampoElem2Aux == "13" 		then	weakElem2 = {"Resi","Resi","Weak","Norm","Weak","Norm","Weak","Resi","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm"}	end
            			if CampoElem2Aux == "14"		then	weakElem2 = {"Immu","Norm","Norm","Norm","Norm","Norm","Immu","Resi","Norm","Norm","Norm","Resi","Norm","Weak","Norm","Weak","Norm","Norm"}	end
            			if CampoElem2Aux == "15"		then	weakElem2 = {"Norm","Resi","Resi","Resi","Resi","Weak","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Weak"}	end
            			if CampoElem2Aux == "16" 		then	weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Immu","Weak","Norm","Resi","Norm","Resi","Norm","Weak"}	end
            			if CampoElem2Aux == "17" 		then	weakElem2 = {"Resi","Weak","Norm","Norm","Resi","Resi","Weak","Immu","Weak","Resi","Resi","Resi","Resi","Norm","Resi","Norm","Resi","Resi"}	end
            			if CampoElem2Aux == "18" 		then	weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Resi","Norm","Norm","Immu","Resi","Weak","Norm"}	end
            			if CampoElem2Aux == "19" 		then	weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm"}	end
            			for i=1, 18, 1 do
            				if (weakElem1[i] == "Norm" and weakElem2[i] == "Norm") then PweakTot[i] = "x1"		end
            				if (weakElem1[i] == "Resi" and weakElem2[i] == "Resi") then PweakTot[i] = "x0.25"	end
            				if (weakElem1[i] == "Immu" and weakElem2[i] == "Immu") then PweakTot[i] = "x0"		end
            				if (weakElem1[i] == "Weak" and weakElem2[i] == "Weak") then PweakTot[i] = "x4"		end	  
            				if (weakElem1[i] == "Resi" and weakElem2[i] == "Norm") then PweakTot[i] = "x0.5"	end
            				if (weakElem1[i] == "Norm" and weakElem2[i] == "Resi") then PweakTot[i] = "x0.5"	end
            				if (weakElem1[i] == "Weak" and weakElem2[i] == "Norm") then PweakTot[i] = "x2"		end
            				if (weakElem1[i] == "Norm" and weakElem2[i] == "Weak") then PweakTot[i] = "x2"		end
            				if (weakElem1[i] == "Immu" and weakElem2[i] == "Norm") then PweakTot[i] = "x0"		end
            				if (weakElem1[i] == "Norm" and weakElem2[i] == "Immu") then PweakTot[i] = "x0"		end
            				if (weakElem1[i] == "Resi" and weakElem2[i] == "Weak") then PweakTot[i] = "x1"		end
            				if (weakElem1[i] == "Weak" and weakElem2[i] == "Resi") then PweakTot[i] = "x1"		end
            				if (weakElem1[i] == "Resi" and weakElem2[i] == "Immu") then PweakTot[i] = "x0"		end
            				if (weakElem1[i] == "Immu" and weakElem2[i] == "Resi") then PweakTot[i] = "x0"		end
            				if (weakElem1[i] == "Immu" and weakElem2[i] == "Weak") then PweakTot[i] = "x0"		end
            				if (weakElem1[i] == "Weak" and weakElem2[i] == "Immu") then PweakTot[i] = "x0"		end
            			end
            			self.boxDetalhesDoItem.node.weakTot1 = PweakTot[1] or "x1"
            			self.boxDetalhesDoItem.node.weakTot2 = PweakTot[2] or "x1"
            			self.boxDetalhesDoItem.node.weakTot3 = PweakTot[3] or "x1"
            			self.boxDetalhesDoItem.node.weakTot4 = PweakTot[4] or "x1"
            			self.boxDetalhesDoItem.node.weakTot5 = PweakTot[5] or "x1"
            			self.boxDetalhesDoItem.node.weakTot6 = PweakTot[6] or "x1"
            			self.boxDetalhesDoItem.node.weakTot7 = PweakTot[7] or "x1"
            			self.boxDetalhesDoItem.node.weakTot8 = PweakTot[8] or "x1"
            			self.boxDetalhesDoItem.node.weakTot9 = PweakTot[9] or "x1"
            			self.boxDetalhesDoItem.node.weakTot10 = PweakTot[10] or "x1"
            			self.boxDetalhesDoItem.node.weakTot11 = PweakTot[11] or "x1"
            			self.boxDetalhesDoItem.node.weakTot12 = PweakTot[12] or "x1"
            			self.boxDetalhesDoItem.node.weakTot13 = PweakTot[13] or "x1"
            			self.boxDetalhesDoItem.node.weakTot14 = PweakTot[14] or "x1"
            			self.boxDetalhesDoItem.node.weakTot15 = PweakTot[15] or "x1"
            			self.boxDetalhesDoItem.node.weakTot16 = PweakTot[16] or "x1"
            			self.boxDetalhesDoItem.node.weakTot17 = PweakTot[17] or "x1"
            			self.boxDetalhesDoItem.node.weakTot18 = PweakTot[18] or "x1"
        end, obj);

    obj._e_event15 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local BonNat = self.boxDetalhesDoItem.node.campoNatPlus or "";
            			local PenNat = self.boxDetalhesDoItem.node.campoNatMinus or "";
            			if BonNat == "1" 		then	self.boxDetalhesDoItem.node.Sabor_Fav = "Comida Salgada"	end
            			if BonNat == "2" 		then	self.boxDetalhesDoItem.node.Sabor_Fav = "Comida Apimentada" end
            			if BonNat == "3" 		then	self.boxDetalhesDoItem.node.Sabor_Fav = "Comida Azeda"		end
            			if BonNat == "4" 		then	self.boxDetalhesDoItem.node.Sabor_Fav = "Comida Seca"		end
            			if BonNat == "5" 		then	self.boxDetalhesDoItem.node.Sabor_Fav = "Comida Amarga"		end
            			if BonNat == "6" 		then	self.boxDetalhesDoItem.node.Sabor_Fav = "Comida Doce"		end
            			if PenNat == "1" 		then	self.boxDetalhesDoItem.node.Sabor_Desg = "Comida Salgada"	end
            			if PenNat == "2" 		then	self.boxDetalhesDoItem.node.Sabor_Desg = "Comida Apimentada" end
            			if PenNat == "3" 		then	self.boxDetalhesDoItem.node.Sabor_Desg = "Comida Azeda"		end
            			if PenNat == "4" 		then	self.boxDetalhesDoItem.node.Sabor_Desg = "Comida Seca"		end
            			if PenNat == "5" 		then	self.boxDetalhesDoItem.node.Sabor_Desg = "Comida Amarga"	end
            			if PenNat == "6" 		then	self.boxDetalhesDoItem.node.Sabor_Desg = "Comida Doce"		end
            			if (BonNat == PenNat) then 	self.boxDetalhesDoItem.node.Sabor_Fav = "Sem Preferência"
            										self.boxDetalhesDoItem.node.Sabor_Desg = "Sem Preferência"
            				end
        end, obj);

    obj._e_event16 = obj.BotaoItemA:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popExemplo");
            				
            			if pop ~= nil then
            				pop:setNodeObject(self.boxDetalhesDoItem.node);
            				pop:showPopupEx("right", self.BotaoItemA);
            			else
            				showMessage("Ops, erro");
            			end;
        end, obj);

    obj._e_event17 = obj.edit98:addEventListener("onChange",
        function (_)
            if self.boxDetalhesDoItem.node == nil then return end;
            		
            											local level = tonumber(self.boxDetalhesDoItem.node.pokeLevel) or 1
            											if 	1 > level or level > 100 then return end;
            							
            											local xpTable = {25,50,100,150,200,400,600,800,1000,1500,2000,3000,4000,5000,6000,7000,8000,9000,10000,11500,13000,14500,16000,17500,19000,20500,22000,23500,25000,27500,30000,32500,35000,37500,4000,42500,45000,47500,50000, 
            															55000,60000,65000,70000,75000,80000,85000,90000,95000,10000,110000,120000,130000,140000,150000,160000,170000,180000,190000,200000,210000,220000,230000,240000,250000,260000,270000,280000,290000,300000,310000,320000,
            															330000,340000,350000,360000,370000,380000,390000,400000,410000,420000,430000,440000,450000,460000,470000,480000,490000,500000,510000,520000,530000,540000,550000,560000,570000,580000,590000,600000};
            											self.boxDetalhesDoItem.node.nextLVEXP = xpTable [level];
        end, obj);

    obj._e_event18 = obj.dataLink85:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if self.boxDetalhesDoItem.node == nil then return end;
            				local EdCtable = {0.4,0.5,0.6,0.7,0.8,0.9,1,1.2,1.4,1.6,1.8,2,2.2};
            				AuxMega = 0;
            				if (not self.boxDetalhesDoItem.node.MegaEvo) then AuxMega = 0;	end
            				if (self.boxDetalhesDoItem.node.MegaEvo == true) then AuxMega = 1;	end
            				local HPBase1 = self.boxDetalhesDoItem.node.Vida_Base1 or 0;
            				local HPBon1 = self.boxDetalhesDoItem.node.Vida_Bon1 or 0;
            				local HPNivel = self.boxDetalhesDoItem.node.Vida_Nivel or 0;
            				local HPVitam = self.boxDetalhesDoItem.node.Vida_Vit or 0;
            				if (HPBase1 > 0) then 
            					self.boxDetalhesDoItem.node.Vida_Form1 = math.floor((HPBase1 + HPNivel + HPVitam + HPBon1));
            					end
            			
            				local ATKBase1 = self.boxDetalhesDoItem.node.Ataque_Base1 or 0;
            				local ATKBon1 = self.boxDetalhesDoItem.node.Ataque_Bon1 or 0;
            				local ATKBon2 = self.boxDetalhesDoItem.node.Ataque_Bon2 or 0;
            				local ATKNivel = self.boxDetalhesDoItem.node.Ataque_Nivel or 0;
            				local ATKVitam = self.boxDetalhesDoItem.node.Ataque_Vit or 0;
            				local ATKedc = tonumber(self.boxDetalhesDoItem.node.Ataque_edc) or 7;
            					if 1 > ATKedc then ATKedc = 7 end;
            					if ATKedc > 13 then ATKedc = 7 end;
            				if (ATKBase1 > 0) then 
            					self.boxDetalhesDoItem.node.Ataque_Form1 = math.floor((ATKBase1 + ATKNivel + ATKVitam + ATKBon1 + ATKBon2*AuxMega)*EdCtable[ATKedc]);
            					end
            				
            
            				local DEFBase1 = self.boxDetalhesDoItem.node.Defesa_Base1 or 0;
            				local DEFBon1 = self.boxDetalhesDoItem.node.Defesa_Bon1 or 0;
            				local DEFBon2 = self.boxDetalhesDoItem.node.Defesa_Bon2 or 0;
            				local DEFNivel = self.boxDetalhesDoItem.node.Defesa_Nivel or 0;
            				local DEFVitam = self.boxDetalhesDoItem.node.Defesa_Vit or 0;
            				local DEFedc = tonumber(self.boxDetalhesDoItem.node.Defesa_edc) or 7;
            					if 1 > DEFedc then DEFedc = 7 end;
            					if DEFedc > 13 then DEFedc = 7 end;
            				if (DEFBase1 > 0) then 
            					self.boxDetalhesDoItem.node.Defesa_Form1 = math.floor((DEFBase1 + DEFNivel + DEFVitam + DEFBon1 + DEFBon2*AuxMega)*EdCtable[DEFedc]);
            					end
            
            
            				local AESBase1 = self.boxDetalhesDoItem.node.AtaqueEsp_Base1 or 0;
            				local AESBon1 = self.boxDetalhesDoItem.node.AtaqueEsp_Bon1 or 0;
            				local AESBon2 = self.boxDetalhesDoItem.node.AtaqueEsp_Bon2 or 0;
            				local AESNivel = self.boxDetalhesDoItem.node.AtaqueEsp_Nivel or 0;
            				local AESVitam = self.boxDetalhesDoItem.node.AtaqueEsp_Vit or 0;
            				local AESedc = tonumber(self.boxDetalhesDoItem.node.AtaqueEsp_edc) or 7;
            					if 1 > AESedc then AESedc = 7 end;
            					if AESedc > 13 then AESedc = 7 end;
            				if (AESBase1 > 0) then 
            					self.boxDetalhesDoItem.node.AtaqueEsp_Form1 = math.floor((AESBase1 + AESNivel + AESVitam + AESBon1 + AESBon2*AuxMega)*EdCtable[AESedc]);
            					end
            
            					
            				local DESBase1 = self.boxDetalhesDoItem.node.DefesaEsp_Base1 or 0;
            				local DESBon1 = self.boxDetalhesDoItem.node.DefesaEsp_Bon1 or 0;
            				local DESBon2 = self.boxDetalhesDoItem.node.DefesaEsp_Bon2 or 0;
            				local DESNivel = self.boxDetalhesDoItem.node.DefesaEsp_Nivel or 0;
            				local DESVitam = self.boxDetalhesDoItem.node.DefesaEsp_Vit or 0;
            				local DESedc = tonumber(self.boxDetalhesDoItem.node.DefesaEsp_edc) or 7;
            					if 1 > DESedc then DESedc = 7 end;
            					if DESedc > 13 then DESedc = 7 end;
            				if (DESBase1 > 0) then 
            					self.boxDetalhesDoItem.node.DefesaEsp_Form1 = math.floor((DESBase1 + DESNivel + DESVitam + DESBon1 + DESBon2*AuxMega)*EdCtable[DESedc]);
            					end
            
            		
            				local VelBase1 = self.boxDetalhesDoItem.node.Velocidade_Base1 or 0;
            				local VelBon1 = self.boxDetalhesDoItem.node.Velocidade_Bon1 or 0;
            				local VelBon2 = self.boxDetalhesDoItem.node.Velocidade_Bon2 or 0;
            				local VelNivel = self.boxDetalhesDoItem.node.Velocidade_Nivel or 0;
            				local VelVitam = self.boxDetalhesDoItem.node.Velocidade_Vit or 0;
            				local Veledc = tonumber(self.boxDetalhesDoItem.node.Velocidade_edc) or 7;
            					if 1 > Veledc then Veledc = 7 end;
            					if Veledc > 13 then Veledc = 7 end;
            				if (VelBase1 > 0) then 
            					self.boxDetalhesDoItem.node.Velocidade_Form1 = math.floor((VelBase1 + VelNivel + VelVitam + VelBon1 + VelBon2*AuxMega)*EdCtable[Veledc]);
            					end
            
            			
            					local EFISbon = self.boxDetalhesDoItem.node.pok_bonEVAF or 0;
            					local EESPbon = self.boxDetalhesDoItem.node.pok_bonEVAE or 0; 
            					local EVELbon = self.boxDetalhesDoItem.node.Pok_bonEVAV or 0;	
            					local INIbon = self.boxDetalhesDoItem.node.pok_bonINI or 0;	
            					local DEF_fim = self.boxDetalhesDoItem.node.Defesa_Form1 or 0;
            						if DEF_fim > 30 then DEF_fim = 30;	end
            					local DEFE_fim = self.boxDetalhesDoItem.node.DefesaEsp_Form1 or 0;
            						if DEFE_fim > 30 then DEFE_fim = 30;	end
            					local VEL_fim = self.boxDetalhesDoItem.node.Velocidade_Form1 or 0;
            				self.boxDetalhesDoItem.node.pok_INI = math.floor(VEL_fim) + INIbon;
            						if VEL_fim > 30 then VEL_fim = 30;	end
            					local VIDA_fim = self.boxDetalhesDoItem.node.Vida_Form1 or 0;
            				self.boxDetalhesDoItem.node.campoEFIS = math.floor(DEF_fim/5) + EFISbon;
            					if (self.boxDetalhesDoItem.node.campoEFIS >9) then self.boxDetalhesDoItem.node.campoEFIS = 0; 	end
            				self.boxDetalhesDoItem.node.campoEESP = math.floor(DEFE_fim/5) + EESPbon;
            					if (self.boxDetalhesDoItem.node.campoEESP >9) then self.boxDetalhesDoItem.node.campoEESP = 0; 	end
            				self.boxDetalhesDoItem.node.campoEVEL = math.floor(VEL_fim/10) + EVELbon;
            					if (self.boxDetalhesDoItem.node.campoEVEL >9) then self.boxDetalhesDoItem.node.campoEVEL = 0; 	end
            
            					local PokeLV = self.boxDetalhesDoItem.node.pokeLevel or 1
            				self.boxDetalhesDoItem.node.baseHPMAX = PokeLV + VIDA_fim*3;					
            
            				HPBasal = HPBase1 + HPVitam;
            				ATKBasal = ATKBase1 + ATKVitam;
            				DEFBasal = DEFBase1 + DEFVitam;
            				AESBasal = AESBase1 + AESVitam;
            				DESBasal = DESBase1 + DESVitam;
            				VELBasal = VelBase1 + VelVitam;
            			RelBasal = {HPBasal, ATKBasal, DEFBasal, AESBasal, DESBasal,VELBasal} 
            				
            			
            			local BonusElemental = math.floor(PokeLV/5) or 1
            			if BonusElemental == 0 then BonusElemental = 1 end
            			self.boxDetalhesDoItem.node.campoBonEle = BonusElemental;
            			
            			if (self.boxDetalhesDoItem.node.SlotActive1 == true) then 
            				self.boxDetalhesDoItem.node.SlotActive2 = false;
            				self.boxDetalhesDoItem.node.SlotActive3 = false;
            				self.boxDetalhesDoItem.node.SlotActive4 = false;
            				self.boxDetalhesDoItem.node.SlotActive5 = false;
            				self.boxDetalhesDoItem.node.SlotActive6 = false;
            				self.boxDetalhesDoItem.node.SlotActive7 = false;			
            				sheet.ImagemSlot1 = (self.boxDetalhesDoItem.node.campoPokemon or "");
            				sheet.NomeSlot1 = (self.boxDetalhesDoItem.node.campoApelido or self.boxDetalhesDoItem.node.campoNome or "");
            				sheet.LevelSlot1 = (self.boxDetalhesDoItem.node.pokeLevel or "")
            				sheet.GenderSlot1 = (self.boxDetalhesDoItem.node.basSEX or "");
            				self.boxDetalhesDoItem.node.active = true;
            				sheet.baseHPAtual1 = tonumber(self.boxDetalhesDoItem.node.baseHPAtual) or 0;
            				sheet.baseHPMAX1 = tonumber(self.boxDetalhesDoItem.node.baseHPMAX) or 0;
            				end
            			if (self.boxDetalhesDoItem.node.SlotActive2 == true) then 
            				self.boxDetalhesDoItem.node.SlotActive1 = false;
            				self.boxDetalhesDoItem.node.SlotActive3 = false;
            				self.boxDetalhesDoItem.node.SlotActive4 = false;
            				self.boxDetalhesDoItem.node.SlotActive5 = false;
            				self.boxDetalhesDoItem.node.SlotActive6 = false;
            				self.boxDetalhesDoItem.node.SlotActive7 = false;	
            				sheet.ImagemSlot2 = (self.boxDetalhesDoItem.node.campoPokemon or "");
            				sheet.NomeSlot2 = (self.boxDetalhesDoItem.node.campoApelido or self.boxDetalhesDoItem.node.campoNome or "");
            				sheet.LevelSlot2 = (self.boxDetalhesDoItem.node.pokeLevel or "")
            				sheet.GenderSlot2 = (self.boxDetalhesDoItem.node.basSEX or "");
            				self.boxDetalhesDoItem.node.active = true;
            				sheet.baseHPAtual2 = tonumber(self.boxDetalhesDoItem.node.baseHPAtual) or 0;
            				sheet.baseHPMAX2 = tonumber(self.boxDetalhesDoItem.node.baseHPMAX) or 0;
            				end
            			if (self.boxDetalhesDoItem.node.SlotActive3 == true) then 
            				self.boxDetalhesDoItem.node.SlotActive1 = false;
            				self.boxDetalhesDoItem.node.SlotActive2 = false;
            				self.boxDetalhesDoItem.node.SlotActive4 = false;
            				self.boxDetalhesDoItem.node.SlotActive5 = false;
            				self.boxDetalhesDoItem.node.SlotActive6 = false;
            				self.boxDetalhesDoItem.node.SlotActive7 = false;	
            				sheet.ImagemSlot3 = (self.boxDetalhesDoItem.node.campoPokemon or "");
            				sheet.NomeSlot3 = (self.boxDetalhesDoItem.node.campoApelido or self.boxDetalhesDoItem.node.campoNome or "");
            				sheet.LevelSlot3 = (self.boxDetalhesDoItem.node.pokeLevel or "")
            				sheet.GenderSlot3 = (self.boxDetalhesDoItem.node.basSEX or "");
            				self.boxDetalhesDoItem.node.active = true;
            				sheet.baseHPAtual3 = tonumber(self.boxDetalhesDoItem.node.baseHPAtual) or 0;
            				sheet.baseHPMAX3 = tonumber(self.boxDetalhesDoItem.node.baseHPMAX) or 0;
            				end
            			if (self.boxDetalhesDoItem.node.SlotActive4 == true) then 
            				self.boxDetalhesDoItem.node.SlotActive2 = false;
            				self.boxDetalhesDoItem.node.SlotActive3 = false;
            				self.boxDetalhesDoItem.node.SlotActive1 = false;
            				self.boxDetalhesDoItem.node.SlotActive5 = false;
            				self.boxDetalhesDoItem.node.SlotActive6 = false;
            				self.boxDetalhesDoItem.node.SlotActive7 = false;	
            				sheet.ImagemSlot4 = (self.boxDetalhesDoItem.node.campoPokemon or "");
            				sheet.NomeSlot4 = (self.boxDetalhesDoItem.node.campoApelido or self.boxDetalhesDoItem.node.campoNome or "");
            				sheet.LevelSlot4 = (self.boxDetalhesDoItem.node.pokeLevel or "")
            				sheet.GenderSlot4 = (self.boxDetalhesDoItem.node.basSEX or "");
            				self.boxDetalhesDoItem.node.active = true;
            				sheet.baseHPAtual4 = tonumber(self.boxDetalhesDoItem.node.baseHPAtual) or 0;
            				sheet.baseHPMAX4 = tonumber(self.boxDetalhesDoItem.node.baseHPMAX) or 0;
            				end			
            			if (self.boxDetalhesDoItem.node.SlotActive5 == true) then 
            				self.boxDetalhesDoItem.node.SlotActive2 = false;
            				self.boxDetalhesDoItem.node.SlotActive3 = false;
            				self.boxDetalhesDoItem.node.SlotActive4 = false;
            				self.boxDetalhesDoItem.node.SlotActive1 = false;
            				self.boxDetalhesDoItem.node.SlotActive6 = false;
            				self.boxDetalhesDoItem.node.SlotActive7 = false;	
            				sheet.ImagemSlot5 = (self.boxDetalhesDoItem.node.campoPokemon or "");
            				sheet.NomeSlot5 = (self.boxDetalhesDoItem.node.campoApelido or self.boxDetalhesDoItem.node.campoNome or "");
            				sheet.LevelSlot5 = (self.boxDetalhesDoItem.node.pokeLevel or "")
            				sheet.GenderSlot5 = (self.boxDetalhesDoItem.node.basSEX or "");
            				self.boxDetalhesDoItem.node.active = true;
            				sheet.baseHPAtual5 = tonumber(self.boxDetalhesDoItem.node.baseHPAtual) or 0;
            				sheet.baseHPMAX5 = tonumber(self.boxDetalhesDoItem.node.baseHPMAX) or 0;
            				end
            			if (self.boxDetalhesDoItem.node.SlotActive6 == true) then 
            				self.boxDetalhesDoItem.node.SlotActive2 = false;
            				self.boxDetalhesDoItem.node.SlotActive3 = false;
            				self.boxDetalhesDoItem.node.SlotActive4 = false;
            				self.boxDetalhesDoItem.node.SlotActive5 = false;
            				self.boxDetalhesDoItem.node.SlotActive1 = false;
            				self.boxDetalhesDoItem.node.SlotActive7 = false;	
            				sheet.ImagemSlot6 = (self.boxDetalhesDoItem.node.campoPokemon or "");
            				sheet.NomeSlot6 = (self.boxDetalhesDoItem.node.campoApelido or self.boxDetalhesDoItem.node.campoNome or "");
            				sheet.LevelSlot6 = (self.boxDetalhesDoItem.node.pokeLevel or "")
            				sheet.GenderSlot6 = (self.boxDetalhesDoItem.node.basSEX or "");			
            				self.boxDetalhesDoItem.node.active = true;
            				sheet.baseHPAtual6 = tonumber(self.boxDetalhesDoItem.node.baseHPAtual) or 0;
            				sheet.baseHPMAX6 = tonumber(self.boxDetalhesDoItem.node.baseHPMAX) or 0;
            				end	
            			if (self.boxDetalhesDoItem.node.SlotActive7 == true) then 
            				self.boxDetalhesDoItem.node.SlotActive2 = false;
            				self.boxDetalhesDoItem.node.SlotActive3 = false;
            				self.boxDetalhesDoItem.node.SlotActive4 = false;
            				self.boxDetalhesDoItem.node.SlotActive5 = false;
            				self.boxDetalhesDoItem.node.SlotActive6 = false;
            				self.boxDetalhesDoItem.node.SlotActive1 = false;	
            				self.boxDetalhesDoItem.node.active = false;
            				end
        end, obj);

    obj._e_event19 = obj.button11:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = self.boxDetalhesDoItem.node.ataqueP1 or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP1 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Accuracy = self.boxDetalhesDoItem.node.AccP1 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event20 = obj.button12:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP1 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP1) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            					
            					local str = ((self.boxDetalhesDoItem.node.danoP1 or "")  .. "+" .. (ATK[Attribute] or "")) or "1d2";
            					local rolagem = Firecast.interpretarRolagem(str);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event21 = obj.button13:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP1 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP1) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            
            					local dado = (self.boxDetalhesDoItem.node.danoP1 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event22 = obj.button14:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = self.boxDetalhesDoItem.node.ataqueP2 or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP2 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Accuracy = self.boxDetalhesDoItem.node.AccP2 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event23 = obj.button15:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP2 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP2) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            					
            					local str = ((self.boxDetalhesDoItem.node.danoP2 or "")  .. "+" .. (ATK[Attribute] or "")) or "1d2";
            					local rolagem = Firecast.interpretarRolagem(str);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event24 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP2 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP2) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            
            					local dado = (self.boxDetalhesDoItem.node.danoP2 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event25 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = self.boxDetalhesDoItem.node.ataqueP3 or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP3 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Accuracy = self.boxDetalhesDoItem.node.AccP3 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event26 = obj.button18:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP3 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP3) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            					
            					local str = ((self.boxDetalhesDoItem.node.danoP3 or "")  .. "+" .. (ATK[Attribute] or "")) or "1d2";
            					local rolagem = Firecast.interpretarRolagem(str);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event27 = obj.button19:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP3 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP3) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            
            					local dado = (self.boxDetalhesDoItem.node.danoP3 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event28 = obj.button20:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = self.boxDetalhesDoItem.node.ataqueP4 or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP4 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Accuracy = self.boxDetalhesDoItem.node.AccP4 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event29 = obj.button21:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP4 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP4) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            					
            					local str = ((self.boxDetalhesDoItem.node.danoP4 or "")  .. "+" .. (ATK[Attribute] or "")) or "1d2";
            					local rolagem = Firecast.interpretarRolagem(str);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event30 = obj.button22:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP4 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP4) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            
            					local dado = (self.boxDetalhesDoItem.node.danoP4 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event31 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = self.boxDetalhesDoItem.node.ataqueP5 or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP5 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Accuracy = self.boxDetalhesDoItem.node.AccP5 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event32 = obj.button24:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP5 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP5) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            					
            					local str = ((self.boxDetalhesDoItem.node.danoP5 or "")  .. "+" .. (ATK[Attribute] or "")) or "1d2";
            					local rolagem = Firecast.interpretarRolagem(str);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event33 = obj.button25:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP5 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP5) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            
            					local dado = (self.boxDetalhesDoItem.node.danoP5 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event34 = obj.button26:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = self.boxDetalhesDoItem.node.ataqueP6 or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP6 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Accuracy = self.boxDetalhesDoItem.node.AccP6 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event35 = obj.button27:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP6 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP6) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            					
            					local str = ((self.boxDetalhesDoItem.node.danoP6 or "")  .. "+" .. (ATK[Attribute] or "")) or "1d2";
            					local rolagem = Firecast.interpretarRolagem(str);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event36 = obj.button28:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP6 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP6) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            
            					local dado = (self.boxDetalhesDoItem.node.danoP6 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event37 = obj.button29:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = self.boxDetalhesDoItem.node.ataqueP7 or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP7 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Accuracy = self.boxDetalhesDoItem.node.AccP7 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event38 = obj.button30:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP7 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP7) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            					
            					local str = ((self.boxDetalhesDoItem.node.danoP7 or "")  .. "+" .. (ATK[Attribute] or "")) or "1d2";
            					local rolagem = Firecast.interpretarRolagem(str);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event39 = obj.button31:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP7 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP7) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            
            					local dado = (self.boxDetalhesDoItem.node.danoP7 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event40 = obj.button32:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local ATAQUE = self.boxDetalhesDoItem.node.ataqueP8 or 0;
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP8 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Accuracy = self.boxDetalhesDoItem.node.AccP8 or "N/A"
            					mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event41 = obj.button33:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP8 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP8) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            					
            					local str = ((self.boxDetalhesDoItem.node.danoP8 or "")  .. "+" .. (ATK[Attribute] or "")) or "1d2";
            					local rolagem = Firecast.interpretarRolagem(str);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event42 = obj.button34:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            					local NomeGolpe = self.boxDetalhesDoItem.node.golpeP8 or "Golpe"
            					local NomeUser = self.boxDetalhesDoItem.node.campoNome or "Pokémon"
            					local Attribute = tonumber(self.boxDetalhesDoItem.node.classeP8) or 3;
            						if Attribute > 3 then Attribute = 3; 					end
            						if 1 > Attribute then Attribute = 1; 					end
            					local ATKFIS = self.boxDetalhesDoItem.node.Ataque_Form1 or 0;
            					local ATKESP = self.boxDetalhesDoItem.node.AtaqueEsp_Form1 or 0;
            					local ATK = {ATKFIS,ATKESP,0} or 0;
            
            					local dado = (self.boxDetalhesDoItem.node.danoP8 or "1d2");
            					local extra = (ATK[Attribute] or "") or "0";
            					local rolagem = Firecast.interpretarRolagem(dado);
            					rolagem:concatenar(dado);
            					rolagem:concatenar(extra);
            					
            					if (Attribute == 1 or Attribute == 2) then
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano CRÍTICO de " .. NomeGolpe .. " usado por " .. NomeUser) 
            						end
        end, obj);

    obj._e_event43 = obj.button35:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perCorrida) or 0
            				local nome = "Corrida" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(1) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event44 = obj.button36:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perForca) or 0
            				local nome = "Força" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(1) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event45 = obj.button37:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perIntimidacao) or 0
            				local nome = "Intimidação" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(1) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event46 = obj.button38:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perSalto) or 0
            				local nome = "Salto" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(1) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event47 = obj.button39:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perConcentra) or 0
            				local nome = "Concentração" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(2) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event48 = obj.button40:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perDeflex) or 0
            				local nome = "Deflexão" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(2) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event49 = obj.button41:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perIncansa) or 0
            				local nome = "Incansável" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(2) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event50 = obj.button42:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perRegen) or 0
            				local nome = "Regeneração" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(2) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event51 = obj.button43:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perEngenha) or 0
            				local nome = "Engenharia" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(3) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event52 = obj.button44:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perHistoria) or 0
            				local nome = "História" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(3) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event53 = obj.button45:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perInvestig) or 0
            				local nome = "Investigação" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(3) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event54 = obj.button46:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perProgram) or 0
            				local nome = "Programação" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(3) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event55 = obj.button47:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perEmpatia) or 0
            				local nome = "Empatia" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(4) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event56 = obj.button48:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perManha) or 0
            				local nome = "Manha" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(4) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event57 = obj.button49:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perManipul) or 0
            				local nome = "Manipulação" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(4) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event58 = obj.button50:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perPercepcao) or 0
            				local nome = "Percepção" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(4) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event59 = obj.button51:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perAcrobacia) or 0
            				local nome = "Acrobacia" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(5) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event60 = obj.button52:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perFurtiv) or 0
            				local nome = "Furtividade" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(5) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event61 = obj.button53:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perPerfomace) or 0
            				local nome = "Performance" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(5) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event62 = obj.button54:addEventListener("onClick",
        function (_)
            local mesa = Firecast.getMesaDe(sheet);
            				local Pericia = tonumber(sheet.perPrestid) or 0
            				local nome = "Prestidigitação" or "Perícia"
            				local nomTr = sheet.baseName or "Treinador"
            				local AttSelect = tonumber(5) or 0;
            				local Ataque = sheet.ATK_mod or 0;
            				local Defesa = sheet.DEF_mod or 0;
            				local AtaEsp = sheet.SPATK_mod or 0;
            				local DefEsp = sheet.SPDEF_mod or 0;
            				local Veloc = sheet.SPD_mod or 0;			
            				local Atributos = {Ataque, Defesa, AtaEsp, DefEsp, Veloc}
            				local bonAtt = 0
            				if (Pericia == 1) then
            					bonAtt = Atributos[AttSelect];
            					end
            				if (Pericia == 2) then
            					bonAtt = Atributos[AttSelect]*2;
            					end										
            				local bonFix = 0;
            				if Pericia == 1 then
            					bonFix = 2;
            					end
            				if Pericia == 2 then
            					bonFix = 4;
            					end
            				local Total = bonAtt + bonFix 
            				local Rolagem = rrpg.interpretarRolagem("1d20")
            				Rolagem:concatenar(Total);
            				mesa.activeChat:rolarDados(Rolagem, "Teste da Perícia:[§B] " .. nome .. "[§B] usada por " .. nomTr)
        end, obj);

    obj._e_event63 = obj.dataLink106:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local rcl = self:findControlByName("rclListaDosTalentosBase");
            					if rcl~= nil then
            						rcl:sort();
            					end;
            					rcl = self:findControlByName("rclListaDosTalentosAvanc");
            					if rcl~= nil then
            						rcl:sort();
            						end;
        end, obj);

    obj._e_event64 = obj.button55:addEventListener("onClick",
        function (_)
            self.rclListaDosTalentosBase:append();
        end, obj);

    obj._e_event65 = obj.rclListaDosTalentosBase:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event66 = obj.button56:addEventListener("onClick",
        function (_)
            self.rclListaDosTalentosAvanc:append();
        end, obj);

    obj._e_event67 = obj.rclListaDosTalentosAvanc:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event68 = obj.button57:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local ATAQUE = sheet.ataque1 or 0;
            				local NomeGolpe = sheet.golpe1 or "Golpe"
            				local NomeUser = sheet.baseName or "Treinador"
            				local Accuracy = sheet.Acc1 or "N/A"
            				mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event69 = obj.button58:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local NomeGolpe = sheet.golpe1 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            
            				local Attribute = tonumber(sheet.classe1) or 3;
            					if Attribute > 4 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event70 = obj.button59:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            				local NomeGolpe = sheet.golpe1 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            				local Attribute = tonumber(sheet.classe1) or 3;
            				if Attribute > 4 then 
            					Attribute = 3; 					
            					end
            				if 1 > Attribute then 
            					Attribute = 1; 					
            					end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event71 = obj.button60:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local ATAQUE = sheet.ataque2 or 0;
            				local NomeGolpe = sheet.golpe2 or "Golpe"
            				local NomeUser = sheet.baseName or "Treinador"
            				local Accuracy = sheet.Acc2 or "N/A"
            				mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event72 = obj.button61:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local NomeGolpe = sheet.golpe2 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            
            				local Attribute = tonumber(sheet.classe2) or 3;
            					if Attribute > 4 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event73 = obj.button62:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            				local NomeGolpe = sheet.golpe2 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            				local Attribute = tonumber(sheet.classe2) or 3;
            				if Attribute > 4 then 
            					Attribute = 3; 					
            					end
            				if 1 > Attribute then 
            					Attribute = 1; 					
            					end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event74 = obj.button63:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local ATAQUE = sheet.ataque3 or 0;
            				local NomeGolpe = sheet.golpe3 or "Golpe"
            				local NomeUser = sheet.baseName or "Treinador"
            				local Accuracy = sheet.Acc3 or "N/A"
            				mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event75 = obj.button64:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local NomeGolpe = sheet.golpe3 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            
            				local Attribute = tonumber(sheet.classe3) or 3;
            					if Attribute > 4 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event76 = obj.button65:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            				local NomeGolpe = sheet.golpe3 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            				local Attribute = tonumber(sheet.classe3) or 3;
            				if Attribute > 4 then 
            					Attribute = 3; 					
            					end
            				if 1 > Attribute then 
            					Attribute = 1; 					
            					end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event77 = obj.button66:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local ATAQUE = sheet.ataque4 or 0;
            				local NomeGolpe = sheet.golpe4 or "Golpe"
            				local NomeUser = sheet.baseName or "Treinador"
            				local Accuracy = sheet.Acc4 or "N/A"
            				mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event78 = obj.button67:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local NomeGolpe = sheet.golpe4 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            
            				local Attribute = tonumber(sheet.classe4) or 3;
            					if Attribute > 4 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event79 = obj.button68:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            				local NomeGolpe = sheet.golpe4 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            				local Attribute = tonumber(sheet.classe4) or 3;
            				if Attribute > 4 then 
            					Attribute = 3; 					
            					end
            				if 1 > Attribute then 
            					Attribute = 1; 					
            					end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event80 = obj.button69:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local ATAQUE = sheet.ataque5 or 0;
            				local NomeGolpe = sheet.golpe5 or "Golpe"
            				local NomeUser = sheet.baseName or "Treinador"
            				local Accuracy = sheet.Acc5 or "N/A"
            				mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event81 = obj.button70:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local NomeGolpe = sheet.golpe5 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            
            				local Attribute = tonumber(sheet.classe5) or 3;
            					if Attribute > 4 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event82 = obj.button71:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            				local NomeGolpe = sheet.golpe5 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            				local Attribute = tonumber(sheet.classe5) or 3;
            				if Attribute > 4 then 
            					Attribute = 3; 					
            					end
            				if 1 > Attribute then 
            					Attribute = 1; 					
            					end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event83 = obj.button72:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local ATAQUE = sheet.ataque6 or 0;
            				local NomeGolpe = sheet.golpe6 or "Golpe"
            				local NomeUser = sheet.baseName or "Treinador"
            				local Accuracy = sheet.Acc6 or "N/A"
            				mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event84 = obj.button73:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local NomeGolpe = sheet.golpe6 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            
            				local Attribute = tonumber(sheet.classe6) or 3;
            					if Attribute > 4 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event85 = obj.button74:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            				local NomeGolpe = sheet.golpe6 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            				local Attribute = tonumber(sheet.classe6) or 3;
            				if Attribute > 4 then 
            					Attribute = 3; 					
            					end
            				if 1 > Attribute then 
            					Attribute = 1; 					
            					end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event86 = obj.button75:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local ATAQUE = sheet.ataque7 or 0;
            				local NomeGolpe = sheet.golpe7 or "Golpe"
            				local NomeUser = sheet.baseName or "Treinador"
            				local Accuracy = sheet.Acc7 or "N/A"
            				mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event87 = obj.button76:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local NomeGolpe = sheet.golpe7 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            
            				local Attribute = tonumber(sheet.classe7) or 3;
            					if Attribute > 4 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event88 = obj.button77:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            				local NomeGolpe = sheet.golpe7 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            				local Attribute = tonumber(sheet.classe7) or 3;
            				if Attribute > 4 then 
            					Attribute = 3; 					
            					end
            				if 1 > Attribute then 
            					Attribute = 1; 					
            					end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event89 = obj.button78:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local ATAQUE = sheet.ataque8 or 0;
            				local NomeGolpe = sheet.golpe8 or "Golpe"
            				local NomeUser = sheet.baseName or "Treinador"
            				local Accuracy = sheet.Acc8 or "N/A"
            				mesaDoPersonagem.activeChat:rolarDados("1d20 + " .. ATAQUE, "Acerto (AC = " .. Accuracy .. ") de " .. NomeGolpe .. " usado por " .. NomeUser)
        end, obj);

    obj._e_event90 = obj.button79:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)
            				local NomeGolpe = sheet.golpe8 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            
            				local Attribute = tonumber(sheet.classe8) or 3;
            					if Attribute > 4 then 
            						Attribute = 3; 					
            						end
            					if 1 > Attribute then 
            						Attribute = 1; 					
            						end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event91 = obj.button80:addEventListener("onClick",
        function (_)
            if sheet == nil then return end;
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet)					
            				local NomeGolpe = sheet.golpe8 or "Golpe"
            				local NomeUser = sheet.baseName or "Pokémon"
            				local Attribute = tonumber(sheet.classe8) or 3;
            				if Attribute > 4 then 
            					Attribute = 3; 					
            					end
            				if 1 > Attribute then 
            					Attribute = 1; 					
            					end
            				local ATKFIS = sheet.ATK_tot or 0;
            				local ATKESP = sheet.SPATK_tot or 0;
            				local ATKWEA = sheet.ATK_mod or 0;
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

    obj._e_event92 = obj.button81:addEventListener("onClick",
        function (_)
            self.rclConsumiveis:append();
        end, obj);

    obj._e_event93 = obj.button82:addEventListener("onClick",
        function (_)
            self.rclItens2:append();
        end, obj);

    obj._e_event94 = obj.button83:addEventListener("onClick",
        function (_)
            self.rclItens3:append();
        end, obj);

    obj._e_event95 = obj.button84:addEventListener("onClick",
        function (_)
            self.rclItens4:append();
        end, obj);

    obj._e_event96 = obj.button85:addEventListener("onClick",
        function (_)
            self.rclItens5:append();
        end, obj);

    obj._e_event97 = obj.button86:addEventListener("onClick",
        function (_)
            self.rclItens6:append();
        end, obj);

    obj._e_event98 = obj.button87:addEventListener("onClick",
        function (_)
            self.rclDex:append();
        end, obj);

    obj._e_event99 = obj.rclDex:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (nodeA.pokeNumber or 0) < (nodeB.pokeNumber or 0) then
            					return -1;
            				elseif (nodeA.pokeNumber or 0) > (nodeB.pokeNumber or 0) then
            					return 1;
            				else   
            					return utils.compareStringPtBr(nodeA.pokeSpecie, nodeB.pokeSpecie);
            					end;
        end, obj);

    obj._e_event100 = obj.rclDex:addEventListener("onItemAdded",
        function (_, node, form)
            self.recalcDex();
        end, obj);

    obj._e_event101 = obj.rclDex:addEventListener("onItemRemoved",
        function (_, node, form)
            self.recalcDex();
        end, obj);

    obj._e_event102 = obj.dataLink107:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet== nil then return end;
            			self.recalcDex();
        end, obj);

    obj._e_event103 = obj.button88:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://www.dropbox.com/s/j0pyn9zxu1827zk/Livro%20do%20Jogador.pdf?dl=0')
        end, obj);

    obj._e_event104 = obj.button89:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://drive.google.com/file/d/11XrR-iKt0hyr-NkxLp6vxwERe0YcYayM/view')
        end, obj);

    obj._e_event105 = obj.button90:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://drive.google.com/file/d/1aq9A1zeIiCDlaFw58BLLu8S0iqXd1mp6/view')
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit273 ~= nil then self.edit273:destroy(); self.edit273 = nil; end;
        if self.label329 ~= nil then self.label329:destroy(); self.label329 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.button89 ~= nil then self.button89:destroy(); self.button89 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.label327 ~= nil then self.label327:destroy(); self.label327 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label338 ~= nil then self.label338:destroy(); self.label338 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.frmNotes ~= nil then self.frmNotes:destroy(); self.frmNotes = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.popHabilidade ~= nil then self.popHabilidade:destroy(); self.popHabilidade = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.image51 ~= nil then self.image51:destroy(); self.image51 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.dataLink92 ~= nil then self.dataLink92:destroy(); self.dataLink92 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rclDex ~= nil then self.rclDex:destroy(); self.rclDex = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.radioButton35 ~= nil then self.radioButton35:destroy(); self.radioButton35 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.radioButton56 ~= nil then self.radioButton56:destroy(); self.radioButton56 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.label331 ~= nil then self.label331:destroy(); self.label331 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label293 ~= nil then self.label293:destroy(); self.label293 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.tab13 ~= nil then self.tab13:destroy(); self.tab13 = nil; end;
        if self.radioButton41 ~= nil then self.radioButton41:destroy(); self.radioButton41 = nil; end;
        if self.comboBox28 ~= nil then self.comboBox28:destroy(); self.comboBox28 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.radioButton16 ~= nil then self.radioButton16:destroy(); self.radioButton16 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.dataLink102 ~= nil then self.dataLink102:destroy(); self.dataLink102 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit312 ~= nil then self.edit312:destroy(); self.edit312 = nil; end;
        if self.label287 ~= nil then self.label287:destroy(); self.label287 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.dataLink94 ~= nil then self.dataLink94:destroy(); self.dataLink94 = nil; end;
        if self.radioButton29 ~= nil then self.radioButton29:destroy(); self.radioButton29 = nil; end;
        if self.image56 ~= nil then self.image56:destroy(); self.image56 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.edit339 ~= nil then self.edit339:destroy(); self.edit339 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label258 ~= nil then self.label258:destroy(); self.label258 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label307 ~= nil then self.label307:destroy(); self.label307 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.label340 ~= nil then self.label340:destroy(); self.label340 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.radioButton26 ~= nil then self.radioButton26:destroy(); self.radioButton26 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.radioButton22 ~= nil then self.radioButton22:destroy(); self.radioButton22 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.edit347 ~= nil then self.edit347:destroy(); self.edit347 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit343 ~= nil then self.edit343:destroy(); self.edit343 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.progressBar5 ~= nil then self.progressBar5:destroy(); self.progressBar5 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label261 ~= nil then self.label261:destroy(); self.label261 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.edit304 ~= nil then self.edit304:destroy(); self.edit304 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.label284 ~= nil then self.label284:destroy(); self.label284 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit309 ~= nil then self.edit309:destroy(); self.edit309 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.image49 ~= nil then self.image49:destroy(); self.image49 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.label324 ~= nil then self.label324:destroy(); self.label324 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.label332 ~= nil then self.label332:destroy(); self.label332 = nil; end;
        if self.image52 ~= nil then self.image52:destroy(); self.image52 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.dataLink107 ~= nil then self.dataLink107:destroy(); self.dataLink107 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.label278 ~= nil then self.label278:destroy(); self.label278 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.dataLink97 ~= nil then self.dataLink97:destroy(); self.dataLink97 = nil; end;
        if self.edit348 ~= nil then self.edit348:destroy(); self.edit348 = nil; end;
        if self.label334 ~= nil then self.label334:destroy(); self.label334 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label335 ~= nil then self.label335:destroy(); self.label335 = nil; end;
        if self.label263 ~= nil then self.label263:destroy(); self.label263 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.radioButton23 ~= nil then self.radioButton23:destroy(); self.radioButton23 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.label323 ~= nil then self.label323:destroy(); self.label323 = nil; end;
        if self.radioButton39 ~= nil then self.radioButton39:destroy(); self.radioButton39 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.label315 ~= nil then self.label315:destroy(); self.label315 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.BotaoItemA ~= nil then self.BotaoItemA:destroy(); self.BotaoItemA = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.label306 ~= nil then self.label306:destroy(); self.label306 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.label347 ~= nil then self.label347:destroy(); self.label347 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit360 ~= nil then self.edit360:destroy(); self.edit360 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit332 ~= nil then self.edit332:destroy(); self.edit332 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.image54 ~= nil then self.image54:destroy(); self.image54 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.label254 ~= nil then self.label254:destroy(); self.label254 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.comboBox31 ~= nil then self.comboBox31:destroy(); self.comboBox31 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit313 ~= nil then self.edit313:destroy(); self.edit313 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
        if self.edit358 ~= nil then self.edit358:destroy(); self.edit358 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.label325 ~= nil then self.label325:destroy(); self.label325 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.label273 ~= nil then self.label273:destroy(); self.label273 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit355 ~= nil then self.edit355:destroy(); self.edit355 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.radioButton38 ~= nil then self.radioButton38:destroy(); self.radioButton38 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.label330 ~= nil then self.label330:destroy(); self.label330 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.label339 ~= nil then self.label339:destroy(); self.label339 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label336 ~= nil then self.label336:destroy(); self.label336 = nil; end;
        if self.frmPericias ~= nil then self.frmPericias:destroy(); self.frmPericias = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.radioButton51 ~= nil then self.radioButton51:destroy(); self.radioButton51 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.label317 ~= nil then self.label317:destroy(); self.label317 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit302 ~= nil then self.edit302:destroy(); self.edit302 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label333 ~= nil then self.label333:destroy(); self.label333 = nil; end;
        if self.edit308 ~= nil then self.edit308:destroy(); self.edit308 = nil; end;
        if self.edit300 ~= nil then self.edit300:destroy(); self.edit300 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.dataLink98 ~= nil then self.dataLink98:destroy(); self.dataLink98 = nil; end;
        if self.radioButton52 ~= nil then self.radioButton52:destroy(); self.radioButton52 = nil; end;
        if self.label341 ~= nil then self.label341:destroy(); self.label341 = nil; end;
        if self.button90 ~= nil then self.button90:destroy(); self.button90 = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.edit314 ~= nil then self.edit314:destroy(); self.edit314 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.image50 ~= nil then self.image50:destroy(); self.image50 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.label304 ~= nil then self.label304:destroy(); self.label304 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.radioButton55 ~= nil then self.radioButton55:destroy(); self.radioButton55 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label280 ~= nil then self.label280:destroy(); self.label280 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.radioButton60 ~= nil then self.radioButton60:destroy(); self.radioButton60 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.radioButton12 ~= nil then self.radioButton12:destroy(); self.radioButton12 = nil; end;
        if self.label298 ~= nil then self.label298:destroy(); self.label298 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.frmTalentos ~= nil then self.frmTalentos:destroy(); self.frmTalentos = nil; end;
        if self.label281 ~= nil then self.label281:destroy(); self.label281 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.button82 ~= nil then self.button82:destroy(); self.button82 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.image44 ~= nil then self.image44:destroy(); self.image44 = nil; end;
        if self.edit359 ~= nil then self.edit359:destroy(); self.edit359 = nil; end;
        if self.button86 ~= nil then self.button86:destroy(); self.button86 = nil; end;
        if self.label262 ~= nil then self.label262:destroy(); self.label262 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.image53 ~= nil then self.image53:destroy(); self.image53 = nil; end;
        if self.rclItens6 ~= nil then self.rclItens6:destroy(); self.rclItens6 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit333 ~= nil then self.edit333:destroy(); self.edit333 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.edit310 ~= nil then self.edit310:destroy(); self.edit310 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit298 ~= nil then self.edit298:destroy(); self.edit298 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.label275 ~= nil then self.label275:destroy(); self.label275 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.radioButton59 ~= nil then self.radioButton59:destroy(); self.radioButton59 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.dataLink93 ~= nil then self.dataLink93:destroy(); self.dataLink93 = nil; end;
        if self.label301 ~= nil then self.label301:destroy(); self.label301 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label253 ~= nil then self.label253:destroy(); self.label253 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.label289 ~= nil then self.label289:destroy(); self.label289 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit353 ~= nil then self.edit353:destroy(); self.edit353 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit349 ~= nil then self.edit349:destroy(); self.edit349 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.edit326 ~= nil then self.edit326:destroy(); self.edit326 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.label259 ~= nil then self.label259:destroy(); self.label259 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.rclItens4 ~= nil then self.rclItens4:destroy(); self.rclItens4 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.edit338 ~= nil then self.edit338:destroy(); self.edit338 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label267 ~= nil then self.label267:destroy(); self.label267 = nil; end;
        if self.label283 ~= nil then self.label283:destroy(); self.label283 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit354 ~= nil then self.edit354:destroy(); self.edit354 = nil; end;
        if self.edit293 ~= nil then self.edit293:destroy(); self.edit293 = nil; end;
        if self.image47 ~= nil then self.image47:destroy(); self.image47 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.edit361 ~= nil then self.edit361:destroy(); self.edit361 = nil; end;
        if self.label345 ~= nil then self.label345:destroy(); self.label345 = nil; end;
        if self.comboBox30 ~= nil then self.comboBox30:destroy(); self.comboBox30 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.label318 ~= nil then self.label318:destroy(); self.label318 = nil; end;
        if self.image55 ~= nil then self.image55:destroy(); self.image55 = nil; end;
        if self.button84 ~= nil then self.button84:destroy(); self.button84 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label252 ~= nil then self.label252:destroy(); self.label252 = nil; end;
        if self.label255 ~= nil then self.label255:destroy(); self.label255 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label303 ~= nil then self.label303:destroy(); self.label303 = nil; end;
        if self.edit329 ~= nil then self.edit329:destroy(); self.edit329 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.radioButton46 ~= nil then self.radioButton46:destroy(); self.radioButton46 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.edit311 ~= nil then self.edit311:destroy(); self.edit311 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.radioButton13 ~= nil then self.radioButton13:destroy(); self.radioButton13 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.label344 ~= nil then self.label344:destroy(); self.label344 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.dataLink99 ~= nil then self.dataLink99:destroy(); self.dataLink99 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit341 ~= nil then self.edit341:destroy(); self.edit341 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.dataLink105 ~= nil then self.dataLink105:destroy(); self.dataLink105 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.image46 ~= nil then self.image46:destroy(); self.image46 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.label300 ~= nil then self.label300:destroy(); self.label300 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.label286 ~= nil then self.label286:destroy(); self.label286 = nil; end;
        if self.edit340 ~= nil then self.edit340:destroy(); self.edit340 = nil; end;
        if self.edit342 ~= nil then self.edit342:destroy(); self.edit342 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.edit350 ~= nil then self.edit350:destroy(); self.edit350 = nil; end;
        if self.progressBar4 ~= nil then self.progressBar4:destroy(); self.progressBar4 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.label290 ~= nil then self.label290:destroy(); self.label290 = nil; end;
        if self.label265 ~= nil then self.label265:destroy(); self.label265 = nil; end;
        if self.dataLink101 ~= nil then self.dataLink101:destroy(); self.dataLink101 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.frmFichaRPGmeister2_svg ~= nil then self.frmFichaRPGmeister2_svg:destroy(); self.frmFichaRPGmeister2_svg = nil; end;
        if self.dataLink96 ~= nil then self.dataLink96:destroy(); self.dataLink96 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.label308 ~= nil then self.label308:destroy(); self.label308 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.edit321 ~= nil then self.edit321:destroy(); self.edit321 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit331 ~= nil then self.edit331:destroy(); self.edit331 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.radioButton47 ~= nil then self.radioButton47:destroy(); self.radioButton47 = nil; end;
        if self.label314 ~= nil then self.label314:destroy(); self.label314 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.popItem ~= nil then self.popItem:destroy(); self.popItem = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.rclItens3 ~= nil then self.rclItens3:destroy(); self.rclItens3 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label266 ~= nil then self.label266:destroy(); self.label266 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label282 ~= nil then self.label282:destroy(); self.label282 = nil; end;
        if self.edit346 ~= nil then self.edit346:destroy(); self.edit346 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label291 ~= nil then self.label291:destroy(); self.label291 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.label322 ~= nil then self.label322:destroy(); self.label322 = nil; end;
        if self.radioButton9 ~= nil then self.radioButton9:destroy(); self.radioButton9 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.edit345 ~= nil then self.edit345:destroy(); self.edit345 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.radioButton15 ~= nil then self.radioButton15:destroy(); self.radioButton15 = nil; end;
        if self.edit352 ~= nil then self.edit352:destroy(); self.edit352 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.comboBox32 ~= nil then self.comboBox32:destroy(); self.comboBox32 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.dataLink85 ~= nil then self.dataLink85:destroy(); self.dataLink85 = nil; end;
        if self.edit303 ~= nil then self.edit303:destroy(); self.edit303 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.progressBar3 ~= nil then self.progressBar3:destroy(); self.progressBar3 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.radioButton58 ~= nil then self.radioButton58:destroy(); self.radioButton58 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.label260 ~= nil then self.label260:destroy(); self.label260 = nil; end;
        if self.label276 ~= nil then self.label276:destroy(); self.label276 = nil; end;
        if self.dataLink95 ~= nil then self.dataLink95:destroy(); self.dataLink95 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.radioButton37 ~= nil then self.radioButton37:destroy(); self.radioButton37 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label256 ~= nil then self.label256:destroy(); self.label256 = nil; end;
        if self.dataLink86 ~= nil then self.dataLink86:destroy(); self.dataLink86 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.button85 ~= nil then self.button85:destroy(); self.button85 = nil; end;
        if self.label299 ~= nil then self.label299:destroy(); self.label299 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink89 ~= nil then self.dataLink89:destroy(); self.dataLink89 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit334 ~= nil then self.edit334:destroy(); self.edit334 = nil; end;
        if self.label350 ~= nil then self.label350:destroy(); self.label350 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.popExemplo ~= nil then self.popExemplo:destroy(); self.popExemplo = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rclItens2 ~= nil then self.rclItens2:destroy(); self.rclItens2 = nil; end;
        if self.radioButton48 ~= nil then self.radioButton48:destroy(); self.radioButton48 = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.edit296 ~= nil then self.edit296:destroy(); self.edit296 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.radioButton54 ~= nil then self.radioButton54:destroy(); self.radioButton54 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label351 ~= nil then self.label351:destroy(); self.label351 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label328 ~= nil then self.label328:destroy(); self.label328 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.radioButton50 ~= nil then self.radioButton50:destroy(); self.radioButton50 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit297 ~= nil then self.edit297:destroy(); self.edit297 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.frmPokemon1 ~= nil then self.frmPokemon1:destroy(); self.frmPokemon1 = nil; end;
        if self.dataLink100 ~= nil then self.dataLink100:destroy(); self.dataLink100 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label319 ~= nil then self.label319:destroy(); self.label319 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.rclListaDosTalentosAvanc ~= nil then self.rclListaDosTalentosAvanc:destroy(); self.rclListaDosTalentosAvanc = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.label348 ~= nil then self.label348:destroy(); self.label348 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.label288 ~= nil then self.label288:destroy(); self.label288 = nil; end;
        if self.label302 ~= nil then self.label302:destroy(); self.label302 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.image42 ~= nil then self.image42:destroy(); self.image42 = nil; end;
        if self.frmFichaRPGmeister3_svg ~= nil then self.frmFichaRPGmeister3_svg:destroy(); self.frmFichaRPGmeister3_svg = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.edit316 ~= nil then self.edit316:destroy(); self.edit316 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image45 ~= nil then self.image45:destroy(); self.image45 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.label321 ~= nil then self.label321:destroy(); self.label321 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.image41 ~= nil then self.image41:destroy(); self.image41 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.radioButton24 ~= nil then self.radioButton24:destroy(); self.radioButton24 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.label268 ~= nil then self.label268:destroy(); self.label268 = nil; end;
        if self.edit324 ~= nil then self.edit324:destroy(); self.edit324 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.edit362 ~= nil then self.edit362:destroy(); self.edit362 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.radioButton18 ~= nil then self.radioButton18:destroy(); self.radioButton18 = nil; end;
        if self.label269 ~= nil then self.label269:destroy(); self.label269 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit301 ~= nil then self.edit301:destroy(); self.edit301 = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.label271 ~= nil then self.label271:destroy(); self.label271 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit330 ~= nil then self.edit330:destroy(); self.edit330 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.label305 ~= nil then self.label305:destroy(); self.label305 = nil; end;
        if self.radioButton34 ~= nil then self.radioButton34:destroy(); self.radioButton34 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.frmMochilaB ~= nil then self.frmMochilaB:destroy(); self.frmMochilaB = nil; end;
        if self.image58 ~= nil then self.image58:destroy(); self.image58 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.label313 ~= nil then self.label313:destroy(); self.label313 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.radioButton19 ~= nil then self.radioButton19:destroy(); self.radioButton19 = nil; end;
        if self.rclItens5 ~= nil then self.rclItens5:destroy(); self.rclItens5 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label279 ~= nil then self.label279:destroy(); self.label279 = nil; end;
        if self.edit336 ~= nil then self.edit336:destroy(); self.edit336 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.radioButton14 ~= nil then self.radioButton14:destroy(); self.radioButton14 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.label295 ~= nil then self.label295:destroy(); self.label295 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.button88 ~= nil then self.button88:destroy(); self.button88 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit323 ~= nil then self.edit323:destroy(); self.edit323 = nil; end;
        if self.image59 ~= nil then self.image59:destroy(); self.image59 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.edit328 ~= nil then self.edit328:destroy(); self.edit328 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.radioButton21 ~= nil then self.radioButton21:destroy(); self.radioButton21 = nil; end;
        if self.label342 ~= nil then self.label342:destroy(); self.label342 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.radioButton17 ~= nil then self.radioButton17:destroy(); self.radioButton17 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.radioButton31 ~= nil then self.radioButton31:destroy(); self.radioButton31 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.radioButton53 ~= nil then self.radioButton53:destroy(); self.radioButton53 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.radioButton49 ~= nil then self.radioButton49:destroy(); self.radioButton49 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.edit299 ~= nil then self.edit299:destroy(); self.edit299 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.radioButton11 ~= nil then self.radioButton11:destroy(); self.radioButton11 = nil; end;
        if self.label309 ~= nil then self.label309:destroy(); self.label309 = nil; end;
        if self.label285 ~= nil then self.label285:destroy(); self.label285 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label292 ~= nil then self.label292:destroy(); self.label292 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.label310 ~= nil then self.label310:destroy(); self.label310 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label297 ~= nil then self.label297:destroy(); self.label297 = nil; end;
        if self.label312 ~= nil then self.label312:destroy(); self.label312 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label264 ~= nil then self.label264:destroy(); self.label264 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edit305 ~= nil then self.edit305:destroy(); self.edit305 = nil; end;
        if self.label326 ~= nil then self.label326:destroy(); self.label326 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.radioButton40 ~= nil then self.radioButton40:destroy(); self.radioButton40 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.edit320 ~= nil then self.edit320:destroy(); self.edit320 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.rclListaDosTalentosBase ~= nil then self.rclListaDosTalentosBase:destroy(); self.rclListaDosTalentosBase = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit335 ~= nil then self.edit335:destroy(); self.edit335 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.frmGeral ~= nil then self.frmGeral:destroy(); self.frmGeral = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.label343 ~= nil then self.label343:destroy(); self.label343 = nil; end;
        if self.dataLink87 ~= nil then self.dataLink87:destroy(); self.dataLink87 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.radioButton30 ~= nil then self.radioButton30:destroy(); self.radioButton30 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.radioButton25 ~= nil then self.radioButton25:destroy(); self.radioButton25 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.radioButton10 ~= nil then self.radioButton10:destroy(); self.radioButton10 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.label270 ~= nil then self.label270:destroy(); self.label270 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.dataLink103 ~= nil then self.dataLink103:destroy(); self.dataLink103 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label257 ~= nil then self.label257:destroy(); self.label257 = nil; end;
        if self.label352 ~= nil then self.label352:destroy(); self.label352 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.edit357 ~= nil then self.edit357:destroy(); self.edit357 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.dataLink104 ~= nil then self.dataLink104:destroy(); self.dataLink104 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.edit315 ~= nil then self.edit315:destroy(); self.edit315 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit327 ~= nil then self.edit327:destroy(); self.edit327 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.edit319 ~= nil then self.edit319:destroy(); self.edit319 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.radioButton43 ~= nil then self.radioButton43:destroy(); self.radioButton43 = nil; end;
        if self.radioButton36 ~= nil then self.radioButton36:destroy(); self.radioButton36 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.label349 ~= nil then self.label349:destroy(); self.label349 = nil; end;
        if self.radioButton32 ~= nil then self.radioButton32:destroy(); self.radioButton32 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit325 ~= nil then self.edit325:destroy(); self.edit325 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit322 ~= nil then self.edit322:destroy(); self.edit322 = nil; end;
        if self.button87 ~= nil then self.button87:destroy(); self.button87 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.frmCreditos ~= nil then self.frmCreditos:destroy(); self.frmCreditos = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.button83 ~= nil then self.button83:destroy(); self.button83 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.label337 ~= nil then self.label337:destroy(); self.label337 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.dataLink91 ~= nil then self.dataLink91:destroy(); self.dataLink91 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.label346 ~= nil then self.label346:destroy(); self.label346 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.label272 ~= nil then self.label272:destroy(); self.label272 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label316 ~= nil then self.label316:destroy(); self.label316 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.dataLink106 ~= nil then self.dataLink106:destroy(); self.dataLink106 = nil; end;
        if self.label274 ~= nil then self.label274:destroy(); self.label274 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.edit351 ~= nil then self.edit351:destroy(); self.edit351 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.radioButton57 ~= nil then self.radioButton57:destroy(); self.radioButton57 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.radioButton44 ~= nil then self.radioButton44:destroy(); self.radioButton44 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit356 ~= nil then self.edit356:destroy(); self.edit356 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit344 ~= nil then self.edit344:destroy(); self.edit344 = nil; end;
        if self.label311 ~= nil then self.label311:destroy(); self.label311 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.image48 ~= nil then self.image48:destroy(); self.image48 = nil; end;
        if self.label320 ~= nil then self.label320:destroy(); self.label320 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.image57 ~= nil then self.image57:destroy(); self.image57 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.edit317 ~= nil then self.edit317:destroy(); self.edit317 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.edit318 ~= nil then self.edit318:destroy(); self.edit318 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.radioButton27 ~= nil then self.radioButton27:destroy(); self.radioButton27 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.image40 ~= nil then self.image40:destroy(); self.image40 = nil; end;
        if self.radioButton33 ~= nil then self.radioButton33:destroy(); self.radioButton33 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit306 ~= nil then self.edit306:destroy(); self.edit306 = nil; end;
        if self.frmPokedex ~= nil then self.frmPokedex:destroy(); self.frmPokedex = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.comboBox33 ~= nil then self.comboBox33:destroy(); self.comboBox33 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit307 ~= nil then self.edit307:destroy(); self.edit307 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.radioButton20 ~= nil then self.radioButton20:destroy(); self.radioButton20 = nil; end;
        if self.radioButton28 ~= nil then self.radioButton28:destroy(); self.radioButton28 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.radioButton42 ~= nil then self.radioButton42:destroy(); self.radioButton42 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit337 ~= nil then self.edit337:destroy(); self.edit337 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.label294 ~= nil then self.label294:destroy(); self.label294 = nil; end;
        if self.rclConsumiveis ~= nil then self.rclConsumiveis:destroy(); self.rclConsumiveis = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.progressBar6 ~= nil then self.progressBar6:destroy(); self.progressBar6 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.frmBackground ~= nil then self.frmBackground:destroy(); self.frmBackground = nil; end;
        if self.button81 ~= nil then self.button81:destroy(); self.button81 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.dataLink90 ~= nil then self.dataLink90:destroy(); self.dataLink90 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink88 ~= nil then self.dataLink88:destroy(); self.dataLink88 = nil; end;
        if self.radioButton45 ~= nil then self.radioButton45:destroy(); self.radioButton45 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label296 ~= nil then self.label296:destroy(); self.label296 = nil; end;
        if self.label277 ~= nil then self.label277:destroy(); self.label277 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.image43 ~= nil then self.image43:destroy(); self.image43 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.tab14 ~= nil then self.tab14:destroy(); self.tab14 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmHITOPOKE2()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmHITOPOKE2();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmHITOPOKE2 = {
    newEditor = newfrmHITOPOKE2, 
    new = newfrmHITOPOKE2, 
    name = "frmHITOPOKE2", 
    dataType = "HITO_PLAYER_POKEMON", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Hitoshura - Pokemon PTA (Caio)", 
    description=""};

frmHITOPOKE2 = _frmHITOPOKE2;
Firecast.registrarForm(_frmHITOPOKE2);
Firecast.registrarDataType(_frmHITOPOKE2);

return _frmHITOPOKE2;
