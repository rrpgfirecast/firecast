require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmVaMv5()
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
    obj:setDataType("thirteen.VaMv5");
    obj:setTitle("V:aM V5");
    obj:setName("frmVaMv5");
    obj:setTheme("dark");


	local function CalcSangue()
	local nivel = 1;
	
	if(sheet.fldCheckPotencia_01 or false) then nivel = 2; end;
	if(sheet.fldCheckPotencia_02 or false) then nivel = 3; end;
	if(sheet.fldCheckPotencia_03 or false) then nivel = 4; end;
	if(sheet.fldCheckPotencia_04 or false) then nivel = 5; end;
	if(sheet.fldCheckPotencia_05 or false) then nivel = 6; end;
	if(sheet.fldCheckPotencia_06 or false) then nivel = 7; end;
	if(sheet.fldCheckPotencia_07 or false) then nivel = 8; end;
	if(sheet.fldCheckPotencia_08 or false) then nivel = 9; end;
	if(sheet.fldCheckPotencia_09 or false) then nivel = 10; end;
	if(sheet.fldCheckPotencia_10 or false) then nivel = 11; end;
	
	local tbBP ={
		{"+1 dado", "1 de Dano Superficial", "—", "—", "00", "—"},
		{"+2 dados", "1 de Dano Superficial", "—", "Nível 1", "02", "—"},
		{"+2 dados", "2 de Dano Superficial", "+1 dado", "Nível 1", "02", "Sangue Animal ou Conservado sacia Metade da Fome"},
		{"+3 dados", "2 de Dano Superficial", "+1 dado", "Abaixo do Nível 2", "03", "Sangue Animal ou Conservado não sacia Fome"},
		{"+3 dados", "3 de Dano Superficial", "+2 dados", "Abaixo do Nível 2", "03", "Sangue Animal ou Conservado não sacia Fome\n\nHumanos saciam -1 de Fome"},
		{"+4 dados", "3 de Dano Superficial", "+2 dados", "Abaixo do Nível 3", "04", "Sangue Animal ou Conservado não sacia Fome\n\nHumanos saciam -1 de Fome\n\nNecessário matar um mortal para reduzir Fome abaixo de 2"},
		{"+4 dados", "3 de Dano Superficial", "+3 dados", "Abaixo do Nível 3", "04", "Sangue Animal ou Conservado não sacia Fome\n\nHumanos saciam -2 de Fome\n\nNecessário matar um mortal para reduzir Fome abaixo de 2"},
		{"+5 dados", "3 de Dano Superficial", "+3 dados", "Abaixo do Nível 4", "05", "Sangue Animal ou Conservado não sacia Fome\n\nHumanos saciam -2 de Fome\n\nNecessário matar um mortal para reduzir Fome abaixo de 2"},
		{"+5 dados", "4 de Dano Superficial", "+4 dados", "Abaixo do Nível 4", "05", "Sangue Animal ou Conservado não sacia Fome\n\nHumanos saciam -2 de Fome\n\nNecessário matar um mortal para reduzir Fome abaixo de 3"},
		{"+6 dados", "4 de Dano Superficial", "+4 dados", "Abaixo do Nível 5", "06", "Sangue Animal ou Conservado não sacia Fome\n\nHumanos saciam -2 de Fome\n\nNecessário matar um mortal para reduzir Fome abaixo de 3"},
		{"+6 dados", "5 de Dano Superficial", "+5 dados", "Abaixo do Nível 5", "06", "Sangue Animal ou Conservado não sacia Fome\n\nHumanos saciam -3 de Fome\n\nNecessário matar um mortal para reduzir Fome abaixo de 3"},
	}; 
	
	sheet.fldsangSurto	= tbBP[nivel][1]; 
	sheet.fldsangRegen = tbBP[nivel][2];
	sheet.fldsangBonus = tbBP[nivel][3];
	sheet.fldsangReroll = tbBP[nivel][4];
	sheet.fldsangBane = tbBP[nivel][5];
	sheet.fldsangFeed = tbBP[nivel][6];
	
	end;
	
	local function TrocarAba(a)
		if(a == 'D') then
			if(self.layFrente:isVisible()) then
				self.layFrente.visible = false;
				self.layVerso.visible = true;
				self.layFrente:needRepaint();
				self.layVerso:needRepaint();
				
			elseif(self.layVerso:isVisible()) then
				self.layVerso.visible = false;
				self.layNote.visible = true;
				self.layVerso:needRepaint();
				self.layNote:needRepaint();
				
			elseif(self.layNote:isVisible()) then
				self.layNote.visible = false;
				self.layFrente.visible = true;
				self.layNote:needRepaint();
				self.layFrente:needRepaint();
			end;
		end;
		
		if(a == 'E') then
			if(self.layFrente:isVisible()) then
				self.layFrente.visible = false;
				self.layNote.visible = true;
				self.layFrente:needRepaint();
				self.layNote:needRepaint();
				
			elseif(self.layVerso:isVisible()) then
				self.layVerso.visible = false;
				self.layFrente.visible = true;
				self.layVerso:needRepaint();
				self.layFrente:needRepaint();
				
			elseif(self.layNote:isVisible()) then
				self.layNote.visible = false;
				self.layVerso.visible = true;
				self.layNote:needRepaint();
				self.layVerso:needRepaint();
			end;
		
		end;
	end;



    obj.frmTemplates = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplates:setParent(obj);
    obj.frmTemplates:setName("frmTemplates");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setAlign("client");
    obj.image1:setStyle("autoFit");
    obj.image1:setURL("/images/background.png");
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setFrameStyle("/frames/frameFundo.xml");
    obj.layout1:setName("layout1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.layout1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setAlign("top");
    obj.flowPart1:setHeight(1620);
    obj.flowPart1:setMinWidth(30);
    obj.flowPart1:setMaxWidth(50);
    obj.flowPart1:setName("flowPart1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.flowPart1);
    obj.image2:setAlign("client");
    obj.image2:setStyle("proportional");
    obj.image2:setURL("/images/left-arrow.png");
    obj.image2:setHitTest(true);
    obj.image2:setCursor("handPoint");
    obj.image2:setHint("Trocar de Aba");
    obj.image2:setName("image2");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setAlign("top");
    obj.flowPart2:setHeight(1620);
    obj.flowPart2:setMinWidth(400);
    obj.flowPart2:setMaxWidth(1000);
    obj.flowPart2:setName("flowPart2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowPart2);
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("transparent");
    obj.rectangle1:setStrokeColor("#272727");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setXradius(25);
    obj.rectangle1:setYradius(25);
    obj.rectangle1:setCornerType("bevel");
    obj.rectangle1:setMargins({top=20, right=20, bottom=20, left=20});

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setName("rectangle2");
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("transparent");
    obj.rectangle2:setStrokeColor("#272727");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setXradius(23);
    obj.rectangle2:setYradius(23);
    obj.rectangle2:setCornerType("bevel");
    obj.rectangle2:setMargins({top=5, right=5, bottom=5, left=5});

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle2);
    obj.rectangle3:setName("rectangle3");
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#272727");
    obj.rectangle3:setXradius(20);
    obj.rectangle3:setYradius(20);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setMargins({top=10, right=10, bottom=10, left=10});

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle3);
    obj.image3:setAlign("top");
    obj.image3:setStyle("proportional");
    obj.image3:setHeight(100);
    obj.image3:setURL("/images/logotype.png");
    obj.image3:setMargins({top=40, left=40, right=40});
    obj.image3:setName("image3");

    obj.layFrente = GUI.fromHandle(_obj_newObject("layout"));
    obj.layFrente:setParent(obj.rectangle3);
    obj.layFrente:setName("layFrente");
    obj.layFrente:setAlign("client");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.layFrente);
    obj.flowLayout2:setMargins({left=20, top=25, bottom=30, right=20});
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setOrientation("horizontal");
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(3);

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMinWidth(220);
    obj.flowPart3:setMaxWidth(220);
    obj.flowPart3:setHeight(25);
    obj.flowPart3:setMargins({left=20, right=20, bottom=10});

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart3);
    obj.label1:setAlign("left");
    obj.label1:setWidth(45);
    obj.label1:setText("Nome: ");
    obj.label1:setName("label1");
    obj.label1:setFontSize(14);
    obj.label1:setFontColor("white");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setTextTrimming("character");
    obj.label1:setFontFamily("Constantia");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart3);
    obj.edit1:setAlign("client");
    obj.edit1:setField("fldNome");
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("#cdcdcd");
    obj.edit1:setTextTrimming("character");
    obj.edit1:setFontFamily("Constantia");
    obj.edit1:setTransparent(true);

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout2);
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMinWidth(220);
    obj.flowPart4:setMaxWidth(220);
    obj.flowPart4:setHeight(25);
    obj.flowPart4:setMargins({left=20, right=20, bottom=10});

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart4);
    obj.label2:setAlign("left");
    obj.label2:setWidth(65);
    obj.label2:setText("Conceito: ");
    obj.label2:setName("label2");
    obj.label2:setFontSize(14);
    obj.label2:setFontColor("white");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setTextTrimming("character");
    obj.label2:setFontFamily("Constantia");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart4);
    obj.edit2:setAlign("client");
    obj.edit2:setField("fldConceito");
    obj.edit2:setName("edit2");
    obj.edit2:setFontSize(14);
    obj.edit2:setFontColor("#cdcdcd");
    obj.edit2:setTextTrimming("character");
    obj.edit2:setFontFamily("Constantia");
    obj.edit2:setTransparent(true);

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout2);
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMinWidth(220);
    obj.flowPart5:setMaxWidth(220);
    obj.flowPart5:setHeight(25);
    obj.flowPart5:setMargins({left=20, right=20, bottom=10});

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart5);
    obj.label3:setAlign("left");
    obj.label3:setWidth(68);
    obj.label3:setText("Predador: ");
    obj.label3:setName("label3");
    obj.label3:setFontSize(14);
    obj.label3:setFontColor("white");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setTextTrimming("character");
    obj.label3:setFontFamily("Constantia");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart5);
    obj.edit3:setAlign("client");
    obj.edit3:setField("fldPredador");
    obj.edit3:setName("edit3");
    obj.edit3:setFontSize(14);
    obj.edit3:setFontColor("#cdcdcd");
    obj.edit3:setTextTrimming("character");
    obj.edit3:setFontFamily("Constantia");
    obj.edit3:setTransparent(true);

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout2);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMinWidth(220);
    obj.flowPart6:setMaxWidth(220);
    obj.flowPart6:setHeight(25);
    obj.flowPart6:setMargins({left=20, right=20, bottom=10});

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart6);
    obj.label4:setAlign("left");
    obj.label4:setWidth(57);
    obj.label4:setText("Crônica: ");
    obj.label4:setName("label4");
    obj.label4:setFontSize(14);
    obj.label4:setFontColor("white");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setTextTrimming("character");
    obj.label4:setFontFamily("Constantia");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart6);
    obj.edit4:setAlign("client");
    obj.edit4:setField("fldCronica");
    obj.edit4:setName("edit4");
    obj.edit4:setFontSize(14);
    obj.edit4:setFontColor("#cdcdcd");
    obj.edit4:setTextTrimming("character");
    obj.edit4:setFontFamily("Constantia");
    obj.edit4:setTransparent(true);

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout2);
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMinWidth(220);
    obj.flowPart7:setMaxWidth(220);
    obj.flowPart7:setHeight(25);
    obj.flowPart7:setMargins({left=20, right=20, bottom=10});

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart7);
    obj.label5:setAlign("left");
    obj.label5:setWidth(65);
    obj.label5:setText("Ambição: ");
    obj.label5:setName("label5");
    obj.label5:setFontSize(14);
    obj.label5:setFontColor("white");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setTextTrimming("character");
    obj.label5:setFontFamily("Constantia");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart7);
    obj.edit5:setAlign("client");
    obj.edit5:setField("fldAmbicao");
    obj.edit5:setName("edit5");
    obj.edit5:setFontSize(14);
    obj.edit5:setFontColor("#cdcdcd");
    obj.edit5:setTextTrimming("character");
    obj.edit5:setFontFamily("Constantia");
    obj.edit5:setTransparent(true);

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout2);
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMinWidth(220);
    obj.flowPart8:setMaxWidth(220);
    obj.flowPart8:setHeight(25);
    obj.flowPart8:setMargins({left=20, right=20, bottom=10});

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart8);
    obj.label6:setAlign("left");
    obj.label6:setWidth(26);
    obj.label6:setText("Clã: ");
    obj.label6:setName("label6");
    obj.label6:setFontSize(14);
    obj.label6:setFontColor("white");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setTextTrimming("character");
    obj.label6:setFontFamily("Constantia");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart8);
    obj.edit6:setAlign("client");
    obj.edit6:setField("fldCla");
    obj.edit6:setName("edit6");
    obj.edit6:setFontSize(14);
    obj.edit6:setFontColor("#cdcdcd");
    obj.edit6:setTextTrimming("character");
    obj.edit6:setFontFamily("Constantia");
    obj.edit6:setTransparent(true);

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout2);
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setMinWidth(220);
    obj.flowPart9:setMaxWidth(220);
    obj.flowPart9:setHeight(25);
    obj.flowPart9:setMargins({left=20, right=20, bottom=10});

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart9);
    obj.label7:setAlign("left");
    obj.label7:setWidth(53);
    obj.label7:setText("Senhor: ");
    obj.label7:setName("label7");
    obj.label7:setFontSize(14);
    obj.label7:setFontColor("white");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setTextTrimming("character");
    obj.label7:setFontFamily("Constantia");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart9);
    obj.edit7:setAlign("client");
    obj.edit7:setField("fldSenhor");
    obj.edit7:setName("edit7");
    obj.edit7:setFontSize(14);
    obj.edit7:setFontColor("#cdcdcd");
    obj.edit7:setTextTrimming("character");
    obj.edit7:setFontFamily("Constantia");
    obj.edit7:setTransparent(true);

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout2);
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setMinWidth(220);
    obj.flowPart10:setMaxWidth(220);
    obj.flowPart10:setHeight(25);
    obj.flowPart10:setMargins({left=20, right=20, bottom=10});

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart10);
    obj.label8:setAlign("left");
    obj.label8:setWidth(50);
    obj.label8:setText("Desejo: ");
    obj.label8:setName("label8");
    obj.label8:setFontSize(14);
    obj.label8:setFontColor("white");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setTextTrimming("character");
    obj.label8:setFontFamily("Constantia");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart10);
    obj.edit8:setAlign("client");
    obj.edit8:setField("fldDesejo");
    obj.edit8:setName("edit8");
    obj.edit8:setFontSize(14);
    obj.edit8:setFontColor("#cdcdcd");
    obj.edit8:setTextTrimming("character");
    obj.edit8:setFontFamily("Constantia");
    obj.edit8:setTransparent(true);

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout2);
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setMinWidth(220);
    obj.flowPart11:setMaxWidth(220);
    obj.flowPart11:setHeight(25);
    obj.flowPart11:setMargins({left=20, right=20, bottom=10});

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart11);
    obj.label9:setAlign("left");
    obj.label9:setWidth(60);
    obj.label9:setText("Geração: ");
    obj.label9:setName("label9");
    obj.label9:setFontSize(14);
    obj.label9:setFontColor("white");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setTextTrimming("character");
    obj.label9:setFontFamily("Constantia");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart11);
    obj.edit9:setAlign("client");
    obj.edit9:setField("fldGeracao");
    obj.edit9:setName("edit9");
    obj.edit9:setFontSize(14);
    obj.edit9:setFontColor("#cdcdcd");
    obj.edit9:setTextTrimming("character");
    obj.edit9:setFontFamily("Constantia");
    obj.edit9:setTransparent(true);

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout2);
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setMinWidth(220);
    obj.flowPart12:setMaxWidth(220);
    obj.flowPart12:setHeight(25);
    obj.flowPart12:setMargins({left=20, right=20, bottom=10});

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart12);
    obj.label10:setAlign("left");
    obj.label10:setWidth(75);
    obj.label10:setText("Idade Real: ");
    obj.label10:setName("label10");
    obj.label10:setFontSize(14);
    obj.label10:setFontColor("white");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setTextTrimming("character");
    obj.label10:setFontFamily("Constantia");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart12);
    obj.edit10:setAlign("client");
    obj.edit10:setField("fldIdReal");
    obj.edit10:setName("edit10");
    obj.edit10:setFontSize(14);
    obj.edit10:setFontColor("#cdcdcd");
    obj.edit10:setTextTrimming("character");
    obj.edit10:setFontFamily("Constantia");
    obj.edit10:setTransparent(true);

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout2);
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setMinWidth(220);
    obj.flowPart13:setMaxWidth(220);
    obj.flowPart13:setHeight(25);
    obj.flowPart13:setMargins({left=20, right=20, bottom=10});

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart13);
    obj.label11:setAlign("left");
    obj.label11:setWidth(105);
    obj.label11:setText("Idade Aparente: ");
    obj.label11:setName("label11");
    obj.label11:setFontSize(14);
    obj.label11:setFontColor("white");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setTextTrimming("character");
    obj.label11:setFontFamily("Constantia");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart13);
    obj.edit11:setAlign("client");
    obj.edit11:setField("fldIdAparente");
    obj.edit11:setName("edit11");
    obj.edit11:setFontSize(14);
    obj.edit11:setFontColor("#cdcdcd");
    obj.edit11:setTextTrimming("character");
    obj.edit11:setFontFamily("Constantia");
    obj.edit11:setTransparent(true);

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout2);
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setMinWidth(220);
    obj.flowPart14:setMaxWidth(220);
    obj.flowPart14:setHeight(25);
    obj.flowPart14:setMargins({left=20, right=20, bottom=10});

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart14);
    obj.label12:setAlign("left");
    obj.label12:setWidth(87);
    obj.label12:setText("Ressonância: ");
    obj.label12:setName("label12");
    obj.label12:setFontSize(14);
    obj.label12:setFontColor("white");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setTextTrimming("character");
    obj.label12:setFontFamily("Constantia");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart14);
    obj.edit12:setAlign("client");
    obj.edit12:setField("fldRessonancia");
    obj.edit12:setName("edit12");
    obj.edit12:setFontSize(14);
    obj.edit12:setFontColor("#cdcdcd");
    obj.edit12:setTextTrimming("character");
    obj.edit12:setFontFamily("Constantia");
    obj.edit12:setTransparent(true);

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.layFrente);
    obj.flowLayout3:setHeight(25);
    obj.flowLayout3:setMargins({});
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setOrientation("horizontal");
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxControlsPerLine(3);

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout3);
    obj.flowPart15:setHeight(25);
    obj.flowPart15:setMinWidth(400);
    obj.flowPart15:setMaxWidth(1000);
    obj.flowPart15:setMargins({});
    obj.flowPart15:setName("flowPart15");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowPart15);
    obj.flowLayout4:setAutoHeight(false);
    obj.flowLayout4:setHeight(25);
    obj.flowLayout4:setMargins({});
    obj.flowLayout4:setName("flowLayout4");
    obj.flowLayout4:setAlign("top");
    obj.flowLayout4:setOrientation("horizontal");
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setMaxControlsPerLine(3);

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout4);
    obj.flowPart16:setHeight(25);
    obj.flowPart16:setMinWidth(0);
    obj.flowPart16:setMaxWidth(330);
    obj.flowPart16:setWidth(330);
    obj.flowPart16:setName("flowPart16");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart16);
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("#424242");
    obj.horzLine1:setMargins({top=7});
    obj.horzLine1:setAlign("top");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout4);
    obj.flowPart17:setHeight(25);
    obj.flowPart17:setWidth(160);
    obj.flowPart17:setName("flowPart17");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart17);
    obj.label13:setText("A T R I B U T O S");
    obj.label13:setName("label13");
    obj.label13:setFontSize(20);
    obj.label13:setFontColor("white");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setTextTrimming("character");
    obj.label13:setFontFamily("Constantia");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setAutoSize(true);
    obj.label13:setAlign("client");
    obj.label13:setMargins({bottom=7});

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout4);
    obj.flowPart18:setHeight(25);
    obj.flowPart18:setMinWidth(0);
    obj.flowPart18:setMaxWidth(330);
    obj.flowPart18:setWidth(330);
    obj.flowPart18:setName("flowPart18");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.flowPart18);
    obj.horzLine2:setName("horzLine2");
    obj.horzLine2:setStrokeColor("#424242");
    obj.horzLine2:setMargins({top=7});
    obj.horzLine2:setAlign("top");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.layFrente);
    obj.flowLayout5:setMargins({left=20, top=20, bottom=0, right=20});
    obj.flowLayout5:setName("flowLayout5");
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setOrientation("horizontal");
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setMaxControlsPerLine(3);

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout5);
    obj.flowPart19:setHeight(115);
    obj.flowPart19:setWidth(220);
    obj.flowPart19:setMargins({bottom=20, left=20, right=20});
    obj.flowPart19:setName("flowPart19");
    obj.flowPart19:setMinWidth(220);
    obj.flowPart19:setMaxWidth(220);

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.flowPart19);
    obj.flowLayout6:setOrientation("vertical");
    obj.flowLayout6:setWidth(220);
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMaxColumns(1);
    obj.flowLayout6:setName("flowLayout6");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout6);
    obj.flowPart20:setMargins({bottom=5});
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setMinWidth(220);
    obj.flowPart20:setMaxWidth(220);
    obj.flowPart20:setHeight(25);

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart20);
    obj.label14:setText("F Í S I C O");
    obj.label14:setName("label14");
    obj.label14:setFontSize(10);
    obj.label14:setFontColor("white");
    obj.label14:setTextTrimming("character");
    obj.label14:setFontFamily("Constantia");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setAlign("top");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout6);
    obj.flowPart21:setMargins({bottom=5});
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setMinWidth(220);
    obj.flowPart21:setMaxWidth(220);
    obj.flowPart21:setHeight(25);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart21);
    obj.label15:setAlign("left");
    obj.label15:setWidth(100);
    obj.label15:setText("Força");
    obj.label15:setName("label15");
    obj.label15:setFontSize(14);
    obj.label15:setFontColor("white");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setTextTrimming("character");
    obj.label15:setFontFamily("Constantia");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart21);
    obj.layout2:setAlign("client");
    obj.layout2:setMargins({right=10});
    obj.layout2:setName("layout2");

    obj.nomeCheck01_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck01_01:setParent(obj.layout2);
    obj.nomeCheck01_01:setField("fldCheck01_01");
    obj.nomeCheck01_01:setName("nomeCheck01_01");
    obj.nomeCheck01_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck01_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck01_01:setHeight(25);
    obj.nomeCheck01_01:setWidth(14);
    obj.nomeCheck01_01:setAlign("right");
    obj.nomeCheck01_01:setMargins({left=3});
    obj.nomeCheck01_01:setAutoChange(false);

    obj.nomeCheck01_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck01_02:setParent(obj.layout2);
    obj.nomeCheck01_02:setField("fldCheck01_02");
    obj.nomeCheck01_02:setName("nomeCheck01_02");
    obj.nomeCheck01_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck01_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck01_02:setHeight(25);
    obj.nomeCheck01_02:setWidth(14);
    obj.nomeCheck01_02:setAlign("right");
    obj.nomeCheck01_02:setMargins({left=3});
    obj.nomeCheck01_02:setAutoChange(false);

    obj.nomeCheck01_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck01_03:setParent(obj.layout2);
    obj.nomeCheck01_03:setField("fldCheck01_03");
    obj.nomeCheck01_03:setName("nomeCheck01_03");
    obj.nomeCheck01_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck01_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck01_03:setHeight(25);
    obj.nomeCheck01_03:setWidth(14);
    obj.nomeCheck01_03:setAlign("right");
    obj.nomeCheck01_03:setMargins({left=3});
    obj.nomeCheck01_03:setAutoChange(false);

    obj.nomeCheck01_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck01_04:setParent(obj.layout2);
    obj.nomeCheck01_04:setField("fldCheck01_04");
    obj.nomeCheck01_04:setName("nomeCheck01_04");
    obj.nomeCheck01_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck01_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck01_04:setHeight(25);
    obj.nomeCheck01_04:setWidth(14);
    obj.nomeCheck01_04:setAlign("right");
    obj.nomeCheck01_04:setMargins({left=3});
    obj.nomeCheck01_04:setAutoChange(false);

    obj.nomeCheck01_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck01_05:setParent(obj.layout2);
    obj.nomeCheck01_05:setField("fldCheck01_05");
    obj.nomeCheck01_05:setName("nomeCheck01_05");
    obj.nomeCheck01_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck01_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck01_05:setHeight(25);
    obj.nomeCheck01_05:setWidth(14);
    obj.nomeCheck01_05:setAlign("right");
    obj.nomeCheck01_05:setMargins({left=3});
    obj.nomeCheck01_05:setAutoChange(false);

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout6);
    obj.flowPart22:setMargins({bottom=5});
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setMinWidth(220);
    obj.flowPart22:setMaxWidth(220);
    obj.flowPart22:setHeight(25);

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart22);
    obj.label16:setAlign("left");
    obj.label16:setWidth(100);
    obj.label16:setText("Destreza");
    obj.label16:setName("label16");
    obj.label16:setFontSize(14);
    obj.label16:setFontColor("white");
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");
    obj.label16:setTextTrimming("character");
    obj.label16:setFontFamily("Constantia");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowPart22);
    obj.layout3:setAlign("client");
    obj.layout3:setMargins({right=10});
    obj.layout3:setName("layout3");

    obj.nomeCheck02_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck02_01:setParent(obj.layout3);
    obj.nomeCheck02_01:setField("fldCheck02_01");
    obj.nomeCheck02_01:setName("nomeCheck02_01");
    obj.nomeCheck02_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck02_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck02_01:setHeight(25);
    obj.nomeCheck02_01:setWidth(14);
    obj.nomeCheck02_01:setAlign("right");
    obj.nomeCheck02_01:setMargins({left=3});
    obj.nomeCheck02_01:setAutoChange(false);

    obj.nomeCheck02_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck02_02:setParent(obj.layout3);
    obj.nomeCheck02_02:setField("fldCheck02_02");
    obj.nomeCheck02_02:setName("nomeCheck02_02");
    obj.nomeCheck02_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck02_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck02_02:setHeight(25);
    obj.nomeCheck02_02:setWidth(14);
    obj.nomeCheck02_02:setAlign("right");
    obj.nomeCheck02_02:setMargins({left=3});
    obj.nomeCheck02_02:setAutoChange(false);

    obj.nomeCheck02_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck02_03:setParent(obj.layout3);
    obj.nomeCheck02_03:setField("fldCheck02_03");
    obj.nomeCheck02_03:setName("nomeCheck02_03");
    obj.nomeCheck02_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck02_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck02_03:setHeight(25);
    obj.nomeCheck02_03:setWidth(14);
    obj.nomeCheck02_03:setAlign("right");
    obj.nomeCheck02_03:setMargins({left=3});
    obj.nomeCheck02_03:setAutoChange(false);

    obj.nomeCheck02_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck02_04:setParent(obj.layout3);
    obj.nomeCheck02_04:setField("fldCheck02_04");
    obj.nomeCheck02_04:setName("nomeCheck02_04");
    obj.nomeCheck02_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck02_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck02_04:setHeight(25);
    obj.nomeCheck02_04:setWidth(14);
    obj.nomeCheck02_04:setAlign("right");
    obj.nomeCheck02_04:setMargins({left=3});
    obj.nomeCheck02_04:setAutoChange(false);

    obj.nomeCheck02_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck02_05:setParent(obj.layout3);
    obj.nomeCheck02_05:setField("fldCheck02_05");
    obj.nomeCheck02_05:setName("nomeCheck02_05");
    obj.nomeCheck02_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck02_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck02_05:setHeight(25);
    obj.nomeCheck02_05:setWidth(14);
    obj.nomeCheck02_05:setAlign("right");
    obj.nomeCheck02_05:setMargins({left=3});
    obj.nomeCheck02_05:setAutoChange(false);

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout6);
    obj.flowPart23:setMargins({bottom=5});
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setMinWidth(220);
    obj.flowPart23:setMaxWidth(220);
    obj.flowPart23:setHeight(25);

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart23);
    obj.label17:setAlign("left");
    obj.label17:setWidth(100);
    obj.label17:setText("Vigor");
    obj.label17:setName("label17");
    obj.label17:setFontSize(14);
    obj.label17:setFontColor("white");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setTextTrimming("character");
    obj.label17:setFontFamily("Constantia");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flowPart23);
    obj.layout4:setAlign("client");
    obj.layout4:setMargins({right=10});
    obj.layout4:setName("layout4");

    obj.nomeCheck03_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck03_01:setParent(obj.layout4);
    obj.nomeCheck03_01:setField("fldCheck03_01");
    obj.nomeCheck03_01:setName("nomeCheck03_01");
    obj.nomeCheck03_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck03_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck03_01:setHeight(25);
    obj.nomeCheck03_01:setWidth(14);
    obj.nomeCheck03_01:setAlign("right");
    obj.nomeCheck03_01:setMargins({left=3});
    obj.nomeCheck03_01:setAutoChange(false);

    obj.nomeCheck03_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck03_02:setParent(obj.layout4);
    obj.nomeCheck03_02:setField("fldCheck03_02");
    obj.nomeCheck03_02:setName("nomeCheck03_02");
    obj.nomeCheck03_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck03_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck03_02:setHeight(25);
    obj.nomeCheck03_02:setWidth(14);
    obj.nomeCheck03_02:setAlign("right");
    obj.nomeCheck03_02:setMargins({left=3});
    obj.nomeCheck03_02:setAutoChange(false);

    obj.nomeCheck03_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck03_03:setParent(obj.layout4);
    obj.nomeCheck03_03:setField("fldCheck03_03");
    obj.nomeCheck03_03:setName("nomeCheck03_03");
    obj.nomeCheck03_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck03_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck03_03:setHeight(25);
    obj.nomeCheck03_03:setWidth(14);
    obj.nomeCheck03_03:setAlign("right");
    obj.nomeCheck03_03:setMargins({left=3});
    obj.nomeCheck03_03:setAutoChange(false);

    obj.nomeCheck03_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck03_04:setParent(obj.layout4);
    obj.nomeCheck03_04:setField("fldCheck03_04");
    obj.nomeCheck03_04:setName("nomeCheck03_04");
    obj.nomeCheck03_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck03_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck03_04:setHeight(25);
    obj.nomeCheck03_04:setWidth(14);
    obj.nomeCheck03_04:setAlign("right");
    obj.nomeCheck03_04:setMargins({left=3});
    obj.nomeCheck03_04:setAutoChange(false);

    obj.nomeCheck03_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck03_05:setParent(obj.layout4);
    obj.nomeCheck03_05:setField("fldCheck03_05");
    obj.nomeCheck03_05:setName("nomeCheck03_05");
    obj.nomeCheck03_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck03_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck03_05:setHeight(25);
    obj.nomeCheck03_05:setWidth(14);
    obj.nomeCheck03_05:setAlign("right");
    obj.nomeCheck03_05:setMargins({left=3});
    obj.nomeCheck03_05:setAutoChange(false);

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout5);
    obj.flowPart24:setHeight(115);
    obj.flowPart24:setWidth(220);
    obj.flowPart24:setMargins({bottom=20, left=20, right=20});
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setMinWidth(220);
    obj.flowPart24:setMaxWidth(220);

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.flowPart24);
    obj.flowLayout7:setOrientation("vertical");
    obj.flowLayout7:setWidth(220);
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setMaxColumns(1);
    obj.flowLayout7:setName("flowLayout7");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout7);
    obj.flowPart25:setMargins({bottom=5});
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setMinWidth(220);
    obj.flowPart25:setMaxWidth(220);
    obj.flowPart25:setHeight(25);

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart25);
    obj.label18:setText("S O C I A L");
    obj.label18:setName("label18");
    obj.label18:setFontSize(10);
    obj.label18:setFontColor("white");
    obj.label18:setTextTrimming("character");
    obj.label18:setFontFamily("Constantia");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setAlign("top");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout7);
    obj.flowPart26:setMargins({bottom=5});
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setMinWidth(220);
    obj.flowPart26:setMaxWidth(220);
    obj.flowPart26:setHeight(25);

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart26);
    obj.label19:setAlign("left");
    obj.label19:setWidth(100);
    obj.label19:setText("Carisma");
    obj.label19:setName("label19");
    obj.label19:setFontSize(14);
    obj.label19:setFontColor("white");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setTextTrimming("character");
    obj.label19:setFontFamily("Constantia");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart26);
    obj.layout5:setAlign("client");
    obj.layout5:setMargins({right=10});
    obj.layout5:setName("layout5");

    obj.nomeCheck04_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck04_01:setParent(obj.layout5);
    obj.nomeCheck04_01:setField("fldCheck04_01");
    obj.nomeCheck04_01:setName("nomeCheck04_01");
    obj.nomeCheck04_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck04_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck04_01:setHeight(25);
    obj.nomeCheck04_01:setWidth(14);
    obj.nomeCheck04_01:setAlign("right");
    obj.nomeCheck04_01:setMargins({left=3});
    obj.nomeCheck04_01:setAutoChange(false);

    obj.nomeCheck04_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck04_02:setParent(obj.layout5);
    obj.nomeCheck04_02:setField("fldCheck04_02");
    obj.nomeCheck04_02:setName("nomeCheck04_02");
    obj.nomeCheck04_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck04_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck04_02:setHeight(25);
    obj.nomeCheck04_02:setWidth(14);
    obj.nomeCheck04_02:setAlign("right");
    obj.nomeCheck04_02:setMargins({left=3});
    obj.nomeCheck04_02:setAutoChange(false);

    obj.nomeCheck04_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck04_03:setParent(obj.layout5);
    obj.nomeCheck04_03:setField("fldCheck04_03");
    obj.nomeCheck04_03:setName("nomeCheck04_03");
    obj.nomeCheck04_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck04_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck04_03:setHeight(25);
    obj.nomeCheck04_03:setWidth(14);
    obj.nomeCheck04_03:setAlign("right");
    obj.nomeCheck04_03:setMargins({left=3});
    obj.nomeCheck04_03:setAutoChange(false);

    obj.nomeCheck04_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck04_04:setParent(obj.layout5);
    obj.nomeCheck04_04:setField("fldCheck04_04");
    obj.nomeCheck04_04:setName("nomeCheck04_04");
    obj.nomeCheck04_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck04_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck04_04:setHeight(25);
    obj.nomeCheck04_04:setWidth(14);
    obj.nomeCheck04_04:setAlign("right");
    obj.nomeCheck04_04:setMargins({left=3});
    obj.nomeCheck04_04:setAutoChange(false);

    obj.nomeCheck04_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck04_05:setParent(obj.layout5);
    obj.nomeCheck04_05:setField("fldCheck04_05");
    obj.nomeCheck04_05:setName("nomeCheck04_05");
    obj.nomeCheck04_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck04_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck04_05:setHeight(25);
    obj.nomeCheck04_05:setWidth(14);
    obj.nomeCheck04_05:setAlign("right");
    obj.nomeCheck04_05:setMargins({left=3});
    obj.nomeCheck04_05:setAutoChange(false);

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout7);
    obj.flowPart27:setMargins({bottom=5});
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setMinWidth(220);
    obj.flowPart27:setMaxWidth(220);
    obj.flowPart27:setHeight(25);

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart27);
    obj.label20:setAlign("left");
    obj.label20:setWidth(100);
    obj.label20:setText("Manipulação");
    obj.label20:setName("label20");
    obj.label20:setFontSize(14);
    obj.label20:setFontColor("white");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setTextTrimming("character");
    obj.label20:setFontFamily("Constantia");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.flowPart27);
    obj.layout6:setAlign("client");
    obj.layout6:setMargins({right=10});
    obj.layout6:setName("layout6");

    obj.nomeCheck05_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck05_01:setParent(obj.layout6);
    obj.nomeCheck05_01:setField("fldCheck05_01");
    obj.nomeCheck05_01:setName("nomeCheck05_01");
    obj.nomeCheck05_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck05_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck05_01:setHeight(25);
    obj.nomeCheck05_01:setWidth(14);
    obj.nomeCheck05_01:setAlign("right");
    obj.nomeCheck05_01:setMargins({left=3});
    obj.nomeCheck05_01:setAutoChange(false);

    obj.nomeCheck05_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck05_02:setParent(obj.layout6);
    obj.nomeCheck05_02:setField("fldCheck05_02");
    obj.nomeCheck05_02:setName("nomeCheck05_02");
    obj.nomeCheck05_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck05_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck05_02:setHeight(25);
    obj.nomeCheck05_02:setWidth(14);
    obj.nomeCheck05_02:setAlign("right");
    obj.nomeCheck05_02:setMargins({left=3});
    obj.nomeCheck05_02:setAutoChange(false);

    obj.nomeCheck05_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck05_03:setParent(obj.layout6);
    obj.nomeCheck05_03:setField("fldCheck05_03");
    obj.nomeCheck05_03:setName("nomeCheck05_03");
    obj.nomeCheck05_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck05_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck05_03:setHeight(25);
    obj.nomeCheck05_03:setWidth(14);
    obj.nomeCheck05_03:setAlign("right");
    obj.nomeCheck05_03:setMargins({left=3});
    obj.nomeCheck05_03:setAutoChange(false);

    obj.nomeCheck05_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck05_04:setParent(obj.layout6);
    obj.nomeCheck05_04:setField("fldCheck05_04");
    obj.nomeCheck05_04:setName("nomeCheck05_04");
    obj.nomeCheck05_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck05_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck05_04:setHeight(25);
    obj.nomeCheck05_04:setWidth(14);
    obj.nomeCheck05_04:setAlign("right");
    obj.nomeCheck05_04:setMargins({left=3});
    obj.nomeCheck05_04:setAutoChange(false);

    obj.nomeCheck05_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck05_05:setParent(obj.layout6);
    obj.nomeCheck05_05:setField("fldCheck05_05");
    obj.nomeCheck05_05:setName("nomeCheck05_05");
    obj.nomeCheck05_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck05_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck05_05:setHeight(25);
    obj.nomeCheck05_05:setWidth(14);
    obj.nomeCheck05_05:setAlign("right");
    obj.nomeCheck05_05:setMargins({left=3});
    obj.nomeCheck05_05:setAutoChange(false);

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout7);
    obj.flowPart28:setMargins({bottom=5});
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setMinWidth(220);
    obj.flowPart28:setMaxWidth(220);
    obj.flowPart28:setHeight(25);

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart28);
    obj.label21:setAlign("left");
    obj.label21:setWidth(100);
    obj.label21:setText("Autocontrole");
    obj.label21:setName("label21");
    obj.label21:setFontSize(14);
    obj.label21:setFontColor("white");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setTextTrimming("character");
    obj.label21:setFontFamily("Constantia");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.flowPart28);
    obj.layout7:setAlign("client");
    obj.layout7:setMargins({right=10});
    obj.layout7:setName("layout7");

    obj.nomeCheck06_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck06_01:setParent(obj.layout7);
    obj.nomeCheck06_01:setField("fldCheck06_01");
    obj.nomeCheck06_01:setName("nomeCheck06_01");
    obj.nomeCheck06_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck06_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck06_01:setHeight(25);
    obj.nomeCheck06_01:setWidth(14);
    obj.nomeCheck06_01:setAlign("right");
    obj.nomeCheck06_01:setMargins({left=3});
    obj.nomeCheck06_01:setAutoChange(false);

    obj.nomeCheck06_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck06_02:setParent(obj.layout7);
    obj.nomeCheck06_02:setField("fldCheck06_02");
    obj.nomeCheck06_02:setName("nomeCheck06_02");
    obj.nomeCheck06_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck06_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck06_02:setHeight(25);
    obj.nomeCheck06_02:setWidth(14);
    obj.nomeCheck06_02:setAlign("right");
    obj.nomeCheck06_02:setMargins({left=3});
    obj.nomeCheck06_02:setAutoChange(false);

    obj.nomeCheck06_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck06_03:setParent(obj.layout7);
    obj.nomeCheck06_03:setField("fldCheck06_03");
    obj.nomeCheck06_03:setName("nomeCheck06_03");
    obj.nomeCheck06_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck06_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck06_03:setHeight(25);
    obj.nomeCheck06_03:setWidth(14);
    obj.nomeCheck06_03:setAlign("right");
    obj.nomeCheck06_03:setMargins({left=3});
    obj.nomeCheck06_03:setAutoChange(false);

    obj.nomeCheck06_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck06_04:setParent(obj.layout7);
    obj.nomeCheck06_04:setField("fldCheck06_04");
    obj.nomeCheck06_04:setName("nomeCheck06_04");
    obj.nomeCheck06_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck06_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck06_04:setHeight(25);
    obj.nomeCheck06_04:setWidth(14);
    obj.nomeCheck06_04:setAlign("right");
    obj.nomeCheck06_04:setMargins({left=3});
    obj.nomeCheck06_04:setAutoChange(false);

    obj.nomeCheck06_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck06_05:setParent(obj.layout7);
    obj.nomeCheck06_05:setField("fldCheck06_05");
    obj.nomeCheck06_05:setName("nomeCheck06_05");
    obj.nomeCheck06_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck06_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck06_05:setHeight(25);
    obj.nomeCheck06_05:setWidth(14);
    obj.nomeCheck06_05:setAlign("right");
    obj.nomeCheck06_05:setMargins({left=3});
    obj.nomeCheck06_05:setAutoChange(false);

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout5);
    obj.flowPart29:setHeight(115);
    obj.flowPart29:setWidth(220);
    obj.flowPart29:setMargins({bottom=20, left=20, right=20});
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setMinWidth(220);
    obj.flowPart29:setMaxWidth(220);

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowPart29);
    obj.flowLayout8:setOrientation("vertical");
    obj.flowLayout8:setWidth(220);
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setMaxColumns(1);
    obj.flowLayout8:setName("flowLayout8");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout8);
    obj.flowPart30:setMargins({bottom=5});
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setMinWidth(220);
    obj.flowPart30:setMaxWidth(220);
    obj.flowPart30:setHeight(25);

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart30);
    obj.label22:setText("M E N T A L");
    obj.label22:setName("label22");
    obj.label22:setFontSize(10);
    obj.label22:setFontColor("white");
    obj.label22:setTextTrimming("character");
    obj.label22:setFontFamily("Constantia");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setAlign("top");
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout8);
    obj.flowPart31:setMargins({bottom=5});
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setMinWidth(220);
    obj.flowPart31:setMaxWidth(220);
    obj.flowPart31:setHeight(25);

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart31);
    obj.label23:setAlign("left");
    obj.label23:setWidth(100);
    obj.label23:setText("Inteligência");
    obj.label23:setName("label23");
    obj.label23:setFontSize(14);
    obj.label23:setFontColor("white");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setTextTrimming("character");
    obj.label23:setFontFamily("Constantia");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.flowPart31);
    obj.layout8:setAlign("client");
    obj.layout8:setMargins({right=10});
    obj.layout8:setName("layout8");

    obj.nomeCheck07_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck07_01:setParent(obj.layout8);
    obj.nomeCheck07_01:setField("fldCheck07_01");
    obj.nomeCheck07_01:setName("nomeCheck07_01");
    obj.nomeCheck07_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck07_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck07_01:setHeight(25);
    obj.nomeCheck07_01:setWidth(14);
    obj.nomeCheck07_01:setAlign("right");
    obj.nomeCheck07_01:setMargins({left=3});
    obj.nomeCheck07_01:setAutoChange(false);

    obj.nomeCheck07_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck07_02:setParent(obj.layout8);
    obj.nomeCheck07_02:setField("fldCheck07_02");
    obj.nomeCheck07_02:setName("nomeCheck07_02");
    obj.nomeCheck07_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck07_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck07_02:setHeight(25);
    obj.nomeCheck07_02:setWidth(14);
    obj.nomeCheck07_02:setAlign("right");
    obj.nomeCheck07_02:setMargins({left=3});
    obj.nomeCheck07_02:setAutoChange(false);

    obj.nomeCheck07_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck07_03:setParent(obj.layout8);
    obj.nomeCheck07_03:setField("fldCheck07_03");
    obj.nomeCheck07_03:setName("nomeCheck07_03");
    obj.nomeCheck07_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck07_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck07_03:setHeight(25);
    obj.nomeCheck07_03:setWidth(14);
    obj.nomeCheck07_03:setAlign("right");
    obj.nomeCheck07_03:setMargins({left=3});
    obj.nomeCheck07_03:setAutoChange(false);

    obj.nomeCheck07_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck07_04:setParent(obj.layout8);
    obj.nomeCheck07_04:setField("fldCheck07_04");
    obj.nomeCheck07_04:setName("nomeCheck07_04");
    obj.nomeCheck07_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck07_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck07_04:setHeight(25);
    obj.nomeCheck07_04:setWidth(14);
    obj.nomeCheck07_04:setAlign("right");
    obj.nomeCheck07_04:setMargins({left=3});
    obj.nomeCheck07_04:setAutoChange(false);

    obj.nomeCheck07_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck07_05:setParent(obj.layout8);
    obj.nomeCheck07_05:setField("fldCheck07_05");
    obj.nomeCheck07_05:setName("nomeCheck07_05");
    obj.nomeCheck07_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck07_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck07_05:setHeight(25);
    obj.nomeCheck07_05:setWidth(14);
    obj.nomeCheck07_05:setAlign("right");
    obj.nomeCheck07_05:setMargins({left=3});
    obj.nomeCheck07_05:setAutoChange(false);

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout8);
    obj.flowPart32:setMargins({bottom=5});
    obj.flowPart32:setName("flowPart32");
    obj.flowPart32:setMinWidth(220);
    obj.flowPart32:setMaxWidth(220);
    obj.flowPart32:setHeight(25);

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart32);
    obj.label24:setAlign("left");
    obj.label24:setWidth(100);
    obj.label24:setText("Raciocínio");
    obj.label24:setName("label24");
    obj.label24:setFontSize(14);
    obj.label24:setFontColor("white");
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setTextTrimming("character");
    obj.label24:setFontFamily("Constantia");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flowPart32);
    obj.layout9:setAlign("client");
    obj.layout9:setMargins({right=10});
    obj.layout9:setName("layout9");

    obj.nomeCheck08_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck08_01:setParent(obj.layout9);
    obj.nomeCheck08_01:setField("fldCheck08_01");
    obj.nomeCheck08_01:setName("nomeCheck08_01");
    obj.nomeCheck08_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck08_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck08_01:setHeight(25);
    obj.nomeCheck08_01:setWidth(14);
    obj.nomeCheck08_01:setAlign("right");
    obj.nomeCheck08_01:setMargins({left=3});
    obj.nomeCheck08_01:setAutoChange(false);

    obj.nomeCheck08_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck08_02:setParent(obj.layout9);
    obj.nomeCheck08_02:setField("fldCheck08_02");
    obj.nomeCheck08_02:setName("nomeCheck08_02");
    obj.nomeCheck08_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck08_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck08_02:setHeight(25);
    obj.nomeCheck08_02:setWidth(14);
    obj.nomeCheck08_02:setAlign("right");
    obj.nomeCheck08_02:setMargins({left=3});
    obj.nomeCheck08_02:setAutoChange(false);

    obj.nomeCheck08_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck08_03:setParent(obj.layout9);
    obj.nomeCheck08_03:setField("fldCheck08_03");
    obj.nomeCheck08_03:setName("nomeCheck08_03");
    obj.nomeCheck08_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck08_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck08_03:setHeight(25);
    obj.nomeCheck08_03:setWidth(14);
    obj.nomeCheck08_03:setAlign("right");
    obj.nomeCheck08_03:setMargins({left=3});
    obj.nomeCheck08_03:setAutoChange(false);

    obj.nomeCheck08_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck08_04:setParent(obj.layout9);
    obj.nomeCheck08_04:setField("fldCheck08_04");
    obj.nomeCheck08_04:setName("nomeCheck08_04");
    obj.nomeCheck08_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck08_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck08_04:setHeight(25);
    obj.nomeCheck08_04:setWidth(14);
    obj.nomeCheck08_04:setAlign("right");
    obj.nomeCheck08_04:setMargins({left=3});
    obj.nomeCheck08_04:setAutoChange(false);

    obj.nomeCheck08_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck08_05:setParent(obj.layout9);
    obj.nomeCheck08_05:setField("fldCheck08_05");
    obj.nomeCheck08_05:setName("nomeCheck08_05");
    obj.nomeCheck08_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck08_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck08_05:setHeight(25);
    obj.nomeCheck08_05:setWidth(14);
    obj.nomeCheck08_05:setAlign("right");
    obj.nomeCheck08_05:setMargins({left=3});
    obj.nomeCheck08_05:setAutoChange(false);

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout8);
    obj.flowPart33:setMargins({bottom=5});
    obj.flowPart33:setName("flowPart33");
    obj.flowPart33:setMinWidth(220);
    obj.flowPart33:setMaxWidth(220);
    obj.flowPart33:setHeight(25);

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart33);
    obj.label25:setAlign("left");
    obj.label25:setWidth(100);
    obj.label25:setText("Determinação");
    obj.label25:setName("label25");
    obj.label25:setFontSize(14);
    obj.label25:setFontColor("white");
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setTextTrimming("character");
    obj.label25:setFontFamily("Constantia");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.flowPart33);
    obj.layout10:setAlign("client");
    obj.layout10:setMargins({right=10});
    obj.layout10:setName("layout10");

    obj.nomeCheck09_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck09_01:setParent(obj.layout10);
    obj.nomeCheck09_01:setField("fldCheck09_01");
    obj.nomeCheck09_01:setName("nomeCheck09_01");
    obj.nomeCheck09_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck09_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck09_01:setHeight(25);
    obj.nomeCheck09_01:setWidth(14);
    obj.nomeCheck09_01:setAlign("right");
    obj.nomeCheck09_01:setMargins({left=3});
    obj.nomeCheck09_01:setAutoChange(false);

    obj.nomeCheck09_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck09_02:setParent(obj.layout10);
    obj.nomeCheck09_02:setField("fldCheck09_02");
    obj.nomeCheck09_02:setName("nomeCheck09_02");
    obj.nomeCheck09_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck09_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck09_02:setHeight(25);
    obj.nomeCheck09_02:setWidth(14);
    obj.nomeCheck09_02:setAlign("right");
    obj.nomeCheck09_02:setMargins({left=3});
    obj.nomeCheck09_02:setAutoChange(false);

    obj.nomeCheck09_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck09_03:setParent(obj.layout10);
    obj.nomeCheck09_03:setField("fldCheck09_03");
    obj.nomeCheck09_03:setName("nomeCheck09_03");
    obj.nomeCheck09_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck09_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck09_03:setHeight(25);
    obj.nomeCheck09_03:setWidth(14);
    obj.nomeCheck09_03:setAlign("right");
    obj.nomeCheck09_03:setMargins({left=3});
    obj.nomeCheck09_03:setAutoChange(false);

    obj.nomeCheck09_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck09_04:setParent(obj.layout10);
    obj.nomeCheck09_04:setField("fldCheck09_04");
    obj.nomeCheck09_04:setName("nomeCheck09_04");
    obj.nomeCheck09_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck09_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck09_04:setHeight(25);
    obj.nomeCheck09_04:setWidth(14);
    obj.nomeCheck09_04:setAlign("right");
    obj.nomeCheck09_04:setMargins({left=3});
    obj.nomeCheck09_04:setAutoChange(false);

    obj.nomeCheck09_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck09_05:setParent(obj.layout10);
    obj.nomeCheck09_05:setField("fldCheck09_05");
    obj.nomeCheck09_05:setName("nomeCheck09_05");
    obj.nomeCheck09_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck09_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck09_05:setHeight(25);
    obj.nomeCheck09_05:setWidth(14);
    obj.nomeCheck09_05:setAlign("right");
    obj.nomeCheck09_05:setMargins({left=3});
    obj.nomeCheck09_05:setAutoChange(false);

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.layFrente);
    obj.flowLayout9:setMargins({left=20, top=10, bottom=30, right=20});
    obj.flowLayout9:setName("flowLayout9");
    obj.flowLayout9:setAlign("top");
    obj.flowLayout9:setOrientation("horizontal");
    obj.flowLayout9:setHorzAlign("center");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setMaxControlsPerLine(3);

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout9);
    obj.flowPart34:setHeight(45);
    obj.flowPart34:setMinWidth(252);
    obj.flowPart34:setMaxWidth(252);
    obj.flowPart34:setMargins({bottom=20, left=10, right=10});
    obj.flowPart34:setName("flowPart34");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.flowPart34);
    obj.flowLayout10:setOrientation("vertical");
    obj.flowLayout10:setWidth(252);
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setMaxColumns(1);
    obj.flowLayout10:setName("flowLayout10");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout10);
    obj.flowPart35:setHeight(15);
    obj.flowPart35:setMargins({bottom=5});
    obj.flowPart35:setName("flowPart35");
    obj.flowPart35:setMinWidth(220);
    obj.flowPart35:setMaxWidth(220);

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart35);
    obj.label26:setText("V I T A L I D A D E");
    obj.label26:setName("label26");
    obj.label26:setFontSize(10);
    obj.label26:setFontColor("white");
    obj.label26:setTextTrimming("character");
    obj.label26:setFontFamily("Constantia");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setAlign("top");
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout10);
    obj.flowPart36:setMargins({bottom=5});
    obj.flowPart36:setMinWidth(252);
    obj.flowPart36:setMaxWidth(252);
    obj.flowPart36:setName("flowPart36");
    obj.flowPart36:setHeight(25);

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart36);
    obj.layout11:setWidth(14);
    obj.layout11:setHeight(25);
    obj.layout11:setAlign("left");
    obj.layout11:setMargins({right=3});
    obj.layout11:setName("layout11");

    obj.checkMulVit_Des_01_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_01_Vit:setParent(obj.layout11);
    obj.checkMulVit_Des_01_Vit:setName("checkMulVit_Des_01_Vit");
    obj.checkMulVit_Des_01_Vit:setWidth(14);
    obj.checkMulVit_Des_01_Vit:setHeight(25);
    obj.checkMulVit_Des_01_Vit:setField("checkMulVit_Des_01_Vit");
    obj.checkMulVit_Des_01_Vit:setStyle("proportional");
    obj.checkMulVit_Des_01_Vit:setVisible(true);
    obj.checkMulVit_Des_01_Vit:setHitTest(true);
    obj.checkMulVit_Des_01_Vit:setCursor("handPoint");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout11);
    obj.dataLink1:setField("checkMulVit_Des_01_Vit");
    obj.dataLink1:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink1:setName("dataLink1");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowPart36);
    obj.layout12:setWidth(14);
    obj.layout12:setHeight(25);
    obj.layout12:setAlign("left");
    obj.layout12:setMargins({right=3});
    obj.layout12:setName("layout12");

    obj.checkMulVit_Des_02_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_02_Vit:setParent(obj.layout12);
    obj.checkMulVit_Des_02_Vit:setName("checkMulVit_Des_02_Vit");
    obj.checkMulVit_Des_02_Vit:setWidth(14);
    obj.checkMulVit_Des_02_Vit:setHeight(25);
    obj.checkMulVit_Des_02_Vit:setField("checkMulVit_Des_02_Vit");
    obj.checkMulVit_Des_02_Vit:setStyle("proportional");
    obj.checkMulVit_Des_02_Vit:setVisible(true);
    obj.checkMulVit_Des_02_Vit:setHitTest(true);
    obj.checkMulVit_Des_02_Vit:setCursor("handPoint");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout12);
    obj.dataLink2:setField("checkMulVit_Des_02_Vit");
    obj.dataLink2:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink2:setName("dataLink2");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.flowPart36);
    obj.layout13:setWidth(14);
    obj.layout13:setHeight(25);
    obj.layout13:setAlign("left");
    obj.layout13:setMargins({right=3});
    obj.layout13:setName("layout13");

    obj.checkMulVit_Des_03_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_03_Vit:setParent(obj.layout13);
    obj.checkMulVit_Des_03_Vit:setName("checkMulVit_Des_03_Vit");
    obj.checkMulVit_Des_03_Vit:setWidth(14);
    obj.checkMulVit_Des_03_Vit:setHeight(25);
    obj.checkMulVit_Des_03_Vit:setField("checkMulVit_Des_03_Vit");
    obj.checkMulVit_Des_03_Vit:setStyle("proportional");
    obj.checkMulVit_Des_03_Vit:setVisible(true);
    obj.checkMulVit_Des_03_Vit:setHitTest(true);
    obj.checkMulVit_Des_03_Vit:setCursor("handPoint");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout13);
    obj.dataLink3:setField("checkMulVit_Des_03_Vit");
    obj.dataLink3:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink3:setName("dataLink3");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.flowPart36);
    obj.layout14:setWidth(14);
    obj.layout14:setHeight(25);
    obj.layout14:setAlign("left");
    obj.layout14:setMargins({right=3});
    obj.layout14:setName("layout14");

    obj.checkMulVit_Des_04_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_04_Vit:setParent(obj.layout14);
    obj.checkMulVit_Des_04_Vit:setName("checkMulVit_Des_04_Vit");
    obj.checkMulVit_Des_04_Vit:setWidth(14);
    obj.checkMulVit_Des_04_Vit:setHeight(25);
    obj.checkMulVit_Des_04_Vit:setField("checkMulVit_Des_04_Vit");
    obj.checkMulVit_Des_04_Vit:setStyle("proportional");
    obj.checkMulVit_Des_04_Vit:setVisible(true);
    obj.checkMulVit_Des_04_Vit:setHitTest(true);
    obj.checkMulVit_Des_04_Vit:setCursor("handPoint");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout14);
    obj.dataLink4:setField("checkMulVit_Des_04_Vit");
    obj.dataLink4:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink4:setName("dataLink4");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.flowPart36);
    obj.layout15:setWidth(14);
    obj.layout15:setHeight(25);
    obj.layout15:setAlign("left");
    obj.layout15:setMargins({right=3});
    obj.layout15:setName("layout15");

    obj.checkMulVit_Des_05_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_05_Vit:setParent(obj.layout15);
    obj.checkMulVit_Des_05_Vit:setName("checkMulVit_Des_05_Vit");
    obj.checkMulVit_Des_05_Vit:setWidth(14);
    obj.checkMulVit_Des_05_Vit:setHeight(25);
    obj.checkMulVit_Des_05_Vit:setField("checkMulVit_Des_05_Vit");
    obj.checkMulVit_Des_05_Vit:setStyle("proportional");
    obj.checkMulVit_Des_05_Vit:setVisible(true);
    obj.checkMulVit_Des_05_Vit:setHitTest(true);
    obj.checkMulVit_Des_05_Vit:setCursor("handPoint");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout15);
    obj.dataLink5:setField("checkMulVit_Des_05_Vit");
    obj.dataLink5:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink5:setName("dataLink5");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.flowPart36);
    obj.layout16:setWidth(14);
    obj.layout16:setHeight(25);
    obj.layout16:setAlign("left");
    obj.layout16:setMargins({right=3});
    obj.layout16:setName("layout16");

    obj.checkMulVit_Des_06_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_06_Vit:setParent(obj.layout16);
    obj.checkMulVit_Des_06_Vit:setName("checkMulVit_Des_06_Vit");
    obj.checkMulVit_Des_06_Vit:setWidth(14);
    obj.checkMulVit_Des_06_Vit:setHeight(25);
    obj.checkMulVit_Des_06_Vit:setField("checkMulVit_Des_06_Vit");
    obj.checkMulVit_Des_06_Vit:setStyle("proportional");
    obj.checkMulVit_Des_06_Vit:setVisible(true);
    obj.checkMulVit_Des_06_Vit:setHitTest(true);
    obj.checkMulVit_Des_06_Vit:setCursor("handPoint");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout16);
    obj.dataLink6:setField("checkMulVit_Des_06_Vit");
    obj.dataLink6:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink6:setName("dataLink6");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.flowPart36);
    obj.layout17:setWidth(14);
    obj.layout17:setHeight(25);
    obj.layout17:setAlign("left");
    obj.layout17:setMargins({right=3});
    obj.layout17:setName("layout17");

    obj.checkMulVit_Des_07_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_07_Vit:setParent(obj.layout17);
    obj.checkMulVit_Des_07_Vit:setName("checkMulVit_Des_07_Vit");
    obj.checkMulVit_Des_07_Vit:setWidth(14);
    obj.checkMulVit_Des_07_Vit:setHeight(25);
    obj.checkMulVit_Des_07_Vit:setField("checkMulVit_Des_07_Vit");
    obj.checkMulVit_Des_07_Vit:setStyle("proportional");
    obj.checkMulVit_Des_07_Vit:setVisible(true);
    obj.checkMulVit_Des_07_Vit:setHitTest(true);
    obj.checkMulVit_Des_07_Vit:setCursor("handPoint");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout17);
    obj.dataLink7:setField("checkMulVit_Des_07_Vit");
    obj.dataLink7:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink7:setName("dataLink7");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.flowPart36);
    obj.layout18:setWidth(14);
    obj.layout18:setHeight(25);
    obj.layout18:setAlign("left");
    obj.layout18:setMargins({right=3});
    obj.layout18:setName("layout18");

    obj.checkMulVit_Des_08_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_08_Vit:setParent(obj.layout18);
    obj.checkMulVit_Des_08_Vit:setName("checkMulVit_Des_08_Vit");
    obj.checkMulVit_Des_08_Vit:setWidth(14);
    obj.checkMulVit_Des_08_Vit:setHeight(25);
    obj.checkMulVit_Des_08_Vit:setField("checkMulVit_Des_08_Vit");
    obj.checkMulVit_Des_08_Vit:setStyle("proportional");
    obj.checkMulVit_Des_08_Vit:setVisible(true);
    obj.checkMulVit_Des_08_Vit:setHitTest(true);
    obj.checkMulVit_Des_08_Vit:setCursor("handPoint");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout18);
    obj.dataLink8:setField("checkMulVit_Des_08_Vit");
    obj.dataLink8:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink8:setName("dataLink8");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.flowPart36);
    obj.layout19:setWidth(14);
    obj.layout19:setHeight(25);
    obj.layout19:setAlign("right");
    obj.layout19:setMargins({left=3});
    obj.layout19:setName("layout19");

    obj.checkMulVit_Des_09_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_09_Vit:setParent(obj.layout19);
    obj.checkMulVit_Des_09_Vit:setName("checkMulVit_Des_09_Vit");
    obj.checkMulVit_Des_09_Vit:setWidth(14);
    obj.checkMulVit_Des_09_Vit:setHeight(25);
    obj.checkMulVit_Des_09_Vit:setField("checkMulVit_Des_09_Vit");
    obj.checkMulVit_Des_09_Vit:setStyle("proportional");
    obj.checkMulVit_Des_09_Vit:setVisible(true);
    obj.checkMulVit_Des_09_Vit:setHitTest(true);
    obj.checkMulVit_Des_09_Vit:setCursor("handPoint");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout19);
    obj.dataLink9:setField("checkMulVit_Des_09_Vit");
    obj.dataLink9:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink9:setName("dataLink9");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.flowPart36);
    obj.layout20:setWidth(14);
    obj.layout20:setHeight(25);
    obj.layout20:setAlign("right");
    obj.layout20:setMargins({left=3});
    obj.layout20:setName("layout20");

    obj.checkMulVit_Des_10_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_10_Vit:setParent(obj.layout20);
    obj.checkMulVit_Des_10_Vit:setName("checkMulVit_Des_10_Vit");
    obj.checkMulVit_Des_10_Vit:setWidth(14);
    obj.checkMulVit_Des_10_Vit:setHeight(25);
    obj.checkMulVit_Des_10_Vit:setField("checkMulVit_Des_10_Vit");
    obj.checkMulVit_Des_10_Vit:setStyle("proportional");
    obj.checkMulVit_Des_10_Vit:setVisible(true);
    obj.checkMulVit_Des_10_Vit:setHitTest(true);
    obj.checkMulVit_Des_10_Vit:setCursor("handPoint");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout20);
    obj.dataLink10:setField("checkMulVit_Des_10_Vit");
    obj.dataLink10:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink10:setName("dataLink10");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.flowPart36);
    obj.layout21:setWidth(14);
    obj.layout21:setHeight(25);
    obj.layout21:setAlign("right");
    obj.layout21:setMargins({left=3});
    obj.layout21:setName("layout21");

    obj.checkMulVit_Des_11_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_11_Vit:setParent(obj.layout21);
    obj.checkMulVit_Des_11_Vit:setName("checkMulVit_Des_11_Vit");
    obj.checkMulVit_Des_11_Vit:setWidth(14);
    obj.checkMulVit_Des_11_Vit:setHeight(25);
    obj.checkMulVit_Des_11_Vit:setField("checkMulVit_Des_11_Vit");
    obj.checkMulVit_Des_11_Vit:setStyle("proportional");
    obj.checkMulVit_Des_11_Vit:setVisible(true);
    obj.checkMulVit_Des_11_Vit:setHitTest(true);
    obj.checkMulVit_Des_11_Vit:setCursor("handPoint");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout21);
    obj.dataLink11:setField("checkMulVit_Des_11_Vit");
    obj.dataLink11:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink11:setName("dataLink11");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.flowPart36);
    obj.layout22:setWidth(14);
    obj.layout22:setHeight(25);
    obj.layout22:setAlign("right");
    obj.layout22:setMargins({left=3});
    obj.layout22:setName("layout22");

    obj.checkMulVit_Des_12_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_12_Vit:setParent(obj.layout22);
    obj.checkMulVit_Des_12_Vit:setName("checkMulVit_Des_12_Vit");
    obj.checkMulVit_Des_12_Vit:setWidth(14);
    obj.checkMulVit_Des_12_Vit:setHeight(25);
    obj.checkMulVit_Des_12_Vit:setField("checkMulVit_Des_12_Vit");
    obj.checkMulVit_Des_12_Vit:setStyle("proportional");
    obj.checkMulVit_Des_12_Vit:setVisible(true);
    obj.checkMulVit_Des_12_Vit:setHitTest(true);
    obj.checkMulVit_Des_12_Vit:setCursor("handPoint");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout22);
    obj.dataLink12:setField("checkMulVit_Des_12_Vit");
    obj.dataLink12:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink12:setName("dataLink12");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.flowPart36);
    obj.layout23:setWidth(14);
    obj.layout23:setHeight(25);
    obj.layout23:setAlign("right");
    obj.layout23:setMargins({left=3});
    obj.layout23:setName("layout23");

    obj.checkMulVit_Des_13_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_13_Vit:setParent(obj.layout23);
    obj.checkMulVit_Des_13_Vit:setName("checkMulVit_Des_13_Vit");
    obj.checkMulVit_Des_13_Vit:setWidth(14);
    obj.checkMulVit_Des_13_Vit:setHeight(25);
    obj.checkMulVit_Des_13_Vit:setField("checkMulVit_Des_13_Vit");
    obj.checkMulVit_Des_13_Vit:setStyle("proportional");
    obj.checkMulVit_Des_13_Vit:setVisible(true);
    obj.checkMulVit_Des_13_Vit:setHitTest(true);
    obj.checkMulVit_Des_13_Vit:setCursor("handPoint");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout23);
    obj.dataLink13:setField("checkMulVit_Des_13_Vit");
    obj.dataLink13:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink13:setName("dataLink13");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.flowPart36);
    obj.layout24:setWidth(14);
    obj.layout24:setHeight(25);
    obj.layout24:setAlign("right");
    obj.layout24:setMargins({left=3});
    obj.layout24:setName("layout24");

    obj.checkMulVit_Des_14_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_14_Vit:setParent(obj.layout24);
    obj.checkMulVit_Des_14_Vit:setName("checkMulVit_Des_14_Vit");
    obj.checkMulVit_Des_14_Vit:setWidth(14);
    obj.checkMulVit_Des_14_Vit:setHeight(25);
    obj.checkMulVit_Des_14_Vit:setField("checkMulVit_Des_14_Vit");
    obj.checkMulVit_Des_14_Vit:setStyle("proportional");
    obj.checkMulVit_Des_14_Vit:setVisible(true);
    obj.checkMulVit_Des_14_Vit:setHitTest(true);
    obj.checkMulVit_Des_14_Vit:setCursor("handPoint");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout24);
    obj.dataLink14:setField("checkMulVit_Des_14_Vit");
    obj.dataLink14:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink14:setName("dataLink14");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.flowPart36);
    obj.layout25:setWidth(14);
    obj.layout25:setHeight(25);
    obj.layout25:setAlign("right");
    obj.layout25:setMargins({left=3});
    obj.layout25:setName("layout25");

    obj.checkMulVit_Des_15_Vit = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_15_Vit:setParent(obj.layout25);
    obj.checkMulVit_Des_15_Vit:setName("checkMulVit_Des_15_Vit");
    obj.checkMulVit_Des_15_Vit:setWidth(14);
    obj.checkMulVit_Des_15_Vit:setHeight(25);
    obj.checkMulVit_Des_15_Vit:setField("checkMulVit_Des_15_Vit");
    obj.checkMulVit_Des_15_Vit:setStyle("proportional");
    obj.checkMulVit_Des_15_Vit:setVisible(true);
    obj.checkMulVit_Des_15_Vit:setHitTest(true);
    obj.checkMulVit_Des_15_Vit:setCursor("handPoint");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout25);
    obj.dataLink15:setField("checkMulVit_Des_15_Vit");
    obj.dataLink15:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink15:setName("dataLink15");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout9);
    obj.flowPart37:setHeight(45);
    obj.flowPart37:setWidth(220);
    obj.flowPart37:setMargins({bottom=20, left=20, right=20});
    obj.flowPart37:setName("flowPart37");
    obj.flowPart37:setMinWidth(220);
    obj.flowPart37:setMaxWidth(220);

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowPart37);
    obj.flowLayout11:setOrientation("vertical");
    obj.flowLayout11:setWidth(220);
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setMaxColumns(1);
    obj.flowLayout11:setName("flowLayout11");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout11);
    obj.flowPart38:setHeight(15);
    obj.flowPart38:setMargins({bottom=5});
    obj.flowPart38:setName("flowPart38");
    obj.flowPart38:setMinWidth(220);
    obj.flowPart38:setMaxWidth(220);

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart38);
    obj.label27:setText("H U M A N I D A D E");
    obj.label27:setName("label27");
    obj.label27:setFontSize(10);
    obj.label27:setFontColor("white");
    obj.label27:setTextTrimming("character");
    obj.label27:setFontFamily("Constantia");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setAlign("top");
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout11);
    obj.flowPart39:setMargins({bottom=5});
    obj.flowPart39:setName("flowPart39");
    obj.flowPart39:setMinWidth(220);
    obj.flowPart39:setMaxWidth(220);
    obj.flowPart39:setHeight(25);

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.flowPart39);
    obj.layout26:setWidth(14);
    obj.layout26:setHeight(25);
    obj.layout26:setAlign("left");
    obj.layout26:setMargins({right=3});
    obj.layout26:setName("layout26");

    obj.checkMulVit_Des_01_Hum = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_01_Hum:setParent(obj.layout26);
    obj.checkMulVit_Des_01_Hum:setName("checkMulVit_Des_01_Hum");
    obj.checkMulVit_Des_01_Hum:setWidth(14);
    obj.checkMulVit_Des_01_Hum:setHeight(25);
    obj.checkMulVit_Des_01_Hum:setField("checkMulVit_Des_01_Hum");
    obj.checkMulVit_Des_01_Hum:setStyle("proportional");
    obj.checkMulVit_Des_01_Hum:setVisible(true);
    obj.checkMulVit_Des_01_Hum:setHitTest(true);
    obj.checkMulVit_Des_01_Hum:setCursor("handPoint");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout26);
    obj.dataLink16:setField("checkMulVit_Des_01_Hum");
    obj.dataLink16:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink16:setName("dataLink16");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.flowPart39);
    obj.layout27:setWidth(14);
    obj.layout27:setHeight(25);
    obj.layout27:setAlign("left");
    obj.layout27:setMargins({right=3});
    obj.layout27:setName("layout27");

    obj.checkMulVit_Des_02_Hum = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_02_Hum:setParent(obj.layout27);
    obj.checkMulVit_Des_02_Hum:setName("checkMulVit_Des_02_Hum");
    obj.checkMulVit_Des_02_Hum:setWidth(14);
    obj.checkMulVit_Des_02_Hum:setHeight(25);
    obj.checkMulVit_Des_02_Hum:setField("checkMulVit_Des_02_Hum");
    obj.checkMulVit_Des_02_Hum:setStyle("proportional");
    obj.checkMulVit_Des_02_Hum:setVisible(true);
    obj.checkMulVit_Des_02_Hum:setHitTest(true);
    obj.checkMulVit_Des_02_Hum:setCursor("handPoint");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout27);
    obj.dataLink17:setField("checkMulVit_Des_02_Hum");
    obj.dataLink17:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink17:setName("dataLink17");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.flowPart39);
    obj.layout28:setWidth(14);
    obj.layout28:setHeight(25);
    obj.layout28:setAlign("left");
    obj.layout28:setMargins({right=3});
    obj.layout28:setName("layout28");

    obj.checkMulVit_Des_03_Hum = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_03_Hum:setParent(obj.layout28);
    obj.checkMulVit_Des_03_Hum:setName("checkMulVit_Des_03_Hum");
    obj.checkMulVit_Des_03_Hum:setWidth(14);
    obj.checkMulVit_Des_03_Hum:setHeight(25);
    obj.checkMulVit_Des_03_Hum:setField("checkMulVit_Des_03_Hum");
    obj.checkMulVit_Des_03_Hum:setStyle("proportional");
    obj.checkMulVit_Des_03_Hum:setVisible(true);
    obj.checkMulVit_Des_03_Hum:setHitTest(true);
    obj.checkMulVit_Des_03_Hum:setCursor("handPoint");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout28);
    obj.dataLink18:setField("checkMulVit_Des_03_Hum");
    obj.dataLink18:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink18:setName("dataLink18");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.flowPart39);
    obj.layout29:setWidth(14);
    obj.layout29:setHeight(25);
    obj.layout29:setAlign("left");
    obj.layout29:setMargins({right=3});
    obj.layout29:setName("layout29");

    obj.checkMulVit_Des_04_Hum = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_04_Hum:setParent(obj.layout29);
    obj.checkMulVit_Des_04_Hum:setName("checkMulVit_Des_04_Hum");
    obj.checkMulVit_Des_04_Hum:setWidth(14);
    obj.checkMulVit_Des_04_Hum:setHeight(25);
    obj.checkMulVit_Des_04_Hum:setField("checkMulVit_Des_04_Hum");
    obj.checkMulVit_Des_04_Hum:setStyle("proportional");
    obj.checkMulVit_Des_04_Hum:setVisible(true);
    obj.checkMulVit_Des_04_Hum:setHitTest(true);
    obj.checkMulVit_Des_04_Hum:setCursor("handPoint");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout29);
    obj.dataLink19:setField("checkMulVit_Des_04_Hum");
    obj.dataLink19:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink19:setName("dataLink19");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.flowPart39);
    obj.layout30:setWidth(14);
    obj.layout30:setHeight(25);
    obj.layout30:setAlign("left");
    obj.layout30:setMargins({right=3});
    obj.layout30:setName("layout30");

    obj.checkMulVit_Des_05_Hum = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_05_Hum:setParent(obj.layout30);
    obj.checkMulVit_Des_05_Hum:setName("checkMulVit_Des_05_Hum");
    obj.checkMulVit_Des_05_Hum:setWidth(14);
    obj.checkMulVit_Des_05_Hum:setHeight(25);
    obj.checkMulVit_Des_05_Hum:setField("checkMulVit_Des_05_Hum");
    obj.checkMulVit_Des_05_Hum:setStyle("proportional");
    obj.checkMulVit_Des_05_Hum:setVisible(true);
    obj.checkMulVit_Des_05_Hum:setHitTest(true);
    obj.checkMulVit_Des_05_Hum:setCursor("handPoint");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout30);
    obj.dataLink20:setField("checkMulVit_Des_05_Hum");
    obj.dataLink20:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink20:setName("dataLink20");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.flowPart39);
    obj.layout31:setWidth(14);
    obj.layout31:setHeight(25);
    obj.layout31:setAlign("right");
    obj.layout31:setMargins({left=3});
    obj.layout31:setName("layout31");

    obj.checkMulVit_Des_06_Hum = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_06_Hum:setParent(obj.layout31);
    obj.checkMulVit_Des_06_Hum:setName("checkMulVit_Des_06_Hum");
    obj.checkMulVit_Des_06_Hum:setWidth(14);
    obj.checkMulVit_Des_06_Hum:setHeight(25);
    obj.checkMulVit_Des_06_Hum:setField("checkMulVit_Des_06_Hum");
    obj.checkMulVit_Des_06_Hum:setStyle("proportional");
    obj.checkMulVit_Des_06_Hum:setVisible(true);
    obj.checkMulVit_Des_06_Hum:setHitTest(true);
    obj.checkMulVit_Des_06_Hum:setCursor("handPoint");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout31);
    obj.dataLink21:setField("checkMulVit_Des_06_Hum");
    obj.dataLink21:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink21:setName("dataLink21");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.flowPart39);
    obj.layout32:setWidth(14);
    obj.layout32:setHeight(25);
    obj.layout32:setAlign("right");
    obj.layout32:setMargins({left=3});
    obj.layout32:setName("layout32");

    obj.checkMulVit_Des_07_Hum = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_07_Hum:setParent(obj.layout32);
    obj.checkMulVit_Des_07_Hum:setName("checkMulVit_Des_07_Hum");
    obj.checkMulVit_Des_07_Hum:setWidth(14);
    obj.checkMulVit_Des_07_Hum:setHeight(25);
    obj.checkMulVit_Des_07_Hum:setField("checkMulVit_Des_07_Hum");
    obj.checkMulVit_Des_07_Hum:setStyle("proportional");
    obj.checkMulVit_Des_07_Hum:setVisible(true);
    obj.checkMulVit_Des_07_Hum:setHitTest(true);
    obj.checkMulVit_Des_07_Hum:setCursor("handPoint");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout32);
    obj.dataLink22:setField("checkMulVit_Des_07_Hum");
    obj.dataLink22:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink22:setName("dataLink22");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.flowPart39);
    obj.layout33:setWidth(14);
    obj.layout33:setHeight(25);
    obj.layout33:setAlign("right");
    obj.layout33:setMargins({left=3});
    obj.layout33:setName("layout33");

    obj.checkMulVit_Des_08_Hum = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_08_Hum:setParent(obj.layout33);
    obj.checkMulVit_Des_08_Hum:setName("checkMulVit_Des_08_Hum");
    obj.checkMulVit_Des_08_Hum:setWidth(14);
    obj.checkMulVit_Des_08_Hum:setHeight(25);
    obj.checkMulVit_Des_08_Hum:setField("checkMulVit_Des_08_Hum");
    obj.checkMulVit_Des_08_Hum:setStyle("proportional");
    obj.checkMulVit_Des_08_Hum:setVisible(true);
    obj.checkMulVit_Des_08_Hum:setHitTest(true);
    obj.checkMulVit_Des_08_Hum:setCursor("handPoint");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout33);
    obj.dataLink23:setField("checkMulVit_Des_08_Hum");
    obj.dataLink23:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink23:setName("dataLink23");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.flowPart39);
    obj.layout34:setWidth(14);
    obj.layout34:setHeight(25);
    obj.layout34:setAlign("right");
    obj.layout34:setMargins({left=3});
    obj.layout34:setName("layout34");

    obj.checkMulVit_Des_09_Hum = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_09_Hum:setParent(obj.layout34);
    obj.checkMulVit_Des_09_Hum:setName("checkMulVit_Des_09_Hum");
    obj.checkMulVit_Des_09_Hum:setWidth(14);
    obj.checkMulVit_Des_09_Hum:setHeight(25);
    obj.checkMulVit_Des_09_Hum:setField("checkMulVit_Des_09_Hum");
    obj.checkMulVit_Des_09_Hum:setStyle("proportional");
    obj.checkMulVit_Des_09_Hum:setVisible(true);
    obj.checkMulVit_Des_09_Hum:setHitTest(true);
    obj.checkMulVit_Des_09_Hum:setCursor("handPoint");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout34);
    obj.dataLink24:setField("checkMulVit_Des_09_Hum");
    obj.dataLink24:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink24:setName("dataLink24");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.flowPart39);
    obj.layout35:setWidth(14);
    obj.layout35:setHeight(25);
    obj.layout35:setAlign("right");
    obj.layout35:setMargins({right=10, left=3});
    obj.layout35:setName("layout35");

    obj.checkMulVit_Des_10_Hum = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_10_Hum:setParent(obj.layout35);
    obj.checkMulVit_Des_10_Hum:setName("checkMulVit_Des_10_Hum");
    obj.checkMulVit_Des_10_Hum:setWidth(14);
    obj.checkMulVit_Des_10_Hum:setHeight(25);
    obj.checkMulVit_Des_10_Hum:setField("checkMulVit_Des_10_Hum");
    obj.checkMulVit_Des_10_Hum:setStyle("proportional");
    obj.checkMulVit_Des_10_Hum:setVisible(true);
    obj.checkMulVit_Des_10_Hum:setHitTest(true);
    obj.checkMulVit_Des_10_Hum:setCursor("handPoint");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout35);
    obj.dataLink25:setField("checkMulVit_Des_10_Hum");
    obj.dataLink25:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink25:setName("dataLink25");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout9);
    obj.flowPart40:setHeight(45);
    obj.flowPart40:setWidth(220);
    obj.flowPart40:setMargins({bottom=20, left=20, right=20});
    obj.flowPart40:setName("flowPart40");
    obj.flowPart40:setMinWidth(220);
    obj.flowPart40:setMaxWidth(220);

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.flowPart40);
    obj.flowLayout12:setOrientation("vertical");
    obj.flowLayout12:setWidth(220);
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setMaxColumns(1);
    obj.flowLayout12:setName("flowLayout12");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout12);
    obj.flowPart41:setHeight(15);
    obj.flowPart41:setMargins({bottom=5});
    obj.flowPart41:setName("flowPart41");
    obj.flowPart41:setMinWidth(220);
    obj.flowPart41:setMaxWidth(220);

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart41);
    obj.label28:setText("F O R Ç A   D E   V O N T A D E");
    obj.label28:setName("label28");
    obj.label28:setFontSize(10);
    obj.label28:setFontColor("white");
    obj.label28:setTextTrimming("character");
    obj.label28:setFontFamily("Constantia");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setAlign("top");
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout12);
    obj.flowPart42:setMargins({bottom=5});
    obj.flowPart42:setName("flowPart42");
    obj.flowPart42:setMinWidth(220);
    obj.flowPart42:setMaxWidth(220);
    obj.flowPart42:setHeight(25);

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.flowPart42);
    obj.layout36:setWidth(14);
    obj.layout36:setHeight(25);
    obj.layout36:setAlign("left");
    obj.layout36:setMargins({right=3});
    obj.layout36:setName("layout36");

    obj.checkMulVit_Des_01_FdV = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_01_FdV:setParent(obj.layout36);
    obj.checkMulVit_Des_01_FdV:setName("checkMulVit_Des_01_FdV");
    obj.checkMulVit_Des_01_FdV:setWidth(14);
    obj.checkMulVit_Des_01_FdV:setHeight(25);
    obj.checkMulVit_Des_01_FdV:setField("checkMulVit_Des_01_FdV");
    obj.checkMulVit_Des_01_FdV:setStyle("proportional");
    obj.checkMulVit_Des_01_FdV:setVisible(true);
    obj.checkMulVit_Des_01_FdV:setHitTest(true);
    obj.checkMulVit_Des_01_FdV:setCursor("handPoint");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout36);
    obj.dataLink26:setField("checkMulVit_Des_01_FdV");
    obj.dataLink26:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink26:setName("dataLink26");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.flowPart42);
    obj.layout37:setWidth(14);
    obj.layout37:setHeight(25);
    obj.layout37:setAlign("left");
    obj.layout37:setMargins({right=3});
    obj.layout37:setName("layout37");

    obj.checkMulVit_Des_02_FdV = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_02_FdV:setParent(obj.layout37);
    obj.checkMulVit_Des_02_FdV:setName("checkMulVit_Des_02_FdV");
    obj.checkMulVit_Des_02_FdV:setWidth(14);
    obj.checkMulVit_Des_02_FdV:setHeight(25);
    obj.checkMulVit_Des_02_FdV:setField("checkMulVit_Des_02_FdV");
    obj.checkMulVit_Des_02_FdV:setStyle("proportional");
    obj.checkMulVit_Des_02_FdV:setVisible(true);
    obj.checkMulVit_Des_02_FdV:setHitTest(true);
    obj.checkMulVit_Des_02_FdV:setCursor("handPoint");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout37);
    obj.dataLink27:setField("checkMulVit_Des_02_FdV");
    obj.dataLink27:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink27:setName("dataLink27");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.flowPart42);
    obj.layout38:setWidth(14);
    obj.layout38:setHeight(25);
    obj.layout38:setAlign("left");
    obj.layout38:setMargins({right=3});
    obj.layout38:setName("layout38");

    obj.checkMulVit_Des_03_FdV = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_03_FdV:setParent(obj.layout38);
    obj.checkMulVit_Des_03_FdV:setName("checkMulVit_Des_03_FdV");
    obj.checkMulVit_Des_03_FdV:setWidth(14);
    obj.checkMulVit_Des_03_FdV:setHeight(25);
    obj.checkMulVit_Des_03_FdV:setField("checkMulVit_Des_03_FdV");
    obj.checkMulVit_Des_03_FdV:setStyle("proportional");
    obj.checkMulVit_Des_03_FdV:setVisible(true);
    obj.checkMulVit_Des_03_FdV:setHitTest(true);
    obj.checkMulVit_Des_03_FdV:setCursor("handPoint");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout38);
    obj.dataLink28:setField("checkMulVit_Des_03_FdV");
    obj.dataLink28:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink28:setName("dataLink28");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.flowPart42);
    obj.layout39:setWidth(14);
    obj.layout39:setHeight(25);
    obj.layout39:setAlign("left");
    obj.layout39:setMargins({right=3});
    obj.layout39:setName("layout39");

    obj.checkMulVit_Des_04_FdV = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_04_FdV:setParent(obj.layout39);
    obj.checkMulVit_Des_04_FdV:setName("checkMulVit_Des_04_FdV");
    obj.checkMulVit_Des_04_FdV:setWidth(14);
    obj.checkMulVit_Des_04_FdV:setHeight(25);
    obj.checkMulVit_Des_04_FdV:setField("checkMulVit_Des_04_FdV");
    obj.checkMulVit_Des_04_FdV:setStyle("proportional");
    obj.checkMulVit_Des_04_FdV:setVisible(true);
    obj.checkMulVit_Des_04_FdV:setHitTest(true);
    obj.checkMulVit_Des_04_FdV:setCursor("handPoint");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout39);
    obj.dataLink29:setField("checkMulVit_Des_04_FdV");
    obj.dataLink29:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink29:setName("dataLink29");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.flowPart42);
    obj.layout40:setWidth(14);
    obj.layout40:setHeight(25);
    obj.layout40:setAlign("left");
    obj.layout40:setMargins({right=3});
    obj.layout40:setName("layout40");

    obj.checkMulVit_Des_05_FdV = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_05_FdV:setParent(obj.layout40);
    obj.checkMulVit_Des_05_FdV:setName("checkMulVit_Des_05_FdV");
    obj.checkMulVit_Des_05_FdV:setWidth(14);
    obj.checkMulVit_Des_05_FdV:setHeight(25);
    obj.checkMulVit_Des_05_FdV:setField("checkMulVit_Des_05_FdV");
    obj.checkMulVit_Des_05_FdV:setStyle("proportional");
    obj.checkMulVit_Des_05_FdV:setVisible(true);
    obj.checkMulVit_Des_05_FdV:setHitTest(true);
    obj.checkMulVit_Des_05_FdV:setCursor("handPoint");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout40);
    obj.dataLink30:setField("checkMulVit_Des_05_FdV");
    obj.dataLink30:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink30:setName("dataLink30");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.flowPart42);
    obj.layout41:setWidth(14);
    obj.layout41:setHeight(25);
    obj.layout41:setAlign("right");
    obj.layout41:setMargins({left=3});
    obj.layout41:setName("layout41");

    obj.checkMulVit_Des_06_FdV = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_06_FdV:setParent(obj.layout41);
    obj.checkMulVit_Des_06_FdV:setName("checkMulVit_Des_06_FdV");
    obj.checkMulVit_Des_06_FdV:setWidth(14);
    obj.checkMulVit_Des_06_FdV:setHeight(25);
    obj.checkMulVit_Des_06_FdV:setField("checkMulVit_Des_06_FdV");
    obj.checkMulVit_Des_06_FdV:setStyle("proportional");
    obj.checkMulVit_Des_06_FdV:setVisible(true);
    obj.checkMulVit_Des_06_FdV:setHitTest(true);
    obj.checkMulVit_Des_06_FdV:setCursor("handPoint");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout41);
    obj.dataLink31:setField("checkMulVit_Des_06_FdV");
    obj.dataLink31:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink31:setName("dataLink31");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.flowPart42);
    obj.layout42:setWidth(14);
    obj.layout42:setHeight(25);
    obj.layout42:setAlign("right");
    obj.layout42:setMargins({left=3});
    obj.layout42:setName("layout42");

    obj.checkMulVit_Des_07_FdV = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_07_FdV:setParent(obj.layout42);
    obj.checkMulVit_Des_07_FdV:setName("checkMulVit_Des_07_FdV");
    obj.checkMulVit_Des_07_FdV:setWidth(14);
    obj.checkMulVit_Des_07_FdV:setHeight(25);
    obj.checkMulVit_Des_07_FdV:setField("checkMulVit_Des_07_FdV");
    obj.checkMulVit_Des_07_FdV:setStyle("proportional");
    obj.checkMulVit_Des_07_FdV:setVisible(true);
    obj.checkMulVit_Des_07_FdV:setHitTest(true);
    obj.checkMulVit_Des_07_FdV:setCursor("handPoint");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout42);
    obj.dataLink32:setField("checkMulVit_Des_07_FdV");
    obj.dataLink32:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink32:setName("dataLink32");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.flowPart42);
    obj.layout43:setWidth(14);
    obj.layout43:setHeight(25);
    obj.layout43:setAlign("right");
    obj.layout43:setMargins({left=3});
    obj.layout43:setName("layout43");

    obj.checkMulVit_Des_08_FdV = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_08_FdV:setParent(obj.layout43);
    obj.checkMulVit_Des_08_FdV:setName("checkMulVit_Des_08_FdV");
    obj.checkMulVit_Des_08_FdV:setWidth(14);
    obj.checkMulVit_Des_08_FdV:setHeight(25);
    obj.checkMulVit_Des_08_FdV:setField("checkMulVit_Des_08_FdV");
    obj.checkMulVit_Des_08_FdV:setStyle("proportional");
    obj.checkMulVit_Des_08_FdV:setVisible(true);
    obj.checkMulVit_Des_08_FdV:setHitTest(true);
    obj.checkMulVit_Des_08_FdV:setCursor("handPoint");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout43);
    obj.dataLink33:setField("checkMulVit_Des_08_FdV");
    obj.dataLink33:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink33:setName("dataLink33");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.flowPart42);
    obj.layout44:setWidth(14);
    obj.layout44:setHeight(25);
    obj.layout44:setAlign("right");
    obj.layout44:setMargins({left=3});
    obj.layout44:setName("layout44");

    obj.checkMulVit_Des_09_FdV = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_09_FdV:setParent(obj.layout44);
    obj.checkMulVit_Des_09_FdV:setName("checkMulVit_Des_09_FdV");
    obj.checkMulVit_Des_09_FdV:setWidth(14);
    obj.checkMulVit_Des_09_FdV:setHeight(25);
    obj.checkMulVit_Des_09_FdV:setField("checkMulVit_Des_09_FdV");
    obj.checkMulVit_Des_09_FdV:setStyle("proportional");
    obj.checkMulVit_Des_09_FdV:setVisible(true);
    obj.checkMulVit_Des_09_FdV:setHitTest(true);
    obj.checkMulVit_Des_09_FdV:setCursor("handPoint");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout44);
    obj.dataLink34:setField("checkMulVit_Des_09_FdV");
    obj.dataLink34:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink34:setName("dataLink34");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.flowPart42);
    obj.layout45:setWidth(14);
    obj.layout45:setHeight(25);
    obj.layout45:setAlign("right");
    obj.layout45:setMargins({right=10, left=3});
    obj.layout45:setName("layout45");

    obj.checkMulVit_Des_10_FdV = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_10_FdV:setParent(obj.layout45);
    obj.checkMulVit_Des_10_FdV:setName("checkMulVit_Des_10_FdV");
    obj.checkMulVit_Des_10_FdV:setWidth(14);
    obj.checkMulVit_Des_10_FdV:setHeight(25);
    obj.checkMulVit_Des_10_FdV:setField("checkMulVit_Des_10_FdV");
    obj.checkMulVit_Des_10_FdV:setStyle("proportional");
    obj.checkMulVit_Des_10_FdV:setVisible(true);
    obj.checkMulVit_Des_10_FdV:setHitTest(true);
    obj.checkMulVit_Des_10_FdV:setCursor("handPoint");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout45);
    obj.dataLink35:setField("checkMulVit_Des_10_FdV");
    obj.dataLink35:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink35:setName("dataLink35");

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.layFrente);
    obj.flowLayout13:setHeight(25);
    obj.flowLayout13:setMargins({});
    obj.flowLayout13:setName("flowLayout13");
    obj.flowLayout13:setAlign("top");
    obj.flowLayout13:setOrientation("horizontal");
    obj.flowLayout13:setHorzAlign("center");
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setMaxControlsPerLine(3);

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout13);
    obj.flowPart43:setHeight(25);
    obj.flowPart43:setMinWidth(400);
    obj.flowPart43:setMaxWidth(1000);
    obj.flowPart43:setMargins({});
    obj.flowPart43:setName("flowPart43");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.flowPart43);
    obj.flowLayout14:setAutoHeight(false);
    obj.flowLayout14:setHeight(25);
    obj.flowLayout14:setMargins({});
    obj.flowLayout14:setName("flowLayout14");
    obj.flowLayout14:setAlign("top");
    obj.flowLayout14:setOrientation("horizontal");
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setMaxControlsPerLine(3);

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout14);
    obj.flowPart44:setHeight(25);
    obj.flowPart44:setMinWidth(0);
    obj.flowPart44:setMaxWidth(310);
    obj.flowPart44:setWidth(310);
    obj.flowPart44:setName("flowPart44");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.flowPart44);
    obj.horzLine3:setName("horzLine3");
    obj.horzLine3:setStrokeColor("#424242");
    obj.horzLine3:setMargins({top=7});
    obj.horzLine3:setAlign("top");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout14);
    obj.flowPart45:setHeight(25);
    obj.flowPart45:setWidth(200);
    obj.flowPart45:setName("flowPart45");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart45);
    obj.label29:setText("H A B I L I D A D E S");
    obj.label29:setName("label29");
    obj.label29:setFontSize(20);
    obj.label29:setFontColor("white");
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setTextTrimming("character");
    obj.label29:setFontFamily("Constantia");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setAutoSize(true);
    obj.label29:setAlign("client");
    obj.label29:setMargins({bottom=7});

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout14);
    obj.flowPart46:setHeight(25);
    obj.flowPart46:setMinWidth(0);
    obj.flowPart46:setMaxWidth(310);
    obj.flowPart46:setWidth(310);
    obj.flowPart46:setName("flowPart46");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.flowPart46);
    obj.horzLine4:setName("horzLine4");
    obj.horzLine4:setStrokeColor("#424242");
    obj.horzLine4:setMargins({top=7});
    obj.horzLine4:setAlign("top");

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.layFrente);
    obj.flowLayout15:setName("flowLayout15");
    obj.flowLayout15:setAlign("top");
    obj.flowLayout15:setOrientation("horizontal");
    obj.flowLayout15:setHorzAlign("center");
    obj.flowLayout15:setAutoHeight(true);
    obj.flowLayout15:setMaxControlsPerLine(3);
    obj.flowLayout15:setMargins({left=20, top=20, bottom=30, right=20});

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout15);
    obj.flowPart47:setHeight(270);
    obj.flowPart47:setWidth(220);
    obj.flowPart47:setMargins({bottom=20, left=20, right=20});
    obj.flowPart47:setName("flowPart47");
    obj.flowPart47:setMinWidth(220);
    obj.flowPart47:setMaxWidth(220);

    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.flowPart47);
    obj.flowLayout16:setOrientation("vertical");
    obj.flowLayout16:setWidth(220);
    obj.flowLayout16:setAutoHeight(true);
    obj.flowLayout16:setMaxColumns(1);
    obj.flowLayout16:setName("flowLayout16");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout16);
    obj.flowPart48:setMargins({bottom=5});
    obj.flowPart48:setName("flowPart48");
    obj.flowPart48:setMinWidth(220);
    obj.flowPart48:setMaxWidth(220);
    obj.flowPart48:setHeight(25);

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart48);
    obj.label30:setAlign("left");
    obj.label30:setWidth(100);
    obj.label30:setText("Armas Brancas");
    obj.label30:setName("label30");
    obj.label30:setFontSize(14);
    obj.label30:setFontColor("white");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setTextTrimming("character");
    obj.label30:setFontFamily("Constantia");

    obj.nomeBut10 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut10:setParent(obj.flowPart48);
    obj.nomeBut10:setName("nomeBut10");
    obj.nomeBut10:setText("𝐢");
    obj.nomeBut10:setWidth(22);
    obj.nomeBut10:setHeight(22);
    obj.nomeBut10:setTop(1);
    obj.nomeBut10:setLeft(103);
    obj.nomeBut10:setFontColor("#272727");

    obj.nomeBut10B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut10B:setParent(obj.flowPart48);
    obj.nomeBut10B:setName("nomeBut10B");
    obj.nomeBut10B:setText("𝐢");
    obj.nomeBut10B:setWidth(22);
    obj.nomeBut10B:setHeight(22);
    obj.nomeBut10B:setTop(1);
    obj.nomeBut10B:setLeft(103);
    obj.nomeBut10B:setFontColor("white");
    obj.nomeBut10B:setVisible(false);

    obj.popUp_10 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_10:setParent(obj.flowPart48);
    obj.popUp_10:setName("popUp_10");
    obj.popUp_10:setWidth(200);
    obj.popUp_10:setHeight(100);
    obj.popUp_10:setBackOpacity(0);
    obj.popUp_10:setDrawContainer(false);

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.popUp_10);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("#0e0e0e");
    obj.rectangle4:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("bevel");
    obj.rectangle4:setName("rectangle4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle4);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#0e0e0e");
    obj.rectangle5:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle5:setXradius(3);
    obj.rectangle5:setYradius(3);
    obj.rectangle5:setStrokeColor("#272727");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setCornerType("bevel");
    obj.rectangle5:setName("rectangle5");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle5);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setField("fldEnfase10");
    obj.textEditor1:setFontFamily("Constantia");
    obj.textEditor1:setFontSize(13);
    obj.textEditor1:setName("textEditor1");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.rectangle5);
    obj.dataLink36:setField("fldEnfase10");
    obj.dataLink36:setDefaultValue("Ênfases");
    obj.dataLink36:setName("dataLink36");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.flowPart48);
    obj.layout46:setAlign("client");
    obj.layout46:setMargins({right=10});
    obj.layout46:setName("layout46");

    obj.nomeCheck10_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck10_01:setParent(obj.layout46);
    obj.nomeCheck10_01:setField("fldCheck10_01");
    obj.nomeCheck10_01:setName("nomeCheck10_01");
    obj.nomeCheck10_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck10_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck10_01:setHeight(25);
    obj.nomeCheck10_01:setWidth(14);
    obj.nomeCheck10_01:setAlign("right");
    obj.nomeCheck10_01:setMargins({left=3});
    obj.nomeCheck10_01:setAutoChange(false);

    obj.nomeCheck10_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck10_02:setParent(obj.layout46);
    obj.nomeCheck10_02:setField("fldCheck10_02");
    obj.nomeCheck10_02:setName("nomeCheck10_02");
    obj.nomeCheck10_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck10_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck10_02:setHeight(25);
    obj.nomeCheck10_02:setWidth(14);
    obj.nomeCheck10_02:setAlign("right");
    obj.nomeCheck10_02:setMargins({left=3});
    obj.nomeCheck10_02:setAutoChange(false);

    obj.nomeCheck10_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck10_03:setParent(obj.layout46);
    obj.nomeCheck10_03:setField("fldCheck10_03");
    obj.nomeCheck10_03:setName("nomeCheck10_03");
    obj.nomeCheck10_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck10_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck10_03:setHeight(25);
    obj.nomeCheck10_03:setWidth(14);
    obj.nomeCheck10_03:setAlign("right");
    obj.nomeCheck10_03:setMargins({left=3});
    obj.nomeCheck10_03:setAutoChange(false);

    obj.nomeCheck10_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck10_04:setParent(obj.layout46);
    obj.nomeCheck10_04:setField("fldCheck10_04");
    obj.nomeCheck10_04:setName("nomeCheck10_04");
    obj.nomeCheck10_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck10_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck10_04:setHeight(25);
    obj.nomeCheck10_04:setWidth(14);
    obj.nomeCheck10_04:setAlign("right");
    obj.nomeCheck10_04:setMargins({left=3});
    obj.nomeCheck10_04:setAutoChange(false);

    obj.nomeCheck10_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck10_05:setParent(obj.layout46);
    obj.nomeCheck10_05:setField("fldCheck10_05");
    obj.nomeCheck10_05:setName("nomeCheck10_05");
    obj.nomeCheck10_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck10_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck10_05:setHeight(25);
    obj.nomeCheck10_05:setWidth(14);
    obj.nomeCheck10_05:setAlign("right");
    obj.nomeCheck10_05:setMargins({left=3});
    obj.nomeCheck10_05:setAutoChange(false);

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout16);
    obj.flowPart49:setMargins({bottom=5});
    obj.flowPart49:setName("flowPart49");
    obj.flowPart49:setMinWidth(220);
    obj.flowPart49:setMaxWidth(220);
    obj.flowPart49:setHeight(25);

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart49);
    obj.label31:setAlign("left");
    obj.label31:setWidth(100);
    obj.label31:setText("Armas de Fogo");
    obj.label31:setName("label31");
    obj.label31:setFontSize(14);
    obj.label31:setFontColor("white");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setTextTrimming("character");
    obj.label31:setFontFamily("Constantia");

    obj.nomeBut11 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut11:setParent(obj.flowPart49);
    obj.nomeBut11:setName("nomeBut11");
    obj.nomeBut11:setText("𝐢");
    obj.nomeBut11:setWidth(22);
    obj.nomeBut11:setHeight(22);
    obj.nomeBut11:setTop(1);
    obj.nomeBut11:setLeft(103);
    obj.nomeBut11:setFontColor("#272727");

    obj.nomeBut11B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut11B:setParent(obj.flowPart49);
    obj.nomeBut11B:setName("nomeBut11B");
    obj.nomeBut11B:setText("𝐢");
    obj.nomeBut11B:setWidth(22);
    obj.nomeBut11B:setHeight(22);
    obj.nomeBut11B:setTop(1);
    obj.nomeBut11B:setLeft(103);
    obj.nomeBut11B:setFontColor("white");
    obj.nomeBut11B:setVisible(false);

    obj.popUp_11 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_11:setParent(obj.flowPart49);
    obj.popUp_11:setName("popUp_11");
    obj.popUp_11:setWidth(200);
    obj.popUp_11:setHeight(100);
    obj.popUp_11:setBackOpacity(0);
    obj.popUp_11:setDrawContainer(false);

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.popUp_11);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("#0e0e0e");
    obj.rectangle6:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(5);
    obj.rectangle6:setCornerType("bevel");
    obj.rectangle6:setName("rectangle6");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle6);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("#0e0e0e");
    obj.rectangle7:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle7:setXradius(3);
    obj.rectangle7:setYradius(3);
    obj.rectangle7:setStrokeColor("#272727");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setCornerType("bevel");
    obj.rectangle7:setName("rectangle7");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle7);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setField("fldEnfase11");
    obj.textEditor2:setFontFamily("Constantia");
    obj.textEditor2:setFontSize(13);
    obj.textEditor2:setName("textEditor2");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.rectangle7);
    obj.dataLink37:setField("fldEnfase11");
    obj.dataLink37:setDefaultValue("Ênfases");
    obj.dataLink37:setName("dataLink37");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.flowPart49);
    obj.layout47:setAlign("client");
    obj.layout47:setMargins({right=10});
    obj.layout47:setName("layout47");

    obj.nomeCheck11_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck11_01:setParent(obj.layout47);
    obj.nomeCheck11_01:setField("fldCheck11_01");
    obj.nomeCheck11_01:setName("nomeCheck11_01");
    obj.nomeCheck11_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck11_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck11_01:setHeight(25);
    obj.nomeCheck11_01:setWidth(14);
    obj.nomeCheck11_01:setAlign("right");
    obj.nomeCheck11_01:setMargins({left=3});
    obj.nomeCheck11_01:setAutoChange(false);

    obj.nomeCheck11_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck11_02:setParent(obj.layout47);
    obj.nomeCheck11_02:setField("fldCheck11_02");
    obj.nomeCheck11_02:setName("nomeCheck11_02");
    obj.nomeCheck11_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck11_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck11_02:setHeight(25);
    obj.nomeCheck11_02:setWidth(14);
    obj.nomeCheck11_02:setAlign("right");
    obj.nomeCheck11_02:setMargins({left=3});
    obj.nomeCheck11_02:setAutoChange(false);

    obj.nomeCheck11_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck11_03:setParent(obj.layout47);
    obj.nomeCheck11_03:setField("fldCheck11_03");
    obj.nomeCheck11_03:setName("nomeCheck11_03");
    obj.nomeCheck11_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck11_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck11_03:setHeight(25);
    obj.nomeCheck11_03:setWidth(14);
    obj.nomeCheck11_03:setAlign("right");
    obj.nomeCheck11_03:setMargins({left=3});
    obj.nomeCheck11_03:setAutoChange(false);

    obj.nomeCheck11_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck11_04:setParent(obj.layout47);
    obj.nomeCheck11_04:setField("fldCheck11_04");
    obj.nomeCheck11_04:setName("nomeCheck11_04");
    obj.nomeCheck11_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck11_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck11_04:setHeight(25);
    obj.nomeCheck11_04:setWidth(14);
    obj.nomeCheck11_04:setAlign("right");
    obj.nomeCheck11_04:setMargins({left=3});
    obj.nomeCheck11_04:setAutoChange(false);

    obj.nomeCheck11_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck11_05:setParent(obj.layout47);
    obj.nomeCheck11_05:setField("fldCheck11_05");
    obj.nomeCheck11_05:setName("nomeCheck11_05");
    obj.nomeCheck11_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck11_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck11_05:setHeight(25);
    obj.nomeCheck11_05:setWidth(14);
    obj.nomeCheck11_05:setAlign("right");
    obj.nomeCheck11_05:setMargins({left=3});
    obj.nomeCheck11_05:setAutoChange(false);

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout16);
    obj.flowPart50:setMargins({bottom=5});
    obj.flowPart50:setName("flowPart50");
    obj.flowPart50:setMinWidth(220);
    obj.flowPart50:setMaxWidth(220);
    obj.flowPart50:setHeight(25);

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart50);
    obj.label32:setAlign("left");
    obj.label32:setWidth(100);
    obj.label32:setText("Atletismo");
    obj.label32:setName("label32");
    obj.label32:setFontSize(14);
    obj.label32:setFontColor("white");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setTextTrimming("character");
    obj.label32:setFontFamily("Constantia");

    obj.nomeBut12 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut12:setParent(obj.flowPart50);
    obj.nomeBut12:setName("nomeBut12");
    obj.nomeBut12:setText("𝐢");
    obj.nomeBut12:setWidth(22);
    obj.nomeBut12:setHeight(22);
    obj.nomeBut12:setTop(1);
    obj.nomeBut12:setLeft(103);
    obj.nomeBut12:setFontColor("#272727");

    obj.nomeBut12B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut12B:setParent(obj.flowPart50);
    obj.nomeBut12B:setName("nomeBut12B");
    obj.nomeBut12B:setText("𝐢");
    obj.nomeBut12B:setWidth(22);
    obj.nomeBut12B:setHeight(22);
    obj.nomeBut12B:setTop(1);
    obj.nomeBut12B:setLeft(103);
    obj.nomeBut12B:setFontColor("white");
    obj.nomeBut12B:setVisible(false);

    obj.popUp_12 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_12:setParent(obj.flowPart50);
    obj.popUp_12:setName("popUp_12");
    obj.popUp_12:setWidth(200);
    obj.popUp_12:setHeight(100);
    obj.popUp_12:setBackOpacity(0);
    obj.popUp_12:setDrawContainer(false);

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.popUp_12);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("#0e0e0e");
    obj.rectangle8:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle8:setXradius(5);
    obj.rectangle8:setYradius(5);
    obj.rectangle8:setCornerType("bevel");
    obj.rectangle8:setName("rectangle8");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle8);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("#0e0e0e");
    obj.rectangle9:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle9:setXradius(3);
    obj.rectangle9:setYradius(3);
    obj.rectangle9:setStrokeColor("#272727");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setCornerType("bevel");
    obj.rectangle9:setName("rectangle9");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle9);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setField("fldEnfase12");
    obj.textEditor3:setFontFamily("Constantia");
    obj.textEditor3:setFontSize(13);
    obj.textEditor3:setName("textEditor3");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.rectangle9);
    obj.dataLink38:setField("fldEnfase12");
    obj.dataLink38:setDefaultValue("Ênfases");
    obj.dataLink38:setName("dataLink38");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.flowPart50);
    obj.layout48:setAlign("client");
    obj.layout48:setMargins({right=10});
    obj.layout48:setName("layout48");

    obj.nomeCheck12_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck12_01:setParent(obj.layout48);
    obj.nomeCheck12_01:setField("fldCheck12_01");
    obj.nomeCheck12_01:setName("nomeCheck12_01");
    obj.nomeCheck12_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck12_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck12_01:setHeight(25);
    obj.nomeCheck12_01:setWidth(14);
    obj.nomeCheck12_01:setAlign("right");
    obj.nomeCheck12_01:setMargins({left=3});
    obj.nomeCheck12_01:setAutoChange(false);

    obj.nomeCheck12_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck12_02:setParent(obj.layout48);
    obj.nomeCheck12_02:setField("fldCheck12_02");
    obj.nomeCheck12_02:setName("nomeCheck12_02");
    obj.nomeCheck12_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck12_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck12_02:setHeight(25);
    obj.nomeCheck12_02:setWidth(14);
    obj.nomeCheck12_02:setAlign("right");
    obj.nomeCheck12_02:setMargins({left=3});
    obj.nomeCheck12_02:setAutoChange(false);

    obj.nomeCheck12_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck12_03:setParent(obj.layout48);
    obj.nomeCheck12_03:setField("fldCheck12_03");
    obj.nomeCheck12_03:setName("nomeCheck12_03");
    obj.nomeCheck12_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck12_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck12_03:setHeight(25);
    obj.nomeCheck12_03:setWidth(14);
    obj.nomeCheck12_03:setAlign("right");
    obj.nomeCheck12_03:setMargins({left=3});
    obj.nomeCheck12_03:setAutoChange(false);

    obj.nomeCheck12_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck12_04:setParent(obj.layout48);
    obj.nomeCheck12_04:setField("fldCheck12_04");
    obj.nomeCheck12_04:setName("nomeCheck12_04");
    obj.nomeCheck12_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck12_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck12_04:setHeight(25);
    obj.nomeCheck12_04:setWidth(14);
    obj.nomeCheck12_04:setAlign("right");
    obj.nomeCheck12_04:setMargins({left=3});
    obj.nomeCheck12_04:setAutoChange(false);

    obj.nomeCheck12_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck12_05:setParent(obj.layout48);
    obj.nomeCheck12_05:setField("fldCheck12_05");
    obj.nomeCheck12_05:setName("nomeCheck12_05");
    obj.nomeCheck12_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck12_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck12_05:setHeight(25);
    obj.nomeCheck12_05:setWidth(14);
    obj.nomeCheck12_05:setAlign("right");
    obj.nomeCheck12_05:setMargins({left=3});
    obj.nomeCheck12_05:setAutoChange(false);

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout16);
    obj.flowPart51:setMargins({bottom=5});
    obj.flowPart51:setName("flowPart51");
    obj.flowPart51:setMinWidth(220);
    obj.flowPart51:setMaxWidth(220);
    obj.flowPart51:setHeight(25);

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart51);
    obj.label33:setAlign("left");
    obj.label33:setWidth(100);
    obj.label33:setText("Briga");
    obj.label33:setName("label33");
    obj.label33:setFontSize(14);
    obj.label33:setFontColor("white");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setTextTrimming("character");
    obj.label33:setFontFamily("Constantia");

    obj.nomeBut13 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut13:setParent(obj.flowPart51);
    obj.nomeBut13:setName("nomeBut13");
    obj.nomeBut13:setText("𝐢");
    obj.nomeBut13:setWidth(22);
    obj.nomeBut13:setHeight(22);
    obj.nomeBut13:setTop(1);
    obj.nomeBut13:setLeft(103);
    obj.nomeBut13:setFontColor("#272727");

    obj.nomeBut13B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut13B:setParent(obj.flowPart51);
    obj.nomeBut13B:setName("nomeBut13B");
    obj.nomeBut13B:setText("𝐢");
    obj.nomeBut13B:setWidth(22);
    obj.nomeBut13B:setHeight(22);
    obj.nomeBut13B:setTop(1);
    obj.nomeBut13B:setLeft(103);
    obj.nomeBut13B:setFontColor("white");
    obj.nomeBut13B:setVisible(false);

    obj.popUp_13 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_13:setParent(obj.flowPart51);
    obj.popUp_13:setName("popUp_13");
    obj.popUp_13:setWidth(200);
    obj.popUp_13:setHeight(100);
    obj.popUp_13:setBackOpacity(0);
    obj.popUp_13:setDrawContainer(false);

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.popUp_13);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("#0e0e0e");
    obj.rectangle10:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle10:setXradius(5);
    obj.rectangle10:setYradius(5);
    obj.rectangle10:setCornerType("bevel");
    obj.rectangle10:setName("rectangle10");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.rectangle10);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("#0e0e0e");
    obj.rectangle11:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle11:setXradius(3);
    obj.rectangle11:setYradius(3);
    obj.rectangle11:setStrokeColor("#272727");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setCornerType("bevel");
    obj.rectangle11:setName("rectangle11");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle11);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setField("fldEnfase13");
    obj.textEditor4:setFontFamily("Constantia");
    obj.textEditor4:setFontSize(13);
    obj.textEditor4:setName("textEditor4");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.rectangle11);
    obj.dataLink39:setField("fldEnfase13");
    obj.dataLink39:setDefaultValue("Ênfases");
    obj.dataLink39:setName("dataLink39");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.flowPart51);
    obj.layout49:setAlign("client");
    obj.layout49:setMargins({right=10});
    obj.layout49:setName("layout49");

    obj.nomeCheck13_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck13_01:setParent(obj.layout49);
    obj.nomeCheck13_01:setField("fldCheck13_01");
    obj.nomeCheck13_01:setName("nomeCheck13_01");
    obj.nomeCheck13_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck13_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck13_01:setHeight(25);
    obj.nomeCheck13_01:setWidth(14);
    obj.nomeCheck13_01:setAlign("right");
    obj.nomeCheck13_01:setMargins({left=3});
    obj.nomeCheck13_01:setAutoChange(false);

    obj.nomeCheck13_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck13_02:setParent(obj.layout49);
    obj.nomeCheck13_02:setField("fldCheck13_02");
    obj.nomeCheck13_02:setName("nomeCheck13_02");
    obj.nomeCheck13_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck13_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck13_02:setHeight(25);
    obj.nomeCheck13_02:setWidth(14);
    obj.nomeCheck13_02:setAlign("right");
    obj.nomeCheck13_02:setMargins({left=3});
    obj.nomeCheck13_02:setAutoChange(false);

    obj.nomeCheck13_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck13_03:setParent(obj.layout49);
    obj.nomeCheck13_03:setField("fldCheck13_03");
    obj.nomeCheck13_03:setName("nomeCheck13_03");
    obj.nomeCheck13_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck13_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck13_03:setHeight(25);
    obj.nomeCheck13_03:setWidth(14);
    obj.nomeCheck13_03:setAlign("right");
    obj.nomeCheck13_03:setMargins({left=3});
    obj.nomeCheck13_03:setAutoChange(false);

    obj.nomeCheck13_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck13_04:setParent(obj.layout49);
    obj.nomeCheck13_04:setField("fldCheck13_04");
    obj.nomeCheck13_04:setName("nomeCheck13_04");
    obj.nomeCheck13_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck13_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck13_04:setHeight(25);
    obj.nomeCheck13_04:setWidth(14);
    obj.nomeCheck13_04:setAlign("right");
    obj.nomeCheck13_04:setMargins({left=3});
    obj.nomeCheck13_04:setAutoChange(false);

    obj.nomeCheck13_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck13_05:setParent(obj.layout49);
    obj.nomeCheck13_05:setField("fldCheck13_05");
    obj.nomeCheck13_05:setName("nomeCheck13_05");
    obj.nomeCheck13_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck13_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck13_05:setHeight(25);
    obj.nomeCheck13_05:setWidth(14);
    obj.nomeCheck13_05:setAlign("right");
    obj.nomeCheck13_05:setMargins({left=3});
    obj.nomeCheck13_05:setAutoChange(false);

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout16);
    obj.flowPart52:setMargins({bottom=5});
    obj.flowPart52:setName("flowPart52");
    obj.flowPart52:setMinWidth(220);
    obj.flowPart52:setMaxWidth(220);
    obj.flowPart52:setHeight(25);

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart52);
    obj.label34:setAlign("left");
    obj.label34:setWidth(100);
    obj.label34:setText("Condução");
    obj.label34:setName("label34");
    obj.label34:setFontSize(14);
    obj.label34:setFontColor("white");
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setTextTrimming("character");
    obj.label34:setFontFamily("Constantia");

    obj.nomeBut14 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut14:setParent(obj.flowPart52);
    obj.nomeBut14:setName("nomeBut14");
    obj.nomeBut14:setText("𝐢");
    obj.nomeBut14:setWidth(22);
    obj.nomeBut14:setHeight(22);
    obj.nomeBut14:setTop(1);
    obj.nomeBut14:setLeft(103);
    obj.nomeBut14:setFontColor("#272727");

    obj.nomeBut14B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut14B:setParent(obj.flowPart52);
    obj.nomeBut14B:setName("nomeBut14B");
    obj.nomeBut14B:setText("𝐢");
    obj.nomeBut14B:setWidth(22);
    obj.nomeBut14B:setHeight(22);
    obj.nomeBut14B:setTop(1);
    obj.nomeBut14B:setLeft(103);
    obj.nomeBut14B:setFontColor("white");
    obj.nomeBut14B:setVisible(false);

    obj.popUp_14 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_14:setParent(obj.flowPart52);
    obj.popUp_14:setName("popUp_14");
    obj.popUp_14:setWidth(200);
    obj.popUp_14:setHeight(100);
    obj.popUp_14:setBackOpacity(0);
    obj.popUp_14:setDrawContainer(false);

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.popUp_14);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("#0e0e0e");
    obj.rectangle12:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle12:setXradius(5);
    obj.rectangle12:setYradius(5);
    obj.rectangle12:setCornerType("bevel");
    obj.rectangle12:setName("rectangle12");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.rectangle12);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("#0e0e0e");
    obj.rectangle13:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle13:setXradius(3);
    obj.rectangle13:setYradius(3);
    obj.rectangle13:setStrokeColor("#272727");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setCornerType("bevel");
    obj.rectangle13:setName("rectangle13");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle13);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setField("fldEnfase14");
    obj.textEditor5:setFontFamily("Constantia");
    obj.textEditor5:setFontSize(13);
    obj.textEditor5:setName("textEditor5");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.rectangle13);
    obj.dataLink40:setField("fldEnfase14");
    obj.dataLink40:setDefaultValue("Ênfases");
    obj.dataLink40:setName("dataLink40");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.flowPart52);
    obj.layout50:setAlign("client");
    obj.layout50:setMargins({right=10});
    obj.layout50:setName("layout50");

    obj.nomeCheck14_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck14_01:setParent(obj.layout50);
    obj.nomeCheck14_01:setField("fldCheck14_01");
    obj.nomeCheck14_01:setName("nomeCheck14_01");
    obj.nomeCheck14_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck14_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck14_01:setHeight(25);
    obj.nomeCheck14_01:setWidth(14);
    obj.nomeCheck14_01:setAlign("right");
    obj.nomeCheck14_01:setMargins({left=3});
    obj.nomeCheck14_01:setAutoChange(false);

    obj.nomeCheck14_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck14_02:setParent(obj.layout50);
    obj.nomeCheck14_02:setField("fldCheck14_02");
    obj.nomeCheck14_02:setName("nomeCheck14_02");
    obj.nomeCheck14_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck14_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck14_02:setHeight(25);
    obj.nomeCheck14_02:setWidth(14);
    obj.nomeCheck14_02:setAlign("right");
    obj.nomeCheck14_02:setMargins({left=3});
    obj.nomeCheck14_02:setAutoChange(false);

    obj.nomeCheck14_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck14_03:setParent(obj.layout50);
    obj.nomeCheck14_03:setField("fldCheck14_03");
    obj.nomeCheck14_03:setName("nomeCheck14_03");
    obj.nomeCheck14_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck14_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck14_03:setHeight(25);
    obj.nomeCheck14_03:setWidth(14);
    obj.nomeCheck14_03:setAlign("right");
    obj.nomeCheck14_03:setMargins({left=3});
    obj.nomeCheck14_03:setAutoChange(false);

    obj.nomeCheck14_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck14_04:setParent(obj.layout50);
    obj.nomeCheck14_04:setField("fldCheck14_04");
    obj.nomeCheck14_04:setName("nomeCheck14_04");
    obj.nomeCheck14_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck14_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck14_04:setHeight(25);
    obj.nomeCheck14_04:setWidth(14);
    obj.nomeCheck14_04:setAlign("right");
    obj.nomeCheck14_04:setMargins({left=3});
    obj.nomeCheck14_04:setAutoChange(false);

    obj.nomeCheck14_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck14_05:setParent(obj.layout50);
    obj.nomeCheck14_05:setField("fldCheck14_05");
    obj.nomeCheck14_05:setName("nomeCheck14_05");
    obj.nomeCheck14_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck14_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck14_05:setHeight(25);
    obj.nomeCheck14_05:setWidth(14);
    obj.nomeCheck14_05:setAlign("right");
    obj.nomeCheck14_05:setMargins({left=3});
    obj.nomeCheck14_05:setAutoChange(false);

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout16);
    obj.flowPart53:setMargins({bottom=5});
    obj.flowPart53:setName("flowPart53");
    obj.flowPart53:setMinWidth(220);
    obj.flowPart53:setMaxWidth(220);
    obj.flowPart53:setHeight(25);

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart53);
    obj.label35:setAlign("left");
    obj.label35:setWidth(100);
    obj.label35:setText("Furtividade");
    obj.label35:setName("label35");
    obj.label35:setFontSize(14);
    obj.label35:setFontColor("white");
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");
    obj.label35:setTextTrimming("character");
    obj.label35:setFontFamily("Constantia");

    obj.nomeBut15 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut15:setParent(obj.flowPart53);
    obj.nomeBut15:setName("nomeBut15");
    obj.nomeBut15:setText("𝐢");
    obj.nomeBut15:setWidth(22);
    obj.nomeBut15:setHeight(22);
    obj.nomeBut15:setTop(1);
    obj.nomeBut15:setLeft(103);
    obj.nomeBut15:setFontColor("#272727");

    obj.nomeBut15B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut15B:setParent(obj.flowPart53);
    obj.nomeBut15B:setName("nomeBut15B");
    obj.nomeBut15B:setText("𝐢");
    obj.nomeBut15B:setWidth(22);
    obj.nomeBut15B:setHeight(22);
    obj.nomeBut15B:setTop(1);
    obj.nomeBut15B:setLeft(103);
    obj.nomeBut15B:setFontColor("white");
    obj.nomeBut15B:setVisible(false);

    obj.popUp_15 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_15:setParent(obj.flowPart53);
    obj.popUp_15:setName("popUp_15");
    obj.popUp_15:setWidth(200);
    obj.popUp_15:setHeight(100);
    obj.popUp_15:setBackOpacity(0);
    obj.popUp_15:setDrawContainer(false);

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.popUp_15);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("#0e0e0e");
    obj.rectangle14:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle14:setXradius(5);
    obj.rectangle14:setYradius(5);
    obj.rectangle14:setCornerType("bevel");
    obj.rectangle14:setName("rectangle14");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.rectangle14);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("#0e0e0e");
    obj.rectangle15:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle15:setXradius(3);
    obj.rectangle15:setYradius(3);
    obj.rectangle15:setStrokeColor("#272727");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setCornerType("bevel");
    obj.rectangle15:setName("rectangle15");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle15);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setField("fldEnfase15");
    obj.textEditor6:setFontFamily("Constantia");
    obj.textEditor6:setFontSize(13);
    obj.textEditor6:setName("textEditor6");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.rectangle15);
    obj.dataLink41:setField("fldEnfase15");
    obj.dataLink41:setDefaultValue("Ênfases");
    obj.dataLink41:setName("dataLink41");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.flowPart53);
    obj.layout51:setAlign("client");
    obj.layout51:setMargins({right=10});
    obj.layout51:setName("layout51");

    obj.nomeCheck15_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck15_01:setParent(obj.layout51);
    obj.nomeCheck15_01:setField("fldCheck15_01");
    obj.nomeCheck15_01:setName("nomeCheck15_01");
    obj.nomeCheck15_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck15_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck15_01:setHeight(25);
    obj.nomeCheck15_01:setWidth(14);
    obj.nomeCheck15_01:setAlign("right");
    obj.nomeCheck15_01:setMargins({left=3});
    obj.nomeCheck15_01:setAutoChange(false);

    obj.nomeCheck15_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck15_02:setParent(obj.layout51);
    obj.nomeCheck15_02:setField("fldCheck15_02");
    obj.nomeCheck15_02:setName("nomeCheck15_02");
    obj.nomeCheck15_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck15_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck15_02:setHeight(25);
    obj.nomeCheck15_02:setWidth(14);
    obj.nomeCheck15_02:setAlign("right");
    obj.nomeCheck15_02:setMargins({left=3});
    obj.nomeCheck15_02:setAutoChange(false);

    obj.nomeCheck15_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck15_03:setParent(obj.layout51);
    obj.nomeCheck15_03:setField("fldCheck15_03");
    obj.nomeCheck15_03:setName("nomeCheck15_03");
    obj.nomeCheck15_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck15_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck15_03:setHeight(25);
    obj.nomeCheck15_03:setWidth(14);
    obj.nomeCheck15_03:setAlign("right");
    obj.nomeCheck15_03:setMargins({left=3});
    obj.nomeCheck15_03:setAutoChange(false);

    obj.nomeCheck15_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck15_04:setParent(obj.layout51);
    obj.nomeCheck15_04:setField("fldCheck15_04");
    obj.nomeCheck15_04:setName("nomeCheck15_04");
    obj.nomeCheck15_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck15_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck15_04:setHeight(25);
    obj.nomeCheck15_04:setWidth(14);
    obj.nomeCheck15_04:setAlign("right");
    obj.nomeCheck15_04:setMargins({left=3});
    obj.nomeCheck15_04:setAutoChange(false);

    obj.nomeCheck15_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck15_05:setParent(obj.layout51);
    obj.nomeCheck15_05:setField("fldCheck15_05");
    obj.nomeCheck15_05:setName("nomeCheck15_05");
    obj.nomeCheck15_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck15_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck15_05:setHeight(25);
    obj.nomeCheck15_05:setWidth(14);
    obj.nomeCheck15_05:setAlign("right");
    obj.nomeCheck15_05:setMargins({left=3});
    obj.nomeCheck15_05:setAutoChange(false);

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout16);
    obj.flowPart54:setMargins({bottom=5});
    obj.flowPart54:setName("flowPart54");
    obj.flowPart54:setMinWidth(220);
    obj.flowPart54:setMaxWidth(220);
    obj.flowPart54:setHeight(25);

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart54);
    obj.label36:setAlign("left");
    obj.label36:setWidth(100);
    obj.label36:setText("Ladroagem");
    obj.label36:setName("label36");
    obj.label36:setFontSize(14);
    obj.label36:setFontColor("white");
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");
    obj.label36:setTextTrimming("character");
    obj.label36:setFontFamily("Constantia");

    obj.nomeBut16 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut16:setParent(obj.flowPart54);
    obj.nomeBut16:setName("nomeBut16");
    obj.nomeBut16:setText("𝐢");
    obj.nomeBut16:setWidth(22);
    obj.nomeBut16:setHeight(22);
    obj.nomeBut16:setTop(1);
    obj.nomeBut16:setLeft(103);
    obj.nomeBut16:setFontColor("#272727");

    obj.nomeBut16B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut16B:setParent(obj.flowPart54);
    obj.nomeBut16B:setName("nomeBut16B");
    obj.nomeBut16B:setText("𝐢");
    obj.nomeBut16B:setWidth(22);
    obj.nomeBut16B:setHeight(22);
    obj.nomeBut16B:setTop(1);
    obj.nomeBut16B:setLeft(103);
    obj.nomeBut16B:setFontColor("white");
    obj.nomeBut16B:setVisible(false);

    obj.popUp_16 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_16:setParent(obj.flowPart54);
    obj.popUp_16:setName("popUp_16");
    obj.popUp_16:setWidth(200);
    obj.popUp_16:setHeight(100);
    obj.popUp_16:setBackOpacity(0);
    obj.popUp_16:setDrawContainer(false);

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.popUp_16);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("#0e0e0e");
    obj.rectangle16:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle16:setXradius(5);
    obj.rectangle16:setYradius(5);
    obj.rectangle16:setCornerType("bevel");
    obj.rectangle16:setName("rectangle16");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.rectangle16);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("#0e0e0e");
    obj.rectangle17:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle17:setXradius(3);
    obj.rectangle17:setYradius(3);
    obj.rectangle17:setStrokeColor("#272727");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setCornerType("bevel");
    obj.rectangle17:setName("rectangle17");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle17);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setField("fldEnfase16");
    obj.textEditor7:setFontFamily("Constantia");
    obj.textEditor7:setFontSize(13);
    obj.textEditor7:setName("textEditor7");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.rectangle17);
    obj.dataLink42:setField("fldEnfase16");
    obj.dataLink42:setDefaultValue("Ênfases");
    obj.dataLink42:setName("dataLink42");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.flowPart54);
    obj.layout52:setAlign("client");
    obj.layout52:setMargins({right=10});
    obj.layout52:setName("layout52");

    obj.nomeCheck16_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck16_01:setParent(obj.layout52);
    obj.nomeCheck16_01:setField("fldCheck16_01");
    obj.nomeCheck16_01:setName("nomeCheck16_01");
    obj.nomeCheck16_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck16_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck16_01:setHeight(25);
    obj.nomeCheck16_01:setWidth(14);
    obj.nomeCheck16_01:setAlign("right");
    obj.nomeCheck16_01:setMargins({left=3});
    obj.nomeCheck16_01:setAutoChange(false);

    obj.nomeCheck16_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck16_02:setParent(obj.layout52);
    obj.nomeCheck16_02:setField("fldCheck16_02");
    obj.nomeCheck16_02:setName("nomeCheck16_02");
    obj.nomeCheck16_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck16_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck16_02:setHeight(25);
    obj.nomeCheck16_02:setWidth(14);
    obj.nomeCheck16_02:setAlign("right");
    obj.nomeCheck16_02:setMargins({left=3});
    obj.nomeCheck16_02:setAutoChange(false);

    obj.nomeCheck16_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck16_03:setParent(obj.layout52);
    obj.nomeCheck16_03:setField("fldCheck16_03");
    obj.nomeCheck16_03:setName("nomeCheck16_03");
    obj.nomeCheck16_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck16_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck16_03:setHeight(25);
    obj.nomeCheck16_03:setWidth(14);
    obj.nomeCheck16_03:setAlign("right");
    obj.nomeCheck16_03:setMargins({left=3});
    obj.nomeCheck16_03:setAutoChange(false);

    obj.nomeCheck16_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck16_04:setParent(obj.layout52);
    obj.nomeCheck16_04:setField("fldCheck16_04");
    obj.nomeCheck16_04:setName("nomeCheck16_04");
    obj.nomeCheck16_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck16_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck16_04:setHeight(25);
    obj.nomeCheck16_04:setWidth(14);
    obj.nomeCheck16_04:setAlign("right");
    obj.nomeCheck16_04:setMargins({left=3});
    obj.nomeCheck16_04:setAutoChange(false);

    obj.nomeCheck16_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck16_05:setParent(obj.layout52);
    obj.nomeCheck16_05:setField("fldCheck16_05");
    obj.nomeCheck16_05:setName("nomeCheck16_05");
    obj.nomeCheck16_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck16_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck16_05:setHeight(25);
    obj.nomeCheck16_05:setWidth(14);
    obj.nomeCheck16_05:setAlign("right");
    obj.nomeCheck16_05:setMargins({left=3});
    obj.nomeCheck16_05:setAutoChange(false);

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout16);
    obj.flowPart55:setMargins({bottom=5});
    obj.flowPart55:setName("flowPart55");
    obj.flowPart55:setMinWidth(220);
    obj.flowPart55:setMaxWidth(220);
    obj.flowPart55:setHeight(25);

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart55);
    obj.label37:setAlign("left");
    obj.label37:setWidth(100);
    obj.label37:setText("Ofícios");
    obj.label37:setName("label37");
    obj.label37:setFontSize(14);
    obj.label37:setFontColor("white");
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setTextTrimming("character");
    obj.label37:setFontFamily("Constantia");

    obj.nomeBut17 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut17:setParent(obj.flowPart55);
    obj.nomeBut17:setName("nomeBut17");
    obj.nomeBut17:setText("𝐢");
    obj.nomeBut17:setWidth(22);
    obj.nomeBut17:setHeight(22);
    obj.nomeBut17:setTop(1);
    obj.nomeBut17:setLeft(103);
    obj.nomeBut17:setFontColor("#272727");

    obj.nomeBut17B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut17B:setParent(obj.flowPart55);
    obj.nomeBut17B:setName("nomeBut17B");
    obj.nomeBut17B:setText("𝐢");
    obj.nomeBut17B:setWidth(22);
    obj.nomeBut17B:setHeight(22);
    obj.nomeBut17B:setTop(1);
    obj.nomeBut17B:setLeft(103);
    obj.nomeBut17B:setFontColor("white");
    obj.nomeBut17B:setVisible(false);

    obj.popUp_17 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_17:setParent(obj.flowPart55);
    obj.popUp_17:setName("popUp_17");
    obj.popUp_17:setWidth(200);
    obj.popUp_17:setHeight(100);
    obj.popUp_17:setBackOpacity(0);
    obj.popUp_17:setDrawContainer(false);

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.popUp_17);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("#0e0e0e");
    obj.rectangle18:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle18:setXradius(5);
    obj.rectangle18:setYradius(5);
    obj.rectangle18:setCornerType("bevel");
    obj.rectangle18:setName("rectangle18");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.rectangle18);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("#0e0e0e");
    obj.rectangle19:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle19:setXradius(3);
    obj.rectangle19:setYradius(3);
    obj.rectangle19:setStrokeColor("#272727");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setCornerType("bevel");
    obj.rectangle19:setName("rectangle19");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle19);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setField("fldEnfase17");
    obj.textEditor8:setFontFamily("Constantia");
    obj.textEditor8:setFontSize(13);
    obj.textEditor8:setName("textEditor8");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.rectangle19);
    obj.dataLink43:setField("fldEnfase17");
    obj.dataLink43:setDefaultValue("Ênfases");
    obj.dataLink43:setName("dataLink43");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.flowPart55);
    obj.layout53:setAlign("client");
    obj.layout53:setMargins({right=10});
    obj.layout53:setName("layout53");

    obj.nomeCheck17_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck17_01:setParent(obj.layout53);
    obj.nomeCheck17_01:setField("fldCheck17_01");
    obj.nomeCheck17_01:setName("nomeCheck17_01");
    obj.nomeCheck17_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck17_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck17_01:setHeight(25);
    obj.nomeCheck17_01:setWidth(14);
    obj.nomeCheck17_01:setAlign("right");
    obj.nomeCheck17_01:setMargins({left=3});
    obj.nomeCheck17_01:setAutoChange(false);

    obj.nomeCheck17_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck17_02:setParent(obj.layout53);
    obj.nomeCheck17_02:setField("fldCheck17_02");
    obj.nomeCheck17_02:setName("nomeCheck17_02");
    obj.nomeCheck17_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck17_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck17_02:setHeight(25);
    obj.nomeCheck17_02:setWidth(14);
    obj.nomeCheck17_02:setAlign("right");
    obj.nomeCheck17_02:setMargins({left=3});
    obj.nomeCheck17_02:setAutoChange(false);

    obj.nomeCheck17_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck17_03:setParent(obj.layout53);
    obj.nomeCheck17_03:setField("fldCheck17_03");
    obj.nomeCheck17_03:setName("nomeCheck17_03");
    obj.nomeCheck17_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck17_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck17_03:setHeight(25);
    obj.nomeCheck17_03:setWidth(14);
    obj.nomeCheck17_03:setAlign("right");
    obj.nomeCheck17_03:setMargins({left=3});
    obj.nomeCheck17_03:setAutoChange(false);

    obj.nomeCheck17_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck17_04:setParent(obj.layout53);
    obj.nomeCheck17_04:setField("fldCheck17_04");
    obj.nomeCheck17_04:setName("nomeCheck17_04");
    obj.nomeCheck17_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck17_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck17_04:setHeight(25);
    obj.nomeCheck17_04:setWidth(14);
    obj.nomeCheck17_04:setAlign("right");
    obj.nomeCheck17_04:setMargins({left=3});
    obj.nomeCheck17_04:setAutoChange(false);

    obj.nomeCheck17_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck17_05:setParent(obj.layout53);
    obj.nomeCheck17_05:setField("fldCheck17_05");
    obj.nomeCheck17_05:setName("nomeCheck17_05");
    obj.nomeCheck17_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck17_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck17_05:setHeight(25);
    obj.nomeCheck17_05:setWidth(14);
    obj.nomeCheck17_05:setAlign("right");
    obj.nomeCheck17_05:setMargins({left=3});
    obj.nomeCheck17_05:setAutoChange(false);

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout16);
    obj.flowPart56:setMargins({bottom=5});
    obj.flowPart56:setName("flowPart56");
    obj.flowPart56:setMinWidth(220);
    obj.flowPart56:setMaxWidth(220);
    obj.flowPart56:setHeight(25);

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart56);
    obj.label38:setAlign("left");
    obj.label38:setWidth(100);
    obj.label38:setText("Sobrevivência");
    obj.label38:setName("label38");
    obj.label38:setFontSize(14);
    obj.label38:setFontColor("white");
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setTextTrimming("character");
    obj.label38:setFontFamily("Constantia");

    obj.nomeBut18 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut18:setParent(obj.flowPart56);
    obj.nomeBut18:setName("nomeBut18");
    obj.nomeBut18:setText("𝐢");
    obj.nomeBut18:setWidth(22);
    obj.nomeBut18:setHeight(22);
    obj.nomeBut18:setTop(1);
    obj.nomeBut18:setLeft(103);
    obj.nomeBut18:setFontColor("#272727");

    obj.nomeBut18B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut18B:setParent(obj.flowPart56);
    obj.nomeBut18B:setName("nomeBut18B");
    obj.nomeBut18B:setText("𝐢");
    obj.nomeBut18B:setWidth(22);
    obj.nomeBut18B:setHeight(22);
    obj.nomeBut18B:setTop(1);
    obj.nomeBut18B:setLeft(103);
    obj.nomeBut18B:setFontColor("white");
    obj.nomeBut18B:setVisible(false);

    obj.popUp_18 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_18:setParent(obj.flowPart56);
    obj.popUp_18:setName("popUp_18");
    obj.popUp_18:setWidth(200);
    obj.popUp_18:setHeight(100);
    obj.popUp_18:setBackOpacity(0);
    obj.popUp_18:setDrawContainer(false);

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.popUp_18);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("#0e0e0e");
    obj.rectangle20:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle20:setXradius(5);
    obj.rectangle20:setYradius(5);
    obj.rectangle20:setCornerType("bevel");
    obj.rectangle20:setName("rectangle20");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle20);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("#0e0e0e");
    obj.rectangle21:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle21:setXradius(3);
    obj.rectangle21:setYradius(3);
    obj.rectangle21:setStrokeColor("#272727");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setCornerType("bevel");
    obj.rectangle21:setName("rectangle21");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle21);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setField("fldEnfase18");
    obj.textEditor9:setFontFamily("Constantia");
    obj.textEditor9:setFontSize(13);
    obj.textEditor9:setName("textEditor9");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.rectangle21);
    obj.dataLink44:setField("fldEnfase18");
    obj.dataLink44:setDefaultValue("Ênfases");
    obj.dataLink44:setName("dataLink44");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.flowPart56);
    obj.layout54:setAlign("client");
    obj.layout54:setMargins({right=10});
    obj.layout54:setName("layout54");

    obj.nomeCheck18_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck18_01:setParent(obj.layout54);
    obj.nomeCheck18_01:setField("fldCheck18_01");
    obj.nomeCheck18_01:setName("nomeCheck18_01");
    obj.nomeCheck18_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck18_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck18_01:setHeight(25);
    obj.nomeCheck18_01:setWidth(14);
    obj.nomeCheck18_01:setAlign("right");
    obj.nomeCheck18_01:setMargins({left=3});
    obj.nomeCheck18_01:setAutoChange(false);

    obj.nomeCheck18_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck18_02:setParent(obj.layout54);
    obj.nomeCheck18_02:setField("fldCheck18_02");
    obj.nomeCheck18_02:setName("nomeCheck18_02");
    obj.nomeCheck18_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck18_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck18_02:setHeight(25);
    obj.nomeCheck18_02:setWidth(14);
    obj.nomeCheck18_02:setAlign("right");
    obj.nomeCheck18_02:setMargins({left=3});
    obj.nomeCheck18_02:setAutoChange(false);

    obj.nomeCheck18_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck18_03:setParent(obj.layout54);
    obj.nomeCheck18_03:setField("fldCheck18_03");
    obj.nomeCheck18_03:setName("nomeCheck18_03");
    obj.nomeCheck18_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck18_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck18_03:setHeight(25);
    obj.nomeCheck18_03:setWidth(14);
    obj.nomeCheck18_03:setAlign("right");
    obj.nomeCheck18_03:setMargins({left=3});
    obj.nomeCheck18_03:setAutoChange(false);

    obj.nomeCheck18_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck18_04:setParent(obj.layout54);
    obj.nomeCheck18_04:setField("fldCheck18_04");
    obj.nomeCheck18_04:setName("nomeCheck18_04");
    obj.nomeCheck18_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck18_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck18_04:setHeight(25);
    obj.nomeCheck18_04:setWidth(14);
    obj.nomeCheck18_04:setAlign("right");
    obj.nomeCheck18_04:setMargins({left=3});
    obj.nomeCheck18_04:setAutoChange(false);

    obj.nomeCheck18_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck18_05:setParent(obj.layout54);
    obj.nomeCheck18_05:setField("fldCheck18_05");
    obj.nomeCheck18_05:setName("nomeCheck18_05");
    obj.nomeCheck18_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck18_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck18_05:setHeight(25);
    obj.nomeCheck18_05:setWidth(14);
    obj.nomeCheck18_05:setAlign("right");
    obj.nomeCheck18_05:setMargins({left=3});
    obj.nomeCheck18_05:setAutoChange(false);

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout15);
    obj.flowPart57:setHeight(270);
    obj.flowPart57:setWidth(220);
    obj.flowPart57:setMargins({bottom=20, left=20, right=20});
    obj.flowPart57:setName("flowPart57");
    obj.flowPart57:setMinWidth(220);
    obj.flowPart57:setMaxWidth(220);

    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.flowPart57);
    obj.flowLayout17:setOrientation("vertical");
    obj.flowLayout17:setWidth(220);
    obj.flowLayout17:setAutoHeight(true);
    obj.flowLayout17:setMaxColumns(1);
    obj.flowLayout17:setName("flowLayout17");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout17);
    obj.flowPart58:setMargins({bottom=5});
    obj.flowPart58:setName("flowPart58");
    obj.flowPart58:setMinWidth(220);
    obj.flowPart58:setMaxWidth(220);
    obj.flowPart58:setHeight(25);

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart58);
    obj.label39:setAlign("left");
    obj.label39:setWidth(100);
    obj.label39:setText("Animais");
    obj.label39:setName("label39");
    obj.label39:setFontSize(14);
    obj.label39:setFontColor("white");
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setTextTrimming("character");
    obj.label39:setFontFamily("Constantia");

    obj.nomeBut19 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut19:setParent(obj.flowPart58);
    obj.nomeBut19:setName("nomeBut19");
    obj.nomeBut19:setText("𝐢");
    obj.nomeBut19:setWidth(22);
    obj.nomeBut19:setHeight(22);
    obj.nomeBut19:setTop(1);
    obj.nomeBut19:setLeft(103);
    obj.nomeBut19:setFontColor("#272727");

    obj.nomeBut19B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut19B:setParent(obj.flowPart58);
    obj.nomeBut19B:setName("nomeBut19B");
    obj.nomeBut19B:setText("𝐢");
    obj.nomeBut19B:setWidth(22);
    obj.nomeBut19B:setHeight(22);
    obj.nomeBut19B:setTop(1);
    obj.nomeBut19B:setLeft(103);
    obj.nomeBut19B:setFontColor("white");
    obj.nomeBut19B:setVisible(false);

    obj.popUp_19 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_19:setParent(obj.flowPart58);
    obj.popUp_19:setName("popUp_19");
    obj.popUp_19:setWidth(200);
    obj.popUp_19:setHeight(100);
    obj.popUp_19:setBackOpacity(0);
    obj.popUp_19:setDrawContainer(false);

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.popUp_19);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("#0e0e0e");
    obj.rectangle22:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle22:setXradius(5);
    obj.rectangle22:setYradius(5);
    obj.rectangle22:setCornerType("bevel");
    obj.rectangle22:setName("rectangle22");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.rectangle22);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("#0e0e0e");
    obj.rectangle23:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle23:setXradius(3);
    obj.rectangle23:setYradius(3);
    obj.rectangle23:setStrokeColor("#272727");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setCornerType("bevel");
    obj.rectangle23:setName("rectangle23");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.rectangle23);
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setField("fldEnfase19");
    obj.textEditor10:setFontFamily("Constantia");
    obj.textEditor10:setFontSize(13);
    obj.textEditor10:setName("textEditor10");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.rectangle23);
    obj.dataLink45:setField("fldEnfase19");
    obj.dataLink45:setDefaultValue("Ênfases");
    obj.dataLink45:setName("dataLink45");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.flowPart58);
    obj.layout55:setAlign("client");
    obj.layout55:setMargins({right=10});
    obj.layout55:setName("layout55");

    obj.nomeCheck19_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck19_01:setParent(obj.layout55);
    obj.nomeCheck19_01:setField("fldCheck19_01");
    obj.nomeCheck19_01:setName("nomeCheck19_01");
    obj.nomeCheck19_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck19_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck19_01:setHeight(25);
    obj.nomeCheck19_01:setWidth(14);
    obj.nomeCheck19_01:setAlign("right");
    obj.nomeCheck19_01:setMargins({left=3});
    obj.nomeCheck19_01:setAutoChange(false);

    obj.nomeCheck19_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck19_02:setParent(obj.layout55);
    obj.nomeCheck19_02:setField("fldCheck19_02");
    obj.nomeCheck19_02:setName("nomeCheck19_02");
    obj.nomeCheck19_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck19_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck19_02:setHeight(25);
    obj.nomeCheck19_02:setWidth(14);
    obj.nomeCheck19_02:setAlign("right");
    obj.nomeCheck19_02:setMargins({left=3});
    obj.nomeCheck19_02:setAutoChange(false);

    obj.nomeCheck19_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck19_03:setParent(obj.layout55);
    obj.nomeCheck19_03:setField("fldCheck19_03");
    obj.nomeCheck19_03:setName("nomeCheck19_03");
    obj.nomeCheck19_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck19_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck19_03:setHeight(25);
    obj.nomeCheck19_03:setWidth(14);
    obj.nomeCheck19_03:setAlign("right");
    obj.nomeCheck19_03:setMargins({left=3});
    obj.nomeCheck19_03:setAutoChange(false);

    obj.nomeCheck19_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck19_04:setParent(obj.layout55);
    obj.nomeCheck19_04:setField("fldCheck19_04");
    obj.nomeCheck19_04:setName("nomeCheck19_04");
    obj.nomeCheck19_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck19_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck19_04:setHeight(25);
    obj.nomeCheck19_04:setWidth(14);
    obj.nomeCheck19_04:setAlign("right");
    obj.nomeCheck19_04:setMargins({left=3});
    obj.nomeCheck19_04:setAutoChange(false);

    obj.nomeCheck19_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck19_05:setParent(obj.layout55);
    obj.nomeCheck19_05:setField("fldCheck19_05");
    obj.nomeCheck19_05:setName("nomeCheck19_05");
    obj.nomeCheck19_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck19_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck19_05:setHeight(25);
    obj.nomeCheck19_05:setWidth(14);
    obj.nomeCheck19_05:setAlign("right");
    obj.nomeCheck19_05:setMargins({left=3});
    obj.nomeCheck19_05:setAutoChange(false);

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout17);
    obj.flowPart59:setMargins({bottom=5});
    obj.flowPart59:setName("flowPart59");
    obj.flowPart59:setMinWidth(220);
    obj.flowPart59:setMaxWidth(220);
    obj.flowPart59:setHeight(25);

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart59);
    obj.label40:setAlign("left");
    obj.label40:setWidth(100);
    obj.label40:setText("Etiqueta");
    obj.label40:setName("label40");
    obj.label40:setFontSize(14);
    obj.label40:setFontColor("white");
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setTextTrimming("character");
    obj.label40:setFontFamily("Constantia");

    obj.nomeBut20 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut20:setParent(obj.flowPart59);
    obj.nomeBut20:setName("nomeBut20");
    obj.nomeBut20:setText("𝐢");
    obj.nomeBut20:setWidth(22);
    obj.nomeBut20:setHeight(22);
    obj.nomeBut20:setTop(1);
    obj.nomeBut20:setLeft(103);
    obj.nomeBut20:setFontColor("#272727");

    obj.nomeBut20B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut20B:setParent(obj.flowPart59);
    obj.nomeBut20B:setName("nomeBut20B");
    obj.nomeBut20B:setText("𝐢");
    obj.nomeBut20B:setWidth(22);
    obj.nomeBut20B:setHeight(22);
    obj.nomeBut20B:setTop(1);
    obj.nomeBut20B:setLeft(103);
    obj.nomeBut20B:setFontColor("white");
    obj.nomeBut20B:setVisible(false);

    obj.popUp_20 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_20:setParent(obj.flowPart59);
    obj.popUp_20:setName("popUp_20");
    obj.popUp_20:setWidth(200);
    obj.popUp_20:setHeight(100);
    obj.popUp_20:setBackOpacity(0);
    obj.popUp_20:setDrawContainer(false);

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.popUp_20);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("#0e0e0e");
    obj.rectangle24:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle24:setXradius(5);
    obj.rectangle24:setYradius(5);
    obj.rectangle24:setCornerType("bevel");
    obj.rectangle24:setName("rectangle24");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle24);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("#0e0e0e");
    obj.rectangle25:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle25:setXradius(3);
    obj.rectangle25:setYradius(3);
    obj.rectangle25:setStrokeColor("#272727");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setCornerType("bevel");
    obj.rectangle25:setName("rectangle25");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.rectangle25);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setField("fldEnfase20");
    obj.textEditor11:setFontFamily("Constantia");
    obj.textEditor11:setFontSize(13);
    obj.textEditor11:setName("textEditor11");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.rectangle25);
    obj.dataLink46:setField("fldEnfase20");
    obj.dataLink46:setDefaultValue("Ênfases");
    obj.dataLink46:setName("dataLink46");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.flowPart59);
    obj.layout56:setAlign("client");
    obj.layout56:setMargins({right=10});
    obj.layout56:setName("layout56");

    obj.nomeCheck20_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck20_01:setParent(obj.layout56);
    obj.nomeCheck20_01:setField("fldCheck20_01");
    obj.nomeCheck20_01:setName("nomeCheck20_01");
    obj.nomeCheck20_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck20_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck20_01:setHeight(25);
    obj.nomeCheck20_01:setWidth(14);
    obj.nomeCheck20_01:setAlign("right");
    obj.nomeCheck20_01:setMargins({left=3});
    obj.nomeCheck20_01:setAutoChange(false);

    obj.nomeCheck20_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck20_02:setParent(obj.layout56);
    obj.nomeCheck20_02:setField("fldCheck20_02");
    obj.nomeCheck20_02:setName("nomeCheck20_02");
    obj.nomeCheck20_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck20_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck20_02:setHeight(25);
    obj.nomeCheck20_02:setWidth(14);
    obj.nomeCheck20_02:setAlign("right");
    obj.nomeCheck20_02:setMargins({left=3});
    obj.nomeCheck20_02:setAutoChange(false);

    obj.nomeCheck20_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck20_03:setParent(obj.layout56);
    obj.nomeCheck20_03:setField("fldCheck20_03");
    obj.nomeCheck20_03:setName("nomeCheck20_03");
    obj.nomeCheck20_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck20_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck20_03:setHeight(25);
    obj.nomeCheck20_03:setWidth(14);
    obj.nomeCheck20_03:setAlign("right");
    obj.nomeCheck20_03:setMargins({left=3});
    obj.nomeCheck20_03:setAutoChange(false);

    obj.nomeCheck20_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck20_04:setParent(obj.layout56);
    obj.nomeCheck20_04:setField("fldCheck20_04");
    obj.nomeCheck20_04:setName("nomeCheck20_04");
    obj.nomeCheck20_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck20_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck20_04:setHeight(25);
    obj.nomeCheck20_04:setWidth(14);
    obj.nomeCheck20_04:setAlign("right");
    obj.nomeCheck20_04:setMargins({left=3});
    obj.nomeCheck20_04:setAutoChange(false);

    obj.nomeCheck20_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck20_05:setParent(obj.layout56);
    obj.nomeCheck20_05:setField("fldCheck20_05");
    obj.nomeCheck20_05:setName("nomeCheck20_05");
    obj.nomeCheck20_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck20_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck20_05:setHeight(25);
    obj.nomeCheck20_05:setWidth(14);
    obj.nomeCheck20_05:setAlign("right");
    obj.nomeCheck20_05:setMargins({left=3});
    obj.nomeCheck20_05:setAutoChange(false);

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout17);
    obj.flowPart60:setMargins({bottom=5});
    obj.flowPart60:setName("flowPart60");
    obj.flowPart60:setMinWidth(220);
    obj.flowPart60:setMaxWidth(220);
    obj.flowPart60:setHeight(25);

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart60);
    obj.label41:setAlign("left");
    obj.label41:setWidth(100);
    obj.label41:setText("Intimidação");
    obj.label41:setName("label41");
    obj.label41:setFontSize(14);
    obj.label41:setFontColor("white");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setTextTrimming("character");
    obj.label41:setFontFamily("Constantia");

    obj.nomeBut21 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut21:setParent(obj.flowPart60);
    obj.nomeBut21:setName("nomeBut21");
    obj.nomeBut21:setText("𝐢");
    obj.nomeBut21:setWidth(22);
    obj.nomeBut21:setHeight(22);
    obj.nomeBut21:setTop(1);
    obj.nomeBut21:setLeft(103);
    obj.nomeBut21:setFontColor("#272727");

    obj.nomeBut21B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut21B:setParent(obj.flowPart60);
    obj.nomeBut21B:setName("nomeBut21B");
    obj.nomeBut21B:setText("𝐢");
    obj.nomeBut21B:setWidth(22);
    obj.nomeBut21B:setHeight(22);
    obj.nomeBut21B:setTop(1);
    obj.nomeBut21B:setLeft(103);
    obj.nomeBut21B:setFontColor("white");
    obj.nomeBut21B:setVisible(false);

    obj.popUp_21 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_21:setParent(obj.flowPart60);
    obj.popUp_21:setName("popUp_21");
    obj.popUp_21:setWidth(200);
    obj.popUp_21:setHeight(100);
    obj.popUp_21:setBackOpacity(0);
    obj.popUp_21:setDrawContainer(false);

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.popUp_21);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("#0e0e0e");
    obj.rectangle26:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle26:setXradius(5);
    obj.rectangle26:setYradius(5);
    obj.rectangle26:setCornerType("bevel");
    obj.rectangle26:setName("rectangle26");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.rectangle26);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("#0e0e0e");
    obj.rectangle27:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle27:setXradius(3);
    obj.rectangle27:setYradius(3);
    obj.rectangle27:setStrokeColor("#272727");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setCornerType("bevel");
    obj.rectangle27:setName("rectangle27");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.rectangle27);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setTransparent(true);
    obj.textEditor12:setField("fldEnfase21");
    obj.textEditor12:setFontFamily("Constantia");
    obj.textEditor12:setFontSize(13);
    obj.textEditor12:setName("textEditor12");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.rectangle27);
    obj.dataLink47:setField("fldEnfase21");
    obj.dataLink47:setDefaultValue("Ênfases");
    obj.dataLink47:setName("dataLink47");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.flowPart60);
    obj.layout57:setAlign("client");
    obj.layout57:setMargins({right=10});
    obj.layout57:setName("layout57");

    obj.nomeCheck21_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck21_01:setParent(obj.layout57);
    obj.nomeCheck21_01:setField("fldCheck21_01");
    obj.nomeCheck21_01:setName("nomeCheck21_01");
    obj.nomeCheck21_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck21_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck21_01:setHeight(25);
    obj.nomeCheck21_01:setWidth(14);
    obj.nomeCheck21_01:setAlign("right");
    obj.nomeCheck21_01:setMargins({left=3});
    obj.nomeCheck21_01:setAutoChange(false);

    obj.nomeCheck21_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck21_02:setParent(obj.layout57);
    obj.nomeCheck21_02:setField("fldCheck21_02");
    obj.nomeCheck21_02:setName("nomeCheck21_02");
    obj.nomeCheck21_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck21_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck21_02:setHeight(25);
    obj.nomeCheck21_02:setWidth(14);
    obj.nomeCheck21_02:setAlign("right");
    obj.nomeCheck21_02:setMargins({left=3});
    obj.nomeCheck21_02:setAutoChange(false);

    obj.nomeCheck21_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck21_03:setParent(obj.layout57);
    obj.nomeCheck21_03:setField("fldCheck21_03");
    obj.nomeCheck21_03:setName("nomeCheck21_03");
    obj.nomeCheck21_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck21_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck21_03:setHeight(25);
    obj.nomeCheck21_03:setWidth(14);
    obj.nomeCheck21_03:setAlign("right");
    obj.nomeCheck21_03:setMargins({left=3});
    obj.nomeCheck21_03:setAutoChange(false);

    obj.nomeCheck21_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck21_04:setParent(obj.layout57);
    obj.nomeCheck21_04:setField("fldCheck21_04");
    obj.nomeCheck21_04:setName("nomeCheck21_04");
    obj.nomeCheck21_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck21_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck21_04:setHeight(25);
    obj.nomeCheck21_04:setWidth(14);
    obj.nomeCheck21_04:setAlign("right");
    obj.nomeCheck21_04:setMargins({left=3});
    obj.nomeCheck21_04:setAutoChange(false);

    obj.nomeCheck21_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck21_05:setParent(obj.layout57);
    obj.nomeCheck21_05:setField("fldCheck21_05");
    obj.nomeCheck21_05:setName("nomeCheck21_05");
    obj.nomeCheck21_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck21_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck21_05:setHeight(25);
    obj.nomeCheck21_05:setWidth(14);
    obj.nomeCheck21_05:setAlign("right");
    obj.nomeCheck21_05:setMargins({left=3});
    obj.nomeCheck21_05:setAutoChange(false);

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout17);
    obj.flowPart61:setMargins({bottom=5});
    obj.flowPart61:setName("flowPart61");
    obj.flowPart61:setMinWidth(220);
    obj.flowPart61:setMaxWidth(220);
    obj.flowPart61:setHeight(25);

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart61);
    obj.label42:setAlign("left");
    obj.label42:setWidth(100);
    obj.label42:setText("Liderança");
    obj.label42:setName("label42");
    obj.label42:setFontSize(14);
    obj.label42:setFontColor("white");
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");
    obj.label42:setTextTrimming("character");
    obj.label42:setFontFamily("Constantia");

    obj.nomeBut22 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut22:setParent(obj.flowPart61);
    obj.nomeBut22:setName("nomeBut22");
    obj.nomeBut22:setText("𝐢");
    obj.nomeBut22:setWidth(22);
    obj.nomeBut22:setHeight(22);
    obj.nomeBut22:setTop(1);
    obj.nomeBut22:setLeft(103);
    obj.nomeBut22:setFontColor("#272727");

    obj.nomeBut22B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut22B:setParent(obj.flowPart61);
    obj.nomeBut22B:setName("nomeBut22B");
    obj.nomeBut22B:setText("𝐢");
    obj.nomeBut22B:setWidth(22);
    obj.nomeBut22B:setHeight(22);
    obj.nomeBut22B:setTop(1);
    obj.nomeBut22B:setLeft(103);
    obj.nomeBut22B:setFontColor("white");
    obj.nomeBut22B:setVisible(false);

    obj.popUp_22 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_22:setParent(obj.flowPart61);
    obj.popUp_22:setName("popUp_22");
    obj.popUp_22:setWidth(200);
    obj.popUp_22:setHeight(100);
    obj.popUp_22:setBackOpacity(0);
    obj.popUp_22:setDrawContainer(false);

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.popUp_22);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("#0e0e0e");
    obj.rectangle28:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle28:setXradius(5);
    obj.rectangle28:setYradius(5);
    obj.rectangle28:setCornerType("bevel");
    obj.rectangle28:setName("rectangle28");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.rectangle28);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("#0e0e0e");
    obj.rectangle29:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle29:setXradius(3);
    obj.rectangle29:setYradius(3);
    obj.rectangle29:setStrokeColor("#272727");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setCornerType("bevel");
    obj.rectangle29:setName("rectangle29");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.rectangle29);
    obj.textEditor13:setAlign("client");
    obj.textEditor13:setTransparent(true);
    obj.textEditor13:setField("fldEnfase22");
    obj.textEditor13:setFontFamily("Constantia");
    obj.textEditor13:setFontSize(13);
    obj.textEditor13:setName("textEditor13");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.rectangle29);
    obj.dataLink48:setField("fldEnfase22");
    obj.dataLink48:setDefaultValue("Ênfases");
    obj.dataLink48:setName("dataLink48");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.flowPart61);
    obj.layout58:setAlign("client");
    obj.layout58:setMargins({right=10});
    obj.layout58:setName("layout58");

    obj.nomeCheck22_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck22_01:setParent(obj.layout58);
    obj.nomeCheck22_01:setField("fldCheck22_01");
    obj.nomeCheck22_01:setName("nomeCheck22_01");
    obj.nomeCheck22_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck22_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck22_01:setHeight(25);
    obj.nomeCheck22_01:setWidth(14);
    obj.nomeCheck22_01:setAlign("right");
    obj.nomeCheck22_01:setMargins({left=3});
    obj.nomeCheck22_01:setAutoChange(false);

    obj.nomeCheck22_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck22_02:setParent(obj.layout58);
    obj.nomeCheck22_02:setField("fldCheck22_02");
    obj.nomeCheck22_02:setName("nomeCheck22_02");
    obj.nomeCheck22_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck22_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck22_02:setHeight(25);
    obj.nomeCheck22_02:setWidth(14);
    obj.nomeCheck22_02:setAlign("right");
    obj.nomeCheck22_02:setMargins({left=3});
    obj.nomeCheck22_02:setAutoChange(false);

    obj.nomeCheck22_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck22_03:setParent(obj.layout58);
    obj.nomeCheck22_03:setField("fldCheck22_03");
    obj.nomeCheck22_03:setName("nomeCheck22_03");
    obj.nomeCheck22_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck22_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck22_03:setHeight(25);
    obj.nomeCheck22_03:setWidth(14);
    obj.nomeCheck22_03:setAlign("right");
    obj.nomeCheck22_03:setMargins({left=3});
    obj.nomeCheck22_03:setAutoChange(false);

    obj.nomeCheck22_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck22_04:setParent(obj.layout58);
    obj.nomeCheck22_04:setField("fldCheck22_04");
    obj.nomeCheck22_04:setName("nomeCheck22_04");
    obj.nomeCheck22_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck22_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck22_04:setHeight(25);
    obj.nomeCheck22_04:setWidth(14);
    obj.nomeCheck22_04:setAlign("right");
    obj.nomeCheck22_04:setMargins({left=3});
    obj.nomeCheck22_04:setAutoChange(false);

    obj.nomeCheck22_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck22_05:setParent(obj.layout58);
    obj.nomeCheck22_05:setField("fldCheck22_05");
    obj.nomeCheck22_05:setName("nomeCheck22_05");
    obj.nomeCheck22_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck22_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck22_05:setHeight(25);
    obj.nomeCheck22_05:setWidth(14);
    obj.nomeCheck22_05:setAlign("right");
    obj.nomeCheck22_05:setMargins({left=3});
    obj.nomeCheck22_05:setAutoChange(false);

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout17);
    obj.flowPart62:setMargins({bottom=5});
    obj.flowPart62:setName("flowPart62");
    obj.flowPart62:setMinWidth(220);
    obj.flowPart62:setMaxWidth(220);
    obj.flowPart62:setHeight(25);

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowPart62);
    obj.label43:setAlign("left");
    obj.label43:setWidth(100);
    obj.label43:setText("Manha");
    obj.label43:setName("label43");
    obj.label43:setFontSize(14);
    obj.label43:setFontColor("white");
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setTextTrimming("character");
    obj.label43:setFontFamily("Constantia");

    obj.nomeBut23 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut23:setParent(obj.flowPart62);
    obj.nomeBut23:setName("nomeBut23");
    obj.nomeBut23:setText("𝐢");
    obj.nomeBut23:setWidth(22);
    obj.nomeBut23:setHeight(22);
    obj.nomeBut23:setTop(1);
    obj.nomeBut23:setLeft(103);
    obj.nomeBut23:setFontColor("#272727");

    obj.nomeBut23B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut23B:setParent(obj.flowPart62);
    obj.nomeBut23B:setName("nomeBut23B");
    obj.nomeBut23B:setText("𝐢");
    obj.nomeBut23B:setWidth(22);
    obj.nomeBut23B:setHeight(22);
    obj.nomeBut23B:setTop(1);
    obj.nomeBut23B:setLeft(103);
    obj.nomeBut23B:setFontColor("white");
    obj.nomeBut23B:setVisible(false);

    obj.popUp_23 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_23:setParent(obj.flowPart62);
    obj.popUp_23:setName("popUp_23");
    obj.popUp_23:setWidth(200);
    obj.popUp_23:setHeight(100);
    obj.popUp_23:setBackOpacity(0);
    obj.popUp_23:setDrawContainer(false);

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.popUp_23);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("#0e0e0e");
    obj.rectangle30:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle30:setXradius(5);
    obj.rectangle30:setYradius(5);
    obj.rectangle30:setCornerType("bevel");
    obj.rectangle30:setName("rectangle30");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.rectangle30);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("#0e0e0e");
    obj.rectangle31:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle31:setXradius(3);
    obj.rectangle31:setYradius(3);
    obj.rectangle31:setStrokeColor("#272727");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setCornerType("bevel");
    obj.rectangle31:setName("rectangle31");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.rectangle31);
    obj.textEditor14:setAlign("client");
    obj.textEditor14:setTransparent(true);
    obj.textEditor14:setField("fldEnfase23");
    obj.textEditor14:setFontFamily("Constantia");
    obj.textEditor14:setFontSize(13);
    obj.textEditor14:setName("textEditor14");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.rectangle31);
    obj.dataLink49:setField("fldEnfase23");
    obj.dataLink49:setDefaultValue("Ênfases");
    obj.dataLink49:setName("dataLink49");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.flowPart62);
    obj.layout59:setAlign("client");
    obj.layout59:setMargins({right=10});
    obj.layout59:setName("layout59");

    obj.nomeCheck23_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck23_01:setParent(obj.layout59);
    obj.nomeCheck23_01:setField("fldCheck23_01");
    obj.nomeCheck23_01:setName("nomeCheck23_01");
    obj.nomeCheck23_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck23_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck23_01:setHeight(25);
    obj.nomeCheck23_01:setWidth(14);
    obj.nomeCheck23_01:setAlign("right");
    obj.nomeCheck23_01:setMargins({left=3});
    obj.nomeCheck23_01:setAutoChange(false);

    obj.nomeCheck23_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck23_02:setParent(obj.layout59);
    obj.nomeCheck23_02:setField("fldCheck23_02");
    obj.nomeCheck23_02:setName("nomeCheck23_02");
    obj.nomeCheck23_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck23_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck23_02:setHeight(25);
    obj.nomeCheck23_02:setWidth(14);
    obj.nomeCheck23_02:setAlign("right");
    obj.nomeCheck23_02:setMargins({left=3});
    obj.nomeCheck23_02:setAutoChange(false);

    obj.nomeCheck23_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck23_03:setParent(obj.layout59);
    obj.nomeCheck23_03:setField("fldCheck23_03");
    obj.nomeCheck23_03:setName("nomeCheck23_03");
    obj.nomeCheck23_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck23_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck23_03:setHeight(25);
    obj.nomeCheck23_03:setWidth(14);
    obj.nomeCheck23_03:setAlign("right");
    obj.nomeCheck23_03:setMargins({left=3});
    obj.nomeCheck23_03:setAutoChange(false);

    obj.nomeCheck23_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck23_04:setParent(obj.layout59);
    obj.nomeCheck23_04:setField("fldCheck23_04");
    obj.nomeCheck23_04:setName("nomeCheck23_04");
    obj.nomeCheck23_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck23_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck23_04:setHeight(25);
    obj.nomeCheck23_04:setWidth(14);
    obj.nomeCheck23_04:setAlign("right");
    obj.nomeCheck23_04:setMargins({left=3});
    obj.nomeCheck23_04:setAutoChange(false);

    obj.nomeCheck23_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck23_05:setParent(obj.layout59);
    obj.nomeCheck23_05:setField("fldCheck23_05");
    obj.nomeCheck23_05:setName("nomeCheck23_05");
    obj.nomeCheck23_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck23_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck23_05:setHeight(25);
    obj.nomeCheck23_05:setWidth(14);
    obj.nomeCheck23_05:setAlign("right");
    obj.nomeCheck23_05:setMargins({left=3});
    obj.nomeCheck23_05:setAutoChange(false);

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.flowLayout17);
    obj.flowPart63:setMargins({bottom=5});
    obj.flowPart63:setName("flowPart63");
    obj.flowPart63:setMinWidth(220);
    obj.flowPart63:setMaxWidth(220);
    obj.flowPart63:setHeight(25);

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart63);
    obj.label44:setAlign("left");
    obj.label44:setWidth(100);
    obj.label44:setText("Performance");
    obj.label44:setName("label44");
    obj.label44:setFontSize(14);
    obj.label44:setFontColor("white");
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setTextTrimming("character");
    obj.label44:setFontFamily("Constantia");

    obj.nomeBut24 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut24:setParent(obj.flowPart63);
    obj.nomeBut24:setName("nomeBut24");
    obj.nomeBut24:setText("𝐢");
    obj.nomeBut24:setWidth(22);
    obj.nomeBut24:setHeight(22);
    obj.nomeBut24:setTop(1);
    obj.nomeBut24:setLeft(103);
    obj.nomeBut24:setFontColor("#272727");

    obj.nomeBut24B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut24B:setParent(obj.flowPart63);
    obj.nomeBut24B:setName("nomeBut24B");
    obj.nomeBut24B:setText("𝐢");
    obj.nomeBut24B:setWidth(22);
    obj.nomeBut24B:setHeight(22);
    obj.nomeBut24B:setTop(1);
    obj.nomeBut24B:setLeft(103);
    obj.nomeBut24B:setFontColor("white");
    obj.nomeBut24B:setVisible(false);

    obj.popUp_24 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_24:setParent(obj.flowPart63);
    obj.popUp_24:setName("popUp_24");
    obj.popUp_24:setWidth(200);
    obj.popUp_24:setHeight(100);
    obj.popUp_24:setBackOpacity(0);
    obj.popUp_24:setDrawContainer(false);

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.popUp_24);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("#0e0e0e");
    obj.rectangle32:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle32:setXradius(5);
    obj.rectangle32:setYradius(5);
    obj.rectangle32:setCornerType("bevel");
    obj.rectangle32:setName("rectangle32");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.rectangle32);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setColor("#0e0e0e");
    obj.rectangle33:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle33:setXradius(3);
    obj.rectangle33:setYradius(3);
    obj.rectangle33:setStrokeColor("#272727");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setCornerType("bevel");
    obj.rectangle33:setName("rectangle33");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.rectangle33);
    obj.textEditor15:setAlign("client");
    obj.textEditor15:setTransparent(true);
    obj.textEditor15:setField("fldEnfase24");
    obj.textEditor15:setFontFamily("Constantia");
    obj.textEditor15:setFontSize(13);
    obj.textEditor15:setName("textEditor15");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.rectangle33);
    obj.dataLink50:setField("fldEnfase24");
    obj.dataLink50:setDefaultValue("Ênfases");
    obj.dataLink50:setName("dataLink50");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.flowPart63);
    obj.layout60:setAlign("client");
    obj.layout60:setMargins({right=10});
    obj.layout60:setName("layout60");

    obj.nomeCheck24_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck24_01:setParent(obj.layout60);
    obj.nomeCheck24_01:setField("fldCheck24_01");
    obj.nomeCheck24_01:setName("nomeCheck24_01");
    obj.nomeCheck24_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck24_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck24_01:setHeight(25);
    obj.nomeCheck24_01:setWidth(14);
    obj.nomeCheck24_01:setAlign("right");
    obj.nomeCheck24_01:setMargins({left=3});
    obj.nomeCheck24_01:setAutoChange(false);

    obj.nomeCheck24_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck24_02:setParent(obj.layout60);
    obj.nomeCheck24_02:setField("fldCheck24_02");
    obj.nomeCheck24_02:setName("nomeCheck24_02");
    obj.nomeCheck24_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck24_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck24_02:setHeight(25);
    obj.nomeCheck24_02:setWidth(14);
    obj.nomeCheck24_02:setAlign("right");
    obj.nomeCheck24_02:setMargins({left=3});
    obj.nomeCheck24_02:setAutoChange(false);

    obj.nomeCheck24_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck24_03:setParent(obj.layout60);
    obj.nomeCheck24_03:setField("fldCheck24_03");
    obj.nomeCheck24_03:setName("nomeCheck24_03");
    obj.nomeCheck24_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck24_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck24_03:setHeight(25);
    obj.nomeCheck24_03:setWidth(14);
    obj.nomeCheck24_03:setAlign("right");
    obj.nomeCheck24_03:setMargins({left=3});
    obj.nomeCheck24_03:setAutoChange(false);

    obj.nomeCheck24_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck24_04:setParent(obj.layout60);
    obj.nomeCheck24_04:setField("fldCheck24_04");
    obj.nomeCheck24_04:setName("nomeCheck24_04");
    obj.nomeCheck24_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck24_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck24_04:setHeight(25);
    obj.nomeCheck24_04:setWidth(14);
    obj.nomeCheck24_04:setAlign("right");
    obj.nomeCheck24_04:setMargins({left=3});
    obj.nomeCheck24_04:setAutoChange(false);

    obj.nomeCheck24_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck24_05:setParent(obj.layout60);
    obj.nomeCheck24_05:setField("fldCheck24_05");
    obj.nomeCheck24_05:setName("nomeCheck24_05");
    obj.nomeCheck24_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck24_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck24_05:setHeight(25);
    obj.nomeCheck24_05:setWidth(14);
    obj.nomeCheck24_05:setAlign("right");
    obj.nomeCheck24_05:setMargins({left=3});
    obj.nomeCheck24_05:setAutoChange(false);

    obj.flowPart64 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.flowLayout17);
    obj.flowPart64:setMargins({bottom=5});
    obj.flowPart64:setName("flowPart64");
    obj.flowPart64:setMinWidth(220);
    obj.flowPart64:setMaxWidth(220);
    obj.flowPart64:setHeight(25);

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart64);
    obj.label45:setAlign("left");
    obj.label45:setWidth(100);
    obj.label45:setText("Persuasão");
    obj.label45:setName("label45");
    obj.label45:setFontSize(14);
    obj.label45:setFontColor("white");
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setTextTrimming("character");
    obj.label45:setFontFamily("Constantia");

    obj.nomeBut25 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut25:setParent(obj.flowPart64);
    obj.nomeBut25:setName("nomeBut25");
    obj.nomeBut25:setText("𝐢");
    obj.nomeBut25:setWidth(22);
    obj.nomeBut25:setHeight(22);
    obj.nomeBut25:setTop(1);
    obj.nomeBut25:setLeft(103);
    obj.nomeBut25:setFontColor("#272727");

    obj.nomeBut25B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut25B:setParent(obj.flowPart64);
    obj.nomeBut25B:setName("nomeBut25B");
    obj.nomeBut25B:setText("𝐢");
    obj.nomeBut25B:setWidth(22);
    obj.nomeBut25B:setHeight(22);
    obj.nomeBut25B:setTop(1);
    obj.nomeBut25B:setLeft(103);
    obj.nomeBut25B:setFontColor("white");
    obj.nomeBut25B:setVisible(false);

    obj.popUp_25 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_25:setParent(obj.flowPart64);
    obj.popUp_25:setName("popUp_25");
    obj.popUp_25:setWidth(200);
    obj.popUp_25:setHeight(100);
    obj.popUp_25:setBackOpacity(0);
    obj.popUp_25:setDrawContainer(false);

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.popUp_25);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("#0e0e0e");
    obj.rectangle34:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle34:setXradius(5);
    obj.rectangle34:setYradius(5);
    obj.rectangle34:setCornerType("bevel");
    obj.rectangle34:setName("rectangle34");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.rectangle34);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("#0e0e0e");
    obj.rectangle35:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle35:setXradius(3);
    obj.rectangle35:setYradius(3);
    obj.rectangle35:setStrokeColor("#272727");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setCornerType("bevel");
    obj.rectangle35:setName("rectangle35");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.rectangle35);
    obj.textEditor16:setAlign("client");
    obj.textEditor16:setTransparent(true);
    obj.textEditor16:setField("fldEnfase25");
    obj.textEditor16:setFontFamily("Constantia");
    obj.textEditor16:setFontSize(13);
    obj.textEditor16:setName("textEditor16");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.rectangle35);
    obj.dataLink51:setField("fldEnfase25");
    obj.dataLink51:setDefaultValue("Ênfases");
    obj.dataLink51:setName("dataLink51");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.flowPart64);
    obj.layout61:setAlign("client");
    obj.layout61:setMargins({right=10});
    obj.layout61:setName("layout61");

    obj.nomeCheck25_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck25_01:setParent(obj.layout61);
    obj.nomeCheck25_01:setField("fldCheck25_01");
    obj.nomeCheck25_01:setName("nomeCheck25_01");
    obj.nomeCheck25_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck25_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck25_01:setHeight(25);
    obj.nomeCheck25_01:setWidth(14);
    obj.nomeCheck25_01:setAlign("right");
    obj.nomeCheck25_01:setMargins({left=3});
    obj.nomeCheck25_01:setAutoChange(false);

    obj.nomeCheck25_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck25_02:setParent(obj.layout61);
    obj.nomeCheck25_02:setField("fldCheck25_02");
    obj.nomeCheck25_02:setName("nomeCheck25_02");
    obj.nomeCheck25_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck25_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck25_02:setHeight(25);
    obj.nomeCheck25_02:setWidth(14);
    obj.nomeCheck25_02:setAlign("right");
    obj.nomeCheck25_02:setMargins({left=3});
    obj.nomeCheck25_02:setAutoChange(false);

    obj.nomeCheck25_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck25_03:setParent(obj.layout61);
    obj.nomeCheck25_03:setField("fldCheck25_03");
    obj.nomeCheck25_03:setName("nomeCheck25_03");
    obj.nomeCheck25_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck25_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck25_03:setHeight(25);
    obj.nomeCheck25_03:setWidth(14);
    obj.nomeCheck25_03:setAlign("right");
    obj.nomeCheck25_03:setMargins({left=3});
    obj.nomeCheck25_03:setAutoChange(false);

    obj.nomeCheck25_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck25_04:setParent(obj.layout61);
    obj.nomeCheck25_04:setField("fldCheck25_04");
    obj.nomeCheck25_04:setName("nomeCheck25_04");
    obj.nomeCheck25_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck25_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck25_04:setHeight(25);
    obj.nomeCheck25_04:setWidth(14);
    obj.nomeCheck25_04:setAlign("right");
    obj.nomeCheck25_04:setMargins({left=3});
    obj.nomeCheck25_04:setAutoChange(false);

    obj.nomeCheck25_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck25_05:setParent(obj.layout61);
    obj.nomeCheck25_05:setField("fldCheck25_05");
    obj.nomeCheck25_05:setName("nomeCheck25_05");
    obj.nomeCheck25_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck25_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck25_05:setHeight(25);
    obj.nomeCheck25_05:setWidth(14);
    obj.nomeCheck25_05:setAlign("right");
    obj.nomeCheck25_05:setMargins({left=3});
    obj.nomeCheck25_05:setAutoChange(false);

    obj.flowPart65 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.flowLayout17);
    obj.flowPart65:setMargins({bottom=5});
    obj.flowPart65:setName("flowPart65");
    obj.flowPart65:setMinWidth(220);
    obj.flowPart65:setMaxWidth(220);
    obj.flowPart65:setHeight(25);

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart65);
    obj.label46:setAlign("left");
    obj.label46:setWidth(100);
    obj.label46:setText("Sagacidade");
    obj.label46:setName("label46");
    obj.label46:setFontSize(14);
    obj.label46:setFontColor("white");
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");
    obj.label46:setTextTrimming("character");
    obj.label46:setFontFamily("Constantia");

    obj.nomeBut26 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut26:setParent(obj.flowPart65);
    obj.nomeBut26:setName("nomeBut26");
    obj.nomeBut26:setText("𝐢");
    obj.nomeBut26:setWidth(22);
    obj.nomeBut26:setHeight(22);
    obj.nomeBut26:setTop(1);
    obj.nomeBut26:setLeft(103);
    obj.nomeBut26:setFontColor("#272727");

    obj.nomeBut26B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut26B:setParent(obj.flowPart65);
    obj.nomeBut26B:setName("nomeBut26B");
    obj.nomeBut26B:setText("𝐢");
    obj.nomeBut26B:setWidth(22);
    obj.nomeBut26B:setHeight(22);
    obj.nomeBut26B:setTop(1);
    obj.nomeBut26B:setLeft(103);
    obj.nomeBut26B:setFontColor("white");
    obj.nomeBut26B:setVisible(false);

    obj.popUp_26 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_26:setParent(obj.flowPart65);
    obj.popUp_26:setName("popUp_26");
    obj.popUp_26:setWidth(200);
    obj.popUp_26:setHeight(100);
    obj.popUp_26:setBackOpacity(0);
    obj.popUp_26:setDrawContainer(false);

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.popUp_26);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("#0e0e0e");
    obj.rectangle36:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle36:setXradius(5);
    obj.rectangle36:setYradius(5);
    obj.rectangle36:setCornerType("bevel");
    obj.rectangle36:setName("rectangle36");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.rectangle36);
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setColor("#0e0e0e");
    obj.rectangle37:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle37:setXradius(3);
    obj.rectangle37:setYradius(3);
    obj.rectangle37:setStrokeColor("#272727");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setCornerType("bevel");
    obj.rectangle37:setName("rectangle37");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.rectangle37);
    obj.textEditor17:setAlign("client");
    obj.textEditor17:setTransparent(true);
    obj.textEditor17:setField("fldEnfase26");
    obj.textEditor17:setFontFamily("Constantia");
    obj.textEditor17:setFontSize(13);
    obj.textEditor17:setName("textEditor17");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.rectangle37);
    obj.dataLink52:setField("fldEnfase26");
    obj.dataLink52:setDefaultValue("Ênfases");
    obj.dataLink52:setName("dataLink52");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.flowPart65);
    obj.layout62:setAlign("client");
    obj.layout62:setMargins({right=10});
    obj.layout62:setName("layout62");

    obj.nomeCheck26_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck26_01:setParent(obj.layout62);
    obj.nomeCheck26_01:setField("fldCheck26_01");
    obj.nomeCheck26_01:setName("nomeCheck26_01");
    obj.nomeCheck26_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck26_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck26_01:setHeight(25);
    obj.nomeCheck26_01:setWidth(14);
    obj.nomeCheck26_01:setAlign("right");
    obj.nomeCheck26_01:setMargins({left=3});
    obj.nomeCheck26_01:setAutoChange(false);

    obj.nomeCheck26_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck26_02:setParent(obj.layout62);
    obj.nomeCheck26_02:setField("fldCheck26_02");
    obj.nomeCheck26_02:setName("nomeCheck26_02");
    obj.nomeCheck26_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck26_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck26_02:setHeight(25);
    obj.nomeCheck26_02:setWidth(14);
    obj.nomeCheck26_02:setAlign("right");
    obj.nomeCheck26_02:setMargins({left=3});
    obj.nomeCheck26_02:setAutoChange(false);

    obj.nomeCheck26_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck26_03:setParent(obj.layout62);
    obj.nomeCheck26_03:setField("fldCheck26_03");
    obj.nomeCheck26_03:setName("nomeCheck26_03");
    obj.nomeCheck26_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck26_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck26_03:setHeight(25);
    obj.nomeCheck26_03:setWidth(14);
    obj.nomeCheck26_03:setAlign("right");
    obj.nomeCheck26_03:setMargins({left=3});
    obj.nomeCheck26_03:setAutoChange(false);

    obj.nomeCheck26_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck26_04:setParent(obj.layout62);
    obj.nomeCheck26_04:setField("fldCheck26_04");
    obj.nomeCheck26_04:setName("nomeCheck26_04");
    obj.nomeCheck26_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck26_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck26_04:setHeight(25);
    obj.nomeCheck26_04:setWidth(14);
    obj.nomeCheck26_04:setAlign("right");
    obj.nomeCheck26_04:setMargins({left=3});
    obj.nomeCheck26_04:setAutoChange(false);

    obj.nomeCheck26_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck26_05:setParent(obj.layout62);
    obj.nomeCheck26_05:setField("fldCheck26_05");
    obj.nomeCheck26_05:setName("nomeCheck26_05");
    obj.nomeCheck26_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck26_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck26_05:setHeight(25);
    obj.nomeCheck26_05:setWidth(14);
    obj.nomeCheck26_05:setAlign("right");
    obj.nomeCheck26_05:setMargins({left=3});
    obj.nomeCheck26_05:setAutoChange(false);

    obj.flowPart66 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.flowLayout17);
    obj.flowPart66:setMargins({bottom=5});
    obj.flowPart66:setName("flowPart66");
    obj.flowPart66:setMinWidth(220);
    obj.flowPart66:setMaxWidth(220);
    obj.flowPart66:setHeight(25);

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart66);
    obj.label47:setAlign("left");
    obj.label47:setWidth(100);
    obj.label47:setText("Subterfúgio");
    obj.label47:setName("label47");
    obj.label47:setFontSize(14);
    obj.label47:setFontColor("white");
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setTextTrimming("character");
    obj.label47:setFontFamily("Constantia");

    obj.nomeBut27 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut27:setParent(obj.flowPart66);
    obj.nomeBut27:setName("nomeBut27");
    obj.nomeBut27:setText("𝐢");
    obj.nomeBut27:setWidth(22);
    obj.nomeBut27:setHeight(22);
    obj.nomeBut27:setTop(1);
    obj.nomeBut27:setLeft(103);
    obj.nomeBut27:setFontColor("#272727");

    obj.nomeBut27B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut27B:setParent(obj.flowPart66);
    obj.nomeBut27B:setName("nomeBut27B");
    obj.nomeBut27B:setText("𝐢");
    obj.nomeBut27B:setWidth(22);
    obj.nomeBut27B:setHeight(22);
    obj.nomeBut27B:setTop(1);
    obj.nomeBut27B:setLeft(103);
    obj.nomeBut27B:setFontColor("white");
    obj.nomeBut27B:setVisible(false);

    obj.popUp_27 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_27:setParent(obj.flowPart66);
    obj.popUp_27:setName("popUp_27");
    obj.popUp_27:setWidth(200);
    obj.popUp_27:setHeight(100);
    obj.popUp_27:setBackOpacity(0);
    obj.popUp_27:setDrawContainer(false);

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.popUp_27);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setColor("#0e0e0e");
    obj.rectangle38:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle38:setXradius(5);
    obj.rectangle38:setYradius(5);
    obj.rectangle38:setCornerType("bevel");
    obj.rectangle38:setName("rectangle38");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.rectangle38);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setColor("#0e0e0e");
    obj.rectangle39:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle39:setXradius(3);
    obj.rectangle39:setYradius(3);
    obj.rectangle39:setStrokeColor("#272727");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setCornerType("bevel");
    obj.rectangle39:setName("rectangle39");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.rectangle39);
    obj.textEditor18:setAlign("client");
    obj.textEditor18:setTransparent(true);
    obj.textEditor18:setField("fldEnfase27");
    obj.textEditor18:setFontFamily("Constantia");
    obj.textEditor18:setFontSize(13);
    obj.textEditor18:setName("textEditor18");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.rectangle39);
    obj.dataLink53:setField("fldEnfase27");
    obj.dataLink53:setDefaultValue("Ênfases");
    obj.dataLink53:setName("dataLink53");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.flowPart66);
    obj.layout63:setAlign("client");
    obj.layout63:setMargins({right=10});
    obj.layout63:setName("layout63");

    obj.nomeCheck27_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck27_01:setParent(obj.layout63);
    obj.nomeCheck27_01:setField("fldCheck27_01");
    obj.nomeCheck27_01:setName("nomeCheck27_01");
    obj.nomeCheck27_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck27_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck27_01:setHeight(25);
    obj.nomeCheck27_01:setWidth(14);
    obj.nomeCheck27_01:setAlign("right");
    obj.nomeCheck27_01:setMargins({left=3});
    obj.nomeCheck27_01:setAutoChange(false);

    obj.nomeCheck27_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck27_02:setParent(obj.layout63);
    obj.nomeCheck27_02:setField("fldCheck27_02");
    obj.nomeCheck27_02:setName("nomeCheck27_02");
    obj.nomeCheck27_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck27_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck27_02:setHeight(25);
    obj.nomeCheck27_02:setWidth(14);
    obj.nomeCheck27_02:setAlign("right");
    obj.nomeCheck27_02:setMargins({left=3});
    obj.nomeCheck27_02:setAutoChange(false);

    obj.nomeCheck27_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck27_03:setParent(obj.layout63);
    obj.nomeCheck27_03:setField("fldCheck27_03");
    obj.nomeCheck27_03:setName("nomeCheck27_03");
    obj.nomeCheck27_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck27_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck27_03:setHeight(25);
    obj.nomeCheck27_03:setWidth(14);
    obj.nomeCheck27_03:setAlign("right");
    obj.nomeCheck27_03:setMargins({left=3});
    obj.nomeCheck27_03:setAutoChange(false);

    obj.nomeCheck27_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck27_04:setParent(obj.layout63);
    obj.nomeCheck27_04:setField("fldCheck27_04");
    obj.nomeCheck27_04:setName("nomeCheck27_04");
    obj.nomeCheck27_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck27_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck27_04:setHeight(25);
    obj.nomeCheck27_04:setWidth(14);
    obj.nomeCheck27_04:setAlign("right");
    obj.nomeCheck27_04:setMargins({left=3});
    obj.nomeCheck27_04:setAutoChange(false);

    obj.nomeCheck27_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck27_05:setParent(obj.layout63);
    obj.nomeCheck27_05:setField("fldCheck27_05");
    obj.nomeCheck27_05:setName("nomeCheck27_05");
    obj.nomeCheck27_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck27_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck27_05:setHeight(25);
    obj.nomeCheck27_05:setWidth(14);
    obj.nomeCheck27_05:setAlign("right");
    obj.nomeCheck27_05:setMargins({left=3});
    obj.nomeCheck27_05:setAutoChange(false);

    obj.flowPart67 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout15);
    obj.flowPart67:setHeight(270);
    obj.flowPart67:setWidth(220);
    obj.flowPart67:setMargins({bottom=20, left=20, right=20});
    obj.flowPart67:setName("flowPart67");
    obj.flowPart67:setMinWidth(220);
    obj.flowPart67:setMaxWidth(220);

    obj.flowLayout18 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.flowPart67);
    obj.flowLayout18:setOrientation("vertical");
    obj.flowLayout18:setWidth(220);
    obj.flowLayout18:setAutoHeight(true);
    obj.flowLayout18:setMaxColumns(1);
    obj.flowLayout18:setName("flowLayout18");

    obj.flowPart68 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout18);
    obj.flowPart68:setMargins({bottom=5});
    obj.flowPart68:setName("flowPart68");
    obj.flowPart68:setMinWidth(220);
    obj.flowPart68:setMaxWidth(220);
    obj.flowPart68:setHeight(25);

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart68);
    obj.label48:setAlign("left");
    obj.label48:setWidth(100);
    obj.label48:setText("Ciência");
    obj.label48:setName("label48");
    obj.label48:setFontSize(14);
    obj.label48:setFontColor("white");
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");
    obj.label48:setTextTrimming("character");
    obj.label48:setFontFamily("Constantia");

    obj.nomeBut28 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut28:setParent(obj.flowPart68);
    obj.nomeBut28:setName("nomeBut28");
    obj.nomeBut28:setText("𝐢");
    obj.nomeBut28:setWidth(22);
    obj.nomeBut28:setHeight(22);
    obj.nomeBut28:setTop(1);
    obj.nomeBut28:setLeft(103);
    obj.nomeBut28:setFontColor("#272727");

    obj.nomeBut28B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut28B:setParent(obj.flowPart68);
    obj.nomeBut28B:setName("nomeBut28B");
    obj.nomeBut28B:setText("𝐢");
    obj.nomeBut28B:setWidth(22);
    obj.nomeBut28B:setHeight(22);
    obj.nomeBut28B:setTop(1);
    obj.nomeBut28B:setLeft(103);
    obj.nomeBut28B:setFontColor("white");
    obj.nomeBut28B:setVisible(false);

    obj.popUp_28 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_28:setParent(obj.flowPart68);
    obj.popUp_28:setName("popUp_28");
    obj.popUp_28:setWidth(200);
    obj.popUp_28:setHeight(100);
    obj.popUp_28:setBackOpacity(0);
    obj.popUp_28:setDrawContainer(false);

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.popUp_28);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("#0e0e0e");
    obj.rectangle40:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle40:setXradius(5);
    obj.rectangle40:setYradius(5);
    obj.rectangle40:setCornerType("bevel");
    obj.rectangle40:setName("rectangle40");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.rectangle40);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("#0e0e0e");
    obj.rectangle41:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle41:setXradius(3);
    obj.rectangle41:setYradius(3);
    obj.rectangle41:setStrokeColor("#272727");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setCornerType("bevel");
    obj.rectangle41:setName("rectangle41");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.rectangle41);
    obj.textEditor19:setAlign("client");
    obj.textEditor19:setTransparent(true);
    obj.textEditor19:setField("fldEnfase28");
    obj.textEditor19:setFontFamily("Constantia");
    obj.textEditor19:setFontSize(13);
    obj.textEditor19:setName("textEditor19");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.rectangle41);
    obj.dataLink54:setField("fldEnfase28");
    obj.dataLink54:setDefaultValue("Ênfases");
    obj.dataLink54:setName("dataLink54");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.flowPart68);
    obj.layout64:setAlign("client");
    obj.layout64:setMargins({right=10});
    obj.layout64:setName("layout64");

    obj.nomeCheck28_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck28_01:setParent(obj.layout64);
    obj.nomeCheck28_01:setField("fldCheck28_01");
    obj.nomeCheck28_01:setName("nomeCheck28_01");
    obj.nomeCheck28_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck28_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck28_01:setHeight(25);
    obj.nomeCheck28_01:setWidth(14);
    obj.nomeCheck28_01:setAlign("right");
    obj.nomeCheck28_01:setMargins({left=3});
    obj.nomeCheck28_01:setAutoChange(false);

    obj.nomeCheck28_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck28_02:setParent(obj.layout64);
    obj.nomeCheck28_02:setField("fldCheck28_02");
    obj.nomeCheck28_02:setName("nomeCheck28_02");
    obj.nomeCheck28_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck28_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck28_02:setHeight(25);
    obj.nomeCheck28_02:setWidth(14);
    obj.nomeCheck28_02:setAlign("right");
    obj.nomeCheck28_02:setMargins({left=3});
    obj.nomeCheck28_02:setAutoChange(false);

    obj.nomeCheck28_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck28_03:setParent(obj.layout64);
    obj.nomeCheck28_03:setField("fldCheck28_03");
    obj.nomeCheck28_03:setName("nomeCheck28_03");
    obj.nomeCheck28_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck28_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck28_03:setHeight(25);
    obj.nomeCheck28_03:setWidth(14);
    obj.nomeCheck28_03:setAlign("right");
    obj.nomeCheck28_03:setMargins({left=3});
    obj.nomeCheck28_03:setAutoChange(false);

    obj.nomeCheck28_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck28_04:setParent(obj.layout64);
    obj.nomeCheck28_04:setField("fldCheck28_04");
    obj.nomeCheck28_04:setName("nomeCheck28_04");
    obj.nomeCheck28_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck28_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck28_04:setHeight(25);
    obj.nomeCheck28_04:setWidth(14);
    obj.nomeCheck28_04:setAlign("right");
    obj.nomeCheck28_04:setMargins({left=3});
    obj.nomeCheck28_04:setAutoChange(false);

    obj.nomeCheck28_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck28_05:setParent(obj.layout64);
    obj.nomeCheck28_05:setField("fldCheck28_05");
    obj.nomeCheck28_05:setName("nomeCheck28_05");
    obj.nomeCheck28_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck28_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck28_05:setHeight(25);
    obj.nomeCheck28_05:setWidth(14);
    obj.nomeCheck28_05:setAlign("right");
    obj.nomeCheck28_05:setMargins({left=3});
    obj.nomeCheck28_05:setAutoChange(false);

    obj.flowPart69 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout18);
    obj.flowPart69:setMargins({bottom=5});
    obj.flowPart69:setName("flowPart69");
    obj.flowPart69:setMinWidth(220);
    obj.flowPart69:setMaxWidth(220);
    obj.flowPart69:setHeight(25);

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart69);
    obj.label49:setAlign("left");
    obj.label49:setWidth(100);
    obj.label49:setText("Erudição");
    obj.label49:setName("label49");
    obj.label49:setFontSize(14);
    obj.label49:setFontColor("white");
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");
    obj.label49:setTextTrimming("character");
    obj.label49:setFontFamily("Constantia");

    obj.nomeBut29 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut29:setParent(obj.flowPart69);
    obj.nomeBut29:setName("nomeBut29");
    obj.nomeBut29:setText("𝐢");
    obj.nomeBut29:setWidth(22);
    obj.nomeBut29:setHeight(22);
    obj.nomeBut29:setTop(1);
    obj.nomeBut29:setLeft(103);
    obj.nomeBut29:setFontColor("#272727");

    obj.nomeBut29B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut29B:setParent(obj.flowPart69);
    obj.nomeBut29B:setName("nomeBut29B");
    obj.nomeBut29B:setText("𝐢");
    obj.nomeBut29B:setWidth(22);
    obj.nomeBut29B:setHeight(22);
    obj.nomeBut29B:setTop(1);
    obj.nomeBut29B:setLeft(103);
    obj.nomeBut29B:setFontColor("white");
    obj.nomeBut29B:setVisible(false);

    obj.popUp_29 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_29:setParent(obj.flowPart69);
    obj.popUp_29:setName("popUp_29");
    obj.popUp_29:setWidth(200);
    obj.popUp_29:setHeight(100);
    obj.popUp_29:setBackOpacity(0);
    obj.popUp_29:setDrawContainer(false);

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.popUp_29);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("#0e0e0e");
    obj.rectangle42:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle42:setXradius(5);
    obj.rectangle42:setYradius(5);
    obj.rectangle42:setCornerType("bevel");
    obj.rectangle42:setName("rectangle42");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.rectangle42);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setColor("#0e0e0e");
    obj.rectangle43:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle43:setXradius(3);
    obj.rectangle43:setYradius(3);
    obj.rectangle43:setStrokeColor("#272727");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setCornerType("bevel");
    obj.rectangle43:setName("rectangle43");

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.rectangle43);
    obj.textEditor20:setAlign("client");
    obj.textEditor20:setTransparent(true);
    obj.textEditor20:setField("fldEnfase29");
    obj.textEditor20:setFontFamily("Constantia");
    obj.textEditor20:setFontSize(13);
    obj.textEditor20:setName("textEditor20");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.rectangle43);
    obj.dataLink55:setField("fldEnfase29");
    obj.dataLink55:setDefaultValue("Ênfases");
    obj.dataLink55:setName("dataLink55");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.flowPart69);
    obj.layout65:setAlign("client");
    obj.layout65:setMargins({right=10});
    obj.layout65:setName("layout65");

    obj.nomeCheck29_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck29_01:setParent(obj.layout65);
    obj.nomeCheck29_01:setField("fldCheck29_01");
    obj.nomeCheck29_01:setName("nomeCheck29_01");
    obj.nomeCheck29_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck29_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck29_01:setHeight(25);
    obj.nomeCheck29_01:setWidth(14);
    obj.nomeCheck29_01:setAlign("right");
    obj.nomeCheck29_01:setMargins({left=3});
    obj.nomeCheck29_01:setAutoChange(false);

    obj.nomeCheck29_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck29_02:setParent(obj.layout65);
    obj.nomeCheck29_02:setField("fldCheck29_02");
    obj.nomeCheck29_02:setName("nomeCheck29_02");
    obj.nomeCheck29_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck29_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck29_02:setHeight(25);
    obj.nomeCheck29_02:setWidth(14);
    obj.nomeCheck29_02:setAlign("right");
    obj.nomeCheck29_02:setMargins({left=3});
    obj.nomeCheck29_02:setAutoChange(false);

    obj.nomeCheck29_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck29_03:setParent(obj.layout65);
    obj.nomeCheck29_03:setField("fldCheck29_03");
    obj.nomeCheck29_03:setName("nomeCheck29_03");
    obj.nomeCheck29_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck29_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck29_03:setHeight(25);
    obj.nomeCheck29_03:setWidth(14);
    obj.nomeCheck29_03:setAlign("right");
    obj.nomeCheck29_03:setMargins({left=3});
    obj.nomeCheck29_03:setAutoChange(false);

    obj.nomeCheck29_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck29_04:setParent(obj.layout65);
    obj.nomeCheck29_04:setField("fldCheck29_04");
    obj.nomeCheck29_04:setName("nomeCheck29_04");
    obj.nomeCheck29_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck29_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck29_04:setHeight(25);
    obj.nomeCheck29_04:setWidth(14);
    obj.nomeCheck29_04:setAlign("right");
    obj.nomeCheck29_04:setMargins({left=3});
    obj.nomeCheck29_04:setAutoChange(false);

    obj.nomeCheck29_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck29_05:setParent(obj.layout65);
    obj.nomeCheck29_05:setField("fldCheck29_05");
    obj.nomeCheck29_05:setName("nomeCheck29_05");
    obj.nomeCheck29_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck29_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck29_05:setHeight(25);
    obj.nomeCheck29_05:setWidth(14);
    obj.nomeCheck29_05:setAlign("right");
    obj.nomeCheck29_05:setMargins({left=3});
    obj.nomeCheck29_05:setAutoChange(false);

    obj.flowPart70 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout18);
    obj.flowPart70:setMargins({bottom=5});
    obj.flowPart70:setName("flowPart70");
    obj.flowPart70:setMinWidth(220);
    obj.flowPart70:setMaxWidth(220);
    obj.flowPart70:setHeight(25);

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart70);
    obj.label50:setAlign("left");
    obj.label50:setWidth(100);
    obj.label50:setText("Finanças");
    obj.label50:setName("label50");
    obj.label50:setFontSize(14);
    obj.label50:setFontColor("white");
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setTextTrimming("character");
    obj.label50:setFontFamily("Constantia");

    obj.nomeBut30 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut30:setParent(obj.flowPart70);
    obj.nomeBut30:setName("nomeBut30");
    obj.nomeBut30:setText("𝐢");
    obj.nomeBut30:setWidth(22);
    obj.nomeBut30:setHeight(22);
    obj.nomeBut30:setTop(1);
    obj.nomeBut30:setLeft(103);
    obj.nomeBut30:setFontColor("#272727");

    obj.nomeBut30B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut30B:setParent(obj.flowPart70);
    obj.nomeBut30B:setName("nomeBut30B");
    obj.nomeBut30B:setText("𝐢");
    obj.nomeBut30B:setWidth(22);
    obj.nomeBut30B:setHeight(22);
    obj.nomeBut30B:setTop(1);
    obj.nomeBut30B:setLeft(103);
    obj.nomeBut30B:setFontColor("white");
    obj.nomeBut30B:setVisible(false);

    obj.popUp_30 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_30:setParent(obj.flowPart70);
    obj.popUp_30:setName("popUp_30");
    obj.popUp_30:setWidth(200);
    obj.popUp_30:setHeight(100);
    obj.popUp_30:setBackOpacity(0);
    obj.popUp_30:setDrawContainer(false);

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.popUp_30);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("#0e0e0e");
    obj.rectangle44:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle44:setXradius(5);
    obj.rectangle44:setYradius(5);
    obj.rectangle44:setCornerType("bevel");
    obj.rectangle44:setName("rectangle44");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.rectangle44);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("#0e0e0e");
    obj.rectangle45:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle45:setXradius(3);
    obj.rectangle45:setYradius(3);
    obj.rectangle45:setStrokeColor("#272727");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setCornerType("bevel");
    obj.rectangle45:setName("rectangle45");

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.rectangle45);
    obj.textEditor21:setAlign("client");
    obj.textEditor21:setTransparent(true);
    obj.textEditor21:setField("fldEnfase30");
    obj.textEditor21:setFontFamily("Constantia");
    obj.textEditor21:setFontSize(13);
    obj.textEditor21:setName("textEditor21");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.rectangle45);
    obj.dataLink56:setField("fldEnfase30");
    obj.dataLink56:setDefaultValue("Ênfases");
    obj.dataLink56:setName("dataLink56");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.flowPart70);
    obj.layout66:setAlign("client");
    obj.layout66:setMargins({right=10});
    obj.layout66:setName("layout66");

    obj.nomeCheck30_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck30_01:setParent(obj.layout66);
    obj.nomeCheck30_01:setField("fldCheck30_01");
    obj.nomeCheck30_01:setName("nomeCheck30_01");
    obj.nomeCheck30_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck30_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck30_01:setHeight(25);
    obj.nomeCheck30_01:setWidth(14);
    obj.nomeCheck30_01:setAlign("right");
    obj.nomeCheck30_01:setMargins({left=3});
    obj.nomeCheck30_01:setAutoChange(false);

    obj.nomeCheck30_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck30_02:setParent(obj.layout66);
    obj.nomeCheck30_02:setField("fldCheck30_02");
    obj.nomeCheck30_02:setName("nomeCheck30_02");
    obj.nomeCheck30_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck30_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck30_02:setHeight(25);
    obj.nomeCheck30_02:setWidth(14);
    obj.nomeCheck30_02:setAlign("right");
    obj.nomeCheck30_02:setMargins({left=3});
    obj.nomeCheck30_02:setAutoChange(false);

    obj.nomeCheck30_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck30_03:setParent(obj.layout66);
    obj.nomeCheck30_03:setField("fldCheck30_03");
    obj.nomeCheck30_03:setName("nomeCheck30_03");
    obj.nomeCheck30_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck30_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck30_03:setHeight(25);
    obj.nomeCheck30_03:setWidth(14);
    obj.nomeCheck30_03:setAlign("right");
    obj.nomeCheck30_03:setMargins({left=3});
    obj.nomeCheck30_03:setAutoChange(false);

    obj.nomeCheck30_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck30_04:setParent(obj.layout66);
    obj.nomeCheck30_04:setField("fldCheck30_04");
    obj.nomeCheck30_04:setName("nomeCheck30_04");
    obj.nomeCheck30_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck30_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck30_04:setHeight(25);
    obj.nomeCheck30_04:setWidth(14);
    obj.nomeCheck30_04:setAlign("right");
    obj.nomeCheck30_04:setMargins({left=3});
    obj.nomeCheck30_04:setAutoChange(false);

    obj.nomeCheck30_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck30_05:setParent(obj.layout66);
    obj.nomeCheck30_05:setField("fldCheck30_05");
    obj.nomeCheck30_05:setName("nomeCheck30_05");
    obj.nomeCheck30_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck30_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck30_05:setHeight(25);
    obj.nomeCheck30_05:setWidth(14);
    obj.nomeCheck30_05:setAlign("right");
    obj.nomeCheck30_05:setMargins({left=3});
    obj.nomeCheck30_05:setAutoChange(false);

    obj.flowPart71 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout18);
    obj.flowPart71:setMargins({bottom=5});
    obj.flowPart71:setName("flowPart71");
    obj.flowPart71:setMinWidth(220);
    obj.flowPart71:setMaxWidth(220);
    obj.flowPart71:setHeight(25);

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart71);
    obj.label51:setAlign("left");
    obj.label51:setWidth(100);
    obj.label51:setText("Investigação");
    obj.label51:setName("label51");
    obj.label51:setFontSize(14);
    obj.label51:setFontColor("white");
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setTextTrimming("character");
    obj.label51:setFontFamily("Constantia");

    obj.nomeBut31 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut31:setParent(obj.flowPart71);
    obj.nomeBut31:setName("nomeBut31");
    obj.nomeBut31:setText("𝐢");
    obj.nomeBut31:setWidth(22);
    obj.nomeBut31:setHeight(22);
    obj.nomeBut31:setTop(1);
    obj.nomeBut31:setLeft(103);
    obj.nomeBut31:setFontColor("#272727");

    obj.nomeBut31B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut31B:setParent(obj.flowPart71);
    obj.nomeBut31B:setName("nomeBut31B");
    obj.nomeBut31B:setText("𝐢");
    obj.nomeBut31B:setWidth(22);
    obj.nomeBut31B:setHeight(22);
    obj.nomeBut31B:setTop(1);
    obj.nomeBut31B:setLeft(103);
    obj.nomeBut31B:setFontColor("white");
    obj.nomeBut31B:setVisible(false);

    obj.popUp_31 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_31:setParent(obj.flowPart71);
    obj.popUp_31:setName("popUp_31");
    obj.popUp_31:setWidth(200);
    obj.popUp_31:setHeight(100);
    obj.popUp_31:setBackOpacity(0);
    obj.popUp_31:setDrawContainer(false);

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.popUp_31);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("#0e0e0e");
    obj.rectangle46:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle46:setXradius(5);
    obj.rectangle46:setYradius(5);
    obj.rectangle46:setCornerType("bevel");
    obj.rectangle46:setName("rectangle46");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.rectangle46);
    obj.rectangle47:setAlign("client");
    obj.rectangle47:setColor("#0e0e0e");
    obj.rectangle47:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle47:setXradius(3);
    obj.rectangle47:setYradius(3);
    obj.rectangle47:setStrokeColor("#272727");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setCornerType("bevel");
    obj.rectangle47:setName("rectangle47");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.rectangle47);
    obj.textEditor22:setAlign("client");
    obj.textEditor22:setTransparent(true);
    obj.textEditor22:setField("fldEnfase31");
    obj.textEditor22:setFontFamily("Constantia");
    obj.textEditor22:setFontSize(13);
    obj.textEditor22:setName("textEditor22");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.rectangle47);
    obj.dataLink57:setField("fldEnfase31");
    obj.dataLink57:setDefaultValue("Ênfases");
    obj.dataLink57:setName("dataLink57");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.flowPart71);
    obj.layout67:setAlign("client");
    obj.layout67:setMargins({right=10});
    obj.layout67:setName("layout67");

    obj.nomeCheck31_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck31_01:setParent(obj.layout67);
    obj.nomeCheck31_01:setField("fldCheck31_01");
    obj.nomeCheck31_01:setName("nomeCheck31_01");
    obj.nomeCheck31_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck31_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck31_01:setHeight(25);
    obj.nomeCheck31_01:setWidth(14);
    obj.nomeCheck31_01:setAlign("right");
    obj.nomeCheck31_01:setMargins({left=3});
    obj.nomeCheck31_01:setAutoChange(false);

    obj.nomeCheck31_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck31_02:setParent(obj.layout67);
    obj.nomeCheck31_02:setField("fldCheck31_02");
    obj.nomeCheck31_02:setName("nomeCheck31_02");
    obj.nomeCheck31_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck31_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck31_02:setHeight(25);
    obj.nomeCheck31_02:setWidth(14);
    obj.nomeCheck31_02:setAlign("right");
    obj.nomeCheck31_02:setMargins({left=3});
    obj.nomeCheck31_02:setAutoChange(false);

    obj.nomeCheck31_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck31_03:setParent(obj.layout67);
    obj.nomeCheck31_03:setField("fldCheck31_03");
    obj.nomeCheck31_03:setName("nomeCheck31_03");
    obj.nomeCheck31_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck31_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck31_03:setHeight(25);
    obj.nomeCheck31_03:setWidth(14);
    obj.nomeCheck31_03:setAlign("right");
    obj.nomeCheck31_03:setMargins({left=3});
    obj.nomeCheck31_03:setAutoChange(false);

    obj.nomeCheck31_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck31_04:setParent(obj.layout67);
    obj.nomeCheck31_04:setField("fldCheck31_04");
    obj.nomeCheck31_04:setName("nomeCheck31_04");
    obj.nomeCheck31_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck31_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck31_04:setHeight(25);
    obj.nomeCheck31_04:setWidth(14);
    obj.nomeCheck31_04:setAlign("right");
    obj.nomeCheck31_04:setMargins({left=3});
    obj.nomeCheck31_04:setAutoChange(false);

    obj.nomeCheck31_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck31_05:setParent(obj.layout67);
    obj.nomeCheck31_05:setField("fldCheck31_05");
    obj.nomeCheck31_05:setName("nomeCheck31_05");
    obj.nomeCheck31_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck31_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck31_05:setHeight(25);
    obj.nomeCheck31_05:setWidth(14);
    obj.nomeCheck31_05:setAlign("right");
    obj.nomeCheck31_05:setMargins({left=3});
    obj.nomeCheck31_05:setAutoChange(false);

    obj.flowPart72 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout18);
    obj.flowPart72:setMargins({bottom=5});
    obj.flowPart72:setName("flowPart72");
    obj.flowPart72:setMinWidth(220);
    obj.flowPart72:setMaxWidth(220);
    obj.flowPart72:setHeight(25);

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart72);
    obj.label52:setAlign("left");
    obj.label52:setWidth(100);
    obj.label52:setText("Medicina");
    obj.label52:setName("label52");
    obj.label52:setFontSize(14);
    obj.label52:setFontColor("white");
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setTextTrimming("character");
    obj.label52:setFontFamily("Constantia");

    obj.nomeBut32 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut32:setParent(obj.flowPart72);
    obj.nomeBut32:setName("nomeBut32");
    obj.nomeBut32:setText("𝐢");
    obj.nomeBut32:setWidth(22);
    obj.nomeBut32:setHeight(22);
    obj.nomeBut32:setTop(1);
    obj.nomeBut32:setLeft(103);
    obj.nomeBut32:setFontColor("#272727");

    obj.nomeBut32B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut32B:setParent(obj.flowPart72);
    obj.nomeBut32B:setName("nomeBut32B");
    obj.nomeBut32B:setText("𝐢");
    obj.nomeBut32B:setWidth(22);
    obj.nomeBut32B:setHeight(22);
    obj.nomeBut32B:setTop(1);
    obj.nomeBut32B:setLeft(103);
    obj.nomeBut32B:setFontColor("white");
    obj.nomeBut32B:setVisible(false);

    obj.popUp_32 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_32:setParent(obj.flowPart72);
    obj.popUp_32:setName("popUp_32");
    obj.popUp_32:setWidth(200);
    obj.popUp_32:setHeight(100);
    obj.popUp_32:setBackOpacity(0);
    obj.popUp_32:setDrawContainer(false);

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.popUp_32);
    obj.rectangle48:setAlign("client");
    obj.rectangle48:setColor("#0e0e0e");
    obj.rectangle48:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle48:setXradius(5);
    obj.rectangle48:setYradius(5);
    obj.rectangle48:setCornerType("bevel");
    obj.rectangle48:setName("rectangle48");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.rectangle48);
    obj.rectangle49:setAlign("client");
    obj.rectangle49:setColor("#0e0e0e");
    obj.rectangle49:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle49:setXradius(3);
    obj.rectangle49:setYradius(3);
    obj.rectangle49:setStrokeColor("#272727");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setCornerType("bevel");
    obj.rectangle49:setName("rectangle49");

    obj.textEditor23 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor23:setParent(obj.rectangle49);
    obj.textEditor23:setAlign("client");
    obj.textEditor23:setTransparent(true);
    obj.textEditor23:setField("fldEnfase32");
    obj.textEditor23:setFontFamily("Constantia");
    obj.textEditor23:setFontSize(13);
    obj.textEditor23:setName("textEditor23");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.rectangle49);
    obj.dataLink58:setField("fldEnfase32");
    obj.dataLink58:setDefaultValue("Ênfases");
    obj.dataLink58:setName("dataLink58");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.flowPart72);
    obj.layout68:setAlign("client");
    obj.layout68:setMargins({right=10});
    obj.layout68:setName("layout68");

    obj.nomeCheck32_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck32_01:setParent(obj.layout68);
    obj.nomeCheck32_01:setField("fldCheck32_01");
    obj.nomeCheck32_01:setName("nomeCheck32_01");
    obj.nomeCheck32_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck32_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck32_01:setHeight(25);
    obj.nomeCheck32_01:setWidth(14);
    obj.nomeCheck32_01:setAlign("right");
    obj.nomeCheck32_01:setMargins({left=3});
    obj.nomeCheck32_01:setAutoChange(false);

    obj.nomeCheck32_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck32_02:setParent(obj.layout68);
    obj.nomeCheck32_02:setField("fldCheck32_02");
    obj.nomeCheck32_02:setName("nomeCheck32_02");
    obj.nomeCheck32_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck32_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck32_02:setHeight(25);
    obj.nomeCheck32_02:setWidth(14);
    obj.nomeCheck32_02:setAlign("right");
    obj.nomeCheck32_02:setMargins({left=3});
    obj.nomeCheck32_02:setAutoChange(false);

    obj.nomeCheck32_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck32_03:setParent(obj.layout68);
    obj.nomeCheck32_03:setField("fldCheck32_03");
    obj.nomeCheck32_03:setName("nomeCheck32_03");
    obj.nomeCheck32_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck32_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck32_03:setHeight(25);
    obj.nomeCheck32_03:setWidth(14);
    obj.nomeCheck32_03:setAlign("right");
    obj.nomeCheck32_03:setMargins({left=3});
    obj.nomeCheck32_03:setAutoChange(false);

    obj.nomeCheck32_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck32_04:setParent(obj.layout68);
    obj.nomeCheck32_04:setField("fldCheck32_04");
    obj.nomeCheck32_04:setName("nomeCheck32_04");
    obj.nomeCheck32_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck32_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck32_04:setHeight(25);
    obj.nomeCheck32_04:setWidth(14);
    obj.nomeCheck32_04:setAlign("right");
    obj.nomeCheck32_04:setMargins({left=3});
    obj.nomeCheck32_04:setAutoChange(false);

    obj.nomeCheck32_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck32_05:setParent(obj.layout68);
    obj.nomeCheck32_05:setField("fldCheck32_05");
    obj.nomeCheck32_05:setName("nomeCheck32_05");
    obj.nomeCheck32_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck32_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck32_05:setHeight(25);
    obj.nomeCheck32_05:setWidth(14);
    obj.nomeCheck32_05:setAlign("right");
    obj.nomeCheck32_05:setMargins({left=3});
    obj.nomeCheck32_05:setAutoChange(false);

    obj.flowPart73 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout18);
    obj.flowPart73:setMargins({bottom=5});
    obj.flowPart73:setName("flowPart73");
    obj.flowPart73:setMinWidth(220);
    obj.flowPart73:setMaxWidth(220);
    obj.flowPart73:setHeight(25);

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowPart73);
    obj.label53:setAlign("left");
    obj.label53:setWidth(100);
    obj.label53:setText("Ocultismo");
    obj.label53:setName("label53");
    obj.label53:setFontSize(14);
    obj.label53:setFontColor("white");
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setTextTrimming("character");
    obj.label53:setFontFamily("Constantia");

    obj.nomeBut33 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut33:setParent(obj.flowPart73);
    obj.nomeBut33:setName("nomeBut33");
    obj.nomeBut33:setText("𝐢");
    obj.nomeBut33:setWidth(22);
    obj.nomeBut33:setHeight(22);
    obj.nomeBut33:setTop(1);
    obj.nomeBut33:setLeft(103);
    obj.nomeBut33:setFontColor("#272727");

    obj.nomeBut33B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut33B:setParent(obj.flowPart73);
    obj.nomeBut33B:setName("nomeBut33B");
    obj.nomeBut33B:setText("𝐢");
    obj.nomeBut33B:setWidth(22);
    obj.nomeBut33B:setHeight(22);
    obj.nomeBut33B:setTop(1);
    obj.nomeBut33B:setLeft(103);
    obj.nomeBut33B:setFontColor("white");
    obj.nomeBut33B:setVisible(false);

    obj.popUp_33 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_33:setParent(obj.flowPart73);
    obj.popUp_33:setName("popUp_33");
    obj.popUp_33:setWidth(200);
    obj.popUp_33:setHeight(100);
    obj.popUp_33:setBackOpacity(0);
    obj.popUp_33:setDrawContainer(false);

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.popUp_33);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("#0e0e0e");
    obj.rectangle50:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle50:setXradius(5);
    obj.rectangle50:setYradius(5);
    obj.rectangle50:setCornerType("bevel");
    obj.rectangle50:setName("rectangle50");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.rectangle50);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("#0e0e0e");
    obj.rectangle51:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle51:setXradius(3);
    obj.rectangle51:setYradius(3);
    obj.rectangle51:setStrokeColor("#272727");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setCornerType("bevel");
    obj.rectangle51:setName("rectangle51");

    obj.textEditor24 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor24:setParent(obj.rectangle51);
    obj.textEditor24:setAlign("client");
    obj.textEditor24:setTransparent(true);
    obj.textEditor24:setField("fldEnfase33");
    obj.textEditor24:setFontFamily("Constantia");
    obj.textEditor24:setFontSize(13);
    obj.textEditor24:setName("textEditor24");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.rectangle51);
    obj.dataLink59:setField("fldEnfase33");
    obj.dataLink59:setDefaultValue("Ênfases");
    obj.dataLink59:setName("dataLink59");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.flowPart73);
    obj.layout69:setAlign("client");
    obj.layout69:setMargins({right=10});
    obj.layout69:setName("layout69");

    obj.nomeCheck33_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck33_01:setParent(obj.layout69);
    obj.nomeCheck33_01:setField("fldCheck33_01");
    obj.nomeCheck33_01:setName("nomeCheck33_01");
    obj.nomeCheck33_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck33_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck33_01:setHeight(25);
    obj.nomeCheck33_01:setWidth(14);
    obj.nomeCheck33_01:setAlign("right");
    obj.nomeCheck33_01:setMargins({left=3});
    obj.nomeCheck33_01:setAutoChange(false);

    obj.nomeCheck33_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck33_02:setParent(obj.layout69);
    obj.nomeCheck33_02:setField("fldCheck33_02");
    obj.nomeCheck33_02:setName("nomeCheck33_02");
    obj.nomeCheck33_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck33_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck33_02:setHeight(25);
    obj.nomeCheck33_02:setWidth(14);
    obj.nomeCheck33_02:setAlign("right");
    obj.nomeCheck33_02:setMargins({left=3});
    obj.nomeCheck33_02:setAutoChange(false);

    obj.nomeCheck33_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck33_03:setParent(obj.layout69);
    obj.nomeCheck33_03:setField("fldCheck33_03");
    obj.nomeCheck33_03:setName("nomeCheck33_03");
    obj.nomeCheck33_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck33_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck33_03:setHeight(25);
    obj.nomeCheck33_03:setWidth(14);
    obj.nomeCheck33_03:setAlign("right");
    obj.nomeCheck33_03:setMargins({left=3});
    obj.nomeCheck33_03:setAutoChange(false);

    obj.nomeCheck33_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck33_04:setParent(obj.layout69);
    obj.nomeCheck33_04:setField("fldCheck33_04");
    obj.nomeCheck33_04:setName("nomeCheck33_04");
    obj.nomeCheck33_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck33_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck33_04:setHeight(25);
    obj.nomeCheck33_04:setWidth(14);
    obj.nomeCheck33_04:setAlign("right");
    obj.nomeCheck33_04:setMargins({left=3});
    obj.nomeCheck33_04:setAutoChange(false);

    obj.nomeCheck33_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck33_05:setParent(obj.layout69);
    obj.nomeCheck33_05:setField("fldCheck33_05");
    obj.nomeCheck33_05:setName("nomeCheck33_05");
    obj.nomeCheck33_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck33_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck33_05:setHeight(25);
    obj.nomeCheck33_05:setWidth(14);
    obj.nomeCheck33_05:setAlign("right");
    obj.nomeCheck33_05:setMargins({left=3});
    obj.nomeCheck33_05:setAutoChange(false);

    obj.flowPart74 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout18);
    obj.flowPart74:setMargins({bottom=5});
    obj.flowPart74:setName("flowPart74");
    obj.flowPart74:setMinWidth(220);
    obj.flowPart74:setMaxWidth(220);
    obj.flowPart74:setHeight(25);

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowPart74);
    obj.label54:setAlign("left");
    obj.label54:setWidth(100);
    obj.label54:setText("Percepção");
    obj.label54:setName("label54");
    obj.label54:setFontSize(14);
    obj.label54:setFontColor("white");
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");
    obj.label54:setTextTrimming("character");
    obj.label54:setFontFamily("Constantia");

    obj.nomeBut34 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut34:setParent(obj.flowPart74);
    obj.nomeBut34:setName("nomeBut34");
    obj.nomeBut34:setText("𝐢");
    obj.nomeBut34:setWidth(22);
    obj.nomeBut34:setHeight(22);
    obj.nomeBut34:setTop(1);
    obj.nomeBut34:setLeft(103);
    obj.nomeBut34:setFontColor("#272727");

    obj.nomeBut34B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut34B:setParent(obj.flowPart74);
    obj.nomeBut34B:setName("nomeBut34B");
    obj.nomeBut34B:setText("𝐢");
    obj.nomeBut34B:setWidth(22);
    obj.nomeBut34B:setHeight(22);
    obj.nomeBut34B:setTop(1);
    obj.nomeBut34B:setLeft(103);
    obj.nomeBut34B:setFontColor("white");
    obj.nomeBut34B:setVisible(false);

    obj.popUp_34 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_34:setParent(obj.flowPart74);
    obj.popUp_34:setName("popUp_34");
    obj.popUp_34:setWidth(200);
    obj.popUp_34:setHeight(100);
    obj.popUp_34:setBackOpacity(0);
    obj.popUp_34:setDrawContainer(false);

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.popUp_34);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("#0e0e0e");
    obj.rectangle52:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle52:setXradius(5);
    obj.rectangle52:setYradius(5);
    obj.rectangle52:setCornerType("bevel");
    obj.rectangle52:setName("rectangle52");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.rectangle52);
    obj.rectangle53:setAlign("client");
    obj.rectangle53:setColor("#0e0e0e");
    obj.rectangle53:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle53:setXradius(3);
    obj.rectangle53:setYradius(3);
    obj.rectangle53:setStrokeColor("#272727");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setCornerType("bevel");
    obj.rectangle53:setName("rectangle53");

    obj.textEditor25 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor25:setParent(obj.rectangle53);
    obj.textEditor25:setAlign("client");
    obj.textEditor25:setTransparent(true);
    obj.textEditor25:setField("fldEnfase34");
    obj.textEditor25:setFontFamily("Constantia");
    obj.textEditor25:setFontSize(13);
    obj.textEditor25:setName("textEditor25");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.rectangle53);
    obj.dataLink60:setField("fldEnfase34");
    obj.dataLink60:setDefaultValue("Ênfases");
    obj.dataLink60:setName("dataLink60");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.flowPart74);
    obj.layout70:setAlign("client");
    obj.layout70:setMargins({right=10});
    obj.layout70:setName("layout70");

    obj.nomeCheck34_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck34_01:setParent(obj.layout70);
    obj.nomeCheck34_01:setField("fldCheck34_01");
    obj.nomeCheck34_01:setName("nomeCheck34_01");
    obj.nomeCheck34_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck34_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck34_01:setHeight(25);
    obj.nomeCheck34_01:setWidth(14);
    obj.nomeCheck34_01:setAlign("right");
    obj.nomeCheck34_01:setMargins({left=3});
    obj.nomeCheck34_01:setAutoChange(false);

    obj.nomeCheck34_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck34_02:setParent(obj.layout70);
    obj.nomeCheck34_02:setField("fldCheck34_02");
    obj.nomeCheck34_02:setName("nomeCheck34_02");
    obj.nomeCheck34_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck34_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck34_02:setHeight(25);
    obj.nomeCheck34_02:setWidth(14);
    obj.nomeCheck34_02:setAlign("right");
    obj.nomeCheck34_02:setMargins({left=3});
    obj.nomeCheck34_02:setAutoChange(false);

    obj.nomeCheck34_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck34_03:setParent(obj.layout70);
    obj.nomeCheck34_03:setField("fldCheck34_03");
    obj.nomeCheck34_03:setName("nomeCheck34_03");
    obj.nomeCheck34_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck34_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck34_03:setHeight(25);
    obj.nomeCheck34_03:setWidth(14);
    obj.nomeCheck34_03:setAlign("right");
    obj.nomeCheck34_03:setMargins({left=3});
    obj.nomeCheck34_03:setAutoChange(false);

    obj.nomeCheck34_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck34_04:setParent(obj.layout70);
    obj.nomeCheck34_04:setField("fldCheck34_04");
    obj.nomeCheck34_04:setName("nomeCheck34_04");
    obj.nomeCheck34_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck34_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck34_04:setHeight(25);
    obj.nomeCheck34_04:setWidth(14);
    obj.nomeCheck34_04:setAlign("right");
    obj.nomeCheck34_04:setMargins({left=3});
    obj.nomeCheck34_04:setAutoChange(false);

    obj.nomeCheck34_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck34_05:setParent(obj.layout70);
    obj.nomeCheck34_05:setField("fldCheck34_05");
    obj.nomeCheck34_05:setName("nomeCheck34_05");
    obj.nomeCheck34_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck34_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck34_05:setHeight(25);
    obj.nomeCheck34_05:setWidth(14);
    obj.nomeCheck34_05:setAlign("right");
    obj.nomeCheck34_05:setMargins({left=3});
    obj.nomeCheck34_05:setAutoChange(false);

    obj.flowPart75 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout18);
    obj.flowPart75:setMargins({bottom=5});
    obj.flowPart75:setName("flowPart75");
    obj.flowPart75:setMinWidth(220);
    obj.flowPart75:setMaxWidth(220);
    obj.flowPart75:setHeight(25);

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart75);
    obj.label55:setAlign("left");
    obj.label55:setWidth(100);
    obj.label55:setText("Política");
    obj.label55:setName("label55");
    obj.label55:setFontSize(14);
    obj.label55:setFontColor("white");
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setTextTrimming("character");
    obj.label55:setFontFamily("Constantia");

    obj.nomeBut35 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut35:setParent(obj.flowPart75);
    obj.nomeBut35:setName("nomeBut35");
    obj.nomeBut35:setText("𝐢");
    obj.nomeBut35:setWidth(22);
    obj.nomeBut35:setHeight(22);
    obj.nomeBut35:setTop(1);
    obj.nomeBut35:setLeft(103);
    obj.nomeBut35:setFontColor("#272727");

    obj.nomeBut35B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut35B:setParent(obj.flowPart75);
    obj.nomeBut35B:setName("nomeBut35B");
    obj.nomeBut35B:setText("𝐢");
    obj.nomeBut35B:setWidth(22);
    obj.nomeBut35B:setHeight(22);
    obj.nomeBut35B:setTop(1);
    obj.nomeBut35B:setLeft(103);
    obj.nomeBut35B:setFontColor("white");
    obj.nomeBut35B:setVisible(false);

    obj.popUp_35 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_35:setParent(obj.flowPart75);
    obj.popUp_35:setName("popUp_35");
    obj.popUp_35:setWidth(200);
    obj.popUp_35:setHeight(100);
    obj.popUp_35:setBackOpacity(0);
    obj.popUp_35:setDrawContainer(false);

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.popUp_35);
    obj.rectangle54:setAlign("client");
    obj.rectangle54:setColor("#0e0e0e");
    obj.rectangle54:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle54:setXradius(5);
    obj.rectangle54:setYradius(5);
    obj.rectangle54:setCornerType("bevel");
    obj.rectangle54:setName("rectangle54");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.rectangle54);
    obj.rectangle55:setAlign("client");
    obj.rectangle55:setColor("#0e0e0e");
    obj.rectangle55:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle55:setXradius(3);
    obj.rectangle55:setYradius(3);
    obj.rectangle55:setStrokeColor("#272727");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setCornerType("bevel");
    obj.rectangle55:setName("rectangle55");

    obj.textEditor26 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor26:setParent(obj.rectangle55);
    obj.textEditor26:setAlign("client");
    obj.textEditor26:setTransparent(true);
    obj.textEditor26:setField("fldEnfase35");
    obj.textEditor26:setFontFamily("Constantia");
    obj.textEditor26:setFontSize(13);
    obj.textEditor26:setName("textEditor26");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.rectangle55);
    obj.dataLink61:setField("fldEnfase35");
    obj.dataLink61:setDefaultValue("Ênfases");
    obj.dataLink61:setName("dataLink61");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.flowPart75);
    obj.layout71:setAlign("client");
    obj.layout71:setMargins({right=10});
    obj.layout71:setName("layout71");

    obj.nomeCheck35_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck35_01:setParent(obj.layout71);
    obj.nomeCheck35_01:setField("fldCheck35_01");
    obj.nomeCheck35_01:setName("nomeCheck35_01");
    obj.nomeCheck35_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck35_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck35_01:setHeight(25);
    obj.nomeCheck35_01:setWidth(14);
    obj.nomeCheck35_01:setAlign("right");
    obj.nomeCheck35_01:setMargins({left=3});
    obj.nomeCheck35_01:setAutoChange(false);

    obj.nomeCheck35_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck35_02:setParent(obj.layout71);
    obj.nomeCheck35_02:setField("fldCheck35_02");
    obj.nomeCheck35_02:setName("nomeCheck35_02");
    obj.nomeCheck35_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck35_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck35_02:setHeight(25);
    obj.nomeCheck35_02:setWidth(14);
    obj.nomeCheck35_02:setAlign("right");
    obj.nomeCheck35_02:setMargins({left=3});
    obj.nomeCheck35_02:setAutoChange(false);

    obj.nomeCheck35_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck35_03:setParent(obj.layout71);
    obj.nomeCheck35_03:setField("fldCheck35_03");
    obj.nomeCheck35_03:setName("nomeCheck35_03");
    obj.nomeCheck35_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck35_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck35_03:setHeight(25);
    obj.nomeCheck35_03:setWidth(14);
    obj.nomeCheck35_03:setAlign("right");
    obj.nomeCheck35_03:setMargins({left=3});
    obj.nomeCheck35_03:setAutoChange(false);

    obj.nomeCheck35_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck35_04:setParent(obj.layout71);
    obj.nomeCheck35_04:setField("fldCheck35_04");
    obj.nomeCheck35_04:setName("nomeCheck35_04");
    obj.nomeCheck35_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck35_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck35_04:setHeight(25);
    obj.nomeCheck35_04:setWidth(14);
    obj.nomeCheck35_04:setAlign("right");
    obj.nomeCheck35_04:setMargins({left=3});
    obj.nomeCheck35_04:setAutoChange(false);

    obj.nomeCheck35_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck35_05:setParent(obj.layout71);
    obj.nomeCheck35_05:setField("fldCheck35_05");
    obj.nomeCheck35_05:setName("nomeCheck35_05");
    obj.nomeCheck35_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck35_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck35_05:setHeight(25);
    obj.nomeCheck35_05:setWidth(14);
    obj.nomeCheck35_05:setAlign("right");
    obj.nomeCheck35_05:setMargins({left=3});
    obj.nomeCheck35_05:setAutoChange(false);

    obj.flowPart76 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout18);
    obj.flowPart76:setMargins({bottom=5});
    obj.flowPart76:setName("flowPart76");
    obj.flowPart76:setMinWidth(220);
    obj.flowPart76:setMaxWidth(220);
    obj.flowPart76:setHeight(25);

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowPart76);
    obj.label56:setAlign("left");
    obj.label56:setWidth(100);
    obj.label56:setText("Tecnologia");
    obj.label56:setName("label56");
    obj.label56:setFontSize(14);
    obj.label56:setFontColor("white");
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");
    obj.label56:setTextTrimming("character");
    obj.label56:setFontFamily("Constantia");

    obj.nomeBut36 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut36:setParent(obj.flowPart76);
    obj.nomeBut36:setName("nomeBut36");
    obj.nomeBut36:setText("𝐢");
    obj.nomeBut36:setWidth(22);
    obj.nomeBut36:setHeight(22);
    obj.nomeBut36:setTop(1);
    obj.nomeBut36:setLeft(103);
    obj.nomeBut36:setFontColor("#272727");

    obj.nomeBut36B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut36B:setParent(obj.flowPart76);
    obj.nomeBut36B:setName("nomeBut36B");
    obj.nomeBut36B:setText("𝐢");
    obj.nomeBut36B:setWidth(22);
    obj.nomeBut36B:setHeight(22);
    obj.nomeBut36B:setTop(1);
    obj.nomeBut36B:setLeft(103);
    obj.nomeBut36B:setFontColor("white");
    obj.nomeBut36B:setVisible(false);

    obj.popUp_36 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_36:setParent(obj.flowPart76);
    obj.popUp_36:setName("popUp_36");
    obj.popUp_36:setWidth(200);
    obj.popUp_36:setHeight(100);
    obj.popUp_36:setBackOpacity(0);
    obj.popUp_36:setDrawContainer(false);

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.popUp_36);
    obj.rectangle56:setAlign("client");
    obj.rectangle56:setColor("#0e0e0e");
    obj.rectangle56:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle56:setXradius(5);
    obj.rectangle56:setYradius(5);
    obj.rectangle56:setCornerType("bevel");
    obj.rectangle56:setName("rectangle56");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.rectangle56);
    obj.rectangle57:setAlign("client");
    obj.rectangle57:setColor("#0e0e0e");
    obj.rectangle57:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle57:setXradius(3);
    obj.rectangle57:setYradius(3);
    obj.rectangle57:setStrokeColor("#272727");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setCornerType("bevel");
    obj.rectangle57:setName("rectangle57");

    obj.textEditor27 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor27:setParent(obj.rectangle57);
    obj.textEditor27:setAlign("client");
    obj.textEditor27:setTransparent(true);
    obj.textEditor27:setField("fldEnfase36");
    obj.textEditor27:setFontFamily("Constantia");
    obj.textEditor27:setFontSize(13);
    obj.textEditor27:setName("textEditor27");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.rectangle57);
    obj.dataLink62:setField("fldEnfase36");
    obj.dataLink62:setDefaultValue("Ênfases");
    obj.dataLink62:setName("dataLink62");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.flowPart76);
    obj.layout72:setAlign("client");
    obj.layout72:setMargins({right=10});
    obj.layout72:setName("layout72");

    obj.nomeCheck36_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck36_01:setParent(obj.layout72);
    obj.nomeCheck36_01:setField("fldCheck36_01");
    obj.nomeCheck36_01:setName("nomeCheck36_01");
    obj.nomeCheck36_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck36_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck36_01:setHeight(25);
    obj.nomeCheck36_01:setWidth(14);
    obj.nomeCheck36_01:setAlign("right");
    obj.nomeCheck36_01:setMargins({left=3});
    obj.nomeCheck36_01:setAutoChange(false);

    obj.nomeCheck36_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck36_02:setParent(obj.layout72);
    obj.nomeCheck36_02:setField("fldCheck36_02");
    obj.nomeCheck36_02:setName("nomeCheck36_02");
    obj.nomeCheck36_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck36_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck36_02:setHeight(25);
    obj.nomeCheck36_02:setWidth(14);
    obj.nomeCheck36_02:setAlign("right");
    obj.nomeCheck36_02:setMargins({left=3});
    obj.nomeCheck36_02:setAutoChange(false);

    obj.nomeCheck36_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck36_03:setParent(obj.layout72);
    obj.nomeCheck36_03:setField("fldCheck36_03");
    obj.nomeCheck36_03:setName("nomeCheck36_03");
    obj.nomeCheck36_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck36_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck36_03:setHeight(25);
    obj.nomeCheck36_03:setWidth(14);
    obj.nomeCheck36_03:setAlign("right");
    obj.nomeCheck36_03:setMargins({left=3});
    obj.nomeCheck36_03:setAutoChange(false);

    obj.nomeCheck36_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck36_04:setParent(obj.layout72);
    obj.nomeCheck36_04:setField("fldCheck36_04");
    obj.nomeCheck36_04:setName("nomeCheck36_04");
    obj.nomeCheck36_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck36_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck36_04:setHeight(25);
    obj.nomeCheck36_04:setWidth(14);
    obj.nomeCheck36_04:setAlign("right");
    obj.nomeCheck36_04:setMargins({left=3});
    obj.nomeCheck36_04:setAutoChange(false);

    obj.nomeCheck36_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck36_05:setParent(obj.layout72);
    obj.nomeCheck36_05:setField("fldCheck36_05");
    obj.nomeCheck36_05:setName("nomeCheck36_05");
    obj.nomeCheck36_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck36_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck36_05:setHeight(25);
    obj.nomeCheck36_05:setWidth(14);
    obj.nomeCheck36_05:setAlign("right");
    obj.nomeCheck36_05:setMargins({left=3});
    obj.nomeCheck36_05:setAutoChange(false);

    obj.flowLayout19 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.layFrente);
    obj.flowLayout19:setHeight(25);
    obj.flowLayout19:setMargins({});
    obj.flowLayout19:setName("flowLayout19");
    obj.flowLayout19:setAlign("top");
    obj.flowLayout19:setOrientation("horizontal");
    obj.flowLayout19:setHorzAlign("center");
    obj.flowLayout19:setAutoHeight(true);
    obj.flowLayout19:setMaxControlsPerLine(3);

    obj.flowPart77 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout19);
    obj.flowPart77:setHeight(25);
    obj.flowPart77:setMinWidth(400);
    obj.flowPart77:setMaxWidth(1000);
    obj.flowPart77:setMargins({});
    obj.flowPart77:setName("flowPart77");

    obj.flowLayout20 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.flowPart77);
    obj.flowLayout20:setAutoHeight(false);
    obj.flowLayout20:setHeight(25);
    obj.flowLayout20:setMargins({});
    obj.flowLayout20:setName("flowLayout20");
    obj.flowLayout20:setAlign("top");
    obj.flowLayout20:setOrientation("horizontal");
    obj.flowLayout20:setHorzAlign("center");
    obj.flowLayout20:setMaxControlsPerLine(3);

    obj.flowPart78 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout20);
    obj.flowPart78:setHeight(25);
    obj.flowPart78:setMinWidth(0);
    obj.flowPart78:setMaxWidth(315);
    obj.flowPart78:setWidth(315);
    obj.flowPart78:setName("flowPart78");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.flowPart78);
    obj.horzLine5:setName("horzLine5");
    obj.horzLine5:setStrokeColor("#424242");
    obj.horzLine5:setMargins({top=7});
    obj.horzLine5:setAlign("top");

    obj.flowPart79 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout20);
    obj.flowPart79:setHeight(25);
    obj.flowPart79:setWidth(190);
    obj.flowPart79:setName("flowPart79");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart79);
    obj.label57:setText("D I S C I P L I N A S");
    obj.label57:setName("label57");
    obj.label57:setFontSize(20);
    obj.label57:setFontColor("white");
    lfm_setPropAsString(obj.label57, "fontStyle",  "bold");
    obj.label57:setTextTrimming("character");
    obj.label57:setFontFamily("Constantia");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setAutoSize(true);
    obj.label57:setAlign("client");
    obj.label57:setMargins({bottom=7});

    obj.flowPart80 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout20);
    obj.flowPart80:setHeight(25);
    obj.flowPart80:setMinWidth(0);
    obj.flowPart80:setMaxWidth(315);
    obj.flowPart80:setWidth(315);
    obj.flowPart80:setName("flowPart80");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.flowPart80);
    obj.horzLine6:setName("horzLine6");
    obj.horzLine6:setStrokeColor("#424242");
    obj.horzLine6:setMargins({top=7});
    obj.horzLine6:setAlign("top");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layFrente);
    obj.layout73:setAlign("top");
    obj.layout73:setHeight(30);
    obj.layout73:setName("layout73");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout73);
    obj.layout74:setAlign("right");
    obj.layout74:setWidth(25);
    obj.layout74:setMargins({right=80});
    obj.layout74:setName("layout74");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout74);
    obj.button1:setHeight(25);
    obj.button1:setText("🞦");
    obj.button1:setWidth(25);
    obj.button1:setHint("Nova Disciplina");
    obj.button1:setName("button1");

    obj.flowLayout21 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.layFrente);
    obj.flowLayout21:setAlign("top");
    obj.flowLayout21:setAutoHeight(true);
    obj.flowLayout21:setMargins({left=30, top=0, bottom=30, right=20});
    obj.flowLayout21:setName("flowLayout21");
    obj.flowLayout21:setOrientation("horizontal");
    obj.flowLayout21:setHorzAlign("center");
    obj.flowLayout21:setMaxControlsPerLine(3);

    obj.rclDisciplinas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDisciplinas:setParent(obj.flowLayout21);
    obj.rclDisciplinas:setWidth(800);
    lfm_setPropAsString(obj.rclDisciplinas, "anchors",  "top");
    obj.rclDisciplinas:setMargins({left=20});
    obj.rclDisciplinas:setMinQt(3);
    obj.rclDisciplinas:setLayout("horizontalTiles");
    obj.rclDisciplinas:setName("rclDisciplinas");
    obj.rclDisciplinas:setField("fldDisciplinas");
    obj.rclDisciplinas:setTemplateForm("disciplinas");
    obj.rclDisciplinas:setHeight(460);

    obj.layVerso = GUI.fromHandle(_obj_newObject("layout"));
    obj.layVerso:setParent(obj.rectangle3);
    obj.layVerso:setName("layVerso");
    obj.layVerso:setAlign("client");
    obj.layVerso:setVisible(false);

    obj.flowLayout22 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.layVerso);
    obj.flowLayout22:setMargins({left=20, top=25, bottom=5, right=20});
    obj.flowLayout22:setName("flowLayout22");
    obj.flowLayout22:setAlign("top");
    obj.flowLayout22:setOrientation("horizontal");
    obj.flowLayout22:setHorzAlign("center");
    obj.flowLayout22:setAutoHeight(true);
    obj.flowLayout22:setMaxControlsPerLine(3);

    obj.flowPart81 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.flowLayout22);
    obj.flowPart81:setHeight(440);
    obj.flowPart81:setMinWidth(260);
    obj.flowPart81:setMaxWidth(260);
    obj.flowPart81:setMargins({bottom=0, left=5, right=5});
    obj.flowPart81:setName("flowPart81");

    obj.flowLayout23 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.flowPart81);
    obj.flowLayout23:setOrientation("vertical");
    obj.flowLayout23:setWidth(260);
    obj.flowLayout23:setAutoHeight(true);
    obj.flowLayout23:setMaxColumns(1);
    obj.flowLayout23:setName("flowLayout23");

    obj.flowPart82 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.flowLayout23);
    obj.flowPart82:setMinWidth(260);
    obj.flowPart82:setMaxWidth(260);
    obj.flowPart82:setMargins({bottom=5});
    obj.flowPart82:setName("flowPart82");
    obj.flowPart82:setHeight(25);

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart82);
    obj.label58:setText("A P A R Ê N C I A");
    obj.label58:setName("label58");
    obj.label58:setFontSize(10);
    obj.label58:setFontColor("white");
    obj.label58:setTextTrimming("character");
    obj.label58:setFontFamily("Constantia");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setAlign("top");
    lfm_setPropAsString(obj.label58, "fontStyle",  "bold");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.flowLayout23);
    obj.layout75:setAlign("none");
    obj.layout75:setHeight(400);
    obj.layout75:setWidth(260);
    obj.layout75:setName("layout75");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout75);
    obj.image4:setAlign("none");
    obj.image4:setHeight(400);
    obj.image4:setWidth(260);
    obj.image4:setStyle("autoFit");
    obj.image4:setEditable(true);
    obj.image4:setField("fldFotoPJ");
    obj.image4:setHint("Alterar Aparência");
    obj.image4:setName("image4");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout75);
    obj.dataLink63:setField("fldFotoPJ");
    obj.dataLink63:setDefaultValue("/images/vampire.jpg");
    obj.dataLink63:setName("dataLink63");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout75);
    obj.image5:setHeight(400);
    obj.image5:setWidth(260);
    obj.image5:setURL("/images/frame.png");
    obj.image5:setStyle("proportional");
    obj.image5:setName("image5");

    obj.flowPart83 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.flowLayout22);
    obj.flowPart83:setHeight(440);
    obj.flowPart83:setMinWidth(530);
    obj.flowPart83:setMaxWidth(530);
    obj.flowPart83:setMargins({bottom=0, left=5, right=5});
    obj.flowPart83:setName("flowPart83");

    obj.flowLayout24 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.flowPart83);
    obj.flowLayout24:setOrientation("vertical");
    obj.flowLayout24:setWidth(530);
    obj.flowLayout24:setAutoHeight(true);
    obj.flowLayout24:setMaxColumns(1);
    obj.flowLayout24:setName("flowLayout24");

    obj.flowPart84 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.flowLayout24);
    obj.flowPart84:setMinWidth(530);
    obj.flowPart84:setMaxWidth(530);
    obj.flowPart84:setMargins({bottom=5});
    obj.flowPart84:setName("flowPart84");
    obj.flowPart84:setHeight(25);

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart84);
    obj.label59:setText("P R E L Ú D I O");
    obj.label59:setName("label59");
    obj.label59:setFontSize(10);
    obj.label59:setFontColor("white");
    obj.label59:setTextTrimming("character");
    obj.label59:setFontFamily("Constantia");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setAlign("top");
    lfm_setPropAsString(obj.label59, "fontStyle",  "bold");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.flowLayout24);
    obj.rectangle58:setHeight(400);
    obj.rectangle58:setWidth(530);
    obj.rectangle58:setColor("#202020");
    obj.rectangle58:setCornerType("bevel");
    obj.rectangle58:setXradius(10);
    obj.rectangle58:setYradius(10);
    obj.rectangle58:setPadding({top=10, bottom=10, left=10, right=10});
    obj.rectangle58:setName("rectangle58");

    obj.nomeBG = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeBG:setParent(obj.rectangle58);
    obj.nomeBG:setAlign("client");
    obj.nomeBG:setTransparent(true);
    obj.nomeBG:setField("fldBG");
    obj.nomeBG:setName("nomeBG");
    obj.nomeBG:setFontFamily("Constantia");
    obj.nomeBG:setFontSize(13);

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.rectangle58);
    obj.dataLink64:setField("fldBG");
    obj.dataLink64:setDefaultValue("Escreva aqui.");
    obj.dataLink64:setName("dataLink64");

    obj.flowLayout25 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.layVerso);
    obj.flowLayout25:setMargins({left=20, top=0, bottom=30, right=20});
    obj.flowLayout25:setName("flowLayout25");
    obj.flowLayout25:setAlign("top");
    obj.flowLayout25:setOrientation("horizontal");
    obj.flowLayout25:setHorzAlign("center");
    obj.flowLayout25:setAutoHeight(true);
    obj.flowLayout25:setMaxControlsPerLine(3);

    obj.flowPart85 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.flowLayout25);
    obj.flowPart85:setHeight(240);
    obj.flowPart85:setMinWidth(260);
    obj.flowPart85:setMaxWidth(260);
    obj.flowPart85:setMargins({bottom=0, left=5, right=5});
    obj.flowPart85:setName("flowPart85");

    obj.flowLayout26 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout26:setParent(obj.flowPart85);
    obj.flowLayout26:setOrientation("vertical");
    obj.flowLayout26:setWidth(260);
    obj.flowLayout26:setAutoHeight(true);
    obj.flowLayout26:setMaxColumns(1);
    obj.flowLayout26:setName("flowLayout26");

    obj.flowPart86 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.flowLayout26);
    obj.flowPart86:setMinWidth(260);
    obj.flowPart86:setMaxWidth(260);
    obj.flowPart86:setMargins({bottom=5});
    obj.flowPart86:setName("flowPart86");
    obj.flowPart86:setHeight(25);

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart86);
    obj.label60:setText("P R Í N C I P I O S   D A   C R Ô N I C A");
    obj.label60:setName("label60");
    obj.label60:setFontSize(10);
    obj.label60:setFontColor("white");
    obj.label60:setTextTrimming("character");
    obj.label60:setFontFamily("Constantia");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setAlign("top");
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.flowLayout26);
    obj.rectangle59:setHeight(200);
    obj.rectangle59:setWidth(260);
    obj.rectangle59:setColor("#202020");
    obj.rectangle59:setCornerType("bevel");
    obj.rectangle59:setXradius(10);
    obj.rectangle59:setYradius(10);
    obj.rectangle59:setPadding({top=10, bottom=10, left=10, right=10});
    obj.rectangle59:setName("rectangle59");

    obj.nomeVER_Cronica = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeVER_Cronica:setParent(obj.rectangle59);
    obj.nomeVER_Cronica:setAlign("client");
    obj.nomeVER_Cronica:setTransparent(true);
    obj.nomeVER_Cronica:setField("fldVER_Cronica");
    obj.nomeVER_Cronica:setName("nomeVER_Cronica");
    obj.nomeVER_Cronica:setFontFamily("Constantia");
    obj.nomeVER_Cronica:setFontSize(13);

    obj.dataLink65 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.rectangle59);
    obj.dataLink65:setField("fldVER_Cronica");
    obj.dataLink65:setDefaultValue("Escreva aqui.");
    obj.dataLink65:setName("dataLink65");

    obj.flowPart87 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.flowLayout25);
    obj.flowPart87:setHeight(240);
    obj.flowPart87:setMinWidth(260);
    obj.flowPart87:setMaxWidth(260);
    obj.flowPart87:setMargins({bottom=0, left=5, right=5});
    obj.flowPart87:setName("flowPart87");

    obj.flowLayout27 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout27:setParent(obj.flowPart87);
    obj.flowLayout27:setOrientation("vertical");
    obj.flowLayout27:setWidth(260);
    obj.flowLayout27:setAutoHeight(true);
    obj.flowLayout27:setMaxColumns(1);
    obj.flowLayout27:setName("flowLayout27");

    obj.flowPart88 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.flowLayout27);
    obj.flowPart88:setMinWidth(260);
    obj.flowPart88:setMaxWidth(260);
    obj.flowPart88:setMargins({bottom=5});
    obj.flowPart88:setName("flowPart88");
    obj.flowPart88:setHeight(25);

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart88);
    obj.label61:setText("P I L A R E S   🙵   C O N V I C Ç Õ E S");
    obj.label61:setName("label61");
    obj.label61:setFontSize(10);
    obj.label61:setFontColor("white");
    obj.label61:setTextTrimming("character");
    obj.label61:setFontFamily("Constantia");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setAlign("top");
    lfm_setPropAsString(obj.label61, "fontStyle",  "bold");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.flowLayout27);
    obj.rectangle60:setHeight(200);
    obj.rectangle60:setWidth(260);
    obj.rectangle60:setColor("#202020");
    obj.rectangle60:setCornerType("bevel");
    obj.rectangle60:setXradius(10);
    obj.rectangle60:setYradius(10);
    obj.rectangle60:setPadding({top=10, bottom=10, left=10, right=10});
    obj.rectangle60:setName("rectangle60");

    obj.nomeVER_Pilar = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeVER_Pilar:setParent(obj.rectangle60);
    obj.nomeVER_Pilar:setAlign("client");
    obj.nomeVER_Pilar:setTransparent(true);
    obj.nomeVER_Pilar:setField("fldVER_Pilar");
    obj.nomeVER_Pilar:setName("nomeVER_Pilar");
    obj.nomeVER_Pilar:setFontFamily("Constantia");
    obj.nomeVER_Pilar:setFontSize(13);

    obj.dataLink66 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.rectangle60);
    obj.dataLink66:setField("fldVER_Pilar");
    obj.dataLink66:setDefaultValue("Escreva aqui.");
    obj.dataLink66:setName("dataLink66");

    obj.flowPart89 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.flowLayout25);
    obj.flowPart89:setHeight(240);
    obj.flowPart89:setMinWidth(260);
    obj.flowPart89:setMaxWidth(260);
    obj.flowPart89:setMargins({bottom=0, left=5, right=5});
    obj.flowPart89:setName("flowPart89");

    obj.flowLayout28 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout28:setParent(obj.flowPart89);
    obj.flowLayout28:setOrientation("vertical");
    obj.flowLayout28:setWidth(260);
    obj.flowLayout28:setAutoHeight(true);
    obj.flowLayout28:setMaxColumns(1);
    obj.flowLayout28:setName("flowLayout28");

    obj.flowPart90 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.flowLayout28);
    obj.flowPart90:setMinWidth(260);
    obj.flowPart90:setMaxWidth(260);
    obj.flowPart90:setMargins({bottom=5});
    obj.flowPart90:setName("flowPart90");
    obj.flowPart90:setHeight(25);

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowPart90);
    obj.label62:setText("P E R D I Ç Ã O   D O   C L Ã");
    obj.label62:setName("label62");
    obj.label62:setFontSize(10);
    obj.label62:setFontColor("white");
    obj.label62:setTextTrimming("character");
    obj.label62:setFontFamily("Constantia");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setAlign("top");
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.flowLayout28);
    obj.rectangle61:setHeight(200);
    obj.rectangle61:setWidth(260);
    obj.rectangle61:setColor("#202020");
    obj.rectangle61:setCornerType("bevel");
    obj.rectangle61:setXradius(10);
    obj.rectangle61:setYradius(10);
    obj.rectangle61:setPadding({top=10, bottom=10, left=10, right=10});
    obj.rectangle61:setName("rectangle61");

    obj.nomeVER_Perdicao = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeVER_Perdicao:setParent(obj.rectangle61);
    obj.nomeVER_Perdicao:setAlign("client");
    obj.nomeVER_Perdicao:setTransparent(true);
    obj.nomeVER_Perdicao:setField("fldVER_Perdicao");
    obj.nomeVER_Perdicao:setName("nomeVER_Perdicao");
    obj.nomeVER_Perdicao:setFontFamily("Constantia");
    obj.nomeVER_Perdicao:setFontSize(13);

    obj.dataLink67 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.rectangle61);
    obj.dataLink67:setField("fldVER_Perdicao");
    obj.dataLink67:setDefaultValue("Escreva aqui.");
    obj.dataLink67:setName("dataLink67");

    obj.flowLayout29 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout29:setParent(obj.layVerso);
    obj.flowLayout29:setMaxControlsPerLine(2);
    obj.flowLayout29:setName("flowLayout29");
    obj.flowLayout29:setAlign("top");
    obj.flowLayout29:setOrientation("horizontal");
    obj.flowLayout29:setHorzAlign("center");
    obj.flowLayout29:setAutoHeight(true);
    obj.flowLayout29:setMargins({left=20, top=20, bottom=30, right=20});

    obj.flowPart91 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.flowLayout29);
    obj.flowPart91:setHeight(600);
    obj.flowPart91:setMargins({left=5, right=5, bottom=10});
    obj.flowPart91:setMinWidth(395);
    obj.flowPart91:setMaxWidth(390);
    obj.flowPart91:setName("flowPart91");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.flowPart91);
    obj.rectangle62:setHeight(600);
    obj.rectangle62:setColor("transparent");
    obj.rectangle62:setAlign("client");
    obj.rectangle62:setName("rectangle62");

    obj.flowLayout30 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout30:setParent(obj.rectangle62);
    obj.flowLayout30:setHeight(25);
    obj.flowLayout30:setMargins({});
    obj.flowLayout30:setName("flowLayout30");
    obj.flowLayout30:setAlign("top");
    obj.flowLayout30:setOrientation("horizontal");
    obj.flowLayout30:setHorzAlign("center");
    obj.flowLayout30:setAutoHeight(true);
    obj.flowLayout30:setMaxControlsPerLine(3);

    obj.flowPart92 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.flowLayout30);
    obj.flowPart92:setHeight(25);
    obj.flowPart92:setMinWidth(400);
    obj.flowPart92:setMaxWidth(1000);
    obj.flowPart92:setMargins({});
    obj.flowPart92:setName("flowPart92");

    obj.flowLayout31 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout31:setParent(obj.flowPart92);
    obj.flowLayout31:setAutoHeight(false);
    obj.flowLayout31:setHeight(25);
    obj.flowLayout31:setMargins({});
    obj.flowLayout31:setName("flowLayout31");
    obj.flowLayout31:setAlign("top");
    obj.flowLayout31:setOrientation("horizontal");
    obj.flowLayout31:setHorzAlign("center");
    obj.flowLayout31:setMaxControlsPerLine(3);

    obj.flowPart93 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.flowLayout31);
    obj.flowPart93:setHeight(25);
    obj.flowPart93:setMinWidth(0);
    obj.flowPart93:setMaxWidth(115);
    obj.flowPart93:setWidth(115);
    obj.flowPart93:setName("flowPart93");

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.flowPart93);
    obj.horzLine7:setName("horzLine7");
    obj.horzLine7:setStrokeColor("#424242");
    obj.horzLine7:setMargins({top=7});
    obj.horzLine7:setAlign("top");

    obj.flowPart94 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.flowLayout31);
    obj.flowPart94:setHeight(25);
    obj.flowPart94:setWidth(164);
    obj.flowPart94:setName("flowPart94");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowPart94);
    obj.label63:setText("V A N T A G E N S");
    obj.label63:setName("label63");
    obj.label63:setFontSize(20);
    obj.label63:setFontColor("white");
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");
    obj.label63:setTextTrimming("character");
    obj.label63:setFontFamily("Constantia");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setAutoSize(true);
    obj.label63:setAlign("client");
    obj.label63:setMargins({bottom=7});

    obj.flowPart95 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.flowLayout31);
    obj.flowPart95:setHeight(25);
    obj.flowPart95:setMinWidth(0);
    obj.flowPart95:setMaxWidth(115);
    obj.flowPart95:setWidth(115);
    obj.flowPart95:setName("flowPart95");

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.flowPart95);
    obj.horzLine8:setName("horzLine8");
    obj.horzLine8:setStrokeColor("#424242");
    obj.horzLine8:setMargins({top=7});
    obj.horzLine8:setAlign("top");

    obj.rclVantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclVantagens:setParent(obj.rectangle62);
    obj.rclVantagens:setAlign("top");
    obj.rclVantagens:setMinQt(3);
    obj.rclVantagens:setLayout("vertical");
    obj.rclVantagens:setName("rclVantagens");
    obj.rclVantagens:setField("fldVantagens");
    obj.rclVantagens:setTemplateForm("vantagens");
    obj.rclVantagens:setAutoHeight(true);
    obj.rclVantagens:setMargins({top=20});

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle62);
    obj.button2:setAlign("top");
    obj.button2:setHeight(25);
    obj.button2:setText("🞦");
    obj.button2:setHint("Nova Vantagem");
    obj.button2:setName("button2");

    obj.flowPart96 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.flowLayout29);
    obj.flowPart96:setHeight(600);
    obj.flowPart96:setMargins({left=5, right=5, bottom=10});
    obj.flowPart96:setMinWidth(395);
    obj.flowPart96:setMaxWidth(390);
    obj.flowPart96:setName("flowPart96");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.flowPart96);
    obj.rectangle63:setHeight(600);
    obj.rectangle63:setColor("transparent");
    obj.rectangle63:setAlign("client");
    obj.rectangle63:setName("rectangle63");

    obj.flowLayout32 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout32:setParent(obj.rectangle63);
    obj.flowLayout32:setHeight(25);
    obj.flowLayout32:setMargins({});
    obj.flowLayout32:setName("flowLayout32");
    obj.flowLayout32:setAlign("top");
    obj.flowLayout32:setOrientation("horizontal");
    obj.flowLayout32:setHorzAlign("center");
    obj.flowLayout32:setAutoHeight(true);
    obj.flowLayout32:setMaxControlsPerLine(3);

    obj.flowPart97 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.flowLayout32);
    obj.flowPart97:setHeight(25);
    obj.flowPart97:setMinWidth(400);
    obj.flowPart97:setMaxWidth(1000);
    obj.flowPart97:setMargins({});
    obj.flowPart97:setName("flowPart97");

    obj.flowLayout33 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout33:setParent(obj.flowPart97);
    obj.flowLayout33:setAutoHeight(false);
    obj.flowLayout33:setHeight(25);
    obj.flowLayout33:setMargins({});
    obj.flowLayout33:setName("flowLayout33");
    obj.flowLayout33:setAlign("top");
    obj.flowLayout33:setOrientation("horizontal");
    obj.flowLayout33:setHorzAlign("center");
    obj.flowLayout33:setMaxControlsPerLine(3);

    obj.flowPart98 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.flowLayout33);
    obj.flowPart98:setHeight(25);
    obj.flowPart98:setMinWidth(0);
    obj.flowPart98:setMaxWidth(132);
    obj.flowPart98:setWidth(132);
    obj.flowPart98:setName("flowPart98");

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.flowPart98);
    obj.horzLine9:setName("horzLine9");
    obj.horzLine9:setStrokeColor("#424242");
    obj.horzLine9:setMargins({top=7});
    obj.horzLine9:setAlign("top");

    obj.flowPart99 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.flowLayout33);
    obj.flowPart99:setHeight(25);
    obj.flowPart99:setWidth(128);
    obj.flowPart99:setName("flowPart99");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowPart99);
    obj.label64:setText("P O D E R E S");
    obj.label64:setName("label64");
    obj.label64:setFontSize(20);
    obj.label64:setFontColor("white");
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");
    obj.label64:setTextTrimming("character");
    obj.label64:setFontFamily("Constantia");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setAutoSize(true);
    obj.label64:setAlign("client");
    obj.label64:setMargins({bottom=7});

    obj.flowPart100 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.flowLayout33);
    obj.flowPart100:setHeight(25);
    obj.flowPart100:setMinWidth(0);
    obj.flowPart100:setMaxWidth(132);
    obj.flowPart100:setWidth(132);
    obj.flowPart100:setName("flowPart100");

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.flowPart100);
    obj.horzLine10:setName("horzLine10");
    obj.horzLine10:setStrokeColor("#424242");
    obj.horzLine10:setMargins({top=7});
    obj.horzLine10:setAlign("top");

    obj.flowLayout34 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout34:setParent(obj.rectangle63);
    obj.flowLayout34:setAlign("top");
    obj.flowLayout34:setAutoHeight(true);
    obj.flowLayout34:setOrientation("vertical");
    obj.flowLayout34:setMargins({top=20});
    obj.flowLayout34:setName("flowLayout34");

    obj.flowPart101 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.flowLayout34);
    obj.flowPart101:setAlign("top");
    obj.flowPart101:setHeight(50);
    obj.flowPart101:setWidth(197.5);
    obj.flowPart101:setMargins({bottom=5});
    obj.flowPart101:setName("flowPart101");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart101);
    obj.label65:setHorzTextAlign("leading");
    obj.label65:setAlign("top");
    obj.label65:setText("SURTO DE SANGUE");
    obj.label65:setFontColor("#6f6f6f");
    obj.label65:setMargins({bottom=5});
    obj.label65:setName("label65");
    obj.label65:setFontSize(10);
    obj.label65:setTextTrimming("character");
    obj.label65:setFontFamily("Constantia");
    lfm_setPropAsString(obj.label65, "fontStyle",  "bold");

    obj.sangSurto = GUI.fromHandle(_obj_newObject("label"));
    obj.sangSurto:setParent(obj.flowPart101);
    obj.sangSurto:setAlign("top");
    obj.sangSurto:setField("fldsangSurto");
    obj.sangSurto:setName("sangSurto");
    obj.sangSurto:setFontSize(14);
    obj.sangSurto:setFontColor("white");
    lfm_setPropAsString(obj.sangSurto, "fontStyle",  "bold");
    obj.sangSurto:setTextTrimming("character");
    obj.sangSurto:setFontFamily("Constantia");

    obj.dataLink68 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.flowPart101);
    obj.dataLink68:setField("fldsangSurto");
    obj.dataLink68:setDefaultValue("—");
    obj.dataLink68:setName("dataLink68");

    obj.flowPart102 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart102:setParent(obj.flowLayout34);
    obj.flowPart102:setAlign("top");
    obj.flowPart102:setHeight(50);
    obj.flowPart102:setWidth(197.5);
    obj.flowPart102:setMargins({bottom=5});
    obj.flowPart102:setName("flowPart102");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowPart102);
    obj.label66:setHorzTextAlign("leading");
    obj.label66:setAlign("top");
    obj.label66:setText("REGENERAÇÃO");
    obj.label66:setFontColor("#6f6f6f");
    obj.label66:setMargins({bottom=5});
    obj.label66:setName("label66");
    obj.label66:setFontSize(10);
    obj.label66:setTextTrimming("character");
    obj.label66:setFontFamily("Constantia");
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");

    obj.sangRegen = GUI.fromHandle(_obj_newObject("label"));
    obj.sangRegen:setParent(obj.flowPart102);
    obj.sangRegen:setAlign("top");
    obj.sangRegen:setField("fldsangRegen");
    obj.sangRegen:setName("sangRegen");
    obj.sangRegen:setFontSize(14);
    obj.sangRegen:setFontColor("white");
    lfm_setPropAsString(obj.sangRegen, "fontStyle",  "bold");
    obj.sangRegen:setTextTrimming("character");
    obj.sangRegen:setFontFamily("Constantia");

    obj.dataLink69 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.flowPart102);
    obj.dataLink69:setField("fldsangRegen");
    obj.dataLink69:setDefaultValue("—");
    obj.dataLink69:setName("dataLink69");

    obj.flowPart103 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart103:setParent(obj.flowLayout34);
    obj.flowPart103:setAlign("top");
    obj.flowPart103:setHeight(50);
    obj.flowPart103:setWidth(197.5);
    obj.flowPart103:setMargins({bottom=5});
    obj.flowPart103:setName("flowPart103");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowPart103);
    obj.label67:setHorzTextAlign("leading");
    obj.label67:setAlign("top");
    obj.label67:setText("BÔNUS DE PODER");
    obj.label67:setFontColor("#6f6f6f");
    obj.label67:setMargins({bottom=5});
    obj.label67:setName("label67");
    obj.label67:setFontSize(10);
    obj.label67:setTextTrimming("character");
    obj.label67:setFontFamily("Constantia");
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");

    obj.sangBonus = GUI.fromHandle(_obj_newObject("label"));
    obj.sangBonus:setParent(obj.flowPart103);
    obj.sangBonus:setAlign("top");
    obj.sangBonus:setField("fldsangBonus");
    obj.sangBonus:setName("sangBonus");
    obj.sangBonus:setFontSize(14);
    obj.sangBonus:setFontColor("white");
    lfm_setPropAsString(obj.sangBonus, "fontStyle",  "bold");
    obj.sangBonus:setTextTrimming("character");
    obj.sangBonus:setFontFamily("Constantia");

    obj.dataLink70 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.flowPart103);
    obj.dataLink70:setField("fldsangBonus");
    obj.dataLink70:setDefaultValue("—");
    obj.dataLink70:setName("dataLink70");

    obj.flowPart104 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart104:setParent(obj.flowLayout34);
    obj.flowPart104:setAlign("top");
    obj.flowPart104:setHeight(50);
    obj.flowPart104:setWidth(197.5);
    obj.flowPart104:setMargins({bottom=5});
    obj.flowPart104:setName("flowPart104");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowPart104);
    obj.label68:setHorzTextAlign("leading");
    obj.label68:setAlign("top");
    obj.label68:setText("RERROLAGEM DE SANGUE");
    obj.label68:setFontColor("#6f6f6f");
    obj.label68:setMargins({bottom=5});
    obj.label68:setName("label68");
    obj.label68:setFontSize(10);
    obj.label68:setTextTrimming("character");
    obj.label68:setFontFamily("Constantia");
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");

    obj.sangReroll = GUI.fromHandle(_obj_newObject("label"));
    obj.sangReroll:setParent(obj.flowPart104);
    obj.sangReroll:setAlign("top");
    obj.sangReroll:setField("fldsangReroll");
    obj.sangReroll:setName("sangReroll");
    obj.sangReroll:setFontSize(14);
    obj.sangReroll:setFontColor("white");
    lfm_setPropAsString(obj.sangReroll, "fontStyle",  "bold");
    obj.sangReroll:setTextTrimming("character");
    obj.sangReroll:setFontFamily("Constantia");

    obj.dataLink71 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.flowPart104);
    obj.dataLink71:setField("fldsangReroll");
    obj.dataLink71:setDefaultValue("—");
    obj.dataLink71:setName("dataLink71");

    obj.flowPart105 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart105:setParent(obj.flowLayout34);
    obj.flowPart105:setAlign("top");
    obj.flowPart105:setHeight(50);
    obj.flowPart105:setWidth(197.5);
    obj.flowPart105:setMargins({bottom=5});
    obj.flowPart105:setName("flowPart105");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart105);
    obj.label69:setHorzTextAlign("leading");
    obj.label69:setAlign("top");
    obj.label69:setText("GRAVIDADE DA PERDIÇÃO");
    obj.label69:setFontColor("#6f6f6f");
    obj.label69:setMargins({bottom=5});
    obj.label69:setName("label69");
    obj.label69:setFontSize(10);
    obj.label69:setTextTrimming("character");
    obj.label69:setFontFamily("Constantia");
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");

    obj.sangBane = GUI.fromHandle(_obj_newObject("label"));
    obj.sangBane:setParent(obj.flowPart105);
    obj.sangBane:setAlign("top");
    obj.sangBane:setField("fldsangBane");
    obj.sangBane:setName("sangBane");
    obj.sangBane:setFontSize(14);
    obj.sangBane:setFontColor("white");
    lfm_setPropAsString(obj.sangBane, "fontStyle",  "bold");
    obj.sangBane:setTextTrimming("character");
    obj.sangBane:setFontFamily("Constantia");

    obj.dataLink72 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.flowPart105);
    obj.dataLink72:setField("fldsangBane");
    obj.dataLink72:setDefaultValue("—");
    obj.dataLink72:setName("dataLink72");

    obj.flowPart106 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart106:setParent(obj.flowLayout34);
    obj.flowPart106:setAlign("top");
    obj.flowPart106:setHeight(150);
    obj.flowPart106:setWidth(197.5);
    obj.flowPart106:setMargins({bottom=5});
    obj.flowPart106:setName("flowPart106");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowPart106);
    obj.label70:setHorzTextAlign("leading");
    obj.label70:setAlign("top");
    obj.label70:setText("PENALIDADE DE ALIMENTAÇÃO");
    obj.label70:setFontColor("#6f6f6f");
    obj.label70:setMargins({bottom=5});
    obj.label70:setName("label70");
    obj.label70:setFontSize(10);
    obj.label70:setTextTrimming("character");
    obj.label70:setFontFamily("Constantia");
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");

    obj.sangFeed = GUI.fromHandle(_obj_newObject("label"));
    obj.sangFeed:setParent(obj.flowPart106);
    obj.sangFeed:setAlign("top");
    obj.sangFeed:setField("fldsangFeed");
    obj.sangFeed:setName("sangFeed");
    obj.sangFeed:setHeight(130);
    obj.sangFeed:setAutoSize(true);
    obj.sangFeed:setFontSize(14);
    obj.sangFeed:setFontColor("white");
    lfm_setPropAsString(obj.sangFeed, "fontStyle",  "bold");
    obj.sangFeed:setTextTrimming("character");
    obj.sangFeed:setFontFamily("Constantia");

    obj.dataLink73 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.flowPart106);
    obj.dataLink73:setField("fldsangFeed");
    obj.dataLink73:setDefaultValue("—");
    obj.dataLink73:setName("dataLink73");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle63);
    obj.layout76:setAlign("top");
    obj.layout76:setHeight(50);
    obj.layout76:setMargins({top=20});
    obj.layout76:setName("layout76");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout76);
    obj.layout77:setAlign("top");
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout77);
    obj.label71:setText("P O T Ê N C I A   S A N G U Í N E A");
    obj.label71:setName("label71");
    obj.label71:setFontSize(10);
    obj.label71:setFontColor("white");
    obj.label71:setTextTrimming("character");
    obj.label71:setFontFamily("Constantia");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setAlign("top");
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout76);
    obj.layout78:setAlign("top");
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout78);
    obj.layout79:setAlign("left");
    obj.layout79:setMargins({left=113.5});
    obj.layout79:setHeight(25);
    obj.layout79:setWidth(168);
    obj.layout79:setName("layout79");

    obj.nomeCheckPotencia_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckPotencia_01:setParent(obj.layout79);
    obj.nomeCheckPotencia_01:setField("fldCheckPotencia_01");
    obj.nomeCheckPotencia_01:setName("nomeCheckPotencia_01");
    obj.nomeCheckPotencia_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckPotencia_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckPotencia_01:setHeight(25);
    obj.nomeCheckPotencia_01:setWidth(14);
    obj.nomeCheckPotencia_01:setAlign("right");
    obj.nomeCheckPotencia_01:setMargins({left=3});
    obj.nomeCheckPotencia_01:setAutoChange(false);

    obj.nomeCheckPotencia_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckPotencia_02:setParent(obj.layout79);
    obj.nomeCheckPotencia_02:setField("fldCheckPotencia_02");
    obj.nomeCheckPotencia_02:setName("nomeCheckPotencia_02");
    obj.nomeCheckPotencia_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckPotencia_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckPotencia_02:setHeight(25);
    obj.nomeCheckPotencia_02:setWidth(14);
    obj.nomeCheckPotencia_02:setAlign("right");
    obj.nomeCheckPotencia_02:setMargins({left=3});
    obj.nomeCheckPotencia_02:setAutoChange(false);

    obj.nomeCheckPotencia_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckPotencia_03:setParent(obj.layout79);
    obj.nomeCheckPotencia_03:setField("fldCheckPotencia_03");
    obj.nomeCheckPotencia_03:setName("nomeCheckPotencia_03");
    obj.nomeCheckPotencia_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckPotencia_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckPotencia_03:setHeight(25);
    obj.nomeCheckPotencia_03:setWidth(14);
    obj.nomeCheckPotencia_03:setAlign("right");
    obj.nomeCheckPotencia_03:setMargins({left=3});
    obj.nomeCheckPotencia_03:setAutoChange(false);

    obj.nomeCheckPotencia_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckPotencia_04:setParent(obj.layout79);
    obj.nomeCheckPotencia_04:setField("fldCheckPotencia_04");
    obj.nomeCheckPotencia_04:setName("nomeCheckPotencia_04");
    obj.nomeCheckPotencia_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckPotencia_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckPotencia_04:setHeight(25);
    obj.nomeCheckPotencia_04:setWidth(14);
    obj.nomeCheckPotencia_04:setAlign("right");
    obj.nomeCheckPotencia_04:setMargins({left=3});
    obj.nomeCheckPotencia_04:setAutoChange(false);

    obj.nomeCheckPotencia_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckPotencia_05:setParent(obj.layout79);
    obj.nomeCheckPotencia_05:setField("fldCheckPotencia_05");
    obj.nomeCheckPotencia_05:setName("nomeCheckPotencia_05");
    obj.nomeCheckPotencia_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckPotencia_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckPotencia_05:setHeight(25);
    obj.nomeCheckPotencia_05:setWidth(14);
    obj.nomeCheckPotencia_05:setAlign("right");
    obj.nomeCheckPotencia_05:setMargins({left=3});
    obj.nomeCheckPotencia_05:setAutoChange(false);

    obj.nomeCheckPotencia_06 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckPotencia_06:setParent(obj.layout79);
    obj.nomeCheckPotencia_06:setField("fldCheckPotencia_06");
    obj.nomeCheckPotencia_06:setName("nomeCheckPotencia_06");
    obj.nomeCheckPotencia_06:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckPotencia_06:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckPotencia_06:setHeight(25);
    obj.nomeCheckPotencia_06:setWidth(14);
    obj.nomeCheckPotencia_06:setAlign("right");
    obj.nomeCheckPotencia_06:setMargins({left=3});
    obj.nomeCheckPotencia_06:setAutoChange(false);

    obj.nomeCheckPotencia_07 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckPotencia_07:setParent(obj.layout79);
    obj.nomeCheckPotencia_07:setField("fldCheckPotencia_07");
    obj.nomeCheckPotencia_07:setName("nomeCheckPotencia_07");
    obj.nomeCheckPotencia_07:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckPotencia_07:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckPotencia_07:setHeight(25);
    obj.nomeCheckPotencia_07:setWidth(14);
    obj.nomeCheckPotencia_07:setAlign("right");
    obj.nomeCheckPotencia_07:setMargins({left=3});
    obj.nomeCheckPotencia_07:setAutoChange(false);

    obj.nomeCheckPotencia_08 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckPotencia_08:setParent(obj.layout79);
    obj.nomeCheckPotencia_08:setField("fldCheckPotencia_08");
    obj.nomeCheckPotencia_08:setName("nomeCheckPotencia_08");
    obj.nomeCheckPotencia_08:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckPotencia_08:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckPotencia_08:setHeight(25);
    obj.nomeCheckPotencia_08:setWidth(14);
    obj.nomeCheckPotencia_08:setAlign("right");
    obj.nomeCheckPotencia_08:setMargins({left=3});
    obj.nomeCheckPotencia_08:setAutoChange(false);

    obj.nomeCheckPotencia_09 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckPotencia_09:setParent(obj.layout79);
    obj.nomeCheckPotencia_09:setField("fldCheckPotencia_09");
    obj.nomeCheckPotencia_09:setName("nomeCheckPotencia_09");
    obj.nomeCheckPotencia_09:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckPotencia_09:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckPotencia_09:setHeight(25);
    obj.nomeCheckPotencia_09:setWidth(14);
    obj.nomeCheckPotencia_09:setAlign("right");
    obj.nomeCheckPotencia_09:setMargins({left=3});
    obj.nomeCheckPotencia_09:setAutoChange(false);

    obj.nomeCheckPotencia_10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckPotencia_10:setParent(obj.layout79);
    obj.nomeCheckPotencia_10:setField("fldCheckPotencia_10");
    obj.nomeCheckPotencia_10:setName("nomeCheckPotencia_10");
    obj.nomeCheckPotencia_10:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckPotencia_10:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckPotencia_10:setHeight(25);
    obj.nomeCheckPotencia_10:setWidth(14);
    obj.nomeCheckPotencia_10:setAlign("right");
    obj.nomeCheckPotencia_10:setMargins({left=3});
    obj.nomeCheckPotencia_10:setAutoChange(false);

    obj.dataLink74 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.layout79);
    obj.dataLink74:setFields({'fldCheckPotencia_01', 'fldCheckPotencia_02', 
															   'fldCheckPotencia_03', 'fldCheckPotencia_04',
															   'fldCheckPotencia_05', 'fldCheckPotencia_06',
															   'fldCheckPotencia_07', 'fldCheckPotencia_08',
															   'fldCheckPotencia_09', 'fldCheckPotencia_10',});
    obj.dataLink74:setName("dataLink74");

    obj.layNote = GUI.fromHandle(_obj_newObject("layout"));
    obj.layNote:setParent(obj.rectangle3);
    obj.layNote:setName("layNote");
    obj.layNote:setAlign("client");
    obj.layNote:setVisible(false);

    obj.flowLayout35 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout35:setParent(obj.layNote);
    obj.flowLayout35:setHeight(30);
    obj.flowLayout35:setMargins({top=20});
    obj.flowLayout35:setName("flowLayout35");
    obj.flowLayout35:setAlign("top");
    obj.flowLayout35:setOrientation("horizontal");
    obj.flowLayout35:setHorzAlign("center");
    obj.flowLayout35:setAutoHeight(true);
    obj.flowLayout35:setMaxControlsPerLine(3);

    obj.flowPart107 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart107:setParent(obj.flowLayout35);
    obj.flowPart107:setHeight(30);
    obj.flowPart107:setMinWidth(400);
    obj.flowPart107:setMaxWidth(1000);
    obj.flowPart107:setMargins({});
    obj.flowPart107:setName("flowPart107");

    obj.flowLayout36 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout36:setParent(obj.flowPart107);
    obj.flowLayout36:setAutoHeight(false);
    obj.flowLayout36:setHeight(25);
    obj.flowLayout36:setMargins({});
    obj.flowLayout36:setName("flowLayout36");
    obj.flowLayout36:setAlign("top");
    obj.flowLayout36:setOrientation("horizontal");
    obj.flowLayout36:setHorzAlign("center");
    obj.flowLayout36:setMaxControlsPerLine(3);

    obj.flowPart108 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart108:setParent(obj.flowLayout36);
    obj.flowPart108:setHeight(30);
    obj.flowPart108:setMinWidth(0);
    obj.flowPart108:setMaxWidth(325);
    obj.flowPart108:setWidth(325);
    obj.flowPart108:setName("flowPart108");

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.flowPart108);
    obj.horzLine11:setName("horzLine11");
    obj.horzLine11:setStrokeColor("#424242");
    obj.horzLine11:setMargins({top=7});
    obj.horzLine11:setAlign("top");

    obj.flowPart109 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart109:setParent(obj.flowLayout36);
    obj.flowPart109:setHeight(30);
    obj.flowPart109:setWidth(170);
    obj.flowPart109:setName("flowPart109");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.flowPart109);
    obj.label72:setText("A N O T A Ç Õ E S");
    obj.label72:setName("label72");
    obj.label72:setFontSize(20);
    obj.label72:setFontColor("white");
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setTextTrimming("character");
    obj.label72:setFontFamily("Constantia");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setAutoSize(true);
    obj.label72:setAlign("client");
    obj.label72:setMargins({bottom=7});

    obj.flowPart110 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart110:setParent(obj.flowLayout36);
    obj.flowPart110:setHeight(30);
    obj.flowPart110:setMinWidth(0);
    obj.flowPart110:setMaxWidth(325);
    obj.flowPart110:setWidth(325);
    obj.flowPart110:setName("flowPart110");

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.flowPart110);
    obj.horzLine12:setName("horzLine12");
    obj.horzLine12:setStrokeColor("#424242");
    obj.horzLine12:setMargins({top=7});
    obj.horzLine12:setAlign("top");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layNote);
    obj.richEdit1:setField("Notes");
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setMargins({top=10, bottom=40, right=40, left=40});
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#272727");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.flowPart111 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart111:setParent(obj.flowLayout1);
    obj.flowPart111:setAlign("top");
    obj.flowPart111:setHeight(1620);
    obj.flowPart111:setMinWidth(30);
    obj.flowPart111:setMaxWidth(50);
    obj.flowPart111:setName("flowPart111");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.flowPart111);
    obj.image6:setAlign("client");
    obj.image6:setStyle("proportional");
    obj.image6:setURL("/images/right-arrow.png");
    obj.image6:setHitTest(true);
    obj.image6:setCursor("handPoint");
    obj.image6:setHint("Trocar de Aba");
    obj.image6:setName("image6");

    obj._e_event0 = obj.image2:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return end; TrocarAba('E');
        end, obj);

    obj._e_event1 = obj.nomeCheck01_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck01_01 = not sheet.fldCheck01_01;
            				
            				if(sheet.fldCheck01_02) then 
            					sheet.fldCheck01_01 = true; 
            					sheet.fldCheck01_02 = false; 
            					sheet.fldCheck01_03 = false; 
            					sheet.fldCheck01_04 = false; 
            					sheet.fldCheck01_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event2 = obj.nomeCheck01_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck01_02 = not sheet.fldCheck01_02;
            				
            				if(sheet.fldCheck01_02) then 
            					sheet.fldCheck01_01 = true; 
            				else 
            					sheet.fldCheck01_01 = false;
            				end;
            				
            				if(sheet.fldCheck01_03) then 
            					sheet.fldCheck01_01 = true; 
            					sheet.fldCheck01_02 = true; 
            					sheet.fldCheck01_03 = false; 
            					sheet.fldCheck01_04 = false; 
            					sheet.fldCheck01_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event3 = obj.nomeCheck01_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck01_03 = not sheet.fldCheck01_03;
            				
            				if(sheet.fldCheck01_03) then 
            					sheet.fldCheck01_01 = true; 
            					sheet.fldCheck01_02 = true; 
            				else 
            					sheet.fldCheck01_01 = false; 
            					sheet.fldCheck01_02 = false; 
            				end;
            				
            				if(sheet.fldCheck01_04) then 
            					sheet.fldCheck01_01 = true; 
            					sheet.fldCheck01_02 = true; 
            					sheet.fldCheck01_03 = true; 
            					sheet.fldCheck01_04 = false; 
            					sheet.fldCheck01_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event4 = obj.nomeCheck01_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck01_04 = not sheet.fldCheck01_04;
            				
            				if(sheet.fldCheck01_04) then 
            					sheet.fldCheck01_01 = true; 
            					sheet.fldCheck01_02 = true; 
            					sheet.fldCheck01_03 = true; 
            				else 
            					sheet.fldCheck01_01 = false; 
            					sheet.fldCheck01_02 = false; 
            					sheet.fldCheck01_03 = false; 
            				end;
            				
            				if(sheet.fldCheck01_05) then 
            					sheet.fldCheck01_01 = true; 
            					sheet.fldCheck01_02 = true; 
            					sheet.fldCheck01_03 = true; 
            					sheet.fldCheck01_04 = true; 
            					sheet.fldCheck01_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event5 = obj.nomeCheck01_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck01_05 = not sheet.fldCheck01_05;
            				
            				if(sheet.fldCheck01_05) then 
            					sheet.fldCheck01_01 = true; 
            					sheet.fldCheck01_02 = true; 
            					sheet.fldCheck01_03 = true; 
            					sheet.fldCheck01_04 = true; 
            				else 
            					sheet.fldCheck01_01 = false; 
            					sheet.fldCheck01_02 = false; 
            					sheet.fldCheck01_03 = false; 
            					sheet.fldCheck01_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event6 = obj.nomeCheck02_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck02_01 = not sheet.fldCheck02_01;
            				
            				if(sheet.fldCheck02_02) then 
            					sheet.fldCheck02_01 = true; 
            					sheet.fldCheck02_02 = false; 
            					sheet.fldCheck02_03 = false; 
            					sheet.fldCheck02_04 = false; 
            					sheet.fldCheck02_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event7 = obj.nomeCheck02_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck02_02 = not sheet.fldCheck02_02;
            				
            				if(sheet.fldCheck02_02) then 
            					sheet.fldCheck02_01 = true; 
            				else 
            					sheet.fldCheck02_01 = false;
            				end;
            				
            				if(sheet.fldCheck02_03) then 
            					sheet.fldCheck02_01 = true; 
            					sheet.fldCheck02_02 = true; 
            					sheet.fldCheck02_03 = false; 
            					sheet.fldCheck02_04 = false; 
            					sheet.fldCheck02_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event8 = obj.nomeCheck02_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck02_03 = not sheet.fldCheck02_03;
            				
            				if(sheet.fldCheck02_03) then 
            					sheet.fldCheck02_01 = true; 
            					sheet.fldCheck02_02 = true; 
            				else 
            					sheet.fldCheck02_01 = false; 
            					sheet.fldCheck02_02 = false; 
            				end;
            				
            				if(sheet.fldCheck02_04) then 
            					sheet.fldCheck02_01 = true; 
            					sheet.fldCheck02_02 = true; 
            					sheet.fldCheck02_03 = true; 
            					sheet.fldCheck02_04 = false; 
            					sheet.fldCheck02_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event9 = obj.nomeCheck02_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck02_04 = not sheet.fldCheck02_04;
            				
            				if(sheet.fldCheck02_04) then 
            					sheet.fldCheck02_01 = true; 
            					sheet.fldCheck02_02 = true; 
            					sheet.fldCheck02_03 = true; 
            				else 
            					sheet.fldCheck02_01 = false; 
            					sheet.fldCheck02_02 = false; 
            					sheet.fldCheck02_03 = false; 
            				end;
            				
            				if(sheet.fldCheck02_05) then 
            					sheet.fldCheck02_01 = true; 
            					sheet.fldCheck02_02 = true; 
            					sheet.fldCheck02_03 = true; 
            					sheet.fldCheck02_04 = true; 
            					sheet.fldCheck02_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event10 = obj.nomeCheck02_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck02_05 = not sheet.fldCheck02_05;
            				
            				if(sheet.fldCheck02_05) then 
            					sheet.fldCheck02_01 = true; 
            					sheet.fldCheck02_02 = true; 
            					sheet.fldCheck02_03 = true; 
            					sheet.fldCheck02_04 = true; 
            				else 
            					sheet.fldCheck02_01 = false; 
            					sheet.fldCheck02_02 = false; 
            					sheet.fldCheck02_03 = false; 
            					sheet.fldCheck02_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event11 = obj.nomeCheck03_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck03_01 = not sheet.fldCheck03_01;
            				
            				if(sheet.fldCheck03_02) then 
            					sheet.fldCheck03_01 = true; 
            					sheet.fldCheck03_02 = false; 
            					sheet.fldCheck03_03 = false; 
            					sheet.fldCheck03_04 = false; 
            					sheet.fldCheck03_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event12 = obj.nomeCheck03_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck03_02 = not sheet.fldCheck03_02;
            				
            				if(sheet.fldCheck03_02) then 
            					sheet.fldCheck03_01 = true; 
            				else 
            					sheet.fldCheck03_01 = false;
            				end;
            				
            				if(sheet.fldCheck03_03) then 
            					sheet.fldCheck03_01 = true; 
            					sheet.fldCheck03_02 = true; 
            					sheet.fldCheck03_03 = false; 
            					sheet.fldCheck03_04 = false; 
            					sheet.fldCheck03_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event13 = obj.nomeCheck03_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck03_03 = not sheet.fldCheck03_03;
            				
            				if(sheet.fldCheck03_03) then 
            					sheet.fldCheck03_01 = true; 
            					sheet.fldCheck03_02 = true; 
            				else 
            					sheet.fldCheck03_01 = false; 
            					sheet.fldCheck03_02 = false; 
            				end;
            				
            				if(sheet.fldCheck03_04) then 
            					sheet.fldCheck03_01 = true; 
            					sheet.fldCheck03_02 = true; 
            					sheet.fldCheck03_03 = true; 
            					sheet.fldCheck03_04 = false; 
            					sheet.fldCheck03_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event14 = obj.nomeCheck03_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck03_04 = not sheet.fldCheck03_04;
            				
            				if(sheet.fldCheck03_04) then 
            					sheet.fldCheck03_01 = true; 
            					sheet.fldCheck03_02 = true; 
            					sheet.fldCheck03_03 = true; 
            				else 
            					sheet.fldCheck03_01 = false; 
            					sheet.fldCheck03_02 = false; 
            					sheet.fldCheck03_03 = false; 
            				end;
            				
            				if(sheet.fldCheck03_05) then 
            					sheet.fldCheck03_01 = true; 
            					sheet.fldCheck03_02 = true; 
            					sheet.fldCheck03_03 = true; 
            					sheet.fldCheck03_04 = true; 
            					sheet.fldCheck03_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event15 = obj.nomeCheck03_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck03_05 = not sheet.fldCheck03_05;
            				
            				if(sheet.fldCheck03_05) then 
            					sheet.fldCheck03_01 = true; 
            					sheet.fldCheck03_02 = true; 
            					sheet.fldCheck03_03 = true; 
            					sheet.fldCheck03_04 = true; 
            				else 
            					sheet.fldCheck03_01 = false; 
            					sheet.fldCheck03_02 = false; 
            					sheet.fldCheck03_03 = false; 
            					sheet.fldCheck03_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event16 = obj.nomeCheck04_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck04_01 = not sheet.fldCheck04_01;
            				
            				if(sheet.fldCheck04_02) then 
            					sheet.fldCheck04_01 = true; 
            					sheet.fldCheck04_02 = false; 
            					sheet.fldCheck04_03 = false; 
            					sheet.fldCheck04_04 = false; 
            					sheet.fldCheck04_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event17 = obj.nomeCheck04_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck04_02 = not sheet.fldCheck04_02;
            				
            				if(sheet.fldCheck04_02) then 
            					sheet.fldCheck04_01 = true; 
            				else 
            					sheet.fldCheck04_01 = false;
            				end;
            				
            				if(sheet.fldCheck04_03) then 
            					sheet.fldCheck04_01 = true; 
            					sheet.fldCheck04_02 = true; 
            					sheet.fldCheck04_03 = false; 
            					sheet.fldCheck04_04 = false; 
            					sheet.fldCheck04_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event18 = obj.nomeCheck04_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck04_03 = not sheet.fldCheck04_03;
            				
            				if(sheet.fldCheck04_03) then 
            					sheet.fldCheck04_01 = true; 
            					sheet.fldCheck04_02 = true; 
            				else 
            					sheet.fldCheck04_01 = false; 
            					sheet.fldCheck04_02 = false; 
            				end;
            				
            				if(sheet.fldCheck04_04) then 
            					sheet.fldCheck04_01 = true; 
            					sheet.fldCheck04_02 = true; 
            					sheet.fldCheck04_03 = true; 
            					sheet.fldCheck04_04 = false; 
            					sheet.fldCheck04_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event19 = obj.nomeCheck04_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck04_04 = not sheet.fldCheck04_04;
            				
            				if(sheet.fldCheck04_04) then 
            					sheet.fldCheck04_01 = true; 
            					sheet.fldCheck04_02 = true; 
            					sheet.fldCheck04_03 = true; 
            				else 
            					sheet.fldCheck04_01 = false; 
            					sheet.fldCheck04_02 = false; 
            					sheet.fldCheck04_03 = false; 
            				end;
            				
            				if(sheet.fldCheck04_05) then 
            					sheet.fldCheck04_01 = true; 
            					sheet.fldCheck04_02 = true; 
            					sheet.fldCheck04_03 = true; 
            					sheet.fldCheck04_04 = true; 
            					sheet.fldCheck04_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event20 = obj.nomeCheck04_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck04_05 = not sheet.fldCheck04_05;
            				
            				if(sheet.fldCheck04_05) then 
            					sheet.fldCheck04_01 = true; 
            					sheet.fldCheck04_02 = true; 
            					sheet.fldCheck04_03 = true; 
            					sheet.fldCheck04_04 = true; 
            				else 
            					sheet.fldCheck04_01 = false; 
            					sheet.fldCheck04_02 = false; 
            					sheet.fldCheck04_03 = false; 
            					sheet.fldCheck04_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event21 = obj.nomeCheck05_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck05_01 = not sheet.fldCheck05_01;
            				
            				if(sheet.fldCheck05_02) then 
            					sheet.fldCheck05_01 = true; 
            					sheet.fldCheck05_02 = false; 
            					sheet.fldCheck05_03 = false; 
            					sheet.fldCheck05_04 = false; 
            					sheet.fldCheck05_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event22 = obj.nomeCheck05_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck05_02 = not sheet.fldCheck05_02;
            				
            				if(sheet.fldCheck05_02) then 
            					sheet.fldCheck05_01 = true; 
            				else 
            					sheet.fldCheck05_01 = false;
            				end;
            				
            				if(sheet.fldCheck05_03) then 
            					sheet.fldCheck05_01 = true; 
            					sheet.fldCheck05_02 = true; 
            					sheet.fldCheck05_03 = false; 
            					sheet.fldCheck05_04 = false; 
            					sheet.fldCheck05_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event23 = obj.nomeCheck05_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck05_03 = not sheet.fldCheck05_03;
            				
            				if(sheet.fldCheck05_03) then 
            					sheet.fldCheck05_01 = true; 
            					sheet.fldCheck05_02 = true; 
            				else 
            					sheet.fldCheck05_01 = false; 
            					sheet.fldCheck05_02 = false; 
            				end;
            				
            				if(sheet.fldCheck05_04) then 
            					sheet.fldCheck05_01 = true; 
            					sheet.fldCheck05_02 = true; 
            					sheet.fldCheck05_03 = true; 
            					sheet.fldCheck05_04 = false; 
            					sheet.fldCheck05_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event24 = obj.nomeCheck05_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck05_04 = not sheet.fldCheck05_04;
            				
            				if(sheet.fldCheck05_04) then 
            					sheet.fldCheck05_01 = true; 
            					sheet.fldCheck05_02 = true; 
            					sheet.fldCheck05_03 = true; 
            				else 
            					sheet.fldCheck05_01 = false; 
            					sheet.fldCheck05_02 = false; 
            					sheet.fldCheck05_03 = false; 
            				end;
            				
            				if(sheet.fldCheck05_05) then 
            					sheet.fldCheck05_01 = true; 
            					sheet.fldCheck05_02 = true; 
            					sheet.fldCheck05_03 = true; 
            					sheet.fldCheck05_04 = true; 
            					sheet.fldCheck05_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event25 = obj.nomeCheck05_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck05_05 = not sheet.fldCheck05_05;
            				
            				if(sheet.fldCheck05_05) then 
            					sheet.fldCheck05_01 = true; 
            					sheet.fldCheck05_02 = true; 
            					sheet.fldCheck05_03 = true; 
            					sheet.fldCheck05_04 = true; 
            				else 
            					sheet.fldCheck05_01 = false; 
            					sheet.fldCheck05_02 = false; 
            					sheet.fldCheck05_03 = false; 
            					sheet.fldCheck05_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event26 = obj.nomeCheck06_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck06_01 = not sheet.fldCheck06_01;
            				
            				if(sheet.fldCheck06_02) then 
            					sheet.fldCheck06_01 = true; 
            					sheet.fldCheck06_02 = false; 
            					sheet.fldCheck06_03 = false; 
            					sheet.fldCheck06_04 = false; 
            					sheet.fldCheck06_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event27 = obj.nomeCheck06_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck06_02 = not sheet.fldCheck06_02;
            				
            				if(sheet.fldCheck06_02) then 
            					sheet.fldCheck06_01 = true; 
            				else 
            					sheet.fldCheck06_01 = false;
            				end;
            				
            				if(sheet.fldCheck06_03) then 
            					sheet.fldCheck06_01 = true; 
            					sheet.fldCheck06_02 = true; 
            					sheet.fldCheck06_03 = false; 
            					sheet.fldCheck06_04 = false; 
            					sheet.fldCheck06_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event28 = obj.nomeCheck06_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck06_03 = not sheet.fldCheck06_03;
            				
            				if(sheet.fldCheck06_03) then 
            					sheet.fldCheck06_01 = true; 
            					sheet.fldCheck06_02 = true; 
            				else 
            					sheet.fldCheck06_01 = false; 
            					sheet.fldCheck06_02 = false; 
            				end;
            				
            				if(sheet.fldCheck06_04) then 
            					sheet.fldCheck06_01 = true; 
            					sheet.fldCheck06_02 = true; 
            					sheet.fldCheck06_03 = true; 
            					sheet.fldCheck06_04 = false; 
            					sheet.fldCheck06_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event29 = obj.nomeCheck06_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck06_04 = not sheet.fldCheck06_04;
            				
            				if(sheet.fldCheck06_04) then 
            					sheet.fldCheck06_01 = true; 
            					sheet.fldCheck06_02 = true; 
            					sheet.fldCheck06_03 = true; 
            				else 
            					sheet.fldCheck06_01 = false; 
            					sheet.fldCheck06_02 = false; 
            					sheet.fldCheck06_03 = false; 
            				end;
            				
            				if(sheet.fldCheck06_05) then 
            					sheet.fldCheck06_01 = true; 
            					sheet.fldCheck06_02 = true; 
            					sheet.fldCheck06_03 = true; 
            					sheet.fldCheck06_04 = true; 
            					sheet.fldCheck06_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event30 = obj.nomeCheck06_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck06_05 = not sheet.fldCheck06_05;
            				
            				if(sheet.fldCheck06_05) then 
            					sheet.fldCheck06_01 = true; 
            					sheet.fldCheck06_02 = true; 
            					sheet.fldCheck06_03 = true; 
            					sheet.fldCheck06_04 = true; 
            				else 
            					sheet.fldCheck06_01 = false; 
            					sheet.fldCheck06_02 = false; 
            					sheet.fldCheck06_03 = false; 
            					sheet.fldCheck06_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event31 = obj.nomeCheck07_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck07_01 = not sheet.fldCheck07_01;
            				
            				if(sheet.fldCheck07_02) then 
            					sheet.fldCheck07_01 = true; 
            					sheet.fldCheck07_02 = false; 
            					sheet.fldCheck07_03 = false; 
            					sheet.fldCheck07_04 = false; 
            					sheet.fldCheck07_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event32 = obj.nomeCheck07_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck07_02 = not sheet.fldCheck07_02;
            				
            				if(sheet.fldCheck07_02) then 
            					sheet.fldCheck07_01 = true; 
            				else 
            					sheet.fldCheck07_01 = false;
            				end;
            				
            				if(sheet.fldCheck07_03) then 
            					sheet.fldCheck07_01 = true; 
            					sheet.fldCheck07_02 = true; 
            					sheet.fldCheck07_03 = false; 
            					sheet.fldCheck07_04 = false; 
            					sheet.fldCheck07_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event33 = obj.nomeCheck07_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck07_03 = not sheet.fldCheck07_03;
            				
            				if(sheet.fldCheck07_03) then 
            					sheet.fldCheck07_01 = true; 
            					sheet.fldCheck07_02 = true; 
            				else 
            					sheet.fldCheck07_01 = false; 
            					sheet.fldCheck07_02 = false; 
            				end;
            				
            				if(sheet.fldCheck07_04) then 
            					sheet.fldCheck07_01 = true; 
            					sheet.fldCheck07_02 = true; 
            					sheet.fldCheck07_03 = true; 
            					sheet.fldCheck07_04 = false; 
            					sheet.fldCheck07_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event34 = obj.nomeCheck07_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck07_04 = not sheet.fldCheck07_04;
            				
            				if(sheet.fldCheck07_04) then 
            					sheet.fldCheck07_01 = true; 
            					sheet.fldCheck07_02 = true; 
            					sheet.fldCheck07_03 = true; 
            				else 
            					sheet.fldCheck07_01 = false; 
            					sheet.fldCheck07_02 = false; 
            					sheet.fldCheck07_03 = false; 
            				end;
            				
            				if(sheet.fldCheck07_05) then 
            					sheet.fldCheck07_01 = true; 
            					sheet.fldCheck07_02 = true; 
            					sheet.fldCheck07_03 = true; 
            					sheet.fldCheck07_04 = true; 
            					sheet.fldCheck07_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event35 = obj.nomeCheck07_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck07_05 = not sheet.fldCheck07_05;
            				
            				if(sheet.fldCheck07_05) then 
            					sheet.fldCheck07_01 = true; 
            					sheet.fldCheck07_02 = true; 
            					sheet.fldCheck07_03 = true; 
            					sheet.fldCheck07_04 = true; 
            				else 
            					sheet.fldCheck07_01 = false; 
            					sheet.fldCheck07_02 = false; 
            					sheet.fldCheck07_03 = false; 
            					sheet.fldCheck07_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event36 = obj.nomeCheck08_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck08_01 = not sheet.fldCheck08_01;
            				
            				if(sheet.fldCheck08_02) then 
            					sheet.fldCheck08_01 = true; 
            					sheet.fldCheck08_02 = false; 
            					sheet.fldCheck08_03 = false; 
            					sheet.fldCheck08_04 = false; 
            					sheet.fldCheck08_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event37 = obj.nomeCheck08_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck08_02 = not sheet.fldCheck08_02;
            				
            				if(sheet.fldCheck08_02) then 
            					sheet.fldCheck08_01 = true; 
            				else 
            					sheet.fldCheck08_01 = false;
            				end;
            				
            				if(sheet.fldCheck08_03) then 
            					sheet.fldCheck08_01 = true; 
            					sheet.fldCheck08_02 = true; 
            					sheet.fldCheck08_03 = false; 
            					sheet.fldCheck08_04 = false; 
            					sheet.fldCheck08_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event38 = obj.nomeCheck08_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck08_03 = not sheet.fldCheck08_03;
            				
            				if(sheet.fldCheck08_03) then 
            					sheet.fldCheck08_01 = true; 
            					sheet.fldCheck08_02 = true; 
            				else 
            					sheet.fldCheck08_01 = false; 
            					sheet.fldCheck08_02 = false; 
            				end;
            				
            				if(sheet.fldCheck08_04) then 
            					sheet.fldCheck08_01 = true; 
            					sheet.fldCheck08_02 = true; 
            					sheet.fldCheck08_03 = true; 
            					sheet.fldCheck08_04 = false; 
            					sheet.fldCheck08_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event39 = obj.nomeCheck08_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck08_04 = not sheet.fldCheck08_04;
            				
            				if(sheet.fldCheck08_04) then 
            					sheet.fldCheck08_01 = true; 
            					sheet.fldCheck08_02 = true; 
            					sheet.fldCheck08_03 = true; 
            				else 
            					sheet.fldCheck08_01 = false; 
            					sheet.fldCheck08_02 = false; 
            					sheet.fldCheck08_03 = false; 
            				end;
            				
            				if(sheet.fldCheck08_05) then 
            					sheet.fldCheck08_01 = true; 
            					sheet.fldCheck08_02 = true; 
            					sheet.fldCheck08_03 = true; 
            					sheet.fldCheck08_04 = true; 
            					sheet.fldCheck08_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event40 = obj.nomeCheck08_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck08_05 = not sheet.fldCheck08_05;
            				
            				if(sheet.fldCheck08_05) then 
            					sheet.fldCheck08_01 = true; 
            					sheet.fldCheck08_02 = true; 
            					sheet.fldCheck08_03 = true; 
            					sheet.fldCheck08_04 = true; 
            				else 
            					sheet.fldCheck08_01 = false; 
            					sheet.fldCheck08_02 = false; 
            					sheet.fldCheck08_03 = false; 
            					sheet.fldCheck08_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event41 = obj.nomeCheck09_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck09_01 = not sheet.fldCheck09_01;
            				
            				if(sheet.fldCheck09_02) then 
            					sheet.fldCheck09_01 = true; 
            					sheet.fldCheck09_02 = false; 
            					sheet.fldCheck09_03 = false; 
            					sheet.fldCheck09_04 = false; 
            					sheet.fldCheck09_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event42 = obj.nomeCheck09_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck09_02 = not sheet.fldCheck09_02;
            				
            				if(sheet.fldCheck09_02) then 
            					sheet.fldCheck09_01 = true; 
            				else 
            					sheet.fldCheck09_01 = false;
            				end;
            				
            				if(sheet.fldCheck09_03) then 
            					sheet.fldCheck09_01 = true; 
            					sheet.fldCheck09_02 = true; 
            					sheet.fldCheck09_03 = false; 
            					sheet.fldCheck09_04 = false; 
            					sheet.fldCheck09_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event43 = obj.nomeCheck09_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck09_03 = not sheet.fldCheck09_03;
            				
            				if(sheet.fldCheck09_03) then 
            					sheet.fldCheck09_01 = true; 
            					sheet.fldCheck09_02 = true; 
            				else 
            					sheet.fldCheck09_01 = false; 
            					sheet.fldCheck09_02 = false; 
            				end;
            				
            				if(sheet.fldCheck09_04) then 
            					sheet.fldCheck09_01 = true; 
            					sheet.fldCheck09_02 = true; 
            					sheet.fldCheck09_03 = true; 
            					sheet.fldCheck09_04 = false; 
            					sheet.fldCheck09_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event44 = obj.nomeCheck09_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck09_04 = not sheet.fldCheck09_04;
            				
            				if(sheet.fldCheck09_04) then 
            					sheet.fldCheck09_01 = true; 
            					sheet.fldCheck09_02 = true; 
            					sheet.fldCheck09_03 = true; 
            				else 
            					sheet.fldCheck09_01 = false; 
            					sheet.fldCheck09_02 = false; 
            					sheet.fldCheck09_03 = false; 
            				end;
            				
            				if(sheet.fldCheck09_05) then 
            					sheet.fldCheck09_01 = true; 
            					sheet.fldCheck09_02 = true; 
            					sheet.fldCheck09_03 = true; 
            					sheet.fldCheck09_04 = true; 
            					sheet.fldCheck09_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event45 = obj.nomeCheck09_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck09_05 = not sheet.fldCheck09_05;
            				
            				if(sheet.fldCheck09_05) then 
            					sheet.fldCheck09_01 = true; 
            					sheet.fldCheck09_02 = true; 
            					sheet.fldCheck09_03 = true; 
            					sheet.fldCheck09_04 = true; 
            				else 
            					sheet.fldCheck09_01 = false; 
            					sheet.fldCheck09_02 = false; 
            					sheet.fldCheck09_03 = false; 
            					sheet.fldCheck09_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event46 = obj.checkMulVit_Des_01_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_01_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_01_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_01_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_01_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_01_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_01_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event47 = obj.checkMulVit_Des_02_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_02_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_02_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_02_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_02_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_02_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_02_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event48 = obj.checkMulVit_Des_03_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_03_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_03_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_03_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_03_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_03_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_03_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event49 = obj.checkMulVit_Des_04_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_04_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_04_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_04_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_04_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_04_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_04_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event50 = obj.checkMulVit_Des_05_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_05_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_05_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_05_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_05_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_05_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_05_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event51 = obj.checkMulVit_Des_06_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_06_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_06_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_06_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_06_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_06_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_06_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event52 = obj.checkMulVit_Des_07_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_07_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_07_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_07_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_07_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_07_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_07_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event53 = obj.checkMulVit_Des_08_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_08_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_08_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_08_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_08_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_08_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_08_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event54 = obj.checkMulVit_Des_09_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_09_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_09_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_09_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_09_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_09_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_09_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event55 = obj.checkMulVit_Des_10_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_10_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_10_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_10_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_10_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_10_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_10_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event56 = obj.checkMulVit_Des_11_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_11_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_11_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_11_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_11_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_11_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_11_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event57 = obj.checkMulVit_Des_12_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_12_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_12_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_12_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_12_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_12_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_12_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event58 = obj.checkMulVit_Des_13_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_13_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_13_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_13_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_13_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_13_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_13_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event59 = obj.checkMulVit_Des_14_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_14_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_14_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_14_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_14_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_14_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_14_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event60 = obj.checkMulVit_Des_15_Vit:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_15_Vit == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_15_Vit = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_15_Vit == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_15_Vit = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_15_Vit == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_15_Vit = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event61 = obj.checkMulVit_Des_01_Hum:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_01_Hum == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_01_Hum = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_01_Hum == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_01_Hum = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_01_Hum == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_01_Hum = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event62 = obj.checkMulVit_Des_02_Hum:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_02_Hum == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_02_Hum = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_02_Hum == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_02_Hum = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_02_Hum == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_02_Hum = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event63 = obj.checkMulVit_Des_03_Hum:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_03_Hum == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_03_Hum = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_03_Hum == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_03_Hum = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_03_Hum == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_03_Hum = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event64 = obj.checkMulVit_Des_04_Hum:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_04_Hum == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_04_Hum = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_04_Hum == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_04_Hum = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_04_Hum == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_04_Hum = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event65 = obj.checkMulVit_Des_05_Hum:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_05_Hum == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_05_Hum = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_05_Hum == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_05_Hum = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_05_Hum == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_05_Hum = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event66 = obj.checkMulVit_Des_06_Hum:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_06_Hum == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_06_Hum = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_06_Hum == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_06_Hum = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_06_Hum == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_06_Hum = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event67 = obj.checkMulVit_Des_07_Hum:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_07_Hum == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_07_Hum = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_07_Hum == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_07_Hum = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_07_Hum == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_07_Hum = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event68 = obj.checkMulVit_Des_08_Hum:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_08_Hum == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_08_Hum = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_08_Hum == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_08_Hum = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_08_Hum == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_08_Hum = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event69 = obj.checkMulVit_Des_09_Hum:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_09_Hum == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_09_Hum = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_09_Hum == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_09_Hum = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_09_Hum == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_09_Hum = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event70 = obj.checkMulVit_Des_10_Hum:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_10_Hum == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_10_Hum = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_10_Hum == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_10_Hum = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_10_Hum == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_10_Hum = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event71 = obj.checkMulVit_Des_01_FdV:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_01_FdV == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_01_FdV = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_01_FdV == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_01_FdV = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_01_FdV == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_01_FdV = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event72 = obj.checkMulVit_Des_02_FdV:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_02_FdV == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_02_FdV = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_02_FdV == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_02_FdV = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_02_FdV == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_02_FdV = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event73 = obj.checkMulVit_Des_03_FdV:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_03_FdV == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_03_FdV = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_03_FdV == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_03_FdV = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_03_FdV == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_03_FdV = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event74 = obj.checkMulVit_Des_04_FdV:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_04_FdV == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_04_FdV = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_04_FdV == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_04_FdV = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_04_FdV == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_04_FdV = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event75 = obj.checkMulVit_Des_05_FdV:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_05_FdV == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_05_FdV = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_05_FdV == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_05_FdV = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_05_FdV == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_05_FdV = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event76 = obj.checkMulVit_Des_06_FdV:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_06_FdV == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_06_FdV = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_06_FdV == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_06_FdV = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_06_FdV == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_06_FdV = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event77 = obj.checkMulVit_Des_07_FdV:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_07_FdV == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_07_FdV = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_07_FdV == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_07_FdV = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_07_FdV == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_07_FdV = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event78 = obj.checkMulVit_Des_08_FdV:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_08_FdV == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_08_FdV = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_08_FdV == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_08_FdV = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_08_FdV == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_08_FdV = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event79 = obj.checkMulVit_Des_09_FdV:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_09_FdV == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_09_FdV = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_09_FdV == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_09_FdV = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_09_FdV == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_09_FdV = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event80 = obj.checkMulVit_Des_10_FdV:addEventListener("onClick",
        function (_)
            
            				if(sheet.checkMulVit_Des_10_FdV == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_10_FdV = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_10_FdV == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_10_FdV = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_10_FdV == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_10_FdV = '/images/checkBoxDes.png';
            				end;
            			
        end, obj);

    obj._e_event81 = obj.nomeBut10:addEventListener("onClick",
        function (_)
            self.popUp_10:show('right', self.nomeBut10);
        end, obj);

    obj._e_event82 = obj.nomeBut10B:addEventListener("onClick",
        function (_)
            self.popUp_10:show('right', self.nomeBut10);
        end, obj);

    obj._e_event83 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase10 == nil or sheet.fldEnfase10 == "Ênfases") then
            										self.nomeBut10.visible = true;
            										self.nomeBut10B.visible = false;
            									else
            										self.nomeBut10B.visible = true;
            										self.nomeBut10.visible = false;
            									end;
        end, obj);

    obj._e_event84 = obj.nomeCheck10_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck10_01 = not sheet.fldCheck10_01;
            				
            				if(sheet.fldCheck10_02) then 
            					sheet.fldCheck10_01 = true; 
            					sheet.fldCheck10_02 = false; 
            					sheet.fldCheck10_03 = false; 
            					sheet.fldCheck10_04 = false; 
            					sheet.fldCheck10_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event85 = obj.nomeCheck10_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck10_02 = not sheet.fldCheck10_02;
            				
            				if(sheet.fldCheck10_02) then 
            					sheet.fldCheck10_01 = true; 
            				else 
            					sheet.fldCheck10_01 = false;
            				end;
            				
            				if(sheet.fldCheck10_03) then 
            					sheet.fldCheck10_01 = true; 
            					sheet.fldCheck10_02 = true; 
            					sheet.fldCheck10_03 = false; 
            					sheet.fldCheck10_04 = false; 
            					sheet.fldCheck10_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event86 = obj.nomeCheck10_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck10_03 = not sheet.fldCheck10_03;
            				
            				if(sheet.fldCheck10_03) then 
            					sheet.fldCheck10_01 = true; 
            					sheet.fldCheck10_02 = true; 
            				else 
            					sheet.fldCheck10_01 = false; 
            					sheet.fldCheck10_02 = false; 
            				end;
            				
            				if(sheet.fldCheck10_04) then 
            					sheet.fldCheck10_01 = true; 
            					sheet.fldCheck10_02 = true; 
            					sheet.fldCheck10_03 = true; 
            					sheet.fldCheck10_04 = false; 
            					sheet.fldCheck10_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event87 = obj.nomeCheck10_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck10_04 = not sheet.fldCheck10_04;
            				
            				if(sheet.fldCheck10_04) then 
            					sheet.fldCheck10_01 = true; 
            					sheet.fldCheck10_02 = true; 
            					sheet.fldCheck10_03 = true; 
            				else 
            					sheet.fldCheck10_01 = false; 
            					sheet.fldCheck10_02 = false; 
            					sheet.fldCheck10_03 = false; 
            				end;
            				
            				if(sheet.fldCheck10_05) then 
            					sheet.fldCheck10_01 = true; 
            					sheet.fldCheck10_02 = true; 
            					sheet.fldCheck10_03 = true; 
            					sheet.fldCheck10_04 = true; 
            					sheet.fldCheck10_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event88 = obj.nomeCheck10_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck10_05 = not sheet.fldCheck10_05;
            				
            				if(sheet.fldCheck10_05) then 
            					sheet.fldCheck10_01 = true; 
            					sheet.fldCheck10_02 = true; 
            					sheet.fldCheck10_03 = true; 
            					sheet.fldCheck10_04 = true; 
            				else 
            					sheet.fldCheck10_01 = false; 
            					sheet.fldCheck10_02 = false; 
            					sheet.fldCheck10_03 = false; 
            					sheet.fldCheck10_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event89 = obj.nomeBut11:addEventListener("onClick",
        function (_)
            self.popUp_11:show('right', self.nomeBut11);
        end, obj);

    obj._e_event90 = obj.nomeBut11B:addEventListener("onClick",
        function (_)
            self.popUp_11:show('right', self.nomeBut11);
        end, obj);

    obj._e_event91 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase11 == nil or sheet.fldEnfase11 == "Ênfases") then
            										self.nomeBut11.visible = true;
            										self.nomeBut11B.visible = false;
            									else
            										self.nomeBut11B.visible = true;
            										self.nomeBut11.visible = false;
            									end;
        end, obj);

    obj._e_event92 = obj.nomeCheck11_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck11_01 = not sheet.fldCheck11_01;
            				
            				if(sheet.fldCheck11_02) then 
            					sheet.fldCheck11_01 = true; 
            					sheet.fldCheck11_02 = false; 
            					sheet.fldCheck11_03 = false; 
            					sheet.fldCheck11_04 = false; 
            					sheet.fldCheck11_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event93 = obj.nomeCheck11_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck11_02 = not sheet.fldCheck11_02;
            				
            				if(sheet.fldCheck11_02) then 
            					sheet.fldCheck11_01 = true; 
            				else 
            					sheet.fldCheck11_01 = false;
            				end;
            				
            				if(sheet.fldCheck11_03) then 
            					sheet.fldCheck11_01 = true; 
            					sheet.fldCheck11_02 = true; 
            					sheet.fldCheck11_03 = false; 
            					sheet.fldCheck11_04 = false; 
            					sheet.fldCheck11_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event94 = obj.nomeCheck11_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck11_03 = not sheet.fldCheck11_03;
            				
            				if(sheet.fldCheck11_03) then 
            					sheet.fldCheck11_01 = true; 
            					sheet.fldCheck11_02 = true; 
            				else 
            					sheet.fldCheck11_01 = false; 
            					sheet.fldCheck11_02 = false; 
            				end;
            				
            				if(sheet.fldCheck11_04) then 
            					sheet.fldCheck11_01 = true; 
            					sheet.fldCheck11_02 = true; 
            					sheet.fldCheck11_03 = true; 
            					sheet.fldCheck11_04 = false; 
            					sheet.fldCheck11_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event95 = obj.nomeCheck11_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck11_04 = not sheet.fldCheck11_04;
            				
            				if(sheet.fldCheck11_04) then 
            					sheet.fldCheck11_01 = true; 
            					sheet.fldCheck11_02 = true; 
            					sheet.fldCheck11_03 = true; 
            				else 
            					sheet.fldCheck11_01 = false; 
            					sheet.fldCheck11_02 = false; 
            					sheet.fldCheck11_03 = false; 
            				end;
            				
            				if(sheet.fldCheck11_05) then 
            					sheet.fldCheck11_01 = true; 
            					sheet.fldCheck11_02 = true; 
            					sheet.fldCheck11_03 = true; 
            					sheet.fldCheck11_04 = true; 
            					sheet.fldCheck11_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event96 = obj.nomeCheck11_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck11_05 = not sheet.fldCheck11_05;
            				
            				if(sheet.fldCheck11_05) then 
            					sheet.fldCheck11_01 = true; 
            					sheet.fldCheck11_02 = true; 
            					sheet.fldCheck11_03 = true; 
            					sheet.fldCheck11_04 = true; 
            				else 
            					sheet.fldCheck11_01 = false; 
            					sheet.fldCheck11_02 = false; 
            					sheet.fldCheck11_03 = false; 
            					sheet.fldCheck11_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event97 = obj.nomeBut12:addEventListener("onClick",
        function (_)
            self.popUp_12:show('right', self.nomeBut12);
        end, obj);

    obj._e_event98 = obj.nomeBut12B:addEventListener("onClick",
        function (_)
            self.popUp_12:show('right', self.nomeBut12);
        end, obj);

    obj._e_event99 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase12 == nil or sheet.fldEnfase12 == "Ênfases") then
            										self.nomeBut12.visible = true;
            										self.nomeBut12B.visible = false;
            									else
            										self.nomeBut12B.visible = true;
            										self.nomeBut12.visible = false;
            									end;
        end, obj);

    obj._e_event100 = obj.nomeCheck12_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck12_01 = not sheet.fldCheck12_01;
            				
            				if(sheet.fldCheck12_02) then 
            					sheet.fldCheck12_01 = true; 
            					sheet.fldCheck12_02 = false; 
            					sheet.fldCheck12_03 = false; 
            					sheet.fldCheck12_04 = false; 
            					sheet.fldCheck12_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event101 = obj.nomeCheck12_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck12_02 = not sheet.fldCheck12_02;
            				
            				if(sheet.fldCheck12_02) then 
            					sheet.fldCheck12_01 = true; 
            				else 
            					sheet.fldCheck12_01 = false;
            				end;
            				
            				if(sheet.fldCheck12_03) then 
            					sheet.fldCheck12_01 = true; 
            					sheet.fldCheck12_02 = true; 
            					sheet.fldCheck12_03 = false; 
            					sheet.fldCheck12_04 = false; 
            					sheet.fldCheck12_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event102 = obj.nomeCheck12_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck12_03 = not sheet.fldCheck12_03;
            				
            				if(sheet.fldCheck12_03) then 
            					sheet.fldCheck12_01 = true; 
            					sheet.fldCheck12_02 = true; 
            				else 
            					sheet.fldCheck12_01 = false; 
            					sheet.fldCheck12_02 = false; 
            				end;
            				
            				if(sheet.fldCheck12_04) then 
            					sheet.fldCheck12_01 = true; 
            					sheet.fldCheck12_02 = true; 
            					sheet.fldCheck12_03 = true; 
            					sheet.fldCheck12_04 = false; 
            					sheet.fldCheck12_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event103 = obj.nomeCheck12_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck12_04 = not sheet.fldCheck12_04;
            				
            				if(sheet.fldCheck12_04) then 
            					sheet.fldCheck12_01 = true; 
            					sheet.fldCheck12_02 = true; 
            					sheet.fldCheck12_03 = true; 
            				else 
            					sheet.fldCheck12_01 = false; 
            					sheet.fldCheck12_02 = false; 
            					sheet.fldCheck12_03 = false; 
            				end;
            				
            				if(sheet.fldCheck12_05) then 
            					sheet.fldCheck12_01 = true; 
            					sheet.fldCheck12_02 = true; 
            					sheet.fldCheck12_03 = true; 
            					sheet.fldCheck12_04 = true; 
            					sheet.fldCheck12_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event104 = obj.nomeCheck12_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck12_05 = not sheet.fldCheck12_05;
            				
            				if(sheet.fldCheck12_05) then 
            					sheet.fldCheck12_01 = true; 
            					sheet.fldCheck12_02 = true; 
            					sheet.fldCheck12_03 = true; 
            					sheet.fldCheck12_04 = true; 
            				else 
            					sheet.fldCheck12_01 = false; 
            					sheet.fldCheck12_02 = false; 
            					sheet.fldCheck12_03 = false; 
            					sheet.fldCheck12_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event105 = obj.nomeBut13:addEventListener("onClick",
        function (_)
            self.popUp_13:show('right', self.nomeBut13);
        end, obj);

    obj._e_event106 = obj.nomeBut13B:addEventListener("onClick",
        function (_)
            self.popUp_13:show('right', self.nomeBut13);
        end, obj);

    obj._e_event107 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase13 == nil or sheet.fldEnfase13 == "Ênfases") then
            										self.nomeBut13.visible = true;
            										self.nomeBut13B.visible = false;
            									else
            										self.nomeBut13B.visible = true;
            										self.nomeBut13.visible = false;
            									end;
        end, obj);

    obj._e_event108 = obj.nomeCheck13_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck13_01 = not sheet.fldCheck13_01;
            				
            				if(sheet.fldCheck13_02) then 
            					sheet.fldCheck13_01 = true; 
            					sheet.fldCheck13_02 = false; 
            					sheet.fldCheck13_03 = false; 
            					sheet.fldCheck13_04 = false; 
            					sheet.fldCheck13_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event109 = obj.nomeCheck13_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck13_02 = not sheet.fldCheck13_02;
            				
            				if(sheet.fldCheck13_02) then 
            					sheet.fldCheck13_01 = true; 
            				else 
            					sheet.fldCheck13_01 = false;
            				end;
            				
            				if(sheet.fldCheck13_03) then 
            					sheet.fldCheck13_01 = true; 
            					sheet.fldCheck13_02 = true; 
            					sheet.fldCheck13_03 = false; 
            					sheet.fldCheck13_04 = false; 
            					sheet.fldCheck13_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event110 = obj.nomeCheck13_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck13_03 = not sheet.fldCheck13_03;
            				
            				if(sheet.fldCheck13_03) then 
            					sheet.fldCheck13_01 = true; 
            					sheet.fldCheck13_02 = true; 
            				else 
            					sheet.fldCheck13_01 = false; 
            					sheet.fldCheck13_02 = false; 
            				end;
            				
            				if(sheet.fldCheck13_04) then 
            					sheet.fldCheck13_01 = true; 
            					sheet.fldCheck13_02 = true; 
            					sheet.fldCheck13_03 = true; 
            					sheet.fldCheck13_04 = false; 
            					sheet.fldCheck13_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event111 = obj.nomeCheck13_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck13_04 = not sheet.fldCheck13_04;
            				
            				if(sheet.fldCheck13_04) then 
            					sheet.fldCheck13_01 = true; 
            					sheet.fldCheck13_02 = true; 
            					sheet.fldCheck13_03 = true; 
            				else 
            					sheet.fldCheck13_01 = false; 
            					sheet.fldCheck13_02 = false; 
            					sheet.fldCheck13_03 = false; 
            				end;
            				
            				if(sheet.fldCheck13_05) then 
            					sheet.fldCheck13_01 = true; 
            					sheet.fldCheck13_02 = true; 
            					sheet.fldCheck13_03 = true; 
            					sheet.fldCheck13_04 = true; 
            					sheet.fldCheck13_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event112 = obj.nomeCheck13_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck13_05 = not sheet.fldCheck13_05;
            				
            				if(sheet.fldCheck13_05) then 
            					sheet.fldCheck13_01 = true; 
            					sheet.fldCheck13_02 = true; 
            					sheet.fldCheck13_03 = true; 
            					sheet.fldCheck13_04 = true; 
            				else 
            					sheet.fldCheck13_01 = false; 
            					sheet.fldCheck13_02 = false; 
            					sheet.fldCheck13_03 = false; 
            					sheet.fldCheck13_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event113 = obj.nomeBut14:addEventListener("onClick",
        function (_)
            self.popUp_14:show('right', self.nomeBut14);
        end, obj);

    obj._e_event114 = obj.nomeBut14B:addEventListener("onClick",
        function (_)
            self.popUp_14:show('right', self.nomeBut14);
        end, obj);

    obj._e_event115 = obj.dataLink40:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase14 == nil or sheet.fldEnfase14 == "Ênfases") then
            										self.nomeBut14.visible = true;
            										self.nomeBut14B.visible = false;
            									else
            										self.nomeBut14B.visible = true;
            										self.nomeBut14.visible = false;
            									end;
        end, obj);

    obj._e_event116 = obj.nomeCheck14_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck14_01 = not sheet.fldCheck14_01;
            				
            				if(sheet.fldCheck14_02) then 
            					sheet.fldCheck14_01 = true; 
            					sheet.fldCheck14_02 = false; 
            					sheet.fldCheck14_03 = false; 
            					sheet.fldCheck14_04 = false; 
            					sheet.fldCheck14_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event117 = obj.nomeCheck14_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck14_02 = not sheet.fldCheck14_02;
            				
            				if(sheet.fldCheck14_02) then 
            					sheet.fldCheck14_01 = true; 
            				else 
            					sheet.fldCheck14_01 = false;
            				end;
            				
            				if(sheet.fldCheck14_03) then 
            					sheet.fldCheck14_01 = true; 
            					sheet.fldCheck14_02 = true; 
            					sheet.fldCheck14_03 = false; 
            					sheet.fldCheck14_04 = false; 
            					sheet.fldCheck14_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event118 = obj.nomeCheck14_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck14_03 = not sheet.fldCheck14_03;
            				
            				if(sheet.fldCheck14_03) then 
            					sheet.fldCheck14_01 = true; 
            					sheet.fldCheck14_02 = true; 
            				else 
            					sheet.fldCheck14_01 = false; 
            					sheet.fldCheck14_02 = false; 
            				end;
            				
            				if(sheet.fldCheck14_04) then 
            					sheet.fldCheck14_01 = true; 
            					sheet.fldCheck14_02 = true; 
            					sheet.fldCheck14_03 = true; 
            					sheet.fldCheck14_04 = false; 
            					sheet.fldCheck14_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event119 = obj.nomeCheck14_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck14_04 = not sheet.fldCheck14_04;
            				
            				if(sheet.fldCheck14_04) then 
            					sheet.fldCheck14_01 = true; 
            					sheet.fldCheck14_02 = true; 
            					sheet.fldCheck14_03 = true; 
            				else 
            					sheet.fldCheck14_01 = false; 
            					sheet.fldCheck14_02 = false; 
            					sheet.fldCheck14_03 = false; 
            				end;
            				
            				if(sheet.fldCheck14_05) then 
            					sheet.fldCheck14_01 = true; 
            					sheet.fldCheck14_02 = true; 
            					sheet.fldCheck14_03 = true; 
            					sheet.fldCheck14_04 = true; 
            					sheet.fldCheck14_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event120 = obj.nomeCheck14_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck14_05 = not sheet.fldCheck14_05;
            				
            				if(sheet.fldCheck14_05) then 
            					sheet.fldCheck14_01 = true; 
            					sheet.fldCheck14_02 = true; 
            					sheet.fldCheck14_03 = true; 
            					sheet.fldCheck14_04 = true; 
            				else 
            					sheet.fldCheck14_01 = false; 
            					sheet.fldCheck14_02 = false; 
            					sheet.fldCheck14_03 = false; 
            					sheet.fldCheck14_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event121 = obj.nomeBut15:addEventListener("onClick",
        function (_)
            self.popUp_15:show('right', self.nomeBut15);
        end, obj);

    obj._e_event122 = obj.nomeBut15B:addEventListener("onClick",
        function (_)
            self.popUp_15:show('right', self.nomeBut15);
        end, obj);

    obj._e_event123 = obj.dataLink41:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase15 == nil or sheet.fldEnfase15 == "Ênfases") then
            										self.nomeBut15.visible = true;
            										self.nomeBut15B.visible = false;
            									else
            										self.nomeBut15B.visible = true;
            										self.nomeBut15.visible = false;
            									end;
        end, obj);

    obj._e_event124 = obj.nomeCheck15_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck15_01 = not sheet.fldCheck15_01;
            				
            				if(sheet.fldCheck15_02) then 
            					sheet.fldCheck15_01 = true; 
            					sheet.fldCheck15_02 = false; 
            					sheet.fldCheck15_03 = false; 
            					sheet.fldCheck15_04 = false; 
            					sheet.fldCheck15_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event125 = obj.nomeCheck15_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck15_02 = not sheet.fldCheck15_02;
            				
            				if(sheet.fldCheck15_02) then 
            					sheet.fldCheck15_01 = true; 
            				else 
            					sheet.fldCheck15_01 = false;
            				end;
            				
            				if(sheet.fldCheck15_03) then 
            					sheet.fldCheck15_01 = true; 
            					sheet.fldCheck15_02 = true; 
            					sheet.fldCheck15_03 = false; 
            					sheet.fldCheck15_04 = false; 
            					sheet.fldCheck15_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event126 = obj.nomeCheck15_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck15_03 = not sheet.fldCheck15_03;
            				
            				if(sheet.fldCheck15_03) then 
            					sheet.fldCheck15_01 = true; 
            					sheet.fldCheck15_02 = true; 
            				else 
            					sheet.fldCheck15_01 = false; 
            					sheet.fldCheck15_02 = false; 
            				end;
            				
            				if(sheet.fldCheck15_04) then 
            					sheet.fldCheck15_01 = true; 
            					sheet.fldCheck15_02 = true; 
            					sheet.fldCheck15_03 = true; 
            					sheet.fldCheck15_04 = false; 
            					sheet.fldCheck15_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event127 = obj.nomeCheck15_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck15_04 = not sheet.fldCheck15_04;
            				
            				if(sheet.fldCheck15_04) then 
            					sheet.fldCheck15_01 = true; 
            					sheet.fldCheck15_02 = true; 
            					sheet.fldCheck15_03 = true; 
            				else 
            					sheet.fldCheck15_01 = false; 
            					sheet.fldCheck15_02 = false; 
            					sheet.fldCheck15_03 = false; 
            				end;
            				
            				if(sheet.fldCheck15_05) then 
            					sheet.fldCheck15_01 = true; 
            					sheet.fldCheck15_02 = true; 
            					sheet.fldCheck15_03 = true; 
            					sheet.fldCheck15_04 = true; 
            					sheet.fldCheck15_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event128 = obj.nomeCheck15_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck15_05 = not sheet.fldCheck15_05;
            				
            				if(sheet.fldCheck15_05) then 
            					sheet.fldCheck15_01 = true; 
            					sheet.fldCheck15_02 = true; 
            					sheet.fldCheck15_03 = true; 
            					sheet.fldCheck15_04 = true; 
            				else 
            					sheet.fldCheck15_01 = false; 
            					sheet.fldCheck15_02 = false; 
            					sheet.fldCheck15_03 = false; 
            					sheet.fldCheck15_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event129 = obj.nomeBut16:addEventListener("onClick",
        function (_)
            self.popUp_16:show('right', self.nomeBut16);
        end, obj);

    obj._e_event130 = obj.nomeBut16B:addEventListener("onClick",
        function (_)
            self.popUp_16:show('right', self.nomeBut16);
        end, obj);

    obj._e_event131 = obj.dataLink42:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase16 == nil or sheet.fldEnfase16 == "Ênfases") then
            										self.nomeBut16.visible = true;
            										self.nomeBut16B.visible = false;
            									else
            										self.nomeBut16B.visible = true;
            										self.nomeBut16.visible = false;
            									end;
        end, obj);

    obj._e_event132 = obj.nomeCheck16_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck16_01 = not sheet.fldCheck16_01;
            				
            				if(sheet.fldCheck16_02) then 
            					sheet.fldCheck16_01 = true; 
            					sheet.fldCheck16_02 = false; 
            					sheet.fldCheck16_03 = false; 
            					sheet.fldCheck16_04 = false; 
            					sheet.fldCheck16_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event133 = obj.nomeCheck16_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck16_02 = not sheet.fldCheck16_02;
            				
            				if(sheet.fldCheck16_02) then 
            					sheet.fldCheck16_01 = true; 
            				else 
            					sheet.fldCheck16_01 = false;
            				end;
            				
            				if(sheet.fldCheck16_03) then 
            					sheet.fldCheck16_01 = true; 
            					sheet.fldCheck16_02 = true; 
            					sheet.fldCheck16_03 = false; 
            					sheet.fldCheck16_04 = false; 
            					sheet.fldCheck16_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event134 = obj.nomeCheck16_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck16_03 = not sheet.fldCheck16_03;
            				
            				if(sheet.fldCheck16_03) then 
            					sheet.fldCheck16_01 = true; 
            					sheet.fldCheck16_02 = true; 
            				else 
            					sheet.fldCheck16_01 = false; 
            					sheet.fldCheck16_02 = false; 
            				end;
            				
            				if(sheet.fldCheck16_04) then 
            					sheet.fldCheck16_01 = true; 
            					sheet.fldCheck16_02 = true; 
            					sheet.fldCheck16_03 = true; 
            					sheet.fldCheck16_04 = false; 
            					sheet.fldCheck16_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event135 = obj.nomeCheck16_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck16_04 = not sheet.fldCheck16_04;
            				
            				if(sheet.fldCheck16_04) then 
            					sheet.fldCheck16_01 = true; 
            					sheet.fldCheck16_02 = true; 
            					sheet.fldCheck16_03 = true; 
            				else 
            					sheet.fldCheck16_01 = false; 
            					sheet.fldCheck16_02 = false; 
            					sheet.fldCheck16_03 = false; 
            				end;
            				
            				if(sheet.fldCheck16_05) then 
            					sheet.fldCheck16_01 = true; 
            					sheet.fldCheck16_02 = true; 
            					sheet.fldCheck16_03 = true; 
            					sheet.fldCheck16_04 = true; 
            					sheet.fldCheck16_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event136 = obj.nomeCheck16_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck16_05 = not sheet.fldCheck16_05;
            				
            				if(sheet.fldCheck16_05) then 
            					sheet.fldCheck16_01 = true; 
            					sheet.fldCheck16_02 = true; 
            					sheet.fldCheck16_03 = true; 
            					sheet.fldCheck16_04 = true; 
            				else 
            					sheet.fldCheck16_01 = false; 
            					sheet.fldCheck16_02 = false; 
            					sheet.fldCheck16_03 = false; 
            					sheet.fldCheck16_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event137 = obj.nomeBut17:addEventListener("onClick",
        function (_)
            self.popUp_17:show('right', self.nomeBut17);
        end, obj);

    obj._e_event138 = obj.nomeBut17B:addEventListener("onClick",
        function (_)
            self.popUp_17:show('right', self.nomeBut17);
        end, obj);

    obj._e_event139 = obj.dataLink43:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase17 == nil or sheet.fldEnfase17 == "Ênfases") then
            										self.nomeBut17.visible = true;
            										self.nomeBut17B.visible = false;
            									else
            										self.nomeBut17B.visible = true;
            										self.nomeBut17.visible = false;
            									end;
        end, obj);

    obj._e_event140 = obj.nomeCheck17_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck17_01 = not sheet.fldCheck17_01;
            				
            				if(sheet.fldCheck17_02) then 
            					sheet.fldCheck17_01 = true; 
            					sheet.fldCheck17_02 = false; 
            					sheet.fldCheck17_03 = false; 
            					sheet.fldCheck17_04 = false; 
            					sheet.fldCheck17_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event141 = obj.nomeCheck17_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck17_02 = not sheet.fldCheck17_02;
            				
            				if(sheet.fldCheck17_02) then 
            					sheet.fldCheck17_01 = true; 
            				else 
            					sheet.fldCheck17_01 = false;
            				end;
            				
            				if(sheet.fldCheck17_03) then 
            					sheet.fldCheck17_01 = true; 
            					sheet.fldCheck17_02 = true; 
            					sheet.fldCheck17_03 = false; 
            					sheet.fldCheck17_04 = false; 
            					sheet.fldCheck17_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event142 = obj.nomeCheck17_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck17_03 = not sheet.fldCheck17_03;
            				
            				if(sheet.fldCheck17_03) then 
            					sheet.fldCheck17_01 = true; 
            					sheet.fldCheck17_02 = true; 
            				else 
            					sheet.fldCheck17_01 = false; 
            					sheet.fldCheck17_02 = false; 
            				end;
            				
            				if(sheet.fldCheck17_04) then 
            					sheet.fldCheck17_01 = true; 
            					sheet.fldCheck17_02 = true; 
            					sheet.fldCheck17_03 = true; 
            					sheet.fldCheck17_04 = false; 
            					sheet.fldCheck17_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event143 = obj.nomeCheck17_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck17_04 = not sheet.fldCheck17_04;
            				
            				if(sheet.fldCheck17_04) then 
            					sheet.fldCheck17_01 = true; 
            					sheet.fldCheck17_02 = true; 
            					sheet.fldCheck17_03 = true; 
            				else 
            					sheet.fldCheck17_01 = false; 
            					sheet.fldCheck17_02 = false; 
            					sheet.fldCheck17_03 = false; 
            				end;
            				
            				if(sheet.fldCheck17_05) then 
            					sheet.fldCheck17_01 = true; 
            					sheet.fldCheck17_02 = true; 
            					sheet.fldCheck17_03 = true; 
            					sheet.fldCheck17_04 = true; 
            					sheet.fldCheck17_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event144 = obj.nomeCheck17_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck17_05 = not sheet.fldCheck17_05;
            				
            				if(sheet.fldCheck17_05) then 
            					sheet.fldCheck17_01 = true; 
            					sheet.fldCheck17_02 = true; 
            					sheet.fldCheck17_03 = true; 
            					sheet.fldCheck17_04 = true; 
            				else 
            					sheet.fldCheck17_01 = false; 
            					sheet.fldCheck17_02 = false; 
            					sheet.fldCheck17_03 = false; 
            					sheet.fldCheck17_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event145 = obj.nomeBut18:addEventListener("onClick",
        function (_)
            self.popUp_18:show('right', self.nomeBut18);
        end, obj);

    obj._e_event146 = obj.nomeBut18B:addEventListener("onClick",
        function (_)
            self.popUp_18:show('right', self.nomeBut18);
        end, obj);

    obj._e_event147 = obj.dataLink44:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase18 == nil or sheet.fldEnfase18 == "Ênfases") then
            										self.nomeBut18.visible = true;
            										self.nomeBut18B.visible = false;
            									else
            										self.nomeBut18B.visible = true;
            										self.nomeBut18.visible = false;
            									end;
        end, obj);

    obj._e_event148 = obj.nomeCheck18_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck18_01 = not sheet.fldCheck18_01;
            				
            				if(sheet.fldCheck18_02) then 
            					sheet.fldCheck18_01 = true; 
            					sheet.fldCheck18_02 = false; 
            					sheet.fldCheck18_03 = false; 
            					sheet.fldCheck18_04 = false; 
            					sheet.fldCheck18_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event149 = obj.nomeCheck18_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck18_02 = not sheet.fldCheck18_02;
            				
            				if(sheet.fldCheck18_02) then 
            					sheet.fldCheck18_01 = true; 
            				else 
            					sheet.fldCheck18_01 = false;
            				end;
            				
            				if(sheet.fldCheck18_03) then 
            					sheet.fldCheck18_01 = true; 
            					sheet.fldCheck18_02 = true; 
            					sheet.fldCheck18_03 = false; 
            					sheet.fldCheck18_04 = false; 
            					sheet.fldCheck18_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event150 = obj.nomeCheck18_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck18_03 = not sheet.fldCheck18_03;
            				
            				if(sheet.fldCheck18_03) then 
            					sheet.fldCheck18_01 = true; 
            					sheet.fldCheck18_02 = true; 
            				else 
            					sheet.fldCheck18_01 = false; 
            					sheet.fldCheck18_02 = false; 
            				end;
            				
            				if(sheet.fldCheck18_04) then 
            					sheet.fldCheck18_01 = true; 
            					sheet.fldCheck18_02 = true; 
            					sheet.fldCheck18_03 = true; 
            					sheet.fldCheck18_04 = false; 
            					sheet.fldCheck18_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event151 = obj.nomeCheck18_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck18_04 = not sheet.fldCheck18_04;
            				
            				if(sheet.fldCheck18_04) then 
            					sheet.fldCheck18_01 = true; 
            					sheet.fldCheck18_02 = true; 
            					sheet.fldCheck18_03 = true; 
            				else 
            					sheet.fldCheck18_01 = false; 
            					sheet.fldCheck18_02 = false; 
            					sheet.fldCheck18_03 = false; 
            				end;
            				
            				if(sheet.fldCheck18_05) then 
            					sheet.fldCheck18_01 = true; 
            					sheet.fldCheck18_02 = true; 
            					sheet.fldCheck18_03 = true; 
            					sheet.fldCheck18_04 = true; 
            					sheet.fldCheck18_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event152 = obj.nomeCheck18_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck18_05 = not sheet.fldCheck18_05;
            				
            				if(sheet.fldCheck18_05) then 
            					sheet.fldCheck18_01 = true; 
            					sheet.fldCheck18_02 = true; 
            					sheet.fldCheck18_03 = true; 
            					sheet.fldCheck18_04 = true; 
            				else 
            					sheet.fldCheck18_01 = false; 
            					sheet.fldCheck18_02 = false; 
            					sheet.fldCheck18_03 = false; 
            					sheet.fldCheck18_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event153 = obj.nomeBut19:addEventListener("onClick",
        function (_)
            self.popUp_19:show('right', self.nomeBut19);
        end, obj);

    obj._e_event154 = obj.nomeBut19B:addEventListener("onClick",
        function (_)
            self.popUp_19:show('right', self.nomeBut19);
        end, obj);

    obj._e_event155 = obj.dataLink45:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase19 == nil or sheet.fldEnfase19 == "Ênfases") then
            										self.nomeBut19.visible = true;
            										self.nomeBut19B.visible = false;
            									else
            										self.nomeBut19B.visible = true;
            										self.nomeBut19.visible = false;
            									end;
        end, obj);

    obj._e_event156 = obj.nomeCheck19_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck19_01 = not sheet.fldCheck19_01;
            				
            				if(sheet.fldCheck19_02) then 
            					sheet.fldCheck19_01 = true; 
            					sheet.fldCheck19_02 = false; 
            					sheet.fldCheck19_03 = false; 
            					sheet.fldCheck19_04 = false; 
            					sheet.fldCheck19_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event157 = obj.nomeCheck19_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck19_02 = not sheet.fldCheck19_02;
            				
            				if(sheet.fldCheck19_02) then 
            					sheet.fldCheck19_01 = true; 
            				else 
            					sheet.fldCheck19_01 = false;
            				end;
            				
            				if(sheet.fldCheck19_03) then 
            					sheet.fldCheck19_01 = true; 
            					sheet.fldCheck19_02 = true; 
            					sheet.fldCheck19_03 = false; 
            					sheet.fldCheck19_04 = false; 
            					sheet.fldCheck19_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event158 = obj.nomeCheck19_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck19_03 = not sheet.fldCheck19_03;
            				
            				if(sheet.fldCheck19_03) then 
            					sheet.fldCheck19_01 = true; 
            					sheet.fldCheck19_02 = true; 
            				else 
            					sheet.fldCheck19_01 = false; 
            					sheet.fldCheck19_02 = false; 
            				end;
            				
            				if(sheet.fldCheck19_04) then 
            					sheet.fldCheck19_01 = true; 
            					sheet.fldCheck19_02 = true; 
            					sheet.fldCheck19_03 = true; 
            					sheet.fldCheck19_04 = false; 
            					sheet.fldCheck19_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event159 = obj.nomeCheck19_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck19_04 = not sheet.fldCheck19_04;
            				
            				if(sheet.fldCheck19_04) then 
            					sheet.fldCheck19_01 = true; 
            					sheet.fldCheck19_02 = true; 
            					sheet.fldCheck19_03 = true; 
            				else 
            					sheet.fldCheck19_01 = false; 
            					sheet.fldCheck19_02 = false; 
            					sheet.fldCheck19_03 = false; 
            				end;
            				
            				if(sheet.fldCheck19_05) then 
            					sheet.fldCheck19_01 = true; 
            					sheet.fldCheck19_02 = true; 
            					sheet.fldCheck19_03 = true; 
            					sheet.fldCheck19_04 = true; 
            					sheet.fldCheck19_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event160 = obj.nomeCheck19_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck19_05 = not sheet.fldCheck19_05;
            				
            				if(sheet.fldCheck19_05) then 
            					sheet.fldCheck19_01 = true; 
            					sheet.fldCheck19_02 = true; 
            					sheet.fldCheck19_03 = true; 
            					sheet.fldCheck19_04 = true; 
            				else 
            					sheet.fldCheck19_01 = false; 
            					sheet.fldCheck19_02 = false; 
            					sheet.fldCheck19_03 = false; 
            					sheet.fldCheck19_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event161 = obj.nomeBut20:addEventListener("onClick",
        function (_)
            self.popUp_20:show('right', self.nomeBut20);
        end, obj);

    obj._e_event162 = obj.nomeBut20B:addEventListener("onClick",
        function (_)
            self.popUp_20:show('right', self.nomeBut20);
        end, obj);

    obj._e_event163 = obj.dataLink46:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase20 == nil or sheet.fldEnfase20 == "Ênfases") then
            										self.nomeBut20.visible = true;
            										self.nomeBut20B.visible = false;
            									else
            										self.nomeBut20B.visible = true;
            										self.nomeBut20.visible = false;
            									end;
        end, obj);

    obj._e_event164 = obj.nomeCheck20_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck20_01 = not sheet.fldCheck20_01;
            				
            				if(sheet.fldCheck20_02) then 
            					sheet.fldCheck20_01 = true; 
            					sheet.fldCheck20_02 = false; 
            					sheet.fldCheck20_03 = false; 
            					sheet.fldCheck20_04 = false; 
            					sheet.fldCheck20_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event165 = obj.nomeCheck20_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck20_02 = not sheet.fldCheck20_02;
            				
            				if(sheet.fldCheck20_02) then 
            					sheet.fldCheck20_01 = true; 
            				else 
            					sheet.fldCheck20_01 = false;
            				end;
            				
            				if(sheet.fldCheck20_03) then 
            					sheet.fldCheck20_01 = true; 
            					sheet.fldCheck20_02 = true; 
            					sheet.fldCheck20_03 = false; 
            					sheet.fldCheck20_04 = false; 
            					sheet.fldCheck20_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event166 = obj.nomeCheck20_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck20_03 = not sheet.fldCheck20_03;
            				
            				if(sheet.fldCheck20_03) then 
            					sheet.fldCheck20_01 = true; 
            					sheet.fldCheck20_02 = true; 
            				else 
            					sheet.fldCheck20_01 = false; 
            					sheet.fldCheck20_02 = false; 
            				end;
            				
            				if(sheet.fldCheck20_04) then 
            					sheet.fldCheck20_01 = true; 
            					sheet.fldCheck20_02 = true; 
            					sheet.fldCheck20_03 = true; 
            					sheet.fldCheck20_04 = false; 
            					sheet.fldCheck20_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event167 = obj.nomeCheck20_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck20_04 = not sheet.fldCheck20_04;
            				
            				if(sheet.fldCheck20_04) then 
            					sheet.fldCheck20_01 = true; 
            					sheet.fldCheck20_02 = true; 
            					sheet.fldCheck20_03 = true; 
            				else 
            					sheet.fldCheck20_01 = false; 
            					sheet.fldCheck20_02 = false; 
            					sheet.fldCheck20_03 = false; 
            				end;
            				
            				if(sheet.fldCheck20_05) then 
            					sheet.fldCheck20_01 = true; 
            					sheet.fldCheck20_02 = true; 
            					sheet.fldCheck20_03 = true; 
            					sheet.fldCheck20_04 = true; 
            					sheet.fldCheck20_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event168 = obj.nomeCheck20_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck20_05 = not sheet.fldCheck20_05;
            				
            				if(sheet.fldCheck20_05) then 
            					sheet.fldCheck20_01 = true; 
            					sheet.fldCheck20_02 = true; 
            					sheet.fldCheck20_03 = true; 
            					sheet.fldCheck20_04 = true; 
            				else 
            					sheet.fldCheck20_01 = false; 
            					sheet.fldCheck20_02 = false; 
            					sheet.fldCheck20_03 = false; 
            					sheet.fldCheck20_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event169 = obj.nomeBut21:addEventListener("onClick",
        function (_)
            self.popUp_21:show('right', self.nomeBut21);
        end, obj);

    obj._e_event170 = obj.nomeBut21B:addEventListener("onClick",
        function (_)
            self.popUp_21:show('right', self.nomeBut21);
        end, obj);

    obj._e_event171 = obj.dataLink47:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase21 == nil or sheet.fldEnfase21 == "Ênfases") then
            										self.nomeBut21.visible = true;
            										self.nomeBut21B.visible = false;
            									else
            										self.nomeBut21B.visible = true;
            										self.nomeBut21.visible = false;
            									end;
        end, obj);

    obj._e_event172 = obj.nomeCheck21_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck21_01 = not sheet.fldCheck21_01;
            				
            				if(sheet.fldCheck21_02) then 
            					sheet.fldCheck21_01 = true; 
            					sheet.fldCheck21_02 = false; 
            					sheet.fldCheck21_03 = false; 
            					sheet.fldCheck21_04 = false; 
            					sheet.fldCheck21_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event173 = obj.nomeCheck21_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck21_02 = not sheet.fldCheck21_02;
            				
            				if(sheet.fldCheck21_02) then 
            					sheet.fldCheck21_01 = true; 
            				else 
            					sheet.fldCheck21_01 = false;
            				end;
            				
            				if(sheet.fldCheck21_03) then 
            					sheet.fldCheck21_01 = true; 
            					sheet.fldCheck21_02 = true; 
            					sheet.fldCheck21_03 = false; 
            					sheet.fldCheck21_04 = false; 
            					sheet.fldCheck21_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event174 = obj.nomeCheck21_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck21_03 = not sheet.fldCheck21_03;
            				
            				if(sheet.fldCheck21_03) then 
            					sheet.fldCheck21_01 = true; 
            					sheet.fldCheck21_02 = true; 
            				else 
            					sheet.fldCheck21_01 = false; 
            					sheet.fldCheck21_02 = false; 
            				end;
            				
            				if(sheet.fldCheck21_04) then 
            					sheet.fldCheck21_01 = true; 
            					sheet.fldCheck21_02 = true; 
            					sheet.fldCheck21_03 = true; 
            					sheet.fldCheck21_04 = false; 
            					sheet.fldCheck21_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event175 = obj.nomeCheck21_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck21_04 = not sheet.fldCheck21_04;
            				
            				if(sheet.fldCheck21_04) then 
            					sheet.fldCheck21_01 = true; 
            					sheet.fldCheck21_02 = true; 
            					sheet.fldCheck21_03 = true; 
            				else 
            					sheet.fldCheck21_01 = false; 
            					sheet.fldCheck21_02 = false; 
            					sheet.fldCheck21_03 = false; 
            				end;
            				
            				if(sheet.fldCheck21_05) then 
            					sheet.fldCheck21_01 = true; 
            					sheet.fldCheck21_02 = true; 
            					sheet.fldCheck21_03 = true; 
            					sheet.fldCheck21_04 = true; 
            					sheet.fldCheck21_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event176 = obj.nomeCheck21_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck21_05 = not sheet.fldCheck21_05;
            				
            				if(sheet.fldCheck21_05) then 
            					sheet.fldCheck21_01 = true; 
            					sheet.fldCheck21_02 = true; 
            					sheet.fldCheck21_03 = true; 
            					sheet.fldCheck21_04 = true; 
            				else 
            					sheet.fldCheck21_01 = false; 
            					sheet.fldCheck21_02 = false; 
            					sheet.fldCheck21_03 = false; 
            					sheet.fldCheck21_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event177 = obj.nomeBut22:addEventListener("onClick",
        function (_)
            self.popUp_22:show('right', self.nomeBut22);
        end, obj);

    obj._e_event178 = obj.nomeBut22B:addEventListener("onClick",
        function (_)
            self.popUp_22:show('right', self.nomeBut22);
        end, obj);

    obj._e_event179 = obj.dataLink48:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase22 == nil or sheet.fldEnfase22 == "Ênfases") then
            										self.nomeBut22.visible = true;
            										self.nomeBut22B.visible = false;
            									else
            										self.nomeBut22B.visible = true;
            										self.nomeBut22.visible = false;
            									end;
        end, obj);

    obj._e_event180 = obj.nomeCheck22_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck22_01 = not sheet.fldCheck22_01;
            				
            				if(sheet.fldCheck22_02) then 
            					sheet.fldCheck22_01 = true; 
            					sheet.fldCheck22_02 = false; 
            					sheet.fldCheck22_03 = false; 
            					sheet.fldCheck22_04 = false; 
            					sheet.fldCheck22_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event181 = obj.nomeCheck22_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck22_02 = not sheet.fldCheck22_02;
            				
            				if(sheet.fldCheck22_02) then 
            					sheet.fldCheck22_01 = true; 
            				else 
            					sheet.fldCheck22_01 = false;
            				end;
            				
            				if(sheet.fldCheck22_03) then 
            					sheet.fldCheck22_01 = true; 
            					sheet.fldCheck22_02 = true; 
            					sheet.fldCheck22_03 = false; 
            					sheet.fldCheck22_04 = false; 
            					sheet.fldCheck22_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event182 = obj.nomeCheck22_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck22_03 = not sheet.fldCheck22_03;
            				
            				if(sheet.fldCheck22_03) then 
            					sheet.fldCheck22_01 = true; 
            					sheet.fldCheck22_02 = true; 
            				else 
            					sheet.fldCheck22_01 = false; 
            					sheet.fldCheck22_02 = false; 
            				end;
            				
            				if(sheet.fldCheck22_04) then 
            					sheet.fldCheck22_01 = true; 
            					sheet.fldCheck22_02 = true; 
            					sheet.fldCheck22_03 = true; 
            					sheet.fldCheck22_04 = false; 
            					sheet.fldCheck22_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event183 = obj.nomeCheck22_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck22_04 = not sheet.fldCheck22_04;
            				
            				if(sheet.fldCheck22_04) then 
            					sheet.fldCheck22_01 = true; 
            					sheet.fldCheck22_02 = true; 
            					sheet.fldCheck22_03 = true; 
            				else 
            					sheet.fldCheck22_01 = false; 
            					sheet.fldCheck22_02 = false; 
            					sheet.fldCheck22_03 = false; 
            				end;
            				
            				if(sheet.fldCheck22_05) then 
            					sheet.fldCheck22_01 = true; 
            					sheet.fldCheck22_02 = true; 
            					sheet.fldCheck22_03 = true; 
            					sheet.fldCheck22_04 = true; 
            					sheet.fldCheck22_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event184 = obj.nomeCheck22_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck22_05 = not sheet.fldCheck22_05;
            				
            				if(sheet.fldCheck22_05) then 
            					sheet.fldCheck22_01 = true; 
            					sheet.fldCheck22_02 = true; 
            					sheet.fldCheck22_03 = true; 
            					sheet.fldCheck22_04 = true; 
            				else 
            					sheet.fldCheck22_01 = false; 
            					sheet.fldCheck22_02 = false; 
            					sheet.fldCheck22_03 = false; 
            					sheet.fldCheck22_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event185 = obj.nomeBut23:addEventListener("onClick",
        function (_)
            self.popUp_23:show('right', self.nomeBut23);
        end, obj);

    obj._e_event186 = obj.nomeBut23B:addEventListener("onClick",
        function (_)
            self.popUp_23:show('right', self.nomeBut23);
        end, obj);

    obj._e_event187 = obj.dataLink49:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase23 == nil or sheet.fldEnfase23 == "Ênfases") then
            										self.nomeBut23.visible = true;
            										self.nomeBut23B.visible = false;
            									else
            										self.nomeBut23B.visible = true;
            										self.nomeBut23.visible = false;
            									end;
        end, obj);

    obj._e_event188 = obj.nomeCheck23_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck23_01 = not sheet.fldCheck23_01;
            				
            				if(sheet.fldCheck23_02) then 
            					sheet.fldCheck23_01 = true; 
            					sheet.fldCheck23_02 = false; 
            					sheet.fldCheck23_03 = false; 
            					sheet.fldCheck23_04 = false; 
            					sheet.fldCheck23_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event189 = obj.nomeCheck23_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck23_02 = not sheet.fldCheck23_02;
            				
            				if(sheet.fldCheck23_02) then 
            					sheet.fldCheck23_01 = true; 
            				else 
            					sheet.fldCheck23_01 = false;
            				end;
            				
            				if(sheet.fldCheck23_03) then 
            					sheet.fldCheck23_01 = true; 
            					sheet.fldCheck23_02 = true; 
            					sheet.fldCheck23_03 = false; 
            					sheet.fldCheck23_04 = false; 
            					sheet.fldCheck23_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event190 = obj.nomeCheck23_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck23_03 = not sheet.fldCheck23_03;
            				
            				if(sheet.fldCheck23_03) then 
            					sheet.fldCheck23_01 = true; 
            					sheet.fldCheck23_02 = true; 
            				else 
            					sheet.fldCheck23_01 = false; 
            					sheet.fldCheck23_02 = false; 
            				end;
            				
            				if(sheet.fldCheck23_04) then 
            					sheet.fldCheck23_01 = true; 
            					sheet.fldCheck23_02 = true; 
            					sheet.fldCheck23_03 = true; 
            					sheet.fldCheck23_04 = false; 
            					sheet.fldCheck23_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event191 = obj.nomeCheck23_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck23_04 = not sheet.fldCheck23_04;
            				
            				if(sheet.fldCheck23_04) then 
            					sheet.fldCheck23_01 = true; 
            					sheet.fldCheck23_02 = true; 
            					sheet.fldCheck23_03 = true; 
            				else 
            					sheet.fldCheck23_01 = false; 
            					sheet.fldCheck23_02 = false; 
            					sheet.fldCheck23_03 = false; 
            				end;
            				
            				if(sheet.fldCheck23_05) then 
            					sheet.fldCheck23_01 = true; 
            					sheet.fldCheck23_02 = true; 
            					sheet.fldCheck23_03 = true; 
            					sheet.fldCheck23_04 = true; 
            					sheet.fldCheck23_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event192 = obj.nomeCheck23_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck23_05 = not sheet.fldCheck23_05;
            				
            				if(sheet.fldCheck23_05) then 
            					sheet.fldCheck23_01 = true; 
            					sheet.fldCheck23_02 = true; 
            					sheet.fldCheck23_03 = true; 
            					sheet.fldCheck23_04 = true; 
            				else 
            					sheet.fldCheck23_01 = false; 
            					sheet.fldCheck23_02 = false; 
            					sheet.fldCheck23_03 = false; 
            					sheet.fldCheck23_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event193 = obj.nomeBut24:addEventListener("onClick",
        function (_)
            self.popUp_24:show('right', self.nomeBut24);
        end, obj);

    obj._e_event194 = obj.nomeBut24B:addEventListener("onClick",
        function (_)
            self.popUp_24:show('right', self.nomeBut24);
        end, obj);

    obj._e_event195 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase24 == nil or sheet.fldEnfase24 == "Ênfases") then
            										self.nomeBut24.visible = true;
            										self.nomeBut24B.visible = false;
            									else
            										self.nomeBut24B.visible = true;
            										self.nomeBut24.visible = false;
            									end;
        end, obj);

    obj._e_event196 = obj.nomeCheck24_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck24_01 = not sheet.fldCheck24_01;
            				
            				if(sheet.fldCheck24_02) then 
            					sheet.fldCheck24_01 = true; 
            					sheet.fldCheck24_02 = false; 
            					sheet.fldCheck24_03 = false; 
            					sheet.fldCheck24_04 = false; 
            					sheet.fldCheck24_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event197 = obj.nomeCheck24_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck24_02 = not sheet.fldCheck24_02;
            				
            				if(sheet.fldCheck24_02) then 
            					sheet.fldCheck24_01 = true; 
            				else 
            					sheet.fldCheck24_01 = false;
            				end;
            				
            				if(sheet.fldCheck24_03) then 
            					sheet.fldCheck24_01 = true; 
            					sheet.fldCheck24_02 = true; 
            					sheet.fldCheck24_03 = false; 
            					sheet.fldCheck24_04 = false; 
            					sheet.fldCheck24_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event198 = obj.nomeCheck24_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck24_03 = not sheet.fldCheck24_03;
            				
            				if(sheet.fldCheck24_03) then 
            					sheet.fldCheck24_01 = true; 
            					sheet.fldCheck24_02 = true; 
            				else 
            					sheet.fldCheck24_01 = false; 
            					sheet.fldCheck24_02 = false; 
            				end;
            				
            				if(sheet.fldCheck24_04) then 
            					sheet.fldCheck24_01 = true; 
            					sheet.fldCheck24_02 = true; 
            					sheet.fldCheck24_03 = true; 
            					sheet.fldCheck24_04 = false; 
            					sheet.fldCheck24_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event199 = obj.nomeCheck24_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck24_04 = not sheet.fldCheck24_04;
            				
            				if(sheet.fldCheck24_04) then 
            					sheet.fldCheck24_01 = true; 
            					sheet.fldCheck24_02 = true; 
            					sheet.fldCheck24_03 = true; 
            				else 
            					sheet.fldCheck24_01 = false; 
            					sheet.fldCheck24_02 = false; 
            					sheet.fldCheck24_03 = false; 
            				end;
            				
            				if(sheet.fldCheck24_05) then 
            					sheet.fldCheck24_01 = true; 
            					sheet.fldCheck24_02 = true; 
            					sheet.fldCheck24_03 = true; 
            					sheet.fldCheck24_04 = true; 
            					sheet.fldCheck24_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event200 = obj.nomeCheck24_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck24_05 = not sheet.fldCheck24_05;
            				
            				if(sheet.fldCheck24_05) then 
            					sheet.fldCheck24_01 = true; 
            					sheet.fldCheck24_02 = true; 
            					sheet.fldCheck24_03 = true; 
            					sheet.fldCheck24_04 = true; 
            				else 
            					sheet.fldCheck24_01 = false; 
            					sheet.fldCheck24_02 = false; 
            					sheet.fldCheck24_03 = false; 
            					sheet.fldCheck24_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event201 = obj.nomeBut25:addEventListener("onClick",
        function (_)
            self.popUp_25:show('right', self.nomeBut25);
        end, obj);

    obj._e_event202 = obj.nomeBut25B:addEventListener("onClick",
        function (_)
            self.popUp_25:show('right', self.nomeBut25);
        end, obj);

    obj._e_event203 = obj.dataLink51:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase25 == nil or sheet.fldEnfase25 == "Ênfases") then
            										self.nomeBut25.visible = true;
            										self.nomeBut25B.visible = false;
            									else
            										self.nomeBut25B.visible = true;
            										self.nomeBut25.visible = false;
            									end;
        end, obj);

    obj._e_event204 = obj.nomeCheck25_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck25_01 = not sheet.fldCheck25_01;
            				
            				if(sheet.fldCheck25_02) then 
            					sheet.fldCheck25_01 = true; 
            					sheet.fldCheck25_02 = false; 
            					sheet.fldCheck25_03 = false; 
            					sheet.fldCheck25_04 = false; 
            					sheet.fldCheck25_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event205 = obj.nomeCheck25_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck25_02 = not sheet.fldCheck25_02;
            				
            				if(sheet.fldCheck25_02) then 
            					sheet.fldCheck25_01 = true; 
            				else 
            					sheet.fldCheck25_01 = false;
            				end;
            				
            				if(sheet.fldCheck25_03) then 
            					sheet.fldCheck25_01 = true; 
            					sheet.fldCheck25_02 = true; 
            					sheet.fldCheck25_03 = false; 
            					sheet.fldCheck25_04 = false; 
            					sheet.fldCheck25_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event206 = obj.nomeCheck25_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck25_03 = not sheet.fldCheck25_03;
            				
            				if(sheet.fldCheck25_03) then 
            					sheet.fldCheck25_01 = true; 
            					sheet.fldCheck25_02 = true; 
            				else 
            					sheet.fldCheck25_01 = false; 
            					sheet.fldCheck25_02 = false; 
            				end;
            				
            				if(sheet.fldCheck25_04) then 
            					sheet.fldCheck25_01 = true; 
            					sheet.fldCheck25_02 = true; 
            					sheet.fldCheck25_03 = true; 
            					sheet.fldCheck25_04 = false; 
            					sheet.fldCheck25_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event207 = obj.nomeCheck25_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck25_04 = not sheet.fldCheck25_04;
            				
            				if(sheet.fldCheck25_04) then 
            					sheet.fldCheck25_01 = true; 
            					sheet.fldCheck25_02 = true; 
            					sheet.fldCheck25_03 = true; 
            				else 
            					sheet.fldCheck25_01 = false; 
            					sheet.fldCheck25_02 = false; 
            					sheet.fldCheck25_03 = false; 
            				end;
            				
            				if(sheet.fldCheck25_05) then 
            					sheet.fldCheck25_01 = true; 
            					sheet.fldCheck25_02 = true; 
            					sheet.fldCheck25_03 = true; 
            					sheet.fldCheck25_04 = true; 
            					sheet.fldCheck25_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event208 = obj.nomeCheck25_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck25_05 = not sheet.fldCheck25_05;
            				
            				if(sheet.fldCheck25_05) then 
            					sheet.fldCheck25_01 = true; 
            					sheet.fldCheck25_02 = true; 
            					sheet.fldCheck25_03 = true; 
            					sheet.fldCheck25_04 = true; 
            				else 
            					sheet.fldCheck25_01 = false; 
            					sheet.fldCheck25_02 = false; 
            					sheet.fldCheck25_03 = false; 
            					sheet.fldCheck25_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event209 = obj.nomeBut26:addEventListener("onClick",
        function (_)
            self.popUp_26:show('right', self.nomeBut26);
        end, obj);

    obj._e_event210 = obj.nomeBut26B:addEventListener("onClick",
        function (_)
            self.popUp_26:show('right', self.nomeBut26);
        end, obj);

    obj._e_event211 = obj.dataLink52:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase26 == nil or sheet.fldEnfase26 == "Ênfases") then
            										self.nomeBut26.visible = true;
            										self.nomeBut26B.visible = false;
            									else
            										self.nomeBut26B.visible = true;
            										self.nomeBut26.visible = false;
            									end;
        end, obj);

    obj._e_event212 = obj.nomeCheck26_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck26_01 = not sheet.fldCheck26_01;
            				
            				if(sheet.fldCheck26_02) then 
            					sheet.fldCheck26_01 = true; 
            					sheet.fldCheck26_02 = false; 
            					sheet.fldCheck26_03 = false; 
            					sheet.fldCheck26_04 = false; 
            					sheet.fldCheck26_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event213 = obj.nomeCheck26_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck26_02 = not sheet.fldCheck26_02;
            				
            				if(sheet.fldCheck26_02) then 
            					sheet.fldCheck26_01 = true; 
            				else 
            					sheet.fldCheck26_01 = false;
            				end;
            				
            				if(sheet.fldCheck26_03) then 
            					sheet.fldCheck26_01 = true; 
            					sheet.fldCheck26_02 = true; 
            					sheet.fldCheck26_03 = false; 
            					sheet.fldCheck26_04 = false; 
            					sheet.fldCheck26_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event214 = obj.nomeCheck26_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck26_03 = not sheet.fldCheck26_03;
            				
            				if(sheet.fldCheck26_03) then 
            					sheet.fldCheck26_01 = true; 
            					sheet.fldCheck26_02 = true; 
            				else 
            					sheet.fldCheck26_01 = false; 
            					sheet.fldCheck26_02 = false; 
            				end;
            				
            				if(sheet.fldCheck26_04) then 
            					sheet.fldCheck26_01 = true; 
            					sheet.fldCheck26_02 = true; 
            					sheet.fldCheck26_03 = true; 
            					sheet.fldCheck26_04 = false; 
            					sheet.fldCheck26_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event215 = obj.nomeCheck26_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck26_04 = not sheet.fldCheck26_04;
            				
            				if(sheet.fldCheck26_04) then 
            					sheet.fldCheck26_01 = true; 
            					sheet.fldCheck26_02 = true; 
            					sheet.fldCheck26_03 = true; 
            				else 
            					sheet.fldCheck26_01 = false; 
            					sheet.fldCheck26_02 = false; 
            					sheet.fldCheck26_03 = false; 
            				end;
            				
            				if(sheet.fldCheck26_05) then 
            					sheet.fldCheck26_01 = true; 
            					sheet.fldCheck26_02 = true; 
            					sheet.fldCheck26_03 = true; 
            					sheet.fldCheck26_04 = true; 
            					sheet.fldCheck26_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event216 = obj.nomeCheck26_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck26_05 = not sheet.fldCheck26_05;
            				
            				if(sheet.fldCheck26_05) then 
            					sheet.fldCheck26_01 = true; 
            					sheet.fldCheck26_02 = true; 
            					sheet.fldCheck26_03 = true; 
            					sheet.fldCheck26_04 = true; 
            				else 
            					sheet.fldCheck26_01 = false; 
            					sheet.fldCheck26_02 = false; 
            					sheet.fldCheck26_03 = false; 
            					sheet.fldCheck26_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event217 = obj.nomeBut27:addEventListener("onClick",
        function (_)
            self.popUp_27:show('right', self.nomeBut27);
        end, obj);

    obj._e_event218 = obj.nomeBut27B:addEventListener("onClick",
        function (_)
            self.popUp_27:show('right', self.nomeBut27);
        end, obj);

    obj._e_event219 = obj.dataLink53:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase27 == nil or sheet.fldEnfase27 == "Ênfases") then
            										self.nomeBut27.visible = true;
            										self.nomeBut27B.visible = false;
            									else
            										self.nomeBut27B.visible = true;
            										self.nomeBut27.visible = false;
            									end;
        end, obj);

    obj._e_event220 = obj.nomeCheck27_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck27_01 = not sheet.fldCheck27_01;
            				
            				if(sheet.fldCheck27_02) then 
            					sheet.fldCheck27_01 = true; 
            					sheet.fldCheck27_02 = false; 
            					sheet.fldCheck27_03 = false; 
            					sheet.fldCheck27_04 = false; 
            					sheet.fldCheck27_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event221 = obj.nomeCheck27_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck27_02 = not sheet.fldCheck27_02;
            				
            				if(sheet.fldCheck27_02) then 
            					sheet.fldCheck27_01 = true; 
            				else 
            					sheet.fldCheck27_01 = false;
            				end;
            				
            				if(sheet.fldCheck27_03) then 
            					sheet.fldCheck27_01 = true; 
            					sheet.fldCheck27_02 = true; 
            					sheet.fldCheck27_03 = false; 
            					sheet.fldCheck27_04 = false; 
            					sheet.fldCheck27_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event222 = obj.nomeCheck27_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck27_03 = not sheet.fldCheck27_03;
            				
            				if(sheet.fldCheck27_03) then 
            					sheet.fldCheck27_01 = true; 
            					sheet.fldCheck27_02 = true; 
            				else 
            					sheet.fldCheck27_01 = false; 
            					sheet.fldCheck27_02 = false; 
            				end;
            				
            				if(sheet.fldCheck27_04) then 
            					sheet.fldCheck27_01 = true; 
            					sheet.fldCheck27_02 = true; 
            					sheet.fldCheck27_03 = true; 
            					sheet.fldCheck27_04 = false; 
            					sheet.fldCheck27_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event223 = obj.nomeCheck27_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck27_04 = not sheet.fldCheck27_04;
            				
            				if(sheet.fldCheck27_04) then 
            					sheet.fldCheck27_01 = true; 
            					sheet.fldCheck27_02 = true; 
            					sheet.fldCheck27_03 = true; 
            				else 
            					sheet.fldCheck27_01 = false; 
            					sheet.fldCheck27_02 = false; 
            					sheet.fldCheck27_03 = false; 
            				end;
            				
            				if(sheet.fldCheck27_05) then 
            					sheet.fldCheck27_01 = true; 
            					sheet.fldCheck27_02 = true; 
            					sheet.fldCheck27_03 = true; 
            					sheet.fldCheck27_04 = true; 
            					sheet.fldCheck27_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event224 = obj.nomeCheck27_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck27_05 = not sheet.fldCheck27_05;
            				
            				if(sheet.fldCheck27_05) then 
            					sheet.fldCheck27_01 = true; 
            					sheet.fldCheck27_02 = true; 
            					sheet.fldCheck27_03 = true; 
            					sheet.fldCheck27_04 = true; 
            				else 
            					sheet.fldCheck27_01 = false; 
            					sheet.fldCheck27_02 = false; 
            					sheet.fldCheck27_03 = false; 
            					sheet.fldCheck27_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event225 = obj.nomeBut28:addEventListener("onClick",
        function (_)
            self.popUp_28:show('right', self.nomeBut28);
        end, obj);

    obj._e_event226 = obj.nomeBut28B:addEventListener("onClick",
        function (_)
            self.popUp_28:show('right', self.nomeBut28);
        end, obj);

    obj._e_event227 = obj.dataLink54:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase28 == nil or sheet.fldEnfase28 == "Ênfases") then
            										self.nomeBut28.visible = true;
            										self.nomeBut28B.visible = false;
            									else
            										self.nomeBut28B.visible = true;
            										self.nomeBut28.visible = false;
            									end;
        end, obj);

    obj._e_event228 = obj.nomeCheck28_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck28_01 = not sheet.fldCheck28_01;
            				
            				if(sheet.fldCheck28_02) then 
            					sheet.fldCheck28_01 = true; 
            					sheet.fldCheck28_02 = false; 
            					sheet.fldCheck28_03 = false; 
            					sheet.fldCheck28_04 = false; 
            					sheet.fldCheck28_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event229 = obj.nomeCheck28_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck28_02 = not sheet.fldCheck28_02;
            				
            				if(sheet.fldCheck28_02) then 
            					sheet.fldCheck28_01 = true; 
            				else 
            					sheet.fldCheck28_01 = false;
            				end;
            				
            				if(sheet.fldCheck28_03) then 
            					sheet.fldCheck28_01 = true; 
            					sheet.fldCheck28_02 = true; 
            					sheet.fldCheck28_03 = false; 
            					sheet.fldCheck28_04 = false; 
            					sheet.fldCheck28_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event230 = obj.nomeCheck28_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck28_03 = not sheet.fldCheck28_03;
            				
            				if(sheet.fldCheck28_03) then 
            					sheet.fldCheck28_01 = true; 
            					sheet.fldCheck28_02 = true; 
            				else 
            					sheet.fldCheck28_01 = false; 
            					sheet.fldCheck28_02 = false; 
            				end;
            				
            				if(sheet.fldCheck28_04) then 
            					sheet.fldCheck28_01 = true; 
            					sheet.fldCheck28_02 = true; 
            					sheet.fldCheck28_03 = true; 
            					sheet.fldCheck28_04 = false; 
            					sheet.fldCheck28_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event231 = obj.nomeCheck28_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck28_04 = not sheet.fldCheck28_04;
            				
            				if(sheet.fldCheck28_04) then 
            					sheet.fldCheck28_01 = true; 
            					sheet.fldCheck28_02 = true; 
            					sheet.fldCheck28_03 = true; 
            				else 
            					sheet.fldCheck28_01 = false; 
            					sheet.fldCheck28_02 = false; 
            					sheet.fldCheck28_03 = false; 
            				end;
            				
            				if(sheet.fldCheck28_05) then 
            					sheet.fldCheck28_01 = true; 
            					sheet.fldCheck28_02 = true; 
            					sheet.fldCheck28_03 = true; 
            					sheet.fldCheck28_04 = true; 
            					sheet.fldCheck28_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event232 = obj.nomeCheck28_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck28_05 = not sheet.fldCheck28_05;
            				
            				if(sheet.fldCheck28_05) then 
            					sheet.fldCheck28_01 = true; 
            					sheet.fldCheck28_02 = true; 
            					sheet.fldCheck28_03 = true; 
            					sheet.fldCheck28_04 = true; 
            				else 
            					sheet.fldCheck28_01 = false; 
            					sheet.fldCheck28_02 = false; 
            					sheet.fldCheck28_03 = false; 
            					sheet.fldCheck28_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event233 = obj.nomeBut29:addEventListener("onClick",
        function (_)
            self.popUp_29:show('right', self.nomeBut29);
        end, obj);

    obj._e_event234 = obj.nomeBut29B:addEventListener("onClick",
        function (_)
            self.popUp_29:show('right', self.nomeBut29);
        end, obj);

    obj._e_event235 = obj.dataLink55:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase29 == nil or sheet.fldEnfase29 == "Ênfases") then
            										self.nomeBut29.visible = true;
            										self.nomeBut29B.visible = false;
            									else
            										self.nomeBut29B.visible = true;
            										self.nomeBut29.visible = false;
            									end;
        end, obj);

    obj._e_event236 = obj.nomeCheck29_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck29_01 = not sheet.fldCheck29_01;
            				
            				if(sheet.fldCheck29_02) then 
            					sheet.fldCheck29_01 = true; 
            					sheet.fldCheck29_02 = false; 
            					sheet.fldCheck29_03 = false; 
            					sheet.fldCheck29_04 = false; 
            					sheet.fldCheck29_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event237 = obj.nomeCheck29_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck29_02 = not sheet.fldCheck29_02;
            				
            				if(sheet.fldCheck29_02) then 
            					sheet.fldCheck29_01 = true; 
            				else 
            					sheet.fldCheck29_01 = false;
            				end;
            				
            				if(sheet.fldCheck29_03) then 
            					sheet.fldCheck29_01 = true; 
            					sheet.fldCheck29_02 = true; 
            					sheet.fldCheck29_03 = false; 
            					sheet.fldCheck29_04 = false; 
            					sheet.fldCheck29_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event238 = obj.nomeCheck29_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck29_03 = not sheet.fldCheck29_03;
            				
            				if(sheet.fldCheck29_03) then 
            					sheet.fldCheck29_01 = true; 
            					sheet.fldCheck29_02 = true; 
            				else 
            					sheet.fldCheck29_01 = false; 
            					sheet.fldCheck29_02 = false; 
            				end;
            				
            				if(sheet.fldCheck29_04) then 
            					sheet.fldCheck29_01 = true; 
            					sheet.fldCheck29_02 = true; 
            					sheet.fldCheck29_03 = true; 
            					sheet.fldCheck29_04 = false; 
            					sheet.fldCheck29_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event239 = obj.nomeCheck29_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck29_04 = not sheet.fldCheck29_04;
            				
            				if(sheet.fldCheck29_04) then 
            					sheet.fldCheck29_01 = true; 
            					sheet.fldCheck29_02 = true; 
            					sheet.fldCheck29_03 = true; 
            				else 
            					sheet.fldCheck29_01 = false; 
            					sheet.fldCheck29_02 = false; 
            					sheet.fldCheck29_03 = false; 
            				end;
            				
            				if(sheet.fldCheck29_05) then 
            					sheet.fldCheck29_01 = true; 
            					sheet.fldCheck29_02 = true; 
            					sheet.fldCheck29_03 = true; 
            					sheet.fldCheck29_04 = true; 
            					sheet.fldCheck29_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event240 = obj.nomeCheck29_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck29_05 = not sheet.fldCheck29_05;
            				
            				if(sheet.fldCheck29_05) then 
            					sheet.fldCheck29_01 = true; 
            					sheet.fldCheck29_02 = true; 
            					sheet.fldCheck29_03 = true; 
            					sheet.fldCheck29_04 = true; 
            				else 
            					sheet.fldCheck29_01 = false; 
            					sheet.fldCheck29_02 = false; 
            					sheet.fldCheck29_03 = false; 
            					sheet.fldCheck29_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event241 = obj.nomeBut30:addEventListener("onClick",
        function (_)
            self.popUp_30:show('right', self.nomeBut30);
        end, obj);

    obj._e_event242 = obj.nomeBut30B:addEventListener("onClick",
        function (_)
            self.popUp_30:show('right', self.nomeBut30);
        end, obj);

    obj._e_event243 = obj.dataLink56:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase30 == nil or sheet.fldEnfase30 == "Ênfases") then
            										self.nomeBut30.visible = true;
            										self.nomeBut30B.visible = false;
            									else
            										self.nomeBut30B.visible = true;
            										self.nomeBut30.visible = false;
            									end;
        end, obj);

    obj._e_event244 = obj.nomeCheck30_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck30_01 = not sheet.fldCheck30_01;
            				
            				if(sheet.fldCheck30_02) then 
            					sheet.fldCheck30_01 = true; 
            					sheet.fldCheck30_02 = false; 
            					sheet.fldCheck30_03 = false; 
            					sheet.fldCheck30_04 = false; 
            					sheet.fldCheck30_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event245 = obj.nomeCheck30_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck30_02 = not sheet.fldCheck30_02;
            				
            				if(sheet.fldCheck30_02) then 
            					sheet.fldCheck30_01 = true; 
            				else 
            					sheet.fldCheck30_01 = false;
            				end;
            				
            				if(sheet.fldCheck30_03) then 
            					sheet.fldCheck30_01 = true; 
            					sheet.fldCheck30_02 = true; 
            					sheet.fldCheck30_03 = false; 
            					sheet.fldCheck30_04 = false; 
            					sheet.fldCheck30_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event246 = obj.nomeCheck30_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck30_03 = not sheet.fldCheck30_03;
            				
            				if(sheet.fldCheck30_03) then 
            					sheet.fldCheck30_01 = true; 
            					sheet.fldCheck30_02 = true; 
            				else 
            					sheet.fldCheck30_01 = false; 
            					sheet.fldCheck30_02 = false; 
            				end;
            				
            				if(sheet.fldCheck30_04) then 
            					sheet.fldCheck30_01 = true; 
            					sheet.fldCheck30_02 = true; 
            					sheet.fldCheck30_03 = true; 
            					sheet.fldCheck30_04 = false; 
            					sheet.fldCheck30_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event247 = obj.nomeCheck30_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck30_04 = not sheet.fldCheck30_04;
            				
            				if(sheet.fldCheck30_04) then 
            					sheet.fldCheck30_01 = true; 
            					sheet.fldCheck30_02 = true; 
            					sheet.fldCheck30_03 = true; 
            				else 
            					sheet.fldCheck30_01 = false; 
            					sheet.fldCheck30_02 = false; 
            					sheet.fldCheck30_03 = false; 
            				end;
            				
            				if(sheet.fldCheck30_05) then 
            					sheet.fldCheck30_01 = true; 
            					sheet.fldCheck30_02 = true; 
            					sheet.fldCheck30_03 = true; 
            					sheet.fldCheck30_04 = true; 
            					sheet.fldCheck30_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event248 = obj.nomeCheck30_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck30_05 = not sheet.fldCheck30_05;
            				
            				if(sheet.fldCheck30_05) then 
            					sheet.fldCheck30_01 = true; 
            					sheet.fldCheck30_02 = true; 
            					sheet.fldCheck30_03 = true; 
            					sheet.fldCheck30_04 = true; 
            				else 
            					sheet.fldCheck30_01 = false; 
            					sheet.fldCheck30_02 = false; 
            					sheet.fldCheck30_03 = false; 
            					sheet.fldCheck30_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event249 = obj.nomeBut31:addEventListener("onClick",
        function (_)
            self.popUp_31:show('right', self.nomeBut31);
        end, obj);

    obj._e_event250 = obj.nomeBut31B:addEventListener("onClick",
        function (_)
            self.popUp_31:show('right', self.nomeBut31);
        end, obj);

    obj._e_event251 = obj.dataLink57:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase31 == nil or sheet.fldEnfase31 == "Ênfases") then
            										self.nomeBut31.visible = true;
            										self.nomeBut31B.visible = false;
            									else
            										self.nomeBut31B.visible = true;
            										self.nomeBut31.visible = false;
            									end;
        end, obj);

    obj._e_event252 = obj.nomeCheck31_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck31_01 = not sheet.fldCheck31_01;
            				
            				if(sheet.fldCheck31_02) then 
            					sheet.fldCheck31_01 = true; 
            					sheet.fldCheck31_02 = false; 
            					sheet.fldCheck31_03 = false; 
            					sheet.fldCheck31_04 = false; 
            					sheet.fldCheck31_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event253 = obj.nomeCheck31_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck31_02 = not sheet.fldCheck31_02;
            				
            				if(sheet.fldCheck31_02) then 
            					sheet.fldCheck31_01 = true; 
            				else 
            					sheet.fldCheck31_01 = false;
            				end;
            				
            				if(sheet.fldCheck31_03) then 
            					sheet.fldCheck31_01 = true; 
            					sheet.fldCheck31_02 = true; 
            					sheet.fldCheck31_03 = false; 
            					sheet.fldCheck31_04 = false; 
            					sheet.fldCheck31_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event254 = obj.nomeCheck31_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck31_03 = not sheet.fldCheck31_03;
            				
            				if(sheet.fldCheck31_03) then 
            					sheet.fldCheck31_01 = true; 
            					sheet.fldCheck31_02 = true; 
            				else 
            					sheet.fldCheck31_01 = false; 
            					sheet.fldCheck31_02 = false; 
            				end;
            				
            				if(sheet.fldCheck31_04) then 
            					sheet.fldCheck31_01 = true; 
            					sheet.fldCheck31_02 = true; 
            					sheet.fldCheck31_03 = true; 
            					sheet.fldCheck31_04 = false; 
            					sheet.fldCheck31_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event255 = obj.nomeCheck31_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck31_04 = not sheet.fldCheck31_04;
            				
            				if(sheet.fldCheck31_04) then 
            					sheet.fldCheck31_01 = true; 
            					sheet.fldCheck31_02 = true; 
            					sheet.fldCheck31_03 = true; 
            				else 
            					sheet.fldCheck31_01 = false; 
            					sheet.fldCheck31_02 = false; 
            					sheet.fldCheck31_03 = false; 
            				end;
            				
            				if(sheet.fldCheck31_05) then 
            					sheet.fldCheck31_01 = true; 
            					sheet.fldCheck31_02 = true; 
            					sheet.fldCheck31_03 = true; 
            					sheet.fldCheck31_04 = true; 
            					sheet.fldCheck31_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event256 = obj.nomeCheck31_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck31_05 = not sheet.fldCheck31_05;
            				
            				if(sheet.fldCheck31_05) then 
            					sheet.fldCheck31_01 = true; 
            					sheet.fldCheck31_02 = true; 
            					sheet.fldCheck31_03 = true; 
            					sheet.fldCheck31_04 = true; 
            				else 
            					sheet.fldCheck31_01 = false; 
            					sheet.fldCheck31_02 = false; 
            					sheet.fldCheck31_03 = false; 
            					sheet.fldCheck31_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event257 = obj.nomeBut32:addEventListener("onClick",
        function (_)
            self.popUp_32:show('right', self.nomeBut32);
        end, obj);

    obj._e_event258 = obj.nomeBut32B:addEventListener("onClick",
        function (_)
            self.popUp_32:show('right', self.nomeBut32);
        end, obj);

    obj._e_event259 = obj.dataLink58:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase32 == nil or sheet.fldEnfase32 == "Ênfases") then
            										self.nomeBut32.visible = true;
            										self.nomeBut32B.visible = false;
            									else
            										self.nomeBut32B.visible = true;
            										self.nomeBut32.visible = false;
            									end;
        end, obj);

    obj._e_event260 = obj.nomeCheck32_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck32_01 = not sheet.fldCheck32_01;
            				
            				if(sheet.fldCheck32_02) then 
            					sheet.fldCheck32_01 = true; 
            					sheet.fldCheck32_02 = false; 
            					sheet.fldCheck32_03 = false; 
            					sheet.fldCheck32_04 = false; 
            					sheet.fldCheck32_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event261 = obj.nomeCheck32_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck32_02 = not sheet.fldCheck32_02;
            				
            				if(sheet.fldCheck32_02) then 
            					sheet.fldCheck32_01 = true; 
            				else 
            					sheet.fldCheck32_01 = false;
            				end;
            				
            				if(sheet.fldCheck32_03) then 
            					sheet.fldCheck32_01 = true; 
            					sheet.fldCheck32_02 = true; 
            					sheet.fldCheck32_03 = false; 
            					sheet.fldCheck32_04 = false; 
            					sheet.fldCheck32_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event262 = obj.nomeCheck32_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck32_03 = not sheet.fldCheck32_03;
            				
            				if(sheet.fldCheck32_03) then 
            					sheet.fldCheck32_01 = true; 
            					sheet.fldCheck32_02 = true; 
            				else 
            					sheet.fldCheck32_01 = false; 
            					sheet.fldCheck32_02 = false; 
            				end;
            				
            				if(sheet.fldCheck32_04) then 
            					sheet.fldCheck32_01 = true; 
            					sheet.fldCheck32_02 = true; 
            					sheet.fldCheck32_03 = true; 
            					sheet.fldCheck32_04 = false; 
            					sheet.fldCheck32_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event263 = obj.nomeCheck32_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck32_04 = not sheet.fldCheck32_04;
            				
            				if(sheet.fldCheck32_04) then 
            					sheet.fldCheck32_01 = true; 
            					sheet.fldCheck32_02 = true; 
            					sheet.fldCheck32_03 = true; 
            				else 
            					sheet.fldCheck32_01 = false; 
            					sheet.fldCheck32_02 = false; 
            					sheet.fldCheck32_03 = false; 
            				end;
            				
            				if(sheet.fldCheck32_05) then 
            					sheet.fldCheck32_01 = true; 
            					sheet.fldCheck32_02 = true; 
            					sheet.fldCheck32_03 = true; 
            					sheet.fldCheck32_04 = true; 
            					sheet.fldCheck32_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event264 = obj.nomeCheck32_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck32_05 = not sheet.fldCheck32_05;
            				
            				if(sheet.fldCheck32_05) then 
            					sheet.fldCheck32_01 = true; 
            					sheet.fldCheck32_02 = true; 
            					sheet.fldCheck32_03 = true; 
            					sheet.fldCheck32_04 = true; 
            				else 
            					sheet.fldCheck32_01 = false; 
            					sheet.fldCheck32_02 = false; 
            					sheet.fldCheck32_03 = false; 
            					sheet.fldCheck32_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event265 = obj.nomeBut33:addEventListener("onClick",
        function (_)
            self.popUp_33:show('right', self.nomeBut33);
        end, obj);

    obj._e_event266 = obj.nomeBut33B:addEventListener("onClick",
        function (_)
            self.popUp_33:show('right', self.nomeBut33);
        end, obj);

    obj._e_event267 = obj.dataLink59:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase33 == nil or sheet.fldEnfase33 == "Ênfases") then
            										self.nomeBut33.visible = true;
            										self.nomeBut33B.visible = false;
            									else
            										self.nomeBut33B.visible = true;
            										self.nomeBut33.visible = false;
            									end;
        end, obj);

    obj._e_event268 = obj.nomeCheck33_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck33_01 = not sheet.fldCheck33_01;
            				
            				if(sheet.fldCheck33_02) then 
            					sheet.fldCheck33_01 = true; 
            					sheet.fldCheck33_02 = false; 
            					sheet.fldCheck33_03 = false; 
            					sheet.fldCheck33_04 = false; 
            					sheet.fldCheck33_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event269 = obj.nomeCheck33_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck33_02 = not sheet.fldCheck33_02;
            				
            				if(sheet.fldCheck33_02) then 
            					sheet.fldCheck33_01 = true; 
            				else 
            					sheet.fldCheck33_01 = false;
            				end;
            				
            				if(sheet.fldCheck33_03) then 
            					sheet.fldCheck33_01 = true; 
            					sheet.fldCheck33_02 = true; 
            					sheet.fldCheck33_03 = false; 
            					sheet.fldCheck33_04 = false; 
            					sheet.fldCheck33_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event270 = obj.nomeCheck33_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck33_03 = not sheet.fldCheck33_03;
            				
            				if(sheet.fldCheck33_03) then 
            					sheet.fldCheck33_01 = true; 
            					sheet.fldCheck33_02 = true; 
            				else 
            					sheet.fldCheck33_01 = false; 
            					sheet.fldCheck33_02 = false; 
            				end;
            				
            				if(sheet.fldCheck33_04) then 
            					sheet.fldCheck33_01 = true; 
            					sheet.fldCheck33_02 = true; 
            					sheet.fldCheck33_03 = true; 
            					sheet.fldCheck33_04 = false; 
            					sheet.fldCheck33_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event271 = obj.nomeCheck33_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck33_04 = not sheet.fldCheck33_04;
            				
            				if(sheet.fldCheck33_04) then 
            					sheet.fldCheck33_01 = true; 
            					sheet.fldCheck33_02 = true; 
            					sheet.fldCheck33_03 = true; 
            				else 
            					sheet.fldCheck33_01 = false; 
            					sheet.fldCheck33_02 = false; 
            					sheet.fldCheck33_03 = false; 
            				end;
            				
            				if(sheet.fldCheck33_05) then 
            					sheet.fldCheck33_01 = true; 
            					sheet.fldCheck33_02 = true; 
            					sheet.fldCheck33_03 = true; 
            					sheet.fldCheck33_04 = true; 
            					sheet.fldCheck33_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event272 = obj.nomeCheck33_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck33_05 = not sheet.fldCheck33_05;
            				
            				if(sheet.fldCheck33_05) then 
            					sheet.fldCheck33_01 = true; 
            					sheet.fldCheck33_02 = true; 
            					sheet.fldCheck33_03 = true; 
            					sheet.fldCheck33_04 = true; 
            				else 
            					sheet.fldCheck33_01 = false; 
            					sheet.fldCheck33_02 = false; 
            					sheet.fldCheck33_03 = false; 
            					sheet.fldCheck33_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event273 = obj.nomeBut34:addEventListener("onClick",
        function (_)
            self.popUp_34:show('right', self.nomeBut34);
        end, obj);

    obj._e_event274 = obj.nomeBut34B:addEventListener("onClick",
        function (_)
            self.popUp_34:show('right', self.nomeBut34);
        end, obj);

    obj._e_event275 = obj.dataLink60:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase34 == nil or sheet.fldEnfase34 == "Ênfases") then
            										self.nomeBut34.visible = true;
            										self.nomeBut34B.visible = false;
            									else
            										self.nomeBut34B.visible = true;
            										self.nomeBut34.visible = false;
            									end;
        end, obj);

    obj._e_event276 = obj.nomeCheck34_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck34_01 = not sheet.fldCheck34_01;
            				
            				if(sheet.fldCheck34_02) then 
            					sheet.fldCheck34_01 = true; 
            					sheet.fldCheck34_02 = false; 
            					sheet.fldCheck34_03 = false; 
            					sheet.fldCheck34_04 = false; 
            					sheet.fldCheck34_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event277 = obj.nomeCheck34_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck34_02 = not sheet.fldCheck34_02;
            				
            				if(sheet.fldCheck34_02) then 
            					sheet.fldCheck34_01 = true; 
            				else 
            					sheet.fldCheck34_01 = false;
            				end;
            				
            				if(sheet.fldCheck34_03) then 
            					sheet.fldCheck34_01 = true; 
            					sheet.fldCheck34_02 = true; 
            					sheet.fldCheck34_03 = false; 
            					sheet.fldCheck34_04 = false; 
            					sheet.fldCheck34_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event278 = obj.nomeCheck34_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck34_03 = not sheet.fldCheck34_03;
            				
            				if(sheet.fldCheck34_03) then 
            					sheet.fldCheck34_01 = true; 
            					sheet.fldCheck34_02 = true; 
            				else 
            					sheet.fldCheck34_01 = false; 
            					sheet.fldCheck34_02 = false; 
            				end;
            				
            				if(sheet.fldCheck34_04) then 
            					sheet.fldCheck34_01 = true; 
            					sheet.fldCheck34_02 = true; 
            					sheet.fldCheck34_03 = true; 
            					sheet.fldCheck34_04 = false; 
            					sheet.fldCheck34_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event279 = obj.nomeCheck34_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck34_04 = not sheet.fldCheck34_04;
            				
            				if(sheet.fldCheck34_04) then 
            					sheet.fldCheck34_01 = true; 
            					sheet.fldCheck34_02 = true; 
            					sheet.fldCheck34_03 = true; 
            				else 
            					sheet.fldCheck34_01 = false; 
            					sheet.fldCheck34_02 = false; 
            					sheet.fldCheck34_03 = false; 
            				end;
            				
            				if(sheet.fldCheck34_05) then 
            					sheet.fldCheck34_01 = true; 
            					sheet.fldCheck34_02 = true; 
            					sheet.fldCheck34_03 = true; 
            					sheet.fldCheck34_04 = true; 
            					sheet.fldCheck34_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event280 = obj.nomeCheck34_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck34_05 = not sheet.fldCheck34_05;
            				
            				if(sheet.fldCheck34_05) then 
            					sheet.fldCheck34_01 = true; 
            					sheet.fldCheck34_02 = true; 
            					sheet.fldCheck34_03 = true; 
            					sheet.fldCheck34_04 = true; 
            				else 
            					sheet.fldCheck34_01 = false; 
            					sheet.fldCheck34_02 = false; 
            					sheet.fldCheck34_03 = false; 
            					sheet.fldCheck34_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event281 = obj.nomeBut35:addEventListener("onClick",
        function (_)
            self.popUp_35:show('right', self.nomeBut35);
        end, obj);

    obj._e_event282 = obj.nomeBut35B:addEventListener("onClick",
        function (_)
            self.popUp_35:show('right', self.nomeBut35);
        end, obj);

    obj._e_event283 = obj.dataLink61:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase35 == nil or sheet.fldEnfase35 == "Ênfases") then
            										self.nomeBut35.visible = true;
            										self.nomeBut35B.visible = false;
            									else
            										self.nomeBut35B.visible = true;
            										self.nomeBut35.visible = false;
            									end;
        end, obj);

    obj._e_event284 = obj.nomeCheck35_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck35_01 = not sheet.fldCheck35_01;
            				
            				if(sheet.fldCheck35_02) then 
            					sheet.fldCheck35_01 = true; 
            					sheet.fldCheck35_02 = false; 
            					sheet.fldCheck35_03 = false; 
            					sheet.fldCheck35_04 = false; 
            					sheet.fldCheck35_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event285 = obj.nomeCheck35_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck35_02 = not sheet.fldCheck35_02;
            				
            				if(sheet.fldCheck35_02) then 
            					sheet.fldCheck35_01 = true; 
            				else 
            					sheet.fldCheck35_01 = false;
            				end;
            				
            				if(sheet.fldCheck35_03) then 
            					sheet.fldCheck35_01 = true; 
            					sheet.fldCheck35_02 = true; 
            					sheet.fldCheck35_03 = false; 
            					sheet.fldCheck35_04 = false; 
            					sheet.fldCheck35_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event286 = obj.nomeCheck35_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck35_03 = not sheet.fldCheck35_03;
            				
            				if(sheet.fldCheck35_03) then 
            					sheet.fldCheck35_01 = true; 
            					sheet.fldCheck35_02 = true; 
            				else 
            					sheet.fldCheck35_01 = false; 
            					sheet.fldCheck35_02 = false; 
            				end;
            				
            				if(sheet.fldCheck35_04) then 
            					sheet.fldCheck35_01 = true; 
            					sheet.fldCheck35_02 = true; 
            					sheet.fldCheck35_03 = true; 
            					sheet.fldCheck35_04 = false; 
            					sheet.fldCheck35_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event287 = obj.nomeCheck35_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck35_04 = not sheet.fldCheck35_04;
            				
            				if(sheet.fldCheck35_04) then 
            					sheet.fldCheck35_01 = true; 
            					sheet.fldCheck35_02 = true; 
            					sheet.fldCheck35_03 = true; 
            				else 
            					sheet.fldCheck35_01 = false; 
            					sheet.fldCheck35_02 = false; 
            					sheet.fldCheck35_03 = false; 
            				end;
            				
            				if(sheet.fldCheck35_05) then 
            					sheet.fldCheck35_01 = true; 
            					sheet.fldCheck35_02 = true; 
            					sheet.fldCheck35_03 = true; 
            					sheet.fldCheck35_04 = true; 
            					sheet.fldCheck35_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event288 = obj.nomeCheck35_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck35_05 = not sheet.fldCheck35_05;
            				
            				if(sheet.fldCheck35_05) then 
            					sheet.fldCheck35_01 = true; 
            					sheet.fldCheck35_02 = true; 
            					sheet.fldCheck35_03 = true; 
            					sheet.fldCheck35_04 = true; 
            				else 
            					sheet.fldCheck35_01 = false; 
            					sheet.fldCheck35_02 = false; 
            					sheet.fldCheck35_03 = false; 
            					sheet.fldCheck35_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event289 = obj.nomeBut36:addEventListener("onClick",
        function (_)
            self.popUp_36:show('right', self.nomeBut36);
        end, obj);

    obj._e_event290 = obj.nomeBut36B:addEventListener("onClick",
        function (_)
            self.popUp_36:show('right', self.nomeBut36);
        end, obj);

    obj._e_event291 = obj.dataLink62:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase36 == nil or sheet.fldEnfase36 == "Ênfases") then
            										self.nomeBut36.visible = true;
            										self.nomeBut36B.visible = false;
            									else
            										self.nomeBut36B.visible = true;
            										self.nomeBut36.visible = false;
            									end;
        end, obj);

    obj._e_event292 = obj.nomeCheck36_01:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck36_01 = not sheet.fldCheck36_01;
            				
            				if(sheet.fldCheck36_02) then 
            					sheet.fldCheck36_01 = true; 
            					sheet.fldCheck36_02 = false; 
            					sheet.fldCheck36_03 = false; 
            					sheet.fldCheck36_04 = false; 
            					sheet.fldCheck36_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event293 = obj.nomeCheck36_02:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck36_02 = not sheet.fldCheck36_02;
            				
            				if(sheet.fldCheck36_02) then 
            					sheet.fldCheck36_01 = true; 
            				else 
            					sheet.fldCheck36_01 = false;
            				end;
            				
            				if(sheet.fldCheck36_03) then 
            					sheet.fldCheck36_01 = true; 
            					sheet.fldCheck36_02 = true; 
            					sheet.fldCheck36_03 = false; 
            					sheet.fldCheck36_04 = false; 
            					sheet.fldCheck36_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event294 = obj.nomeCheck36_03:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck36_03 = not sheet.fldCheck36_03;
            				
            				if(sheet.fldCheck36_03) then 
            					sheet.fldCheck36_01 = true; 
            					sheet.fldCheck36_02 = true; 
            				else 
            					sheet.fldCheck36_01 = false; 
            					sheet.fldCheck36_02 = false; 
            				end;
            				
            				if(sheet.fldCheck36_04) then 
            					sheet.fldCheck36_01 = true; 
            					sheet.fldCheck36_02 = true; 
            					sheet.fldCheck36_03 = true; 
            					sheet.fldCheck36_04 = false; 
            					sheet.fldCheck36_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event295 = obj.nomeCheck36_04:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck36_04 = not sheet.fldCheck36_04;
            				
            				if(sheet.fldCheck36_04) then 
            					sheet.fldCheck36_01 = true; 
            					sheet.fldCheck36_02 = true; 
            					sheet.fldCheck36_03 = true; 
            				else 
            					sheet.fldCheck36_01 = false; 
            					sheet.fldCheck36_02 = false; 
            					sheet.fldCheck36_03 = false; 
            				end;
            				
            				if(sheet.fldCheck36_05) then 
            					sheet.fldCheck36_01 = true; 
            					sheet.fldCheck36_02 = true; 
            					sheet.fldCheck36_03 = true; 
            					sheet.fldCheck36_04 = true; 
            					sheet.fldCheck36_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event296 = obj.nomeCheck36_05:addEventListener("onClick",
        function (_)
            
            				sheet.fldCheck36_05 = not sheet.fldCheck36_05;
            				
            				if(sheet.fldCheck36_05) then 
            					sheet.fldCheck36_01 = true; 
            					sheet.fldCheck36_02 = true; 
            					sheet.fldCheck36_03 = true; 
            					sheet.fldCheck36_04 = true; 
            				else 
            					sheet.fldCheck36_01 = false; 
            					sheet.fldCheck36_02 = false; 
            					sheet.fldCheck36_03 = false; 
            					sheet.fldCheck36_04 = false; 
            				end;
            			
        end, obj);

    obj._e_event297 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclDisciplinas:append();
        end, obj);

    obj._e_event298 = obj.rclDisciplinas:addEventListener("onSelect",
        function (_)
            self.rclDisciplinas:sort();
        end, obj);

    obj._e_event299 = obj.rclDisciplinas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldDis_Disc00, nodeB.fldDis_Disc00);
        end, obj);

    obj._e_event300 = obj.rclVantagens:addEventListener("onItemRemoved",
        function (_, node, form)
            self.layVerso:needRepaint();
        end, obj);

    obj._e_event301 = obj.rclVantagens:addEventListener("onSelect",
        function (_)
            self.rclVantagens:sort();
        end, obj);

    obj._e_event302 = obj.rclVantagens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldVantagem, nodeB.fldVantagem);
        end, obj);

    obj._e_event303 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclVantagens:append();
        end, obj);

    obj._e_event304 = obj.nomeCheckPotencia_01:addEventListener("onClick",
        function (_)
            
            												sheet.fldCheckPotencia_01 = not sheet.fldCheckPotencia_01;
            												
            												if(sheet.fldCheckPotencia_02) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = false; 
            													sheet.fldCheckPotencia_03 = false; 
            													sheet.fldCheckPotencia_04 = false; 
            													sheet.fldCheckPotencia_05 = false; 
            													sheet.fldCheckPotencia_06 = false; 
            													sheet.fldCheckPotencia_07 = false; 
            													sheet.fldCheckPotencia_08 = false; 
            													sheet.fldCheckPotencia_09 = false; 
            													sheet.fldCheckPotencia_10 = false; 
            												end;
            											
        end, obj);

    obj._e_event305 = obj.nomeCheckPotencia_02:addEventListener("onClick",
        function (_)
            
            												sheet.fldCheckPotencia_02 = not sheet.fldCheckPotencia_02;
            												
            												if(sheet.fldCheckPotencia_02) then 
            													sheet.fldCheckPotencia_01 = true; 
            												else 
            													sheet.fldCheckPotencia_01 = false;
            												end;
            												
            												if(sheet.fldCheckPotencia_03) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = false; 
            													sheet.fldCheckPotencia_04 = false; 
            													sheet.fldCheckPotencia_05 = false;
            													sheet.fldCheckPotencia_06 = false; 
            													sheet.fldCheckPotencia_07 = false; 
            													sheet.fldCheckPotencia_08 = false; 
            													sheet.fldCheckPotencia_09 = false; 
            													sheet.fldCheckPotencia_10 = false;  
            												end;
            											
        end, obj);

    obj._e_event306 = obj.nomeCheckPotencia_03:addEventListener("onClick",
        function (_)
            
            												sheet.fldCheckPotencia_03 = not sheet.fldCheckPotencia_03;
            												
            												if(sheet.fldCheckPotencia_03) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            												else 
            													sheet.fldCheckPotencia_01 = false; 
            													sheet.fldCheckPotencia_02 = false; 
            												end;
            												
            												if(sheet.fldCheckPotencia_04) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = false; 
            													sheet.fldCheckPotencia_05 = false;
            													sheet.fldCheckPotencia_06 = false; 
            													sheet.fldCheckPotencia_07 = false; 
            													sheet.fldCheckPotencia_08 = false; 
            													sheet.fldCheckPotencia_09 = false; 
            													sheet.fldCheckPotencia_10 = false;  
            												end;
            											
        end, obj);

    obj._e_event307 = obj.nomeCheckPotencia_04:addEventListener("onClick",
        function (_)
            
            												sheet.fldCheckPotencia_04 = not sheet.fldCheckPotencia_04;
            												
            												if(sheet.fldCheckPotencia_04) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            												else 
            													sheet.fldCheckPotencia_01 = false; 
            													sheet.fldCheckPotencia_02 = false; 
            													sheet.fldCheckPotencia_03 = false; 
            												end;
            												
            												if(sheet.fldCheckPotencia_05) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            													sheet.fldCheckPotencia_05 = false; 
            													sheet.fldCheckPotencia_06 = false; 
            													sheet.fldCheckPotencia_07 = false; 
            													sheet.fldCheckPotencia_08 = false; 
            													sheet.fldCheckPotencia_09 = false; 
            													sheet.fldCheckPotencia_10 = false; 
            												end;
            											
        end, obj);

    obj._e_event308 = obj.nomeCheckPotencia_05:addEventListener("onClick",
        function (_)
            
            												sheet.fldCheckPotencia_05 = not sheet.fldCheckPotencia_05;
            												
            												if(sheet.fldCheckPotencia_05) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            												else 
            													sheet.fldCheckPotencia_01 = false; 
            													sheet.fldCheckPotencia_02 = false; 
            													sheet.fldCheckPotencia_03 = false; 
            													sheet.fldCheckPotencia_04 = false; 
            												end;
            												
            												if(sheet.fldCheckPotencia_06) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            													sheet.fldCheckPotencia_05 = true; 
            													sheet.fldCheckPotencia_06 = false; 
            													sheet.fldCheckPotencia_07 = false; 
            													sheet.fldCheckPotencia_08 = false; 
            													sheet.fldCheckPotencia_09 = false; 
            													sheet.fldCheckPotencia_10 = false; 
            												end;
            											
        end, obj);

    obj._e_event309 = obj.nomeCheckPotencia_06:addEventListener("onClick",
        function (_)
            
            												sheet.fldCheckPotencia_06 = not sheet.fldCheckPotencia_06;
            												
            												if(sheet.fldCheckPotencia_06) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            													sheet.fldCheckPotencia_05 = true; 
            												else 
            													sheet.fldCheckPotencia_01 = false; 
            													sheet.fldCheckPotencia_02 = false; 
            													sheet.fldCheckPotencia_03 = false; 
            													sheet.fldCheckPotencia_04 = false; 
            													sheet.fldCheckPotencia_05 = false; 
            												end;
            												
            												if(sheet.fldCheckPotencia_07) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            													sheet.fldCheckPotencia_05 = true; 
            													sheet.fldCheckPotencia_06 = true; 
            													sheet.fldCheckPotencia_07 = false; 
            													sheet.fldCheckPotencia_08 = false; 
            													sheet.fldCheckPotencia_09 = false; 
            													sheet.fldCheckPotencia_10 = false; 
            												end;
            											
        end, obj);

    obj._e_event310 = obj.nomeCheckPotencia_07:addEventListener("onClick",
        function (_)
            
            												sheet.fldCheckPotencia_07 = not sheet.fldCheckPotencia_07;
            												
            												if(sheet.fldCheckPotencia_07) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            													sheet.fldCheckPotencia_05 = true; 
            													sheet.fldCheckPotencia_06 = true; 
            												else 
            													sheet.fldCheckPotencia_01 = false; 
            													sheet.fldCheckPotencia_02 = false; 
            													sheet.fldCheckPotencia_03 = false; 
            													sheet.fldCheckPotencia_04 = false; 
            													sheet.fldCheckPotencia_05 = false; 
            													sheet.fldCheckPotencia_06 = false; 
            												end;
            												
            												if(sheet.fldCheckPotencia_08) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            													sheet.fldCheckPotencia_05 = true; 
            													sheet.fldCheckPotencia_06 = true; 
            													sheet.fldCheckPotencia_07 = true; 
            													sheet.fldCheckPotencia_08 = false; 
            													sheet.fldCheckPotencia_09 = false; 
            													sheet.fldCheckPotencia_10 = false; 
            												end;
            											
        end, obj);

    obj._e_event311 = obj.nomeCheckPotencia_08:addEventListener("onClick",
        function (_)
            
            												sheet.fldCheckPotencia_08 = not sheet.fldCheckPotencia_08;
            												
            												if(sheet.fldCheckPotencia_08) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            													sheet.fldCheckPotencia_05 = true; 
            													sheet.fldCheckPotencia_06 = true; 
            													sheet.fldCheckPotencia_07 = true; 
            												else 
            													sheet.fldCheckPotencia_01 = false; 
            													sheet.fldCheckPotencia_02 = false; 
            													sheet.fldCheckPotencia_03 = false; 
            													sheet.fldCheckPotencia_04 = false; 
            													sheet.fldCheckPotencia_05 = false; 
            													sheet.fldCheckPotencia_06 = false; 
            													sheet.fldCheckPotencia_07 = false; 
            												end;
            												
            												if(sheet.fldCheckPotencia_09) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            													sheet.fldCheckPotencia_05 = true; 
            													sheet.fldCheckPotencia_06 = true; 
            													sheet.fldCheckPotencia_07 = true; 
            													sheet.fldCheckPotencia_08 = true; 
            													sheet.fldCheckPotencia_09 = false; 
            													sheet.fldCheckPotencia_10 = false; 
            												end;
            											
        end, obj);

    obj._e_event312 = obj.nomeCheckPotencia_09:addEventListener("onClick",
        function (_)
            
            												sheet.fldCheckPotencia_09 = not sheet.fldCheckPotencia_09;
            												
            												if(sheet.fldCheckPotencia_09) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            													sheet.fldCheckPotencia_05 = true; 
            													sheet.fldCheckPotencia_06 = true; 
            													sheet.fldCheckPotencia_07 = true; 
            													sheet.fldCheckPotencia_08 = true; 
            												else 
            													sheet.fldCheckPotencia_01 = false; 
            													sheet.fldCheckPotencia_02 = false; 
            													sheet.fldCheckPotencia_03 = false; 
            													sheet.fldCheckPotencia_04 = false; 
            													sheet.fldCheckPotencia_05 = false; 
            													sheet.fldCheckPotencia_06 = false; 
            													sheet.fldCheckPotencia_07 = false; 
            													sheet.fldCheckPotencia_08 = false; 
            												end;
            												
            												if(sheet.fldCheckPotencia_10) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            													sheet.fldCheckPotencia_05 = true; 
            													sheet.fldCheckPotencia_06 = true; 
            													sheet.fldCheckPotencia_07 = true; 
            													sheet.fldCheckPotencia_08 = true; 
            													sheet.fldCheckPotencia_09 = true; 
            													sheet.fldCheckPotencia_10 = false; 
            												end;
            											
        end, obj);

    obj._e_event313 = obj.nomeCheckPotencia_10:addEventListener("onClick",
        function (_)
            
            												sheet.fldCheckPotencia_10 = not sheet.fldCheckPotencia_10;
            												
            												if(sheet.fldCheckPotencia_10) then 
            													sheet.fldCheckPotencia_01 = true; 
            													sheet.fldCheckPotencia_02 = true; 
            													sheet.fldCheckPotencia_03 = true; 
            													sheet.fldCheckPotencia_04 = true; 
            													sheet.fldCheckPotencia_05 = true; 
            													sheet.fldCheckPotencia_06 = true; 
            													sheet.fldCheckPotencia_07 = true; 
            													sheet.fldCheckPotencia_08 = true; 
            													sheet.fldCheckPotencia_09 = true; 
            												else 
            													sheet.fldCheckPotencia_01 = false; 
            													sheet.fldCheckPotencia_02 = false; 
            													sheet.fldCheckPotencia_03 = false; 
            													sheet.fldCheckPotencia_04 = false; 
            													sheet.fldCheckPotencia_05 = false; 
            													sheet.fldCheckPotencia_06 = false; 
            													sheet.fldCheckPotencia_07 = false; 
            													sheet.fldCheckPotencia_08 = false; 
            													sheet.fldCheckPotencia_09 = false; 
            												end;
            											
        end, obj);

    obj._e_event314 = obj.dataLink74:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet==nil) then return; end;
            													CalcSangue();
        end, obj);

    obj._e_event315 = obj.image6:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return end; TrocarAba('D');
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event315);
        __o_rrpgObjs.removeEventListenerById(self._e_event314);
        __o_rrpgObjs.removeEventListenerById(self._e_event313);
        __o_rrpgObjs.removeEventListenerById(self._e_event312);
        __o_rrpgObjs.removeEventListenerById(self._e_event311);
        __o_rrpgObjs.removeEventListenerById(self._e_event310);
        __o_rrpgObjs.removeEventListenerById(self._e_event309);
        __o_rrpgObjs.removeEventListenerById(self._e_event308);
        __o_rrpgObjs.removeEventListenerById(self._e_event307);
        __o_rrpgObjs.removeEventListenerById(self._e_event306);
        __o_rrpgObjs.removeEventListenerById(self._e_event305);
        __o_rrpgObjs.removeEventListenerById(self._e_event304);
        __o_rrpgObjs.removeEventListenerById(self._e_event303);
        __o_rrpgObjs.removeEventListenerById(self._e_event302);
        __o_rrpgObjs.removeEventListenerById(self._e_event301);
        __o_rrpgObjs.removeEventListenerById(self._e_event300);
        __o_rrpgObjs.removeEventListenerById(self._e_event299);
        __o_rrpgObjs.removeEventListenerById(self._e_event298);
        __o_rrpgObjs.removeEventListenerById(self._e_event297);
        __o_rrpgObjs.removeEventListenerById(self._e_event296);
        __o_rrpgObjs.removeEventListenerById(self._e_event295);
        __o_rrpgObjs.removeEventListenerById(self._e_event294);
        __o_rrpgObjs.removeEventListenerById(self._e_event293);
        __o_rrpgObjs.removeEventListenerById(self._e_event292);
        __o_rrpgObjs.removeEventListenerById(self._e_event291);
        __o_rrpgObjs.removeEventListenerById(self._e_event290);
        __o_rrpgObjs.removeEventListenerById(self._e_event289);
        __o_rrpgObjs.removeEventListenerById(self._e_event288);
        __o_rrpgObjs.removeEventListenerById(self._e_event287);
        __o_rrpgObjs.removeEventListenerById(self._e_event286);
        __o_rrpgObjs.removeEventListenerById(self._e_event285);
        __o_rrpgObjs.removeEventListenerById(self._e_event284);
        __o_rrpgObjs.removeEventListenerById(self._e_event283);
        __o_rrpgObjs.removeEventListenerById(self._e_event282);
        __o_rrpgObjs.removeEventListenerById(self._e_event281);
        __o_rrpgObjs.removeEventListenerById(self._e_event280);
        __o_rrpgObjs.removeEventListenerById(self._e_event279);
        __o_rrpgObjs.removeEventListenerById(self._e_event278);
        __o_rrpgObjs.removeEventListenerById(self._e_event277);
        __o_rrpgObjs.removeEventListenerById(self._e_event276);
        __o_rrpgObjs.removeEventListenerById(self._e_event275);
        __o_rrpgObjs.removeEventListenerById(self._e_event274);
        __o_rrpgObjs.removeEventListenerById(self._e_event273);
        __o_rrpgObjs.removeEventListenerById(self._e_event272);
        __o_rrpgObjs.removeEventListenerById(self._e_event271);
        __o_rrpgObjs.removeEventListenerById(self._e_event270);
        __o_rrpgObjs.removeEventListenerById(self._e_event269);
        __o_rrpgObjs.removeEventListenerById(self._e_event268);
        __o_rrpgObjs.removeEventListenerById(self._e_event267);
        __o_rrpgObjs.removeEventListenerById(self._e_event266);
        __o_rrpgObjs.removeEventListenerById(self._e_event265);
        __o_rrpgObjs.removeEventListenerById(self._e_event264);
        __o_rrpgObjs.removeEventListenerById(self._e_event263);
        __o_rrpgObjs.removeEventListenerById(self._e_event262);
        __o_rrpgObjs.removeEventListenerById(self._e_event261);
        __o_rrpgObjs.removeEventListenerById(self._e_event260);
        __o_rrpgObjs.removeEventListenerById(self._e_event259);
        __o_rrpgObjs.removeEventListenerById(self._e_event258);
        __o_rrpgObjs.removeEventListenerById(self._e_event257);
        __o_rrpgObjs.removeEventListenerById(self._e_event256);
        __o_rrpgObjs.removeEventListenerById(self._e_event255);
        __o_rrpgObjs.removeEventListenerById(self._e_event254);
        __o_rrpgObjs.removeEventListenerById(self._e_event253);
        __o_rrpgObjs.removeEventListenerById(self._e_event252);
        __o_rrpgObjs.removeEventListenerById(self._e_event251);
        __o_rrpgObjs.removeEventListenerById(self._e_event250);
        __o_rrpgObjs.removeEventListenerById(self._e_event249);
        __o_rrpgObjs.removeEventListenerById(self._e_event248);
        __o_rrpgObjs.removeEventListenerById(self._e_event247);
        __o_rrpgObjs.removeEventListenerById(self._e_event246);
        __o_rrpgObjs.removeEventListenerById(self._e_event245);
        __o_rrpgObjs.removeEventListenerById(self._e_event244);
        __o_rrpgObjs.removeEventListenerById(self._e_event243);
        __o_rrpgObjs.removeEventListenerById(self._e_event242);
        __o_rrpgObjs.removeEventListenerById(self._e_event241);
        __o_rrpgObjs.removeEventListenerById(self._e_event240);
        __o_rrpgObjs.removeEventListenerById(self._e_event239);
        __o_rrpgObjs.removeEventListenerById(self._e_event238);
        __o_rrpgObjs.removeEventListenerById(self._e_event237);
        __o_rrpgObjs.removeEventListenerById(self._e_event236);
        __o_rrpgObjs.removeEventListenerById(self._e_event235);
        __o_rrpgObjs.removeEventListenerById(self._e_event234);
        __o_rrpgObjs.removeEventListenerById(self._e_event233);
        __o_rrpgObjs.removeEventListenerById(self._e_event232);
        __o_rrpgObjs.removeEventListenerById(self._e_event231);
        __o_rrpgObjs.removeEventListenerById(self._e_event230);
        __o_rrpgObjs.removeEventListenerById(self._e_event229);
        __o_rrpgObjs.removeEventListenerById(self._e_event228);
        __o_rrpgObjs.removeEventListenerById(self._e_event227);
        __o_rrpgObjs.removeEventListenerById(self._e_event226);
        __o_rrpgObjs.removeEventListenerById(self._e_event225);
        __o_rrpgObjs.removeEventListenerById(self._e_event224);
        __o_rrpgObjs.removeEventListenerById(self._e_event223);
        __o_rrpgObjs.removeEventListenerById(self._e_event222);
        __o_rrpgObjs.removeEventListenerById(self._e_event221);
        __o_rrpgObjs.removeEventListenerById(self._e_event220);
        __o_rrpgObjs.removeEventListenerById(self._e_event219);
        __o_rrpgObjs.removeEventListenerById(self._e_event218);
        __o_rrpgObjs.removeEventListenerById(self._e_event217);
        __o_rrpgObjs.removeEventListenerById(self._e_event216);
        __o_rrpgObjs.removeEventListenerById(self._e_event215);
        __o_rrpgObjs.removeEventListenerById(self._e_event214);
        __o_rrpgObjs.removeEventListenerById(self._e_event213);
        __o_rrpgObjs.removeEventListenerById(self._e_event212);
        __o_rrpgObjs.removeEventListenerById(self._e_event211);
        __o_rrpgObjs.removeEventListenerById(self._e_event210);
        __o_rrpgObjs.removeEventListenerById(self._e_event209);
        __o_rrpgObjs.removeEventListenerById(self._e_event208);
        __o_rrpgObjs.removeEventListenerById(self._e_event207);
        __o_rrpgObjs.removeEventListenerById(self._e_event206);
        __o_rrpgObjs.removeEventListenerById(self._e_event205);
        __o_rrpgObjs.removeEventListenerById(self._e_event204);
        __o_rrpgObjs.removeEventListenerById(self._e_event203);
        __o_rrpgObjs.removeEventListenerById(self._e_event202);
        __o_rrpgObjs.removeEventListenerById(self._e_event201);
        __o_rrpgObjs.removeEventListenerById(self._e_event200);
        __o_rrpgObjs.removeEventListenerById(self._e_event199);
        __o_rrpgObjs.removeEventListenerById(self._e_event198);
        __o_rrpgObjs.removeEventListenerById(self._e_event197);
        __o_rrpgObjs.removeEventListenerById(self._e_event196);
        __o_rrpgObjs.removeEventListenerById(self._e_event195);
        __o_rrpgObjs.removeEventListenerById(self._e_event194);
        __o_rrpgObjs.removeEventListenerById(self._e_event193);
        __o_rrpgObjs.removeEventListenerById(self._e_event192);
        __o_rrpgObjs.removeEventListenerById(self._e_event191);
        __o_rrpgObjs.removeEventListenerById(self._e_event190);
        __o_rrpgObjs.removeEventListenerById(self._e_event189);
        __o_rrpgObjs.removeEventListenerById(self._e_event188);
        __o_rrpgObjs.removeEventListenerById(self._e_event187);
        __o_rrpgObjs.removeEventListenerById(self._e_event186);
        __o_rrpgObjs.removeEventListenerById(self._e_event185);
        __o_rrpgObjs.removeEventListenerById(self._e_event184);
        __o_rrpgObjs.removeEventListenerById(self._e_event183);
        __o_rrpgObjs.removeEventListenerById(self._e_event182);
        __o_rrpgObjs.removeEventListenerById(self._e_event181);
        __o_rrpgObjs.removeEventListenerById(self._e_event180);
        __o_rrpgObjs.removeEventListenerById(self._e_event179);
        __o_rrpgObjs.removeEventListenerById(self._e_event178);
        __o_rrpgObjs.removeEventListenerById(self._e_event177);
        __o_rrpgObjs.removeEventListenerById(self._e_event176);
        __o_rrpgObjs.removeEventListenerById(self._e_event175);
        __o_rrpgObjs.removeEventListenerById(self._e_event174);
        __o_rrpgObjs.removeEventListenerById(self._e_event173);
        __o_rrpgObjs.removeEventListenerById(self._e_event172);
        __o_rrpgObjs.removeEventListenerById(self._e_event171);
        __o_rrpgObjs.removeEventListenerById(self._e_event170);
        __o_rrpgObjs.removeEventListenerById(self._e_event169);
        __o_rrpgObjs.removeEventListenerById(self._e_event168);
        __o_rrpgObjs.removeEventListenerById(self._e_event167);
        __o_rrpgObjs.removeEventListenerById(self._e_event166);
        __o_rrpgObjs.removeEventListenerById(self._e_event165);
        __o_rrpgObjs.removeEventListenerById(self._e_event164);
        __o_rrpgObjs.removeEventListenerById(self._e_event163);
        __o_rrpgObjs.removeEventListenerById(self._e_event162);
        __o_rrpgObjs.removeEventListenerById(self._e_event161);
        __o_rrpgObjs.removeEventListenerById(self._e_event160);
        __o_rrpgObjs.removeEventListenerById(self._e_event159);
        __o_rrpgObjs.removeEventListenerById(self._e_event158);
        __o_rrpgObjs.removeEventListenerById(self._e_event157);
        __o_rrpgObjs.removeEventListenerById(self._e_event156);
        __o_rrpgObjs.removeEventListenerById(self._e_event155);
        __o_rrpgObjs.removeEventListenerById(self._e_event154);
        __o_rrpgObjs.removeEventListenerById(self._e_event153);
        __o_rrpgObjs.removeEventListenerById(self._e_event152);
        __o_rrpgObjs.removeEventListenerById(self._e_event151);
        __o_rrpgObjs.removeEventListenerById(self._e_event150);
        __o_rrpgObjs.removeEventListenerById(self._e_event149);
        __o_rrpgObjs.removeEventListenerById(self._e_event148);
        __o_rrpgObjs.removeEventListenerById(self._e_event147);
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
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

        if self.nomeCheck18_01 ~= nil then self.nomeCheck18_01:destroy(); self.nomeCheck18_01 = nil; end;
        if self.nomeCheck08_04 ~= nil then self.nomeCheck08_04:destroy(); self.nomeCheck08_04 = nil; end;
        if self.nomeCheck14_03 ~= nil then self.nomeCheck14_03:destroy(); self.nomeCheck14_03 = nil; end;
        if self.nomeCheck36_02 ~= nil then self.nomeCheck36_02:destroy(); self.nomeCheck36_02 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.nomeCheck11_02 ~= nil then self.nomeCheck11_02:destroy(); self.nomeCheck11_02 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.nomeCheck21_02 ~= nil then self.nomeCheck21_02:destroy(); self.nomeCheck21_02 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowPart106 ~= nil then self.flowPart106:destroy(); self.flowPart106 = nil; end;
        if self.nomeBut24B ~= nil then self.nomeBut24B:destroy(); self.nomeBut24B = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.nomeBut15 ~= nil then self.nomeBut15:destroy(); self.nomeBut15 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.checkMulVit_Des_04_Hum ~= nil then self.checkMulVit_Des_04_Hum:destroy(); self.checkMulVit_Des_04_Hum = nil; end;
        if self.checkMulVit_Des_10_Hum ~= nil then self.checkMulVit_Des_10_Hum:destroy(); self.checkMulVit_Des_10_Hum = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.popUp_33 ~= nil then self.popUp_33:destroy(); self.popUp_33 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.checkMulVit_Des_10_FdV ~= nil then self.checkMulVit_Des_10_FdV:destroy(); self.checkMulVit_Des_10_FdV = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.nomeCheck08_05 ~= nil then self.nomeCheck08_05:destroy(); self.nomeCheck08_05 = nil; end;
        if self.nomeCheck28_04 ~= nil then self.nomeCheck28_04:destroy(); self.nomeCheck28_04 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.flowPart107 ~= nil then self.flowPart107:destroy(); self.flowPart107 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.nomeCheck10_01 ~= nil then self.nomeCheck10_01:destroy(); self.nomeCheck10_01 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.textEditor27 ~= nil then self.textEditor27:destroy(); self.textEditor27 = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.nomeBut10 ~= nil then self.nomeBut10:destroy(); self.nomeBut10 = nil; end;
        if self.nomeCheck17_04 ~= nil then self.nomeCheck17_04:destroy(); self.nomeCheck17_04 = nil; end;
        if self.nomeBut27B ~= nil then self.nomeBut27B:destroy(); self.nomeBut27B = nil; end;
        if self.nomeCheck22_05 ~= nil then self.nomeCheck22_05:destroy(); self.nomeCheck22_05 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.nomeCheck27_04 ~= nil then self.nomeCheck27_04:destroy(); self.nomeCheck27_04 = nil; end;
        if self.flowPart103 ~= nil then self.flowPart103:destroy(); self.flowPart103 = nil; end;
        if self.nomeCheck26_02 ~= nil then self.nomeCheck26_02:destroy(); self.nomeCheck26_02 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.nomeBut30B ~= nil then self.nomeBut30B:destroy(); self.nomeBut30B = nil; end;
        if self.checkMulVit_Des_08_Vit ~= nil then self.checkMulVit_Des_08_Vit:destroy(); self.checkMulVit_Des_08_Vit = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.sangReroll ~= nil then self.sangReroll:destroy(); self.sangReroll = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.nomeBut17B ~= nil then self.nomeBut17B:destroy(); self.nomeBut17B = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.nomeCheck06_03 ~= nil then self.nomeCheck06_03:destroy(); self.nomeCheck06_03 = nil; end;
        if self.nomeCheck11_05 ~= nil then self.nomeCheck11_05:destroy(); self.nomeCheck11_05 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.nomeCheck17_02 ~= nil then self.nomeCheck17_02:destroy(); self.nomeCheck17_02 = nil; end;
        if self.nomeCheck34_05 ~= nil then self.nomeCheck34_05:destroy(); self.nomeCheck34_05 = nil; end;
        if self.nomeCheck13_05 ~= nil then self.nomeCheck13_05:destroy(); self.nomeCheck13_05 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.flowLayout31 ~= nil then self.flowLayout31:destroy(); self.flowLayout31 = nil; end;
        if self.checkMulVit_Des_03_Hum ~= nil then self.checkMulVit_Des_03_Hum:destroy(); self.checkMulVit_Des_03_Hum = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.nomeBut10B ~= nil then self.nomeBut10B:destroy(); self.nomeBut10B = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.sangBane ~= nil then self.sangBane:destroy(); self.sangBane = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.nomeCheck21_01 ~= nil then self.nomeCheck21_01:destroy(); self.nomeCheck21_01 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.nomeCheck14_05 ~= nil then self.nomeCheck14_05:destroy(); self.nomeCheck14_05 = nil; end;
        if self.nomeCheck07_04 ~= nil then self.nomeCheck07_04:destroy(); self.nomeCheck07_04 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.popUp_28 ~= nil then self.popUp_28:destroy(); self.popUp_28 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.nomeCheck15_02 ~= nil then self.nomeCheck15_02:destroy(); self.nomeCheck15_02 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.popUp_11 ~= nil then self.popUp_11:destroy(); self.popUp_11 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.popUp_10 ~= nil then self.popUp_10:destroy(); self.popUp_10 = nil; end;
        if self.popUp_30 ~= nil then self.popUp_30:destroy(); self.popUp_30 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.nomeCheck19_03 ~= nil then self.nomeCheck19_03:destroy(); self.nomeCheck19_03 = nil; end;
        if self.popUp_32 ~= nil then self.popUp_32:destroy(); self.popUp_32 = nil; end;
        if self.nomeCheck23_03 ~= nil then self.nomeCheck23_03:destroy(); self.nomeCheck23_03 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.nomeBut21 ~= nil then self.nomeBut21:destroy(); self.nomeBut21 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.nomeCheck01_04 ~= nil then self.nomeCheck01_04:destroy(); self.nomeCheck01_04 = nil; end;
        if self.nomeCheck26_01 ~= nil then self.nomeCheck26_01:destroy(); self.nomeCheck26_01 = nil; end;
        if self.nomeCheckPotencia_07 ~= nil then self.nomeCheckPotencia_07:destroy(); self.nomeCheckPotencia_07 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.nomeCheck07_03 ~= nil then self.nomeCheck07_03:destroy(); self.nomeCheck07_03 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.nomeCheck31_02 ~= nil then self.nomeCheck31_02:destroy(); self.nomeCheck31_02 = nil; end;
        if self.nomeCheckPotencia_03 ~= nil then self.nomeCheckPotencia_03:destroy(); self.nomeCheckPotencia_03 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.nomeCheck12_05 ~= nil then self.nomeCheck12_05:destroy(); self.nomeCheck12_05 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.nomeCheck12_01 ~= nil then self.nomeCheck12_01:destroy(); self.nomeCheck12_01 = nil; end;
        if self.checkMulVit_Des_05_FdV ~= nil then self.checkMulVit_Des_05_FdV:destroy(); self.checkMulVit_Des_05_FdV = nil; end;
        if self.nomeCheck28_05 ~= nil then self.nomeCheck28_05:destroy(); self.nomeCheck28_05 = nil; end;
        if self.popUp_26 ~= nil then self.popUp_26:destroy(); self.popUp_26 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.nomeCheck11_03 ~= nil then self.nomeCheck11_03:destroy(); self.nomeCheck11_03 = nil; end;
        if self.checkMulVit_Des_14_Vit ~= nil then self.checkMulVit_Des_14_Vit:destroy(); self.checkMulVit_Des_14_Vit = nil; end;
        if self.popUp_35 ~= nil then self.popUp_35:destroy(); self.popUp_35 = nil; end;
        if self.nomeCheck08_01 ~= nil then self.nomeCheck08_01:destroy(); self.nomeCheck08_01 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.nomeCheck27_01 ~= nil then self.nomeCheck27_01:destroy(); self.nomeCheck27_01 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.checkMulVit_Des_07_FdV ~= nil then self.checkMulVit_Des_07_FdV:destroy(); self.checkMulVit_Des_07_FdV = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.flowLayout27 ~= nil then self.flowLayout27:destroy(); self.flowLayout27 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.nomeCheck03_01 ~= nil then self.nomeCheck03_01:destroy(); self.nomeCheck03_01 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.nomeCheck22_04 ~= nil then self.nomeCheck22_04:destroy(); self.nomeCheck22_04 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.nomeBut36B ~= nil then self.nomeBut36B:destroy(); self.nomeBut36B = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.checkMulVit_Des_08_FdV ~= nil then self.checkMulVit_Des_08_FdV:destroy(); self.checkMulVit_Des_08_FdV = nil; end;
        if self.nomeBut36 ~= nil then self.nomeBut36:destroy(); self.nomeBut36 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.nomeCheck20_04 ~= nil then self.nomeCheck20_04:destroy(); self.nomeCheck20_04 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.nomeCheck09_02 ~= nil then self.nomeCheck09_02:destroy(); self.nomeCheck09_02 = nil; end;
        if self.nomeCheck23_01 ~= nil then self.nomeCheck23_01:destroy(); self.nomeCheck23_01 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.nomeBut14 ~= nil then self.nomeBut14:destroy(); self.nomeBut14 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.checkMulVit_Des_01_Vit ~= nil then self.checkMulVit_Des_01_Vit:destroy(); self.checkMulVit_Des_01_Vit = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.nomeBut28 ~= nil then self.nomeBut28:destroy(); self.nomeBut28 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.nomeCheckPotencia_09 ~= nil then self.nomeCheckPotencia_09:destroy(); self.nomeCheckPotencia_09 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.flowLayout36 ~= nil then self.flowLayout36:destroy(); self.flowLayout36 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.nomeBut16B ~= nil then self.nomeBut16B:destroy(); self.nomeBut16B = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.nomeBut34B ~= nil then self.nomeBut34B:destroy(); self.nomeBut34B = nil; end;
        if self.popUp_25 ~= nil then self.popUp_25:destroy(); self.popUp_25 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.nomeCheck14_04 ~= nil then self.nomeCheck14_04:destroy(); self.nomeCheck14_04 = nil; end;
        if self.nomeCheck10_03 ~= nil then self.nomeCheck10_03:destroy(); self.nomeCheck10_03 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.flowPart108 ~= nil then self.flowPart108:destroy(); self.flowPart108 = nil; end;
        if self.nomeCheck20_01 ~= nil then self.nomeCheck20_01:destroy(); self.nomeCheck20_01 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.nomeCheck02_03 ~= nil then self.nomeCheck02_03:destroy(); self.nomeCheck02_03 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.popUp_20 ~= nil then self.popUp_20:destroy(); self.popUp_20 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.nomeBut11B ~= nil then self.nomeBut11B:destroy(); self.nomeBut11B = nil; end;
        if self.nomeCheck07_02 ~= nil then self.nomeCheck07_02:destroy(); self.nomeCheck07_02 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.nomeCheck16_02 ~= nil then self.nomeCheck16_02:destroy(); self.nomeCheck16_02 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.nomeCheck15_03 ~= nil then self.nomeCheck15_03:destroy(); self.nomeCheck15_03 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.nomeCheck09_01 ~= nil then self.nomeCheck09_01:destroy(); self.nomeCheck09_01 = nil; end;
        if self.nomeBut12 ~= nil then self.nomeBut12:destroy(); self.nomeBut12 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.nomeCheck04_01 ~= nil then self.nomeCheck04_01:destroy(); self.nomeCheck04_01 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.nomeCheck15_01 ~= nil then self.nomeCheck15_01:destroy(); self.nomeCheck15_01 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.nomeCheck01_03 ~= nil then self.nomeCheck01_03:destroy(); self.nomeCheck01_03 = nil; end;
        if self.nomeBut26 ~= nil then self.nomeBut26:destroy(); self.nomeBut26 = nil; end;
        if self.nomeBut31B ~= nil then self.nomeBut31B:destroy(); self.nomeBut31B = nil; end;
        if self.nomeCheck05_02 ~= nil then self.nomeCheck05_02:destroy(); self.nomeCheck05_02 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.checkMulVit_Des_02_FdV ~= nil then self.checkMulVit_Des_02_FdV:destroy(); self.checkMulVit_Des_02_FdV = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.sangFeed ~= nil then self.sangFeed:destroy(); self.sangFeed = nil; end;
        if self.nomeCheck14_01 ~= nil then self.nomeCheck14_01:destroy(); self.nomeCheck14_01 = nil; end;
        if self.flowLayout29 ~= nil then self.flowLayout29:destroy(); self.flowLayout29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.nomeCheck31_04 ~= nil then self.nomeCheck31_04:destroy(); self.nomeCheck31_04 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.nomeCheckPotencia_10 ~= nil then self.nomeCheckPotencia_10:destroy(); self.nomeCheckPotencia_10 = nil; end;
        if self.nomeCheck22_03 ~= nil then self.nomeCheck22_03:destroy(); self.nomeCheck22_03 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.flowPart105 ~= nil then self.flowPart105:destroy(); self.flowPart105 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.nomeBut26B ~= nil then self.nomeBut26B:destroy(); self.nomeBut26B = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.popUp_17 ~= nil then self.popUp_17:destroy(); self.popUp_17 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.nomeCheck12_02 ~= nil then self.nomeCheck12_02:destroy(); self.nomeCheck12_02 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.nomeCheck34_02 ~= nil then self.nomeCheck34_02:destroy(); self.nomeCheck34_02 = nil; end;
        if self.nomeCheck34_03 ~= nil then self.nomeCheck34_03:destroy(); self.nomeCheck34_03 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.textEditor26 ~= nil then self.textEditor26:destroy(); self.textEditor26 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.nomeCheck04_03 ~= nil then self.nomeCheck04_03:destroy(); self.nomeCheck04_03 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.nomeCheck16_03 ~= nil then self.nomeCheck16_03:destroy(); self.nomeCheck16_03 = nil; end;
        if self.nomeBut32 ~= nil then self.nomeBut32:destroy(); self.nomeBut32 = nil; end;
        if self.nomeCheck32_05 ~= nil then self.nomeCheck32_05:destroy(); self.nomeCheck32_05 = nil; end;
        if self.nomeCheck35_01 ~= nil then self.nomeCheck35_01:destroy(); self.nomeCheck35_01 = nil; end;
        if self.nomeCheckPotencia_08 ~= nil then self.nomeCheckPotencia_08:destroy(); self.nomeCheckPotencia_08 = nil; end;
        if self.nomeCheck10_04 ~= nil then self.nomeCheck10_04:destroy(); self.nomeCheck10_04 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.textEditor23 ~= nil then self.textEditor23:destroy(); self.textEditor23 = nil; end;
        if self.nomeCheck07_05 ~= nil then self.nomeCheck07_05:destroy(); self.nomeCheck07_05 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.nomeCheck01_05 ~= nil then self.nomeCheck01_05:destroy(); self.nomeCheck01_05 = nil; end;
        if self.nomeCheck36_03 ~= nil then self.nomeCheck36_03:destroy(); self.nomeCheck36_03 = nil; end;
        if self.nomeCheck12_04 ~= nil then self.nomeCheck12_04:destroy(); self.nomeCheck12_04 = nil; end;
        if self.nomeCheck16_01 ~= nil then self.nomeCheck16_01:destroy(); self.nomeCheck16_01 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.nomeBut19 ~= nil then self.nomeBut19:destroy(); self.nomeBut19 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.nomeBut31 ~= nil then self.nomeBut31:destroy(); self.nomeBut31 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.layNote ~= nil then self.layNote:destroy(); self.layNote = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.flowPart109 ~= nil then self.flowPart109:destroy(); self.flowPart109 = nil; end;
        if self.popUp_22 ~= nil then self.popUp_22:destroy(); self.popUp_22 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.nomeCheck31_05 ~= nil then self.nomeCheck31_05:destroy(); self.nomeCheck31_05 = nil; end;
        if self.rclDisciplinas ~= nil then self.rclDisciplinas:destroy(); self.rclDisciplinas = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.nomeBut25 ~= nil then self.nomeBut25:destroy(); self.nomeBut25 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.nomeCheck17_01 ~= nil then self.nomeCheck17_01:destroy(); self.nomeCheck17_01 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.nomeCheckPotencia_04 ~= nil then self.nomeCheckPotencia_04:destroy(); self.nomeCheckPotencia_04 = nil; end;
        if self.nomeCheck30_05 ~= nil then self.nomeCheck30_05:destroy(); self.nomeCheck30_05 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.sangBonus ~= nil then self.sangBonus:destroy(); self.sangBonus = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.nomeCheck18_03 ~= nil then self.nomeCheck18_03:destroy(); self.nomeCheck18_03 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.nomeBut23 ~= nil then self.nomeBut23:destroy(); self.nomeBut23 = nil; end;
        if self.checkMulVit_Des_06_Hum ~= nil then self.checkMulVit_Des_06_Hum:destroy(); self.checkMulVit_Des_06_Hum = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.nomeCheckPotencia_02 ~= nil then self.nomeCheckPotencia_02:destroy(); self.nomeCheckPotencia_02 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.nomeBut34 ~= nil then self.nomeBut34:destroy(); self.nomeBut34 = nil; end;
        if self.nomeCheck20_05 ~= nil then self.nomeCheck20_05:destroy(); self.nomeCheck20_05 = nil; end;
        if self.sangSurto ~= nil then self.sangSurto:destroy(); self.sangSurto = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.nomeBut35 ~= nil then self.nomeBut35:destroy(); self.nomeBut35 = nil; end;
        if self.nomeCheck06_02 ~= nil then self.nomeCheck06_02:destroy(); self.nomeCheck06_02 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.nomeCheck26_03 ~= nil then self.nomeCheck26_03:destroy(); self.nomeCheck26_03 = nil; end;
        if self.popUp_29 ~= nil then self.popUp_29:destroy(); self.popUp_29 = nil; end;
        if self.nomeBut33B ~= nil then self.nomeBut33B:destroy(); self.nomeBut33B = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.nomeCheck24_01 ~= nil then self.nomeCheck24_01:destroy(); self.nomeCheck24_01 = nil; end;
        if self.nomeCheck33_03 ~= nil then self.nomeCheck33_03:destroy(); self.nomeCheck33_03 = nil; end;
        if self.nomeBut13 ~= nil then self.nomeBut13:destroy(); self.nomeBut13 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.nomeCheck17_05 ~= nil then self.nomeCheck17_05:destroy(); self.nomeCheck17_05 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.nomeCheck36_05 ~= nil then self.nomeCheck36_05:destroy(); self.nomeCheck36_05 = nil; end;
        if self.sangRegen ~= nil then self.sangRegen:destroy(); self.sangRegen = nil; end;
        if self.popUp_18 ~= nil then self.popUp_18:destroy(); self.popUp_18 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.nomeCheck19_02 ~= nil then self.nomeCheck19_02:destroy(); self.nomeCheck19_02 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.nomeCheck28_01 ~= nil then self.nomeCheck28_01:destroy(); self.nomeCheck28_01 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.nomeBut19B ~= nil then self.nomeBut19B:destroy(); self.nomeBut19B = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.nomeBut23B ~= nil then self.nomeBut23B:destroy(); self.nomeBut23B = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.nomeCheck02_04 ~= nil then self.nomeCheck02_04:destroy(); self.nomeCheck02_04 = nil; end;
        if self.popUp_14 ~= nil then self.popUp_14:destroy(); self.popUp_14 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.nomeCheck24_02 ~= nil then self.nomeCheck24_02:destroy(); self.nomeCheck24_02 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.checkMulVit_Des_06_FdV ~= nil then self.checkMulVit_Des_06_FdV:destroy(); self.checkMulVit_Des_06_FdV = nil; end;
        if self.nomeCheck18_05 ~= nil then self.nomeCheck18_05:destroy(); self.nomeCheck18_05 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.nomeCheck29_05 ~= nil then self.nomeCheck29_05:destroy(); self.nomeCheck29_05 = nil; end;
        if self.nomeCheck25_02 ~= nil then self.nomeCheck25_02:destroy(); self.nomeCheck25_02 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.checkMulVit_Des_15_Vit ~= nil then self.checkMulVit_Des_15_Vit:destroy(); self.checkMulVit_Des_15_Vit = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.checkMulVit_Des_02_Vit ~= nil then self.checkMulVit_Des_02_Vit:destroy(); self.checkMulVit_Des_02_Vit = nil; end;
        if self.nomeCheck24_04 ~= nil then self.nomeCheck24_04:destroy(); self.nomeCheck24_04 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.checkMulVit_Des_12_Vit ~= nil then self.checkMulVit_Des_12_Vit:destroy(); self.checkMulVit_Des_12_Vit = nil; end;
        if self.popUp_27 ~= nil then self.popUp_27:destroy(); self.popUp_27 = nil; end;
        if self.nomeVER_Perdicao ~= nil then self.nomeVER_Perdicao:destroy(); self.nomeVER_Perdicao = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.nomeCheck05_03 ~= nil then self.nomeCheck05_03:destroy(); self.nomeCheck05_03 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.nomeCheck21_04 ~= nil then self.nomeCheck21_04:destroy(); self.nomeCheck21_04 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.nomeCheck01_02 ~= nil then self.nomeCheck01_02:destroy(); self.nomeCheck01_02 = nil; end;
        if self.flowLayout30 ~= nil then self.flowLayout30:destroy(); self.flowLayout30 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.nomeCheck13_01 ~= nil then self.nomeCheck13_01:destroy(); self.nomeCheck13_01 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.nomeCheck34_04 ~= nil then self.nomeCheck34_04:destroy(); self.nomeCheck34_04 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.popUp_15 ~= nil then self.popUp_15:destroy(); self.popUp_15 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.nomeCheck06_05 ~= nil then self.nomeCheck06_05:destroy(); self.nomeCheck06_05 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.nomeVER_Pilar ~= nil then self.nomeVER_Pilar:destroy(); self.nomeVER_Pilar = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.nomeBut27 ~= nil then self.nomeBut27:destroy(); self.nomeBut27 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.flowLayout33 ~= nil then self.flowLayout33:destroy(); self.flowLayout33 = nil; end;
        if self.nomeCheck25_01 ~= nil then self.nomeCheck25_01:destroy(); self.nomeCheck25_01 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.nomeCheck21_05 ~= nil then self.nomeCheck21_05:destroy(); self.nomeCheck21_05 = nil; end;
        if self.nomeCheck09_04 ~= nil then self.nomeCheck09_04:destroy(); self.nomeCheck09_04 = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.nomeBG ~= nil then self.nomeBG:destroy(); self.nomeBG = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.nomeCheck29_04 ~= nil then self.nomeCheck29_04:destroy(); self.nomeCheck29_04 = nil; end;
        if self.nomeCheck04_05 ~= nil then self.nomeCheck04_05:destroy(); self.nomeCheck04_05 = nil; end;
        if self.nomeCheck10_05 ~= nil then self.nomeCheck10_05:destroy(); self.nomeCheck10_05 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.nomeBut13B ~= nil then self.nomeBut13B:destroy(); self.nomeBut13B = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.nomeCheck21_03 ~= nil then self.nomeCheck21_03:destroy(); self.nomeCheck21_03 = nil; end;
        if self.nomeCheck25_03 ~= nil then self.nomeCheck25_03:destroy(); self.nomeCheck25_03 = nil; end;
        if self.nomeBut18 ~= nil then self.nomeBut18:destroy(); self.nomeBut18 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.nomeCheck05_01 ~= nil then self.nomeCheck05_01:destroy(); self.nomeCheck05_01 = nil; end;
        if self.nomeCheck32_03 ~= nil then self.nomeCheck32_03:destroy(); self.nomeCheck32_03 = nil; end;
        if self.popUp_13 ~= nil then self.popUp_13:destroy(); self.popUp_13 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.nomeCheck23_02 ~= nil then self.nomeCheck23_02:destroy(); self.nomeCheck23_02 = nil; end;
        if self.nomeCheck33_02 ~= nil then self.nomeCheck33_02:destroy(); self.nomeCheck33_02 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.nomeCheck20_02 ~= nil then self.nomeCheck20_02:destroy(); self.nomeCheck20_02 = nil; end;
        if self.flowPart104 ~= nil then self.flowPart104:destroy(); self.flowPart104 = nil; end;
        if self.nomeCheck05_05 ~= nil then self.nomeCheck05_05:destroy(); self.nomeCheck05_05 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.flowLayout32 ~= nil then self.flowLayout32:destroy(); self.flowLayout32 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.nomeCheck27_02 ~= nil then self.nomeCheck27_02:destroy(); self.nomeCheck27_02 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.checkMulVit_Des_07_Vit ~= nil then self.checkMulVit_Des_07_Vit:destroy(); self.checkMulVit_Des_07_Vit = nil; end;
        if self.nomeCheck36_01 ~= nil then self.nomeCheck36_01:destroy(); self.nomeCheck36_01 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.checkMulVit_Des_01_FdV ~= nil then self.checkMulVit_Des_01_FdV:destroy(); self.checkMulVit_Des_01_FdV = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.nomeBut30 ~= nil then self.nomeBut30:destroy(); self.nomeBut30 = nil; end;
        if self.nomeBut33 ~= nil then self.nomeBut33:destroy(); self.nomeBut33 = nil; end;
        if self.nomeCheckPotencia_01 ~= nil then self.nomeCheckPotencia_01:destroy(); self.nomeCheckPotencia_01 = nil; end;
        if self.nomeCheck30_01 ~= nil then self.nomeCheck30_01:destroy(); self.nomeCheck30_01 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.nomeCheck05_04 ~= nil then self.nomeCheck05_04:destroy(); self.nomeCheck05_04 = nil; end;
        if self.nomeCheck08_02 ~= nil then self.nomeCheck08_02:destroy(); self.nomeCheck08_02 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.checkMulVit_Des_10_Vit ~= nil then self.checkMulVit_Des_10_Vit:destroy(); self.checkMulVit_Des_10_Vit = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.flowPart102 ~= nil then self.flowPart102:destroy(); self.flowPart102 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.nomeBut24 ~= nil then self.nomeBut24:destroy(); self.nomeBut24 = nil; end;
        if self.nomeBut12B ~= nil then self.nomeBut12B:destroy(); self.nomeBut12B = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.nomeBut35B ~= nil then self.nomeBut35B:destroy(); self.nomeBut35B = nil; end;
        if self.nomeCheck20_03 ~= nil then self.nomeCheck20_03:destroy(); self.nomeCheck20_03 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.nomeCheck31_01 ~= nil then self.nomeCheck31_01:destroy(); self.nomeCheck31_01 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.nomeCheck29_02 ~= nil then self.nomeCheck29_02:destroy(); self.nomeCheck29_02 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.flowLayout26 ~= nil then self.flowLayout26:destroy(); self.flowLayout26 = nil; end;
        if self.nomeBut20 ~= nil then self.nomeBut20:destroy(); self.nomeBut20 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.nomeBut29B ~= nil then self.nomeBut29B:destroy(); self.nomeBut29B = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.nomeCheck33_04 ~= nil then self.nomeCheck33_04:destroy(); self.nomeCheck33_04 = nil; end;
        if self.flowPart110 ~= nil then self.flowPart110:destroy(); self.flowPart110 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.nomeCheck19_01 ~= nil then self.nomeCheck19_01:destroy(); self.nomeCheck19_01 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.nomeCheck32_02 ~= nil then self.nomeCheck32_02:destroy(); self.nomeCheck32_02 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.popUp_19 ~= nil then self.popUp_19:destroy(); self.popUp_19 = nil; end;
        if self.nomeBut17 ~= nil then self.nomeBut17:destroy(); self.nomeBut17 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.popUp_16 ~= nil then self.popUp_16:destroy(); self.popUp_16 = nil; end;
        if self.nomeCheck30_04 ~= nil then self.nomeCheck30_04:destroy(); self.nomeCheck30_04 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.nomeBut28B ~= nil then self.nomeBut28B:destroy(); self.nomeBut28B = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.nomeCheck06_04 ~= nil then self.nomeCheck06_04:destroy(); self.nomeCheck06_04 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.nomeBut20B ~= nil then self.nomeBut20B:destroy(); self.nomeBut20B = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.checkMulVit_Des_01_Hum ~= nil then self.checkMulVit_Des_01_Hum:destroy(); self.checkMulVit_Des_01_Hum = nil; end;
        if self.nomeCheck18_04 ~= nil then self.nomeCheck18_04:destroy(); self.nomeCheck18_04 = nil; end;
        if self.nomeCheck09_03 ~= nil then self.nomeCheck09_03:destroy(); self.nomeCheck09_03 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.popUp_23 ~= nil then self.popUp_23:destroy(); self.popUp_23 = nil; end;
        if self.nomeCheck26_04 ~= nil then self.nomeCheck26_04:destroy(); self.nomeCheck26_04 = nil; end;
        if self.checkMulVit_Des_09_Vit ~= nil then self.checkMulVit_Des_09_Vit:destroy(); self.checkMulVit_Des_09_Vit = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.nomeBut16 ~= nil then self.nomeBut16:destroy(); self.nomeBut16 = nil; end;
        if self.nomeBut22 ~= nil then self.nomeBut22:destroy(); self.nomeBut22 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.textEditor25 ~= nil then self.textEditor25:destroy(); self.textEditor25 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.nomeCheck14_02 ~= nil then self.nomeCheck14_02:destroy(); self.nomeCheck14_02 = nil; end;
        if self.nomeCheck11_01 ~= nil then self.nomeCheck11_01:destroy(); self.nomeCheck11_01 = nil; end;
        if self.nomeBut22B ~= nil then self.nomeBut22B:destroy(); self.nomeBut22B = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.nomeCheck35_04 ~= nil then self.nomeCheck35_04:destroy(); self.nomeCheck35_04 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.nomeBut32B ~= nil then self.nomeBut32B:destroy(); self.nomeBut32B = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.nomeCheck31_03 ~= nil then self.nomeCheck31_03:destroy(); self.nomeCheck31_03 = nil; end;
        if self.nomeCheck19_04 ~= nil then self.nomeCheck19_04:destroy(); self.nomeCheck19_04 = nil; end;
        if self.nomeCheck30_02 ~= nil then self.nomeCheck30_02:destroy(); self.nomeCheck30_02 = nil; end;
        if self.nomeCheck02_05 ~= nil then self.nomeCheck02_05:destroy(); self.nomeCheck02_05 = nil; end;
        if self.nomeCheck29_01 ~= nil then self.nomeCheck29_01:destroy(); self.nomeCheck29_01 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.nomeCheck16_05 ~= nil then self.nomeCheck16_05:destroy(); self.nomeCheck16_05 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.nomeCheck06_01 ~= nil then self.nomeCheck06_01:destroy(); self.nomeCheck06_01 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.checkMulVit_Des_04_Vit ~= nil then self.checkMulVit_Des_04_Vit:destroy(); self.checkMulVit_Des_04_Vit = nil; end;
        if self.popUp_36 ~= nil then self.popUp_36:destroy(); self.popUp_36 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.checkMulVit_Des_03_Vit ~= nil then self.checkMulVit_Des_03_Vit:destroy(); self.checkMulVit_Des_03_Vit = nil; end;
        if self.checkMulVit_Des_02_Hum ~= nil then self.checkMulVit_Des_02_Hum:destroy(); self.checkMulVit_Des_02_Hum = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.nomeCheck13_02 ~= nil then self.nomeCheck13_02:destroy(); self.nomeCheck13_02 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.nomeCheck27_03 ~= nil then self.nomeCheck27_03:destroy(); self.nomeCheck27_03 = nil; end;
        if self.nomeCheck03_02 ~= nil then self.nomeCheck03_02:destroy(); self.nomeCheck03_02 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.nomeCheck11_04 ~= nil then self.nomeCheck11_04:destroy(); self.nomeCheck11_04 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.nomeCheck15_04 ~= nil then self.nomeCheck15_04:destroy(); self.nomeCheck15_04 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.layVerso ~= nil then self.layVerso:destroy(); self.layVerso = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.nomeCheck03_04 ~= nil then self.nomeCheck03_04:destroy(); self.nomeCheck03_04 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.nomeCheckPotencia_05 ~= nil then self.nomeCheckPotencia_05:destroy(); self.nomeCheckPotencia_05 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.nomeCheck27_05 ~= nil then self.nomeCheck27_05:destroy(); self.nomeCheck27_05 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.nomeCheck15_05 ~= nil then self.nomeCheck15_05:destroy(); self.nomeCheck15_05 = nil; end;
        if self.nomeBut15B ~= nil then self.nomeBut15B:destroy(); self.nomeBut15B = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.nomeCheck34_01 ~= nil then self.nomeCheck34_01:destroy(); self.nomeCheck34_01 = nil; end;
        if self.flowLayout35 ~= nil then self.flowLayout35:destroy(); self.flowLayout35 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.checkMulVit_Des_05_Vit ~= nil then self.checkMulVit_Des_05_Vit:destroy(); self.checkMulVit_Des_05_Vit = nil; end;
        if self.nomeCheck08_03 ~= nil then self.nomeCheck08_03:destroy(); self.nomeCheck08_03 = nil; end;
        if self.nomeCheck02_02 ~= nil then self.nomeCheck02_02:destroy(); self.nomeCheck02_02 = nil; end;
        if self.nomeCheck22_02 ~= nil then self.nomeCheck22_02:destroy(); self.nomeCheck22_02 = nil; end;
        if self.checkMulVit_Des_04_FdV ~= nil then self.checkMulVit_Des_04_FdV:destroy(); self.checkMulVit_Des_04_FdV = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.popUp_24 ~= nil then self.popUp_24:destroy(); self.popUp_24 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.nomeCheck26_05 ~= nil then self.nomeCheck26_05:destroy(); self.nomeCheck26_05 = nil; end;
        if self.popUp_21 ~= nil then self.popUp_21:destroy(); self.popUp_21 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.nomeCheck35_02 ~= nil then self.nomeCheck35_02:destroy(); self.nomeCheck35_02 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.checkMulVit_Des_08_Hum ~= nil then self.checkMulVit_Des_08_Hum:destroy(); self.checkMulVit_Des_08_Hum = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.nomeCheck03_03 ~= nil then self.nomeCheck03_03:destroy(); self.nomeCheck03_03 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.nomeBut25B ~= nil then self.nomeBut25B:destroy(); self.nomeBut25B = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.nomeCheck18_02 ~= nil then self.nomeCheck18_02:destroy(); self.nomeCheck18_02 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.nomeCheck23_05 ~= nil then self.nomeCheck23_05:destroy(); self.nomeCheck23_05 = nil; end;
        if self.nomeCheck32_04 ~= nil then self.nomeCheck32_04:destroy(); self.nomeCheck32_04 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.nomeCheck33_01 ~= nil then self.nomeCheck33_01:destroy(); self.nomeCheck33_01 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.checkMulVit_Des_11_Vit ~= nil then self.checkMulVit_Des_11_Vit:destroy(); self.checkMulVit_Des_11_Vit = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.checkMulVit_Des_13_Vit ~= nil then self.checkMulVit_Des_13_Vit:destroy(); self.checkMulVit_Des_13_Vit = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.nomeCheck19_05 ~= nil then self.nomeCheck19_05:destroy(); self.nomeCheck19_05 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.nomeCheck28_02 ~= nil then self.nomeCheck28_02:destroy(); self.nomeCheck28_02 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.checkMulVit_Des_03_FdV ~= nil then self.checkMulVit_Des_03_FdV:destroy(); self.checkMulVit_Des_03_FdV = nil; end;
        if self.nomeCheck16_04 ~= nil then self.nomeCheck16_04:destroy(); self.nomeCheck16_04 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.nomeCheck32_01 ~= nil then self.nomeCheck32_01:destroy(); self.nomeCheck32_01 = nil; end;
        if self.nomeCheck22_01 ~= nil then self.nomeCheck22_01:destroy(); self.nomeCheck22_01 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.checkMulVit_Des_07_Hum ~= nil then self.checkMulVit_Des_07_Hum:destroy(); self.checkMulVit_Des_07_Hum = nil; end;
        if self.checkMulVit_Des_09_FdV ~= nil then self.checkMulVit_Des_09_FdV:destroy(); self.checkMulVit_Des_09_FdV = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.frmTemplates ~= nil then self.frmTemplates:destroy(); self.frmTemplates = nil; end;
        if self.checkMulVit_Des_05_Hum ~= nil then self.checkMulVit_Des_05_Hum:destroy(); self.checkMulVit_Des_05_Hum = nil; end;
        if self.checkMulVit_Des_09_Hum ~= nil then self.checkMulVit_Des_09_Hum:destroy(); self.checkMulVit_Des_09_Hum = nil; end;
        if self.popUp_34 ~= nil then self.popUp_34:destroy(); self.popUp_34 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.nomeBut29 ~= nil then self.nomeBut29:destroy(); self.nomeBut29 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.textEditor24 ~= nil then self.textEditor24:destroy(); self.textEditor24 = nil; end;
        if self.nomeCheck10_02 ~= nil then self.nomeCheck10_02:destroy(); self.nomeCheck10_02 = nil; end;
        if self.nomeCheck12_03 ~= nil then self.nomeCheck12_03:destroy(); self.nomeCheck12_03 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.nomeCheck29_03 ~= nil then self.nomeCheck29_03:destroy(); self.nomeCheck29_03 = nil; end;
        if self.nomeCheck35_03 ~= nil then self.nomeCheck35_03:destroy(); self.nomeCheck35_03 = nil; end;
        if self.nomeCheck01_01 ~= nil then self.nomeCheck01_01:destroy(); self.nomeCheck01_01 = nil; end;
        if self.nomeCheck07_01 ~= nil then self.nomeCheck07_01:destroy(); self.nomeCheck07_01 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.checkMulVit_Des_06_Vit ~= nil then self.checkMulVit_Des_06_Vit:destroy(); self.checkMulVit_Des_06_Vit = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.rclVantagens ~= nil then self.rclVantagens:destroy(); self.rclVantagens = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.nomeCheck13_04 ~= nil then self.nomeCheck13_04:destroy(); self.nomeCheck13_04 = nil; end;
        if self.nomeCheck24_03 ~= nil then self.nomeCheck24_03:destroy(); self.nomeCheck24_03 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.nomeCheck04_02 ~= nil then self.nomeCheck04_02:destroy(); self.nomeCheck04_02 = nil; end;
        if self.nomeCheck04_04 ~= nil then self.nomeCheck04_04:destroy(); self.nomeCheck04_04 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.nomeVER_Cronica ~= nil then self.nomeVER_Cronica:destroy(); self.nomeVER_Cronica = nil; end;
        if self.nomeCheckPotencia_06 ~= nil then self.nomeCheckPotencia_06:destroy(); self.nomeCheckPotencia_06 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.nomeCheck02_01 ~= nil then self.nomeCheck02_01:destroy(); self.nomeCheck02_01 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.nomeCheck03_05 ~= nil then self.nomeCheck03_05:destroy(); self.nomeCheck03_05 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.nomeBut18B ~= nil then self.nomeBut18B:destroy(); self.nomeBut18B = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.nomeCheck30_03 ~= nil then self.nomeCheck30_03:destroy(); self.nomeCheck30_03 = nil; end;
        if self.nomeCheck17_03 ~= nil then self.nomeCheck17_03:destroy(); self.nomeCheck17_03 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.nomeBut14B ~= nil then self.nomeBut14B:destroy(); self.nomeBut14B = nil; end;
        if self.nomeCheck25_05 ~= nil then self.nomeCheck25_05:destroy(); self.nomeCheck25_05 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.flowPart111 ~= nil then self.flowPart111:destroy(); self.flowPart111 = nil; end;
        if self.flowLayout34 ~= nil then self.flowLayout34:destroy(); self.flowLayout34 = nil; end;
        if self.nomeCheck35_05 ~= nil then self.nomeCheck35_05:destroy(); self.nomeCheck35_05 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.nomeCheck13_03 ~= nil then self.nomeCheck13_03:destroy(); self.nomeCheck13_03 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.popUp_31 ~= nil then self.popUp_31:destroy(); self.popUp_31 = nil; end;
        if self.layFrente ~= nil then self.layFrente:destroy(); self.layFrente = nil; end;
        if self.nomeCheck24_05 ~= nil then self.nomeCheck24_05:destroy(); self.nomeCheck24_05 = nil; end;
        if self.nomeCheck33_05 ~= nil then self.nomeCheck33_05:destroy(); self.nomeCheck33_05 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.nomeCheck25_04 ~= nil then self.nomeCheck25_04:destroy(); self.nomeCheck25_04 = nil; end;
        if self.nomeCheck28_03 ~= nil then self.nomeCheck28_03:destroy(); self.nomeCheck28_03 = nil; end;
        if self.flowLayout28 ~= nil then self.flowLayout28:destroy(); self.flowLayout28 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.nomeCheck36_04 ~= nil then self.nomeCheck36_04:destroy(); self.nomeCheck36_04 = nil; end;
        if self.nomeBut21B ~= nil then self.nomeBut21B:destroy(); self.nomeBut21B = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.nomeCheck09_05 ~= nil then self.nomeCheck09_05:destroy(); self.nomeCheck09_05 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.nomeCheck23_04 ~= nil then self.nomeCheck23_04:destroy(); self.nomeCheck23_04 = nil; end;
        if self.nomeBut11 ~= nil then self.nomeBut11:destroy(); self.nomeBut11 = nil; end;
        if self.popUp_12 ~= nil then self.popUp_12:destroy(); self.popUp_12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmVaMv5()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmVaMv5();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmVaMv5 = {
    newEditor = newfrmVaMv5, 
    new = newfrmVaMv5, 
    name = "frmVaMv5", 
    dataType = "thirteen.VaMv5", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "V:aM V5", 
    description=""};

frmVaMv5 = _frmVaMv5;
Firecast.registrarForm(_frmVaMv5);
Firecast.registrarDataType(_frmVaMv5);

return _frmVaMv5;
