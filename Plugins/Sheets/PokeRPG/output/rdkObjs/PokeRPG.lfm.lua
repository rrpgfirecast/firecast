require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmHITOPOKERPG()
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
    obj:setDataType("HITO_PLAYER_POKERPG");
    obj:setTitle("Hitoshura - PokéRPG");
    obj:setName("frmHITOPOKERPG");
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

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmGeral);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox2);
    obj.layout2:setLeft(10);
    obj.layout2:setTop(010);
    obj.layout2:setHeight(175);
    obj.layout2:setWidth(300);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(000);
    obj.label1:setTop(000);
    obj.label1:setHeight(20);
    obj.label1:setWidth(110);
    obj.label1:setText("Nome");
    obj.label1:setAutoSize(true);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(115);
    obj.edit1:setTop(000);
    obj.edit1:setHeight(20);
    obj.edit1:setWidth(170);
    obj.edit1:setField("basName");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(000);
    obj.label2:setTop(025);
    obj.label2:setHeight(20);
    obj.label2:setWidth(110);
    obj.label2:setText("Classe Básica");
    obj.label2:setAutoSize(true);
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setLeft(115);
    obj.edit2:setTop(025);
    obj.edit2:setHeight(20);
    obj.edit2:setWidth(170);
    obj.edit2:setField("basCla1");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(000);
    obj.label3:setTop(050);
    obj.label3:setHeight(20);
    obj.label3:setWidth(110);
    obj.label3:setText("Classe Avançada");
    obj.label3:setAutoSize(true);
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setLeft(115);
    obj.edit3:setTop(050);
    obj.edit3:setHeight(20);
    obj.edit3:setWidth(170);
    obj.edit3:setField("basClA2");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(000);
    obj.label4:setTop(075);
    obj.label4:setHeight(20);
    obj.label4:setWidth(110);
    obj.label4:setText("Idade");
    obj.label4:setAutoSize(true);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setLeft(115);
    obj.edit4:setTop(075);
    obj.edit4:setHeight(20);
    obj.edit4:setWidth(170);
    obj.edit4:setField("basIdad");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(000);
    obj.label5:setTop(100);
    obj.label5:setHeight(20);
    obj.label5:setWidth(110);
    obj.label5:setText("Altura");
    obj.label5:setAutoSize(true);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setLeft(115);
    obj.edit5:setTop(100);
    obj.edit5:setHeight(20);
    obj.edit5:setWidth(170);
    obj.edit5:setField("basAltu");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(000);
    obj.label6:setTop(125);
    obj.label6:setHeight(20);
    obj.label6:setWidth(110);
    obj.label6:setText("Aniversário");
    obj.label6:setAutoSize(true);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setLeft(115);
    obj.edit6:setTop(125);
    obj.edit6:setHeight(20);
    obj.edit6:setWidth(170);
    obj.edit6:setField("basAniv");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(000);
    obj.label7:setTop(150);
    obj.label7:setHeight(20);
    obj.label7:setWidth(110);
    obj.label7:setText("Professor");
    obj.label7:setAutoSize(true);
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setLeft(115);
    obj.edit7:setTop(150);
    obj.edit7:setHeight(20);
    obj.edit7:setWidth(170);
    obj.edit7:setField("basProf");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox2);
    obj.layout3:setLeft(305);
    obj.layout3:setTop(010);
    obj.layout3:setHeight(175);
    obj.layout3:setWidth(300);
    obj.layout3:setName("layout3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setLeft(000);
    obj.label8:setTop(000);
    obj.label8:setHeight(20);
    obj.label8:setWidth(110);
    obj.label8:setText("Tendência");
    obj.label8:setAutoSize(true);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout3);
    obj.edit8:setLeft(115);
    obj.edit8:setTop(000);
    obj.edit8:setHeight(20);
    obj.edit8:setWidth(170);
    obj.edit8:setField("basTend");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setLeft(000);
    obj.label9:setTop(025);
    obj.label9:setHeight(20);
    obj.label9:setWidth(110);
    obj.label9:setText("Classe Opcional");
    obj.label9:setAutoSize(true);
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout3);
    obj.edit9:setLeft(115);
    obj.edit9:setTop(025);
    obj.edit9:setHeight(20);
    obj.edit9:setWidth(170);
    obj.edit9:setField("basClA3");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout3);
    obj.label10:setLeft(000);
    obj.label10:setTop(050);
    obj.label10:setHeight(20);
    obj.label10:setWidth(110);
    obj.label10:setText("Classe Avançada");
    obj.label10:setAutoSize(true);
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout3);
    obj.edit10:setLeft(115);
    obj.edit10:setTop(050);
    obj.edit10:setHeight(20);
    obj.edit10:setWidth(170);
    obj.edit10:setField("basCla4");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout3);
    obj.label11:setLeft(000);
    obj.label11:setTop(075);
    obj.label11:setHeight(20);
    obj.label11:setWidth(110);
    obj.label11:setText("Gênero");
    obj.label11:setAutoSize(true);
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setName("label11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout3);
    obj.edit11:setLeft(115);
    obj.edit11:setTop(075);
    obj.edit11:setHeight(20);
    obj.edit11:setWidth(170);
    obj.edit11:setField("basGene");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout3);
    obj.label12:setLeft(000);
    obj.label12:setTop(100);
    obj.label12:setHeight(20);
    obj.label12:setWidth(110);
    obj.label12:setText("Peso");
    obj.label12:setAutoSize(true);
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setName("label12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout3);
    obj.edit12:setLeft(115);
    obj.edit12:setTop(100);
    obj.edit12:setHeight(20);
    obj.edit12:setWidth(170);
    obj.edit12:setField("basPeso");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout3);
    obj.label13:setLeft(000);
    obj.label13:setTop(125);
    obj.label13:setHeight(20);
    obj.label13:setWidth(110);
    obj.label13:setText("Dinheiro");
    obj.label13:setAutoSize(true);
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setName("label13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout3);
    obj.edit13:setLeft(115);
    obj.edit13:setTop(125);
    obj.edit13:setHeight(20);
    obj.edit13:setWidth(170);
    obj.edit13:setField("basDinh");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout3);
    obj.label14:setLeft(000);
    obj.label14:setTop(150);
    obj.label14:setHeight(20);
    obj.label14:setWidth(110);
    obj.label14:setText("Cidade Natal");
    obj.label14:setAutoSize(true);
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setName("label14");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout3);
    obj.edit14:setLeft(115);
    obj.edit14:setTop(150);
    obj.edit14:setHeight(20);
    obj.edit14:setWidth(170);
    obj.edit14:setField("basCiNa");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox2);
    obj.layout4:setLeft(10);
    obj.layout4:setTop(225);
    obj.layout4:setHeight(175);
    obj.layout4:setWidth(350);
    obj.layout4:setName("layout4");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout4);
    obj.label15:setLeft(000);
    obj.label15:setTop(000);
    obj.label15:setHeight(20);
    obj.label15:setWidth(110);
    obj.label15:setText("Atributo");
    obj.label15:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout4);
    obj.label16:setLeft(115);
    obj.label16:setTop(000);
    obj.label16:setHeight(20);
    obj.label16:setWidth(40);
    obj.label16:setText("Base");
    obj.label16:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout4);
    obj.label17:setLeft(160);
    obj.label17:setTop(000);
    obj.label17:setHeight(20);
    obj.label17:setWidth(40);
    obj.label17:setText("Nível");
    obj.label17:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout4);
    obj.label18:setLeft(205);
    obj.label18:setTop(000);
    obj.label18:setHeight(20);
    obj.label18:setWidth(40);
    obj.label18:setText("BP");
    obj.label18:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout4);
    obj.label19:setLeft(250);
    obj.label19:setTop(000);
    obj.label19:setHeight(20);
    obj.label19:setWidth(40);
    obj.label19:setText("BT");
    obj.label19:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout4);
    obj.label20:setLeft(295);
    obj.label20:setTop(000);
    obj.label20:setHeight(20);
    obj.label20:setWidth(40);
    obj.label20:setText("Total");
    obj.label20:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setName("label20");

    obj.BotaoFOR = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoFOR:setParent(obj.layout4);
    obj.BotaoFOR:setLeft(000);
    obj.BotaoFOR:setTop(025);
    obj.BotaoFOR:setWidth(110);
    obj.BotaoFOR:setHeight(20);
    obj.BotaoFOR:setText("Força");
    obj.BotaoFOR:setName("BotaoFOR");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout4);
    obj.edit15:setLeft(115);
    obj.edit15:setTop(025);
    obj.edit15:setHeight(20);
    obj.edit15:setWidth(40);
    obj.edit15:setField("attBAFOR");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout4);
    obj.dataLink1:setField("attBAFOR");
    obj.dataLink1:setDefaultValue("-3");
    obj.dataLink1:setName("dataLink1");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout4);
    obj.edit16:setLeft(160);
    obj.edit16:setTop(025);
    obj.edit16:setHeight(20);
    obj.edit16:setWidth(40);
    obj.edit16:setField("attNVFOR");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout4);
    obj.edit17:setLeft(205);
    obj.edit17:setTop(025);
    obj.edit17:setHeight(20);
    obj.edit17:setWidth(40);
    obj.edit17:setField("attBPFOR");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setHint("Bônus Permanente");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout4);
    obj.edit18:setLeft(250);
    obj.edit18:setTop(025);
    obj.edit18:setHeight(20);
    obj.edit18:setWidth(40);
    obj.edit18:setField("attBTFOR");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setHint("Bônus Temporário");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout4);
    obj.edit19:setLeft(295);
    obj.edit19:setTop(025);
    obj.edit19:setHeight(20);
    obj.edit19:setWidth(40);
    obj.edit19:setField("attTOFOR");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setEnabled(false);
    obj.edit19:setName("edit19");

    obj.BotaoDES = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoDES:setParent(obj.layout4);
    obj.BotaoDES:setLeft(000);
    obj.BotaoDES:setTop(050);
    obj.BotaoDES:setWidth(110);
    obj.BotaoDES:setHeight(20);
    obj.BotaoDES:setText("Destreza");
    obj.BotaoDES:setName("BotaoDES");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout4);
    obj.edit20:setLeft(115);
    obj.edit20:setTop(050);
    obj.edit20:setHeight(20);
    obj.edit20:setWidth(40);
    obj.edit20:setField("attBADES");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout4);
    obj.dataLink2:setField("attBADES");
    obj.dataLink2:setDefaultValue("-3");
    obj.dataLink2:setName("dataLink2");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout4);
    obj.edit21:setLeft(160);
    obj.edit21:setTop(050);
    obj.edit21:setHeight(20);
    obj.edit21:setWidth(40);
    obj.edit21:setField("attNVDES");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout4);
    obj.edit22:setLeft(205);
    obj.edit22:setTop(050);
    obj.edit22:setHeight(20);
    obj.edit22:setWidth(40);
    obj.edit22:setField("attBPDES");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setHint("Bônus Permanente");
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout4);
    obj.edit23:setLeft(250);
    obj.edit23:setTop(050);
    obj.edit23:setHeight(20);
    obj.edit23:setWidth(40);
    obj.edit23:setField("attBTDES");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setHint("Bônus Temporário");
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout4);
    obj.edit24:setLeft(295);
    obj.edit24:setTop(050);
    obj.edit24:setHeight(20);
    obj.edit24:setWidth(40);
    obj.edit24:setField("attTODES");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setEnabled(false);
    obj.edit24:setName("edit24");

    obj.BotaoCON = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoCON:setParent(obj.layout4);
    obj.BotaoCON:setLeft(000);
    obj.BotaoCON:setTop(075);
    obj.BotaoCON:setWidth(110);
    obj.BotaoCON:setHeight(20);
    obj.BotaoCON:setText("Constituição");
    obj.BotaoCON:setName("BotaoCON");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout4);
    obj.edit25:setLeft(115);
    obj.edit25:setTop(075);
    obj.edit25:setHeight(20);
    obj.edit25:setWidth(40);
    obj.edit25:setField("attBACON");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout4);
    obj.dataLink3:setField("attBACON");
    obj.dataLink3:setDefaultValue("-3");
    obj.dataLink3:setName("dataLink3");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout4);
    obj.edit26:setLeft(160);
    obj.edit26:setTop(075);
    obj.edit26:setHeight(20);
    obj.edit26:setWidth(40);
    obj.edit26:setField("attNVCON");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout4);
    obj.edit27:setLeft(205);
    obj.edit27:setTop(075);
    obj.edit27:setHeight(20);
    obj.edit27:setWidth(40);
    obj.edit27:setField("attBPCON");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setHint("Bônus Permanente");
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout4);
    obj.edit28:setLeft(250);
    obj.edit28:setTop(075);
    obj.edit28:setHeight(20);
    obj.edit28:setWidth(40);
    obj.edit28:setField("attBTCON");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setHint("Bônus Temporário");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout4);
    obj.edit29:setLeft(295);
    obj.edit29:setTop(075);
    obj.edit29:setHeight(20);
    obj.edit29:setWidth(40);
    obj.edit29:setField("attTOCON");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setEnabled(false);
    obj.edit29:setName("edit29");

    obj.BotaoINT = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoINT:setParent(obj.layout4);
    obj.BotaoINT:setLeft(000);
    obj.BotaoINT:setTop(100);
    obj.BotaoINT:setWidth(110);
    obj.BotaoINT:setHeight(20);
    obj.BotaoINT:setText("Inteligência");
    obj.BotaoINT:setName("BotaoINT");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout4);
    obj.edit30:setLeft(115);
    obj.edit30:setTop(100);
    obj.edit30:setHeight(20);
    obj.edit30:setWidth(40);
    obj.edit30:setField("attBAINT");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout4);
    obj.dataLink4:setField("attBAINT");
    obj.dataLink4:setDefaultValue("-3");
    obj.dataLink4:setName("dataLink4");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout4);
    obj.edit31:setLeft(160);
    obj.edit31:setTop(100);
    obj.edit31:setHeight(20);
    obj.edit31:setWidth(40);
    obj.edit31:setField("attNVINT");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout4);
    obj.edit32:setLeft(205);
    obj.edit32:setTop(100);
    obj.edit32:setHeight(20);
    obj.edit32:setWidth(40);
    obj.edit32:setField("attBPINT");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setHint("Bônus Permanente");
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout4);
    obj.edit33:setLeft(250);
    obj.edit33:setTop(100);
    obj.edit33:setHeight(20);
    obj.edit33:setWidth(40);
    obj.edit33:setField("attBTINT");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setHint("Bônus Temporário");
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout4);
    obj.edit34:setLeft(295);
    obj.edit34:setTop(100);
    obj.edit34:setHeight(20);
    obj.edit34:setWidth(40);
    obj.edit34:setField("attTOINT");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setEnabled(false);
    obj.edit34:setName("edit34");

    obj.BotaoSAB = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoSAB:setParent(obj.layout4);
    obj.BotaoSAB:setLeft(000);
    obj.BotaoSAB:setTop(125);
    obj.BotaoSAB:setWidth(110);
    obj.BotaoSAB:setHeight(20);
    obj.BotaoSAB:setText("Sabedoria");
    obj.BotaoSAB:setName("BotaoSAB");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout4);
    obj.edit35:setLeft(115);
    obj.edit35:setTop(125);
    obj.edit35:setHeight(20);
    obj.edit35:setWidth(40);
    obj.edit35:setField("attBASAB");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout4);
    obj.dataLink5:setField("attBASAB");
    obj.dataLink5:setDefaultValue("-3");
    obj.dataLink5:setName("dataLink5");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout4);
    obj.edit36:setLeft(160);
    obj.edit36:setTop(125);
    obj.edit36:setHeight(20);
    obj.edit36:setWidth(40);
    obj.edit36:setField("attNVSAB");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout4);
    obj.edit37:setLeft(205);
    obj.edit37:setTop(125);
    obj.edit37:setHeight(20);
    obj.edit37:setWidth(40);
    obj.edit37:setField("attBPSAB");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setHint("Bônus Permanente");
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout4);
    obj.edit38:setLeft(250);
    obj.edit38:setTop(125);
    obj.edit38:setHeight(20);
    obj.edit38:setWidth(40);
    obj.edit38:setField("attBTSAB");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setHint("Bônus Temporário");
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout4);
    obj.edit39:setLeft(295);
    obj.edit39:setTop(125);
    obj.edit39:setHeight(20);
    obj.edit39:setWidth(40);
    obj.edit39:setField("attTOSAB");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setEnabled(false);
    obj.edit39:setName("edit39");

    obj.BotaoCAR = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoCAR:setParent(obj.layout4);
    obj.BotaoCAR:setLeft(000);
    obj.BotaoCAR:setTop(150);
    obj.BotaoCAR:setWidth(110);
    obj.BotaoCAR:setHeight(20);
    obj.BotaoCAR:setText("Carisma");
    obj.BotaoCAR:setName("BotaoCAR");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout4);
    obj.edit40:setLeft(115);
    obj.edit40:setTop(150);
    obj.edit40:setHeight(20);
    obj.edit40:setWidth(40);
    obj.edit40:setField("attBACAR");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout4);
    obj.dataLink6:setField("attBACAR");
    obj.dataLink6:setDefaultValue("-3");
    obj.dataLink6:setName("dataLink6");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout4);
    obj.edit41:setLeft(160);
    obj.edit41:setTop(150);
    obj.edit41:setHeight(20);
    obj.edit41:setWidth(40);
    obj.edit41:setField("attNVCAR");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout4);
    obj.edit42:setLeft(205);
    obj.edit42:setTop(150);
    obj.edit42:setHeight(20);
    obj.edit42:setWidth(40);
    obj.edit42:setField("attBPCAR");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setHint("Bônus Permanente");
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout4);
    obj.edit43:setLeft(250);
    obj.edit43:setTop(150);
    obj.edit43:setHeight(20);
    obj.edit43:setWidth(40);
    obj.edit43:setField("attBTCAR");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setHint("Bônus Temporário");
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout4);
    obj.edit44:setLeft(295);
    obj.edit44:setTop(150);
    obj.edit44:setHeight(20);
    obj.edit44:setWidth(40);
    obj.edit44:setField("attTOCAR");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setEnabled(false);
    obj.edit44:setName("edit44");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox2);
    obj.layout5:setLeft(390);
    obj.layout5:setTop(225);
    obj.layout5:setHeight(200);
    obj.layout5:setWidth(300);
    obj.layout5:setName("layout5");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout5);
    obj.label21:setLeft(000);
    obj.label21:setTop(000);
    obj.label21:setHeight(20);
    obj.label21:setWidth(100);
    obj.label21:setText("Nível");
    obj.label21:setAutoSize(true);
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setName("label21");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout5);
    obj.edit45:setLeft(105);
    obj.edit45:setTop(000);
    obj.edit45:setHeight(20);
    obj.edit45:setWidth(75);
    obj.edit45:setField("basLV");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout5);
    obj.label22:setLeft(000);
    obj.label22:setTop(025);
    obj.label22:setHeight(20);
    obj.label22:setWidth(100);
    obj.label22:setText("TrainerXP");
    obj.label22:setAutoSize(true);
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");
    obj.label22:setName("label22");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout5);
    obj.edit46:setLeft(105);
    obj.edit46:setTop(025);
    obj.edit46:setHeight(20);
    obj.edit46:setWidth(35);
    obj.edit46:setField("atuTXP");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout5);
    obj.edit47:setLeft(145);
    obj.edit47:setTop(025);
    obj.edit47:setHeight(20);
    obj.edit47:setWidth(35);
    obj.edit47:setField("maxTXP");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setHint("Máximo");
    obj.edit47:setEnabled(true);
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout5);
    obj.dataLink7:setField("atuTXP");
    obj.dataLink7:setDefaultValue("0");
    obj.dataLink7:setName("dataLink7");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout5);
    obj.label23:setLeft(000);
    obj.label23:setTop(050);
    obj.label23:setHeight(20);
    obj.label23:setWidth(100);
    obj.label23:setText("PokéXP");
    obj.label23:setAutoSize(true);
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setName("label23");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout5);
    obj.edit48:setLeft(105);
    obj.edit48:setTop(050);
    obj.edit48:setHeight(20);
    obj.edit48:setWidth(35);
    obj.edit48:setField("atuPXP");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout5);
    obj.edit49:setLeft(145);
    obj.edit49:setTop(050);
    obj.edit49:setHeight(20);
    obj.edit49:setWidth(35);
    obj.edit49:setField("maxPXP");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setHint("Máximo");
    obj.edit49:setEnabled(true);
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout5);
    obj.dataLink8:setField("atuPXP");
    obj.dataLink8:setDefaultValue("0");
    obj.dataLink8:setName("dataLink8");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout5);
    obj.label24:setLeft(000);
    obj.label24:setTop(075);
    obj.label24:setHeight(20);
    obj.label24:setWidth(100);
    obj.label24:setText("Renda Semanal");
    obj.label24:setAutoSize(true);
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setName("label24");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout5);
    obj.edit50:setLeft(105);
    obj.edit50:setTop(075);
    obj.edit50:setHeight(20);
    obj.edit50:setWidth(75);
    obj.edit50:setField("basREND");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setType("number");
    obj.edit50:setEnabled(false);
    obj.edit50:setName("edit50");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout5);
    obj.label25:setLeft(000);
    obj.label25:setTop(100);
    obj.label25:setHeight(20);
    obj.label25:setWidth(100);
    obj.label25:setText("PokéDollars");
    obj.label25:setAutoSize(true);
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setName("label25");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout5);
    obj.edit51:setLeft(105);
    obj.edit51:setTop(100);
    obj.edit51:setHeight(20);
    obj.edit51:setWidth(75);
    obj.edit51:setField("basMONY");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout5);
    obj.dataLink9:setField("basMONY");
    obj.dataLink9:setDefaultValue("3200");
    obj.dataLink9:setName("dataLink9");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout5);
    obj.label26:setLeft(000);
    obj.label26:setTop(125);
    obj.label26:setHeight(20);
    obj.label26:setWidth(100);
    obj.label26:setText("Ações Diárias");
    obj.label26:setAutoSize(true);
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");
    obj.label26:setName("label26");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout5);
    obj.edit52:setLeft(105);
    obj.edit52:setTop(125);
    obj.edit52:setHeight(20);
    obj.edit52:setWidth(35);
    obj.edit52:setField("atuADIR");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout5);
    obj.edit53:setLeft(145);
    obj.edit53:setTop(125);
    obj.edit53:setHeight(20);
    obj.edit53:setWidth(35);
    obj.edit53:setField("maxADIR");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setHint("Máximo");
    obj.edit53:setEnabled(true);
    obj.edit53:setType("number");
    obj.edit53:setName("edit53");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout5);
    obj.dataLink10:setField("atuADIR");
    obj.dataLink10:setDefaultValue("5");
    obj.dataLink10:setName("dataLink10");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout5);
    obj.label27:setLeft(000);
    obj.label27:setTop(150);
    obj.label27:setHeight(20);
    obj.label27:setWidth(100);
    obj.label27:setText("Pontos de Sorte");
    obj.label27:setAutoSize(true);
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setName("label27");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout5);
    obj.edit54:setLeft(105);
    obj.edit54:setTop(150);
    obj.edit54:setHeight(20);
    obj.edit54:setWidth(35);
    obj.edit54:setField("atuPSOR");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout5);
    obj.edit55:setLeft(145);
    obj.edit55:setTop(150);
    obj.edit55:setHeight(20);
    obj.edit55:setWidth(35);
    obj.edit55:setField("maxPSOR");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setHint("Máximo");
    obj.edit55:setEnabled(true);
    obj.edit55:setType("number");
    obj.edit55:setName("edit55");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout5);
    obj.dataLink11:setField("atuPSOR");
    obj.dataLink11:setDefaultValue("2");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout5);
    obj.dataLink12:setField("maxPSOR");
    obj.dataLink12:setDefaultValue("3");
    obj.dataLink12:setName("dataLink12");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout5);
    obj.label28:setLeft(000);
    obj.label28:setTop(175);
    obj.label28:setHeight(20);
    obj.label28:setWidth(100);
    obj.label28:setText("Pontos de Vida");
    obj.label28:setAutoSize(true);
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setName("label28");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout5);
    obj.edit56:setLeft(105);
    obj.edit56:setTop(175);
    obj.edit56:setHeight(20);
    obj.edit56:setWidth(35);
    obj.edit56:setField("atuPVID");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setType("number");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout5);
    obj.edit57:setLeft(145);
    obj.edit57:setTop(175);
    obj.edit57:setHeight(20);
    obj.edit57:setWidth(35);
    obj.edit57:setField("maxPVID");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setHint("Máximo");
    obj.edit57:setEnabled(true);
    obj.edit57:setType("number");
    obj.edit57:setName("edit57");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout5);
    obj.dataLink13:setField("atuPVID");
    obj.dataLink13:setDefaultValue("22");
    obj.dataLink13:setName("dataLink13");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox2);
    obj.layout6:setLeft(390);
    obj.layout6:setTop(200);
    obj.layout6:setHeight(200);
    obj.layout6:setWidth(300);
    obj.layout6:setName("layout6");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout6);
    obj.label29:setLeft(000);
    obj.label29:setTop(000);
    obj.label29:setHeight(20);
    obj.label29:setWidth(100);
    obj.label29:setText("TXP Investido");
    obj.label29:setAutoSize(true);
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setName("label29");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout6);
    obj.edit58:setLeft(105);
    obj.edit58:setTop(000);
    obj.edit58:setHeight(20);
    obj.edit58:setWidth(35);
    obj.edit58:setField("TXPinv");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setType("number");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout6);
    obj.edit59:setLeft(145);
    obj.edit59:setTop(000);
    obj.edit59:setHeight(20);
    obj.edit59:setWidth(35);
    obj.edit59:setField("nextTLV");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setHint("Próximo Nível");
    obj.edit59:setEnabled(false);
    obj.edit59:setType("number");
    obj.edit59:setName("edit59");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout6);
    obj.dataLink14:setField("TXPinv");
    obj.dataLink14:setDefaultValue("0");
    obj.dataLink14:setName("dataLink14");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox2);
    obj.layout7:setLeft(60);
    obj.layout7:setTop(460);
    obj.layout7:setHeight(75);
    obj.layout7:setWidth(300);
    obj.layout7:setName("layout7");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout7);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(285);
    obj.rectangle1:setHeight(75);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("darkred");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout7);
    obj.image2:setLeft(005);
    obj.image2:setTop(10);
    obj.image2:setHeight(50);
    obj.image2:setWidth(50);
    obj.image2:setField("ImagemSlot1");
    obj.image2:setStyle("stretch");
    lfm_setPropAsString(obj.image2, "animate",  "true");
    obj.image2:setName("image2");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout7);
    obj.edit60:setLeft(060);
    obj.edit60:setTop(5);
    obj.edit60:setHeight(20);
    obj.edit60:setWidth(120);
    obj.edit60:setField("NomeSlot1");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setEnabled(false);
    obj.edit60:setName("edit60");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout7);
    obj.label30:setLeft(060);
    obj.label30:setTop(30);
    obj.label30:setHeight(20);
    obj.label30:setWidth(20);
    obj.label30:setText("HP");
    obj.label30:setAutoSize(true);
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setName("label30");

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

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout7);
    obj.image3:setLeft(235);
    obj.image3:setTop(25);
    obj.image3:setHeight(30);
    obj.image3:setWidth(30);
    obj.image3:setField("GenderSlot1");
    obj.image3:setStyle("stretch");
    obj.image3:setName("image3");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout7);
    obj.label31:setLeft(190);
    obj.label31:setTop(5);
    obj.label31:setHeight(20);
    obj.label31:setWidth(20);
    obj.label31:setText("Lv.");
    obj.label31:setAutoSize(true);
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setName("label31");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout7);
    obj.edit61:setLeft(210);
    obj.edit61:setTop(5);
    obj.edit61:setHeight(20);
    obj.edit61:setWidth(30);
    obj.edit61:setField("LevelSlot1");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setEnabled(false);
    obj.edit61:setName("edit61");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout7);
    obj.button1:setLeft(262);
    obj.button1:setTop(51);
    obj.button1:setHeight(20);
    obj.button1:setWidth(20);
    obj.button1:setText("A");
    obj.button1:setHint("Apagar");
    obj.button1:setName("button1");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout7);
    obj.edit62:setLeft(95);
    obj.edit62:setTop(50);
    obj.edit62:setHeight(20);
    obj.edit62:setWidth(30);
    obj.edit62:setField("baseHPAtual1");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setEnabled(false);
    obj.edit62:setName("edit62");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout7);
    obj.label32:setLeft(125);
    obj.label32:setTop(50);
    obj.label32:setHeight(20);
    obj.label32:setWidth(5);
    obj.label32:setText("/");
    obj.label32:setAutoSize(true);
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setName("label32");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout7);
    obj.edit63:setLeft(130);
    obj.edit63:setTop(50);
    obj.edit63:setHeight(20);
    obj.edit63:setWidth(30);
    obj.edit63:setField("baseHPMAX1");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setEnabled(false);
    obj.edit63:setName("edit63");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout7);
    obj.dataLink15:setField("baseHPAtual1");
    obj.dataLink15:setDefaultValue("0");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout7);
    obj.dataLink16:setField("baseHPMAX1");
    obj.dataLink16:setDefaultValue("0");
    obj.dataLink16:setName("dataLink16");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox2);
    obj.layout8:setLeft(60);
    obj.layout8:setTop(545);
    obj.layout8:setHeight(75);
    obj.layout8:setWidth(300);
    obj.layout8:setName("layout8");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(285);
    obj.rectangle2:setHeight(75);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("darkred");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout8);
    obj.image4:setLeft(005);
    obj.image4:setTop(10);
    obj.image4:setHeight(50);
    obj.image4:setWidth(50);
    obj.image4:setField("ImagemSlot2");
    obj.image4:setStyle("stretch");
    lfm_setPropAsString(obj.image4, "animate",  "true");
    obj.image4:setName("image4");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout8);
    obj.edit64:setLeft(060);
    obj.edit64:setTop(5);
    obj.edit64:setHeight(20);
    obj.edit64:setWidth(120);
    obj.edit64:setField("NomeSlot2");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setEnabled(false);
    obj.edit64:setName("edit64");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout8);
    obj.label33:setLeft(060);
    obj.label33:setTop(30);
    obj.label33:setHeight(20);
    obj.label33:setWidth(20);
    obj.label33:setText("HP");
    obj.label33:setAutoSize(true);
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setName("label33");

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

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout8);
    obj.image5:setLeft(235);
    obj.image5:setTop(25);
    obj.image5:setHeight(30);
    obj.image5:setWidth(30);
    obj.image5:setField("GenderSlot2");
    obj.image5:setStyle("stretch");
    obj.image5:setName("image5");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout8);
    obj.label34:setLeft(190);
    obj.label34:setTop(5);
    obj.label34:setHeight(20);
    obj.label34:setWidth(20);
    obj.label34:setText("Lv.");
    obj.label34:setAutoSize(true);
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setName("label34");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout8);
    obj.edit65:setLeft(210);
    obj.edit65:setTop(5);
    obj.edit65:setHeight(20);
    obj.edit65:setWidth(30);
    obj.edit65:setField("LevelSlot2");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setEnabled(false);
    obj.edit65:setName("edit65");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout8);
    obj.button2:setLeft(262);
    obj.button2:setTop(51);
    obj.button2:setHeight(20);
    obj.button2:setWidth(20);
    obj.button2:setText("A");
    obj.button2:setHint("Apagar");
    obj.button2:setName("button2");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout8);
    obj.edit66:setLeft(95);
    obj.edit66:setTop(50);
    obj.edit66:setHeight(20);
    obj.edit66:setWidth(30);
    obj.edit66:setField("baseHPAtual2");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setEnabled(false);
    obj.edit66:setName("edit66");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout8);
    obj.label35:setLeft(125);
    obj.label35:setTop(50);
    obj.label35:setHeight(20);
    obj.label35:setWidth(5);
    obj.label35:setText("/");
    obj.label35:setAutoSize(true);
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");
    obj.label35:setName("label35");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout8);
    obj.edit67:setLeft(130);
    obj.edit67:setTop(50);
    obj.edit67:setHeight(20);
    obj.edit67:setWidth(30);
    obj.edit67:setField("baseHPMAX2");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setEnabled(false);
    obj.edit67:setName("edit67");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout8);
    obj.dataLink17:setField("baseHPAtual2");
    obj.dataLink17:setDefaultValue("0");
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout8);
    obj.dataLink18:setField("baseHPMAX2");
    obj.dataLink18:setDefaultValue("0");
    obj.dataLink18:setName("dataLink18");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox2);
    obj.layout9:setLeft(350);
    obj.layout9:setTop(460);
    obj.layout9:setHeight(75);
    obj.layout9:setWidth(300);
    obj.layout9:setName("layout9");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout9);
    obj.rectangle3:setLeft(0);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(285);
    obj.rectangle3:setHeight(75);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("darkred");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout9);
    obj.image6:setLeft(005);
    obj.image6:setTop(10);
    obj.image6:setHeight(50);
    obj.image6:setWidth(50);
    obj.image6:setField("ImagemSlot3");
    obj.image6:setStyle("stretch");
    lfm_setPropAsString(obj.image6, "animate",  "true");
    obj.image6:setName("image6");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout9);
    obj.edit68:setLeft(060);
    obj.edit68:setTop(5);
    obj.edit68:setHeight(20);
    obj.edit68:setWidth(120);
    obj.edit68:setField("NomeSlot3");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setEnabled(false);
    obj.edit68:setName("edit68");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout9);
    obj.label36:setLeft(060);
    obj.label36:setTop(30);
    obj.label36:setHeight(20);
    obj.label36:setWidth(20);
    obj.label36:setText("HP");
    obj.label36:setAutoSize(true);
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");
    obj.label36:setName("label36");

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

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout9);
    obj.image7:setLeft(235);
    obj.image7:setTop(25);
    obj.image7:setHeight(30);
    obj.image7:setWidth(30);
    obj.image7:setField("GenderSlot3");
    obj.image7:setStyle("stretch");
    obj.image7:setName("image7");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout9);
    obj.label37:setLeft(190);
    obj.label37:setTop(5);
    obj.label37:setHeight(20);
    obj.label37:setWidth(20);
    obj.label37:setText("Lv.");
    obj.label37:setAutoSize(true);
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setName("label37");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout9);
    obj.edit69:setLeft(210);
    obj.edit69:setTop(5);
    obj.edit69:setHeight(20);
    obj.edit69:setWidth(30);
    obj.edit69:setField("LevelSlot3");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setEnabled(false);
    obj.edit69:setName("edit69");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout9);
    obj.button3:setLeft(262);
    obj.button3:setTop(51);
    obj.button3:setHeight(20);
    obj.button3:setWidth(20);
    obj.button3:setText("A");
    obj.button3:setHint("Apagar");
    obj.button3:setName("button3");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout9);
    obj.edit70:setLeft(95);
    obj.edit70:setTop(50);
    obj.edit70:setHeight(20);
    obj.edit70:setWidth(30);
    obj.edit70:setField("baseHPAtual3");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setEnabled(false);
    obj.edit70:setName("edit70");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout9);
    obj.label38:setLeft(125);
    obj.label38:setTop(50);
    obj.label38:setHeight(20);
    obj.label38:setWidth(5);
    obj.label38:setText("/");
    obj.label38:setAutoSize(true);
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setName("label38");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout9);
    obj.edit71:setLeft(130);
    obj.edit71:setTop(50);
    obj.edit71:setHeight(20);
    obj.edit71:setWidth(30);
    obj.edit71:setField("baseHPMAX3");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setEnabled(false);
    obj.edit71:setName("edit71");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout9);
    obj.dataLink19:setField("baseHPAtual3");
    obj.dataLink19:setDefaultValue("0");
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout9);
    obj.dataLink20:setField("baseHPMAX3");
    obj.dataLink20:setDefaultValue("0");
    obj.dataLink20:setName("dataLink20");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox2);
    obj.layout10:setLeft(350);
    obj.layout10:setTop(545);
    obj.layout10:setHeight(75);
    obj.layout10:setWidth(300);
    obj.layout10:setName("layout10");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout10);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(285);
    obj.rectangle4:setHeight(75);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("darkred");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout10);
    obj.image8:setLeft(005);
    obj.image8:setTop(10);
    obj.image8:setHeight(50);
    obj.image8:setWidth(50);
    obj.image8:setField("ImagemSlot4");
    obj.image8:setStyle("stretch");
    lfm_setPropAsString(obj.image8, "animate",  "true");
    obj.image8:setName("image8");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout10);
    obj.edit72:setLeft(060);
    obj.edit72:setTop(5);
    obj.edit72:setHeight(20);
    obj.edit72:setWidth(120);
    obj.edit72:setField("NomeSlot4");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setEnabled(false);
    obj.edit72:setName("edit72");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout10);
    obj.label39:setLeft(060);
    obj.label39:setTop(30);
    obj.label39:setHeight(20);
    obj.label39:setWidth(20);
    obj.label39:setText("HP");
    obj.label39:setAutoSize(true);
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setName("label39");

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

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout10);
    obj.image9:setLeft(235);
    obj.image9:setTop(25);
    obj.image9:setHeight(30);
    obj.image9:setWidth(30);
    obj.image9:setField("GenderSlot4");
    obj.image9:setStyle("stretch");
    obj.image9:setName("image9");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout10);
    obj.label40:setLeft(190);
    obj.label40:setTop(5);
    obj.label40:setHeight(20);
    obj.label40:setWidth(20);
    obj.label40:setText("Lv.");
    obj.label40:setAutoSize(true);
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setName("label40");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout10);
    obj.edit73:setLeft(210);
    obj.edit73:setTop(5);
    obj.edit73:setHeight(20);
    obj.edit73:setWidth(30);
    obj.edit73:setField("LevelSlot4");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setEnabled(false);
    obj.edit73:setName("edit73");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout10);
    obj.button4:setLeft(262);
    obj.button4:setTop(51);
    obj.button4:setHeight(20);
    obj.button4:setWidth(20);
    obj.button4:setText("A");
    obj.button4:setHint("Apagar");
    obj.button4:setName("button4");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout10);
    obj.edit74:setLeft(95);
    obj.edit74:setTop(50);
    obj.edit74:setHeight(20);
    obj.edit74:setWidth(30);
    obj.edit74:setField("baseHPAtual4");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setEnabled(false);
    obj.edit74:setName("edit74");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout10);
    obj.label41:setLeft(125);
    obj.label41:setTop(50);
    obj.label41:setHeight(20);
    obj.label41:setWidth(5);
    obj.label41:setText("/");
    obj.label41:setAutoSize(true);
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setName("label41");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout10);
    obj.edit75:setLeft(130);
    obj.edit75:setTop(50);
    obj.edit75:setHeight(20);
    obj.edit75:setWidth(30);
    obj.edit75:setField("baseHPMAX4");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setEnabled(false);
    obj.edit75:setName("edit75");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout10);
    obj.dataLink21:setField("baseHPAtual4");
    obj.dataLink21:setDefaultValue("0");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout10);
    obj.dataLink22:setField("baseHPMAX4");
    obj.dataLink22:setDefaultValue("0");
    obj.dataLink22:setName("dataLink22");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox2);
    obj.layout11:setLeft(640);
    obj.layout11:setTop(460);
    obj.layout11:setHeight(75);
    obj.layout11:setWidth(300);
    obj.layout11:setName("layout11");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout11);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(285);
    obj.rectangle5:setHeight(75);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("darkred");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setName("rectangle5");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout11);
    obj.image10:setLeft(005);
    obj.image10:setTop(10);
    obj.image10:setHeight(50);
    obj.image10:setWidth(50);
    obj.image10:setField("ImagemSlot5");
    obj.image10:setStyle("stretch");
    lfm_setPropAsString(obj.image10, "animate",  "true");
    obj.image10:setName("image10");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout11);
    obj.edit76:setLeft(060);
    obj.edit76:setTop(5);
    obj.edit76:setHeight(20);
    obj.edit76:setWidth(120);
    obj.edit76:setField("NomeSlot5");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setEnabled(false);
    obj.edit76:setName("edit76");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout11);
    obj.label42:setLeft(060);
    obj.label42:setTop(30);
    obj.label42:setHeight(20);
    obj.label42:setWidth(20);
    obj.label42:setText("HP");
    obj.label42:setAutoSize(true);
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");
    obj.label42:setName("label42");

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

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.layout11);
    obj.image11:setLeft(235);
    obj.image11:setTop(25);
    obj.image11:setHeight(30);
    obj.image11:setWidth(30);
    obj.image11:setField("GenderSlot5");
    obj.image11:setStyle("stretch");
    obj.image11:setName("image11");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout11);
    obj.label43:setLeft(190);
    obj.label43:setTop(5);
    obj.label43:setHeight(20);
    obj.label43:setWidth(20);
    obj.label43:setText("Lv.");
    obj.label43:setAutoSize(true);
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setName("label43");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout11);
    obj.edit77:setLeft(210);
    obj.edit77:setTop(5);
    obj.edit77:setHeight(20);
    obj.edit77:setWidth(30);
    obj.edit77:setField("LevelSlot5");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setEnabled(false);
    obj.edit77:setName("edit77");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout11);
    obj.button5:setLeft(262);
    obj.button5:setTop(51);
    obj.button5:setHeight(20);
    obj.button5:setWidth(20);
    obj.button5:setText("A");
    obj.button5:setHint("Apagar");
    obj.button5:setName("button5");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout11);
    obj.edit78:setLeft(95);
    obj.edit78:setTop(50);
    obj.edit78:setHeight(20);
    obj.edit78:setWidth(30);
    obj.edit78:setField("baseHPAtual5");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setEnabled(false);
    obj.edit78:setName("edit78");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout11);
    obj.label44:setLeft(125);
    obj.label44:setTop(50);
    obj.label44:setHeight(20);
    obj.label44:setWidth(5);
    obj.label44:setText("/");
    obj.label44:setAutoSize(true);
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setName("label44");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout11);
    obj.edit79:setLeft(130);
    obj.edit79:setTop(50);
    obj.edit79:setHeight(20);
    obj.edit79:setWidth(30);
    obj.edit79:setField("baseHPMAX5");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setEnabled(false);
    obj.edit79:setName("edit79");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout11);
    obj.dataLink23:setField("baseHPAtual5");
    obj.dataLink23:setDefaultValue("0");
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout11);
    obj.dataLink24:setField("baseHPMAX5");
    obj.dataLink24:setDefaultValue("0");
    obj.dataLink24:setName("dataLink24");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox2);
    obj.layout12:setLeft(640);
    obj.layout12:setTop(545);
    obj.layout12:setHeight(75);
    obj.layout12:setWidth(300);
    obj.layout12:setName("layout12");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout12);
    obj.rectangle6:setLeft(0);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(285);
    obj.rectangle6:setHeight(75);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("darkred");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.layout12);
    obj.image12:setLeft(005);
    obj.image12:setTop(10);
    obj.image12:setHeight(50);
    obj.image12:setWidth(50);
    obj.image12:setField("ImagemSlot6");
    obj.image12:setStyle("stretch");
    lfm_setPropAsString(obj.image12, "animate",  "true");
    obj.image12:setName("image12");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout12);
    obj.edit80:setLeft(060);
    obj.edit80:setTop(5);
    obj.edit80:setHeight(20);
    obj.edit80:setWidth(120);
    obj.edit80:setField("NomeSlot6");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setEnabled(false);
    obj.edit80:setName("edit80");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout12);
    obj.label45:setLeft(060);
    obj.label45:setTop(30);
    obj.label45:setHeight(20);
    obj.label45:setWidth(20);
    obj.label45:setText("HP");
    obj.label45:setAutoSize(true);
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setName("label45");

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

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.layout12);
    obj.image13:setLeft(235);
    obj.image13:setTop(25);
    obj.image13:setHeight(30);
    obj.image13:setWidth(30);
    obj.image13:setField("GenderSlot6");
    obj.image13:setStyle("stretch");
    obj.image13:setName("image13");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout12);
    obj.label46:setLeft(190);
    obj.label46:setTop(5);
    obj.label46:setHeight(20);
    obj.label46:setWidth(20);
    obj.label46:setText("Lv.");
    obj.label46:setAutoSize(true);
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");
    obj.label46:setName("label46");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout12);
    obj.edit81:setLeft(210);
    obj.edit81:setTop(5);
    obj.edit81:setHeight(20);
    obj.edit81:setWidth(30);
    obj.edit81:setField("LevelSlot6");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setEnabled(false);
    obj.edit81:setName("edit81");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout12);
    obj.button6:setLeft(262);
    obj.button6:setTop(51);
    obj.button6:setHeight(20);
    obj.button6:setWidth(20);
    obj.button6:setText("A");
    obj.button6:setHint("Apagar");
    obj.button6:setName("button6");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout12);
    obj.edit82:setLeft(95);
    obj.edit82:setTop(50);
    obj.edit82:setHeight(20);
    obj.edit82:setWidth(30);
    obj.edit82:setField("baseHPAtual6");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setEnabled(false);
    obj.edit82:setName("edit82");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout12);
    obj.label47:setLeft(125);
    obj.label47:setTop(50);
    obj.label47:setHeight(20);
    obj.label47:setWidth(5);
    obj.label47:setText("/");
    obj.label47:setAutoSize(true);
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setName("label47");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout12);
    obj.edit83:setLeft(130);
    obj.edit83:setTop(50);
    obj.edit83:setHeight(20);
    obj.edit83:setWidth(30);
    obj.edit83:setField("baseHPMAX6");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setEnabled(false);
    obj.edit83:setName("edit83");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout12);
    obj.dataLink25:setField("baseHPAtual6");
    obj.dataLink25:setDefaultValue("0");
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout12);
    obj.dataLink26:setField("baseHPMAX6");
    obj.dataLink26:setDefaultValue("0");
    obj.dataLink26:setName("dataLink26");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox2);
    obj.layout13:setLeft(610);
    obj.layout13:setTop(10);
    obj.layout13:setHeight(360);
    obj.layout13:setWidth(360);
    obj.layout13:setName("layout13");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout13);
    obj.rectangle7:setLeft(000);
    obj.rectangle7:setTop(00);
    obj.rectangle7:setWidth(360);
    obj.rectangle7:setHeight(360);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("darkred");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.layout13);
    obj.image14:setLeft(005);
    obj.image14:setTop(005);
    obj.image14:setWidth(360);
    obj.image14:setHeight(360);
    obj.image14:setField("basPERS");
    obj.image14:setEditable(true);
    obj.image14:setStyle("proportional");
    lfm_setPropAsString(obj.image14, "animate",  "true");
    obj.image14:setHint("Imagem do Personagem");
    obj.image14:setName("image14");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox2);
    obj.layout14:setLeft(980);
    obj.layout14:setTop(13);
    obj.layout14:setHeight(360);
    obj.layout14:setWidth(40);
    obj.layout14:setName("layout14");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout14);
    obj.rectangle8:setLeft(000);
    obj.rectangle8:setTop(00);
    obj.rectangle8:setWidth(40);
    obj.rectangle8:setHeight(40);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("darkred");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.layout14);
    obj.image15:setLeft(005);
    obj.image15:setTop(00);
    obj.image15:setWidth(40);
    obj.image15:setHeight(40);
    obj.image15:setField("basBADGE11");
    obj.image15:setEditable(true);
    obj.image15:setStyle("proportional");
    obj.image15:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image15:setName("image15");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout14);
    obj.rectangle9:setLeft(000);
    obj.rectangle9:setTop(45);
    obj.rectangle9:setWidth(40);
    obj.rectangle9:setHeight(40);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("darkred");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.layout14);
    obj.image16:setLeft(005);
    obj.image16:setTop(45);
    obj.image16:setWidth(40);
    obj.image16:setHeight(40);
    obj.image16:setField("basBADGE12");
    obj.image16:setEditable(true);
    obj.image16:setStyle("proportional");
    obj.image16:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image16:setName("image16");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout14);
    obj.rectangle10:setLeft(000);
    obj.rectangle10:setTop(90);
    obj.rectangle10:setWidth(40);
    obj.rectangle10:setHeight(40);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("darkred");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.layout14);
    obj.image17:setLeft(005);
    obj.image17:setTop(90);
    obj.image17:setWidth(40);
    obj.image17:setHeight(40);
    obj.image17:setField("basBADGE13");
    obj.image17:setEditable(true);
    obj.image17:setStyle("proportional");
    obj.image17:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image17:setName("image17");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout14);
    obj.rectangle11:setLeft(000);
    obj.rectangle11:setTop(135);
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(40);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("darkred");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.layout14);
    obj.image18:setLeft(005);
    obj.image18:setTop(135);
    obj.image18:setWidth(40);
    obj.image18:setHeight(40);
    obj.image18:setField("basBADGE14");
    obj.image18:setEditable(true);
    obj.image18:setStyle("proportional");
    obj.image18:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image18:setName("image18");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout14);
    obj.rectangle12:setLeft(000);
    obj.rectangle12:setTop(180);
    obj.rectangle12:setWidth(40);
    obj.rectangle12:setHeight(40);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("darkred");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.layout14);
    obj.image19:setLeft(005);
    obj.image19:setTop(180);
    obj.image19:setWidth(40);
    obj.image19:setHeight(40);
    obj.image19:setField("basBADGE15");
    obj.image19:setEditable(true);
    obj.image19:setStyle("proportional");
    obj.image19:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image19:setName("image19");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout14);
    obj.rectangle13:setLeft(000);
    obj.rectangle13:setTop(225);
    obj.rectangle13:setWidth(40);
    obj.rectangle13:setHeight(40);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("darkred");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.layout14);
    obj.image20:setLeft(005);
    obj.image20:setTop(225);
    obj.image20:setWidth(40);
    obj.image20:setHeight(40);
    obj.image20:setField("basBADGE16");
    obj.image20:setEditable(true);
    obj.image20:setStyle("proportional");
    obj.image20:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image20:setName("image20");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout14);
    obj.rectangle14:setLeft(000);
    obj.rectangle14:setTop(270);
    obj.rectangle14:setWidth(40);
    obj.rectangle14:setHeight(40);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("darkred");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.layout14);
    obj.image21:setLeft(005);
    obj.image21:setTop(270);
    obj.image21:setWidth(40);
    obj.image21:setHeight(40);
    obj.image21:setField("basBADGE17");
    obj.image21:setEditable(true);
    obj.image21:setStyle("proportional");
    obj.image21:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image21:setName("image21");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout14);
    obj.rectangle15:setLeft(000);
    obj.rectangle15:setTop(315);
    obj.rectangle15:setWidth(40);
    obj.rectangle15:setHeight(40);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("darkred");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.layout14);
    obj.image22:setLeft(005);
    obj.image22:setTop(315);
    obj.image22:setWidth(40);
    obj.image22:setHeight(40);
    obj.image22:setField("basBADGE18");
    obj.image22:setEditable(true);
    obj.image22:setStyle("proportional");
    obj.image22:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image22:setName("image22");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox2);
    obj.layout15:setLeft(1030);
    obj.layout15:setTop(13);
    obj.layout15:setHeight(360);
    obj.layout15:setWidth(40);
    obj.layout15:setName("layout15");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout15);
    obj.rectangle16:setLeft(000);
    obj.rectangle16:setTop(00);
    obj.rectangle16:setWidth(40);
    obj.rectangle16:setHeight(40);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("darkred");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.layout15);
    obj.image23:setLeft(005);
    obj.image23:setTop(00);
    obj.image23:setWidth(40);
    obj.image23:setHeight(40);
    obj.image23:setField("basBADGE19");
    obj.image23:setEditable(true);
    obj.image23:setStyle("proportional");
    obj.image23:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image23:setName("image23");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout15);
    obj.rectangle17:setLeft(000);
    obj.rectangle17:setTop(45);
    obj.rectangle17:setWidth(40);
    obj.rectangle17:setHeight(40);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("darkred");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.layout15);
    obj.image24:setLeft(005);
    obj.image24:setTop(45);
    obj.image24:setWidth(40);
    obj.image24:setHeight(40);
    obj.image24:setField("basBADGE110");
    obj.image24:setEditable(true);
    obj.image24:setStyle("proportional");
    obj.image24:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image24:setName("image24");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout15);
    obj.rectangle18:setLeft(000);
    obj.rectangle18:setTop(90);
    obj.rectangle18:setWidth(40);
    obj.rectangle18:setHeight(40);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("darkred");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.layout15);
    obj.image25:setLeft(005);
    obj.image25:setTop(90);
    obj.image25:setWidth(40);
    obj.image25:setHeight(40);
    obj.image25:setField("basBADGE111");
    obj.image25:setEditable(true);
    obj.image25:setStyle("proportional");
    obj.image25:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image25:setName("image25");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout15);
    obj.rectangle19:setLeft(000);
    obj.rectangle19:setTop(135);
    obj.rectangle19:setWidth(40);
    obj.rectangle19:setHeight(40);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("darkred");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.layout15);
    obj.image26:setLeft(005);
    obj.image26:setTop(135);
    obj.image26:setWidth(40);
    obj.image26:setHeight(40);
    obj.image26:setField("basBADGE112");
    obj.image26:setEditable(true);
    obj.image26:setStyle("proportional");
    obj.image26:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image26:setName("image26");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout15);
    obj.rectangle20:setLeft(000);
    obj.rectangle20:setTop(180);
    obj.rectangle20:setWidth(40);
    obj.rectangle20:setHeight(40);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("darkred");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.layout15);
    obj.image27:setLeft(005);
    obj.image27:setTop(180);
    obj.image27:setWidth(40);
    obj.image27:setHeight(40);
    obj.image27:setField("basBADGE113");
    obj.image27:setEditable(true);
    obj.image27:setStyle("proportional");
    obj.image27:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image27:setName("image27");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout15);
    obj.rectangle21:setLeft(000);
    obj.rectangle21:setTop(225);
    obj.rectangle21:setWidth(40);
    obj.rectangle21:setHeight(40);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("darkred");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.layout15);
    obj.image28:setLeft(005);
    obj.image28:setTop(225);
    obj.image28:setWidth(40);
    obj.image28:setHeight(40);
    obj.image28:setField("basBADGE114");
    obj.image28:setEditable(true);
    obj.image28:setStyle("proportional");
    obj.image28:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image28:setName("image28");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout15);
    obj.rectangle22:setLeft(000);
    obj.rectangle22:setTop(270);
    obj.rectangle22:setWidth(40);
    obj.rectangle22:setHeight(40);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("darkred");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.layout15);
    obj.image29:setLeft(005);
    obj.image29:setTop(270);
    obj.image29:setWidth(40);
    obj.image29:setHeight(40);
    obj.image29:setField("basBADGE115");
    obj.image29:setEditable(true);
    obj.image29:setStyle("proportional");
    obj.image29:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image29:setName("image29");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout15);
    obj.rectangle23:setLeft(000);
    obj.rectangle23:setTop(315);
    obj.rectangle23:setWidth(40);
    obj.rectangle23:setHeight(40);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("darkred");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.layout15);
    obj.image30:setLeft(005);
    obj.image30:setTop(315);
    obj.image30:setWidth(40);
    obj.image30:setHeight(40);
    obj.image30:setField("basBADGE116");
    obj.image30:setEditable(true);
    obj.image30:setStyle("proportional");
    obj.image30:setHint("Insígnea, Ribbon, Key Item, etc");
    obj.image30:setName("image30");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.scrollBox2);
    obj.dataLink27:setFields({'attBAFOR','attBADES','attBACON','attBAINT','attBASAB','attBACAR','basLV',
						   'attNVFOR','attNVDES','attNVCON','attNVINT','attNVSAB','attNVCAR',
						   'attBPFOR','attBPDES','attBPCON','attBPINT','attBPSAB','attBPCAR',
						   'attBTFOR','attBTDES','attBTCON','attBTINT','attBTSAB','attBTCAR', 'TXPinv'});
    obj.dataLink27:setName("dataLink27");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Pokémons");
    obj.tab2:setName("tab2");

    obj.frmPokemon1 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPokemon1:setParent(obj.tab2);
    obj.frmPokemon1:setName("frmPokemon1");
    obj.frmPokemon1:setAlign("client");
    obj.frmPokemon1:setTheme("dark");
    obj.frmPokemon1:setMargins({top=1});

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.frmPokemon1);
    obj.layout16:setLeft(000);
    obj.layout16:setTop(000);
    obj.layout16:setHeight(650);
    obj.layout16:setWidth(1100);
    obj.layout16:setName("layout16");

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.layout16);
    obj.image31:setLeft(000);
    obj.image31:setTop(000);
    obj.image31:setHeight(650);
    obj.image31:setWidth(1100);
    obj.image31:setSRC("/img/Pokeball.jpg");
    obj.image31:setStyle("autoFit");
    obj.image31:setName("image31");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmPokemon1);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox3);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(30);
    obj.layout17:setMargins({bottom=4});
    obj.layout17:setName("layout17");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout17);
    obj.button7:setText("Novo Pokémon");
    obj.button7:setWidth(150);
    obj.button7:setAlign("left");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout17);
    obj.button8:setText("Organizar");
    obj.button8:setWidth(150);
    obj.button8:setAlign("left");
    obj.button8:setName("button8");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.scrollBox3);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmItemDaLista");
    obj.rclListaDosItens:setAlign("client");
    obj.rclListaDosItens:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.scrollBox3);
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
    obj.tabControl2:setWidth(890);
    obj.tabControl2:setName("tabControl2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("Geral");
    obj.tab3:setName("tab3");

    obj.frmPokemon2 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPokemon2:setParent(obj.tab3);
    obj.frmPokemon2:setName("frmPokemon2");
    obj.frmPokemon2:setAlign("client");
    obj.frmPokemon2:setTheme("dark");
    obj.frmPokemon2:setMargins({top=1});

    obj.popExemplo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popExemplo:setParent(obj.frmPokemon2);
    obj.popExemplo:setName("popExemplo");
    obj.popExemplo:setWidth(300);
    obj.popExemplo:setHeight(200);
    obj.popExemplo:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popExemplo, "autoScopeNode",  "false");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.popExemplo);
    obj.label48:setLeft(0);
    obj.label48:setTop(5);
    obj.label48:setWidth(60);
    obj.label48:setHeight(20);
    obj.label48:setText("Efeito:");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popExemplo);
    obj.textEditor1:setLeft(005);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setHeight(165);
    obj.textEditor1:setWidth(290);
    obj.textEditor1:setField("Descricao1");
    obj.textEditor1:setName("textEditor1");

    obj.popExemplo2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popExemplo2:setParent(obj.frmPokemon2);
    obj.popExemplo2:setName("popExemplo2");
    obj.popExemplo2:setWidth(300);
    obj.popExemplo2:setHeight(200);
    obj.popExemplo2:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popExemplo2, "autoScopeNode",  "false");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.popExemplo2);
    obj.label49:setLeft(0);
    obj.label49:setTop(5);
    obj.label49:setWidth(60);
    obj.label49:setHeight(20);
    obj.label49:setText("Efeito:");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popExemplo2);
    obj.textEditor2:setLeft(005);
    obj.textEditor2:setTop(30);
    obj.textEditor2:setHeight(165);
    obj.textEditor2:setWidth(290);
    obj.textEditor2:setField("Descricao2");
    obj.textEditor2:setName("textEditor2");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.frmPokemon2);
    obj.rectangle24:setAlign("top");
    obj.rectangle24:setColor("black");
    obj.rectangle24:setXradius(10);
    obj.rectangle24:setYradius(10);
    obj.rectangle24:setHeight(880);
    obj.rectangle24:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle24:setName("rectangle24");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle24);
    obj.layout18:setLeft(005);
    obj.layout18:setTop(10);
    obj.layout18:setWidth(800);
    obj.layout18:setHeight(560);
    obj.layout18:setName("layout18");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout18);
    obj.rectangle25:setLeft(00);
    obj.rectangle25:setTop(00);
    obj.rectangle25:setWidth(30);
    obj.rectangle25:setHeight(30);
    obj.rectangle25:setColor("gray");
    obj.rectangle25:setName("rectangle25");

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.layout18);
    obj.image32:setLeft(00);
    obj.image32:setTop(00);
    obj.image32:setWidth(30);
    obj.image32:setHeight(30);
    obj.image32:setEditable(true);
    obj.image32:setField("campoPokebola");
    obj.image32:setName("image32");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout18);
    obj.dataLink28:setField("campoPokebola");
    obj.dataLink28:setDefaultValue("https://cdn.bulbagarden.net/upload/9/93/Bag_Pok%C3%A9_Ball_Sprite.png");
    obj.dataLink28:setName("dataLink28");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout18);
    obj.rectangle26:setLeft(35);
    obj.rectangle26:setTop(00);
    obj.rectangle26:setWidth(160);
    obj.rectangle26:setHeight(160);
    obj.rectangle26:setColor("gray");
    obj.rectangle26:setName("rectangle26");

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.layout18);
    obj.image33:setLeft(35);
    obj.image33:setTop(00);
    obj.image33:setWidth(160);
    obj.image33:setHeight(160);
    obj.image33:setEditable(true);
    obj.image33:setField("campoPokemon");
    lfm_setPropAsString(obj.image33, "animate",  "true");
    obj.image33:setName("image33");

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.layout18);
    obj.image34:setLeft(000);
    obj.image34:setTop(45);
    obj.image34:setWidth(30);
    obj.image34:setHeight(30);
    obj.image34:setField("basSEX");
    obj.image34:setStyle("proportional");
    obj.image34:setEditable(false);
    obj.image34:setName("image34");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout18);
    obj.button9:setLeft(0);
    obj.button9:setTop(140);
    obj.button9:setWidth(15);
    obj.button9:setHeight(20);
    obj.button9:setText("E");
    obj.button9:setHint("Exportar uma ficha");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout18);
    obj.button10:setLeft(17);
    obj.button10:setTop(140);
    obj.button10:setWidth(15);
    obj.button10:setHeight(20);
    obj.button10:setText("I");
    obj.button10:setHint("Importar uma ficha");
    obj.button10:setName("button10");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout18);
    obj.dataLink29:setField("active");
    obj.dataLink29:setDefaultValue("true");
    obj.dataLink29:setName("dataLink29");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout18);
    obj.imageCheckBox1:setLeft(00);
    obj.imageCheckBox1:setTop(90);
    obj.imageCheckBox1:setHeight(30);
    obj.imageCheckBox1:setWidth(30);
    obj.imageCheckBox1:setField("PokShiny");
    obj.imageCheckBox1:setHint("Padrão ou Shiny");
    obj.imageCheckBox1:setImageChecked("/img/Shiny_ON.png");
    obj.imageCheckBox1:setImageUnchecked("/img/Shiny_OFF.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout18);
    obj.dataLink30:setField("PokShiny");
    obj.dataLink30:setDefaultValue("false");
    obj.dataLink30:setName("dataLink30");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle24);
    obj.layout19:setLeft(210);
    obj.layout19:setTop(10);
    obj.layout19:setWidth(800);
    obj.layout19:setHeight(800);
    obj.layout19:setName("layout19");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout19);
    obj.label50:setLeft(0);
    obj.label50:setTop(00);
    obj.label50:setWidth(80);
    obj.label50:setHeight(20);
    obj.label50:setText("Número:");
    obj.label50:setAutoSize(true);
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setName("label50");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout19);
    obj.edit84:setLeft(75);
    obj.edit84:setTop(00);
    obj.edit84:setWidth(60);
    obj.edit84:setHeight(20);
    obj.edit84:setField("campoNumero");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout19);
    obj.comboBox1:setLeft(140);
    obj.comboBox1:setTop(00);
    obj.comboBox1:setWidth(110);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setField("campoGenero");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'Masculino', 'Feminino', 'Agênero'});
    obj.comboBox1:setValues({'1', '2', '3'});
    obj.comboBox1:setName("comboBox1");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout19);
    obj.label51:setLeft(0);
    obj.label51:setTop(25);
    obj.label51:setWidth(80);
    obj.label51:setHeight(20);
    obj.label51:setText("Espécie:");
    obj.label51:setAutoSize(true);
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setName("label51");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout19);
    obj.edit85:setLeft(75);
    obj.edit85:setTop(25);
    obj.edit85:setWidth(175);
    obj.edit85:setHeight(20);
    obj.edit85:setField("campoNome");
    obj.edit85:setName("edit85");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout19);
    obj.label52:setLeft(0);
    obj.label52:setTop(50);
    obj.label52:setWidth(80);
    obj.label52:setHeight(20);
    obj.label52:setText("Apelido:");
    obj.label52:setAutoSize(true);
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setName("label52");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout19);
    obj.edit86:setLeft(75);
    obj.edit86:setTop(50);
    obj.edit86:setWidth(175);
    obj.edit86:setHeight(20);
    obj.edit86:setField("campoApelido");
    obj.edit86:setName("edit86");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout19);
    obj.label53:setLeft(0);
    obj.label53:setTop(75);
    obj.label53:setWidth(80);
    obj.label53:setHeight(20);
    obj.label53:setText("Tipo(s):");
    obj.label53:setAutoSize(true);
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setName("label53");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout19);
    obj.comboBox2:setLeft(75);
    obj.comboBox2:setTop(75);
    obj.comboBox2:setWidth(85);
    obj.comboBox2:setHeight(20);
    obj.comboBox2:setField("campoElem1");
    obj.comboBox2:setHorzTextAlign("leading");
    obj.comboBox2:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox2:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox2:setName("comboBox2");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout19);
    obj.comboBox3:setLeft(165);
    obj.comboBox3:setTop(75);
    obj.comboBox3:setWidth(85);
    obj.comboBox3:setHeight(20);
    obj.comboBox3:setField("campoElem2");
    obj.comboBox3:setHorzTextAlign("leading");
    obj.comboBox3:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox3:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout19);
    obj.dataLink31:setField("campoElem1");
    obj.dataLink31:setDefaultValue("19");
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout19);
    obj.dataLink32:setField("campoElem1");
    obj.dataLink32:setDefaultValue("19");
    obj.dataLink32:setName("dataLink32");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout19);
    obj.label54:setLeft(0);
    obj.label54:setTop(100);
    obj.label54:setWidth(80);
    obj.label54:setHeight(20);
    obj.label54:setText("Natureza:");
    obj.label54:setAutoSize(true);
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");
    obj.label54:setName("label54");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout19);
    obj.edit87:setLeft(75);
    obj.edit87:setTop(100);
    obj.edit87:setWidth(175);
    obj.edit87:setHeight(20);
    obj.edit87:setField("campoNatureza");
    obj.edit87:setName("edit87");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout19);
    obj.label55:setLeft(95);
    obj.label55:setTop(125);
    obj.label55:setWidth(68);
    obj.label55:setHeight(20);
    obj.label55:setText("Aumenta");
    obj.label55:setAutoSize(true);
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout19);
    obj.label56:setLeft(168);
    obj.label56:setTop(125);
    obj.label56:setWidth(68);
    obj.label56:setHeight(20);
    obj.label56:setText("Diminui");
    obj.label56:setAutoSize(true);
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout19);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(145);
    obj.comboBox4:setWidth(68);
    obj.comboBox4:setHeight(20);
    obj.comboBox4:setField("campoNatPlus");
    obj.comboBox4:setHorzTextAlign("leading");
    obj.comboBox4:setItems({'ATK', 'DEF', 'AES', 'DES', 'VEL'});
    obj.comboBox4:setValues({'2', '3', '4','5','6'});
    obj.comboBox4:setName("comboBox4");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout19);
    obj.comboBox5:setLeft(168);
    obj.comboBox5:setTop(145);
    obj.comboBox5:setWidth(68);
    obj.comboBox5:setHeight(20);
    obj.comboBox5:setField("campoNatMinus");
    obj.comboBox5:setHorzTextAlign("leading");
    obj.comboBox5:setItems({'ATK', 'DEF', 'AES', 'DES', 'VEL'});
    obj.comboBox5:setValues({'2', '3', '4','5','6'});
    obj.comboBox5:setName("comboBox5");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle24);
    obj.layout20:setLeft(500);
    obj.layout20:setTop(20);
    obj.layout20:setWidth(800);
    obj.layout20:setHeight(800);
    obj.layout20:setName("layout20");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout20);
    obj.label57:setLeft(0);
    obj.label57:setTop(000);
    obj.label57:setWidth(100);
    obj.label57:setHeight(20);
    obj.label57:setText("Correr");
    obj.label57:setAutoSize(true);
    lfm_setPropAsString(obj.label57, "fontStyle",  "bold");
    obj.label57:setName("label57");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout20);
    obj.edit88:setLeft(85);
    obj.edit88:setTop(000);
    obj.edit88:setWidth(60);
    obj.edit88:setHeight(20);
    obj.edit88:setField("campoCorrer");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout20);
    obj.label58:setLeft(0);
    obj.label58:setTop(025);
    obj.label58:setWidth(100);
    obj.label58:setHeight(20);
    obj.label58:setText("Cavar");
    obj.label58:setAutoSize(true);
    lfm_setPropAsString(obj.label58, "fontStyle",  "bold");
    obj.label58:setName("label58");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout20);
    obj.edit89:setLeft(85);
    obj.edit89:setTop(025);
    obj.edit89:setWidth(60);
    obj.edit89:setHeight(20);
    obj.edit89:setField("campoCavar");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout20);
    obj.label59:setLeft(0);
    obj.label59:setTop(050);
    obj.label59:setWidth(100);
    obj.label59:setHeight(20);
    obj.label59:setText("Saltar");
    obj.label59:setAutoSize(true);
    lfm_setPropAsString(obj.label59, "fontStyle",  "bold");
    obj.label59:setName("label59");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout20);
    obj.edit90:setLeft(85);
    obj.edit90:setTop(050);
    obj.edit90:setWidth(60);
    obj.edit90:setHeight(20);
    obj.edit90:setField("campoSaltar");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout20);
    obj.label60:setLeft(0);
    obj.label60:setTop(075);
    obj.label60:setWidth(100);
    obj.label60:setHeight(20);
    obj.label60:setText("Voar");
    obj.label60:setAutoSize(true);
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");
    obj.label60:setName("label60");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout20);
    obj.edit91:setLeft(85);
    obj.edit91:setTop(075);
    obj.edit91:setWidth(60);
    obj.edit91:setHeight(20);
    obj.edit91:setField("campoVoar");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setName("edit91");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout20);
    obj.label61:setLeft(0);
    obj.label61:setTop(100);
    obj.label61:setWidth(100);
    obj.label61:setHeight(20);
    obj.label61:setText("Nadar");
    obj.label61:setAutoSize(true);
    lfm_setPropAsString(obj.label61, "fontStyle",  "bold");
    obj.label61:setName("label61");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout20);
    obj.edit92:setLeft(85);
    obj.edit92:setTop(100);
    obj.edit92:setWidth(60);
    obj.edit92:setHeight(20);
    obj.edit92:setField("campoNadar");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout20);
    obj.label62:setLeft(0);
    obj.label62:setTop(125);
    obj.label62:setWidth(100);
    obj.label62:setHeight(20);
    obj.label62:setText("Mergulhar");
    obj.label62:setAutoSize(true);
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");
    obj.label62:setName("label62");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout20);
    obj.edit93:setLeft(85);
    obj.edit93:setTop(125);
    obj.edit93:setWidth(60);
    obj.edit93:setHeight(20);
    obj.edit93:setField("campoMerg");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setName("edit93");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle24);
    obj.layout21:setLeft(700);
    obj.layout21:setTop(20);
    obj.layout21:setWidth(800);
    obj.layout21:setHeight(800);
    obj.layout21:setName("layout21");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout21);
    obj.label63:setLeft(000);
    obj.label63:setTop(00);
    obj.label63:setWidth(100);
    obj.label63:setHeight(20);
    obj.label63:setText("Altura:");
    obj.label63:setAutoSize(true);
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");
    obj.label63:setName("label63");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout21);
    obj.edit94:setLeft(085);
    obj.edit94:setTop(00);
    obj.edit94:setWidth(80);
    obj.edit94:setHeight(20);
    obj.edit94:setField("campoAltura");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setName("edit94");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout21);
    obj.label64:setLeft(000);
    obj.label64:setTop(25);
    obj.label64:setWidth(100);
    obj.label64:setHeight(20);
    obj.label64:setText("Categoria:");
    obj.label64:setAutoSize(true);
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");
    obj.label64:setName("label64");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout21);
    obj.comboBox6:setLeft(085);
    obj.comboBox6:setTop(25);
    obj.comboBox6:setWidth(80);
    obj.comboBox6:setHeight(20);
    obj.comboBox6:setField("catAltura");
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'Pequeno', 'Médio', 'Grande', 'Enorme', 'Gigante'});
    obj.comboBox6:setValues({'Pequeno', 'Médio', 'Grande', 'Enorme', 'Gigante'});
    obj.comboBox6:setName("comboBox6");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout21);
    obj.label65:setLeft(000);
    obj.label65:setTop(50);
    obj.label65:setWidth(100);
    obj.label65:setHeight(20);
    obj.label65:setText("Peso:");
    obj.label65:setAutoSize(true);
    lfm_setPropAsString(obj.label65, "fontStyle",  "bold");
    obj.label65:setName("label65");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout21);
    obj.edit95:setLeft(085);
    obj.edit95:setTop(50);
    obj.edit95:setWidth(80);
    obj.edit95:setHeight(20);
    obj.edit95:setField("campoPeso");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout21);
    obj.label66:setLeft(000);
    obj.label66:setTop(75);
    obj.label66:setWidth(100);
    obj.label66:setHeight(20);
    obj.label66:setText("Categoria:");
    obj.label66:setAutoSize(true);
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");
    obj.label66:setName("label66");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout21);
    obj.comboBox7:setLeft(085);
    obj.comboBox7:setTop(75);
    obj.comboBox7:setWidth(80);
    obj.comboBox7:setHeight(20);
    obj.comboBox7:setField("catPeso");
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setItems({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox7:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox7:setName("comboBox7");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout21);
    obj.label67:setLeft(0);
    obj.label67:setTop(100);
    obj.label67:setWidth(100);
    obj.label67:setHeight(20);
    obj.label67:setText("Força");
    obj.label67:setAutoSize(true);
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setName("label67");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout21);
    obj.edit96:setLeft(85);
    obj.edit96:setTop(100);
    obj.edit96:setWidth(60);
    obj.edit96:setHeight(20);
    obj.edit96:setField("campoForca");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setName("edit96");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout21);
    obj.label68:setLeft(0);
    obj.label68:setTop(125);
    obj.label68:setWidth(100);
    obj.label68:setHeight(20);
    obj.label68:setText("Inteligência");
    obj.label68:setAutoSize(true);
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");
    obj.label68:setName("label68");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout21);
    obj.edit97:setLeft(85);
    obj.edit97:setTop(125);
    obj.edit97:setWidth(60);
    obj.edit97:setHeight(20);
    obj.edit97:setField("campoInt");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setName("edit97");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle24);
    obj.layout22:setLeft(260);
    obj.layout22:setTop(195);
    obj.layout22:setWidth(900);
    obj.layout22:setHeight(800);
    obj.layout22:setName("layout22");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout22);
    obj.label69:setLeft(0);
    obj.label69:setTop(00);
    obj.label69:setWidth(100);
    obj.label69:setHeight(20);
    obj.label69:setText("Nível:");
    obj.label69:setAutoSize(true);
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setName("label69");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout22);
    obj.edit98:setLeft(100);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(45);
    obj.edit98:setHeight(20);
    obj.edit98:setField("pokeLevel");
    obj.edit98:setType("number");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout22);
    obj.label70:setLeft(0);
    obj.label70:setTop(25);
    obj.label70:setWidth(100);
    obj.label70:setHeight(20);
    obj.label70:setText("Experiência:");
    obj.label70:setAutoSize(true);
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");
    obj.label70:setName("label70");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout22);
    obj.edit99:setLeft(100);
    obj.edit99:setTop(25);
    obj.edit99:setWidth(45);
    obj.edit99:setHeight(20);
    obj.edit99:setField("campoExpAt");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setName("edit99");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout22);
    obj.label71:setLeft(147);
    obj.label71:setTop(25);
    obj.label71:setHeight(20);
    obj.label71:setWidth(8);
    obj.label71:setText("/");
    obj.label71:setAutoSize(true);
    obj.label71:setName("label71");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout22);
    obj.edit100:setLeft(155);
    obj.edit100:setTop(25);
    obj.edit100:setHeight(20);
    obj.edit100:setWidth(45);
    obj.edit100:setField("nextLVEXP");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setEnabled(false);
    obj.edit100:setName("edit100");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout22);
    obj.label72:setLeft(0);
    obj.label72:setTop(50);
    obj.label72:setWidth(100);
    obj.label72:setHeight(20);
    obj.label72:setText("Lealdade:");
    obj.label72:setAutoSize(true);
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setName("label72");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout22);
    obj.edit101:setLeft(100);
    obj.edit101:setTop(50);
    obj.edit101:setWidth(45);
    obj.edit101:setHeight(20);
    obj.edit101:setField("campoLealdade");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setName("edit101");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout22);
    obj.label73:setLeft(147);
    obj.label73:setTop(50);
    obj.label73:setHeight(20);
    obj.label73:setWidth(8);
    obj.label73:setText("/");
    obj.label73:setAutoSize(true);
    obj.label73:setName("label73");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout22);
    obj.edit102:setLeft(155);
    obj.edit102:setTop(50);
    obj.edit102:setHeight(20);
    obj.edit102:setWidth(45);
    obj.edit102:setField("baseLealMAX");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setEnabled(false);
    obj.edit102:setName("edit102");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout22);
    obj.label74:setLeft(0);
    obj.label74:setTop(75);
    obj.label74:setWidth(100);
    obj.label74:setHeight(20);
    obj.label74:setText("Vida");
    obj.label74:setAutoSize(true);
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");
    obj.label74:setName("label74");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout22);
    obj.edit103:setLeft(100);
    obj.edit103:setTop(75);
    obj.edit103:setHeight(20);
    obj.edit103:setWidth(45);
    obj.edit103:setField("baseHPAtual");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setName("edit103");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout22);
    obj.label75:setLeft(147);
    obj.label75:setTop(75);
    obj.label75:setHeight(20);
    obj.label75:setWidth(8);
    obj.label75:setText("/");
    obj.label75:setAutoSize(true);
    obj.label75:setName("label75");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout22);
    obj.edit104:setLeft(155);
    obj.edit104:setTop(75);
    obj.edit104:setHeight(20);
    obj.edit104:setWidth(45);
    obj.edit104:setField("baseHPMAX");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setEnabled(false);
    obj.edit104:setName("edit104");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle24);
    obj.layout23:setLeft(475);
    obj.layout23:setTop(195);
    obj.layout23:setHeight(320);
    obj.layout23:setWidth(420);
    obj.layout23:setName("layout23");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout23);
    obj.label76:setLeft(0);
    obj.label76:setTop(000);
    obj.label76:setWidth(60);
    obj.label76:setHeight(20);
    obj.label76:setText("Prec.");
    obj.label76:setAutoSize(true);
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setName("label76");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout23);
    obj.comboBox8:setLeft(65);
    obj.comboBox8:setTop(000);
    obj.comboBox8:setHeight(20);
    obj.comboBox8:setWidth(45);
    obj.comboBox8:setField("edcPREC_edc");
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setItems({'-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5'});
    obj.comboBox8:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'});
    obj.comboBox8:setName("comboBox8");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout23);
    obj.dataLink33:setField("edcPREC_edc");
    obj.dataLink33:setDefaultValue("6");
    obj.dataLink33:setName("dataLink33");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout23);
    obj.label77:setLeft(0);
    obj.label77:setTop(025);
    obj.label77:setWidth(60);
    obj.label77:setHeight(20);
    obj.label77:setText("Evasiva");
    obj.label77:setAutoSize(true);
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");
    obj.label77:setName("label77");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout23);
    obj.comboBox9:setLeft(65);
    obj.comboBox9:setTop(025);
    obj.comboBox9:setHeight(20);
    obj.comboBox9:setWidth(45);
    obj.comboBox9:setField("edcEVA_edc");
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setItems({'-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5'});
    obj.comboBox9:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'});
    obj.comboBox9:setName("comboBox9");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout23);
    obj.dataLink34:setField("edcEVA_edc");
    obj.dataLink34:setDefaultValue("6");
    obj.dataLink34:setName("dataLink34");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout23);
    obj.label78:setLeft(0);
    obj.label78:setTop(050);
    obj.label78:setWidth(60);
    obj.label78:setHeight(20);
    obj.label78:setText("Crítico");
    obj.label78:setAutoSize(true);
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");
    obj.label78:setName("label78");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout23);
    obj.comboBox10:setLeft(65);
    obj.comboBox10:setTop(050);
    obj.comboBox10:setHeight(20);
    obj.comboBox10:setWidth(45);
    obj.comboBox10:setField("edcCRIT_edc");
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setItems({'0', '1', '2', '3', '4', '5'});
    obj.comboBox10:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox10:setName("comboBox10");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout23);
    obj.dataLink35:setField("edcCRIT_edc");
    obj.dataLink35:setDefaultValue("2");
    obj.dataLink35:setName("dataLink35");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout23);
    obj.label79:setLeft(0);
    obj.label79:setTop(075);
    obj.label79:setWidth(60);
    obj.label79:setHeight(20);
    obj.label79:setText("Def.Crit.");
    obj.label79:setAutoSize(true);
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");
    obj.label79:setName("label79");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout23);
    obj.comboBox11:setLeft(65);
    obj.comboBox11:setTop(075);
    obj.comboBox11:setHeight(20);
    obj.comboBox11:setWidth(45);
    obj.comboBox11:setField("edcDCRIT_edc");
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setItems({'0', '1', '2', '3', '4', '5'});
    obj.comboBox11:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox11:setName("comboBox11");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout23);
    obj.dataLink36:setField("edcDCRIT_edc");
    obj.dataLink36:setDefaultValue("2");
    obj.dataLink36:setName("dataLink36");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle24);
    obj.layout24:setLeft(600);
    obj.layout24:setTop(195);
    obj.layout24:setHeight(320);
    obj.layout24:setWidth(420);
    obj.layout24:setName("layout24");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout24);
    obj.label80:setLeft(000);
    obj.label80:setTop(000);
    obj.label80:setHeight(20);
    obj.label80:setWidth(100);
    obj.label80:setText("Treinamento");
    obj.label80:setAutoSize(true);
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setName("label80");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout24);
    obj.edit105:setLeft(105);
    obj.edit105:setTop(000);
    obj.edit105:setHeight(20);
    obj.edit105:setWidth(35);
    obj.edit105:setField("atupokTRE");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setHint("");
    obj.edit105:setType("number");
    obj.edit105:setName("edit105");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout24);
    obj.edit106:setLeft(145);
    obj.edit106:setTop(000);
    obj.edit106:setHeight(20);
    obj.edit106:setWidth(35);
    obj.edit106:setField("maxpokTRE");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setHint("Máximo");
    obj.edit106:setEnabled(false);
    obj.edit106:setType("number");
    obj.edit106:setName("edit106");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout24);
    obj.dataLink37:setField("atupokTRE");
    obj.dataLink37:setDefaultValue("0");
    obj.dataLink37:setName("dataLink37");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout24);
    obj.label81:setLeft(000);
    obj.label81:setTop(025);
    obj.label81:setHeight(20);
    obj.label81:setWidth(100);
    obj.label81:setText("BT");
    obj.label81:setAutoSize(true);
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setName("label81");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout24);
    obj.edit107:setLeft(105);
    obj.edit107:setTop(025);
    obj.edit107:setHeight(20);
    obj.edit107:setWidth(35);
    obj.edit107:setField("atupokBT");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setHint("Bônus de Treinamento");
    obj.edit107:setType("number");
    obj.edit107:setName("edit107");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout24);
    obj.edit108:setLeft(145);
    obj.edit108:setTop(025);
    obj.edit108:setHeight(20);
    obj.edit108:setWidth(35);
    obj.edit108:setField("maxpokBT");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setHint("Máximo");
    obj.edit108:setEnabled(false);
    obj.edit108:setType("number");
    obj.edit108:setName("edit108");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout24);
    obj.dataLink38:setField("atupokBT");
    obj.dataLink38:setDefaultValue("0");
    obj.dataLink38:setName("dataLink38");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout24);
    obj.label82:setLeft(000);
    obj.label82:setTop(050);
    obj.label82:setHeight(20);
    obj.label82:setWidth(100);
    obj.label82:setText("Afeição");
    obj.label82:setAutoSize(true);
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");
    obj.label82:setName("label82");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout24);
    obj.edit109:setLeft(105);
    obj.edit109:setTop(050);
    obj.edit109:setHeight(20);
    obj.edit109:setWidth(75);
    obj.edit109:setField("baspokAfin");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setType("number");
    obj.edit109:setEnabled(false);
    obj.edit109:setName("edit109");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout24);
    obj.label83:setLeft(000);
    obj.label83:setTop(075);
    obj.label83:setHeight(20);
    obj.label83:setWidth(100);
    obj.label83:setText("AXP");
    obj.label83:setAutoSize(true);
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setName("label83");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout24);
    obj.edit110:setLeft(105);
    obj.edit110:setTop(075);
    obj.edit110:setHeight(20);
    obj.edit110:setWidth(35);
    obj.edit110:setField("atupokAXP");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setHint("Experiência de Afeição");
    obj.edit110:setType("number");
    obj.edit110:setName("edit110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout24);
    obj.edit111:setLeft(145);
    obj.edit111:setTop(075);
    obj.edit111:setHeight(20);
    obj.edit111:setWidth(35);
    obj.edit111:setField("maxpokAXP");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setHint("Máximo");
    obj.edit111:setEnabled(false);
    obj.edit111:setType("number");
    obj.edit111:setName("edit111");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout24);
    obj.dataLink39:setField("atupokAXP");
    obj.dataLink39:setDefaultValue("0");
    obj.dataLink39:setName("dataLink39");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout24);
    obj.label84:setLeft(000);
    obj.label84:setTop(100);
    obj.label84:setHeight(20);
    obj.label84:setWidth(100);
    obj.label84:setText("Nv. de Raridade");
    obj.label84:setAutoSize(true);
    lfm_setPropAsString(obj.label84, "fontStyle",  "bold");
    obj.label84:setName("label84");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout24);
    obj.edit112:setLeft(105);
    obj.edit112:setTop(100);
    obj.edit112:setHeight(20);
    obj.edit112:setWidth(75);
    obj.edit112:setField("baspokNR");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setType("number");
    obj.edit112:setName("edit112");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle24);
    obj.layout25:setLeft(10);
    obj.layout25:setTop(320);
    obj.layout25:setHeight(600);
    obj.layout25:setWidth(800);
    obj.layout25:setName("layout25");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout25);
    obj.label85:setLeft(000);
    obj.label85:setTop(000);
    obj.label85:setHeight(20);
    obj.label85:setWidth(30);
    obj.label85:setText("R.B.");
    obj.label85:setAutoSize(true);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout25);
    obj.label86:setLeft(035);
    obj.label86:setTop(000);
    obj.label86:setHeight(20);
    obj.label86:setWidth(100);
    obj.label86:setText("Atributo");
    obj.label86:setAutoSize(true);
    obj.label86:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout25);
    obj.label87:setLeft(140);
    obj.label87:setTop(000);
    obj.label87:setHeight(20);
    obj.label87:setWidth(30);
    obj.label87:setText("Total");
    obj.label87:setAutoSize(true);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout25);
    obj.label88:setLeft(185);
    obj.label88:setTop(000);
    obj.label88:setHeight(20);
    obj.label88:setWidth(30);
    obj.label88:setText("Base");
    obj.label88:setAutoSize(true);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout25);
    obj.label89:setLeft(230);
    obj.label89:setTop(000);
    obj.label89:setHeight(20);
    obj.label89:setWidth(30);
    obj.label89:setText("Nível");
    obj.label89:setAutoSize(true);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout25);
    obj.label90:setLeft(275);
    obj.label90:setTop(000);
    obj.label90:setHeight(20);
    obj.label90:setWidth(30);
    obj.label90:setText("Bôn");
    obj.label90:setAutoSize(true);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout25);
    obj.label91:setLeft(320);
    obj.label91:setTop(000);
    obj.label91:setHeight(20);
    obj.label91:setWidth(30);
    obj.label91:setText("Vit.");
    obj.label91:setAutoSize(true);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout25);
    obj.imageCheckBox2:setLeft(370);
    obj.imageCheckBox2:setTop(000);
    obj.imageCheckBox2:setHeight(40);
    obj.imageCheckBox2:setWidth(20);
    obj.imageCheckBox2:setField("MegaEvo");
    obj.imageCheckBox2:setHint("Normal ou Mega");
    obj.imageCheckBox2:setImageChecked("/img/Mega_ON.png");
    obj.imageCheckBox2:setImageUnchecked("/img/Mega_OFF.png");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout25);
    obj.edit113:setLeft(000);
    obj.edit113:setTop(025);
    obj.edit113:setHeight(20);
    obj.edit113:setWidth(30);
    obj.edit113:setField("Vida_Pri");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setType("number");
    obj.edit113:setName("edit113");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout25);
    obj.label92:setLeft(035);
    obj.label92:setTop(025);
    obj.label92:setHeight(20);
    obj.label92:setWidth(100);
    obj.label92:setText("HP");
    obj.label92:setAutoSize(true);
    lfm_setPropAsString(obj.label92, "fontStyle",  "bold");
    obj.label92:setName("label92");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout25);
    obj.edit114:setLeft(140);
    obj.edit114:setTop(025);
    obj.edit114:setHeight(20);
    obj.edit114:setWidth(30);
    obj.edit114:setField("Vida_Form1");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setType("number");
    obj.edit114:setEnabled(false);
    obj.edit114:setName("edit114");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout25);
    obj.edit115:setLeft(185);
    obj.edit115:setTop(025);
    obj.edit115:setHeight(20);
    obj.edit115:setWidth(30);
    obj.edit115:setField("Vida_Base1");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setType("number");
    obj.edit115:setName("edit115");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout25);
    obj.edit116:setLeft(230);
    obj.edit116:setTop(025);
    obj.edit116:setHeight(20);
    obj.edit116:setWidth(30);
    obj.edit116:setField("Vida_Nivel");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setType("number");
    obj.edit116:setName("edit116");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout25);
    obj.edit117:setLeft(275);
    obj.edit117:setTop(025);
    obj.edit117:setHeight(20);
    obj.edit117:setWidth(30);
    obj.edit117:setField("Vida_Bon1");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setType("number");
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout25);
    obj.edit118:setLeft(320);
    obj.edit118:setTop(025);
    obj.edit118:setHeight(20);
    obj.edit118:setWidth(30);
    obj.edit118:setField("Vida_Vit");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setType("number");
    obj.edit118:setName("edit118");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout25);
    obj.edit119:setLeft(000);
    obj.edit119:setTop(050);
    obj.edit119:setHeight(20);
    obj.edit119:setWidth(30);
    obj.edit119:setField("Ataque_Pri");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setType("number");
    obj.edit119:setName("edit119");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout25);
    obj.label93:setLeft(035);
    obj.label93:setTop(050);
    obj.label93:setHeight(20);
    obj.label93:setWidth(100);
    obj.label93:setText("Ataque");
    obj.label93:setAutoSize(true);
    lfm_setPropAsString(obj.label93, "fontStyle",  "bold");
    obj.label93:setName("label93");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout25);
    obj.edit120:setLeft(140);
    obj.edit120:setTop(050);
    obj.edit120:setHeight(20);
    obj.edit120:setWidth(30);
    obj.edit120:setField("Ataque_Form1");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setType("number");
    obj.edit120:setEnabled(false);
    obj.edit120:setName("edit120");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout25);
    obj.edit121:setLeft(185);
    obj.edit121:setTop(050);
    obj.edit121:setHeight(20);
    obj.edit121:setWidth(30);
    obj.edit121:setField("Ataque_Base1");
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setType("number");
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout25);
    obj.edit122:setLeft(230);
    obj.edit122:setTop(050);
    obj.edit122:setHeight(20);
    obj.edit122:setWidth(30);
    obj.edit122:setField("Ataque_Nivel");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setType("number");
    obj.edit122:setName("edit122");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout25);
    obj.edit123:setLeft(275);
    obj.edit123:setTop(050);
    obj.edit123:setHeight(20);
    obj.edit123:setWidth(30);
    obj.edit123:setField("Ataque_Bon1");
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setType("number");
    obj.edit123:setName("edit123");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout25);
    obj.edit124:setLeft(320);
    obj.edit124:setTop(050);
    obj.edit124:setHeight(20);
    obj.edit124:setWidth(30);
    obj.edit124:setField("Ataque_Vit");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setType("number");
    obj.edit124:setName("edit124");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout25);
    obj.edit125:setLeft(365);
    obj.edit125:setTop(050);
    obj.edit125:setHeight(20);
    obj.edit125:setWidth(30);
    obj.edit125:setField("Ataque_Bon2");
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setType("number");
    obj.edit125:setName("edit125");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout25);
    obj.comboBox12:setLeft(400);
    obj.comboBox12:setTop(050);
    obj.comboBox12:setHeight(20);
    obj.comboBox12:setWidth(45);
    obj.comboBox12:setField("Ataque_edc");
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox12:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox12:setName("comboBox12");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout25);
    obj.dataLink40:setField("Ataque_edc");
    obj.dataLink40:setDefaultValue("7");
    obj.dataLink40:setName("dataLink40");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout25);
    obj.edit126:setLeft(000);
    obj.edit126:setTop(075);
    obj.edit126:setHeight(20);
    obj.edit126:setWidth(30);
    obj.edit126:setField("Defesa_Pri");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setType("number");
    obj.edit126:setName("edit126");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout25);
    obj.label94:setLeft(035);
    obj.label94:setTop(075);
    obj.label94:setHeight(20);
    obj.label94:setWidth(100);
    obj.label94:setText("Defesa");
    obj.label94:setAutoSize(true);
    lfm_setPropAsString(obj.label94, "fontStyle",  "bold");
    obj.label94:setName("label94");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout25);
    obj.edit127:setLeft(140);
    obj.edit127:setTop(075);
    obj.edit127:setHeight(20);
    obj.edit127:setWidth(30);
    obj.edit127:setField("Defesa_Form1");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setType("number");
    obj.edit127:setEnabled(false);
    obj.edit127:setName("edit127");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout25);
    obj.edit128:setLeft(185);
    obj.edit128:setTop(075);
    obj.edit128:setHeight(20);
    obj.edit128:setWidth(30);
    obj.edit128:setField("Defesa_Base1");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setType("number");
    obj.edit128:setName("edit128");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout25);
    obj.edit129:setLeft(230);
    obj.edit129:setTop(075);
    obj.edit129:setHeight(20);
    obj.edit129:setWidth(30);
    obj.edit129:setField("Defesa_Nivel");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setType("number");
    obj.edit129:setName("edit129");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout25);
    obj.edit130:setLeft(275);
    obj.edit130:setTop(075);
    obj.edit130:setHeight(20);
    obj.edit130:setWidth(30);
    obj.edit130:setField("Defesa_Bon1");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setType("number");
    obj.edit130:setName("edit130");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout25);
    obj.edit131:setLeft(320);
    obj.edit131:setTop(075);
    obj.edit131:setHeight(20);
    obj.edit131:setWidth(30);
    obj.edit131:setField("Defesa_Vit");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setType("number");
    obj.edit131:setName("edit131");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout25);
    obj.edit132:setLeft(365);
    obj.edit132:setTop(075);
    obj.edit132:setHeight(20);
    obj.edit132:setWidth(30);
    obj.edit132:setField("Defesa_Bon2");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setType("number");
    obj.edit132:setName("edit132");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout25);
    obj.comboBox13:setLeft(400);
    obj.comboBox13:setTop(075);
    obj.comboBox13:setHeight(20);
    obj.comboBox13:setWidth(45);
    obj.comboBox13:setField("Defesa_edc");
    obj.comboBox13:setHorzTextAlign("center");
    obj.comboBox13:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox13:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox13:setName("comboBox13");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout25);
    obj.dataLink41:setField("Defesa_edc");
    obj.dataLink41:setDefaultValue("7");
    obj.dataLink41:setName("dataLink41");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout25);
    obj.edit133:setLeft(000);
    obj.edit133:setTop(100);
    obj.edit133:setHeight(20);
    obj.edit133:setWidth(30);
    obj.edit133:setField("AtaqueEsp_Pri");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setType("number");
    obj.edit133:setName("edit133");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout25);
    obj.label95:setLeft(035);
    obj.label95:setTop(100);
    obj.label95:setHeight(20);
    obj.label95:setWidth(100);
    obj.label95:setText("Ataque Especial");
    obj.label95:setAutoSize(true);
    lfm_setPropAsString(obj.label95, "fontStyle",  "bold");
    obj.label95:setName("label95");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout25);
    obj.edit134:setLeft(140);
    obj.edit134:setTop(100);
    obj.edit134:setHeight(20);
    obj.edit134:setWidth(30);
    obj.edit134:setField("AtaqueEsp_Form1");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setType("number");
    obj.edit134:setEnabled(false);
    obj.edit134:setName("edit134");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout25);
    obj.edit135:setLeft(185);
    obj.edit135:setTop(100);
    obj.edit135:setHeight(20);
    obj.edit135:setWidth(30);
    obj.edit135:setField("AtaqueEsp_Base1");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setType("number");
    obj.edit135:setName("edit135");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout25);
    obj.edit136:setLeft(230);
    obj.edit136:setTop(100);
    obj.edit136:setHeight(20);
    obj.edit136:setWidth(30);
    obj.edit136:setField("AtaqueEsp_Nivel");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setType("number");
    obj.edit136:setName("edit136");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout25);
    obj.edit137:setLeft(275);
    obj.edit137:setTop(100);
    obj.edit137:setHeight(20);
    obj.edit137:setWidth(30);
    obj.edit137:setField("AtaqueEsp_Bon1");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setType("number");
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout25);
    obj.edit138:setLeft(320);
    obj.edit138:setTop(100);
    obj.edit138:setHeight(20);
    obj.edit138:setWidth(30);
    obj.edit138:setField("AtaqueEsp_Vit");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setType("number");
    obj.edit138:setName("edit138");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout25);
    obj.edit139:setLeft(365);
    obj.edit139:setTop(100);
    obj.edit139:setHeight(20);
    obj.edit139:setWidth(30);
    obj.edit139:setField("AtaqueEsp_Bon2");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setType("number");
    obj.edit139:setName("edit139");

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout25);
    obj.comboBox14:setLeft(400);
    obj.comboBox14:setTop(100);
    obj.comboBox14:setHeight(20);
    obj.comboBox14:setWidth(45);
    obj.comboBox14:setField("AtaqueEsp_edc");
    obj.comboBox14:setHorzTextAlign("center");
    obj.comboBox14:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox14:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox14:setName("comboBox14");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout25);
    obj.dataLink42:setField("AtaqueEsp_edc");
    obj.dataLink42:setDefaultValue("7");
    obj.dataLink42:setName("dataLink42");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout25);
    obj.edit140:setLeft(000);
    obj.edit140:setTop(125);
    obj.edit140:setHeight(20);
    obj.edit140:setWidth(30);
    obj.edit140:setField("DefesaEsp_Pri");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setType("number");
    obj.edit140:setName("edit140");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout25);
    obj.label96:setLeft(035);
    obj.label96:setTop(125);
    obj.label96:setHeight(20);
    obj.label96:setWidth(100);
    obj.label96:setText("Defesa Especial");
    obj.label96:setAutoSize(true);
    lfm_setPropAsString(obj.label96, "fontStyle",  "bold");
    obj.label96:setName("label96");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout25);
    obj.edit141:setLeft(140);
    obj.edit141:setTop(125);
    obj.edit141:setHeight(20);
    obj.edit141:setWidth(30);
    obj.edit141:setField("DefesaEsp_Form1");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setType("number");
    obj.edit141:setEnabled(false);
    obj.edit141:setName("edit141");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout25);
    obj.edit142:setLeft(185);
    obj.edit142:setTop(125);
    obj.edit142:setHeight(20);
    obj.edit142:setWidth(30);
    obj.edit142:setField("DefesaEsp_Base1");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setType("number");
    obj.edit142:setName("edit142");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout25);
    obj.edit143:setLeft(230);
    obj.edit143:setTop(125);
    obj.edit143:setHeight(20);
    obj.edit143:setWidth(30);
    obj.edit143:setField("DefesaEsp_Nivel");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setType("number");
    obj.edit143:setName("edit143");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout25);
    obj.edit144:setLeft(275);
    obj.edit144:setTop(125);
    obj.edit144:setHeight(20);
    obj.edit144:setWidth(30);
    obj.edit144:setField("DefesaEsp_Bon1");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setType("number");
    obj.edit144:setName("edit144");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout25);
    obj.edit145:setLeft(320);
    obj.edit145:setTop(125);
    obj.edit145:setHeight(20);
    obj.edit145:setWidth(30);
    obj.edit145:setField("DefesaEsp_Vit");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setType("number");
    obj.edit145:setName("edit145");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout25);
    obj.edit146:setLeft(365);
    obj.edit146:setTop(125);
    obj.edit146:setHeight(20);
    obj.edit146:setWidth(30);
    obj.edit146:setField("DefesaEsp_Bon2");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setType("number");
    obj.edit146:setName("edit146");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout25);
    obj.comboBox15:setLeft(400);
    obj.comboBox15:setTop(125);
    obj.comboBox15:setHeight(20);
    obj.comboBox15:setWidth(45);
    obj.comboBox15:setField("DefesaEsp_edc");
    obj.comboBox15:setHorzTextAlign("center");
    obj.comboBox15:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox15:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox15:setName("comboBox15");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout25);
    obj.dataLink43:setField("DefesaEsp_edc");
    obj.dataLink43:setDefaultValue("7");
    obj.dataLink43:setName("dataLink43");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout25);
    obj.edit147:setLeft(000);
    obj.edit147:setTop(150);
    obj.edit147:setHeight(20);
    obj.edit147:setWidth(30);
    obj.edit147:setField("Velocidade_Pri");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setType("number");
    obj.edit147:setName("edit147");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout25);
    obj.label97:setLeft(035);
    obj.label97:setTop(150);
    obj.label97:setHeight(20);
    obj.label97:setWidth(100);
    obj.label97:setText("Velocidade");
    obj.label97:setAutoSize(true);
    lfm_setPropAsString(obj.label97, "fontStyle",  "bold");
    obj.label97:setName("label97");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout25);
    obj.edit148:setLeft(140);
    obj.edit148:setTop(150);
    obj.edit148:setHeight(20);
    obj.edit148:setWidth(30);
    obj.edit148:setField("Velocidade_Form1");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setType("number");
    obj.edit148:setEnabled(false);
    obj.edit148:setName("edit148");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout25);
    obj.edit149:setLeft(185);
    obj.edit149:setTop(150);
    obj.edit149:setHeight(20);
    obj.edit149:setWidth(30);
    obj.edit149:setField("Velocidade_Base1");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setType("number");
    obj.edit149:setName("edit149");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout25);
    obj.edit150:setLeft(230);
    obj.edit150:setTop(150);
    obj.edit150:setHeight(20);
    obj.edit150:setWidth(30);
    obj.edit150:setField("Velocidade_Nivel");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setType("number");
    obj.edit150:setName("edit150");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout25);
    obj.edit151:setLeft(275);
    obj.edit151:setTop(150);
    obj.edit151:setHeight(20);
    obj.edit151:setWidth(30);
    obj.edit151:setField("Velocidade_Bon1");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setType("number");
    obj.edit151:setName("edit151");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout25);
    obj.edit152:setLeft(320);
    obj.edit152:setTop(150);
    obj.edit152:setHeight(20);
    obj.edit152:setWidth(30);
    obj.edit152:setField("Velocidade_Vit");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setType("number");
    obj.edit152:setName("edit152");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout25);
    obj.edit153:setLeft(365);
    obj.edit153:setTop(150);
    obj.edit153:setHeight(20);
    obj.edit153:setWidth(30);
    obj.edit153:setField("Velocidade_Bon2");
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setType("number");
    obj.edit153:setName("edit153");

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout25);
    obj.comboBox16:setLeft(400);
    obj.comboBox16:setTop(150);
    obj.comboBox16:setHeight(20);
    obj.comboBox16:setWidth(45);
    obj.comboBox16:setField("Velocidade_edc");
    obj.comboBox16:setHorzTextAlign("center");
    obj.comboBox16:setItems({'-6', '-5', '-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5', '6'});
    obj.comboBox16:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox16:setName("comboBox16");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout25);
    obj.dataLink44:setField("Velocidade_edc");
    obj.dataLink44:setDefaultValue("7");
    obj.dataLink44:setName("dataLink44");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle24);
    obj.layout26:setLeft(800);
    obj.layout26:setTop(190);
    obj.layout26:setHeight(320);
    obj.layout26:setWidth(420);
    obj.layout26:setName("layout26");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout26);
    obj.imageCheckBox3:setLeft(00);
    obj.imageCheckBox3:setTop(0);
    obj.imageCheckBox3:setHeight(30);
    obj.imageCheckBox3:setWidth(30);
    obj.imageCheckBox3:setField("SlotActive1");
    obj.imageCheckBox3:setHint("Aba 1, Slot 1");
    obj.imageCheckBox3:setImageChecked("/img/Poke1T.png");
    obj.imageCheckBox3:setImageUnchecked("/img/Poke1F.png");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout26);
    obj.dataLink45:setField("SlotActive1");
    obj.dataLink45:setDefaultValue("false");
    obj.dataLink45:setName("dataLink45");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout26);
    obj.dataLink46:setField("SlotActive2");
    obj.dataLink46:setDefaultValue("false");
    obj.dataLink46:setName("dataLink46");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout26);
    obj.dataLink47:setField("SlotActive3");
    obj.dataLink47:setDefaultValue("false");
    obj.dataLink47:setName("dataLink47");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout26);
    obj.dataLink48:setField("SlotActive4");
    obj.dataLink48:setDefaultValue("false");
    obj.dataLink48:setName("dataLink48");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout26);
    obj.dataLink49:setField("SlotActive5");
    obj.dataLink49:setDefaultValue("false");
    obj.dataLink49:setName("dataLink49");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout26);
    obj.dataLink50:setField("SlotActive6");
    obj.dataLink50:setDefaultValue("false");
    obj.dataLink50:setName("dataLink50");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout26);
    obj.dataLink51:setField("SlotActive7");
    obj.dataLink51:setDefaultValue("true");
    obj.dataLink51:setName("dataLink51");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout26);
    obj.imageCheckBox4:setLeft(00);
    obj.imageCheckBox4:setTop(35);
    obj.imageCheckBox4:setHeight(30);
    obj.imageCheckBox4:setWidth(30);
    obj.imageCheckBox4:setField("SlotActive2");
    obj.imageCheckBox4:setHint("Aba 1, Slot 2");
    obj.imageCheckBox4:setImageChecked("/img/Poke2T.png");
    obj.imageCheckBox4:setImageUnchecked("/img/Poke2F.png");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout26);
    obj.dataLink52:setField("SlotActive1");
    obj.dataLink52:setDefaultValue("false");
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout26);
    obj.dataLink53:setField("SlotActive2");
    obj.dataLink53:setDefaultValue("false");
    obj.dataLink53:setName("dataLink53");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout26);
    obj.dataLink54:setField("SlotActive3");
    obj.dataLink54:setDefaultValue("false");
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout26);
    obj.dataLink55:setField("SlotActive4");
    obj.dataLink55:setDefaultValue("false");
    obj.dataLink55:setName("dataLink55");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout26);
    obj.dataLink56:setField("SlotActive5");
    obj.dataLink56:setDefaultValue("false");
    obj.dataLink56:setName("dataLink56");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout26);
    obj.dataLink57:setField("SlotActive6");
    obj.dataLink57:setDefaultValue("false");
    obj.dataLink57:setName("dataLink57");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout26);
    obj.dataLink58:setField("SlotActive7");
    obj.dataLink58:setDefaultValue("true");
    obj.dataLink58:setName("dataLink58");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout26);
    obj.imageCheckBox5:setLeft(00);
    obj.imageCheckBox5:setTop(70);
    obj.imageCheckBox5:setHeight(30);
    obj.imageCheckBox5:setWidth(30);
    obj.imageCheckBox5:setField("SlotActive3");
    obj.imageCheckBox5:setHint("Aba 1, Slot 3");
    obj.imageCheckBox5:setImageChecked("/img/Poke3T.png");
    obj.imageCheckBox5:setImageUnchecked("/img/Poke3F.png");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout26);
    obj.dataLink59:setField("SlotActive1");
    obj.dataLink59:setDefaultValue("false");
    obj.dataLink59:setName("dataLink59");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout26);
    obj.dataLink60:setField("SlotActive2");
    obj.dataLink60:setDefaultValue("false");
    obj.dataLink60:setName("dataLink60");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout26);
    obj.dataLink61:setField("SlotActive3");
    obj.dataLink61:setDefaultValue("false");
    obj.dataLink61:setName("dataLink61");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout26);
    obj.dataLink62:setField("SlotActive4");
    obj.dataLink62:setDefaultValue("false");
    obj.dataLink62:setName("dataLink62");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout26);
    obj.dataLink63:setField("SlotActive5");
    obj.dataLink63:setDefaultValue("false");
    obj.dataLink63:setName("dataLink63");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout26);
    obj.dataLink64:setField("SlotActive6");
    obj.dataLink64:setDefaultValue("false");
    obj.dataLink64:setName("dataLink64");

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout26);
    obj.dataLink65:setField("SlotActive7");
    obj.dataLink65:setDefaultValue("true");
    obj.dataLink65:setName("dataLink65");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout26);
    obj.imageCheckBox6:setLeft(40);
    obj.imageCheckBox6:setTop(0);
    obj.imageCheckBox6:setHeight(30);
    obj.imageCheckBox6:setWidth(30);
    obj.imageCheckBox6:setField("SlotActive4");
    obj.imageCheckBox6:setHint("Aba 1, Slot 4");
    obj.imageCheckBox6:setImageChecked("/img/Poke4T.png");
    obj.imageCheckBox6:setImageUnchecked("/img/Poke4F.png");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout26);
    obj.dataLink66:setField("SlotActive1");
    obj.dataLink66:setDefaultValue("false");
    obj.dataLink66:setName("dataLink66");

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.layout26);
    obj.dataLink67:setField("SlotActive2");
    obj.dataLink67:setDefaultValue("false");
    obj.dataLink67:setName("dataLink67");

    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.layout26);
    obj.dataLink68:setField("SlotActive3");
    obj.dataLink68:setDefaultValue("false");
    obj.dataLink68:setName("dataLink68");

    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout26);
    obj.dataLink69:setField("SlotActive4");
    obj.dataLink69:setDefaultValue("false");
    obj.dataLink69:setName("dataLink69");

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.layout26);
    obj.dataLink70:setField("SlotActive5");
    obj.dataLink70:setDefaultValue("false");
    obj.dataLink70:setName("dataLink70");

    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.layout26);
    obj.dataLink71:setField("SlotActive6");
    obj.dataLink71:setDefaultValue("false");
    obj.dataLink71:setName("dataLink71");

    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.layout26);
    obj.dataLink72:setField("SlotActive7");
    obj.dataLink72:setDefaultValue("true");
    obj.dataLink72:setName("dataLink72");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout26);
    obj.imageCheckBox7:setLeft(40);
    obj.imageCheckBox7:setTop(35);
    obj.imageCheckBox7:setHeight(30);
    obj.imageCheckBox7:setWidth(30);
    obj.imageCheckBox7:setField("SlotActive5");
    obj.imageCheckBox7:setHint("Aba 1, Slot 5");
    obj.imageCheckBox7:setImageChecked("/img/Poke5T.png");
    obj.imageCheckBox7:setImageUnchecked("/img/Poke5F.png");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.layout26);
    obj.dataLink73:setField("SlotActive1");
    obj.dataLink73:setDefaultValue("false");
    obj.dataLink73:setName("dataLink73");

    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.layout26);
    obj.dataLink74:setField("SlotActive2");
    obj.dataLink74:setDefaultValue("false");
    obj.dataLink74:setName("dataLink74");

    obj.dataLink75 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.layout26);
    obj.dataLink75:setField("SlotActive3");
    obj.dataLink75:setDefaultValue("false");
    obj.dataLink75:setName("dataLink75");

    obj.dataLink76 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.layout26);
    obj.dataLink76:setField("SlotActive4");
    obj.dataLink76:setDefaultValue("false");
    obj.dataLink76:setName("dataLink76");

    obj.dataLink77 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.layout26);
    obj.dataLink77:setField("SlotActive5");
    obj.dataLink77:setDefaultValue("false");
    obj.dataLink77:setName("dataLink77");

    obj.dataLink78 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.layout26);
    obj.dataLink78:setField("SlotActive6");
    obj.dataLink78:setDefaultValue("false");
    obj.dataLink78:setName("dataLink78");

    obj.dataLink79 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.layout26);
    obj.dataLink79:setField("SlotActive7");
    obj.dataLink79:setDefaultValue("true");
    obj.dataLink79:setName("dataLink79");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout26);
    obj.imageCheckBox8:setLeft(40);
    obj.imageCheckBox8:setTop(70);
    obj.imageCheckBox8:setHeight(30);
    obj.imageCheckBox8:setWidth(30);
    obj.imageCheckBox8:setField("SlotActive6");
    obj.imageCheckBox8:setHint("Aba 1, Slot 6");
    obj.imageCheckBox8:setImageChecked("/img/Poke6T.png");
    obj.imageCheckBox8:setImageUnchecked("/img/Poke6F.png");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.dataLink80 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink80:setParent(obj.layout26);
    obj.dataLink80:setField("SlotActive1");
    obj.dataLink80:setDefaultValue("false");
    obj.dataLink80:setName("dataLink80");

    obj.dataLink81 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink81:setParent(obj.layout26);
    obj.dataLink81:setField("SlotActive2");
    obj.dataLink81:setDefaultValue("false");
    obj.dataLink81:setName("dataLink81");

    obj.dataLink82 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink82:setParent(obj.layout26);
    obj.dataLink82:setField("SlotActive3");
    obj.dataLink82:setDefaultValue("false");
    obj.dataLink82:setName("dataLink82");

    obj.dataLink83 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink83:setParent(obj.layout26);
    obj.dataLink83:setField("SlotActive4");
    obj.dataLink83:setDefaultValue("false");
    obj.dataLink83:setName("dataLink83");

    obj.dataLink84 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink84:setParent(obj.layout26);
    obj.dataLink84:setField("SlotActive5");
    obj.dataLink84:setDefaultValue("false");
    obj.dataLink84:setName("dataLink84");

    obj.dataLink85 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink85:setParent(obj.layout26);
    obj.dataLink85:setField("SlotActive6");
    obj.dataLink85:setDefaultValue("false");
    obj.dataLink85:setName("dataLink85");

    obj.dataLink86 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink86:setParent(obj.layout26);
    obj.dataLink86:setField("SlotActive7");
    obj.dataLink86:setDefaultValue("true");
    obj.dataLink86:setName("dataLink86");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout26);
    obj.imageCheckBox9:setLeft(20);
    obj.imageCheckBox9:setTop(105);
    obj.imageCheckBox9:setHeight(30);
    obj.imageCheckBox9:setWidth(30);
    obj.imageCheckBox9:setField("SlotActive7");
    obj.imageCheckBox9:setHint("Na Reserva");
    obj.imageCheckBox9:setImageChecked("/img/Computer_ON.png");
    obj.imageCheckBox9:setImageUnchecked("/img/Computer_OFF.png");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.dataLink87 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink87:setParent(obj.layout26);
    obj.dataLink87:setField("SlotActive1");
    obj.dataLink87:setDefaultValue("false");
    obj.dataLink87:setName("dataLink87");

    obj.dataLink88 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink88:setParent(obj.layout26);
    obj.dataLink88:setField("SlotActive2");
    obj.dataLink88:setDefaultValue("false");
    obj.dataLink88:setName("dataLink88");

    obj.dataLink89 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink89:setParent(obj.layout26);
    obj.dataLink89:setField("SlotActive3");
    obj.dataLink89:setDefaultValue("false");
    obj.dataLink89:setName("dataLink89");

    obj.dataLink90 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink90:setParent(obj.layout26);
    obj.dataLink90:setField("SlotActive4");
    obj.dataLink90:setDefaultValue("false");
    obj.dataLink90:setName("dataLink90");

    obj.dataLink91 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink91:setParent(obj.layout26);
    obj.dataLink91:setField("SlotActive5");
    obj.dataLink91:setDefaultValue("false");
    obj.dataLink91:setName("dataLink91");

    obj.dataLink92 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink92:setParent(obj.layout26);
    obj.dataLink92:setField("SlotActive6");
    obj.dataLink92:setDefaultValue("false");
    obj.dataLink92:setName("dataLink92");

    obj.dataLink93 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink93:setParent(obj.layout26);
    obj.dataLink93:setField("SlotActive7");
    obj.dataLink93:setDefaultValue("true");
    obj.dataLink93:setName("dataLink93");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle24);
    obj.layout27:setLeft(470);
    obj.layout27:setTop(340);
    obj.layout27:setHeight(600);
    obj.layout27:setWidth(1000);
    obj.layout27:setName("layout27");

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.layout27);
    obj.image35:setLeft(000);
    obj.image35:setTop(000);
    obj.image35:setWidth(40);
    obj.image35:setHeight(40);
    obj.image35:setSRC("/img/normal2.gif");
    obj.image35:setName("image35");

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.layout27);
    obj.image36:setLeft(045);
    obj.image36:setTop(000);
    obj.image36:setWidth(40);
    obj.image36:setHeight(40);
    obj.image36:setSRC("/img/fire2.gif");
    obj.image36:setName("image36");

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.layout27);
    obj.image37:setLeft(090);
    obj.image37:setTop(000);
    obj.image37:setWidth(40);
    obj.image37:setHeight(40);
    obj.image37:setSRC("/img/water2.gif");
    obj.image37:setName("image37");

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.layout27);
    obj.image38:setLeft(135);
    obj.image38:setTop(000);
    obj.image38:setWidth(40);
    obj.image38:setHeight(40);
    obj.image38:setSRC("/img/electric2.gif");
    obj.image38:setName("image38");

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.layout27);
    obj.image39:setLeft(180);
    obj.image39:setTop(000);
    obj.image39:setWidth(40);
    obj.image39:setHeight(40);
    obj.image39:setSRC("/img/grass2.gif");
    obj.image39:setName("image39");

    obj.image40 = GUI.fromHandle(_obj_newObject("image"));
    obj.image40:setParent(obj.layout27);
    obj.image40:setLeft(225);
    obj.image40:setTop(000);
    obj.image40:setWidth(40);
    obj.image40:setHeight(40);
    obj.image40:setSRC("/img/ice2.gif");
    obj.image40:setName("image40");

    obj.image41 = GUI.fromHandle(_obj_newObject("image"));
    obj.image41:setParent(obj.layout27);
    obj.image41:setLeft(270);
    obj.image41:setTop(000);
    obj.image41:setWidth(40);
    obj.image41:setHeight(40);
    obj.image41:setSRC("/img/fighting2.gif");
    obj.image41:setName("image41");

    obj.image42 = GUI.fromHandle(_obj_newObject("image"));
    obj.image42:setParent(obj.layout27);
    obj.image42:setLeft(315);
    obj.image42:setTop(000);
    obj.image42:setWidth(40);
    obj.image42:setHeight(40);
    obj.image42:setSRC("/img/poison2.gif");
    obj.image42:setName("image42");

    obj.image43 = GUI.fromHandle(_obj_newObject("image"));
    obj.image43:setParent(obj.layout27);
    obj.image43:setLeft(360);
    obj.image43:setTop(000);
    obj.image43:setWidth(40);
    obj.image43:setHeight(40);
    obj.image43:setSRC("/img/ground2.gif");
    obj.image43:setName("image43");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout27);
    obj.edit154:setLeft(000);
    obj.edit154:setTop(045);
    obj.edit154:setHeight(20);
    obj.edit154:setWidth(40);
    obj.edit154:setField("weakTot1");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setEnabled(true);
    obj.edit154:setName("edit154");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout27);
    obj.edit155:setLeft(045);
    obj.edit155:setTop(045);
    obj.edit155:setHeight(20);
    obj.edit155:setWidth(40);
    obj.edit155:setField("weakTot2");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setEnabled(true);
    obj.edit155:setName("edit155");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout27);
    obj.edit156:setLeft(090);
    obj.edit156:setTop(045);
    obj.edit156:setHeight(20);
    obj.edit156:setWidth(40);
    obj.edit156:setField("weakTot3");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setEnabled(true);
    obj.edit156:setName("edit156");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout27);
    obj.edit157:setLeft(135);
    obj.edit157:setTop(045);
    obj.edit157:setHeight(20);
    obj.edit157:setWidth(40);
    obj.edit157:setField("weakTot4");
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setEnabled(true);
    obj.edit157:setName("edit157");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout27);
    obj.edit158:setLeft(180);
    obj.edit158:setTop(045);
    obj.edit158:setHeight(20);
    obj.edit158:setWidth(40);
    obj.edit158:setField("weakTot5");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setEnabled(true);
    obj.edit158:setName("edit158");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout27);
    obj.edit159:setLeft(225);
    obj.edit159:setTop(045);
    obj.edit159:setHeight(20);
    obj.edit159:setWidth(40);
    obj.edit159:setField("weakTot6");
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setEnabled(true);
    obj.edit159:setName("edit159");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout27);
    obj.edit160:setLeft(270);
    obj.edit160:setTop(045);
    obj.edit160:setHeight(20);
    obj.edit160:setWidth(40);
    obj.edit160:setField("weakTot7");
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setEnabled(true);
    obj.edit160:setName("edit160");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout27);
    obj.edit161:setLeft(315);
    obj.edit161:setTop(045);
    obj.edit161:setHeight(20);
    obj.edit161:setWidth(40);
    obj.edit161:setField("weakTot8");
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setEnabled(true);
    obj.edit161:setName("edit161");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout27);
    obj.edit162:setLeft(360);
    obj.edit162:setTop(045);
    obj.edit162:setHeight(20);
    obj.edit162:setWidth(40);
    obj.edit162:setField("weakTot9");
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setEnabled(true);
    obj.edit162:setName("edit162");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle24);
    obj.layout28:setLeft(065);
    obj.layout28:setTop(430);
    obj.layout28:setHeight(600);
    obj.layout28:setWidth(1000);
    obj.layout28:setName("layout28");

    obj.image44 = GUI.fromHandle(_obj_newObject("image"));
    obj.image44:setParent(obj.layout28);
    obj.image44:setLeft(405);
    obj.image44:setTop(000);
    obj.image44:setWidth(40);
    obj.image44:setHeight(40);
    obj.image44:setSRC("/img/flying2.gif");
    obj.image44:setName("image44");

    obj.image45 = GUI.fromHandle(_obj_newObject("image"));
    obj.image45:setParent(obj.layout28);
    obj.image45:setLeft(450);
    obj.image45:setTop(000);
    obj.image45:setWidth(40);
    obj.image45:setHeight(40);
    obj.image45:setSRC("/img/psychic2.gif");
    obj.image45:setName("image45");

    obj.image46 = GUI.fromHandle(_obj_newObject("image"));
    obj.image46:setParent(obj.layout28);
    obj.image46:setLeft(495);
    obj.image46:setTop(000);
    obj.image46:setWidth(40);
    obj.image46:setHeight(40);
    obj.image46:setSRC("/img/bug2.gif");
    obj.image46:setName("image46");

    obj.image47 = GUI.fromHandle(_obj_newObject("image"));
    obj.image47:setParent(obj.layout28);
    obj.image47:setLeft(540);
    obj.image47:setTop(000);
    obj.image47:setWidth(40);
    obj.image47:setHeight(40);
    obj.image47:setSRC("/img/rock2.gif");
    obj.image47:setName("image47");

    obj.image48 = GUI.fromHandle(_obj_newObject("image"));
    obj.image48:setParent(obj.layout28);
    obj.image48:setLeft(585);
    obj.image48:setTop(000);
    obj.image48:setWidth(40);
    obj.image48:setHeight(40);
    obj.image48:setSRC("/img/ghost2.gif");
    obj.image48:setName("image48");

    obj.image49 = GUI.fromHandle(_obj_newObject("image"));
    obj.image49:setParent(obj.layout28);
    obj.image49:setLeft(630);
    obj.image49:setTop(000);
    obj.image49:setWidth(40);
    obj.image49:setHeight(40);
    obj.image49:setSRC("/img/dragon2.gif");
    obj.image49:setName("image49");

    obj.image50 = GUI.fromHandle(_obj_newObject("image"));
    obj.image50:setParent(obj.layout28);
    obj.image50:setLeft(675);
    obj.image50:setTop(000);
    obj.image50:setWidth(40);
    obj.image50:setHeight(40);
    obj.image50:setSRC("/img/dark2.gif");
    obj.image50:setName("image50");

    obj.image51 = GUI.fromHandle(_obj_newObject("image"));
    obj.image51:setParent(obj.layout28);
    obj.image51:setLeft(720);
    obj.image51:setTop(000);
    obj.image51:setWidth(40);
    obj.image51:setHeight(40);
    obj.image51:setSRC("/img/steel2.gif");
    obj.image51:setName("image51");

    obj.image52 = GUI.fromHandle(_obj_newObject("image"));
    obj.image52:setParent(obj.layout28);
    obj.image52:setLeft(765);
    obj.image52:setTop(000);
    obj.image52:setWidth(40);
    obj.image52:setHeight(40);
    obj.image52:setSRC("/img/fairy2.gif");
    obj.image52:setName("image52");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout28);
    obj.edit163:setLeft(405);
    obj.edit163:setTop(045);
    obj.edit163:setHeight(20);
    obj.edit163:setWidth(40);
    obj.edit163:setField("weakTot10");
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setEnabled(true);
    obj.edit163:setName("edit163");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout28);
    obj.edit164:setLeft(450);
    obj.edit164:setTop(045);
    obj.edit164:setHeight(20);
    obj.edit164:setWidth(40);
    obj.edit164:setField("weakTot11");
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setEnabled(true);
    obj.edit164:setName("edit164");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout28);
    obj.edit165:setLeft(495);
    obj.edit165:setTop(045);
    obj.edit165:setHeight(20);
    obj.edit165:setWidth(40);
    obj.edit165:setField("weakTot12");
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setEnabled(true);
    obj.edit165:setName("edit165");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout28);
    obj.edit166:setLeft(540);
    obj.edit166:setTop(045);
    obj.edit166:setHeight(20);
    obj.edit166:setWidth(40);
    obj.edit166:setField("weakTot13");
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setEnabled(true);
    obj.edit166:setName("edit166");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout28);
    obj.edit167:setLeft(585);
    obj.edit167:setTop(045);
    obj.edit167:setHeight(20);
    obj.edit167:setWidth(40);
    obj.edit167:setField("weakTot14");
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setEnabled(true);
    obj.edit167:setName("edit167");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout28);
    obj.edit168:setLeft(630);
    obj.edit168:setTop(045);
    obj.edit168:setHeight(20);
    obj.edit168:setWidth(40);
    obj.edit168:setField("weakTot15");
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setEnabled(true);
    obj.edit168:setName("edit168");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout28);
    obj.edit169:setLeft(675);
    obj.edit169:setTop(045);
    obj.edit169:setHeight(20);
    obj.edit169:setWidth(40);
    obj.edit169:setField("weakTot16");
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setEnabled(true);
    obj.edit169:setName("edit169");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout28);
    obj.edit170:setLeft(720);
    obj.edit170:setTop(045);
    obj.edit170:setHeight(20);
    obj.edit170:setWidth(40);
    obj.edit170:setField("weakTot17");
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setEnabled(true);
    obj.edit170:setName("edit170");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout28);
    obj.edit171:setLeft(765);
    obj.edit171:setTop(045);
    obj.edit171:setHeight(20);
    obj.edit171:setWidth(40);
    obj.edit171:setField("weakTot18");
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setEnabled(true);
    obj.edit171:setName("edit171");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle24);
    obj.layout29:setLeft(10);
    obj.layout29:setTop(180);
    obj.layout29:setHeight(500);
    obj.layout29:setWidth(340);
    obj.layout29:setName("layout29");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout29);
    obj.label98:setLeft(000);
    obj.label98:setTop(00);
    obj.label98:setHeight(20);
    obj.label98:setWidth(40);
    obj.label98:setText("Hab.");
    obj.label98:setAutoSize(true);
    obj.label98:setFontColor("White");
    obj.label98:setFontSize(14);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setHint("Habilidade");
    obj.label98:setName("label98");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout29);
    obj.edit172:setVertTextAlign("center");
    obj.edit172:setLeft(40);
    obj.edit172:setTop(00);
    obj.edit172:setWidth(150);
    obj.edit172:setHeight(25);
    obj.edit172:setField("nomeHab");
    obj.edit172:setName("edit172");

    obj.BotaoHab = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoHab:setParent(obj.layout29);
    obj.BotaoHab:setLeft(200);
    obj.BotaoHab:setTop(00);
    obj.BotaoHab:setWidth(23);
    obj.BotaoHab:setHeight(25);
    obj.BotaoHab:setText("i");
    obj.BotaoHab:setName("BotaoHab");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout29);
    obj.label99:setLeft(000);
    obj.label99:setTop(30);
    obj.label99:setHeight(20);
    obj.label99:setWidth(40);
    obj.label99:setText("Item");
    obj.label99:setAutoSize(true);
    obj.label99:setFontColor("White");
    obj.label99:setFontSize(14);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout29);
    obj.edit173:setVertTextAlign("center");
    obj.edit173:setLeft(040);
    obj.edit173:setTop(30);
    obj.edit173:setWidth(150);
    obj.edit173:setHeight(25);
    obj.edit173:setField("nomeItem2");
    obj.edit173:setName("edit173");

    obj.BotaoItemB = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoItemB:setParent(obj.layout29);
    obj.BotaoItemB:setLeft(200);
    obj.BotaoItemB:setTop(30);
    obj.BotaoItemB:setWidth(23);
    obj.BotaoItemB:setHeight(25);
    obj.BotaoItemB:setText("i");
    obj.BotaoItemB:setName("BotaoItemB");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle24);
    obj.layout30:setLeft(50);
    obj.layout30:setTop(240);
    obj.layout30:setHeight(500);
    obj.layout30:setWidth(340);
    obj.layout30:setName("layout30");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout30);
    obj.label100:setLeft(000);
    obj.label100:setTop(000);
    obj.label100:setHeight(20);
    obj.label100:setWidth(180);
    obj.label100:setText("Bônus de Exp");
    obj.label100:setAutoSize(true);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout30);
    obj.label101:setLeft(000);
    obj.label101:setTop(25);
    obj.label101:setHeight(20);
    obj.label101:setWidth(100);
    obj.label101:setText("ESP.AF");
    obj.label101:setAutoSize(true);
    lfm_setPropAsString(obj.label101, "fontStyle",  "bold");
    obj.label101:setName("label101");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout30);
    obj.edit174:setLeft(105);
    obj.edit174:setTop(25);
    obj.edit174:setHeight(20);
    obj.edit174:setWidth(75);
    obj.edit174:setField("baspokEXPAF");
    obj.edit174:setHorzTextAlign("center");
    obj.edit174:setType("number");
    obj.edit174:setName("edit174");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout30);
    obj.label102:setLeft(000);
    obj.label102:setTop(50);
    obj.label102:setHeight(20);
    obj.label102:setWidth(100);
    obj.label102:setText("Outros");
    obj.label102:setAutoSize(true);
    lfm_setPropAsString(obj.label102, "fontStyle",  "bold");
    obj.label102:setName("label102");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout30);
    obj.edit175:setLeft(105);
    obj.edit175:setTop(50);
    obj.edit175:setHeight(20);
    obj.edit175:setWidth(75);
    obj.edit175:setField("baspokOutros");
    obj.edit175:setHorzTextAlign("center");
    obj.edit175:setType("number");
    obj.edit175:setName("edit175");

    obj.dataLink94 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink94:setParent(obj.frmPokemon2);
    obj.dataLink94:setFields({'campoElem1', 'campoElem2'});
    obj.dataLink94:setName("dataLink94");

    obj.dataLink95 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink95:setParent(obj.frmPokemon2);
    obj.dataLink95:setFields({	'pokeLevel', 'Vida_Base1','Vida_Bon1','Vida_Nivel','Vida_Vit','basSEX','campoApelido','campoNome',
						'Ataque_Base1', 'Ataque_Bon1', 'Ataque_Bon2','Ataque_Nivel','Ataque_Vit','Ataque_edc','campoPokemon',
						'Defesa_Base1', 'Defesa_Bon1', 'Defesa_Bon2','Defesa_Nivel','Defesa_Vit','Defesa_edc', 'atupokAXP',
						'AtaqueEsp_Base1', 'AtaqueEsp_Bon1', 'AtaqueEsp_Bon2','AtaqueEsp_Nivel','AtaqueEsp_Vit','AtaqueEsp_edc',
						'DefesaEsp_Base1', 'DefesaEsp_Bon1', 'DefesaEsp_Bon2','DefesaEsp_Nivel','DefesaEsp_Vit','DefesaEsp_edc',
						'Velocidade_Nivel','Velocidade_Base1','Velocidade_Bon1','Velocidade_Bon2','Velocidade_Vit','Velocidade_edc',
						'pok_bonEVAF', 'pok_bonEVAE', 'pok_bonEVAV', 'pok_bonINI','Treino_Bonus', 'MegaEvo', 'active','baseHPAtual', 'baseHPMAX',
						'SlotActive1', 'SlotActive2', 'SlotActive3', 'SlotActive4', 'SlotActive5', 'SlotActive6', 'SlotActive7'});
    obj.dataLink95:setName("dataLink95");

    obj.dataLink96 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink96:setParent(obj.frmPokemon2);
    obj.dataLink96:setFields({'campoNatPlus', 'campoNatMinus'});
    obj.dataLink96:setName("dataLink96");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl2);
    obj.tab4:setTitle("Golpes");
    obj.tab4:setName("tab4");

    obj.frmPokemon3 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPokemon3:setParent(obj.tab4);
    obj.frmPokemon3:setName("frmPokemon3");
    obj.frmPokemon3:setAlign("client");
    obj.frmPokemon3:setTheme("dark");
    obj.frmPokemon3:setMargins({top=1});

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmPokemon3);
    obj.scrollBox4:setAlign("left");
    obj.scrollBox4:setWidth(880);
    obj.scrollBox4:setName("scrollBox4");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox4);
    obj.layout31:setLeft(0);
    obj.layout31:setTop(0);
    obj.layout31:setWidth(864);
    obj.layout31:setHeight(953);
    obj.layout31:setName("layout31");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout31);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("#0000007F");
    obj.rectangle27:setName("rectangle27");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout31);
    obj.layout32:setLeft(2);
    obj.layout32:setTop(2);
    obj.layout32:setWidth(880);
    obj.layout32:setHeight(92);
    obj.layout32:setName("layout32");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout32);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setName("rectangle28");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout32);
    obj.label103:setLeft(5);
    obj.label103:setTop(5);
    obj.label103:setWidth(70);
    obj.label103:setHeight(25);
    obj.label103:setText("Golpe 1");
    obj.label103:setName("label103");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout32);
    obj.edit176:setVertTextAlign("center");
    obj.edit176:setLeft(75);
    obj.edit176:setTop(5);
    obj.edit176:setWidth(160);
    obj.edit176:setHeight(25);
    obj.edit176:setField("golpeP1");
    obj.edit176:setName("edit176");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout32);
    obj.label104:setLeft(5);
    obj.label104:setTop(30);
    obj.label104:setWidth(80);
    obj.label104:setHeight(25);
    obj.label104:setText("Tipo");
    obj.label104:setName("label104");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout32);
    obj.comboBox17:setLeft(75);
    obj.comboBox17:setTop(32);
    obj.comboBox17:setWidth(90);
    obj.comboBox17:setHeight(20);
    obj.comboBox17:setField("campoElem31");
    obj.comboBox17:setHorzTextAlign("leading");
    obj.comboBox17:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox17:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox17:setName("comboBox17");

    obj.dataLink97 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink97:setParent(obj.layout32);
    obj.dataLink97:setField("campoElem31");
    obj.dataLink97:setDefaultValue("19");
    obj.dataLink97:setName("dataLink97");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout32);
    obj.label105:setLeft(170);
    obj.label105:setTop(32);
    obj.label105:setWidth(10);
    obj.label105:setHeight(25);
    obj.label105:setText("Z:");
    obj.label105:setName("label105");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout32);
    obj.edit177:setVertTextAlign("center");
    obj.edit177:setLeft(190);
    obj.edit177:setTop(32);
    obj.edit177:setWidth(45);
    obj.edit177:setHeight(25);
    obj.edit177:setField("danoZ1");
    obj.edit177:setHint("Poder do golpe Z");
    obj.edit177:setName("edit177");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout32);
    obj.label106:setLeft(5);
    obj.label106:setTop(55);
    obj.label106:setWidth(80);
    obj.label106:setHeight(25);
    obj.label106:setText("ACP/ACS(%)");
    obj.label106:setName("label106");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout32);
    obj.edit178:setVertTextAlign("center");
    obj.edit178:setLeft(75);
    obj.edit178:setTop(55);
    obj.edit178:setWidth(75);
    obj.edit178:setHeight(25);
    obj.edit178:setField("ACP1");
    obj.edit178:setHint("Acerto Primário");
    obj.edit178:setType("number");
    obj.edit178:setHorzTextAlign("center");
    obj.edit178:setName("edit178");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout32);
    obj.edit179:setVertTextAlign("center");
    obj.edit179:setLeft(160);
    obj.edit179:setTop(55);
    obj.edit179:setWidth(75);
    obj.edit179:setHeight(25);
    obj.edit179:setField("ACS1");
    obj.edit179:setHint("Acerto Secundário");
    obj.edit179:setType("number");
    obj.edit179:setHorzTextAlign("center");
    obj.edit179:setName("edit179");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout32);
    obj.label107:setLeft(240);
    obj.label107:setTop(6);
    obj.label107:setWidth(50);
    obj.label107:setHeight(25);
    obj.label107:setText("Classe");
    obj.label107:setName("label107");

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout32);
    obj.comboBox18:setLeft(282);
    obj.comboBox18:setTop(6);
    obj.comboBox18:setWidth(82);
    obj.comboBox18:setHeight(25);
    obj.comboBox18:setField("classeP1");
    obj.comboBox18:setHorzTextAlign("center");
    obj.comboBox18:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox18:setValues({'1', '2', '3'});
    obj.comboBox18:setName("comboBox18");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout32);
    obj.label108:setLeft(240);
    obj.label108:setTop(31);
    obj.label108:setWidth(50);
    obj.label108:setHeight(25);
    obj.label108:setText("Cont.");
    obj.label108:setName("label108");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout32);
    obj.edit180:setVertTextAlign("center");
    obj.edit180:setLeft(282);
    obj.edit180:setTop(31);
    obj.edit180:setWidth(82);
    obj.edit180:setHeight(25);
    obj.edit180:setField("contP1");
    obj.edit180:setHint("Contato");
    obj.edit180:setHorzTextAlign("center");
    obj.edit180:setName("edit180");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout32);
    obj.label109:setLeft(240);
    obj.label109:setTop(55);
    obj.label109:setWidth(50);
    obj.label109:setHeight(25);
    obj.label109:setText("Área");
    obj.label109:setName("label109");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout32);
    obj.edit181:setVertTextAlign("center");
    obj.edit181:setLeft(282);
    obj.edit181:setTop(55);
    obj.edit181:setWidth(82);
    obj.edit181:setHeight(25);
    obj.edit181:setField("Area1");
    obj.edit181:setHorzTextAlign("center");
    obj.edit181:setName("edit181");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout32);
    obj.label110:setLeft(370);
    obj.label110:setTop(6);
    obj.label110:setWidth(70);
    obj.label110:setHeight(25);
    obj.label110:setText("Prioridade");
    obj.label110:setName("label110");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout32);
    obj.edit182:setVertTextAlign("center");
    obj.edit182:setLeft(443);
    obj.edit182:setTop(6);
    obj.edit182:setWidth(42);
    obj.edit182:setHeight(25);
    obj.edit182:setField("prioP1");
    obj.edit182:setHorzTextAlign("center");
    obj.edit182:setName("edit182");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout32);
    obj.label111:setLeft(370);
    obj.label111:setTop(31);
    obj.label111:setWidth(70);
    obj.label111:setHeight(25);
    obj.label111:setText("Poder");
    obj.label111:setName("label111");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout32);
    obj.edit183:setVertTextAlign("center");
    obj.edit183:setLeft(443);
    obj.edit183:setTop(31);
    obj.edit183:setWidth(42);
    obj.edit183:setHeight(25);
    obj.edit183:setField("danoP1");
    obj.edit183:setHorzTextAlign("center");
    obj.edit183:setType("number");
    obj.edit183:setName("edit183");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout32);
    obj.label112:setLeft(370);
    obj.label112:setTop(55);
    obj.label112:setWidth(70);
    obj.label112:setHeight(25);
    obj.label112:setText("Dano Bôn.");
    obj.label112:setName("label112");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout32);
    obj.edit184:setVertTextAlign("center");
    obj.edit184:setLeft(443);
    obj.edit184:setTop(55);
    obj.edit184:setWidth(42);
    obj.edit184:setHeight(25);
    obj.edit184:setField("BonDMGP1");
    obj.edit184:setHorzTextAlign("center");
    obj.edit184:setType("number");
    obj.edit184:setName("edit184");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout32);
    obj.button11:setLeft(488);
    obj.button11:setTop(6);
    obj.button11:setWidth(82);
    obj.button11:setText("Acerto");
    obj.button11:setFontSize(11);
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout32);
    obj.button12:setLeft(488);
    obj.button12:setTop(31);
    obj.button12:setWidth(82);
    obj.button12:setText("A. Seguido");
    obj.button12:setFontSize(11);
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout32);
    obj.button13:setLeft(488);
    obj.button13:setTop(55);
    obj.button13:setWidth(82);
    obj.button13:setText("Golpe Z");
    obj.button13:setFontSize(11);
    obj.button13:setName("button13");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout32);
    obj.textEditor3:setLeft(575);
    obj.textEditor3:setTop(5);
    obj.textEditor3:setWidth(280);
    obj.textEditor3:setHeight(50);
    obj.textEditor3:setField("campoEfeitoGolpesP1");
    obj.textEditor3:setName("textEditor3");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout32);
    obj.label113:setLeft(575);
    obj.label113:setTop(55);
    obj.label113:setWidth(50);
    obj.label113:setHeight(25);
    obj.label113:setText("M.Crit.");
    obj.label113:setName("label113");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout32);
    obj.edit185:setVertTextAlign("center");
    obj.edit185:setLeft(630);
    obj.edit185:setTop(55);
    obj.edit185:setWidth(50);
    obj.edit185:setHeight(25);
    obj.edit185:setField("MCRIT1");
    obj.edit185:setHint("Margem de Crítico");
    obj.edit185:setHorzTextAlign("center");
    obj.edit185:setType("number");
    obj.edit185:setName("edit185");

    obj.dataLink98 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink98:setParent(obj.layout32);
    obj.dataLink98:setField("BCRIT1");
    obj.dataLink98:setDefaultValue("10");
    obj.dataLink98:setName("dataLink98");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout32);
    obj.label114:setLeft(685);
    obj.label114:setTop(55);
    obj.label114:setWidth(50);
    obj.label114:setHeight(25);
    obj.label114:setText("Efeito");
    obj.label114:setName("label114");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout32);
    obj.edit186:setVertTextAlign("center");
    obj.edit186:setLeft(740);
    obj.edit186:setTop(55);
    obj.edit186:setWidth(80);
    obj.edit186:setHeight(25);
    obj.edit186:setField("EFF1");
    obj.edit186:setHint("Efeito Causado");
    obj.edit186:setHorzTextAlign("center");
    obj.edit186:setName("edit186");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout32);
    obj.edit187:setVertTextAlign("center");
    obj.edit187:setLeft(825);
    obj.edit187:setTop(55);
    obj.edit187:setWidth(30);
    obj.edit187:setHeight(25);
    obj.edit187:setField("MARGEF1");
    obj.edit187:setHint("Margem");
    obj.edit187:setHorzTextAlign("center");
    obj.edit187:setType("number");
    obj.edit187:setName("edit187");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout31);
    obj.layout33:setLeft(2);
    obj.layout33:setTop(97);
    obj.layout33:setWidth(880);
    obj.layout33:setHeight(92);
    obj.layout33:setName("layout33");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout33);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setName("rectangle29");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout33);
    obj.label115:setLeft(5);
    obj.label115:setTop(5);
    obj.label115:setWidth(70);
    obj.label115:setHeight(25);
    obj.label115:setText("Golpe 2");
    obj.label115:setName("label115");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout33);
    obj.edit188:setVertTextAlign("center");
    obj.edit188:setLeft(75);
    obj.edit188:setTop(5);
    obj.edit188:setWidth(160);
    obj.edit188:setHeight(25);
    obj.edit188:setField("golpeP2");
    obj.edit188:setName("edit188");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout33);
    obj.label116:setLeft(5);
    obj.label116:setTop(30);
    obj.label116:setWidth(80);
    obj.label116:setHeight(25);
    obj.label116:setText("Tipo");
    obj.label116:setName("label116");

    obj.comboBox19 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout33);
    obj.comboBox19:setLeft(75);
    obj.comboBox19:setTop(32);
    obj.comboBox19:setWidth(90);
    obj.comboBox19:setHeight(20);
    obj.comboBox19:setField("campoElem32");
    obj.comboBox19:setHorzTextAlign("leading");
    obj.comboBox19:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox19:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox19:setName("comboBox19");

    obj.dataLink99 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink99:setParent(obj.layout33);
    obj.dataLink99:setField("campoElem32");
    obj.dataLink99:setDefaultValue("19");
    obj.dataLink99:setName("dataLink99");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout33);
    obj.label117:setLeft(170);
    obj.label117:setTop(32);
    obj.label117:setWidth(10);
    obj.label117:setHeight(25);
    obj.label117:setText("Z:");
    obj.label117:setName("label117");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout33);
    obj.edit189:setVertTextAlign("center");
    obj.edit189:setLeft(190);
    obj.edit189:setTop(32);
    obj.edit189:setWidth(45);
    obj.edit189:setHeight(25);
    obj.edit189:setField("danoZ2");
    obj.edit189:setHint("Poder do golpe Z");
    obj.edit189:setName("edit189");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout33);
    obj.label118:setLeft(5);
    obj.label118:setTop(55);
    obj.label118:setWidth(80);
    obj.label118:setHeight(25);
    obj.label118:setText("ACP/ACS(%)");
    obj.label118:setName("label118");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout33);
    obj.edit190:setVertTextAlign("center");
    obj.edit190:setLeft(75);
    obj.edit190:setTop(55);
    obj.edit190:setWidth(75);
    obj.edit190:setHeight(25);
    obj.edit190:setField("ACP2");
    obj.edit190:setHint("Acerto Primário");
    obj.edit190:setType("number");
    obj.edit190:setHorzTextAlign("center");
    obj.edit190:setName("edit190");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout33);
    obj.edit191:setVertTextAlign("center");
    obj.edit191:setLeft(160);
    obj.edit191:setTop(55);
    obj.edit191:setWidth(75);
    obj.edit191:setHeight(25);
    obj.edit191:setField("ACS2");
    obj.edit191:setHint("Acerto Secundário");
    obj.edit191:setType("number");
    obj.edit191:setHorzTextAlign("center");
    obj.edit191:setName("edit191");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout33);
    obj.label119:setLeft(240);
    obj.label119:setTop(6);
    obj.label119:setWidth(50);
    obj.label119:setHeight(25);
    obj.label119:setText("Classe");
    obj.label119:setName("label119");

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout33);
    obj.comboBox20:setLeft(282);
    obj.comboBox20:setTop(6);
    obj.comboBox20:setWidth(82);
    obj.comboBox20:setHeight(25);
    obj.comboBox20:setField("classeP2");
    obj.comboBox20:setHorzTextAlign("center");
    obj.comboBox20:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox20:setValues({'1', '2', '3'});
    obj.comboBox20:setName("comboBox20");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout33);
    obj.label120:setLeft(240);
    obj.label120:setTop(31);
    obj.label120:setWidth(50);
    obj.label120:setHeight(25);
    obj.label120:setText("Cont.");
    obj.label120:setName("label120");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout33);
    obj.edit192:setVertTextAlign("center");
    obj.edit192:setLeft(282);
    obj.edit192:setTop(31);
    obj.edit192:setWidth(82);
    obj.edit192:setHeight(25);
    obj.edit192:setField("contP2");
    obj.edit192:setHint("Contato");
    obj.edit192:setHorzTextAlign("center");
    obj.edit192:setName("edit192");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout33);
    obj.label121:setLeft(240);
    obj.label121:setTop(55);
    obj.label121:setWidth(50);
    obj.label121:setHeight(25);
    obj.label121:setText("Área");
    obj.label121:setName("label121");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout33);
    obj.edit193:setVertTextAlign("center");
    obj.edit193:setLeft(282);
    obj.edit193:setTop(55);
    obj.edit193:setWidth(82);
    obj.edit193:setHeight(25);
    obj.edit193:setField("Area2");
    obj.edit193:setHorzTextAlign("center");
    obj.edit193:setName("edit193");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout33);
    obj.label122:setLeft(370);
    obj.label122:setTop(6);
    obj.label122:setWidth(70);
    obj.label122:setHeight(25);
    obj.label122:setText("Prioridade");
    obj.label122:setName("label122");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout33);
    obj.edit194:setVertTextAlign("center");
    obj.edit194:setLeft(443);
    obj.edit194:setTop(6);
    obj.edit194:setWidth(42);
    obj.edit194:setHeight(25);
    obj.edit194:setField("prioP2");
    obj.edit194:setHorzTextAlign("center");
    obj.edit194:setName("edit194");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout33);
    obj.label123:setLeft(370);
    obj.label123:setTop(31);
    obj.label123:setWidth(70);
    obj.label123:setHeight(25);
    obj.label123:setText("Poder");
    obj.label123:setName("label123");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout33);
    obj.edit195:setVertTextAlign("center");
    obj.edit195:setLeft(443);
    obj.edit195:setTop(31);
    obj.edit195:setWidth(42);
    obj.edit195:setHeight(25);
    obj.edit195:setField("danoP2");
    obj.edit195:setHorzTextAlign("center");
    obj.edit195:setType("number");
    obj.edit195:setName("edit195");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout33);
    obj.label124:setLeft(370);
    obj.label124:setTop(55);
    obj.label124:setWidth(70);
    obj.label124:setHeight(25);
    obj.label124:setText("Dano Bôn.");
    obj.label124:setName("label124");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout33);
    obj.edit196:setVertTextAlign("center");
    obj.edit196:setLeft(443);
    obj.edit196:setTop(55);
    obj.edit196:setWidth(42);
    obj.edit196:setHeight(25);
    obj.edit196:setField("BonDMGP2");
    obj.edit196:setHorzTextAlign("center");
    obj.edit196:setType("number");
    obj.edit196:setName("edit196");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout33);
    obj.button14:setLeft(488);
    obj.button14:setTop(6);
    obj.button14:setWidth(82);
    obj.button14:setText("Acerto");
    obj.button14:setFontSize(11);
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout33);
    obj.button15:setLeft(488);
    obj.button15:setTop(31);
    obj.button15:setWidth(82);
    obj.button15:setText("A. Seguido");
    obj.button15:setFontSize(11);
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout33);
    obj.button16:setLeft(488);
    obj.button16:setTop(55);
    obj.button16:setWidth(82);
    obj.button16:setText("Golpe Z");
    obj.button16:setFontSize(11);
    obj.button16:setName("button16");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout33);
    obj.textEditor4:setLeft(575);
    obj.textEditor4:setTop(5);
    obj.textEditor4:setWidth(280);
    obj.textEditor4:setHeight(50);
    obj.textEditor4:setField("campoEfeitoGolpesP2");
    obj.textEditor4:setName("textEditor4");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout33);
    obj.label125:setLeft(575);
    obj.label125:setTop(55);
    obj.label125:setWidth(50);
    obj.label125:setHeight(25);
    obj.label125:setText("M.Crit.");
    obj.label125:setName("label125");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout33);
    obj.edit197:setVertTextAlign("center");
    obj.edit197:setLeft(630);
    obj.edit197:setTop(55);
    obj.edit197:setWidth(50);
    obj.edit197:setHeight(25);
    obj.edit197:setField("MCRIT2");
    obj.edit197:setHint("Margem de Crítico");
    obj.edit197:setHorzTextAlign("center");
    obj.edit197:setType("number");
    obj.edit197:setName("edit197");

    obj.dataLink100 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink100:setParent(obj.layout33);
    obj.dataLink100:setField("BCRIT2");
    obj.dataLink100:setDefaultValue("10");
    obj.dataLink100:setName("dataLink100");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout33);
    obj.label126:setLeft(685);
    obj.label126:setTop(55);
    obj.label126:setWidth(50);
    obj.label126:setHeight(25);
    obj.label126:setText("Efeito");
    obj.label126:setName("label126");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout33);
    obj.edit198:setVertTextAlign("center");
    obj.edit198:setLeft(740);
    obj.edit198:setTop(55);
    obj.edit198:setWidth(80);
    obj.edit198:setHeight(25);
    obj.edit198:setField("EFF2");
    obj.edit198:setHint("Efeito Causado");
    obj.edit198:setHorzTextAlign("center");
    obj.edit198:setName("edit198");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout33);
    obj.edit199:setVertTextAlign("center");
    obj.edit199:setLeft(825);
    obj.edit199:setTop(55);
    obj.edit199:setWidth(30);
    obj.edit199:setHeight(25);
    obj.edit199:setField("MARGEF2");
    obj.edit199:setHint("Margem");
    obj.edit199:setHorzTextAlign("center");
    obj.edit199:setType("number");
    obj.edit199:setName("edit199");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout31);
    obj.layout34:setLeft(2);
    obj.layout34:setTop(192);
    obj.layout34:setWidth(880);
    obj.layout34:setHeight(92);
    obj.layout34:setName("layout34");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout34);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout34);
    obj.label127:setLeft(5);
    obj.label127:setTop(5);
    obj.label127:setWidth(70);
    obj.label127:setHeight(25);
    obj.label127:setText("Golpe 3");
    obj.label127:setName("label127");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout34);
    obj.edit200:setVertTextAlign("center");
    obj.edit200:setLeft(75);
    obj.edit200:setTop(5);
    obj.edit200:setWidth(160);
    obj.edit200:setHeight(25);
    obj.edit200:setField("golpeP3");
    obj.edit200:setName("edit200");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout34);
    obj.label128:setLeft(5);
    obj.label128:setTop(30);
    obj.label128:setWidth(80);
    obj.label128:setHeight(25);
    obj.label128:setText("Tipo");
    obj.label128:setName("label128");

    obj.comboBox21 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout34);
    obj.comboBox21:setLeft(75);
    obj.comboBox21:setTop(32);
    obj.comboBox21:setWidth(90);
    obj.comboBox21:setHeight(20);
    obj.comboBox21:setField("campoElem33");
    obj.comboBox21:setHorzTextAlign("leading");
    obj.comboBox21:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox21:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox21:setName("comboBox21");

    obj.dataLink101 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink101:setParent(obj.layout34);
    obj.dataLink101:setField("campoElem33");
    obj.dataLink101:setDefaultValue("19");
    obj.dataLink101:setName("dataLink101");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout34);
    obj.label129:setLeft(170);
    obj.label129:setTop(32);
    obj.label129:setWidth(10);
    obj.label129:setHeight(25);
    obj.label129:setText("Z:");
    obj.label129:setName("label129");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout34);
    obj.edit201:setVertTextAlign("center");
    obj.edit201:setLeft(190);
    obj.edit201:setTop(32);
    obj.edit201:setWidth(45);
    obj.edit201:setHeight(25);
    obj.edit201:setField("danoZ3");
    obj.edit201:setHint("Poder do golpe Z");
    obj.edit201:setName("edit201");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout34);
    obj.label130:setLeft(5);
    obj.label130:setTop(55);
    obj.label130:setWidth(80);
    obj.label130:setHeight(25);
    obj.label130:setText("ACP/ACS(%)");
    obj.label130:setName("label130");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout34);
    obj.edit202:setVertTextAlign("center");
    obj.edit202:setLeft(75);
    obj.edit202:setTop(55);
    obj.edit202:setWidth(75);
    obj.edit202:setHeight(25);
    obj.edit202:setField("ACP3");
    obj.edit202:setHint("Acerto Primário");
    obj.edit202:setType("number");
    obj.edit202:setHorzTextAlign("center");
    obj.edit202:setName("edit202");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout34);
    obj.edit203:setVertTextAlign("center");
    obj.edit203:setLeft(160);
    obj.edit203:setTop(55);
    obj.edit203:setWidth(75);
    obj.edit203:setHeight(25);
    obj.edit203:setField("ACS3");
    obj.edit203:setHint("Acerto Secundário");
    obj.edit203:setType("number");
    obj.edit203:setHorzTextAlign("center");
    obj.edit203:setName("edit203");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout34);
    obj.label131:setLeft(240);
    obj.label131:setTop(6);
    obj.label131:setWidth(50);
    obj.label131:setHeight(25);
    obj.label131:setText("Classe");
    obj.label131:setName("label131");

    obj.comboBox22 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout34);
    obj.comboBox22:setLeft(282);
    obj.comboBox22:setTop(6);
    obj.comboBox22:setWidth(82);
    obj.comboBox22:setHeight(25);
    obj.comboBox22:setField("classeP3");
    obj.comboBox22:setHorzTextAlign("center");
    obj.comboBox22:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox22:setValues({'1', '2', '3'});
    obj.comboBox22:setName("comboBox22");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout34);
    obj.label132:setLeft(240);
    obj.label132:setTop(31);
    obj.label132:setWidth(50);
    obj.label132:setHeight(25);
    obj.label132:setText("Cont.");
    obj.label132:setName("label132");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout34);
    obj.edit204:setVertTextAlign("center");
    obj.edit204:setLeft(282);
    obj.edit204:setTop(31);
    obj.edit204:setWidth(82);
    obj.edit204:setHeight(25);
    obj.edit204:setField("contP3");
    obj.edit204:setHint("Contato");
    obj.edit204:setHorzTextAlign("center");
    obj.edit204:setName("edit204");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout34);
    obj.label133:setLeft(240);
    obj.label133:setTop(55);
    obj.label133:setWidth(50);
    obj.label133:setHeight(25);
    obj.label133:setText("Área");
    obj.label133:setName("label133");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout34);
    obj.edit205:setVertTextAlign("center");
    obj.edit205:setLeft(282);
    obj.edit205:setTop(55);
    obj.edit205:setWidth(82);
    obj.edit205:setHeight(25);
    obj.edit205:setField("Area3");
    obj.edit205:setHorzTextAlign("center");
    obj.edit205:setName("edit205");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout34);
    obj.label134:setLeft(370);
    obj.label134:setTop(6);
    obj.label134:setWidth(70);
    obj.label134:setHeight(25);
    obj.label134:setText("Prioridade");
    obj.label134:setName("label134");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout34);
    obj.edit206:setVertTextAlign("center");
    obj.edit206:setLeft(443);
    obj.edit206:setTop(6);
    obj.edit206:setWidth(42);
    obj.edit206:setHeight(25);
    obj.edit206:setField("prioP3");
    obj.edit206:setHorzTextAlign("center");
    obj.edit206:setName("edit206");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout34);
    obj.label135:setLeft(370);
    obj.label135:setTop(31);
    obj.label135:setWidth(70);
    obj.label135:setHeight(25);
    obj.label135:setText("Poder");
    obj.label135:setName("label135");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout34);
    obj.edit207:setVertTextAlign("center");
    obj.edit207:setLeft(443);
    obj.edit207:setTop(31);
    obj.edit207:setWidth(42);
    obj.edit207:setHeight(25);
    obj.edit207:setField("danoP3");
    obj.edit207:setHorzTextAlign("center");
    obj.edit207:setType("number");
    obj.edit207:setName("edit207");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout34);
    obj.label136:setLeft(370);
    obj.label136:setTop(55);
    obj.label136:setWidth(70);
    obj.label136:setHeight(25);
    obj.label136:setText("Dano Bôn.");
    obj.label136:setName("label136");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout34);
    obj.edit208:setVertTextAlign("center");
    obj.edit208:setLeft(443);
    obj.edit208:setTop(55);
    obj.edit208:setWidth(42);
    obj.edit208:setHeight(25);
    obj.edit208:setField("BonDMGP3");
    obj.edit208:setHorzTextAlign("center");
    obj.edit208:setType("number");
    obj.edit208:setName("edit208");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout34);
    obj.button17:setLeft(488);
    obj.button17:setTop(6);
    obj.button17:setWidth(82);
    obj.button17:setText("Acerto");
    obj.button17:setFontSize(11);
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout34);
    obj.button18:setLeft(488);
    obj.button18:setTop(31);
    obj.button18:setWidth(82);
    obj.button18:setText("A. Seguido");
    obj.button18:setFontSize(11);
    obj.button18:setName("button18");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout34);
    obj.button19:setLeft(488);
    obj.button19:setTop(55);
    obj.button19:setWidth(82);
    obj.button19:setText("Golpe Z");
    obj.button19:setFontSize(11);
    obj.button19:setName("button19");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout34);
    obj.textEditor5:setLeft(575);
    obj.textEditor5:setTop(5);
    obj.textEditor5:setWidth(280);
    obj.textEditor5:setHeight(50);
    obj.textEditor5:setField("campoEfeitoGolpesP3");
    obj.textEditor5:setName("textEditor5");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout34);
    obj.label137:setLeft(575);
    obj.label137:setTop(55);
    obj.label137:setWidth(50);
    obj.label137:setHeight(25);
    obj.label137:setText("M.Crit.");
    obj.label137:setName("label137");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout34);
    obj.edit209:setVertTextAlign("center");
    obj.edit209:setLeft(630);
    obj.edit209:setTop(55);
    obj.edit209:setWidth(50);
    obj.edit209:setHeight(25);
    obj.edit209:setField("MCRIT3");
    obj.edit209:setHint("Margem de Crítico");
    obj.edit209:setHorzTextAlign("center");
    obj.edit209:setType("number");
    obj.edit209:setName("edit209");

    obj.dataLink102 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink102:setParent(obj.layout34);
    obj.dataLink102:setField("BCRIT3");
    obj.dataLink102:setDefaultValue("10");
    obj.dataLink102:setName("dataLink102");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout34);
    obj.label138:setLeft(685);
    obj.label138:setTop(55);
    obj.label138:setWidth(50);
    obj.label138:setHeight(25);
    obj.label138:setText("Efeito");
    obj.label138:setName("label138");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout34);
    obj.edit210:setVertTextAlign("center");
    obj.edit210:setLeft(740);
    obj.edit210:setTop(55);
    obj.edit210:setWidth(80);
    obj.edit210:setHeight(25);
    obj.edit210:setField("EFF3");
    obj.edit210:setHint("Efeito Causado");
    obj.edit210:setHorzTextAlign("center");
    obj.edit210:setName("edit210");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout34);
    obj.edit211:setVertTextAlign("center");
    obj.edit211:setLeft(825);
    obj.edit211:setTop(55);
    obj.edit211:setWidth(30);
    obj.edit211:setHeight(25);
    obj.edit211:setField("MARGEF3");
    obj.edit211:setHint("Margem");
    obj.edit211:setHorzTextAlign("center");
    obj.edit211:setType("number");
    obj.edit211:setName("edit211");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout31);
    obj.layout35:setLeft(2);
    obj.layout35:setTop(288);
    obj.layout35:setWidth(880);
    obj.layout35:setHeight(92);
    obj.layout35:setName("layout35");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout35);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("black");
    obj.rectangle31:setName("rectangle31");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout35);
    obj.label139:setLeft(5);
    obj.label139:setTop(5);
    obj.label139:setWidth(70);
    obj.label139:setHeight(25);
    obj.label139:setText("Golpe 4");
    obj.label139:setName("label139");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout35);
    obj.edit212:setVertTextAlign("center");
    obj.edit212:setLeft(75);
    obj.edit212:setTop(5);
    obj.edit212:setWidth(160);
    obj.edit212:setHeight(25);
    obj.edit212:setField("golpeP4");
    obj.edit212:setName("edit212");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout35);
    obj.label140:setLeft(5);
    obj.label140:setTop(30);
    obj.label140:setWidth(80);
    obj.label140:setHeight(25);
    obj.label140:setText("Tipo");
    obj.label140:setName("label140");

    obj.comboBox23 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout35);
    obj.comboBox23:setLeft(75);
    obj.comboBox23:setTop(32);
    obj.comboBox23:setWidth(90);
    obj.comboBox23:setHeight(20);
    obj.comboBox23:setField("campoElem34");
    obj.comboBox23:setHorzTextAlign("leading");
    obj.comboBox23:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox23:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox23:setName("comboBox23");

    obj.dataLink103 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink103:setParent(obj.layout35);
    obj.dataLink103:setField("campoElem34");
    obj.dataLink103:setDefaultValue("19");
    obj.dataLink103:setName("dataLink103");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout35);
    obj.label141:setLeft(170);
    obj.label141:setTop(32);
    obj.label141:setWidth(10);
    obj.label141:setHeight(25);
    obj.label141:setText("Z:");
    obj.label141:setName("label141");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout35);
    obj.edit213:setVertTextAlign("center");
    obj.edit213:setLeft(190);
    obj.edit213:setTop(32);
    obj.edit213:setWidth(45);
    obj.edit213:setHeight(25);
    obj.edit213:setField("danoZ4");
    obj.edit213:setHint("Poder do golpe Z");
    obj.edit213:setName("edit213");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout35);
    obj.label142:setLeft(5);
    obj.label142:setTop(55);
    obj.label142:setWidth(80);
    obj.label142:setHeight(25);
    obj.label142:setText("ACP/ACS(%)");
    obj.label142:setName("label142");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout35);
    obj.edit214:setVertTextAlign("center");
    obj.edit214:setLeft(75);
    obj.edit214:setTop(55);
    obj.edit214:setWidth(75);
    obj.edit214:setHeight(25);
    obj.edit214:setField("ACP4");
    obj.edit214:setHint("Acerto Primário");
    obj.edit214:setType("number");
    obj.edit214:setHorzTextAlign("center");
    obj.edit214:setName("edit214");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout35);
    obj.edit215:setVertTextAlign("center");
    obj.edit215:setLeft(160);
    obj.edit215:setTop(55);
    obj.edit215:setWidth(75);
    obj.edit215:setHeight(25);
    obj.edit215:setField("ACS4");
    obj.edit215:setHint("Acerto Secundário");
    obj.edit215:setType("number");
    obj.edit215:setHorzTextAlign("center");
    obj.edit215:setName("edit215");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout35);
    obj.label143:setLeft(240);
    obj.label143:setTop(6);
    obj.label143:setWidth(50);
    obj.label143:setHeight(25);
    obj.label143:setText("Classe");
    obj.label143:setName("label143");

    obj.comboBox24 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.layout35);
    obj.comboBox24:setLeft(282);
    obj.comboBox24:setTop(6);
    obj.comboBox24:setWidth(82);
    obj.comboBox24:setHeight(25);
    obj.comboBox24:setField("classeP4");
    obj.comboBox24:setHorzTextAlign("center");
    obj.comboBox24:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox24:setValues({'1', '2', '3'});
    obj.comboBox24:setName("comboBox24");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout35);
    obj.label144:setLeft(240);
    obj.label144:setTop(31);
    obj.label144:setWidth(50);
    obj.label144:setHeight(25);
    obj.label144:setText("Cont.");
    obj.label144:setName("label144");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout35);
    obj.edit216:setVertTextAlign("center");
    obj.edit216:setLeft(282);
    obj.edit216:setTop(31);
    obj.edit216:setWidth(82);
    obj.edit216:setHeight(25);
    obj.edit216:setField("contP4");
    obj.edit216:setHint("Contato");
    obj.edit216:setHorzTextAlign("center");
    obj.edit216:setName("edit216");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout35);
    obj.label145:setLeft(240);
    obj.label145:setTop(55);
    obj.label145:setWidth(50);
    obj.label145:setHeight(25);
    obj.label145:setText("Área");
    obj.label145:setName("label145");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout35);
    obj.edit217:setVertTextAlign("center");
    obj.edit217:setLeft(282);
    obj.edit217:setTop(55);
    obj.edit217:setWidth(82);
    obj.edit217:setHeight(25);
    obj.edit217:setField("Area4");
    obj.edit217:setHorzTextAlign("center");
    obj.edit217:setName("edit217");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout35);
    obj.label146:setLeft(370);
    obj.label146:setTop(6);
    obj.label146:setWidth(70);
    obj.label146:setHeight(25);
    obj.label146:setText("Prioridade");
    obj.label146:setName("label146");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout35);
    obj.edit218:setVertTextAlign("center");
    obj.edit218:setLeft(443);
    obj.edit218:setTop(6);
    obj.edit218:setWidth(42);
    obj.edit218:setHeight(25);
    obj.edit218:setField("prioP4");
    obj.edit218:setHorzTextAlign("center");
    obj.edit218:setName("edit218");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout35);
    obj.label147:setLeft(370);
    obj.label147:setTop(31);
    obj.label147:setWidth(70);
    obj.label147:setHeight(25);
    obj.label147:setText("Poder");
    obj.label147:setName("label147");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout35);
    obj.edit219:setVertTextAlign("center");
    obj.edit219:setLeft(443);
    obj.edit219:setTop(31);
    obj.edit219:setWidth(42);
    obj.edit219:setHeight(25);
    obj.edit219:setField("danoP4");
    obj.edit219:setHorzTextAlign("center");
    obj.edit219:setType("number");
    obj.edit219:setName("edit219");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout35);
    obj.label148:setLeft(370);
    obj.label148:setTop(55);
    obj.label148:setWidth(70);
    obj.label148:setHeight(25);
    obj.label148:setText("Dano Bôn.");
    obj.label148:setName("label148");

    obj.edit220 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout35);
    obj.edit220:setVertTextAlign("center");
    obj.edit220:setLeft(443);
    obj.edit220:setTop(55);
    obj.edit220:setWidth(42);
    obj.edit220:setHeight(25);
    obj.edit220:setField("BonDMGP4");
    obj.edit220:setHorzTextAlign("center");
    obj.edit220:setType("number");
    obj.edit220:setName("edit220");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout35);
    obj.button20:setLeft(488);
    obj.button20:setTop(6);
    obj.button20:setWidth(82);
    obj.button20:setText("Acerto");
    obj.button20:setFontSize(11);
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout35);
    obj.button21:setLeft(488);
    obj.button21:setTop(31);
    obj.button21:setWidth(82);
    obj.button21:setText("A. Seguido");
    obj.button21:setFontSize(11);
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout35);
    obj.button22:setLeft(488);
    obj.button22:setTop(55);
    obj.button22:setWidth(82);
    obj.button22:setText("Golpe Z");
    obj.button22:setFontSize(11);
    obj.button22:setName("button22");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout35);
    obj.textEditor6:setLeft(575);
    obj.textEditor6:setTop(5);
    obj.textEditor6:setWidth(280);
    obj.textEditor6:setHeight(50);
    obj.textEditor6:setField("campoEfeitoGolpesP4");
    obj.textEditor6:setName("textEditor6");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout35);
    obj.label149:setLeft(575);
    obj.label149:setTop(55);
    obj.label149:setWidth(50);
    obj.label149:setHeight(25);
    obj.label149:setText("M.Crit.");
    obj.label149:setName("label149");

    obj.edit221 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout35);
    obj.edit221:setVertTextAlign("center");
    obj.edit221:setLeft(630);
    obj.edit221:setTop(55);
    obj.edit221:setWidth(50);
    obj.edit221:setHeight(25);
    obj.edit221:setField("MCRIT4");
    obj.edit221:setHint("Margem de Crítico");
    obj.edit221:setHorzTextAlign("center");
    obj.edit221:setType("number");
    obj.edit221:setName("edit221");

    obj.dataLink104 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink104:setParent(obj.layout35);
    obj.dataLink104:setField("BCRIT4");
    obj.dataLink104:setDefaultValue("10");
    obj.dataLink104:setName("dataLink104");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout35);
    obj.label150:setLeft(685);
    obj.label150:setTop(55);
    obj.label150:setWidth(50);
    obj.label150:setHeight(25);
    obj.label150:setText("Efeito");
    obj.label150:setName("label150");

    obj.edit222 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout35);
    obj.edit222:setVertTextAlign("center");
    obj.edit222:setLeft(740);
    obj.edit222:setTop(55);
    obj.edit222:setWidth(80);
    obj.edit222:setHeight(25);
    obj.edit222:setField("EFF4");
    obj.edit222:setHint("Efeito Causado");
    obj.edit222:setHorzTextAlign("center");
    obj.edit222:setName("edit222");

    obj.edit223 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout35);
    obj.edit223:setVertTextAlign("center");
    obj.edit223:setLeft(825);
    obj.edit223:setTop(55);
    obj.edit223:setWidth(30);
    obj.edit223:setHeight(25);
    obj.edit223:setField("MARGEF4");
    obj.edit223:setHint("Margem");
    obj.edit223:setHorzTextAlign("center");
    obj.edit223:setType("number");
    obj.edit223:setName("edit223");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout31);
    obj.layout36:setLeft(2);
    obj.layout36:setTop(427);
    obj.layout36:setWidth(880);
    obj.layout36:setHeight(92);
    obj.layout36:setName("layout36");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout36);
    obj.label151:setLeft(0);
    obj.label151:setTop(0);
    obj.label151:setWidth(880);
    obj.label151:setHeight(25);
    obj.label151:setText("Golpes de Classe ou Outros");
    lfm_setPropAsString(obj.label151, "fontStyle",  "bold");
    obj.label151:setFontSize(16);
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout31);
    obj.layout37:setLeft(2);
    obj.layout37:setTop(478);
    obj.layout37:setWidth(880);
    obj.layout37:setHeight(92);
    obj.layout37:setName("layout37");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout37);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setName("rectangle32");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout37);
    obj.label152:setLeft(5);
    obj.label152:setTop(5);
    obj.label152:setWidth(70);
    obj.label152:setHeight(25);
    obj.label152:setText("Golpe 5");
    obj.label152:setName("label152");

    obj.edit224 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout37);
    obj.edit224:setVertTextAlign("center");
    obj.edit224:setLeft(75);
    obj.edit224:setTop(5);
    obj.edit224:setWidth(160);
    obj.edit224:setHeight(25);
    obj.edit224:setField("golpeP5");
    obj.edit224:setName("edit224");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout37);
    obj.label153:setLeft(5);
    obj.label153:setTop(30);
    obj.label153:setWidth(80);
    obj.label153:setHeight(25);
    obj.label153:setText("Tipo");
    obj.label153:setName("label153");

    obj.comboBox25 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.layout37);
    obj.comboBox25:setLeft(75);
    obj.comboBox25:setTop(32);
    obj.comboBox25:setWidth(90);
    obj.comboBox25:setHeight(20);
    obj.comboBox25:setField("campoElem35");
    obj.comboBox25:setHorzTextAlign("leading");
    obj.comboBox25:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox25:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox25:setName("comboBox25");

    obj.dataLink105 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink105:setParent(obj.layout37);
    obj.dataLink105:setField("campoElem35");
    obj.dataLink105:setDefaultValue("19");
    obj.dataLink105:setName("dataLink105");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout37);
    obj.label154:setLeft(170);
    obj.label154:setTop(32);
    obj.label154:setWidth(10);
    obj.label154:setHeight(25);
    obj.label154:setText("Z:");
    obj.label154:setName("label154");

    obj.edit225 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout37);
    obj.edit225:setVertTextAlign("center");
    obj.edit225:setLeft(190);
    obj.edit225:setTop(32);
    obj.edit225:setWidth(45);
    obj.edit225:setHeight(25);
    obj.edit225:setField("danoZ5");
    obj.edit225:setHint("Poder do golpe Z");
    obj.edit225:setName("edit225");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout37);
    obj.label155:setLeft(5);
    obj.label155:setTop(55);
    obj.label155:setWidth(80);
    obj.label155:setHeight(25);
    obj.label155:setText("ACP/ACS(%)");
    obj.label155:setName("label155");

    obj.edit226 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout37);
    obj.edit226:setVertTextAlign("center");
    obj.edit226:setLeft(75);
    obj.edit226:setTop(55);
    obj.edit226:setWidth(75);
    obj.edit226:setHeight(25);
    obj.edit226:setField("ACP5");
    obj.edit226:setHint("Acerto Primário");
    obj.edit226:setType("number");
    obj.edit226:setHorzTextAlign("center");
    obj.edit226:setName("edit226");

    obj.edit227 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout37);
    obj.edit227:setVertTextAlign("center");
    obj.edit227:setLeft(160);
    obj.edit227:setTop(55);
    obj.edit227:setWidth(75);
    obj.edit227:setHeight(25);
    obj.edit227:setField("ACS5");
    obj.edit227:setHint("Acerto Secundário");
    obj.edit227:setType("number");
    obj.edit227:setHorzTextAlign("center");
    obj.edit227:setName("edit227");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout37);
    obj.label156:setLeft(240);
    obj.label156:setTop(6);
    obj.label156:setWidth(50);
    obj.label156:setHeight(25);
    obj.label156:setText("Classe");
    obj.label156:setName("label156");

    obj.comboBox26 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.layout37);
    obj.comboBox26:setLeft(282);
    obj.comboBox26:setTop(6);
    obj.comboBox26:setWidth(82);
    obj.comboBox26:setHeight(25);
    obj.comboBox26:setField("classeP5");
    obj.comboBox26:setHorzTextAlign("center");
    obj.comboBox26:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox26:setValues({'1', '2', '3'});
    obj.comboBox26:setName("comboBox26");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout37);
    obj.label157:setLeft(240);
    obj.label157:setTop(31);
    obj.label157:setWidth(50);
    obj.label157:setHeight(25);
    obj.label157:setText("Cont.");
    obj.label157:setName("label157");

    obj.edit228 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout37);
    obj.edit228:setVertTextAlign("center");
    obj.edit228:setLeft(282);
    obj.edit228:setTop(31);
    obj.edit228:setWidth(82);
    obj.edit228:setHeight(25);
    obj.edit228:setField("contP5");
    obj.edit228:setHint("Contato");
    obj.edit228:setHorzTextAlign("center");
    obj.edit228:setName("edit228");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout37);
    obj.label158:setLeft(240);
    obj.label158:setTop(55);
    obj.label158:setWidth(50);
    obj.label158:setHeight(25);
    obj.label158:setText("Área");
    obj.label158:setName("label158");

    obj.edit229 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout37);
    obj.edit229:setVertTextAlign("center");
    obj.edit229:setLeft(282);
    obj.edit229:setTop(55);
    obj.edit229:setWidth(82);
    obj.edit229:setHeight(25);
    obj.edit229:setField("Area5");
    obj.edit229:setHorzTextAlign("center");
    obj.edit229:setName("edit229");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout37);
    obj.label159:setLeft(370);
    obj.label159:setTop(6);
    obj.label159:setWidth(70);
    obj.label159:setHeight(25);
    obj.label159:setText("Prioridade");
    obj.label159:setName("label159");

    obj.edit230 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout37);
    obj.edit230:setVertTextAlign("center");
    obj.edit230:setLeft(443);
    obj.edit230:setTop(6);
    obj.edit230:setWidth(42);
    obj.edit230:setHeight(25);
    obj.edit230:setField("prioP5");
    obj.edit230:setHorzTextAlign("center");
    obj.edit230:setName("edit230");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout37);
    obj.label160:setLeft(370);
    obj.label160:setTop(31);
    obj.label160:setWidth(70);
    obj.label160:setHeight(25);
    obj.label160:setText("Poder");
    obj.label160:setName("label160");

    obj.edit231 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout37);
    obj.edit231:setVertTextAlign("center");
    obj.edit231:setLeft(443);
    obj.edit231:setTop(31);
    obj.edit231:setWidth(42);
    obj.edit231:setHeight(25);
    obj.edit231:setField("danoP5");
    obj.edit231:setHorzTextAlign("center");
    obj.edit231:setType("number");
    obj.edit231:setName("edit231");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout37);
    obj.label161:setLeft(370);
    obj.label161:setTop(55);
    obj.label161:setWidth(70);
    obj.label161:setHeight(25);
    obj.label161:setText("Dano Bôn.");
    obj.label161:setName("label161");

    obj.edit232 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout37);
    obj.edit232:setVertTextAlign("center");
    obj.edit232:setLeft(443);
    obj.edit232:setTop(55);
    obj.edit232:setWidth(42);
    obj.edit232:setHeight(25);
    obj.edit232:setField("BonDMGP5");
    obj.edit232:setHorzTextAlign("center");
    obj.edit232:setType("number");
    obj.edit232:setName("edit232");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout37);
    obj.button23:setLeft(488);
    obj.button23:setTop(6);
    obj.button23:setWidth(82);
    obj.button23:setText("Acerto");
    obj.button23:setFontSize(11);
    obj.button23:setName("button23");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout37);
    obj.button24:setLeft(488);
    obj.button24:setTop(31);
    obj.button24:setWidth(82);
    obj.button24:setText("A. Seguido");
    obj.button24:setFontSize(11);
    obj.button24:setName("button24");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout37);
    obj.button25:setLeft(488);
    obj.button25:setTop(55);
    obj.button25:setWidth(82);
    obj.button25:setText("Golpe Z");
    obj.button25:setFontSize(11);
    obj.button25:setName("button25");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout37);
    obj.textEditor7:setLeft(575);
    obj.textEditor7:setTop(5);
    obj.textEditor7:setWidth(280);
    obj.textEditor7:setHeight(50);
    obj.textEditor7:setField("campoEfeitoGolpesP5");
    obj.textEditor7:setName("textEditor7");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout37);
    obj.label162:setLeft(575);
    obj.label162:setTop(55);
    obj.label162:setWidth(50);
    obj.label162:setHeight(25);
    obj.label162:setText("M.Crit.");
    obj.label162:setName("label162");

    obj.edit233 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout37);
    obj.edit233:setVertTextAlign("center");
    obj.edit233:setLeft(630);
    obj.edit233:setTop(55);
    obj.edit233:setWidth(50);
    obj.edit233:setHeight(25);
    obj.edit233:setField("MCRIT5");
    obj.edit233:setHint("Margem de Crítico");
    obj.edit233:setHorzTextAlign("center");
    obj.edit233:setType("number");
    obj.edit233:setName("edit233");

    obj.dataLink106 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink106:setParent(obj.layout37);
    obj.dataLink106:setField("BCRIT5");
    obj.dataLink106:setDefaultValue("10");
    obj.dataLink106:setName("dataLink106");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout37);
    obj.label163:setLeft(685);
    obj.label163:setTop(55);
    obj.label163:setWidth(50);
    obj.label163:setHeight(25);
    obj.label163:setText("Efeito");
    obj.label163:setName("label163");

    obj.edit234 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout37);
    obj.edit234:setVertTextAlign("center");
    obj.edit234:setLeft(740);
    obj.edit234:setTop(55);
    obj.edit234:setWidth(80);
    obj.edit234:setHeight(25);
    obj.edit234:setField("EFF5");
    obj.edit234:setHint("Efeito Causado");
    obj.edit234:setHorzTextAlign("center");
    obj.edit234:setName("edit234");

    obj.edit235 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout37);
    obj.edit235:setVertTextAlign("center");
    obj.edit235:setLeft(825);
    obj.edit235:setTop(55);
    obj.edit235:setWidth(30);
    obj.edit235:setHeight(25);
    obj.edit235:setField("MARGEF5");
    obj.edit235:setHint("Margem");
    obj.edit235:setHorzTextAlign("center");
    obj.edit235:setType("number");
    obj.edit235:setName("edit235");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout31);
    obj.layout38:setLeft(2);
    obj.layout38:setTop(573);
    obj.layout38:setWidth(880);
    obj.layout38:setHeight(92);
    obj.layout38:setName("layout38");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout38);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setColor("black");
    obj.rectangle33:setName("rectangle33");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout38);
    obj.label164:setLeft(5);
    obj.label164:setTop(5);
    obj.label164:setWidth(70);
    obj.label164:setHeight(25);
    obj.label164:setText("Golpe 6");
    obj.label164:setName("label164");

    obj.edit236 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout38);
    obj.edit236:setVertTextAlign("center");
    obj.edit236:setLeft(75);
    obj.edit236:setTop(5);
    obj.edit236:setWidth(160);
    obj.edit236:setHeight(25);
    obj.edit236:setField("golpeP6");
    obj.edit236:setName("edit236");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout38);
    obj.label165:setLeft(5);
    obj.label165:setTop(30);
    obj.label165:setWidth(80);
    obj.label165:setHeight(25);
    obj.label165:setText("Tipo");
    obj.label165:setName("label165");

    obj.comboBox27 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.layout38);
    obj.comboBox27:setLeft(75);
    obj.comboBox27:setTop(32);
    obj.comboBox27:setWidth(90);
    obj.comboBox27:setHeight(20);
    obj.comboBox27:setField("campoElem36");
    obj.comboBox27:setHorzTextAlign("leading");
    obj.comboBox27:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox27:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox27:setName("comboBox27");

    obj.dataLink107 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink107:setParent(obj.layout38);
    obj.dataLink107:setField("campoElem36");
    obj.dataLink107:setDefaultValue("19");
    obj.dataLink107:setName("dataLink107");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout38);
    obj.label166:setLeft(170);
    obj.label166:setTop(32);
    obj.label166:setWidth(10);
    obj.label166:setHeight(25);
    obj.label166:setText("Z:");
    obj.label166:setName("label166");

    obj.edit237 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout38);
    obj.edit237:setVertTextAlign("center");
    obj.edit237:setLeft(190);
    obj.edit237:setTop(32);
    obj.edit237:setWidth(45);
    obj.edit237:setHeight(25);
    obj.edit237:setField("danoZ6");
    obj.edit237:setHint("Poder do golpe Z");
    obj.edit237:setName("edit237");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout38);
    obj.label167:setLeft(5);
    obj.label167:setTop(55);
    obj.label167:setWidth(80);
    obj.label167:setHeight(25);
    obj.label167:setText("ACP/ACS(%)");
    obj.label167:setName("label167");

    obj.edit238 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout38);
    obj.edit238:setVertTextAlign("center");
    obj.edit238:setLeft(75);
    obj.edit238:setTop(55);
    obj.edit238:setWidth(75);
    obj.edit238:setHeight(25);
    obj.edit238:setField("ACP6");
    obj.edit238:setHint("Acerto Primário");
    obj.edit238:setType("number");
    obj.edit238:setHorzTextAlign("center");
    obj.edit238:setName("edit238");

    obj.edit239 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout38);
    obj.edit239:setVertTextAlign("center");
    obj.edit239:setLeft(160);
    obj.edit239:setTop(55);
    obj.edit239:setWidth(75);
    obj.edit239:setHeight(25);
    obj.edit239:setField("ACS6");
    obj.edit239:setHint("Acerto Secundário");
    obj.edit239:setType("number");
    obj.edit239:setHorzTextAlign("center");
    obj.edit239:setName("edit239");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout38);
    obj.label168:setLeft(240);
    obj.label168:setTop(6);
    obj.label168:setWidth(50);
    obj.label168:setHeight(25);
    obj.label168:setText("Classe");
    obj.label168:setName("label168");

    obj.comboBox28 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.layout38);
    obj.comboBox28:setLeft(282);
    obj.comboBox28:setTop(6);
    obj.comboBox28:setWidth(82);
    obj.comboBox28:setHeight(25);
    obj.comboBox28:setField("classeP6");
    obj.comboBox28:setHorzTextAlign("center");
    obj.comboBox28:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox28:setValues({'1', '2', '3'});
    obj.comboBox28:setName("comboBox28");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout38);
    obj.label169:setLeft(240);
    obj.label169:setTop(31);
    obj.label169:setWidth(50);
    obj.label169:setHeight(25);
    obj.label169:setText("Cont.");
    obj.label169:setName("label169");

    obj.edit240 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout38);
    obj.edit240:setVertTextAlign("center");
    obj.edit240:setLeft(282);
    obj.edit240:setTop(31);
    obj.edit240:setWidth(82);
    obj.edit240:setHeight(25);
    obj.edit240:setField("contP6");
    obj.edit240:setHint("Contato");
    obj.edit240:setHorzTextAlign("center");
    obj.edit240:setName("edit240");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout38);
    obj.label170:setLeft(240);
    obj.label170:setTop(55);
    obj.label170:setWidth(50);
    obj.label170:setHeight(25);
    obj.label170:setText("Área");
    obj.label170:setName("label170");

    obj.edit241 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout38);
    obj.edit241:setVertTextAlign("center");
    obj.edit241:setLeft(282);
    obj.edit241:setTop(55);
    obj.edit241:setWidth(82);
    obj.edit241:setHeight(25);
    obj.edit241:setField("Area6");
    obj.edit241:setHorzTextAlign("center");
    obj.edit241:setName("edit241");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout38);
    obj.label171:setLeft(370);
    obj.label171:setTop(6);
    obj.label171:setWidth(70);
    obj.label171:setHeight(25);
    obj.label171:setText("Prioridade");
    obj.label171:setName("label171");

    obj.edit242 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout38);
    obj.edit242:setVertTextAlign("center");
    obj.edit242:setLeft(443);
    obj.edit242:setTop(6);
    obj.edit242:setWidth(42);
    obj.edit242:setHeight(25);
    obj.edit242:setField("prioP6");
    obj.edit242:setHorzTextAlign("center");
    obj.edit242:setName("edit242");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout38);
    obj.label172:setLeft(370);
    obj.label172:setTop(31);
    obj.label172:setWidth(70);
    obj.label172:setHeight(25);
    obj.label172:setText("Poder");
    obj.label172:setName("label172");

    obj.edit243 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout38);
    obj.edit243:setVertTextAlign("center");
    obj.edit243:setLeft(443);
    obj.edit243:setTop(31);
    obj.edit243:setWidth(42);
    obj.edit243:setHeight(25);
    obj.edit243:setField("danoP6");
    obj.edit243:setHorzTextAlign("center");
    obj.edit243:setType("number");
    obj.edit243:setName("edit243");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout38);
    obj.label173:setLeft(370);
    obj.label173:setTop(55);
    obj.label173:setWidth(70);
    obj.label173:setHeight(25);
    obj.label173:setText("Dano Bôn.");
    obj.label173:setName("label173");

    obj.edit244 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout38);
    obj.edit244:setVertTextAlign("center");
    obj.edit244:setLeft(443);
    obj.edit244:setTop(55);
    obj.edit244:setWidth(42);
    obj.edit244:setHeight(25);
    obj.edit244:setField("BonDMGP6");
    obj.edit244:setHorzTextAlign("center");
    obj.edit244:setType("number");
    obj.edit244:setName("edit244");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout38);
    obj.button26:setLeft(488);
    obj.button26:setTop(6);
    obj.button26:setWidth(82);
    obj.button26:setText("Acerto");
    obj.button26:setFontSize(11);
    obj.button26:setName("button26");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout38);
    obj.button27:setLeft(488);
    obj.button27:setTop(31);
    obj.button27:setWidth(82);
    obj.button27:setText("A. Seguido");
    obj.button27:setFontSize(11);
    obj.button27:setName("button27");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout38);
    obj.button28:setLeft(488);
    obj.button28:setTop(55);
    obj.button28:setWidth(82);
    obj.button28:setText("Golpe Z");
    obj.button28:setFontSize(11);
    obj.button28:setName("button28");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout38);
    obj.textEditor8:setLeft(575);
    obj.textEditor8:setTop(5);
    obj.textEditor8:setWidth(280);
    obj.textEditor8:setHeight(50);
    obj.textEditor8:setField("campoEfeitoGolpesP6");
    obj.textEditor8:setName("textEditor8");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout38);
    obj.label174:setLeft(575);
    obj.label174:setTop(55);
    obj.label174:setWidth(50);
    obj.label174:setHeight(25);
    obj.label174:setText("M.Crit.");
    obj.label174:setName("label174");

    obj.edit245 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout38);
    obj.edit245:setVertTextAlign("center");
    obj.edit245:setLeft(630);
    obj.edit245:setTop(55);
    obj.edit245:setWidth(50);
    obj.edit245:setHeight(25);
    obj.edit245:setField("MCRIT6");
    obj.edit245:setHint("Margem de Crítico");
    obj.edit245:setHorzTextAlign("center");
    obj.edit245:setType("number");
    obj.edit245:setName("edit245");

    obj.dataLink108 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink108:setParent(obj.layout38);
    obj.dataLink108:setField("BCRIT6");
    obj.dataLink108:setDefaultValue("10");
    obj.dataLink108:setName("dataLink108");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout38);
    obj.label175:setLeft(685);
    obj.label175:setTop(55);
    obj.label175:setWidth(50);
    obj.label175:setHeight(25);
    obj.label175:setText("Efeito");
    obj.label175:setName("label175");

    obj.edit246 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout38);
    obj.edit246:setVertTextAlign("center");
    obj.edit246:setLeft(740);
    obj.edit246:setTop(55);
    obj.edit246:setWidth(80);
    obj.edit246:setHeight(25);
    obj.edit246:setField("EFF6");
    obj.edit246:setHint("Efeito Causado");
    obj.edit246:setHorzTextAlign("center");
    obj.edit246:setName("edit246");

    obj.edit247 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout38);
    obj.edit247:setVertTextAlign("center");
    obj.edit247:setLeft(825);
    obj.edit247:setTop(55);
    obj.edit247:setWidth(30);
    obj.edit247:setHeight(25);
    obj.edit247:setField("MARGEF6");
    obj.edit247:setHint("Margem");
    obj.edit247:setHorzTextAlign("center");
    obj.edit247:setType("number");
    obj.edit247:setName("edit247");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout31);
    obj.layout39:setLeft(2);
    obj.layout39:setTop(668);
    obj.layout39:setWidth(880);
    obj.layout39:setHeight(92);
    obj.layout39:setName("layout39");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout39);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setName("rectangle34");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout39);
    obj.label176:setLeft(5);
    obj.label176:setTop(5);
    obj.label176:setWidth(70);
    obj.label176:setHeight(25);
    obj.label176:setText("Golpe 7");
    obj.label176:setName("label176");

    obj.edit248 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout39);
    obj.edit248:setVertTextAlign("center");
    obj.edit248:setLeft(75);
    obj.edit248:setTop(5);
    obj.edit248:setWidth(160);
    obj.edit248:setHeight(25);
    obj.edit248:setField("golpeP7");
    obj.edit248:setName("edit248");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout39);
    obj.label177:setLeft(5);
    obj.label177:setTop(30);
    obj.label177:setWidth(80);
    obj.label177:setHeight(25);
    obj.label177:setText("Tipo");
    obj.label177:setName("label177");

    obj.comboBox29 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.layout39);
    obj.comboBox29:setLeft(75);
    obj.comboBox29:setTop(32);
    obj.comboBox29:setWidth(90);
    obj.comboBox29:setHeight(20);
    obj.comboBox29:setField("campoElem37");
    obj.comboBox29:setHorzTextAlign("leading");
    obj.comboBox29:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox29:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox29:setName("comboBox29");

    obj.dataLink109 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink109:setParent(obj.layout39);
    obj.dataLink109:setField("campoElem37");
    obj.dataLink109:setDefaultValue("19");
    obj.dataLink109:setName("dataLink109");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout39);
    obj.label178:setLeft(170);
    obj.label178:setTop(32);
    obj.label178:setWidth(10);
    obj.label178:setHeight(25);
    obj.label178:setText("Z:");
    obj.label178:setName("label178");

    obj.edit249 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout39);
    obj.edit249:setVertTextAlign("center");
    obj.edit249:setLeft(190);
    obj.edit249:setTop(32);
    obj.edit249:setWidth(45);
    obj.edit249:setHeight(25);
    obj.edit249:setField("danoZ7");
    obj.edit249:setHint("Poder do golpe Z");
    obj.edit249:setName("edit249");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout39);
    obj.label179:setLeft(5);
    obj.label179:setTop(55);
    obj.label179:setWidth(80);
    obj.label179:setHeight(25);
    obj.label179:setText("ACP/ACS(%)");
    obj.label179:setName("label179");

    obj.edit250 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout39);
    obj.edit250:setVertTextAlign("center");
    obj.edit250:setLeft(75);
    obj.edit250:setTop(55);
    obj.edit250:setWidth(75);
    obj.edit250:setHeight(25);
    obj.edit250:setField("ACP7");
    obj.edit250:setHint("Acerto Primário");
    obj.edit250:setType("number");
    obj.edit250:setHorzTextAlign("center");
    obj.edit250:setName("edit250");

    obj.edit251 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout39);
    obj.edit251:setVertTextAlign("center");
    obj.edit251:setLeft(160);
    obj.edit251:setTop(55);
    obj.edit251:setWidth(75);
    obj.edit251:setHeight(25);
    obj.edit251:setField("ACS7");
    obj.edit251:setHint("Acerto Secundário");
    obj.edit251:setType("number");
    obj.edit251:setHorzTextAlign("center");
    obj.edit251:setName("edit251");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout39);
    obj.label180:setLeft(240);
    obj.label180:setTop(6);
    obj.label180:setWidth(50);
    obj.label180:setHeight(25);
    obj.label180:setText("Classe");
    obj.label180:setName("label180");

    obj.comboBox30 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox30:setParent(obj.layout39);
    obj.comboBox30:setLeft(282);
    obj.comboBox30:setTop(6);
    obj.comboBox30:setWidth(82);
    obj.comboBox30:setHeight(25);
    obj.comboBox30:setField("classeP7");
    obj.comboBox30:setHorzTextAlign("center");
    obj.comboBox30:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox30:setValues({'1', '2', '3'});
    obj.comboBox30:setName("comboBox30");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout39);
    obj.label181:setLeft(240);
    obj.label181:setTop(31);
    obj.label181:setWidth(50);
    obj.label181:setHeight(25);
    obj.label181:setText("Cont.");
    obj.label181:setName("label181");

    obj.edit252 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout39);
    obj.edit252:setVertTextAlign("center");
    obj.edit252:setLeft(282);
    obj.edit252:setTop(31);
    obj.edit252:setWidth(82);
    obj.edit252:setHeight(25);
    obj.edit252:setField("contP7");
    obj.edit252:setHint("Contato");
    obj.edit252:setHorzTextAlign("center");
    obj.edit252:setName("edit252");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout39);
    obj.label182:setLeft(240);
    obj.label182:setTop(55);
    obj.label182:setWidth(50);
    obj.label182:setHeight(25);
    obj.label182:setText("Área");
    obj.label182:setName("label182");

    obj.edit253 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout39);
    obj.edit253:setVertTextAlign("center");
    obj.edit253:setLeft(282);
    obj.edit253:setTop(55);
    obj.edit253:setWidth(82);
    obj.edit253:setHeight(25);
    obj.edit253:setField("Area7");
    obj.edit253:setHorzTextAlign("center");
    obj.edit253:setName("edit253");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout39);
    obj.label183:setLeft(370);
    obj.label183:setTop(6);
    obj.label183:setWidth(70);
    obj.label183:setHeight(25);
    obj.label183:setText("Prioridade");
    obj.label183:setName("label183");

    obj.edit254 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout39);
    obj.edit254:setVertTextAlign("center");
    obj.edit254:setLeft(443);
    obj.edit254:setTop(6);
    obj.edit254:setWidth(42);
    obj.edit254:setHeight(25);
    obj.edit254:setField("prioP7");
    obj.edit254:setHorzTextAlign("center");
    obj.edit254:setName("edit254");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout39);
    obj.label184:setLeft(370);
    obj.label184:setTop(31);
    obj.label184:setWidth(70);
    obj.label184:setHeight(25);
    obj.label184:setText("Poder");
    obj.label184:setName("label184");

    obj.edit255 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout39);
    obj.edit255:setVertTextAlign("center");
    obj.edit255:setLeft(443);
    obj.edit255:setTop(31);
    obj.edit255:setWidth(42);
    obj.edit255:setHeight(25);
    obj.edit255:setField("danoP7");
    obj.edit255:setHorzTextAlign("center");
    obj.edit255:setType("number");
    obj.edit255:setName("edit255");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout39);
    obj.label185:setLeft(370);
    obj.label185:setTop(55);
    obj.label185:setWidth(70);
    obj.label185:setHeight(25);
    obj.label185:setText("Dano Bôn.");
    obj.label185:setName("label185");

    obj.edit256 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout39);
    obj.edit256:setVertTextAlign("center");
    obj.edit256:setLeft(443);
    obj.edit256:setTop(55);
    obj.edit256:setWidth(42);
    obj.edit256:setHeight(25);
    obj.edit256:setField("BonDMGP7");
    obj.edit256:setHorzTextAlign("center");
    obj.edit256:setType("number");
    obj.edit256:setName("edit256");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout39);
    obj.button29:setLeft(488);
    obj.button29:setTop(6);
    obj.button29:setWidth(82);
    obj.button29:setText("Acerto");
    obj.button29:setFontSize(11);
    obj.button29:setName("button29");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout39);
    obj.button30:setLeft(488);
    obj.button30:setTop(31);
    obj.button30:setWidth(82);
    obj.button30:setText("A. Seguido");
    obj.button30:setFontSize(11);
    obj.button30:setName("button30");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout39);
    obj.button31:setLeft(488);
    obj.button31:setTop(55);
    obj.button31:setWidth(82);
    obj.button31:setText("Golpe Z");
    obj.button31:setFontSize(11);
    obj.button31:setName("button31");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout39);
    obj.textEditor9:setLeft(575);
    obj.textEditor9:setTop(5);
    obj.textEditor9:setWidth(280);
    obj.textEditor9:setHeight(50);
    obj.textEditor9:setField("campoEfeitoGolpesP7");
    obj.textEditor9:setName("textEditor9");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout39);
    obj.label186:setLeft(575);
    obj.label186:setTop(55);
    obj.label186:setWidth(50);
    obj.label186:setHeight(25);
    obj.label186:setText("M.Crit.");
    obj.label186:setName("label186");

    obj.edit257 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout39);
    obj.edit257:setVertTextAlign("center");
    obj.edit257:setLeft(630);
    obj.edit257:setTop(55);
    obj.edit257:setWidth(50);
    obj.edit257:setHeight(25);
    obj.edit257:setField("MCRIT7");
    obj.edit257:setHint("Margem de Crítico");
    obj.edit257:setHorzTextAlign("center");
    obj.edit257:setType("number");
    obj.edit257:setName("edit257");

    obj.dataLink110 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink110:setParent(obj.layout39);
    obj.dataLink110:setField("BCRIT7");
    obj.dataLink110:setDefaultValue("10");
    obj.dataLink110:setName("dataLink110");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout39);
    obj.label187:setLeft(685);
    obj.label187:setTop(55);
    obj.label187:setWidth(50);
    obj.label187:setHeight(25);
    obj.label187:setText("Efeito");
    obj.label187:setName("label187");

    obj.edit258 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout39);
    obj.edit258:setVertTextAlign("center");
    obj.edit258:setLeft(740);
    obj.edit258:setTop(55);
    obj.edit258:setWidth(80);
    obj.edit258:setHeight(25);
    obj.edit258:setField("EFF7");
    obj.edit258:setHint("Efeito Causado");
    obj.edit258:setHorzTextAlign("center");
    obj.edit258:setName("edit258");

    obj.edit259 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout39);
    obj.edit259:setVertTextAlign("center");
    obj.edit259:setLeft(825);
    obj.edit259:setTop(55);
    obj.edit259:setWidth(30);
    obj.edit259:setHeight(25);
    obj.edit259:setField("MARGEF7");
    obj.edit259:setHint("Margem");
    obj.edit259:setHorzTextAlign("center");
    obj.edit259:setType("number");
    obj.edit259:setName("edit259");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout31);
    obj.layout40:setLeft(2);
    obj.layout40:setTop(763);
    obj.layout40:setWidth(880);
    obj.layout40:setHeight(92);
    obj.layout40:setName("layout40");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout40);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("black");
    obj.rectangle35:setName("rectangle35");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout40);
    obj.label188:setLeft(5);
    obj.label188:setTop(5);
    obj.label188:setWidth(70);
    obj.label188:setHeight(25);
    obj.label188:setText("Golpe 8");
    obj.label188:setName("label188");

    obj.edit260 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout40);
    obj.edit260:setVertTextAlign("center");
    obj.edit260:setLeft(75);
    obj.edit260:setTop(5);
    obj.edit260:setWidth(160);
    obj.edit260:setHeight(25);
    obj.edit260:setField("golpeP8");
    obj.edit260:setName("edit260");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout40);
    obj.label189:setLeft(5);
    obj.label189:setTop(30);
    obj.label189:setWidth(80);
    obj.label189:setHeight(25);
    obj.label189:setText("Tipo");
    obj.label189:setName("label189");

    obj.comboBox31 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox31:setParent(obj.layout40);
    obj.comboBox31:setLeft(75);
    obj.comboBox31:setTop(32);
    obj.comboBox31:setWidth(90);
    obj.comboBox31:setHeight(20);
    obj.comboBox31:setField("campoElem38");
    obj.comboBox31:setHorzTextAlign("leading");
    obj.comboBox31:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox31:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox31:setName("comboBox31");

    obj.dataLink111 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink111:setParent(obj.layout40);
    obj.dataLink111:setField("campoElem38");
    obj.dataLink111:setDefaultValue("19");
    obj.dataLink111:setName("dataLink111");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout40);
    obj.label190:setLeft(170);
    obj.label190:setTop(32);
    obj.label190:setWidth(10);
    obj.label190:setHeight(25);
    obj.label190:setText("Z:");
    obj.label190:setName("label190");

    obj.edit261 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout40);
    obj.edit261:setVertTextAlign("center");
    obj.edit261:setLeft(190);
    obj.edit261:setTop(32);
    obj.edit261:setWidth(45);
    obj.edit261:setHeight(25);
    obj.edit261:setField("danoZ8");
    obj.edit261:setHint("Poder do golpe Z");
    obj.edit261:setName("edit261");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout40);
    obj.label191:setLeft(5);
    obj.label191:setTop(55);
    obj.label191:setWidth(80);
    obj.label191:setHeight(25);
    obj.label191:setText("ACP/ACS(%)");
    obj.label191:setName("label191");

    obj.edit262 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout40);
    obj.edit262:setVertTextAlign("center");
    obj.edit262:setLeft(75);
    obj.edit262:setTop(55);
    obj.edit262:setWidth(75);
    obj.edit262:setHeight(25);
    obj.edit262:setField("ACP8");
    obj.edit262:setHint("Acerto Primário");
    obj.edit262:setType("number");
    obj.edit262:setHorzTextAlign("center");
    obj.edit262:setName("edit262");

    obj.edit263 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout40);
    obj.edit263:setVertTextAlign("center");
    obj.edit263:setLeft(160);
    obj.edit263:setTop(55);
    obj.edit263:setWidth(75);
    obj.edit263:setHeight(25);
    obj.edit263:setField("ACS8");
    obj.edit263:setHint("Acerto Secundário");
    obj.edit263:setType("number");
    obj.edit263:setHorzTextAlign("center");
    obj.edit263:setName("edit263");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout40);
    obj.label192:setLeft(240);
    obj.label192:setTop(6);
    obj.label192:setWidth(50);
    obj.label192:setHeight(25);
    obj.label192:setText("Classe");
    obj.label192:setName("label192");

    obj.comboBox32 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox32:setParent(obj.layout40);
    obj.comboBox32:setLeft(282);
    obj.comboBox32:setTop(6);
    obj.comboBox32:setWidth(82);
    obj.comboBox32:setHeight(25);
    obj.comboBox32:setField("classeP8");
    obj.comboBox32:setHorzTextAlign("center");
    obj.comboBox32:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox32:setValues({'1', '2', '3'});
    obj.comboBox32:setName("comboBox32");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout40);
    obj.label193:setLeft(240);
    obj.label193:setTop(31);
    obj.label193:setWidth(50);
    obj.label193:setHeight(25);
    obj.label193:setText("Cont.");
    obj.label193:setName("label193");

    obj.edit264 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout40);
    obj.edit264:setVertTextAlign("center");
    obj.edit264:setLeft(282);
    obj.edit264:setTop(31);
    obj.edit264:setWidth(82);
    obj.edit264:setHeight(25);
    obj.edit264:setField("contP8");
    obj.edit264:setHint("Contato");
    obj.edit264:setHorzTextAlign("center");
    obj.edit264:setName("edit264");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout40);
    obj.label194:setLeft(240);
    obj.label194:setTop(55);
    obj.label194:setWidth(50);
    obj.label194:setHeight(25);
    obj.label194:setText("Área");
    obj.label194:setName("label194");

    obj.edit265 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout40);
    obj.edit265:setVertTextAlign("center");
    obj.edit265:setLeft(282);
    obj.edit265:setTop(55);
    obj.edit265:setWidth(82);
    obj.edit265:setHeight(25);
    obj.edit265:setField("Area8");
    obj.edit265:setHorzTextAlign("center");
    obj.edit265:setName("edit265");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout40);
    obj.label195:setLeft(370);
    obj.label195:setTop(6);
    obj.label195:setWidth(70);
    obj.label195:setHeight(25);
    obj.label195:setText("Prioridade");
    obj.label195:setName("label195");

    obj.edit266 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout40);
    obj.edit266:setVertTextAlign("center");
    obj.edit266:setLeft(443);
    obj.edit266:setTop(6);
    obj.edit266:setWidth(42);
    obj.edit266:setHeight(25);
    obj.edit266:setField("prioP8");
    obj.edit266:setHorzTextAlign("center");
    obj.edit266:setName("edit266");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout40);
    obj.label196:setLeft(370);
    obj.label196:setTop(31);
    obj.label196:setWidth(70);
    obj.label196:setHeight(25);
    obj.label196:setText("Poder");
    obj.label196:setName("label196");

    obj.edit267 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.layout40);
    obj.edit267:setVertTextAlign("center");
    obj.edit267:setLeft(443);
    obj.edit267:setTop(31);
    obj.edit267:setWidth(42);
    obj.edit267:setHeight(25);
    obj.edit267:setField("danoP8");
    obj.edit267:setHorzTextAlign("center");
    obj.edit267:setType("number");
    obj.edit267:setName("edit267");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout40);
    obj.label197:setLeft(370);
    obj.label197:setTop(55);
    obj.label197:setWidth(70);
    obj.label197:setHeight(25);
    obj.label197:setText("Dano Bôn.");
    obj.label197:setName("label197");

    obj.edit268 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.layout40);
    obj.edit268:setVertTextAlign("center");
    obj.edit268:setLeft(443);
    obj.edit268:setTop(55);
    obj.edit268:setWidth(42);
    obj.edit268:setHeight(25);
    obj.edit268:setField("BonDMGP8");
    obj.edit268:setHorzTextAlign("center");
    obj.edit268:setType("number");
    obj.edit268:setName("edit268");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout40);
    obj.button32:setLeft(488);
    obj.button32:setTop(6);
    obj.button32:setWidth(82);
    obj.button32:setText("Acerto");
    obj.button32:setFontSize(11);
    obj.button32:setName("button32");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout40);
    obj.button33:setLeft(488);
    obj.button33:setTop(31);
    obj.button33:setWidth(82);
    obj.button33:setText("A. Seguido");
    obj.button33:setFontSize(11);
    obj.button33:setName("button33");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout40);
    obj.button34:setLeft(488);
    obj.button34:setTop(55);
    obj.button34:setWidth(82);
    obj.button34:setText("Golpe Z");
    obj.button34:setFontSize(11);
    obj.button34:setName("button34");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout40);
    obj.textEditor10:setLeft(575);
    obj.textEditor10:setTop(5);
    obj.textEditor10:setWidth(280);
    obj.textEditor10:setHeight(50);
    obj.textEditor10:setField("campoEfeitoGolpesP8");
    obj.textEditor10:setName("textEditor10");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout40);
    obj.label198:setLeft(575);
    obj.label198:setTop(55);
    obj.label198:setWidth(50);
    obj.label198:setHeight(25);
    obj.label198:setText("M.Crit.");
    obj.label198:setName("label198");

    obj.edit269 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.layout40);
    obj.edit269:setVertTextAlign("center");
    obj.edit269:setLeft(630);
    obj.edit269:setTop(55);
    obj.edit269:setWidth(50);
    obj.edit269:setHeight(25);
    obj.edit269:setField("MCRIT8");
    obj.edit269:setHint("Margem de Crítico");
    obj.edit269:setHorzTextAlign("center");
    obj.edit269:setType("number");
    obj.edit269:setName("edit269");

    obj.dataLink112 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink112:setParent(obj.layout40);
    obj.dataLink112:setField("BCRIT8");
    obj.dataLink112:setDefaultValue("10");
    obj.dataLink112:setName("dataLink112");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout40);
    obj.label199:setLeft(685);
    obj.label199:setTop(55);
    obj.label199:setWidth(50);
    obj.label199:setHeight(25);
    obj.label199:setText("Efeito");
    obj.label199:setName("label199");

    obj.edit270 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout40);
    obj.edit270:setVertTextAlign("center");
    obj.edit270:setLeft(740);
    obj.edit270:setTop(55);
    obj.edit270:setWidth(80);
    obj.edit270:setHeight(25);
    obj.edit270:setField("EFF8");
    obj.edit270:setHint("Efeito Causado");
    obj.edit270:setHorzTextAlign("center");
    obj.edit270:setName("edit270");

    obj.edit271 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout40);
    obj.edit271:setVertTextAlign("center");
    obj.edit271:setLeft(825);
    obj.edit271:setTop(55);
    obj.edit271:setWidth(30);
    obj.edit271:setHeight(25);
    obj.edit271:setField("MARGEF8");
    obj.edit271:setHint("Margem");
    obj.edit271:setHorzTextAlign("center");
    obj.edit271:setType("number");
    obj.edit271:setName("edit271");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout31);
    obj.layout41:setLeft(2);
    obj.layout41:setTop(858);
    obj.layout41:setWidth(880);
    obj.layout41:setHeight(92);
    obj.layout41:setName("layout41");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout41);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setName("rectangle36");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout41);
    obj.label200:setLeft(5);
    obj.label200:setTop(5);
    obj.label200:setWidth(70);
    obj.label200:setHeight(25);
    obj.label200:setText("Golpe 9");
    obj.label200:setName("label200");

    obj.edit272 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout41);
    obj.edit272:setVertTextAlign("center");
    obj.edit272:setLeft(75);
    obj.edit272:setTop(5);
    obj.edit272:setWidth(160);
    obj.edit272:setHeight(25);
    obj.edit272:setField("golpeP9");
    obj.edit272:setName("edit272");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout41);
    obj.label201:setLeft(5);
    obj.label201:setTop(30);
    obj.label201:setWidth(80);
    obj.label201:setHeight(25);
    obj.label201:setText("Tipo");
    obj.label201:setName("label201");

    obj.comboBox33 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox33:setParent(obj.layout41);
    obj.comboBox33:setLeft(75);
    obj.comboBox33:setTop(32);
    obj.comboBox33:setWidth(90);
    obj.comboBox33:setHeight(20);
    obj.comboBox33:setField("campoElem39");
    obj.comboBox33:setHorzTextAlign("leading");
    obj.comboBox33:setItems({'Normal', 'Fogo', 'Água', 'Elétrico', 'Grama', 'Gelo', 'Lutador', 'Venenoso', 'Terra', 'Voador', 'Psíquico', 'Inseto', 'Rocha', 'Fantasma', 'Dragão', 'Noturno', 'Metálico', 'Fada', ''});
    obj.comboBox33:setValues({'1', '2', '3', '4','5','6', '7','8','9','10','11','12','13','14','15','16','17','18','19'});
    obj.comboBox33:setName("comboBox33");

    obj.dataLink113 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink113:setParent(obj.layout41);
    obj.dataLink113:setField("campoElem39");
    obj.dataLink113:setDefaultValue("19");
    obj.dataLink113:setName("dataLink113");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout41);
    obj.label202:setLeft(170);
    obj.label202:setTop(32);
    obj.label202:setWidth(10);
    obj.label202:setHeight(25);
    obj.label202:setText("Z:");
    obj.label202:setName("label202");

    obj.edit273 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout41);
    obj.edit273:setVertTextAlign("center");
    obj.edit273:setLeft(190);
    obj.edit273:setTop(32);
    obj.edit273:setWidth(45);
    obj.edit273:setHeight(25);
    obj.edit273:setField("danoZ9");
    obj.edit273:setHint("Poder do golpe Z");
    obj.edit273:setName("edit273");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout41);
    obj.label203:setLeft(5);
    obj.label203:setTop(55);
    obj.label203:setWidth(80);
    obj.label203:setHeight(25);
    obj.label203:setText("ACP/ACS(%)");
    obj.label203:setName("label203");

    obj.edit274 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout41);
    obj.edit274:setVertTextAlign("center");
    obj.edit274:setLeft(75);
    obj.edit274:setTop(55);
    obj.edit274:setWidth(75);
    obj.edit274:setHeight(25);
    obj.edit274:setField("ACP9");
    obj.edit274:setHint("Acerto Primário");
    obj.edit274:setType("number");
    obj.edit274:setHorzTextAlign("center");
    obj.edit274:setName("edit274");

    obj.edit275 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout41);
    obj.edit275:setVertTextAlign("center");
    obj.edit275:setLeft(160);
    obj.edit275:setTop(55);
    obj.edit275:setWidth(75);
    obj.edit275:setHeight(25);
    obj.edit275:setField("ACS9");
    obj.edit275:setHint("Acerto Secundário");
    obj.edit275:setType("number");
    obj.edit275:setHorzTextAlign("center");
    obj.edit275:setName("edit275");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout41);
    obj.label204:setLeft(240);
    obj.label204:setTop(6);
    obj.label204:setWidth(50);
    obj.label204:setHeight(25);
    obj.label204:setText("Classe");
    obj.label204:setName("label204");

    obj.comboBox34 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox34:setParent(obj.layout41);
    obj.comboBox34:setLeft(282);
    obj.comboBox34:setTop(6);
    obj.comboBox34:setWidth(82);
    obj.comboBox34:setHeight(25);
    obj.comboBox34:setField("classeP9");
    obj.comboBox34:setHorzTextAlign("center");
    obj.comboBox34:setItems({'Ataque', 'Especial', 'Efeito'});
    obj.comboBox34:setValues({'1', '2', '3'});
    obj.comboBox34:setName("comboBox34");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout41);
    obj.label205:setLeft(240);
    obj.label205:setTop(31);
    obj.label205:setWidth(50);
    obj.label205:setHeight(25);
    obj.label205:setText("Cont.");
    obj.label205:setName("label205");

    obj.edit276 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout41);
    obj.edit276:setVertTextAlign("center");
    obj.edit276:setLeft(282);
    obj.edit276:setTop(31);
    obj.edit276:setWidth(82);
    obj.edit276:setHeight(25);
    obj.edit276:setField("contP9");
    obj.edit276:setHint("Contato");
    obj.edit276:setHorzTextAlign("center");
    obj.edit276:setName("edit276");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout41);
    obj.label206:setLeft(240);
    obj.label206:setTop(55);
    obj.label206:setWidth(50);
    obj.label206:setHeight(25);
    obj.label206:setText("Área");
    obj.label206:setName("label206");

    obj.edit277 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout41);
    obj.edit277:setVertTextAlign("center");
    obj.edit277:setLeft(282);
    obj.edit277:setTop(55);
    obj.edit277:setWidth(82);
    obj.edit277:setHeight(25);
    obj.edit277:setField("Area9");
    obj.edit277:setHorzTextAlign("center");
    obj.edit277:setName("edit277");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout41);
    obj.label207:setLeft(370);
    obj.label207:setTop(6);
    obj.label207:setWidth(70);
    obj.label207:setHeight(25);
    obj.label207:setText("Prioridade");
    obj.label207:setName("label207");

    obj.edit278 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout41);
    obj.edit278:setVertTextAlign("center");
    obj.edit278:setLeft(443);
    obj.edit278:setTop(6);
    obj.edit278:setWidth(42);
    obj.edit278:setHeight(25);
    obj.edit278:setField("prioP9");
    obj.edit278:setHorzTextAlign("center");
    obj.edit278:setName("edit278");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout41);
    obj.label208:setLeft(370);
    obj.label208:setTop(31);
    obj.label208:setWidth(70);
    obj.label208:setHeight(25);
    obj.label208:setText("Poder");
    obj.label208:setName("label208");

    obj.edit279 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout41);
    obj.edit279:setVertTextAlign("center");
    obj.edit279:setLeft(443);
    obj.edit279:setTop(31);
    obj.edit279:setWidth(42);
    obj.edit279:setHeight(25);
    obj.edit279:setField("danoP9");
    obj.edit279:setHorzTextAlign("center");
    obj.edit279:setType("number");
    obj.edit279:setName("edit279");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout41);
    obj.label209:setLeft(370);
    obj.label209:setTop(55);
    obj.label209:setWidth(70);
    obj.label209:setHeight(25);
    obj.label209:setText("Dano Bôn.");
    obj.label209:setName("label209");

    obj.edit280 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout41);
    obj.edit280:setVertTextAlign("center");
    obj.edit280:setLeft(443);
    obj.edit280:setTop(55);
    obj.edit280:setWidth(42);
    obj.edit280:setHeight(25);
    obj.edit280:setField("BonDMGP9");
    obj.edit280:setHorzTextAlign("center");
    obj.edit280:setType("number");
    obj.edit280:setName("edit280");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout41);
    obj.button35:setLeft(488);
    obj.button35:setTop(6);
    obj.button35:setWidth(82);
    obj.button35:setText("Acerto");
    obj.button35:setFontSize(11);
    obj.button35:setName("button35");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout41);
    obj.button36:setLeft(488);
    obj.button36:setTop(31);
    obj.button36:setWidth(82);
    obj.button36:setText("A. Seguido");
    obj.button36:setFontSize(11);
    obj.button36:setName("button36");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout41);
    obj.button37:setLeft(488);
    obj.button37:setTop(55);
    obj.button37:setWidth(82);
    obj.button37:setText("Golpe Z");
    obj.button37:setFontSize(11);
    obj.button37:setName("button37");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout41);
    obj.textEditor11:setLeft(575);
    obj.textEditor11:setTop(5);
    obj.textEditor11:setWidth(280);
    obj.textEditor11:setHeight(50);
    obj.textEditor11:setField("campoEfeitoGolpesP9");
    obj.textEditor11:setName("textEditor11");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout41);
    obj.label210:setLeft(575);
    obj.label210:setTop(55);
    obj.label210:setWidth(50);
    obj.label210:setHeight(25);
    obj.label210:setText("M.Crit.");
    obj.label210:setName("label210");

    obj.edit281 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout41);
    obj.edit281:setVertTextAlign("center");
    obj.edit281:setLeft(630);
    obj.edit281:setTop(55);
    obj.edit281:setWidth(50);
    obj.edit281:setHeight(25);
    obj.edit281:setField("MCRIT9");
    obj.edit281:setHint("Margem de Crítico");
    obj.edit281:setHorzTextAlign("center");
    obj.edit281:setType("number");
    obj.edit281:setName("edit281");

    obj.dataLink114 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink114:setParent(obj.layout41);
    obj.dataLink114:setField("BCRIT9");
    obj.dataLink114:setDefaultValue("10");
    obj.dataLink114:setName("dataLink114");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout41);
    obj.label211:setLeft(685);
    obj.label211:setTop(55);
    obj.label211:setWidth(50);
    obj.label211:setHeight(25);
    obj.label211:setText("Efeito");
    obj.label211:setName("label211");

    obj.edit282 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout41);
    obj.edit282:setVertTextAlign("center");
    obj.edit282:setLeft(740);
    obj.edit282:setTop(55);
    obj.edit282:setWidth(80);
    obj.edit282:setHeight(25);
    obj.edit282:setField("EFF9");
    obj.edit282:setHint("Efeito Causado");
    obj.edit282:setHorzTextAlign("center");
    obj.edit282:setName("edit282");

    obj.edit283 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout41);
    obj.edit283:setVertTextAlign("center");
    obj.edit283:setLeft(825);
    obj.edit283:setTop(55);
    obj.edit283:setWidth(30);
    obj.edit283:setHeight(25);
    obj.edit283:setField("MARGEF9");
    obj.edit283:setHint("Margem");
    obj.edit283:setHorzTextAlign("center");
    obj.edit283:setType("number");
    obj.edit283:setName("edit283");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl2);
    obj.tab5:setTitle("Capacidades e Notas");
    obj.tab5:setName("tab5");

    obj.frmPokemon4 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPokemon4:setParent(obj.tab5);
    obj.frmPokemon4:setName("frmPokemon4");
    obj.frmPokemon4:setAlign("client");
    obj.frmPokemon4:setTheme("dark");
    obj.frmPokemon4:setMargins({top=1});

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.frmPokemon4);
    obj.rectangle37:setAlign("top");
    obj.rectangle37:setColor("black");
    obj.rectangle37:setXradius(10);
    obj.rectangle37:setYradius(10);
    obj.rectangle37:setHeight(880);
    obj.rectangle37:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle37:setName("rectangle37");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle37);
    obj.layout42:setLeft(10);
    obj.layout42:setTop(10);
    obj.layout42:setHeight(600);
    obj.layout42:setWidth(410);
    obj.layout42:setName("layout42");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout42);
    obj.rectangle38:setLeft(000);
    obj.rectangle38:setTop(000);
    obj.rectangle38:setWidth(415);
    obj.rectangle38:setHeight(500);
    obj.rectangle38:setColor("darkred");
    obj.rectangle38:setStrokeColor("black");
    obj.rectangle38:setStrokeSize(5);
    obj.rectangle38:setName("rectangle38");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout42);
    obj.label212:setLeft(000);
    obj.label212:setTop(005);
    obj.label212:setHeight(20);
    obj.label212:setWidth(405);
    obj.label212:setFontColor("White");
    obj.label212:setFontSize(18);
    obj.label212:setText("Capacidades");
    obj.label212:setAutoSize(true);
    obj.label212:setHorzTextAlign("center");
    obj.label212:setName("label212");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout42);
    obj.textEditor12:setLeft(07);
    obj.textEditor12:setTop(30);
    obj.textEditor12:setWidth(400);
    obj.textEditor12:setHeight(460);
    obj.textEditor12:setField("campoCapacidades2");
    obj.textEditor12:setName("textEditor12");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle37);
    obj.layout43:setLeft(460);
    obj.layout43:setTop(10);
    obj.layout43:setHeight(200);
    obj.layout43:setWidth(250);
    obj.layout43:setName("layout43");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout43);
    obj.label213:setLeft(000);
    obj.label213:setTop(000);
    obj.label213:setHeight(20);
    obj.label213:setWidth(60);
    obj.label213:setText("Dieta:");
    obj.label213:setAutoSize(true);
    lfm_setPropAsString(obj.label213, "fontStyle",  "bold");
    obj.label213:setName("label213");

    obj.edit284 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout43);
    obj.edit284:setLeft(85);
    obj.edit284:setTop(000);
    obj.edit284:setHeight(20);
    obj.edit284:setWidth(160);
    obj.edit284:setField("Dieta_Poke");
    obj.edit284:setHorzTextAlign("center");
    obj.edit284:setName("edit284");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout43);
    obj.label214:setLeft(000);
    obj.label214:setTop(025);
    obj.label214:setHeight(20);
    obj.label214:setWidth(60);
    obj.label214:setText("Likes:");
    obj.label214:setAutoSize(true);
    lfm_setPropAsString(obj.label214, "fontStyle",  "bold");
    obj.label214:setName("label214");

    obj.edit285 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout43);
    obj.edit285:setLeft(85);
    obj.edit285:setTop(025);
    obj.edit285:setHeight(20);
    obj.edit285:setWidth(160);
    obj.edit285:setField("Sabor_Fav");
    obj.edit285:setHorzTextAlign("center");
    obj.edit285:setEnabled(false);
    obj.edit285:setName("edit285");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout43);
    obj.label215:setLeft(000);
    obj.label215:setTop(050);
    obj.label215:setHeight(20);
    obj.label215:setWidth(60);
    obj.label215:setText("Dislikes:");
    obj.label215:setAutoSize(true);
    lfm_setPropAsString(obj.label215, "fontStyle",  "bold");
    obj.label215:setName("label215");

    obj.edit286 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout43);
    obj.edit286:setLeft(85);
    obj.edit286:setTop(050);
    obj.edit286:setHeight(20);
    obj.edit286:setWidth(160);
    obj.edit286:setField("Sabor_Desg");
    obj.edit286:setHorzTextAlign("center");
    obj.edit286:setEnabled(false);
    obj.edit286:setName("edit286");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle37);
    obj.layout44:setLeft(460);
    obj.layout44:setTop(085);
    obj.layout44:setHeight(500);
    obj.layout44:setWidth(410);
    obj.layout44:setName("layout44");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout44);
    obj.rectangle39:setLeft(000);
    obj.rectangle39:setTop(000);
    obj.rectangle39:setWidth(415);
    obj.rectangle39:setHeight(425);
    obj.rectangle39:setColor("darkred");
    obj.rectangle39:setStrokeColor("black");
    obj.rectangle39:setStrokeSize(5);
    obj.rectangle39:setName("rectangle39");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout44);
    obj.label216:setLeft(000);
    obj.label216:setTop(005);
    obj.label216:setHeight(20);
    obj.label216:setWidth(405);
    obj.label216:setFontColor("White");
    obj.label216:setFontSize(18);
    obj.label216:setText("Anotações");
    obj.label216:setAutoSize(true);
    obj.label216:setHorzTextAlign("center");
    obj.label216:setName("label216");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout44);
    obj.textEditor13:setLeft(07);
    obj.textEditor13:setTop(30);
    obj.textEditor13:setWidth(400);
    obj.textEditor13:setHeight(385);
    obj.textEditor13:setField("campoNotasPoke");
    obj.textEditor13:setName("textEditor13");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Missões e Talentos");
    obj.tab6:setName("tab6");

    obj.frmTalMissions = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTalMissions:setParent(obj.tab6);
    obj.frmTalMissions:setName("frmTalMissions");
    obj.frmTalMissions:setAlign("client");
    obj.frmTalMissions:setTheme("dark");
    obj.frmTalMissions:setMargins({top=1});

    obj.popHabilidade = GUI.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade:setParent(obj.frmTalMissions);
    obj.popHabilidade:setName("popHabilidade");
    obj.popHabilidade:setWidth(300);
    obj.popHabilidade:setHeight(240);
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

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.flowPart1);
    obj.label217:setAlign("top");
    obj.label217:setFontSize(10);
    obj.label217:setText("Nível");
    obj.label217:setHorzTextAlign("center");
    obj.label217:setWordWrap(true);
    obj.label217:setTextTrimming("none");
    obj.label217:setAutoSize(true);
    obj.label217:setName("label217");

    obj.edit287 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.flowPart1);
    obj.edit287:setAlign("client");
    obj.edit287:setField("nivelHabilidade");
    obj.edit287:setHorzTextAlign("center");
    obj.edit287:setFontSize(12);
    obj.edit287:setType("number");
    obj.edit287:setName("edit287");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(180);
    obj.flowPart2:setMaxWidth(200);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.flowPart2);
    obj.label218:setAlign("top");
    obj.label218:setFontSize(10);
    obj.label218:setText("Nome");
    obj.label218:setHorzTextAlign("center");
    obj.label218:setWordWrap(true);
    obj.label218:setTextTrimming("none");
    obj.label218:setAutoSize(true);
    obj.label218:setName("label218");

    obj.edit288 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.flowPart2);
    obj.edit288:setAlign("client");
    obj.edit288:setField("nomeHabilidade");
    obj.edit288:setFontSize(12);
    obj.edit288:setName("edit288");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.flowPart3);
    obj.label219:setAlign("top");
    obj.label219:setFontSize(10);
    obj.label219:setText("Classe");
    obj.label219:setHorzTextAlign("center");
    obj.label219:setWordWrap(true);
    obj.label219:setTextTrimming("none");
    obj.label219:setAutoSize(true);
    obj.label219:setName("label219");

    obj.edit289 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.flowPart3);
    obj.edit289:setAlign("client");
    obj.edit289:setField("classeHabilidade");
    obj.edit289:setHorzTextAlign("center");
    obj.edit289:setFontSize(12);
    obj.edit289:setName("edit289");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(180);
    obj.flowPart4:setMaxWidth(200);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.flowPart4);
    obj.label220:setAlign("top");
    obj.label220:setFontSize(10);
    obj.label220:setText("Requisitos");
    obj.label220:setHorzTextAlign("center");
    obj.label220:setWordWrap(true);
    obj.label220:setTextTrimming("none");
    obj.label220:setAutoSize(true);
    obj.label220:setName("label220");

    obj.edit290 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.flowPart4);
    obj.edit290:setAlign("client");
    obj.edit290:setField("reqHabilidade");
    obj.edit290:setFontSize(12);
    obj.edit290:setName("edit290");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(90);
    obj.flowPart5:setMaxWidth(100);
    obj.flowPart5:setHeight(35);
    obj.flowPart5:setName("flowPart5");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.flowPart5);
    obj.label221:setAlign("top");
    obj.label221:setFontSize(10);
    obj.label221:setText("Frequência");
    obj.label221:setHorzTextAlign("center");
    obj.label221:setWordWrap(true);
    obj.label221:setTextTrimming("none");
    obj.label221:setAutoSize(true);
    obj.label221:setName("label221");

    obj.edit291 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.flowPart5);
    obj.edit291:setAlign("client");
    obj.edit291:setField("freqHabilidade");
    obj.edit291:setHorzTextAlign("center");
    obj.edit291:setFontSize(12);
    obj.edit291:setName("edit291");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(180);
    obj.flowPart6:setMaxWidth(200);
    obj.flowPart6:setHeight(35);
    obj.flowPart6:setName("flowPart6");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.flowPart6);
    obj.label222:setAlign("top");
    obj.label222:setFontSize(10);
    obj.label222:setText("Tipo");
    obj.label222:setHorzTextAlign("center");
    obj.label222:setWordWrap(true);
    obj.label222:setTextTrimming("none");
    obj.label222:setAutoSize(true);
    obj.label222:setName("label222");

    obj.edit292 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.flowPart6);
    obj.edit292:setAlign("client");
    obj.edit292:setField("tipoHabilidade");
    obj.edit292:setFontSize(12);
    obj.edit292:setName("edit292");

    obj.dataLink115 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink115:setParent(obj.flowLayout1);
    obj.dataLink115:setField("nivelHabilidade");
    obj.dataLink115:setName("dataLink115");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.popHabilidade);
    obj.textEditor14:setAlign("client");
    obj.textEditor14:setField("descricao");
    obj.textEditor14:setName("textEditor14");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.frmTalMissions);
    obj.layout45:setLeft(000);
    obj.layout45:setTop(000);
    obj.layout45:setHeight(650);
    obj.layout45:setWidth(1100);
    obj.layout45:setName("layout45");

    obj.image53 = GUI.fromHandle(_obj_newObject("image"));
    obj.image53:setParent(obj.layout45);
    obj.image53:setLeft(000);
    obj.image53:setTop(000);
    obj.image53:setHeight(650);
    obj.image53:setWidth(1100);
    obj.image53:setSRC("/img/Pokeball.jpg");
    obj.image53:setStyle("autoFit");
    obj.image53:setName("image53");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.frmTalMissions);
    obj.layout46:setLeft(10);
    obj.layout46:setTop(10);
    obj.layout46:setHeight(800);
    obj.layout46:setWidth(1000);
    obj.layout46:setName("layout46");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout46);
    obj.rectangle40:setLeft(000);
    obj.rectangle40:setTop(000);
    obj.rectangle40:setWidth(660);
    obj.rectangle40:setHeight(575);
    obj.rectangle40:setColor("darkred");
    obj.rectangle40:setStrokeColor("black");
    obj.rectangle40:setStrokeSize(5);
    obj.rectangle40:setName("rectangle40");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout46);
    obj.label223:setLeft(000);
    obj.label223:setTop(005);
    obj.label223:setHeight(20);
    obj.label223:setWidth(650);
    obj.label223:setFontColor("white");
    obj.label223:setFontSize(18);
    obj.label223:setText("Missões");
    obj.label223:setAutoSize(true);
    obj.label223:setHorzTextAlign("center");
    obj.label223:setName("label223");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout46);
    obj.richEdit1:setLeft(005);
    obj.richEdit1:setTop(030);
    obj.richEdit1:setWidth(650);
    obj.richEdit1:setHeight(540);
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setField("campoCapacidadesTrainer");
    obj.richEdit1:setName("richEdit1");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.frmTalMissions);
    obj.layout47:setLeft(690);
    obj.layout47:setTop(10);
    obj.layout47:setWidth(400);
    obj.layout47:setHeight(600);
    obj.layout47:setName("layout47");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout47);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("#0000007F");
    obj.rectangle41:setName("rectangle41");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout47);
    obj.rectangle42:setLeft(000);
    obj.rectangle42:setTop(000);
    obj.rectangle42:setWidth(400);
    obj.rectangle42:setHeight(40);
    obj.rectangle42:setColor("darkred");
    obj.rectangle42:setStrokeColor("black");
    obj.rectangle42:setStrokeSize(5);
    obj.rectangle42:setName("rectangle42");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout47);
    obj.label224:setLeft(0);
    obj.label224:setTop(5);
    obj.label224:setWidth(400);
    obj.label224:setHeight(20);
    obj.label224:setText("Talentos");
    obj.label224:setAutoSize(true);
    obj.label224:setFontColor("White");
    obj.label224:setFontSize(18);
    obj.label224:setHorzTextAlign("center");
    obj.label224:setName("label224");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout47);
    obj.button38:setText("Novo Talento");
    obj.button38:setLeft(5);
    obj.button38:setTop(30);
    obj.button38:setWidth(390);
    obj.button38:setHeight(20);
    obj.button38:setName("button38");

    obj.rclListaDasCaracteristicasClasse = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasCaracteristicasClasse:setParent(obj.layout47);
    obj.rclListaDasCaracteristicasClasse:setName("rclListaDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setField("campoDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDasCaracteristicasClasse:setLeft(5);
    obj.rclListaDasCaracteristicasClasse:setTop(50);
    obj.rclListaDasCaracteristicasClasse:setWidth(390);
    obj.rclListaDasCaracteristicasClasse:setHeight(515);
    obj.rclListaDasCaracteristicasClasse:setLayout("vertical");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Mochila");
    obj.tab7:setName("tab7");

    obj.frmMochila = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMochila:setParent(obj.tab7);
    obj.frmMochila:setName("frmMochila");
    obj.frmMochila:setAlign("client");
    obj.frmMochila:setTheme("dark");
    obj.frmMochila:setMargins({top=1});

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.frmMochila);
    obj.layout48:setLeft(000);
    obj.layout48:setTop(000);
    obj.layout48:setHeight(650);
    obj.layout48:setWidth(1100);
    obj.layout48:setName("layout48");

    obj.image54 = GUI.fromHandle(_obj_newObject("image"));
    obj.image54:setParent(obj.layout48);
    obj.image54:setLeft(000);
    obj.image54:setTop(000);
    obj.image54:setHeight(650);
    obj.image54:setWidth(1100);
    obj.image54:setSRC("/img/Pokeball.jpg");
    obj.image54:setStyle("autoFit");
    obj.image54:setName("image54");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.frmMochila);
    obj.layout49:setLeft(80);
    obj.layout49:setTop(10);
    obj.layout49:setHeight(400);
    obj.layout49:setWidth(300);
    obj.layout49:setName("layout49");

    obj.image55 = GUI.fromHandle(_obj_newObject("image"));
    obj.image55:setParent(obj.layout49);
    obj.image55:setLeft(080);
    obj.image55:setTop(005);
    obj.image55:setWidth(40);
    obj.image55:setHeight(40);
    obj.image55:setSRC("/img/DP_Items_pocket_M.png");
    obj.image55:setEditable(true);
    obj.image55:setStyle("proportional");
    obj.image55:setName("image55");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout49);
    obj.label225:setLeft(000);
    obj.label225:setTop(045);
    obj.label225:setHeight(20);
    obj.label225:setWidth(200);
    obj.label225:setText("Itens");
    obj.label225:setAutoSize(true);
    obj.label225:setFontColor("White");
    obj.label225:setFontSize(18);
    obj.label225:setHorzTextAlign("center");
    obj.label225:setName("label225");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout49);
    obj.textEditor15:setLeft(000);
    obj.textEditor15:setTop(065);
    obj.textEditor15:setWidth(200);
    obj.textEditor15:setHeight(230);
    obj.textEditor15:setField("campoItens");
    obj.textEditor15:setName("textEditor15");

    obj.dataLink116 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink116:setParent(obj.layout49);
    obj.dataLink116:setField("campoItens");
    obj.dataLink116:setDefaultValue(" Cristal Z (DEFINA)");
    obj.dataLink116:setName("dataLink116");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.frmMochila);
    obj.layout50:setLeft(330);
    obj.layout50:setTop(10);
    obj.layout50:setHeight(400);
    obj.layout50:setWidth(300);
    obj.layout50:setName("layout50");

    obj.image56 = GUI.fromHandle(_obj_newObject("image"));
    obj.image56:setParent(obj.layout50);
    obj.image56:setLeft(080);
    obj.image56:setTop(005);
    obj.image56:setWidth(40);
    obj.image56:setHeight(40);
    obj.image56:setSRC("/img/DP_Medicine_pocket_M.png");
    obj.image56:setEditable(true);
    obj.image56:setStyle("proportional");
    obj.image56:setName("image56");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout50);
    obj.label226:setLeft(000);
    obj.label226:setTop(045);
    obj.label226:setHeight(20);
    obj.label226:setWidth(200);
    obj.label226:setText("Medicina");
    obj.label226:setAutoSize(true);
    obj.label226:setFontColor("White");
    obj.label226:setFontSize(18);
    obj.label226:setHorzTextAlign("center");
    obj.label226:setName("label226");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout50);
    obj.textEditor16:setLeft(000);
    obj.textEditor16:setTop(065);
    obj.textEditor16:setWidth(200);
    obj.textEditor16:setHeight(230);
    obj.textEditor16:setField("campoMedicina");
    obj.textEditor16:setName("textEditor16");

    obj.dataLink117 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink117:setParent(obj.layout50);
    obj.dataLink117:setField("campoMedicina");
    obj.dataLink117:setDefaultValue(" Poção x5 \n Antídoto x1 \n Antiparalisia x1 \n Antissono x1 \n Antiqueimadura x1 \n Anticongelamento x1");
    obj.dataLink117:setName("dataLink117");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.frmMochila);
    obj.layout51:setLeft(580);
    obj.layout51:setTop(10);
    obj.layout51:setHeight(400);
    obj.layout51:setWidth(300);
    obj.layout51:setName("layout51");

    obj.image57 = GUI.fromHandle(_obj_newObject("image"));
    obj.image57:setParent(obj.layout51);
    obj.image57:setLeft(080);
    obj.image57:setTop(005);
    obj.image57:setWidth(40);
    obj.image57:setHeight(40);
    obj.image57:setSRC("/img/DP_Poke_Balls_pocket_M.png");
    obj.image57:setEditable(true);
    obj.image57:setStyle("proportional");
    obj.image57:setName("image57");

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout51);
    obj.label227:setLeft(000);
    obj.label227:setTop(045);
    obj.label227:setHeight(20);
    obj.label227:setWidth(200);
    obj.label227:setText("Pokébolas");
    obj.label227:setAutoSize(true);
    obj.label227:setFontColor("White");
    obj.label227:setFontSize(18);
    obj.label227:setHorzTextAlign("center");
    obj.label227:setName("label227");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout51);
    obj.textEditor17:setLeft(000);
    obj.textEditor17:setTop(065);
    obj.textEditor17:setWidth(200);
    obj.textEditor17:setHeight(230);
    obj.textEditor17:setField("campoPokebolas");
    obj.textEditor17:setName("textEditor17");

    obj.dataLink118 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink118:setParent(obj.layout51);
    obj.dataLink118:setField("campoPokebolas");
    obj.dataLink118:setDefaultValue(" PokéBola x3");
    obj.dataLink118:setName("dataLink118");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.frmMochila);
    obj.layout52:setLeft(830);
    obj.layout52:setTop(10);
    obj.layout52:setHeight(400);
    obj.layout52:setWidth(300);
    obj.layout52:setName("layout52");

    obj.image58 = GUI.fromHandle(_obj_newObject("image"));
    obj.image58:setParent(obj.layout52);
    obj.image58:setLeft(080);
    obj.image58:setTop(005);
    obj.image58:setWidth(40);
    obj.image58:setHeight(40);
    obj.image58:setSRC("/img/DP_TMs_and_HMs_pocket_M.png");
    obj.image58:setEditable(true);
    obj.image58:setStyle("proportional");
    obj.image58:setName("image58");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout52);
    obj.label228:setLeft(000);
    obj.label228:setTop(045);
    obj.label228:setHeight(20);
    obj.label228:setWidth(200);
    obj.label228:setText("TMs e HMs");
    obj.label228:setAutoSize(true);
    obj.label228:setFontColor("White");
    obj.label228:setFontSize(18);
    obj.label228:setHorzTextAlign("center");
    obj.label228:setName("label228");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout52);
    obj.textEditor18:setLeft(000);
    obj.textEditor18:setTop(065);
    obj.textEditor18:setWidth(200);
    obj.textEditor18:setHeight(230);
    obj.textEditor18:setField("campoRegistros");
    obj.textEditor18:setName("textEditor18");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.frmMochila);
    obj.layout53:setLeft(80);
    obj.layout53:setTop(310);
    obj.layout53:setHeight(400);
    obj.layout53:setWidth(300);
    obj.layout53:setName("layout53");

    obj.image59 = GUI.fromHandle(_obj_newObject("image"));
    obj.image59:setParent(obj.layout53);
    obj.image59:setLeft(080);
    obj.image59:setTop(005);
    obj.image59:setWidth(40);
    obj.image59:setHeight(40);
    obj.image59:setSRC("/img/DP_Berries_pocket_M.png");
    obj.image59:setEditable(true);
    obj.image59:setStyle("proportional");
    obj.image59:setName("image59");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout53);
    obj.label229:setLeft(000);
    obj.label229:setTop(045);
    obj.label229:setHeight(20);
    obj.label229:setWidth(200);
    obj.label229:setText("Berries");
    obj.label229:setAutoSize(true);
    obj.label229:setFontColor("White");
    obj.label229:setFontSize(18);
    obj.label229:setHorzTextAlign("center");
    obj.label229:setName("label229");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout53);
    obj.textEditor19:setLeft(000);
    obj.textEditor19:setTop(065);
    obj.textEditor19:setWidth(200);
    obj.textEditor19:setHeight(230);
    obj.textEditor19:setField("campoBerries");
    obj.textEditor19:setName("textEditor19");

    obj.dataLink119 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink119:setParent(obj.layout53);
    obj.dataLink119:setField("campoBerries");
    obj.dataLink119:setDefaultValue(" Oran Berry x3");
    obj.dataLink119:setName("dataLink119");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.frmMochila);
    obj.layout54:setLeft(330);
    obj.layout54:setTop(310);
    obj.layout54:setHeight(400);
    obj.layout54:setWidth(300);
    obj.layout54:setName("layout54");

    obj.image60 = GUI.fromHandle(_obj_newObject("image"));
    obj.image60:setParent(obj.layout54);
    obj.image60:setLeft(080);
    obj.image60:setTop(005);
    obj.image60:setWidth(40);
    obj.image60:setHeight(40);
    obj.image60:setSRC("/img/DP_Battle_items_pocket_M.png");
    obj.image60:setEditable(true);
    obj.image60:setStyle("proportional");
    obj.image60:setName("image60");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout54);
    obj.label230:setLeft(000);
    obj.label230:setTop(045);
    obj.label230:setHeight(20);
    obj.label230:setWidth(200);
    obj.label230:setText("Itens de Batalha");
    obj.label230:setAutoSize(true);
    obj.label230:setFontColor("White");
    obj.label230:setFontSize(18);
    obj.label230:setHorzTextAlign("center");
    obj.label230:setName("label230");

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.layout54);
    obj.textEditor20:setLeft(000);
    obj.textEditor20:setTop(065);
    obj.textEditor20:setWidth(200);
    obj.textEditor20:setHeight(230);
    obj.textEditor20:setField("campoItemBatalha");
    obj.textEditor20:setName("textEditor20");

    obj.dataLink120 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink120:setParent(obj.layout54);
    obj.dataLink120:setField("campoItemBatalha");
    obj.dataLink120:setDefaultValue(" Ataque X x1 \n Ataque Especial X x1");
    obj.dataLink120:setName("dataLink120");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.frmMochila);
    obj.layout55:setLeft(580);
    obj.layout55:setTop(310);
    obj.layout55:setHeight(400);
    obj.layout55:setWidth(300);
    obj.layout55:setName("layout55");

    obj.image61 = GUI.fromHandle(_obj_newObject("image"));
    obj.image61:setParent(obj.layout55);
    obj.image61:setLeft(080);
    obj.image61:setTop(005);
    obj.image61:setWidth(40);
    obj.image61:setHeight(40);
    obj.image61:setSRC("/img/DP_Key_items_pocket_M.png");
    obj.image61:setEditable(true);
    obj.image61:setStyle("proportional");
    obj.image61:setName("image61");

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout55);
    obj.label231:setLeft(000);
    obj.label231:setTop(045);
    obj.label231:setHeight(20);
    obj.label231:setWidth(200);
    obj.label231:setText("Itens-Chave");
    obj.label231:setAutoSize(true);
    obj.label231:setFontColor("White");
    obj.label231:setFontSize(18);
    obj.label231:setHorzTextAlign("center");
    obj.label231:setName("label231");

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.layout55);
    obj.textEditor21:setLeft(000);
    obj.textEditor21:setTop(065);
    obj.textEditor21:setWidth(200);
    obj.textEditor21:setHeight(230);
    obj.textEditor21:setField("campoItemChave");
    obj.textEditor21:setName("textEditor21");

    obj.dataLink121 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink121:setParent(obj.layout55);
    obj.dataLink121:setField("campoItemChave");
    obj.dataLink121:setDefaultValue(" Pokédex x1 \n Mega-Acessório x1 \n Bracelete Z \n Pokégear");
    obj.dataLink121:setName("dataLink121");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.frmMochila);
    obj.layout56:setLeft(830);
    obj.layout56:setTop(310);
    obj.layout56:setHeight(400);
    obj.layout56:setWidth(300);
    obj.layout56:setName("layout56");

    obj.image62 = GUI.fromHandle(_obj_newObject("image"));
    obj.image62:setParent(obj.layout56);
    obj.image62:setLeft(080);
    obj.image62:setTop(005);
    obj.image62:setWidth(40);
    obj.image62:setHeight(40);
    obj.image62:setSRC("/img/DP_Mail_pocket_M.png");
    obj.image62:setEditable(true);
    obj.image62:setStyle("proportional");
    obj.image62:setName("image62");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout56);
    obj.label232:setLeft(000);
    obj.label232:setTop(045);
    obj.label232:setHeight(20);
    obj.label232:setWidth(200);
    obj.label232:setText("Outros");
    obj.label232:setAutoSize(true);
    obj.label232:setFontColor("White");
    obj.label232:setFontSize(18);
    obj.label232:setHorzTextAlign("center");
    obj.label232:setName("label232");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.layout56);
    obj.textEditor22:setLeft(000);
    obj.textEditor22:setTop(065);
    obj.textEditor22:setWidth(200);
    obj.textEditor22:setHeight(230);
    obj.textEditor22:setField("campoOutros");
    obj.textEditor22:setName("textEditor22");

    obj.dataLink122 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink122:setParent(obj.layout56);
    obj.dataLink122:setField("campoOutros");
    obj.dataLink122:setDefaultValue(" Barraca x1 \n Mantimentos x1 \n Lanternas \n Kit de Acampamento \n Kit de Primeiros Socorros");
    obj.dataLink122:setName("dataLink122");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Pokédex");
    obj.tab8:setName("tab8");

    obj.frmPokedex = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPokedex:setParent(obj.tab8);
    obj.frmPokedex:setName("frmPokedex");
    obj.frmPokedex:setAlign("client");
    obj.frmPokedex:setTheme("dark");
    obj.frmPokedex:setMargins({top=1});

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.frmPokedex);
    obj.layout57:setLeft(000);
    obj.layout57:setTop(000);
    obj.layout57:setHeight(650);
    obj.layout57:setWidth(1100);
    obj.layout57:setName("layout57");

    obj.image63 = GUI.fromHandle(_obj_newObject("image"));
    obj.image63:setParent(obj.layout57);
    obj.image63:setLeft(000);
    obj.image63:setTop(000);
    obj.image63:setHeight(650);
    obj.image63:setWidth(1100);
    obj.image63:setSRC("/img/Pokeball.jpg");
    obj.image63:setStyle("autoFit");
    obj.image63:setName("image63");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.frmPokedex);
    obj.button39:setAlign("top");
    obj.button39:setHeight(25);
    obj.button39:setText("Adicionar Entrada");
    obj.button39:setName("button39");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.frmPokedex);
    obj.layout58:setAlign("top");
    obj.layout58:setWidth(170);
    obj.layout58:setHeight(30);
    obj.layout58:setMargins({top=5, bottom=5, left=15});
    obj.layout58:setName("layout58");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout58);
    obj.label233:setText("Capturados:");
    obj.label233:setAlign("left");
    obj.label233:setWidth(80);
    obj.label233:setName("label233");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout58);
    obj.rectangle43:setColor("darkred");
    obj.rectangle43:setAlign("left");
    obj.rectangle43:setMargins({left=5});
    obj.rectangle43:setName("rectangle43");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.rectangle43);
    obj.label234:setField("trainerPokeCaught");
    obj.label234:setAlign("client");
    obj.label234:setHorzTextAlign("center");
    obj.label234:setName("label234");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout58);
    obj.label235:setText("Vistos:");
    obj.label235:setAlign("left");
    obj.label235:setWidth(80);
    obj.label235:setMargins({left=80});
    obj.label235:setName("label235");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout58);
    obj.rectangle44:setColor("darkred");
    obj.rectangle44:setAlign("left");
    obj.rectangle44:setMargins({left=10});
    obj.rectangle44:setName("rectangle44");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.rectangle44);
    obj.label236:setField("trainerPokeSeen");
    obj.label236:setAlign("client");
    obj.label236:setHorzTextAlign("center");
    obj.label236:setName("label236");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.frmPokedex);
    obj.layout59:setAlign("client");
    obj.layout59:setTop(35);
    obj.layout59:setName("layout59");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.layout59);
    obj.scrollBox5:setMargins({top=5});
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.rclDex = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDex:setParent(obj.scrollBox5);
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
							


    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Background");
    obj.tab9:setName("tab9");

    obj.frmBackground = GUI.fromHandle(_obj_newObject("form"));
    obj.frmBackground:setParent(obj.tab9);
    obj.frmBackground:setName("frmBackground");
    obj.frmBackground:setAlign("client");
    obj.frmBackground:setTheme("dark");
    obj.frmBackground:setMargins({top=1});

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.frmBackground);
    obj.layout60:setLeft(000);
    obj.layout60:setTop(000);
    obj.layout60:setHeight(650);
    obj.layout60:setWidth(1100);
    obj.layout60:setName("layout60");

    obj.image64 = GUI.fromHandle(_obj_newObject("image"));
    obj.image64:setParent(obj.layout60);
    obj.image64:setLeft(000);
    obj.image64:setTop(000);
    obj.image64:setHeight(650);
    obj.image64:setWidth(1100);
    obj.image64:setSRC("/img/Pokeball.jpg");
    obj.image64:setStyle("autoFit");
    obj.image64:setName("image64");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.frmBackground);
    obj.layout61:setLeft(10);
    obj.layout61:setTop(10);
    obj.layout61:setHeight(800);
    obj.layout61:setWidth(1000);
    obj.layout61:setName("layout61");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout61);
    obj.rectangle45:setLeft(000);
    obj.rectangle45:setTop(000);
    obj.rectangle45:setWidth(710);
    obj.rectangle45:setHeight(575);
    obj.rectangle45:setColor("darkred");
    obj.rectangle45:setStrokeColor("black");
    obj.rectangle45:setStrokeSize(5);
    obj.rectangle45:setName("rectangle45");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout61);
    obj.label237:setLeft(000);
    obj.label237:setTop(005);
    obj.label237:setHeight(20);
    obj.label237:setWidth(700);
    obj.label237:setFontColor("White");
    obj.label237:setFontSize(18);
    obj.label237:setText("História");
    obj.label237:setAutoSize(true);
    obj.label237:setHorzTextAlign("center");
    obj.label237:setName("label237");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout61);
    obj.richEdit2:setLeft(005);
    obj.richEdit2:setTop(030);
    obj.richEdit2:setWidth(700);
    obj.richEdit2:setHeight(540);
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    obj.richEdit2:setField("campoHistoria");
    obj.richEdit2:setName("richEdit2");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.frmBackground);
    obj.layout62:setLeft(740);
    obj.layout62:setTop(10);
    obj.layout62:setHeight(600);
    obj.layout62:setWidth(1000);
    obj.layout62:setName("layout62");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout62);
    obj.rectangle46:setLeft(000);
    obj.rectangle46:setTop(000);
    obj.rectangle46:setWidth(340);
    obj.rectangle46:setHeight(435);
    obj.rectangle46:setColor("darkred");
    obj.rectangle46:setStrokeColor("black");
    obj.rectangle46:setStrokeSize(5);
    obj.rectangle46:setName("rectangle46");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout62);
    obj.label238:setLeft(000);
    obj.label238:setTop(005);
    obj.label238:setHeight(20);
    obj.label238:setWidth(330);
    obj.label238:setFontColor("White");
    obj.label238:setFontSize(18);
    obj.label238:setText("Personalidade");
    obj.label238:setAutoSize(true);
    obj.label238:setHorzTextAlign("center");
    obj.label238:setName("label238");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.layout62);
    obj.richEdit3:setLeft(005);
    obj.richEdit3:setTop(030);
    obj.richEdit3:setWidth(330);
    obj.richEdit3:setHeight(400);
    lfm_setPropAsString(obj.richEdit3, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit3, "defaultFontColor",  "white");
    obj.richEdit3:setField("campoPersonalidade");
    obj.richEdit3:setName("richEdit3");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Anotações");
    obj.tab10:setName("tab10");

    obj.frmAnotacoes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAnotacoes:setParent(obj.tab10);
    obj.frmAnotacoes:setName("frmAnotacoes");
    obj.frmAnotacoes:setAlign("client");
    obj.frmAnotacoes:setTheme("dark");
    obj.frmAnotacoes:setMargins({top=1});

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.frmAnotacoes);
    obj.layout63:setLeft(000);
    obj.layout63:setTop(000);
    obj.layout63:setHeight(650);
    obj.layout63:setWidth(1100);
    obj.layout63:setName("layout63");

    obj.image65 = GUI.fromHandle(_obj_newObject("image"));
    obj.image65:setParent(obj.layout63);
    obj.image65:setLeft(000);
    obj.image65:setTop(000);
    obj.image65:setHeight(650);
    obj.image65:setWidth(1100);
    obj.image65:setSRC("/img/Pokeball.jpg");
    obj.image65:setStyle("autoFit");
    obj.image65:setName("image65");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.frmAnotacoes);
    obj.layout64:setLeft(10);
    obj.layout64:setTop(10);
    obj.layout64:setHeight(600);
    obj.layout64:setWidth(465);
    obj.layout64:setName("layout64");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout64);
    obj.rectangle47:setLeft(000);
    obj.rectangle47:setTop(000);
    obj.rectangle47:setWidth(465);
    obj.rectangle47:setHeight(540);
    obj.rectangle47:setColor("Red");
    obj.rectangle47:setStrokeColor("black");
    obj.rectangle47:setStrokeSize(5);
    obj.rectangle47:setName("rectangle47");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.layout64);
    obj.richEdit4:setLeft(005);
    obj.richEdit4:setTop(005);
    obj.richEdit4:setWidth(455);
    obj.richEdit4:setHeight(530);
    lfm_setPropAsString(obj.richEdit4, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit4, "defaultFontColor",  "white");
    obj.richEdit4:setField("campoTextoGrande");
    obj.richEdit4:setName("richEdit4");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.frmAnotacoes);
    obj.layout65:setLeft(510);
    obj.layout65:setTop(10);
    obj.layout65:setHeight(600);
    obj.layout65:setWidth(465);
    obj.layout65:setName("layout65");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout65);
    obj.rectangle48:setLeft(000);
    obj.rectangle48:setTop(000);
    obj.rectangle48:setWidth(465);
    obj.rectangle48:setHeight(540);
    obj.rectangle48:setColor("Red");
    obj.rectangle48:setStrokeColor("black");
    obj.rectangle48:setStrokeSize(5);
    obj.rectangle48:setName("rectangle48");

    obj.richEdit5 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit5:setParent(obj.layout65);
    obj.richEdit5:setLeft(005);
    obj.richEdit5:setTop(005);
    obj.richEdit5:setWidth(455);
    obj.richEdit5:setHeight(530);
    lfm_setPropAsString(obj.richEdit5, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit5, "defaultFontColor",  "white");
    obj.richEdit5:setField("campoTextoGrande2");
    obj.richEdit5:setName("richEdit5");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl1);
    obj.tab11:setTitle("Créditos");
    obj.tab11:setName("tab11");

    obj.frmCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmCreditos:setParent(obj.tab11);
    obj.frmCreditos:setName("frmCreditos");
    obj.frmCreditos:setAlign("client");
    obj.frmCreditos:setTheme("dark");
    obj.frmCreditos:setMargins({top=1});

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.frmCreditos);
    obj.layout66:setLeft(000);
    obj.layout66:setTop(000);
    obj.layout66:setHeight(650);
    obj.layout66:setWidth(1100);
    obj.layout66:setName("layout66");

    obj.image66 = GUI.fromHandle(_obj_newObject("image"));
    obj.image66:setParent(obj.layout66);
    obj.image66:setLeft(000);
    obj.image66:setTop(000);
    obj.image66:setHeight(650);
    obj.image66:setWidth(1100);
    obj.image66:setSRC("/img/Pokeball.jpg");
    obj.image66:setStyle("autoFit");
    obj.image66:setName("image66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.frmCreditos);
    obj.layout67:setLeft(400);
    obj.layout67:setTop(200);
    obj.layout67:setHeight(600);
    obj.layout67:setWidth(465);
    obj.layout67:setName("layout67");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout67);
    obj.label239:setLeft(0);
    obj.label239:setTop(000);
    obj.label239:setHeight(20);
    obj.label239:setWidth(600);
    obj.label239:setText("Hitoshura (Criador do Plugin)");
    obj.label239:setAutoSize(true);
    obj.label239:setName("label239");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout67);
    obj.label240:setLeft(0);
    obj.label240:setTop(025);
    obj.label240:setHeight(20);
    obj.label240:setWidth(600);
    obj.label240:setText("Shakerskj (Aba pokedéx)");
    obj.label240:setAutoSize(true);
    obj.label240:setName("label240");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout67);
    obj.label241:setLeft(0);
    obj.label241:setTop(050);
    obj.label241:setHeight(20);
    obj.label241:setWidth(600);
    obj.label241:setText("Dragontail (Testes e sugestões)");
    obj.label241:setAutoSize(true);
    obj.label241:setName("label241");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout67);
    obj.label242:setLeft(0);
    obj.label242:setTop(075);
    obj.label242:setHeight(20);
    obj.label242:setWidth(600);
    obj.label242:setText("Ambesek (Ajudou BASTANTE no Código)");
    obj.label242:setAutoSize(true);
    obj.label242:setName("label242");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.layout67);
    obj.label243:setLeft(0);
    obj.label243:setTop(100);
    obj.label243:setHeight(20);
    obj.label243:setWidth(600);
    obj.label243:setText("Mia (Ajudou no código)");
    obj.label243:setAutoSize(true);
    obj.label243:setName("label243");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout67);
    obj.label244:setLeft(0);
    obj.label244:setTop(125);
    obj.label244:setHeight(20);
    obj.label244:setWidth(600);
    obj.label244:setText("Bloody (Ajudou no código)");
    obj.label244:setAutoSize(true);
    obj.label244:setName("label244");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.layout67);
    obj.label245:setLeft(0);
    obj.label245:setTop(150);
    obj.label245:setHeight(20);
    obj.label245:setWidth(600);
    obj.label245:setText("Webrian (Dicas e sugestões)");
    obj.label245:setAutoSize(true);
    obj.label245:setName("label245");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.layout67);
    obj.label246:setLeft(0);
    obj.label246:setTop(175);
    obj.label246:setHeight(20);
    obj.label246:setWidth(600);
    obj.label246:setText("Lucasedu19 (Dicas e sugestões)");
    obj.label246:setAutoSize(true);
    obj.label246:setName("label246");

    obj._e_event0 = obj.BotaoFOR:addEventListener("onClick",
        function (_)
            if sheet == nil then 
            					return 
            					end;
            				local NomeAtt = "Força" or "Atributo"	
            				local AttTot = tonumber(sheet.attTOFOR) or 0
            				local Teste = math.random(1,20);
            				local Teste2 = Teste + AttTot;
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:enviarMensagem("Total de [§B]" .. NomeAtt .. "[§B]: " .. Teste2 .. " [[§i]Dado:[§i] " .. Teste .. "]")
        end, obj);

    obj._e_event1 = obj.BotaoDES:addEventListener("onClick",
        function (_)
            if sheet == nil then 
            					return 
            					end;
            				local NomeAtt = "Destreza" or "Atributo"	
            				local AttTot = tonumber(sheet.attTODES) or 0
            				local Teste = math.random(1,20);
            				local Teste2 = Teste + AttTot;
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:enviarMensagem("Total de [§B]" .. NomeAtt .. "[§B]: " .. Teste2 .. " [[§i]Dado:[§i] " .. Teste .. "]")
        end, obj);

    obj._e_event2 = obj.BotaoCON:addEventListener("onClick",
        function (_)
            if sheet == nil then 
            					return 
            					end;
            				local NomeAtt = "Constituição" or "Atributo"	
            				local AttTot = tonumber(sheet.attTOCON) or 0
            				local Teste = math.random(1,20);
            				local Teste2 = Teste + AttTot;
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:enviarMensagem("Total de [§B]" .. NomeAtt .. "[§B]: " .. Teste2 .. " [[§i]Dado:[§i] " .. Teste .. "]")
        end, obj);

    obj._e_event3 = obj.BotaoINT:addEventListener("onClick",
        function (_)
            if sheet == nil then 
            					return 
            					end;
            				local NomeAtt = "Inteligência" or "Atributo"	
            				local AttTot = tonumber(sheet.attTOINT) or 0
            				local Teste = math.random(1,20);
            				local Teste2 = Teste + AttTot;
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:enviarMensagem("Total de [§B]" .. NomeAtt .. "[§B]: " .. Teste2 .. " [[§i]Dado:[§i] " .. Teste .. "]")
        end, obj);

    obj._e_event4 = obj.BotaoSAB:addEventListener("onClick",
        function (_)
            if sheet == nil then 
            					return 
            					end;
            				local NomeAtt = "Sabedoria" or "Atributo"	
            				local AttTot = tonumber(sheet.attTOSAB) or 0
            				local Teste = math.random(1,20);
            				local Teste2 = Teste + AttTot;
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:enviarMensagem("Total de [§B]" .. NomeAtt .. "[§B]: " .. Teste2 .. " [[§i]Dado:[§i] " .. Teste .. "]")
        end, obj);

    obj._e_event5 = obj.BotaoCAR:addEventListener("onClick",
        function (_)
            if sheet == nil then 
            					return 
            					end;
            				local NomeAtt = "Carisma" or "Atributo"	
            				local AttTot = tonumber(sheet.attTOCAR) or 0
            				local Teste = math.random(1,20);
            				local Teste2 = Teste + AttTot;
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:enviarMensagem("Total de [§B]" .. NomeAtt .. "[§B]: " .. Teste2 .. " [[§i]Dado:[§i] " .. Teste .. "]")
        end, obj);

    obj._e_event6 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot1 = "";
            				sheet.NomeSlot1 = "";
            				sheet.LevelSlot1 = "";
            				sheet.GenderSlot1 = "";
            				sheet.baseHPAtual1 = 0;
            				sheet.baseHPMAX1 = 0;
        end, obj);

    obj._e_event7 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot2 = "";
            				sheet.NomeSlot2 = "";
            				sheet.LevelSlot2 = "";
            				sheet.GenderSlot2 = "";
            				sheet.baseHPAtual2 = 0;
            				sheet.baseHPMAX2 = 0;
        end, obj);

    obj._e_event8 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot3 = "";
            				sheet.NomeSlot3 = "";
            				sheet.LevelSlot3 = "";
            				sheet.GenderSlot3 = "";
            				sheet.baseHPAtual3 = 0;
            				sheet.baseHPMAX3 = 0;
        end, obj);

    obj._e_event9 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot4 = "";
            				sheet.NomeSlot4 = "";
            				sheet.LevelSlot4 = "";
            				sheet.GenderSlot4 = "";
            				sheet.baseHPAtual4 = 0;
            				sheet.baseHPMAX4 = 0;
        end, obj);

    obj._e_event10 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot5 = "";
            				sheet.NomeSlot5 = "";
            				sheet.LevelSlot5 = "";
            				sheet.GenderSlot5 = "";
            				sheet.baseHPAtual5 = 0;
            				sheet.baseHPMAX5 = 0;
        end, obj);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet==nil 	then    return end
            				sheet.ImagemSlot6 = "";
            				sheet.NomeSlot6 = "";
            				sheet.LevelSlot6 = "";
            				sheet.GenderSlot6 = "";
            				sheet.baseHPAtual6 = 0;
            				sheet.baseHPMAX6 = 0;
        end, obj);

    obj._e_event12 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local Nivel = tonumber(sheet.basLV) or 1;
            				local BasFOR = sheet.attBAFOR or 0;
            				local NivFOR = sheet.attNVFOR or 0;
            				local BPeFOR = sheet.attBPFOR or 0;
            				local BTeFOR = sheet.attBTFOR or 0;
            				local TotFOR = BasFOR + NivFOR + BPeFOR + BTeFOR;
            				if (TotFOR > 10) then
            					ToTFOR = 10;
            					end
            				if (-3 > TotFOR) then
            					ToTFOR = -3;
            					end	
            				sheet.attTOFOR = TotFOR;
            				local BasDES = sheet.attBADES or 0;
            				local NivDES = sheet.attNVDES or 0;
            				local BPeDES = sheet.attBPDES or 0;
            				local BTeDES = sheet.attBTDES or 0;
            				local TotDES = BasDES + NivDES + BPeDES + BTeDES;
            				if (TotDES > 10) then
            					ToTDES = 10;
            					end
            				if (-3 > TotDES) then
            					ToTDES = -3;
            					end	
            				sheet.attTODES = TotDES;
            				local BasCON = sheet.attBACON or 0;
            				local NivCON = sheet.attNVCON or 0;
            				local BPeCON = sheet.attBPCON or 0;
            				local BTeCON = sheet.attBTCON or 0;
            				local TotCON = BasCON + NivCON + BPeCON + BTeCON;
            				if (TotCON > 10) then
            					ToTCON = 10;
            					end
            				if (-3 > TotCON) then
            					ToTCON = -3;
            					end	
            				sheet.attTOCON = TotCON;
            				local BasINT = sheet.attBAINT or 0;
            				local NivINT = sheet.attNVINT or 0;
            				local BPeINT = sheet.attBPINT or 0;
            				local BTeINT = sheet.attBTINT or 0;
            				local TotINT = BasINT + NivINT + BPeINT + BTeINT;
            				if (TotINT > 10) then
            					ToTINT = 10;
            					end
            				if (-3 > TotINT) then
            					ToTINT = -3;
            					end	
            				sheet.attTOINT = TotINT;
            				local BasSAB = sheet.attBASAB or 0;
            				local NivSAB = sheet.attNVSAB or 0;
            				local BPeSAB = sheet.attBPSAB or 0;
            				local BTeSAB = sheet.attBTSAB or 0;
            				local TotSAB = BasSAB + NivSAB + BPeSAB + BTeSAB;
            				if (TotSAB > 10) then
            					ToTSAB = 10;
            					end
            				if (-3 > TotSAB) then
            					ToTSAB = -3;
            					end	
            				sheet.attTOSAB = TotSAB;
            				local BasCAR = sheet.attBACAR or 0;
            				local NivCAR = sheet.attNVCAR or 0;
            				local BPeCAR = sheet.attBPCAR or 0;
            				local BTeCAR = sheet.attBTCAR or 0;
            				local TotCAR = BasCAR + NivCAR + BPeCAR + BTeCAR;
            				if (TotCAR > 10) then
            					ToTCAR = 10;
            					end
            				if (-3 > TotCAR) then
            					ToTCAR = -3;
            					end	
            				sheet.attTOCAR = TotCAR;	
            
            				sheet.basREND = 3000 + Nivel*200;
            				sheet.maxTXP = 50;
            				sheet.maxPXP = 60;
            				local AcaoDir = 5;
            				if (10 >= Nivel and Nivel >=6) then
            					AcaoDir = 6;
            					elseif (20 >= Nivel and Nivel >=11) then
            						AcaoDir = 7;
            					elseif (30 >= Nivel and Nivel >=21) then
            						AcaoDir = 8;
            					elseif (40 >= Nivel and Nivel >=31) then
            						AcaoDir = 9;
            					elseif (Nivel >=41) then
            						AcaoDir = 10;
            					end
            				sheet.maxADIR = tonumber(AcaoDir);
            				sheet.maxPVID = 20 + Nivel*2;
        end, obj);

    obj._e_event13 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclListaDosItens:append();
        end, obj);

    obj._e_event14 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclListaDosItens:sort();
        end, obj);

    obj._e_event15 = obj.rclListaDosItens:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosItens.selectedNode;
            					self.boxDetalhesDoItem.node = node;                    
            					self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event16 = obj.rclListaDosItens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (nodeA.active and not nodeB.active) then
            						return -1;
            						elseif (not nodeA.active and nodeB.active) then
            							return 1;
            						else
            							return Utils.compareStringPtBr(nodeA.campoNome, nodeB.campoNome);
            						end;
        end, obj);

    obj._e_event17 = obj.button9:addEventListener("onClick",
        function (_)
            local xml = NDB.exportXML(self.boxDetalhesDoItem.node);
            					local export = {};
            					local bytes = Utils.binaryEncode(export, "utf8", xml);
            					local stream = Utils.newMemoryStream();
            					bytes = stream:write(export);
            					Dialogs.saveFile("Salvar Ficha como XML", stream, "ficha.xml", "application/xml",
            						function()
            							stream:close();
            							showMessage("Ficha Exportada.");
            							end);
        end, obj);

    obj._e_event18 = obj.button10:addEventListener("onClick",
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

    obj._e_event19 = obj.comboBox1:addEventListener("onChange",
        function (_)
            if self.boxDetalhesDoItem.node==nil 					then    
            							return 
            							end
            						if self.boxDetalhesDoItem.node.campoGenero == "1" 		then	
            							self.boxDetalhesDoItem.node.basSEX = "/img/Gender_Male.png"	
            							end
            						if self.boxDetalhesDoItem.node.campoGenero == "2" 		then	
            							self.boxDetalhesDoItem.node.basSEX = "/img/Gender_Female.png"	
            							end
            						if self.boxDetalhesDoItem.node.campoGenero == "3" 		then	
            							self.boxDetalhesDoItem.node.basSEX = "/img/Gender_Less.png"	
            							end
        end, obj);

    obj._e_event20 = obj.edit98:addEventListener("onChange",
        function (_)
            if self.boxDetalhesDoItem.node == nil then return end;
            						local level = tonumber(self.boxDetalhesDoItem.node.pokeLevel) or 1
            						if 	1 > level or level > 100 then return end;
            						local xpTable = {5,10,15,20,25,30,35,40,45,50,60,70,80,90,100,110,120,130,140,150,165,180,195,210,225,240,255,270,285,300,320,340,360,380,400,420,440,460,480, 
            										500,525,550,575,600,625,650,675,700,725,750,775,800,825,850,875,900,925,950,975,1000,1025,1050,1075,1100,1125,1150,1175,1200,1225,1250,1275,
            										1300,1325,1350,1375,1400,1425,1450,1475,1500,1525,1550,1575,1600,1625,1650,1675,1700,1725,1750,1775,1800,1825,1850,1875,1900,1925,1950,1975};
            						self.boxDetalhesDoItem.node.nextLVEXP = xpTable [level];
        end, obj);

    obj._e_event21 = obj.BotaoHab:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popExemplo");					
            						if pop ~= nil then
            							pop:setNodeObject(self.boxDetalhesDoItem.node);
            							pop:showPopupEx("right", self.BotaoHab);
            						else
            							showMessage("Ops, erro");
            						end;
        end, obj);

    obj._e_event22 = obj.BotaoItemB:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popExemplo2");						
            						if pop ~= nil then
            							pop:setNodeObject(self.boxDetalhesDoItem.node);
            							pop:showPopupEx("right", self.BotaoItemB);
            						else
            							showMessage("Ops, erro");
            						end;
        end, obj);

    obj._e_event23 = obj.dataLink94:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local PweakTot = {"1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x","1x"};
            			local weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm"}
            			local CampoElem1Aux = self.boxDetalhesDoItem.node.campoElem1 or 0;
            			if CampoElem1Aux == "1" 		then	
            				weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Norm","Norm","Norm","Immu","Norm","Norm","Norm","Norm"}	
            				end
            			if CampoElem1Aux == "2" 		then	
            				weakElem1 = {"Norm","Resi","Weak","Norm","Resi","Resi","Norm","Norm","Weak","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Resi","Resi"}	
            				end
            			if CampoElem1Aux == "3" 		then	
            				weakElem1 = {"Norm","Resi","Resi","Weak","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm"}	
            				end
            			if CampoElem1Aux == "4" 		then	
            				weakElem1 = {"Norm","Norm","Norm","Resi","Norm","Norm","Norm","Norm","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm"}	
            				end
            			if CampoElem1Aux == "5" 		then	
            				weakElem1 = {"Norm","Weak","Resi","Resi","Resi","Weak","Norm","Weak","Resi","Weak","Norm","Weak","Norm","Norm","Norm","Norm","Norm","Norm"}	
            				end
            			if CampoElem1Aux == "6" 		then	
            				weakElem1 = {"Norm","Weak","Norm","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Weak","Norm"}	
            				end
            			if CampoElem1Aux == "7" 		then	
            				weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Weak","Resi","Resi","Norm","Norm","Resi","Norm","Weak"}	
            				end
            			if CampoElem1Aux == "8" 		then	
            				weakElem1 = {"Norm","Norm","Norm","Norm","Resi","Norm","Resi","Resi","Weak","Norm","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Resi"}	
            				end
            			if CampoElem1Aux == "9" 		then	
            				weakElem1 = {"Norm","Norm","Weak","Immu","Weak","Weak","Norm","Resi","Norm","Norm","Norm","Norm","Resi","Norm","Norm","Norm","Norm","Norm"}	
            				end
            			if CampoElem1Aux == "10" 		then	
            				weakElem1 = {"Norm","Norm","Norm","Weak","Resi","Weak","Resi","Norm","Immu","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Norm","Norm"}	
            				end
            			if CampoElem1Aux == "11" 		then	
            				weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm","Norm","Norm","Resi","Weak","Norm","Weak","Norm","Weak","Norm","Norm"}	
            				end
            			if CampoElem1Aux == "12" 		then	
            				weakElem1 = {"Norm","Weak","Norm","Norm","Resi","Norm","Resi","Norm","Resi","Weak","Norm","Norm","Weak","Norm","Norm","Norm","Norm","Norm"}	
            				end
            			if CampoElem1Aux == "13" 		then	
            				weakElem1 = {"Resi","Resi","Weak","Norm","Weak","Norm","Weak","Resi","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm"}	
            				end
            			if CampoElem1Aux == "14" 		then	
            				weakElem1 = {"Immu","Norm","Norm","Norm","Norm","Norm","Immu","Resi","Norm","Norm","Norm","Resi","Norm","Weak","Norm","Weak","Norm","Norm"}	
            				end
            			if CampoElem1Aux == "15" 		then	
            				weakElem1 = {"Norm","Resi","Resi","Resi","Resi","Weak","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Weak"}	
            				end
            			if CampoElem1Aux == "16" 		then	
            				weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Immu","Weak","Norm","Resi","Norm","Resi","Norm","Weak"}	
            				end
            			if CampoElem1Aux == "17" 		then	
            				weakElem1 = {"Resi","Weak","Norm","Norm","Resi","Resi","Weak","Immu","Weak","Resi","Resi","Resi","Resi","Norm","Resi","Norm","Resi","Resi"}	
            				end
            			if CampoElem1Aux == "18" 		then	
            				weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Resi","Norm","Norm","Immu","Resi","Weak","Norm"}	
            				end			
            			if CampoElem1Aux == "19" 		then	
            				weakElem1 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm"}	
            				end
            			local weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm"}
            			local CampoElem2Aux = self.boxDetalhesDoItem.node.campoElem2 or 0;
            			if CampoElem2Aux == "1" 		then	
            				weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Norm","Norm","Norm","Immu","Norm","Norm","Norm","Norm"}	
            				end
            			if CampoElem2Aux == "2" 		then	
            				weakElem2 = {"Norm","Resi","Weak","Norm","Resi","Resi","Norm","Norm","Weak","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Resi","Resi"}	
            				end
            			if CampoElem2Aux == "3" 		then	
            				weakElem2 = {"Norm","Resi","Resi","Weak","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm"}	
            				end
            			if CampoElem2Aux == "4" 		then	
            				weakElem2 = {"Norm","Norm","Norm","Resi","Norm","Norm","Norm","Norm","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm"}	
            				end
            			if CampoElem2Aux == "5" 		then	
            				weakElem2 = {"Norm","Weak","Resi","Resi","Resi","Weak","Norm","Weak","Resi","Weak","Norm","Weak","Norm","Norm","Norm","Norm","Norm","Norm"}	
            				end
            			if CampoElem2Aux == "6" 		then	
            				weakElem2 = {"Norm","Weak","Norm","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Weak","Norm"}	
            				end
            			if CampoElem2Aux == "7" 		then	
            				weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Weak","Resi","Resi","Norm","Norm","Resi","Norm","Weak"}	
            				end
            			if CampoElem2Aux == "8" 		then	
            				weakElem2 = {"Norm","Norm","Norm","Norm","Resi","Norm","Resi","Resi","Weak","Norm","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Resi"}	
            				end
            			if CampoElem2Aux == "9" 		then	
            				weakElem2 = {"Norm","Norm","Weak","Immu","Weak","Weak","Norm","Resi","Norm","Norm","Norm","Norm","Resi","Norm","Norm","Norm","Norm","Norm"}	
            				end
            			if CampoElem2Aux == "10" 		then	
            				weakElem2 = {"Norm","Norm","Norm","Weak","Resi","Weak","Resi","Norm","Immu","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Norm","Norm"}	
            				end
            			if CampoElem2Aux == "11" 		then	
            				weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Resi","Norm","Norm","Norm","Resi","Weak","Norm","Weak","Norm","Weak","Norm","Norm"}	
            				end
            			if CampoElem2Aux == "12" 		then	
            				weakElem2 = {"Norm","Weak","Norm","Norm","Resi","Norm","Resi","Norm","Resi","Weak","Norm","Norm","Weak","Norm","Norm","Norm","Norm","Norm"}	
            				end
            			if CampoElem2Aux == "13" 		then	
            				weakElem2 = {"Resi","Resi","Weak","Norm","Weak","Norm","Weak","Resi","Weak","Resi","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm"}	
            				end
            			if CampoElem2Aux == "14"		then	
            				weakElem2 = {"Immu","Norm","Norm","Norm","Norm","Norm","Immu","Resi","Norm","Norm","Norm","Resi","Norm","Weak","Norm","Weak","Norm","Norm"}	
            				end
            			if CampoElem2Aux == "15"		then	
            				weakElem2 = {"Norm","Resi","Resi","Resi","Resi","Weak","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Weak"}	
            				end
            			if CampoElem2Aux == "16" 		then	
            				weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Weak","Norm","Norm","Norm","Immu","Weak","Norm","Resi","Norm","Resi","Norm","Weak"}	
            				end
            			if CampoElem2Aux == "17" 		then	
            				weakElem2 = {"Resi","Weak","Norm","Norm","Resi","Resi","Weak","Immu","Weak","Resi","Resi","Resi","Resi","Norm","Resi","Norm","Resi","Resi"}	
            				end
            			if CampoElem2Aux == "18" 		then	
            				weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Resi","Weak","Norm","Norm","Norm","Resi","Norm","Norm","Immu","Resi","Weak","Norm"}	
            				end
            			if CampoElem2Aux == "19" 		then	
            				weakElem2 = {"Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm","Norm"}	
            				end
            			for i=1, 18, 1 do
            				if (weakElem1[i] == "Norm" and weakElem2[i] == "Norm") then 
            					PweakTot[i] = "x1"		
            					end
            				if (weakElem1[i] == "Resi" and weakElem2[i] == "Resi") then 
            					PweakTot[i] = "x0.25"	
            					end
            				if (weakElem1[i] == "Immu" and weakElem2[i] == "Immu") then 
            					PweakTot[i] = "x0"		
            					end
            				if (weakElem1[i] == "Weak" and weakElem2[i] == "Weak") then 
            					PweakTot[i] = "x2"		
            					end	  
            				if (weakElem1[i] == "Resi" and weakElem2[i] == "Norm") then 
            					PweakTot[i] = "x0.5"	
            					end
            				if (weakElem1[i] == "Norm" and weakElem2[i] == "Resi") then 
            					PweakTot[i] = "x0.5"	
            					end
            				if (weakElem1[i] == "Weak" and weakElem2[i] == "Norm") then 
            					PweakTot[i] = "x1.5"		
            					end
            				if (weakElem1[i] == "Norm" and weakElem2[i] == "Weak") then 
            					PweakTot[i] = "x1.5"		
            					end
            				if (weakElem1[i] == "Immu" and weakElem2[i] == "Norm") then 
            					PweakTot[i] = "x0"		
            					end
            				if (weakElem1[i] == "Norm" and weakElem2[i] == "Immu") then 
            					PweakTot[i] = "x0"		
            					end
            				if (weakElem1[i] == "Resi" and weakElem2[i] == "Weak") then 
            					PweakTot[i] = "x1"		
            					end
            				if (weakElem1[i] == "Weak" and weakElem2[i] == "Resi") then 
            					PweakTot[i] = "x1"		
            					end
            				if (weakElem1[i] == "Resi" and weakElem2[i] == "Immu") then 
            					PweakTot[i] = "x0"		
            					end
            				if (weakElem1[i] == "Immu" and weakElem2[i] == "Resi") then 
            					PweakTot[i] = "x0"		
            					end
            				if (weakElem1[i] == "Immu" and weakElem2[i] == "Weak") then 
            					PweakTot[i] = "x0"		
            					end
            				if (weakElem1[i] == "Weak" and weakElem2[i] == "Immu") then 
            					PweakTot[i] = "x0"		
            					end
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

    obj._e_event24 = obj.dataLink95:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if self.boxDetalhesDoItem.node == nil then return end;
            			local EdCtable = {0.4,0.5,0.6,0.7,0.8,0.9,1,1.2,1.4,1.6,1.8,2,2.2};
            			AuxMega = 0;
            			if (not self.boxDetalhesDoItem.node.MegaEvo) then AuxMega = 0;	end
            			if (self.boxDetalhesDoItem.node.MegaEvo == true) then AuxMega = 1;	end
            			local HPBase1 = tonumber(self.boxDetalhesDoItem.node.Vida_Base1) or 0;
            			local HPBon1 = tonumber(self.boxDetalhesDoItem.node.Vida_Bon1) or 0;
            			local HPNivel = tonumber(self.boxDetalhesDoItem.node.Vida_Nivel) or 0;
            			local HPVitam = tonumber(self.boxDetalhesDoItem.node.Vida_Vit) or 0;
            			if (HPBase1 > 0) then 
            				self.boxDetalhesDoItem.node.Vida_Form1 = math.floor((HPBase1 + HPNivel + HPVitam + HPBon1));
            				end
            			if (HPBase1 == 0) then 
            				self.boxDetalhesDoItem.node.Vida_Form1 = 0;
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
            			if (ATKBase1 == 0) then 
            				self.boxDetalhesDoItem.node.Ataque_Form1 = 0;
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
            			if (DEFBase1 == 0) then 
            				self.boxDetalhesDoItem.node.Defesa_Form1 = 0;
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
            			if (AESBase1 == 0) then 
            				self.boxDetalhesDoItem.node.AtaqueEsp_Form1 = 0;
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
            			if (DESBase1 == 0) then 
            				self.boxDetalhesDoItem.node.DefesaEsp_Form1 = 0;
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
            			if (VelBase1 == 0) then 
            				self.boxDetalhesDoItem.node.Velocidade_Form1 = 0;
            				end			
            			local EFISbon = self.boxDetalhesDoItem.node.pok_bonEVAF or 0;
            			local EESPbon = self.boxDetalhesDoItem.node.pok_bonEVAE or 0; 
            			local EVELbon = self.boxDetalhesDoItem.node.Pok_bonEVAV or 0;	
            			local INIbon = self.boxDetalhesDoItem.node.pok_bonINI or 0;	
            			local DEF_fim = self.boxDetalhesDoItem.node.Defesa_Form1 or 0;
            			if DEF_fim > 30 then 
            				DEF_fim = 30;	
            				end
            			local DEFE_fim = self.boxDetalhesDoItem.node.DefesaEsp_Form1 or 0;
            			if DEFE_fim > 30 then 
            				DEFE_fim = 30;	
            				end
            			local VEL_fim = self.boxDetalhesDoItem.node.Velocidade_Form1 or 0;
            			self.boxDetalhesDoItem.node.pok_INI = math.floor(VEL_fim) + INIbon;
            			if VEL_fim > 30 then 
            				VEL_fim = 30;	
            				end
            			local VIDA_fim = self.boxDetalhesDoItem.node.Vida_Form1 or 0;
            			self.boxDetalhesDoItem.node.campoEFIS = math.floor(DEF_fim/5) + EFISbon;
            			if (self.boxDetalhesDoItem.node.campoEFIS >9) then 
            				self.boxDetalhesDoItem.node.campoEFIS = 0; 	
            				end
            			self.boxDetalhesDoItem.node.campoEESP = math.floor(DEFE_fim/5) + EESPbon;
            			if (self.boxDetalhesDoItem.node.campoEESP >9) then 
            				self.boxDetalhesDoItem.node.campoEESP = 0; 	
            				end
            			self.boxDetalhesDoItem.node.campoEVEL = math.floor(VEL_fim/5) + EVELbon;
            			if (self.boxDetalhesDoItem.node.campoEVEL >9) then 
            				self.boxDetalhesDoItem.node.campoEVEL = 0; 	
            				end
            			local PokeLV = self.boxDetalhesDoItem.node.pokeLevel or 1
            			self.boxDetalhesDoItem.node.baseHPMAX = (VIDA_fim*2);						
            			
            			local MaxPoffins = 1 + math.floor(PokeLV/5);
            			if (MaxPoffins or 0 >= 6) then 
            				self.boxDetalhesDoItem.node.poffinsMax = 6; 
            				end
            			self.boxDetalhesDoItem.node.poffinsMax = MaxPoffins;
            			local bonTutor = self.boxDetalhesDoItem.node.Treino_Bonus or 0;
            			local MaxTutor = 1 + math.floor(PokeLV/5) + bonTutor;
            			self.boxDetalhesDoItem.node.Treino_Total = MaxTutor;
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
            			self.boxDetalhesDoItem.node.baseLealMAX = 20;	
            			self.boxDetalhesDoItem.node.maxpokTRE = 10;	
            			self.boxDetalhesDoItem.node.maxpokBT = 2;
            			local AXP = self.boxDetalhesDoItem.node.atupokAXP or 0;
            			if (AXP >=0 and 9 >= AXP) then
            				self.boxDetalhesDoItem.node.baspokAfin = 0;
            				self.boxDetalhesDoItem.node.maxpokAXP = 10;
            				end
            			if (AXP >=10 and 24 >= AXP) then
            				self.boxDetalhesDoItem.node.baspokAfin = 1;
            				self.boxDetalhesDoItem.node.maxpokAXP = 25;
            				end	
            			if (AXP >=25 and 44 >= AXP) then
            				self.boxDetalhesDoItem.node.baspokAfin = 2;
            				self.boxDetalhesDoItem.node.maxpokAXP = 45;
            				end	
            			if (AXP >=45 and 69 >= AXP) then
            				self.boxDetalhesDoItem.node.baspokAfin = 3;
            				self.boxDetalhesDoItem.node.maxpokAXP = 70;
            				end	
            			if (AXP >=70 and 99 >= AXP) then
            				self.boxDetalhesDoItem.node.baspokAfin = 4;
            				self.boxDetalhesDoItem.node.maxpokAXP = 100;
            				end		
            			if (AXP >=100) then
            				self.boxDetalhesDoItem.node.baspokAfin = 5;
            				self.boxDetalhesDoItem.node.maxpokAXP = 100;
            				end
        end, obj);

    obj._e_event25 = obj.dataLink96:addEventListener("onChange",
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

    obj._e_event26 = obj.button11:addEventListener("onClick",
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

    obj._e_event27 = obj.button12:addEventListener("onClick",
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

    obj._e_event28 = obj.button13:addEventListener("onClick",
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

    obj._e_event29 = obj.button14:addEventListener("onClick",
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

    obj._e_event30 = obj.button15:addEventListener("onClick",
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

    obj._e_event31 = obj.button16:addEventListener("onClick",
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

    obj._e_event32 = obj.button17:addEventListener("onClick",
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

    obj._e_event33 = obj.button18:addEventListener("onClick",
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

    obj._e_event34 = obj.button19:addEventListener("onClick",
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

    obj._e_event35 = obj.button20:addEventListener("onClick",
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

    obj._e_event36 = obj.button21:addEventListener("onClick",
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

    obj._e_event37 = obj.button22:addEventListener("onClick",
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

    obj._e_event38 = obj.button23:addEventListener("onClick",
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

    obj._e_event39 = obj.button24:addEventListener("onClick",
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

    obj._e_event40 = obj.button25:addEventListener("onClick",
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

    obj._e_event41 = obj.button26:addEventListener("onClick",
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

    obj._e_event42 = obj.button27:addEventListener("onClick",
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

    obj._e_event43 = obj.button28:addEventListener("onClick",
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

    obj._e_event44 = obj.button29:addEventListener("onClick",
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

    obj._e_event45 = obj.button30:addEventListener("onClick",
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

    obj._e_event46 = obj.button31:addEventListener("onClick",
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

    obj._e_event47 = obj.button32:addEventListener("onClick",
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

    obj._e_event48 = obj.button33:addEventListener("onClick",
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

    obj._e_event49 = obj.button34:addEventListener("onClick",
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

    obj._e_event50 = obj.button35:addEventListener("onClick",
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

    obj._e_event51 = obj.button36:addEventListener("onClick",
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

    obj._e_event52 = obj.button37:addEventListener("onClick",
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

    obj._e_event53 = obj.dataLink115:addEventListener("onChange",
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

    obj._e_event54 = obj.button38:addEventListener("onClick",
        function (_)
            self.rclListaDasCaracteristicasClasse:append();
        end, obj);

    obj._e_event55 = obj.rclListaDasCaracteristicasClasse:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event56 = obj.button39:addEventListener("onClick",
        function (_)
            self.rclDex:append();
        end, obj);

    obj._e_event57 = obj.rclDex:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (nodeA.pokeNumber or 0) < (nodeB.pokeNumber or 0) then
            							return -1;
            						elseif (nodeA.pokeNumber or 0) > (nodeB.pokeNumber or 0) then
            							return 1;
            						else   
            							return utils.compareStringPtBr(nodeA.pokeSpecie, nodeB.pokeSpecie);
            						end;
        end, obj);

    obj._e_event58 = obj.rclDex:addEventListener("onItemAdded",
        function (_, node, form)
            self.recalcDex();
        end, obj);

    obj._e_event59 = obj.rclDex:addEventListener("onItemRemoved",
        function (_, node, form)
            self.recalcDex();
        end, obj);

    function obj:_releaseEvents()
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
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.popHabilidade ~= nil then self.popHabilidade:destroy(); self.popHabilidade = nil; end;
        if self.rclDex ~= nil then self.rclDex:destroy(); self.rclDex = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.image51 ~= nil then self.image51:destroy(); self.image51 = nil; end;
        if self.BotaoDES ~= nil then self.BotaoDES:destroy(); self.BotaoDES = nil; end;
        if self.dataLink92 ~= nil then self.dataLink92:destroy(); self.dataLink92 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
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
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.dataLink102 ~= nil then self.dataLink102:destroy(); self.dataLink102 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.image56 ~= nil then self.image56:destroy(); self.image56 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.dataLink94 ~= nil then self.dataLink94:destroy(); self.dataLink94 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.progressBar5 ~= nil then self.progressBar5:destroy(); self.progressBar5 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.image49 ~= nil then self.image49:destroy(); self.image49 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.dataLink107 ~= nil then self.dataLink107:destroy(); self.dataLink107 = nil; end;
        if self.image52 ~= nil then self.image52:destroy(); self.image52 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.dataLink97 ~= nil then self.dataLink97:destroy(); self.dataLink97 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.image63 ~= nil then self.image63:destroy(); self.image63 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.dataLink111 ~= nil then self.dataLink111:destroy(); self.dataLink111 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.image64 ~= nil then self.image64:destroy(); self.image64 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.image54 ~= nil then self.image54:destroy(); self.image54 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.comboBox31 ~= nil then self.comboBox31:destroy(); self.comboBox31 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.dataLink120 ~= nil then self.dataLink120:destroy(); self.dataLink120 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.dataLink113 ~= nil then self.dataLink113:destroy(); self.dataLink113 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rclListaDasCaracteristicasClasse ~= nil then self.rclListaDasCaracteristicasClasse:destroy(); self.rclListaDasCaracteristicasClasse = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.frmPokemon4 ~= nil then self.frmPokemon4:destroy(); self.frmPokemon4 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink98 ~= nil then self.dataLink98:destroy(); self.dataLink98 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.image50 ~= nil then self.image50:destroy(); self.image50 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.image44 ~= nil then self.image44:destroy(); self.image44 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.image53 ~= nil then self.image53:destroy(); self.image53 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
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
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.dataLink117 ~= nil then self.dataLink117:destroy(); self.dataLink117 = nil; end;
        if self.BotaoFOR ~= nil then self.BotaoFOR:destroy(); self.BotaoFOR = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink108 ~= nil then self.dataLink108:destroy(); self.dataLink108 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
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
        if self.dataLink93 ~= nil then self.dataLink93:destroy(); self.dataLink93 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.image65 ~= nil then self.image65:destroy(); self.image65 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.image61 ~= nil then self.image61:destroy(); self.image61 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.dataLink112 ~= nil then self.dataLink112:destroy(); self.dataLink112 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.image47 ~= nil then self.image47:destroy(); self.image47 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.dataLink116 ~= nil then self.dataLink116:destroy(); self.dataLink116 = nil; end;
        if self.comboBox30 ~= nil then self.comboBox30:destroy(); self.comboBox30 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.image55 ~= nil then self.image55:destroy(); self.image55 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.frmTalMissions ~= nil then self.frmTalMissions:destroy(); self.frmTalMissions = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.BotaoCAR ~= nil then self.BotaoCAR:destroy(); self.BotaoCAR = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.dataLink99 ~= nil then self.dataLink99:destroy(); self.dataLink99 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
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
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.image46 ~= nil then self.image46:destroy(); self.image46 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.frmPokemon3 ~= nil then self.frmPokemon3:destroy(); self.frmPokemon3 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.image62 ~= nil then self.image62:destroy(); self.image62 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.progressBar4 ~= nil then self.progressBar4:destroy(); self.progressBar4 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.image66 ~= nil then self.image66:destroy(); self.image66 = nil; end;
        if self.dataLink101 ~= nil then self.dataLink101:destroy(); self.dataLink101 = nil; end;
        if self.popExemplo2 ~= nil then self.popExemplo2:destroy(); self.popExemplo2 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
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
        if self.dataLink96 ~= nil then self.dataLink96:destroy(); self.dataLink96 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.dataLink118 ~= nil then self.dataLink118:destroy(); self.dataLink118 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.comboBox32 ~= nil then self.comboBox32:destroy(); self.comboBox32 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.dataLink85 ~= nil then self.dataLink85:destroy(); self.dataLink85 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.comboBox34 ~= nil then self.comboBox34:destroy(); self.comboBox34 = nil; end;
        if self.progressBar3 ~= nil then self.progressBar3:destroy(); self.progressBar3 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.dataLink95 ~= nil then self.dataLink95:destroy(); self.dataLink95 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dataLink86 ~= nil then self.dataLink86:destroy(); self.dataLink86 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink89 ~= nil then self.dataLink89:destroy(); self.dataLink89 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.popExemplo ~= nil then self.popExemplo:destroy(); self.popExemplo = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.frmPokemon1 ~= nil then self.frmPokemon1:destroy(); self.frmPokemon1 = nil; end;
        if self.dataLink100 ~= nil then self.dataLink100:destroy(); self.dataLink100 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.image60 ~= nil then self.image60:destroy(); self.image60 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
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
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image45 ~= nil then self.image45:destroy(); self.image45 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.BotaoItemB ~= nil then self.BotaoItemB:destroy(); self.BotaoItemB = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.dataLink114 ~= nil then self.dataLink114:destroy(); self.dataLink114 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.BotaoINT ~= nil then self.BotaoINT:destroy(); self.BotaoINT = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.image41 ~= nil then self.image41:destroy(); self.image41 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.image58 ~= nil then self.image58:destroy(); self.image58 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.dataLink121 ~= nil then self.dataLink121:destroy(); self.dataLink121 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
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
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.dataLink119 ~= nil then self.dataLink119:destroy(); self.dataLink119 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.image59 ~= nil then self.image59:destroy(); self.image59 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.frmPokemon2 ~= nil then self.frmPokemon2:destroy(); self.frmPokemon2 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.dataLink110 ~= nil then self.dataLink110:destroy(); self.dataLink110 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.frmGeral ~= nil then self.frmGeral:destroy(); self.frmGeral = nil; end;
        if self.dataLink87 ~= nil then self.dataLink87:destroy(); self.dataLink87 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink122 ~= nil then self.dataLink122:destroy(); self.dataLink122 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.dataLink103 ~= nil then self.dataLink103:destroy(); self.dataLink103 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.dataLink115 ~= nil then self.dataLink115:destroy(); self.dataLink115 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
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
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
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
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.frmCreditos ~= nil then self.frmCreditos:destroy(); self.frmCreditos = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.dataLink91 ~= nil then self.dataLink91:destroy(); self.dataLink91 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.dataLink106 ~= nil then self.dataLink106:destroy(); self.dataLink106 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.image48 ~= nil then self.image48:destroy(); self.image48 = nil; end;
        if self.image57 ~= nil then self.image57:destroy(); self.image57 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.frmAnotacoes ~= nil then self.frmAnotacoes:destroy(); self.frmAnotacoes = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.frmMochila ~= nil then self.frmMochila:destroy(); self.frmMochila = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.image40 ~= nil then self.image40:destroy(); self.image40 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.frmPokedex ~= nil then self.frmPokedex:destroy(); self.frmPokedex = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.comboBox33 ~= nil then self.comboBox33:destroy(); self.comboBox33 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.BotaoSAB ~= nil then self.BotaoSAB:destroy(); self.BotaoSAB = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.BotaoHab ~= nil then self.BotaoHab:destroy(); self.BotaoHab = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
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
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.frmBackground ~= nil then self.frmBackground:destroy(); self.frmBackground = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.dataLink109 ~= nil then self.dataLink109:destroy(); self.dataLink109 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.BotaoCON ~= nil then self.BotaoCON:destroy(); self.BotaoCON = nil; end;
        if self.dataLink90 ~= nil then self.dataLink90:destroy(); self.dataLink90 = nil; end;
        if self.richEdit5 ~= nil then self.richEdit5:destroy(); self.richEdit5 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink88 ~= nil then self.dataLink88:destroy(); self.dataLink88 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.image43 ~= nil then self.image43:destroy(); self.image43 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmHITOPOKERPG()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmHITOPOKERPG();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmHITOPOKERPG = {
    newEditor = newfrmHITOPOKERPG, 
    new = newfrmHITOPOKERPG, 
    name = "frmHITOPOKERPG", 
    dataType = "HITO_PLAYER_POKERPG", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Hitoshura - PokéRPG", 
    description=""};

frmHITOPOKERPG = _frmHITOPOKERPG;
Firecast.registrarForm(_frmHITOPOKERPG);
Firecast.registrarDataType(_frmHITOPOKERPG);

return _frmHITOPOKERPG;
