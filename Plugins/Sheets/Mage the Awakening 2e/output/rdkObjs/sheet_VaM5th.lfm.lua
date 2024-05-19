require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMtA2e()
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
    obj:setDataType("Gatan.MageTheAwakening2e");
    obj:setTitle("Mage the Awakening 2e");
    obj:setName("frmMtA2e");
    obj:setTheme("dark");






	local function CalcSangue()
	local nivel = 1;
	
	if(sheet.fldCheck100_01 or false) then nivel = 2; end;
	if(sheet.fldCheck100_02 or false) then nivel = 3; end;
	if(sheet.fldCheck100_03 or false) then nivel = 4; end;
	if(sheet.fldCheck100_04 or false) then nivel = 5; end;
	if(sheet.fldCheck100_05 or false) then nivel = 6; end;
	if(sheet.fldCheck100_06 or false) then nivel = 7; end;
	if(sheet.fldCheck100_07 or false) then nivel = 8; end;
	if(sheet.fldCheck100_08 or false) then nivel = 9; end;
	if(sheet.fldCheck100_09 or false) then nivel = 10; end;
	if(sheet.fldCheck100_10 or false) then nivel = 11; end;
	
	local tbBP ={
		{""},
		{"3 Horas", "5", "2", "1", "1", "10/1", "3/2", "Uma vez por dia."},
		{"3 Horas", "5", "2", "1", "1", "11/2", "3/3", "Uma vez por dia."},
		{"1 Hora", "5", "3", "2", "2", "12/3", "4/3", "Uma vez por dia."},
		{"1 Hora", "5", "3", "2", "2", "13/4", "4/4", "Uma vez por dia."},
		{"30 Minutos", "5", "4", "3", "2", "15/5", "5/4", "Duas vezes por dia."},
		{"30 Minutos", "6", "4", "3", "3", "20/6", "5/5", "Duas vezes por dia."},
		{"10 Minutos", "7", "5", "4", "3", "25/7", "5/5", "Três vezes por dia."},
		{"10 Minutos", "8", "5", "4", "3", "30/8", "5/5", "Três vezes por dia."},
		{"1 Minuto (20 turnos)", "9", "6", "5", "4", "50/10", "5/5", "Quatro vezes por dia."},
		{"1 Minuto (20 turnos)", "10", "6", "5", "4", "75/15", "5/5", "Quatro vezes por dia."},
	}; 
	
	sheet.fldsanggnosisRitual	= tbBP[nivel][1]; 
	sheet.fldsanggnosisTraitMax = tbBP[nivel][2];
	sheet.fldsanggnosisYantra = tbBP[nivel][3];
	sheet.fldsanggnosisParadox = tbBP[nivel][4];
	sheet.fldsanggnosisCS = tbBP[nivel][5];
	sheet.fldsanggnosisObsessions = tbBP[nivel][5];
	sheet.fldsanggnosisMPR = tbBP[nivel][6];
	sheet.fldsanggnosisArcana = tbBP[nivel][7];
	sheet.fldsanggnosisScour = tbBP[nivel][8];
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
    obj.flowPart1:setMinWidth(400);
    obj.flowPart1:setMaxWidth(1000);
    obj.flowPart1:setName("flowPart1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowPart1);
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

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.rectangle2);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Frente");
    obj.tab1:setName("tab1");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.tab1);
    obj.rectangle3:setName("rectangle3");
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#272727");
    obj.rectangle3:setXradius(20);
    obj.rectangle3:setYradius(20);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setMargins({top=10, right=10, bottom=10, left=10});

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle3);
    obj.image2:setAlign("top");
    obj.image2:setStyle("proportional");
    obj.image2:setHeight(100);
    obj.image2:setURL("/images/logotype1.png");
    obj.image2:setMargins({top=40, left=40, right=40});
    obj.image2:setName("image2");

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

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout2);
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMinWidth(220);
    obj.flowPart2:setMaxWidth(220);
    obj.flowPart2:setHeight(25);
    obj.flowPart2:setMargins({left=20, right=20, bottom=10});

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart2);
    obj.label1:setAlign("left");
    obj.label1:setWidth(110);
    obj.label1:setText("Shadow Name: ");
    obj.label1:setName("label1");
    obj.label1:setFontSize(14);
    obj.label1:setFontColor("white");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setTextTrimming("character");
    obj.label1:setFontFamily("Constantia");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart2);
    obj.edit1:setAlign("client");
    obj.edit1:setField("fldShadowName");
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("#cdcdcd");
    obj.edit1:setTextTrimming("character");
    obj.edit1:setFontFamily("Constantia");
    obj.edit1:setTransparent(true);

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMinWidth(220);
    obj.flowPart3:setMaxWidth(220);
    obj.flowPart3:setHeight(25);
    obj.flowPart3:setMargins({left=20, right=20, bottom=10});

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart3);
    obj.label2:setAlign("left");
    obj.label2:setWidth(60);
    obj.label2:setText("Virtue: ");
    obj.label2:setName("label2");
    obj.label2:setFontSize(14);
    obj.label2:setFontColor("white");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setTextTrimming("character");
    obj.label2:setFontFamily("Constantia");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart3);
    obj.edit2:setAlign("client");
    obj.edit2:setField("fldVirtue");
    obj.edit2:setName("edit2");
    obj.edit2:setFontSize(14);
    obj.edit2:setFontColor("#cdcdcd");
    obj.edit2:setTextTrimming("character");
    obj.edit2:setFontFamily("Constantia");
    obj.edit2:setTransparent(true);

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout2);
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMinWidth(220);
    obj.flowPart4:setMaxWidth(220);
    obj.flowPart4:setHeight(25);
    obj.flowPart4:setMargins({left=20, right=20, bottom=10});

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart4);
    obj.label3:setAlign("left");
    obj.label3:setWidth(45);
    obj.label3:setText("Path: ");
    obj.label3:setName("label3");
    obj.label3:setFontSize(14);
    obj.label3:setFontColor("white");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setTextTrimming("character");
    obj.label3:setFontFamily("Constantia");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart4);
    obj.edit3:setAlign("client");
    obj.edit3:setField("fldPath");
    obj.edit3:setName("edit3");
    obj.edit3:setFontSize(14);
    obj.edit3:setFontColor("#cdcdcd");
    obj.edit3:setTextTrimming("character");
    obj.edit3:setFontFamily("Constantia");
    obj.edit3:setTransparent(true);

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout2);
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMinWidth(220);
    obj.flowPart5:setMaxWidth(220);
    obj.flowPart5:setHeight(25);
    obj.flowPart5:setMargins({left=20, right=20, bottom=10});

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart5);
    obj.label4:setAlign("left");
    obj.label4:setWidth(57);
    obj.label4:setText("Player: ");
    obj.label4:setName("label4");
    obj.label4:setFontSize(14);
    obj.label4:setFontColor("white");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setTextTrimming("character");
    obj.label4:setFontFamily("Constantia");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart5);
    obj.edit4:setAlign("client");
    obj.edit4:setField("fldPlayer");
    obj.edit4:setName("edit4");
    obj.edit4:setFontSize(14);
    obj.edit4:setFontColor("#cdcdcd");
    obj.edit4:setTextTrimming("character");
    obj.edit4:setFontFamily("Constantia");
    obj.edit4:setTransparent(true);

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout2);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMinWidth(220);
    obj.flowPart6:setMaxWidth(220);
    obj.flowPart6:setHeight(25);
    obj.flowPart6:setMargins({left=20, right=20, bottom=10});

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart6);
    obj.label5:setAlign("left");
    obj.label5:setWidth(40);
    obj.label5:setText("Vice: ");
    obj.label5:setName("label5");
    obj.label5:setFontSize(14);
    obj.label5:setFontColor("white");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setTextTrimming("character");
    obj.label5:setFontFamily("Constantia");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart6);
    obj.edit5:setAlign("client");
    obj.edit5:setField("fldVice");
    obj.edit5:setName("edit5");
    obj.edit5:setFontSize(14);
    obj.edit5:setFontColor("#cdcdcd");
    obj.edit5:setTextTrimming("character");
    obj.edit5:setFontFamily("Constantia");
    obj.edit5:setTransparent(true);

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout2);
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMinWidth(220);
    obj.flowPart7:setMaxWidth(220);
    obj.flowPart7:setHeight(25);
    obj.flowPart7:setMargins({left=20, right=20, bottom=10});

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart7);
    obj.label6:setAlign("left");
    obj.label6:setWidth(50);
    obj.label6:setText("Order: ");
    obj.label6:setName("label6");
    obj.label6:setFontSize(14);
    obj.label6:setFontColor("white");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setTextTrimming("character");
    obj.label6:setFontFamily("Constantia");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart7);
    obj.edit6:setAlign("client");
    obj.edit6:setField("fldOrder");
    obj.edit6:setName("edit6");
    obj.edit6:setFontSize(14);
    obj.edit6:setFontColor("#cdcdcd");
    obj.edit6:setTextTrimming("character");
    obj.edit6:setFontFamily("Constantia");
    obj.edit6:setTransparent(true);

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout2);
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMinWidth(220);
    obj.flowPart8:setMaxWidth(220);
    obj.flowPart8:setHeight(25);
    obj.flowPart8:setMargins({left=20, right=20, bottom=10});

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart8);
    obj.label7:setAlign("left");
    obj.label7:setWidth(80);
    obj.label7:setText("Chronicle: ");
    obj.label7:setName("label7");
    obj.label7:setFontSize(14);
    obj.label7:setFontColor("white");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setTextTrimming("character");
    obj.label7:setFontFamily("Constantia");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart8);
    obj.edit7:setAlign("client");
    obj.edit7:setField("fldChronicle");
    obj.edit7:setName("edit7");
    obj.edit7:setFontSize(14);
    obj.edit7:setFontColor("#cdcdcd");
    obj.edit7:setTextTrimming("character");
    obj.edit7:setFontFamily("Constantia");
    obj.edit7:setTransparent(true);

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout2);
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setMinWidth(220);
    obj.flowPart9:setMaxWidth(220);
    obj.flowPart9:setHeight(25);
    obj.flowPart9:setMargins({left=20, right=20, bottom=10});

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart9);
    obj.label8:setAlign("left");
    obj.label8:setWidth(70);
    obj.label8:setText("Concept: ");
    obj.label8:setName("label8");
    obj.label8:setFontSize(14);
    obj.label8:setFontColor("white");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setTextTrimming("character");
    obj.label8:setFontFamily("Constantia");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart9);
    obj.edit8:setAlign("client");
    obj.edit8:setField("fldConcept");
    obj.edit8:setName("edit8");
    obj.edit8:setFontSize(14);
    obj.edit8:setFontColor("#cdcdcd");
    obj.edit8:setTextTrimming("character");
    obj.edit8:setFontFamily("Constantia");
    obj.edit8:setTransparent(true);

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout2);
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setMinWidth(220);
    obj.flowPart10:setMaxWidth(220);
    obj.flowPart10:setHeight(25);
    obj.flowPart10:setMargins({left=20, right=20, bottom=10});

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart10);
    obj.label9:setAlign("left");
    obj.label9:setWidth(60);
    obj.label9:setText("Legacy: ");
    obj.label9:setName("label9");
    obj.label9:setFontSize(14);
    obj.label9:setFontColor("white");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setTextTrimming("character");
    obj.label9:setFontFamily("Constantia");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart10);
    obj.edit9:setAlign("client");
    obj.edit9:setField("fldLegacy");
    obj.edit9:setName("edit9");
    obj.edit9:setFontSize(14);
    obj.edit9:setFontColor("#cdcdcd");
    obj.edit9:setTextTrimming("character");
    obj.edit9:setFontFamily("Constantia");
    obj.edit9:setTransparent(true);

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout2);
    obj.flowPart11:setHeight(45);
    obj.flowPart11:setWidth(220);
    obj.flowPart11:setMargins({bottom=20, right=20});
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setMinWidth(220);
    obj.flowPart11:setMaxWidth(220);

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.flowPart11);
    obj.flowLayout3:setOrientation("vertical");
    obj.flowLayout3:setWidth(220);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxColumns(1);
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout3);
    obj.flowPart12:setHeight(15);
    obj.flowPart12:setMargins({bottom=5});
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setMinWidth(220);
    obj.flowPart12:setMaxWidth(220);

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart12);
    obj.label10:setText("G N O S I S");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");
    obj.label10:setFontSize(10);
    obj.label10:setFontColor("white");
    obj.label10:setTextTrimming("character");
    obj.label10:setFontFamily("Constantia");
    obj.label10:setAlign("top");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout3);
    obj.flowPart13:setMargins({bottom=5});
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setMinWidth(220);
    obj.flowPart13:setMaxWidth(220);
    obj.flowPart13:setHeight(25);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart13);
    obj.layout2:setAlign("client");
    obj.layout2:setMargins({right=25});
    obj.layout2:setName("layout2");

    obj.nomeChecknome100_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome100_01:setParent(obj.layout2);
    obj.nomeChecknome100_01:setField("fldCheck100_01");
    obj.nomeChecknome100_01:setName("nomeChecknome100_01");
    obj.nomeChecknome100_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome100_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome100_01:setHeight(25);
    obj.nomeChecknome100_01:setWidth(14);
    obj.nomeChecknome100_01:setAlign("right");
    obj.nomeChecknome100_01:setMargins({left=3});
    obj.nomeChecknome100_01:setAutoChange(false);

    obj.nomeChecknome100_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome100_02:setParent(obj.layout2);
    obj.nomeChecknome100_02:setField("fldCheck100_02");
    obj.nomeChecknome100_02:setName("nomeChecknome100_02");
    obj.nomeChecknome100_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome100_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome100_02:setHeight(25);
    obj.nomeChecknome100_02:setWidth(14);
    obj.nomeChecknome100_02:setAlign("right");
    obj.nomeChecknome100_02:setMargins({left=3});
    obj.nomeChecknome100_02:setAutoChange(false);

    obj.nomeChecknome100_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome100_03:setParent(obj.layout2);
    obj.nomeChecknome100_03:setField("fldCheck100_03");
    obj.nomeChecknome100_03:setName("nomeChecknome100_03");
    obj.nomeChecknome100_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome100_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome100_03:setHeight(25);
    obj.nomeChecknome100_03:setWidth(14);
    obj.nomeChecknome100_03:setAlign("right");
    obj.nomeChecknome100_03:setMargins({left=3});
    obj.nomeChecknome100_03:setAutoChange(false);

    obj.nomeChecknome100_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome100_04:setParent(obj.layout2);
    obj.nomeChecknome100_04:setField("fldCheck100_04");
    obj.nomeChecknome100_04:setName("nomeChecknome100_04");
    obj.nomeChecknome100_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome100_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome100_04:setHeight(25);
    obj.nomeChecknome100_04:setWidth(14);
    obj.nomeChecknome100_04:setAlign("right");
    obj.nomeChecknome100_04:setMargins({left=3});
    obj.nomeChecknome100_04:setAutoChange(false);

    obj.nomeChecknome100_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome100_05:setParent(obj.layout2);
    obj.nomeChecknome100_05:setField("fldCheck100_05");
    obj.nomeChecknome100_05:setName("nomeChecknome100_05");
    obj.nomeChecknome100_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome100_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome100_05:setHeight(25);
    obj.nomeChecknome100_05:setWidth(14);
    obj.nomeChecknome100_05:setAlign("right");
    obj.nomeChecknome100_05:setMargins({left=3});
    obj.nomeChecknome100_05:setAutoChange(false);

    obj.nomeChecknome100_06 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome100_06:setParent(obj.layout2);
    obj.nomeChecknome100_06:setField("fldCheck100_06");
    obj.nomeChecknome100_06:setName("nomeChecknome100_06");
    obj.nomeChecknome100_06:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome100_06:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome100_06:setHeight(25);
    obj.nomeChecknome100_06:setWidth(14);
    obj.nomeChecknome100_06:setAlign("right");
    obj.nomeChecknome100_06:setMargins({left=3});
    obj.nomeChecknome100_06:setAutoChange(false);

    obj.nomeChecknome100_07 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome100_07:setParent(obj.layout2);
    obj.nomeChecknome100_07:setField("fldCheck100_07");
    obj.nomeChecknome100_07:setName("nomeChecknome100_07");
    obj.nomeChecknome100_07:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome100_07:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome100_07:setHeight(25);
    obj.nomeChecknome100_07:setWidth(14);
    obj.nomeChecknome100_07:setAlign("right");
    obj.nomeChecknome100_07:setMargins({left=3});
    obj.nomeChecknome100_07:setAutoChange(false);

    obj.nomeChecknome100_08 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome100_08:setParent(obj.layout2);
    obj.nomeChecknome100_08:setField("fldCheck100_08");
    obj.nomeChecknome100_08:setName("nomeChecknome100_08");
    obj.nomeChecknome100_08:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome100_08:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome100_08:setHeight(25);
    obj.nomeChecknome100_08:setWidth(14);
    obj.nomeChecknome100_08:setAlign("right");
    obj.nomeChecknome100_08:setMargins({left=3});
    obj.nomeChecknome100_08:setAutoChange(false);

    obj.nomeChecknome100_09 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome100_09:setParent(obj.layout2);
    obj.nomeChecknome100_09:setField("fldCheck100_09");
    obj.nomeChecknome100_09:setName("nomeChecknome100_09");
    obj.nomeChecknome100_09:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome100_09:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome100_09:setHeight(25);
    obj.nomeChecknome100_09:setWidth(14);
    obj.nomeChecknome100_09:setAlign("right");
    obj.nomeChecknome100_09:setMargins({left=3});
    obj.nomeChecknome100_09:setAutoChange(false);

    obj.nomeChecknome100_10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome100_10:setParent(obj.layout2);
    obj.nomeChecknome100_10:setField("fldCheck100_10");
    obj.nomeChecknome100_10:setName("nomeChecknome100_10");
    obj.nomeChecknome100_10:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome100_10:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome100_10:setHeight(25);
    obj.nomeChecknome100_10:setWidth(14);
    obj.nomeChecknome100_10:setAlign("right");
    obj.nomeChecknome100_10:setMargins({left=3});
    obj.nomeChecknome100_10:setAutoChange(false);

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout2);
    obj.flowPart14:setHeight(45);
    obj.flowPart14:setWidth(220);
    obj.flowPart14:setMargins({bottom=20, right=20});
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setMinWidth(220);
    obj.flowPart14:setMaxWidth(220);

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowPart14);
    obj.flowLayout4:setOrientation("vertical");
    obj.flowLayout4:setWidth(220);
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setMaxColumns(1);
    obj.flowLayout4:setName("flowLayout4");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout4);
    obj.flowPart15:setHeight(15);
    obj.flowPart15:setMargins({bottom=5});
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setMinWidth(220);
    obj.flowPart15:setMaxWidth(220);

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart15);
    obj.label11:setText("W I S D O M");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");
    obj.label11:setFontSize(10);
    obj.label11:setFontColor("white");
    obj.label11:setTextTrimming("character");
    obj.label11:setFontFamily("Constantia");
    obj.label11:setAlign("top");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout4);
    obj.flowPart16:setMargins({bottom=5});
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setMinWidth(220);
    obj.flowPart16:setMaxWidth(220);
    obj.flowPart16:setHeight(25);

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowPart16);
    obj.layout3:setAlign("client");
    obj.layout3:setMargins({right=25});
    obj.layout3:setName("layout3");

    obj.nomeChecknome101_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome101_01:setParent(obj.layout3);
    obj.nomeChecknome101_01:setField("fldCheck101_01");
    obj.nomeChecknome101_01:setName("nomeChecknome101_01");
    obj.nomeChecknome101_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome101_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome101_01:setHeight(25);
    obj.nomeChecknome101_01:setWidth(14);
    obj.nomeChecknome101_01:setAlign("right");
    obj.nomeChecknome101_01:setMargins({left=3});
    obj.nomeChecknome101_01:setAutoChange(false);

    obj.nomeChecknome101_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome101_02:setParent(obj.layout3);
    obj.nomeChecknome101_02:setField("fldCheck101_02");
    obj.nomeChecknome101_02:setName("nomeChecknome101_02");
    obj.nomeChecknome101_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome101_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome101_02:setHeight(25);
    obj.nomeChecknome101_02:setWidth(14);
    obj.nomeChecknome101_02:setAlign("right");
    obj.nomeChecknome101_02:setMargins({left=3});
    obj.nomeChecknome101_02:setAutoChange(false);

    obj.nomeChecknome101_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome101_03:setParent(obj.layout3);
    obj.nomeChecknome101_03:setField("fldCheck101_03");
    obj.nomeChecknome101_03:setName("nomeChecknome101_03");
    obj.nomeChecknome101_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome101_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome101_03:setHeight(25);
    obj.nomeChecknome101_03:setWidth(14);
    obj.nomeChecknome101_03:setAlign("right");
    obj.nomeChecknome101_03:setMargins({left=3});
    obj.nomeChecknome101_03:setAutoChange(false);

    obj.nomeChecknome101_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome101_04:setParent(obj.layout3);
    obj.nomeChecknome101_04:setField("fldCheck101_04");
    obj.nomeChecknome101_04:setName("nomeChecknome101_04");
    obj.nomeChecknome101_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome101_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome101_04:setHeight(25);
    obj.nomeChecknome101_04:setWidth(14);
    obj.nomeChecknome101_04:setAlign("right");
    obj.nomeChecknome101_04:setMargins({left=3});
    obj.nomeChecknome101_04:setAutoChange(false);

    obj.nomeChecknome101_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome101_05:setParent(obj.layout3);
    obj.nomeChecknome101_05:setField("fldCheck101_05");
    obj.nomeChecknome101_05:setName("nomeChecknome101_05");
    obj.nomeChecknome101_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome101_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome101_05:setHeight(25);
    obj.nomeChecknome101_05:setWidth(14);
    obj.nomeChecknome101_05:setAlign("right");
    obj.nomeChecknome101_05:setMargins({left=3});
    obj.nomeChecknome101_05:setAutoChange(false);

    obj.nomeChecknome101_06 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome101_06:setParent(obj.layout3);
    obj.nomeChecknome101_06:setField("fldCheck101_06");
    obj.nomeChecknome101_06:setName("nomeChecknome101_06");
    obj.nomeChecknome101_06:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome101_06:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome101_06:setHeight(25);
    obj.nomeChecknome101_06:setWidth(14);
    obj.nomeChecknome101_06:setAlign("right");
    obj.nomeChecknome101_06:setMargins({left=3});
    obj.nomeChecknome101_06:setAutoChange(false);

    obj.nomeChecknome101_07 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome101_07:setParent(obj.layout3);
    obj.nomeChecknome101_07:setField("fldCheck101_07");
    obj.nomeChecknome101_07:setName("nomeChecknome101_07");
    obj.nomeChecknome101_07:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome101_07:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome101_07:setHeight(25);
    obj.nomeChecknome101_07:setWidth(14);
    obj.nomeChecknome101_07:setAlign("right");
    obj.nomeChecknome101_07:setMargins({left=3});
    obj.nomeChecknome101_07:setAutoChange(false);

    obj.nomeChecknome101_08 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome101_08:setParent(obj.layout3);
    obj.nomeChecknome101_08:setField("fldCheck101_08");
    obj.nomeChecknome101_08:setName("nomeChecknome101_08");
    obj.nomeChecknome101_08:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome101_08:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome101_08:setHeight(25);
    obj.nomeChecknome101_08:setWidth(14);
    obj.nomeChecknome101_08:setAlign("right");
    obj.nomeChecknome101_08:setMargins({left=3});
    obj.nomeChecknome101_08:setAutoChange(false);

    obj.nomeChecknome101_09 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome101_09:setParent(obj.layout3);
    obj.nomeChecknome101_09:setField("fldCheck101_09");
    obj.nomeChecknome101_09:setName("nomeChecknome101_09");
    obj.nomeChecknome101_09:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome101_09:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome101_09:setHeight(25);
    obj.nomeChecknome101_09:setWidth(14);
    obj.nomeChecknome101_09:setAlign("right");
    obj.nomeChecknome101_09:setMargins({left=3});
    obj.nomeChecknome101_09:setAutoChange(false);

    obj.nomeChecknome101_10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknome101_10:setParent(obj.layout3);
    obj.nomeChecknome101_10:setField("fldCheck101_10");
    obj.nomeChecknome101_10:setName("nomeChecknome101_10");
    obj.nomeChecknome101_10:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknome101_10:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknome101_10:setHeight(25);
    obj.nomeChecknome101_10:setWidth(14);
    obj.nomeChecknome101_10:setAlign("right");
    obj.nomeChecknome101_10:setMargins({left=3});
    obj.nomeChecknome101_10:setAutoChange(false);

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.layFrente);
    obj.flowLayout5:setHeight(25);
    obj.flowLayout5:setMargins();
    obj.flowLayout5:setName("flowLayout5");
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setOrientation("horizontal");
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setMaxControlsPerLine(3);

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout5);
    obj.flowPart17:setHeight(25);
    obj.flowPart17:setMinWidth(400);
    obj.flowPart17:setMaxWidth(1000);
    obj.flowPart17:setMargins();
    obj.flowPart17:setName("flowPart17");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.flowPart17);
    obj.flowLayout6:setAutoHeight(false);
    obj.flowLayout6:setHeight(25);
    obj.flowLayout6:setMargins();
    obj.flowLayout6:setName("flowLayout6");
    obj.flowLayout6:setAlign("top");
    obj.flowLayout6:setOrientation("horizontal");
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setMaxControlsPerLine(3);

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout6);
    obj.flowPart18:setHeight(25);
    obj.flowPart18:setMinWidth(0);
    obj.flowPart18:setMaxWidth(320);
    obj.flowPart18:setWidth(320);
    obj.flowPart18:setName("flowPart18");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart18);
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("#424242");
    obj.horzLine1:setMargins({top=7});
    obj.horzLine1:setAlign("top");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout6);
    obj.flowPart19:setHeight(25);
    obj.flowPart19:setWidth(180);
    obj.flowPart19:setName("flowPart19");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart19);
    obj.label12:setText("A T T R I B U T E S");
    obj.label12:setName("label12");
    obj.label12:setFontSize(20);
    obj.label12:setFontColor("white");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setTextTrimming("character");
    obj.label12:setFontFamily("Constantia");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setAutoSize(true);
    obj.label12:setAlign("client");
    obj.label12:setMargins({bottom=7});

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout6);
    obj.flowPart20:setHeight(25);
    obj.flowPart20:setMinWidth(0);
    obj.flowPart20:setMaxWidth(320);
    obj.flowPart20:setWidth(320);
    obj.flowPart20:setName("flowPart20");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.flowPart20);
    obj.horzLine2:setName("horzLine2");
    obj.horzLine2:setStrokeColor("#424242");
    obj.horzLine2:setMargins({top=7});
    obj.horzLine2:setAlign("top");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.layFrente);
    obj.flowLayout7:setMargins({left=0, top=20, bottom=20, right=0});
    obj.flowLayout7:setMaxControlsPerLine(4);
    obj.flowLayout7:setName("flowLayout7");
    obj.flowLayout7:setAlign("top");
    obj.flowLayout7:setOrientation("horizontal");
    obj.flowLayout7:setHorzAlign("center");
    obj.flowLayout7:setAutoHeight(true);

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout7);
    obj.flowPart21:setHeight(115);
    obj.flowPart21:setWidth(70);
    obj.flowPart21:setMargins({bottom=20, left=0, right=0});
    obj.flowPart21:setName("flowPart21");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowPart21);
    obj.flowLayout8:setOrientation("vertical");
    obj.flowLayout8:setWidth(70);
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setMaxColumns(1);
    obj.flowLayout8:setName("flowLayout8");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout8);
    obj.flowPart22:setMargins({bottom=5});
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setMinWidth(220);
    obj.flowPart22:setMaxWidth(220);
    obj.flowPart22:setHeight(25);

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart22);
    obj.label13:setText(" ");
    obj.label13:setName("label13");
    obj.label13:setFontSize(10);
    obj.label13:setFontColor("white");
    obj.label13:setTextTrimming("character");
    obj.label13:setFontFamily("Constantia");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setAlign("top");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout8);
    obj.flowPart23:setMargins({bottom=5, right=0});
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setMinWidth(220);
    obj.flowPart23:setMaxWidth(220);
    obj.flowPart23:setHeight(25);

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart23);
    obj.label14:setAlign("left");
    obj.label14:setHorzTextAlign("trailing");
    obj.label14:setWidth(70);
    obj.label14:setFontSize(10);
    obj.label14:setFontColor("#ccc");
    obj.label14:setText("POWER |");
    obj.label14:setName("label14");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setTextTrimming("character");
    obj.label14:setFontFamily("Constantia");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout8);
    obj.flowPart24:setMargins({bottom=5, right=0});
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setMinWidth(220);
    obj.flowPart24:setMaxWidth(220);
    obj.flowPart24:setHeight(25);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart24);
    obj.label15:setAlign("left");
    obj.label15:setHorzTextAlign("trailing");
    obj.label15:setWidth(70);
    obj.label15:setFontSize(10);
    obj.label15:setFontColor("#ccc");
    obj.label15:setText("FINESSE |");
    obj.label15:setName("label15");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setTextTrimming("character");
    obj.label15:setFontFamily("Constantia");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout8);
    obj.flowPart25:setMargins({bottom=5, right=0});
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setMinWidth(220);
    obj.flowPart25:setMaxWidth(220);
    obj.flowPart25:setHeight(25);

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart25);
    obj.label16:setAlign("left");
    obj.label16:setHorzTextAlign("trailing");
    obj.label16:setWidth(70);
    obj.label16:setFontSize(10);
    obj.label16:setFontColor("#ccc");
    obj.label16:setText("RESISTANCE |");
    obj.label16:setName("label16");
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");
    obj.label16:setTextTrimming("character");
    obj.label16:setFontFamily("Constantia");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout7);
    obj.flowPart26:setHeight(115);
    obj.flowPart26:setWidth(200);
    obj.flowPart26:setMargins({bottom=20, left=0, right=20});
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setMinWidth(220);
    obj.flowPart26:setMaxWidth(220);

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.flowPart26);
    obj.flowLayout9:setOrientation("vertical");
    obj.flowLayout9:setWidth(200);
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setMaxColumns(3);
    obj.flowLayout9:setName("flowLayout9");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout9);
    obj.flowPart27:setMargins({bottom=5});
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setMinWidth(220);
    obj.flowPart27:setMaxWidth(220);
    obj.flowPart27:setHeight(25);

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart27);
    obj.label17:setFontSize(13);
    obj.label17:setText("M E N T A L");
    obj.label17:setName("label17");
    obj.label17:setFontColor("white");
    obj.label17:setTextTrimming("character");
    obj.label17:setFontFamily("Constantia");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setAlign("top");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout9);
    obj.flowPart28:setMargins({bottom=5});
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setMinWidth(200);
    obj.flowPart28:setMaxWidth(200);
    obj.flowPart28:setHeight(25);

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart28);
    obj.label18:setAlign("left");
    obj.label18:setWidth(100);
    obj.label18:setText("Intelligence");
    obj.label18:setName("label18");
    obj.label18:setFontSize(14);
    obj.label18:setFontColor("white");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setTextTrimming("character");
    obj.label18:setFontFamily("Constantia");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flowPart28);
    obj.layout4:setAlign("client");
    obj.layout4:setMargins({right=10});
    obj.layout4:setName("layout4");

    obj.nomeCheck07_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck07_01:setParent(obj.layout4);
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
    obj.nomeCheck07_02:setParent(obj.layout4);
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
    obj.nomeCheck07_03:setParent(obj.layout4);
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
    obj.nomeCheck07_04:setParent(obj.layout4);
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
    obj.nomeCheck07_05:setParent(obj.layout4);
    obj.nomeCheck07_05:setField("fldCheck07_05");
    obj.nomeCheck07_05:setName("nomeCheck07_05");
    obj.nomeCheck07_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck07_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck07_05:setHeight(25);
    obj.nomeCheck07_05:setWidth(14);
    obj.nomeCheck07_05:setAlign("right");
    obj.nomeCheck07_05:setMargins({left=3});
    obj.nomeCheck07_05:setAutoChange(false);

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout9);
    obj.flowPart29:setMargins({bottom=5});
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setMinWidth(200);
    obj.flowPart29:setMaxWidth(200);
    obj.flowPart29:setHeight(25);

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart29);
    obj.label19:setAlign("left");
    obj.label19:setWidth(100);
    obj.label19:setText("Wits");
    obj.label19:setName("label19");
    obj.label19:setFontSize(14);
    obj.label19:setFontColor("white");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setTextTrimming("character");
    obj.label19:setFontFamily("Constantia");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart29);
    obj.layout5:setAlign("client");
    obj.layout5:setMargins({right=10});
    obj.layout5:setName("layout5");

    obj.nomeCheck08_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck08_01:setParent(obj.layout5);
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
    obj.nomeCheck08_02:setParent(obj.layout5);
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
    obj.nomeCheck08_03:setParent(obj.layout5);
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
    obj.nomeCheck08_04:setParent(obj.layout5);
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
    obj.nomeCheck08_05:setParent(obj.layout5);
    obj.nomeCheck08_05:setField("fldCheck08_05");
    obj.nomeCheck08_05:setName("nomeCheck08_05");
    obj.nomeCheck08_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck08_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck08_05:setHeight(25);
    obj.nomeCheck08_05:setWidth(14);
    obj.nomeCheck08_05:setAlign("right");
    obj.nomeCheck08_05:setMargins({left=3});
    obj.nomeCheck08_05:setAutoChange(false);

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout9);
    obj.flowPart30:setMargins({bottom=5});
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setMinWidth(200);
    obj.flowPart30:setMaxWidth(200);
    obj.flowPart30:setHeight(25);

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart30);
    obj.label20:setAlign("left");
    obj.label20:setWidth(100);
    obj.label20:setText("Resolve");
    obj.label20:setName("label20");
    obj.label20:setFontSize(14);
    obj.label20:setFontColor("white");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setTextTrimming("character");
    obj.label20:setFontFamily("Constantia");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.flowPart30);
    obj.layout6:setAlign("client");
    obj.layout6:setMargins({right=10});
    obj.layout6:setName("layout6");

    obj.nomeCheck09_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck09_01:setParent(obj.layout6);
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
    obj.nomeCheck09_02:setParent(obj.layout6);
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
    obj.nomeCheck09_03:setParent(obj.layout6);
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
    obj.nomeCheck09_04:setParent(obj.layout6);
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
    obj.nomeCheck09_05:setParent(obj.layout6);
    obj.nomeCheck09_05:setField("fldCheck09_05");
    obj.nomeCheck09_05:setName("nomeCheck09_05");
    obj.nomeCheck09_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck09_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck09_05:setHeight(25);
    obj.nomeCheck09_05:setWidth(14);
    obj.nomeCheck09_05:setAlign("right");
    obj.nomeCheck09_05:setMargins({left=3});
    obj.nomeCheck09_05:setAutoChange(false);

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout7);
    obj.flowPart31:setHeight(115);
    obj.flowPart31:setWidth(200);
    obj.flowPart31:setMargins({bottom=20, left=20, right=20});
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setMinWidth(220);
    obj.flowPart31:setMaxWidth(220);

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.flowPart31);
    obj.flowLayout10:setOrientation("vertical");
    obj.flowLayout10:setWidth(200);
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setMaxColumns(1);
    obj.flowLayout10:setName("flowLayout10");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout10);
    obj.flowPart32:setMargins({bottom=5});
    obj.flowPart32:setName("flowPart32");
    obj.flowPart32:setMinWidth(220);
    obj.flowPart32:setMaxWidth(220);
    obj.flowPart32:setHeight(25);

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart32);
    obj.label21:setFontSize(13);
    obj.label21:setText("P H Y S I C A L");
    obj.label21:setName("label21");
    obj.label21:setFontColor("white");
    obj.label21:setTextTrimming("character");
    obj.label21:setFontFamily("Constantia");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setAlign("top");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout10);
    obj.flowPart33:setMargins({bottom=5});
    obj.flowPart33:setName("flowPart33");
    obj.flowPart33:setMinWidth(200);
    obj.flowPart33:setMaxWidth(200);
    obj.flowPart33:setHeight(25);

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart33);
    obj.label22:setAlign("left");
    obj.label22:setWidth(100);
    obj.label22:setText("Strength");
    obj.label22:setName("label22");
    obj.label22:setFontSize(14);
    obj.label22:setFontColor("white");
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");
    obj.label22:setTextTrimming("character");
    obj.label22:setFontFamily("Constantia");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.flowPart33);
    obj.layout7:setAlign("client");
    obj.layout7:setMargins({right=10});
    obj.layout7:setName("layout7");

    obj.nomeCheck01_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck01_01:setParent(obj.layout7);
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
    obj.nomeCheck01_02:setParent(obj.layout7);
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
    obj.nomeCheck01_03:setParent(obj.layout7);
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
    obj.nomeCheck01_04:setParent(obj.layout7);
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
    obj.nomeCheck01_05:setParent(obj.layout7);
    obj.nomeCheck01_05:setField("fldCheck01_05");
    obj.nomeCheck01_05:setName("nomeCheck01_05");
    obj.nomeCheck01_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck01_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck01_05:setHeight(25);
    obj.nomeCheck01_05:setWidth(14);
    obj.nomeCheck01_05:setAlign("right");
    obj.nomeCheck01_05:setMargins({left=3});
    obj.nomeCheck01_05:setAutoChange(false);

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout10);
    obj.flowPart34:setMargins({bottom=5});
    obj.flowPart34:setName("flowPart34");
    obj.flowPart34:setMinWidth(200);
    obj.flowPart34:setMaxWidth(200);
    obj.flowPart34:setHeight(25);

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart34);
    obj.label23:setAlign("left");
    obj.label23:setWidth(100);
    obj.label23:setText("Dexterity");
    obj.label23:setName("label23");
    obj.label23:setFontSize(14);
    obj.label23:setFontColor("white");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setTextTrimming("character");
    obj.label23:setFontFamily("Constantia");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.flowPart34);
    obj.layout8:setAlign("client");
    obj.layout8:setMargins({right=10});
    obj.layout8:setName("layout8");

    obj.nomeCheck02_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck02_01:setParent(obj.layout8);
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
    obj.nomeCheck02_02:setParent(obj.layout8);
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
    obj.nomeCheck02_03:setParent(obj.layout8);
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
    obj.nomeCheck02_04:setParent(obj.layout8);
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
    obj.nomeCheck02_05:setParent(obj.layout8);
    obj.nomeCheck02_05:setField("fldCheck02_05");
    obj.nomeCheck02_05:setName("nomeCheck02_05");
    obj.nomeCheck02_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck02_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck02_05:setHeight(25);
    obj.nomeCheck02_05:setWidth(14);
    obj.nomeCheck02_05:setAlign("right");
    obj.nomeCheck02_05:setMargins({left=3});
    obj.nomeCheck02_05:setAutoChange(false);

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout10);
    obj.flowPart35:setMargins({bottom=5});
    obj.flowPart35:setName("flowPart35");
    obj.flowPart35:setMinWidth(200);
    obj.flowPart35:setMaxWidth(200);
    obj.flowPart35:setHeight(25);

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart35);
    obj.label24:setAlign("left");
    obj.label24:setWidth(100);
    obj.label24:setText("Stamina");
    obj.label24:setName("label24");
    obj.label24:setFontSize(14);
    obj.label24:setFontColor("white");
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setTextTrimming("character");
    obj.label24:setFontFamily("Constantia");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flowPart35);
    obj.layout9:setAlign("client");
    obj.layout9:setMargins({right=10});
    obj.layout9:setName("layout9");

    obj.nomeCheck03_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck03_01:setParent(obj.layout9);
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
    obj.nomeCheck03_02:setParent(obj.layout9);
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
    obj.nomeCheck03_03:setParent(obj.layout9);
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
    obj.nomeCheck03_04:setParent(obj.layout9);
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
    obj.nomeCheck03_05:setParent(obj.layout9);
    obj.nomeCheck03_05:setField("fldCheck03_05");
    obj.nomeCheck03_05:setName("nomeCheck03_05");
    obj.nomeCheck03_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck03_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck03_05:setHeight(25);
    obj.nomeCheck03_05:setWidth(14);
    obj.nomeCheck03_05:setAlign("right");
    obj.nomeCheck03_05:setMargins({left=3});
    obj.nomeCheck03_05:setAutoChange(false);

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout7);
    obj.flowPart36:setHeight(115);
    obj.flowPart36:setWidth(200);
    obj.flowPart36:setMargins({bottom=20, left=20, right=20});
    obj.flowPart36:setName("flowPart36");
    obj.flowPart36:setMinWidth(220);
    obj.flowPart36:setMaxWidth(220);

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowPart36);
    obj.flowLayout11:setOrientation("vertical");
    obj.flowLayout11:setWidth(200);
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setMaxColumns(1);
    obj.flowLayout11:setName("flowLayout11");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout11);
    obj.flowPart37:setMargins({bottom=5});
    obj.flowPart37:setName("flowPart37");
    obj.flowPart37:setMinWidth(220);
    obj.flowPart37:setMaxWidth(220);
    obj.flowPart37:setHeight(25);

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart37);
    obj.label25:setFontSize(13);
    obj.label25:setText("S O C I A L");
    obj.label25:setName("label25");
    obj.label25:setFontColor("white");
    obj.label25:setTextTrimming("character");
    obj.label25:setFontFamily("Constantia");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setAlign("top");
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout11);
    obj.flowPart38:setMargins({bottom=5});
    obj.flowPart38:setName("flowPart38");
    obj.flowPart38:setMinWidth(200);
    obj.flowPart38:setMaxWidth(200);
    obj.flowPart38:setHeight(25);

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart38);
    obj.label26:setAlign("left");
    obj.label26:setWidth(100);
    obj.label26:setText("Presence");
    obj.label26:setName("label26");
    obj.label26:setFontSize(14);
    obj.label26:setFontColor("white");
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");
    obj.label26:setTextTrimming("character");
    obj.label26:setFontFamily("Constantia");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.flowPart38);
    obj.layout10:setAlign("client");
    obj.layout10:setMargins({right=10});
    obj.layout10:setName("layout10");

    obj.nomeCheck04_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck04_01:setParent(obj.layout10);
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
    obj.nomeCheck04_02:setParent(obj.layout10);
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
    obj.nomeCheck04_03:setParent(obj.layout10);
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
    obj.nomeCheck04_04:setParent(obj.layout10);
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
    obj.nomeCheck04_05:setParent(obj.layout10);
    obj.nomeCheck04_05:setField("fldCheck04_05");
    obj.nomeCheck04_05:setName("nomeCheck04_05");
    obj.nomeCheck04_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck04_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck04_05:setHeight(25);
    obj.nomeCheck04_05:setWidth(14);
    obj.nomeCheck04_05:setAlign("right");
    obj.nomeCheck04_05:setMargins({left=3});
    obj.nomeCheck04_05:setAutoChange(false);

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout11);
    obj.flowPart39:setMargins({bottom=5});
    obj.flowPart39:setName("flowPart39");
    obj.flowPart39:setMinWidth(200);
    obj.flowPart39:setMaxWidth(200);
    obj.flowPart39:setHeight(25);

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart39);
    obj.label27:setAlign("left");
    obj.label27:setWidth(100);
    obj.label27:setText("Manipulation");
    obj.label27:setName("label27");
    obj.label27:setFontSize(14);
    obj.label27:setFontColor("white");
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setTextTrimming("character");
    obj.label27:setFontFamily("Constantia");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart39);
    obj.layout11:setAlign("client");
    obj.layout11:setMargins({right=10});
    obj.layout11:setName("layout11");

    obj.nomeCheck05_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck05_01:setParent(obj.layout11);
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
    obj.nomeCheck05_02:setParent(obj.layout11);
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
    obj.nomeCheck05_03:setParent(obj.layout11);
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
    obj.nomeCheck05_04:setParent(obj.layout11);
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
    obj.nomeCheck05_05:setParent(obj.layout11);
    obj.nomeCheck05_05:setField("fldCheck05_05");
    obj.nomeCheck05_05:setName("nomeCheck05_05");
    obj.nomeCheck05_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck05_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck05_05:setHeight(25);
    obj.nomeCheck05_05:setWidth(14);
    obj.nomeCheck05_05:setAlign("right");
    obj.nomeCheck05_05:setMargins({left=3});
    obj.nomeCheck05_05:setAutoChange(false);

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout11);
    obj.flowPart40:setMargins({bottom=5});
    obj.flowPart40:setName("flowPart40");
    obj.flowPart40:setMinWidth(200);
    obj.flowPart40:setMaxWidth(200);
    obj.flowPart40:setHeight(25);

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart40);
    obj.label28:setAlign("left");
    obj.label28:setWidth(100);
    obj.label28:setText("Composure");
    obj.label28:setName("label28");
    obj.label28:setFontSize(14);
    obj.label28:setFontColor("white");
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setTextTrimming("character");
    obj.label28:setFontFamily("Constantia");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowPart40);
    obj.layout12:setAlign("client");
    obj.layout12:setMargins({right=10});
    obj.layout12:setName("layout12");

    obj.nomeCheck06_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck06_01:setParent(obj.layout12);
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
    obj.nomeCheck06_02:setParent(obj.layout12);
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
    obj.nomeCheck06_03:setParent(obj.layout12);
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
    obj.nomeCheck06_04:setParent(obj.layout12);
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
    obj.nomeCheck06_05:setParent(obj.layout12);
    obj.nomeCheck06_05:setField("fldCheck06_05");
    obj.nomeCheck06_05:setName("nomeCheck06_05");
    obj.nomeCheck06_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck06_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck06_05:setHeight(25);
    obj.nomeCheck06_05:setWidth(14);
    obj.nomeCheck06_05:setAlign("right");
    obj.nomeCheck06_05:setMargins({left=3});
    obj.nomeCheck06_05:setAutoChange(false);

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.layFrente);
    obj.flowLayout12:setHeight(25);
    obj.flowLayout12:setMargins();
    obj.flowLayout12:setName("flowLayout12");
    obj.flowLayout12:setAlign("top");
    obj.flowLayout12:setOrientation("horizontal");
    obj.flowLayout12:setHorzAlign("center");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setMaxControlsPerLine(3);

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout12);
    obj.flowPart41:setHeight(25);
    obj.flowPart41:setMinWidth(400);
    obj.flowPart41:setMaxWidth(1000);
    obj.flowPart41:setMargins();
    obj.flowPart41:setName("flowPart41");

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.flowPart41);
    obj.flowLayout13:setAutoHeight(false);
    obj.flowLayout13:setHeight(25);
    obj.flowLayout13:setMargins();
    obj.flowLayout13:setName("flowLayout13");
    obj.flowLayout13:setAlign("top");
    obj.flowLayout13:setOrientation("horizontal");
    obj.flowLayout13:setHorzAlign("center");
    obj.flowLayout13:setMaxControlsPerLine(3);

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout13);
    obj.flowPart42:setHeight(25);
    obj.flowPart42:setMinWidth(0);
    obj.flowPart42:setMaxWidth(350);
    obj.flowPart42:setWidth(350);
    obj.flowPart42:setName("flowPart42");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.flowPart42);
    obj.horzLine3:setName("horzLine3");
    obj.horzLine3:setStrokeColor("#424242");
    obj.horzLine3:setMargins({top=7});
    obj.horzLine3:setAlign("top");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout13);
    obj.flowPart43:setHeight(25);
    obj.flowPart43:setWidth(110);
    obj.flowPart43:setName("flowPart43");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart43);
    obj.label29:setText("S K I L L S");
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

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout13);
    obj.flowPart44:setHeight(25);
    obj.flowPart44:setMinWidth(0);
    obj.flowPart44:setMaxWidth(350);
    obj.flowPart44:setWidth(350);
    obj.flowPart44:setName("flowPart44");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.flowPart44);
    obj.horzLine4:setName("horzLine4");
    obj.horzLine4:setStrokeColor("#424242");
    obj.horzLine4:setMargins({top=7});
    obj.horzLine4:setAlign("top");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.layFrente);
    obj.flowLayout14:setName("flowLayout14");
    obj.flowLayout14:setAlign("top");
    obj.flowLayout14:setOrientation("horizontal");
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setMaxControlsPerLine(3);
    obj.flowLayout14:setMargins({left=0, top=20, bottom=30, right=0});

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout14);
    obj.flowPart45:setHeight(20);
    obj.flowPart45:setWidth(300);
    obj.flowPart45:setMargins({bottom=20, left=15, right=15});
    obj.flowPart45:setName("flowPart45");
    obj.flowPart45:setMinWidth(275);
    obj.flowPart45:setMaxWidth(275);

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.flowPart45);
    obj.flowLayout15:setOrientation("vertical");
    obj.flowLayout15:setWidth(300);
    obj.flowLayout15:setAutoHeight(true);
    obj.flowLayout15:setMaxColumns(1);
    obj.flowLayout15:setName("flowLayout15");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout15);
    obj.flowPart46:setMargins({bottom=5});
    obj.flowPart46:setName("flowPart46");
    obj.flowPart46:setMinWidth(275);
    obj.flowPart46:setMaxWidth(275);

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart46);
    obj.label30:setAlign("top");
    obj.label30:setFontSize(11);
    obj.label30:setFontColor("#ccc");
    obj.label30:setText("(-3 UNSKILLED)");
    obj.label30:setName("label30");
    obj.label30:setTextTrimming("character");
    obj.label30:setFontFamily("Constantia");
    obj.label30:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout14);
    obj.flowPart47:setHeight(20);
    obj.flowPart47:setWidth(300);
    obj.flowPart47:setMargins({bottom=20, left=15, right=15});
    obj.flowPart47:setName("flowPart47");
    obj.flowPart47:setMinWidth(275);
    obj.flowPart47:setMaxWidth(275);

    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.flowPart47);
    obj.flowLayout16:setOrientation("vertical");
    obj.flowLayout16:setWidth(300);
    obj.flowLayout16:setAutoHeight(true);
    obj.flowLayout16:setMaxColumns(1);
    obj.flowLayout16:setName("flowLayout16");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout16);
    obj.flowPart48:setMargins({bottom=5});
    obj.flowPart48:setName("flowPart48");
    obj.flowPart48:setMinWidth(275);
    obj.flowPart48:setMaxWidth(275);

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart48);
    obj.label31:setAlign("top");
    obj.label31:setFontSize(11);
    obj.label31:setFontColor("#ccc");
    obj.label31:setText("(-1 UNSKILLED)");
    obj.label31:setName("label31");
    obj.label31:setTextTrimming("character");
    obj.label31:setFontFamily("Constantia");
    obj.label31:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout14);
    obj.flowPart49:setHeight(20);
    obj.flowPart49:setWidth(300);
    obj.flowPart49:setMargins({bottom=20, left=15, right=15});
    obj.flowPart49:setName("flowPart49");
    obj.flowPart49:setMinWidth(275);
    obj.flowPart49:setMaxWidth(275);

    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.flowPart49);
    obj.flowLayout17:setOrientation("vertical");
    obj.flowLayout17:setWidth(300);
    obj.flowLayout17:setAutoHeight(true);
    obj.flowLayout17:setMaxColumns(1);
    obj.flowLayout17:setName("flowLayout17");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout17);
    obj.flowPart50:setMargins({bottom=5});
    obj.flowPart50:setName("flowPart50");
    obj.flowPart50:setMinWidth(275);
    obj.flowPart50:setMaxWidth(275);

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart50);
    obj.label32:setAlign("top");
    obj.label32:setFontSize(11);
    obj.label32:setFontColor("#ccc");
    obj.label32:setText("(-1 UNSKILLED)");
    obj.label32:setName("label32");
    obj.label32:setTextTrimming("character");
    obj.label32:setFontFamily("Constantia");
    obj.label32:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout14);
    obj.flowPart51:setHeight(270);
    obj.flowPart51:setWidth(285);
    obj.flowPart51:setMargins({bottom=20, left=10, right=10});
    obj.flowPart51:setName("flowPart51");
    obj.flowPart51:setMinWidth(285);
    obj.flowPart51:setMaxWidth(285);

    obj.flowLayout18 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.flowPart51);
    obj.flowLayout18:setOrientation("vertical");
    obj.flowLayout18:setWidth(285);
    obj.flowLayout18:setAutoHeight(true);
    obj.flowLayout18:setMaxColumns(1);
    obj.flowLayout18:setName("flowLayout18");

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout18);
    obj.flowPart52:setMargins({bottom=5});
    obj.flowPart52:setName("flowPart52");
    obj.flowPart52:setMinWidth(285);
    obj.flowPart52:setMaxWidth(285);
    obj.flowPart52:setHeight(25);

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowPart52);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(110);
    obj.checkBox1:setText("Academics");
    obj.checkBox1:setField("cck_10");
    obj.checkBox1:setName("checkBox1");
    obj.checkBox1:setFontSize(14);
    obj.checkBox1:setFontColor("white");
    lfm_setPropAsString(obj.checkBox1, "fontStyle",  "bold");
    obj.checkBox1:setTextTrimming("character");
    obj.checkBox1:setFontFamily("Constantia");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart52);
    obj.edit10:setAlign("left");
    obj.edit10:setTransparent(false);
    obj.edit10:setWidth(80);
    obj.edit10:setField("enf_10");
    obj.edit10:setName("edit10");
    obj.edit10:setFontSize(14);
    obj.edit10:setFontColor("#cdcdcd");
    obj.edit10:setTextTrimming("character");
    obj.edit10:setFontFamily("Constantia");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.flowPart52);
    obj.layout13:setAlign("client");
    obj.layout13:setMargins({right=10});
    obj.layout13:setName("layout13");

    obj.nomeCheck10_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck10_01:setParent(obj.layout13);
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
    obj.nomeCheck10_02:setParent(obj.layout13);
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
    obj.nomeCheck10_03:setParent(obj.layout13);
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
    obj.nomeCheck10_04:setParent(obj.layout13);
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
    obj.nomeCheck10_05:setParent(obj.layout13);
    obj.nomeCheck10_05:setField("fldCheck10_05");
    obj.nomeCheck10_05:setName("nomeCheck10_05");
    obj.nomeCheck10_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck10_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck10_05:setHeight(25);
    obj.nomeCheck10_05:setWidth(14);
    obj.nomeCheck10_05:setAlign("right");
    obj.nomeCheck10_05:setMargins({left=3});
    obj.nomeCheck10_05:setAutoChange(false);

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout18);
    obj.flowPart53:setMargins({bottom=5});
    obj.flowPart53:setName("flowPart53");
    obj.flowPart53:setMinWidth(285);
    obj.flowPart53:setMaxWidth(285);
    obj.flowPart53:setHeight(25);

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowPart53);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(110);
    obj.checkBox2:setText("Computer");
    obj.checkBox2:setField("cck_11");
    obj.checkBox2:setName("checkBox2");
    obj.checkBox2:setFontSize(14);
    obj.checkBox2:setFontColor("white");
    lfm_setPropAsString(obj.checkBox2, "fontStyle",  "bold");
    obj.checkBox2:setTextTrimming("character");
    obj.checkBox2:setFontFamily("Constantia");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart53);
    obj.edit11:setAlign("left");
    obj.edit11:setTransparent(false);
    obj.edit11:setWidth(80);
    obj.edit11:setField("enf_11");
    obj.edit11:setName("edit11");
    obj.edit11:setFontSize(14);
    obj.edit11:setFontColor("#cdcdcd");
    obj.edit11:setTextTrimming("character");
    obj.edit11:setFontFamily("Constantia");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.flowPart53);
    obj.layout14:setAlign("client");
    obj.layout14:setMargins({right=10});
    obj.layout14:setName("layout14");

    obj.nomeCheck11_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck11_01:setParent(obj.layout14);
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
    obj.nomeCheck11_02:setParent(obj.layout14);
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
    obj.nomeCheck11_03:setParent(obj.layout14);
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
    obj.nomeCheck11_04:setParent(obj.layout14);
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
    obj.nomeCheck11_05:setParent(obj.layout14);
    obj.nomeCheck11_05:setField("fldCheck11_05");
    obj.nomeCheck11_05:setName("nomeCheck11_05");
    obj.nomeCheck11_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck11_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck11_05:setHeight(25);
    obj.nomeCheck11_05:setWidth(14);
    obj.nomeCheck11_05:setAlign("right");
    obj.nomeCheck11_05:setMargins({left=3});
    obj.nomeCheck11_05:setAutoChange(false);

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout18);
    obj.flowPart54:setMargins({bottom=5});
    obj.flowPart54:setName("flowPart54");
    obj.flowPart54:setMinWidth(285);
    obj.flowPart54:setMaxWidth(285);
    obj.flowPart54:setHeight(25);

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.flowPart54);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(110);
    obj.checkBox3:setText("Crafts");
    obj.checkBox3:setField("cck_12");
    obj.checkBox3:setName("checkBox3");
    obj.checkBox3:setFontSize(14);
    obj.checkBox3:setFontColor("white");
    lfm_setPropAsString(obj.checkBox3, "fontStyle",  "bold");
    obj.checkBox3:setTextTrimming("character");
    obj.checkBox3:setFontFamily("Constantia");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart54);
    obj.edit12:setAlign("left");
    obj.edit12:setTransparent(false);
    obj.edit12:setWidth(80);
    obj.edit12:setField("enf_12");
    obj.edit12:setName("edit12");
    obj.edit12:setFontSize(14);
    obj.edit12:setFontColor("#cdcdcd");
    obj.edit12:setTextTrimming("character");
    obj.edit12:setFontFamily("Constantia");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.flowPart54);
    obj.layout15:setAlign("client");
    obj.layout15:setMargins({right=10});
    obj.layout15:setName("layout15");

    obj.nomeCheck12_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck12_01:setParent(obj.layout15);
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
    obj.nomeCheck12_02:setParent(obj.layout15);
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
    obj.nomeCheck12_03:setParent(obj.layout15);
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
    obj.nomeCheck12_04:setParent(obj.layout15);
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
    obj.nomeCheck12_05:setParent(obj.layout15);
    obj.nomeCheck12_05:setField("fldCheck12_05");
    obj.nomeCheck12_05:setName("nomeCheck12_05");
    obj.nomeCheck12_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck12_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck12_05:setHeight(25);
    obj.nomeCheck12_05:setWidth(14);
    obj.nomeCheck12_05:setAlign("right");
    obj.nomeCheck12_05:setMargins({left=3});
    obj.nomeCheck12_05:setAutoChange(false);

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout18);
    obj.flowPart55:setMargins({bottom=5});
    obj.flowPart55:setName("flowPart55");
    obj.flowPart55:setMinWidth(285);
    obj.flowPart55:setMaxWidth(285);
    obj.flowPart55:setHeight(25);

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.flowPart55);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(110);
    obj.checkBox4:setText("Investigation");
    obj.checkBox4:setField("cck_13");
    obj.checkBox4:setName("checkBox4");
    obj.checkBox4:setFontSize(14);
    obj.checkBox4:setFontColor("white");
    lfm_setPropAsString(obj.checkBox4, "fontStyle",  "bold");
    obj.checkBox4:setTextTrimming("character");
    obj.checkBox4:setFontFamily("Constantia");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart55);
    obj.edit13:setAlign("left");
    obj.edit13:setTransparent(false);
    obj.edit13:setWidth(80);
    obj.edit13:setField("enf_13");
    obj.edit13:setName("edit13");
    obj.edit13:setFontSize(14);
    obj.edit13:setFontColor("#cdcdcd");
    obj.edit13:setTextTrimming("character");
    obj.edit13:setFontFamily("Constantia");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.flowPart55);
    obj.layout16:setAlign("client");
    obj.layout16:setMargins({right=10});
    obj.layout16:setName("layout16");

    obj.nomeCheck13_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck13_01:setParent(obj.layout16);
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
    obj.nomeCheck13_02:setParent(obj.layout16);
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
    obj.nomeCheck13_03:setParent(obj.layout16);
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
    obj.nomeCheck13_04:setParent(obj.layout16);
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
    obj.nomeCheck13_05:setParent(obj.layout16);
    obj.nomeCheck13_05:setField("fldCheck13_05");
    obj.nomeCheck13_05:setName("nomeCheck13_05");
    obj.nomeCheck13_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck13_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck13_05:setHeight(25);
    obj.nomeCheck13_05:setWidth(14);
    obj.nomeCheck13_05:setAlign("right");
    obj.nomeCheck13_05:setMargins({left=3});
    obj.nomeCheck13_05:setAutoChange(false);

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout18);
    obj.flowPart56:setMargins({bottom=5});
    obj.flowPart56:setName("flowPart56");
    obj.flowPart56:setMinWidth(285);
    obj.flowPart56:setMaxWidth(285);
    obj.flowPart56:setHeight(25);

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.flowPart56);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setWidth(110);
    obj.checkBox5:setText("Medicine");
    obj.checkBox5:setField("cck_14");
    obj.checkBox5:setName("checkBox5");
    obj.checkBox5:setFontSize(14);
    obj.checkBox5:setFontColor("white");
    lfm_setPropAsString(obj.checkBox5, "fontStyle",  "bold");
    obj.checkBox5:setTextTrimming("character");
    obj.checkBox5:setFontFamily("Constantia");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart56);
    obj.edit14:setAlign("left");
    obj.edit14:setTransparent(false);
    obj.edit14:setWidth(80);
    obj.edit14:setField("enf_14");
    obj.edit14:setName("edit14");
    obj.edit14:setFontSize(14);
    obj.edit14:setFontColor("#cdcdcd");
    obj.edit14:setTextTrimming("character");
    obj.edit14:setFontFamily("Constantia");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.flowPart56);
    obj.layout17:setAlign("client");
    obj.layout17:setMargins({right=10});
    obj.layout17:setName("layout17");

    obj.nomeCheck14_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck14_01:setParent(obj.layout17);
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
    obj.nomeCheck14_02:setParent(obj.layout17);
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
    obj.nomeCheck14_03:setParent(obj.layout17);
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
    obj.nomeCheck14_04:setParent(obj.layout17);
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
    obj.nomeCheck14_05:setParent(obj.layout17);
    obj.nomeCheck14_05:setField("fldCheck14_05");
    obj.nomeCheck14_05:setName("nomeCheck14_05");
    obj.nomeCheck14_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck14_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck14_05:setHeight(25);
    obj.nomeCheck14_05:setWidth(14);
    obj.nomeCheck14_05:setAlign("right");
    obj.nomeCheck14_05:setMargins({left=3});
    obj.nomeCheck14_05:setAutoChange(false);

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout18);
    obj.flowPart57:setMargins({bottom=5});
    obj.flowPart57:setName("flowPart57");
    obj.flowPart57:setMinWidth(285);
    obj.flowPart57:setMaxWidth(285);
    obj.flowPart57:setHeight(25);

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.flowPart57);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setWidth(110);
    obj.checkBox6:setText("Occult");
    obj.checkBox6:setField("cck_15");
    obj.checkBox6:setName("checkBox6");
    obj.checkBox6:setFontSize(14);
    obj.checkBox6:setFontColor("white");
    lfm_setPropAsString(obj.checkBox6, "fontStyle",  "bold");
    obj.checkBox6:setTextTrimming("character");
    obj.checkBox6:setFontFamily("Constantia");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart57);
    obj.edit15:setAlign("left");
    obj.edit15:setTransparent(false);
    obj.edit15:setWidth(80);
    obj.edit15:setField("enf_15");
    obj.edit15:setName("edit15");
    obj.edit15:setFontSize(14);
    obj.edit15:setFontColor("#cdcdcd");
    obj.edit15:setTextTrimming("character");
    obj.edit15:setFontFamily("Constantia");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.flowPart57);
    obj.layout18:setAlign("client");
    obj.layout18:setMargins({right=10});
    obj.layout18:setName("layout18");

    obj.nomeCheck15_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck15_01:setParent(obj.layout18);
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
    obj.nomeCheck15_02:setParent(obj.layout18);
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
    obj.nomeCheck15_03:setParent(obj.layout18);
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
    obj.nomeCheck15_04:setParent(obj.layout18);
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
    obj.nomeCheck15_05:setParent(obj.layout18);
    obj.nomeCheck15_05:setField("fldCheck15_05");
    obj.nomeCheck15_05:setName("nomeCheck15_05");
    obj.nomeCheck15_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck15_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck15_05:setHeight(25);
    obj.nomeCheck15_05:setWidth(14);
    obj.nomeCheck15_05:setAlign("right");
    obj.nomeCheck15_05:setMargins({left=3});
    obj.nomeCheck15_05:setAutoChange(false);

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout18);
    obj.flowPart58:setMargins({bottom=5});
    obj.flowPart58:setName("flowPart58");
    obj.flowPart58:setMinWidth(285);
    obj.flowPart58:setMaxWidth(285);
    obj.flowPart58:setHeight(25);

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.flowPart58);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setWidth(110);
    obj.checkBox7:setText("Politics");
    obj.checkBox7:setField("cck_16");
    obj.checkBox7:setName("checkBox7");
    obj.checkBox7:setFontSize(14);
    obj.checkBox7:setFontColor("white");
    lfm_setPropAsString(obj.checkBox7, "fontStyle",  "bold");
    obj.checkBox7:setTextTrimming("character");
    obj.checkBox7:setFontFamily("Constantia");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart58);
    obj.edit16:setAlign("left");
    obj.edit16:setTransparent(false);
    obj.edit16:setWidth(80);
    obj.edit16:setField("enf_16");
    obj.edit16:setName("edit16");
    obj.edit16:setFontSize(14);
    obj.edit16:setFontColor("#cdcdcd");
    obj.edit16:setTextTrimming("character");
    obj.edit16:setFontFamily("Constantia");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.flowPart58);
    obj.layout19:setAlign("client");
    obj.layout19:setMargins({right=10});
    obj.layout19:setName("layout19");

    obj.nomeCheck16_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck16_01:setParent(obj.layout19);
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
    obj.nomeCheck16_02:setParent(obj.layout19);
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
    obj.nomeCheck16_03:setParent(obj.layout19);
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
    obj.nomeCheck16_04:setParent(obj.layout19);
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
    obj.nomeCheck16_05:setParent(obj.layout19);
    obj.nomeCheck16_05:setField("fldCheck16_05");
    obj.nomeCheck16_05:setName("nomeCheck16_05");
    obj.nomeCheck16_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck16_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck16_05:setHeight(25);
    obj.nomeCheck16_05:setWidth(14);
    obj.nomeCheck16_05:setAlign("right");
    obj.nomeCheck16_05:setMargins({left=3});
    obj.nomeCheck16_05:setAutoChange(false);

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout18);
    obj.flowPart59:setMargins({bottom=5});
    obj.flowPart59:setName("flowPart59");
    obj.flowPart59:setMinWidth(285);
    obj.flowPart59:setMaxWidth(285);
    obj.flowPart59:setHeight(25);

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.flowPart59);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setWidth(110);
    obj.checkBox8:setText("Science");
    obj.checkBox8:setField("cck_17");
    obj.checkBox8:setName("checkBox8");
    obj.checkBox8:setFontSize(14);
    obj.checkBox8:setFontColor("white");
    lfm_setPropAsString(obj.checkBox8, "fontStyle",  "bold");
    obj.checkBox8:setTextTrimming("character");
    obj.checkBox8:setFontFamily("Constantia");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart59);
    obj.edit17:setAlign("left");
    obj.edit17:setTransparent(false);
    obj.edit17:setWidth(80);
    obj.edit17:setField("enf_17");
    obj.edit17:setName("edit17");
    obj.edit17:setFontSize(14);
    obj.edit17:setFontColor("#cdcdcd");
    obj.edit17:setTextTrimming("character");
    obj.edit17:setFontFamily("Constantia");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.flowPart59);
    obj.layout20:setAlign("client");
    obj.layout20:setMargins({right=10});
    obj.layout20:setName("layout20");

    obj.nomeCheck17_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck17_01:setParent(obj.layout20);
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
    obj.nomeCheck17_02:setParent(obj.layout20);
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
    obj.nomeCheck17_03:setParent(obj.layout20);
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
    obj.nomeCheck17_04:setParent(obj.layout20);
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
    obj.nomeCheck17_05:setParent(obj.layout20);
    obj.nomeCheck17_05:setField("fldCheck17_05");
    obj.nomeCheck17_05:setName("nomeCheck17_05");
    obj.nomeCheck17_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck17_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck17_05:setHeight(25);
    obj.nomeCheck17_05:setWidth(14);
    obj.nomeCheck17_05:setAlign("right");
    obj.nomeCheck17_05:setMargins({left=3});
    obj.nomeCheck17_05:setAutoChange(false);

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout14);
    obj.flowPart60:setHeight(270);
    obj.flowPart60:setWidth(285);
    obj.flowPart60:setMargins({bottom=20, left=10, right=10});
    obj.flowPart60:setName("flowPart60");
    obj.flowPart60:setMinWidth(285);
    obj.flowPart60:setMaxWidth(285);

    obj.flowLayout19 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.flowPart60);
    obj.flowLayout19:setOrientation("vertical");
    obj.flowLayout19:setWidth(285);
    obj.flowLayout19:setAutoHeight(true);
    obj.flowLayout19:setMaxColumns(1);
    obj.flowLayout19:setName("flowLayout19");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout19);
    obj.flowPart61:setMargins({bottom=5});
    obj.flowPart61:setName("flowPart61");
    obj.flowPart61:setMinWidth(285);
    obj.flowPart61:setMaxWidth(285);
    obj.flowPart61:setHeight(25);

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.flowPart61);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setWidth(110);
    obj.checkBox9:setText("Athletics");
    obj.checkBox9:setField("cck_19");
    obj.checkBox9:setName("checkBox9");
    obj.checkBox9:setFontSize(14);
    obj.checkBox9:setFontColor("white");
    lfm_setPropAsString(obj.checkBox9, "fontStyle",  "bold");
    obj.checkBox9:setTextTrimming("character");
    obj.checkBox9:setFontFamily("Constantia");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart61);
    obj.edit18:setAlign("left");
    obj.edit18:setTransparent(false);
    obj.edit18:setWidth(80);
    obj.edit18:setField("enf_19");
    obj.edit18:setName("edit18");
    obj.edit18:setFontSize(14);
    obj.edit18:setFontColor("#cdcdcd");
    obj.edit18:setTextTrimming("character");
    obj.edit18:setFontFamily("Constantia");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.flowPart61);
    obj.layout21:setAlign("client");
    obj.layout21:setMargins({right=10});
    obj.layout21:setName("layout21");

    obj.nomeCheck19_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck19_01:setParent(obj.layout21);
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
    obj.nomeCheck19_02:setParent(obj.layout21);
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
    obj.nomeCheck19_03:setParent(obj.layout21);
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
    obj.nomeCheck19_04:setParent(obj.layout21);
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
    obj.nomeCheck19_05:setParent(obj.layout21);
    obj.nomeCheck19_05:setField("fldCheck19_05");
    obj.nomeCheck19_05:setName("nomeCheck19_05");
    obj.nomeCheck19_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck19_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck19_05:setHeight(25);
    obj.nomeCheck19_05:setWidth(14);
    obj.nomeCheck19_05:setAlign("right");
    obj.nomeCheck19_05:setMargins({left=3});
    obj.nomeCheck19_05:setAutoChange(false);

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout19);
    obj.flowPart62:setMargins({bottom=5});
    obj.flowPart62:setName("flowPart62");
    obj.flowPart62:setMinWidth(285);
    obj.flowPart62:setMaxWidth(285);
    obj.flowPart62:setHeight(25);

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.flowPart62);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setWidth(110);
    obj.checkBox10:setText("Brawl");
    obj.checkBox10:setField("cck_20");
    obj.checkBox10:setName("checkBox10");
    obj.checkBox10:setFontSize(14);
    obj.checkBox10:setFontColor("white");
    lfm_setPropAsString(obj.checkBox10, "fontStyle",  "bold");
    obj.checkBox10:setTextTrimming("character");
    obj.checkBox10:setFontFamily("Constantia");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart62);
    obj.edit19:setAlign("left");
    obj.edit19:setTransparent(false);
    obj.edit19:setWidth(80);
    obj.edit19:setField("enf_20");
    obj.edit19:setName("edit19");
    obj.edit19:setFontSize(14);
    obj.edit19:setFontColor("#cdcdcd");
    obj.edit19:setTextTrimming("character");
    obj.edit19:setFontFamily("Constantia");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.flowPart62);
    obj.layout22:setAlign("client");
    obj.layout22:setMargins({right=10});
    obj.layout22:setName("layout22");

    obj.nomeCheck20_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck20_01:setParent(obj.layout22);
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
    obj.nomeCheck20_02:setParent(obj.layout22);
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
    obj.nomeCheck20_03:setParent(obj.layout22);
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
    obj.nomeCheck20_04:setParent(obj.layout22);
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
    obj.nomeCheck20_05:setParent(obj.layout22);
    obj.nomeCheck20_05:setField("fldCheck20_05");
    obj.nomeCheck20_05:setName("nomeCheck20_05");
    obj.nomeCheck20_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck20_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck20_05:setHeight(25);
    obj.nomeCheck20_05:setWidth(14);
    obj.nomeCheck20_05:setAlign("right");
    obj.nomeCheck20_05:setMargins({left=3});
    obj.nomeCheck20_05:setAutoChange(false);

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.flowLayout19);
    obj.flowPart63:setMargins({bottom=5});
    obj.flowPart63:setName("flowPart63");
    obj.flowPart63:setMinWidth(285);
    obj.flowPart63:setMaxWidth(285);
    obj.flowPart63:setHeight(25);

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.flowPart63);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setWidth(110);
    obj.checkBox11:setText("Drive");
    obj.checkBox11:setField("cck_21");
    obj.checkBox11:setName("checkBox11");
    obj.checkBox11:setFontSize(14);
    obj.checkBox11:setFontColor("white");
    lfm_setPropAsString(obj.checkBox11, "fontStyle",  "bold");
    obj.checkBox11:setTextTrimming("character");
    obj.checkBox11:setFontFamily("Constantia");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart63);
    obj.edit20:setAlign("left");
    obj.edit20:setTransparent(false);
    obj.edit20:setWidth(80);
    obj.edit20:setField("enf_21");
    obj.edit20:setName("edit20");
    obj.edit20:setFontSize(14);
    obj.edit20:setFontColor("#cdcdcd");
    obj.edit20:setTextTrimming("character");
    obj.edit20:setFontFamily("Constantia");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.flowPart63);
    obj.layout23:setAlign("client");
    obj.layout23:setMargins({right=10});
    obj.layout23:setName("layout23");

    obj.nomeCheck21_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck21_01:setParent(obj.layout23);
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
    obj.nomeCheck21_02:setParent(obj.layout23);
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
    obj.nomeCheck21_03:setParent(obj.layout23);
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
    obj.nomeCheck21_04:setParent(obj.layout23);
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
    obj.nomeCheck21_05:setParent(obj.layout23);
    obj.nomeCheck21_05:setField("fldCheck21_05");
    obj.nomeCheck21_05:setName("nomeCheck21_05");
    obj.nomeCheck21_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck21_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck21_05:setHeight(25);
    obj.nomeCheck21_05:setWidth(14);
    obj.nomeCheck21_05:setAlign("right");
    obj.nomeCheck21_05:setMargins({left=3});
    obj.nomeCheck21_05:setAutoChange(false);

    obj.flowPart64 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.flowLayout19);
    obj.flowPart64:setMargins({bottom=5});
    obj.flowPart64:setName("flowPart64");
    obj.flowPart64:setMinWidth(285);
    obj.flowPart64:setMaxWidth(285);
    obj.flowPart64:setHeight(25);

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.flowPart64);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setWidth(110);
    obj.checkBox12:setText("Firearms");
    obj.checkBox12:setField("cck_22");
    obj.checkBox12:setName("checkBox12");
    obj.checkBox12:setFontSize(14);
    obj.checkBox12:setFontColor("white");
    lfm_setPropAsString(obj.checkBox12, "fontStyle",  "bold");
    obj.checkBox12:setTextTrimming("character");
    obj.checkBox12:setFontFamily("Constantia");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart64);
    obj.edit21:setAlign("left");
    obj.edit21:setTransparent(false);
    obj.edit21:setWidth(80);
    obj.edit21:setField("enf_22");
    obj.edit21:setName("edit21");
    obj.edit21:setFontSize(14);
    obj.edit21:setFontColor("#cdcdcd");
    obj.edit21:setTextTrimming("character");
    obj.edit21:setFontFamily("Constantia");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.flowPart64);
    obj.layout24:setAlign("client");
    obj.layout24:setMargins({right=10});
    obj.layout24:setName("layout24");

    obj.nomeCheck22_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck22_01:setParent(obj.layout24);
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
    obj.nomeCheck22_02:setParent(obj.layout24);
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
    obj.nomeCheck22_03:setParent(obj.layout24);
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
    obj.nomeCheck22_04:setParent(obj.layout24);
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
    obj.nomeCheck22_05:setParent(obj.layout24);
    obj.nomeCheck22_05:setField("fldCheck22_05");
    obj.nomeCheck22_05:setName("nomeCheck22_05");
    obj.nomeCheck22_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck22_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck22_05:setHeight(25);
    obj.nomeCheck22_05:setWidth(14);
    obj.nomeCheck22_05:setAlign("right");
    obj.nomeCheck22_05:setMargins({left=3});
    obj.nomeCheck22_05:setAutoChange(false);

    obj.flowPart65 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.flowLayout19);
    obj.flowPart65:setMargins({bottom=5});
    obj.flowPart65:setName("flowPart65");
    obj.flowPart65:setMinWidth(285);
    obj.flowPart65:setMaxWidth(285);
    obj.flowPart65:setHeight(25);

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.flowPart65);
    obj.checkBox13:setAlign("left");
    obj.checkBox13:setWidth(110);
    obj.checkBox13:setText("Larceny");
    obj.checkBox13:setField("cck_23");
    obj.checkBox13:setName("checkBox13");
    obj.checkBox13:setFontSize(14);
    obj.checkBox13:setFontColor("white");
    lfm_setPropAsString(obj.checkBox13, "fontStyle",  "bold");
    obj.checkBox13:setTextTrimming("character");
    obj.checkBox13:setFontFamily("Constantia");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart65);
    obj.edit22:setAlign("left");
    obj.edit22:setTransparent(false);
    obj.edit22:setWidth(80);
    obj.edit22:setField("enf_23");
    obj.edit22:setName("edit22");
    obj.edit22:setFontSize(14);
    obj.edit22:setFontColor("#cdcdcd");
    obj.edit22:setTextTrimming("character");
    obj.edit22:setFontFamily("Constantia");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.flowPart65);
    obj.layout25:setAlign("client");
    obj.layout25:setMargins({right=10});
    obj.layout25:setName("layout25");

    obj.nomeCheck23_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck23_01:setParent(obj.layout25);
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
    obj.nomeCheck23_02:setParent(obj.layout25);
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
    obj.nomeCheck23_03:setParent(obj.layout25);
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
    obj.nomeCheck23_04:setParent(obj.layout25);
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
    obj.nomeCheck23_05:setParent(obj.layout25);
    obj.nomeCheck23_05:setField("fldCheck23_05");
    obj.nomeCheck23_05:setName("nomeCheck23_05");
    obj.nomeCheck23_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck23_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck23_05:setHeight(25);
    obj.nomeCheck23_05:setWidth(14);
    obj.nomeCheck23_05:setAlign("right");
    obj.nomeCheck23_05:setMargins({left=3});
    obj.nomeCheck23_05:setAutoChange(false);

    obj.flowPart66 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.flowLayout19);
    obj.flowPart66:setMargins({bottom=5});
    obj.flowPart66:setName("flowPart66");
    obj.flowPart66:setMinWidth(285);
    obj.flowPart66:setMaxWidth(285);
    obj.flowPart66:setHeight(25);

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.flowPart66);
    obj.checkBox14:setAlign("left");
    obj.checkBox14:setWidth(110);
    obj.checkBox14:setText("Stealth");
    obj.checkBox14:setField("cck_24");
    obj.checkBox14:setName("checkBox14");
    obj.checkBox14:setFontSize(14);
    obj.checkBox14:setFontColor("white");
    lfm_setPropAsString(obj.checkBox14, "fontStyle",  "bold");
    obj.checkBox14:setTextTrimming("character");
    obj.checkBox14:setFontFamily("Constantia");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart66);
    obj.edit23:setAlign("left");
    obj.edit23:setTransparent(false);
    obj.edit23:setWidth(80);
    obj.edit23:setField("enf_24");
    obj.edit23:setName("edit23");
    obj.edit23:setFontSize(14);
    obj.edit23:setFontColor("#cdcdcd");
    obj.edit23:setTextTrimming("character");
    obj.edit23:setFontFamily("Constantia");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.flowPart66);
    obj.layout26:setAlign("client");
    obj.layout26:setMargins({right=10});
    obj.layout26:setName("layout26");

    obj.nomeCheck24_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck24_01:setParent(obj.layout26);
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
    obj.nomeCheck24_02:setParent(obj.layout26);
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
    obj.nomeCheck24_03:setParent(obj.layout26);
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
    obj.nomeCheck24_04:setParent(obj.layout26);
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
    obj.nomeCheck24_05:setParent(obj.layout26);
    obj.nomeCheck24_05:setField("fldCheck24_05");
    obj.nomeCheck24_05:setName("nomeCheck24_05");
    obj.nomeCheck24_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck24_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck24_05:setHeight(25);
    obj.nomeCheck24_05:setWidth(14);
    obj.nomeCheck24_05:setAlign("right");
    obj.nomeCheck24_05:setMargins({left=3});
    obj.nomeCheck24_05:setAutoChange(false);

    obj.flowPart67 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout19);
    obj.flowPart67:setMargins({bottom=5});
    obj.flowPart67:setName("flowPart67");
    obj.flowPart67:setMinWidth(285);
    obj.flowPart67:setMaxWidth(285);
    obj.flowPart67:setHeight(25);

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.flowPart67);
    obj.checkBox15:setAlign("left");
    obj.checkBox15:setWidth(110);
    obj.checkBox15:setText("Survival");
    obj.checkBox15:setField("cck_25");
    obj.checkBox15:setName("checkBox15");
    obj.checkBox15:setFontSize(14);
    obj.checkBox15:setFontColor("white");
    lfm_setPropAsString(obj.checkBox15, "fontStyle",  "bold");
    obj.checkBox15:setTextTrimming("character");
    obj.checkBox15:setFontFamily("Constantia");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart67);
    obj.edit24:setAlign("left");
    obj.edit24:setTransparent(false);
    obj.edit24:setWidth(80);
    obj.edit24:setField("enf_25");
    obj.edit24:setName("edit24");
    obj.edit24:setFontSize(14);
    obj.edit24:setFontColor("#cdcdcd");
    obj.edit24:setTextTrimming("character");
    obj.edit24:setFontFamily("Constantia");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.flowPart67);
    obj.layout27:setAlign("client");
    obj.layout27:setMargins({right=10});
    obj.layout27:setName("layout27");

    obj.nomeCheck25_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck25_01:setParent(obj.layout27);
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
    obj.nomeCheck25_02:setParent(obj.layout27);
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
    obj.nomeCheck25_03:setParent(obj.layout27);
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
    obj.nomeCheck25_04:setParent(obj.layout27);
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
    obj.nomeCheck25_05:setParent(obj.layout27);
    obj.nomeCheck25_05:setField("fldCheck25_05");
    obj.nomeCheck25_05:setName("nomeCheck25_05");
    obj.nomeCheck25_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck25_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck25_05:setHeight(25);
    obj.nomeCheck25_05:setWidth(14);
    obj.nomeCheck25_05:setAlign("right");
    obj.nomeCheck25_05:setMargins({left=3});
    obj.nomeCheck25_05:setAutoChange(false);

    obj.flowPart68 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout19);
    obj.flowPart68:setMargins({bottom=5});
    obj.flowPart68:setName("flowPart68");
    obj.flowPart68:setMinWidth(285);
    obj.flowPart68:setMaxWidth(285);
    obj.flowPart68:setHeight(25);

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.flowPart68);
    obj.checkBox16:setAlign("left");
    obj.checkBox16:setWidth(110);
    obj.checkBox16:setText("Weaponry");
    obj.checkBox16:setField("cck_26");
    obj.checkBox16:setName("checkBox16");
    obj.checkBox16:setFontSize(14);
    obj.checkBox16:setFontColor("white");
    lfm_setPropAsString(obj.checkBox16, "fontStyle",  "bold");
    obj.checkBox16:setTextTrimming("character");
    obj.checkBox16:setFontFamily("Constantia");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart68);
    obj.edit25:setAlign("left");
    obj.edit25:setTransparent(false);
    obj.edit25:setWidth(80);
    obj.edit25:setField("enf_26");
    obj.edit25:setName("edit25");
    obj.edit25:setFontSize(14);
    obj.edit25:setFontColor("#cdcdcd");
    obj.edit25:setTextTrimming("character");
    obj.edit25:setFontFamily("Constantia");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.flowPart68);
    obj.layout28:setAlign("client");
    obj.layout28:setMargins({right=10});
    obj.layout28:setName("layout28");

    obj.nomeCheck26_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck26_01:setParent(obj.layout28);
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
    obj.nomeCheck26_02:setParent(obj.layout28);
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
    obj.nomeCheck26_03:setParent(obj.layout28);
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
    obj.nomeCheck26_04:setParent(obj.layout28);
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
    obj.nomeCheck26_05:setParent(obj.layout28);
    obj.nomeCheck26_05:setField("fldCheck26_05");
    obj.nomeCheck26_05:setName("nomeCheck26_05");
    obj.nomeCheck26_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck26_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck26_05:setHeight(25);
    obj.nomeCheck26_05:setWidth(14);
    obj.nomeCheck26_05:setAlign("right");
    obj.nomeCheck26_05:setMargins({left=3});
    obj.nomeCheck26_05:setAutoChange(false);

    obj.flowPart69 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout14);
    obj.flowPart69:setHeight(270);
    obj.flowPart69:setWidth(285);
    obj.flowPart69:setMargins({bottom=20, left=10, right=10});
    obj.flowPart69:setName("flowPart69");
    obj.flowPart69:setMinWidth(285);
    obj.flowPart69:setMaxWidth(285);

    obj.flowLayout20 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.flowPart69);
    obj.flowLayout20:setOrientation("vertical");
    obj.flowLayout20:setWidth(285);
    obj.flowLayout20:setAutoHeight(true);
    obj.flowLayout20:setMaxColumns(1);
    obj.flowLayout20:setName("flowLayout20");

    obj.flowPart70 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout20);
    obj.flowPart70:setMargins({bottom=5});
    obj.flowPart70:setName("flowPart70");
    obj.flowPart70:setMinWidth(285);
    obj.flowPart70:setMaxWidth(285);
    obj.flowPart70:setHeight(25);

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.flowPart70);
    obj.checkBox17:setAlign("left");
    obj.checkBox17:setWidth(110);
    obj.checkBox17:setText("Animal Ken");
    obj.checkBox17:setField("cck_28");
    obj.checkBox17:setName("checkBox17");
    obj.checkBox17:setFontSize(14);
    obj.checkBox17:setFontColor("white");
    lfm_setPropAsString(obj.checkBox17, "fontStyle",  "bold");
    obj.checkBox17:setTextTrimming("character");
    obj.checkBox17:setFontFamily("Constantia");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart70);
    obj.edit26:setAlign("left");
    obj.edit26:setTransparent(false);
    obj.edit26:setWidth(80);
    obj.edit26:setField("enf_28");
    obj.edit26:setName("edit26");
    obj.edit26:setFontSize(14);
    obj.edit26:setFontColor("#cdcdcd");
    obj.edit26:setTextTrimming("character");
    obj.edit26:setFontFamily("Constantia");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.flowPart70);
    obj.layout29:setAlign("client");
    obj.layout29:setMargins({right=10});
    obj.layout29:setName("layout29");

    obj.nomeCheck28_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck28_01:setParent(obj.layout29);
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
    obj.nomeCheck28_02:setParent(obj.layout29);
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
    obj.nomeCheck28_03:setParent(obj.layout29);
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
    obj.nomeCheck28_04:setParent(obj.layout29);
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
    obj.nomeCheck28_05:setParent(obj.layout29);
    obj.nomeCheck28_05:setField("fldCheck28_05");
    obj.nomeCheck28_05:setName("nomeCheck28_05");
    obj.nomeCheck28_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck28_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck28_05:setHeight(25);
    obj.nomeCheck28_05:setWidth(14);
    obj.nomeCheck28_05:setAlign("right");
    obj.nomeCheck28_05:setMargins({left=3});
    obj.nomeCheck28_05:setAutoChange(false);

    obj.flowPart71 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout20);
    obj.flowPart71:setMargins({bottom=5});
    obj.flowPart71:setName("flowPart71");
    obj.flowPart71:setMinWidth(285);
    obj.flowPart71:setMaxWidth(285);
    obj.flowPart71:setHeight(25);

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.flowPart71);
    obj.checkBox18:setAlign("left");
    obj.checkBox18:setWidth(110);
    obj.checkBox18:setText("Empathy");
    obj.checkBox18:setField("cck_29");
    obj.checkBox18:setName("checkBox18");
    obj.checkBox18:setFontSize(14);
    obj.checkBox18:setFontColor("white");
    lfm_setPropAsString(obj.checkBox18, "fontStyle",  "bold");
    obj.checkBox18:setTextTrimming("character");
    obj.checkBox18:setFontFamily("Constantia");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart71);
    obj.edit27:setAlign("left");
    obj.edit27:setTransparent(false);
    obj.edit27:setWidth(80);
    obj.edit27:setField("enf_29");
    obj.edit27:setName("edit27");
    obj.edit27:setFontSize(14);
    obj.edit27:setFontColor("#cdcdcd");
    obj.edit27:setTextTrimming("character");
    obj.edit27:setFontFamily("Constantia");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.flowPart71);
    obj.layout30:setAlign("client");
    obj.layout30:setMargins({right=10});
    obj.layout30:setName("layout30");

    obj.nomeCheck29_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck29_01:setParent(obj.layout30);
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
    obj.nomeCheck29_02:setParent(obj.layout30);
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
    obj.nomeCheck29_03:setParent(obj.layout30);
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
    obj.nomeCheck29_04:setParent(obj.layout30);
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
    obj.nomeCheck29_05:setParent(obj.layout30);
    obj.nomeCheck29_05:setField("fldCheck29_05");
    obj.nomeCheck29_05:setName("nomeCheck29_05");
    obj.nomeCheck29_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck29_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck29_05:setHeight(25);
    obj.nomeCheck29_05:setWidth(14);
    obj.nomeCheck29_05:setAlign("right");
    obj.nomeCheck29_05:setMargins({left=3});
    obj.nomeCheck29_05:setAutoChange(false);

    obj.flowPart72 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout20);
    obj.flowPart72:setMargins({bottom=5});
    obj.flowPart72:setName("flowPart72");
    obj.flowPart72:setMinWidth(285);
    obj.flowPart72:setMaxWidth(285);
    obj.flowPart72:setHeight(25);

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.flowPart72);
    obj.checkBox19:setAlign("left");
    obj.checkBox19:setWidth(110);
    obj.checkBox19:setText("Expression");
    obj.checkBox19:setField("cck_30");
    obj.checkBox19:setName("checkBox19");
    obj.checkBox19:setFontSize(14);
    obj.checkBox19:setFontColor("white");
    lfm_setPropAsString(obj.checkBox19, "fontStyle",  "bold");
    obj.checkBox19:setTextTrimming("character");
    obj.checkBox19:setFontFamily("Constantia");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart72);
    obj.edit28:setAlign("left");
    obj.edit28:setTransparent(false);
    obj.edit28:setWidth(80);
    obj.edit28:setField("enf_30");
    obj.edit28:setName("edit28");
    obj.edit28:setFontSize(14);
    obj.edit28:setFontColor("#cdcdcd");
    obj.edit28:setTextTrimming("character");
    obj.edit28:setFontFamily("Constantia");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.flowPart72);
    obj.layout31:setAlign("client");
    obj.layout31:setMargins({right=10});
    obj.layout31:setName("layout31");

    obj.nomeCheck30_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck30_01:setParent(obj.layout31);
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
    obj.nomeCheck30_02:setParent(obj.layout31);
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
    obj.nomeCheck30_03:setParent(obj.layout31);
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
    obj.nomeCheck30_04:setParent(obj.layout31);
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
    obj.nomeCheck30_05:setParent(obj.layout31);
    obj.nomeCheck30_05:setField("fldCheck30_05");
    obj.nomeCheck30_05:setName("nomeCheck30_05");
    obj.nomeCheck30_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck30_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck30_05:setHeight(25);
    obj.nomeCheck30_05:setWidth(14);
    obj.nomeCheck30_05:setAlign("right");
    obj.nomeCheck30_05:setMargins({left=3});
    obj.nomeCheck30_05:setAutoChange(false);

    obj.flowPart73 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout20);
    obj.flowPart73:setMargins({bottom=5});
    obj.flowPart73:setName("flowPart73");
    obj.flowPart73:setMinWidth(285);
    obj.flowPart73:setMaxWidth(285);
    obj.flowPart73:setHeight(25);

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.flowPart73);
    obj.checkBox20:setAlign("left");
    obj.checkBox20:setWidth(110);
    obj.checkBox20:setText("Intimidation");
    obj.checkBox20:setField("cck_31");
    obj.checkBox20:setName("checkBox20");
    obj.checkBox20:setFontSize(14);
    obj.checkBox20:setFontColor("white");
    lfm_setPropAsString(obj.checkBox20, "fontStyle",  "bold");
    obj.checkBox20:setTextTrimming("character");
    obj.checkBox20:setFontFamily("Constantia");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart73);
    obj.edit29:setAlign("left");
    obj.edit29:setTransparent(false);
    obj.edit29:setWidth(80);
    obj.edit29:setField("enf_31");
    obj.edit29:setName("edit29");
    obj.edit29:setFontSize(14);
    obj.edit29:setFontColor("#cdcdcd");
    obj.edit29:setTextTrimming("character");
    obj.edit29:setFontFamily("Constantia");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.flowPart73);
    obj.layout32:setAlign("client");
    obj.layout32:setMargins({right=10});
    obj.layout32:setName("layout32");

    obj.nomeCheck31_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck31_01:setParent(obj.layout32);
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
    obj.nomeCheck31_02:setParent(obj.layout32);
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
    obj.nomeCheck31_03:setParent(obj.layout32);
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
    obj.nomeCheck31_04:setParent(obj.layout32);
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
    obj.nomeCheck31_05:setParent(obj.layout32);
    obj.nomeCheck31_05:setField("fldCheck31_05");
    obj.nomeCheck31_05:setName("nomeCheck31_05");
    obj.nomeCheck31_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck31_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck31_05:setHeight(25);
    obj.nomeCheck31_05:setWidth(14);
    obj.nomeCheck31_05:setAlign("right");
    obj.nomeCheck31_05:setMargins({left=3});
    obj.nomeCheck31_05:setAutoChange(false);

    obj.flowPart74 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout20);
    obj.flowPart74:setMargins({bottom=5});
    obj.flowPart74:setName("flowPart74");
    obj.flowPart74:setMinWidth(285);
    obj.flowPart74:setMaxWidth(285);
    obj.flowPart74:setHeight(25);

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.flowPart74);
    obj.checkBox21:setAlign("left");
    obj.checkBox21:setWidth(110);
    obj.checkBox21:setText("Persuasion");
    obj.checkBox21:setField("cck_32");
    obj.checkBox21:setName("checkBox21");
    obj.checkBox21:setFontSize(14);
    obj.checkBox21:setFontColor("white");
    lfm_setPropAsString(obj.checkBox21, "fontStyle",  "bold");
    obj.checkBox21:setTextTrimming("character");
    obj.checkBox21:setFontFamily("Constantia");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart74);
    obj.edit30:setAlign("left");
    obj.edit30:setTransparent(false);
    obj.edit30:setWidth(80);
    obj.edit30:setField("enf_32");
    obj.edit30:setName("edit30");
    obj.edit30:setFontSize(14);
    obj.edit30:setFontColor("#cdcdcd");
    obj.edit30:setTextTrimming("character");
    obj.edit30:setFontFamily("Constantia");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.flowPart74);
    obj.layout33:setAlign("client");
    obj.layout33:setMargins({right=10});
    obj.layout33:setName("layout33");

    obj.nomeCheck32_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck32_01:setParent(obj.layout33);
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
    obj.nomeCheck32_02:setParent(obj.layout33);
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
    obj.nomeCheck32_03:setParent(obj.layout33);
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
    obj.nomeCheck32_04:setParent(obj.layout33);
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
    obj.nomeCheck32_05:setParent(obj.layout33);
    obj.nomeCheck32_05:setField("fldCheck32_05");
    obj.nomeCheck32_05:setName("nomeCheck32_05");
    obj.nomeCheck32_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck32_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck32_05:setHeight(25);
    obj.nomeCheck32_05:setWidth(14);
    obj.nomeCheck32_05:setAlign("right");
    obj.nomeCheck32_05:setMargins({left=3});
    obj.nomeCheck32_05:setAutoChange(false);

    obj.flowPart75 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout20);
    obj.flowPart75:setMargins({bottom=5});
    obj.flowPart75:setName("flowPart75");
    obj.flowPart75:setMinWidth(285);
    obj.flowPart75:setMaxWidth(285);
    obj.flowPart75:setHeight(25);

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.flowPart75);
    obj.checkBox22:setAlign("left");
    obj.checkBox22:setWidth(110);
    obj.checkBox22:setText("Socialize");
    obj.checkBox22:setField("cck_33");
    obj.checkBox22:setName("checkBox22");
    obj.checkBox22:setFontSize(14);
    obj.checkBox22:setFontColor("white");
    lfm_setPropAsString(obj.checkBox22, "fontStyle",  "bold");
    obj.checkBox22:setTextTrimming("character");
    obj.checkBox22:setFontFamily("Constantia");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart75);
    obj.edit31:setAlign("left");
    obj.edit31:setTransparent(false);
    obj.edit31:setWidth(80);
    obj.edit31:setField("enf_33");
    obj.edit31:setName("edit31");
    obj.edit31:setFontSize(14);
    obj.edit31:setFontColor("#cdcdcd");
    obj.edit31:setTextTrimming("character");
    obj.edit31:setFontFamily("Constantia");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.flowPart75);
    obj.layout34:setAlign("client");
    obj.layout34:setMargins({right=10});
    obj.layout34:setName("layout34");

    obj.nomeCheck33_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck33_01:setParent(obj.layout34);
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
    obj.nomeCheck33_02:setParent(obj.layout34);
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
    obj.nomeCheck33_03:setParent(obj.layout34);
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
    obj.nomeCheck33_04:setParent(obj.layout34);
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
    obj.nomeCheck33_05:setParent(obj.layout34);
    obj.nomeCheck33_05:setField("fldCheck33_05");
    obj.nomeCheck33_05:setName("nomeCheck33_05");
    obj.nomeCheck33_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck33_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck33_05:setHeight(25);
    obj.nomeCheck33_05:setWidth(14);
    obj.nomeCheck33_05:setAlign("right");
    obj.nomeCheck33_05:setMargins({left=3});
    obj.nomeCheck33_05:setAutoChange(false);

    obj.flowPart76 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout20);
    obj.flowPart76:setMargins({bottom=5});
    obj.flowPart76:setName("flowPart76");
    obj.flowPart76:setMinWidth(285);
    obj.flowPart76:setMaxWidth(285);
    obj.flowPart76:setHeight(25);

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.flowPart76);
    obj.checkBox23:setAlign("left");
    obj.checkBox23:setWidth(110);
    obj.checkBox23:setText("Streetwise");
    obj.checkBox23:setField("cck_34");
    obj.checkBox23:setName("checkBox23");
    obj.checkBox23:setFontSize(14);
    obj.checkBox23:setFontColor("white");
    lfm_setPropAsString(obj.checkBox23, "fontStyle",  "bold");
    obj.checkBox23:setTextTrimming("character");
    obj.checkBox23:setFontFamily("Constantia");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart76);
    obj.edit32:setAlign("left");
    obj.edit32:setTransparent(false);
    obj.edit32:setWidth(80);
    obj.edit32:setField("enf_34");
    obj.edit32:setName("edit32");
    obj.edit32:setFontSize(14);
    obj.edit32:setFontColor("#cdcdcd");
    obj.edit32:setTextTrimming("character");
    obj.edit32:setFontFamily("Constantia");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.flowPart76);
    obj.layout35:setAlign("client");
    obj.layout35:setMargins({right=10});
    obj.layout35:setName("layout35");

    obj.nomeCheck34_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck34_01:setParent(obj.layout35);
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
    obj.nomeCheck34_02:setParent(obj.layout35);
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
    obj.nomeCheck34_03:setParent(obj.layout35);
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
    obj.nomeCheck34_04:setParent(obj.layout35);
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
    obj.nomeCheck34_05:setParent(obj.layout35);
    obj.nomeCheck34_05:setField("fldCheck34_05");
    obj.nomeCheck34_05:setName("nomeCheck34_05");
    obj.nomeCheck34_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck34_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck34_05:setHeight(25);
    obj.nomeCheck34_05:setWidth(14);
    obj.nomeCheck34_05:setAlign("right");
    obj.nomeCheck34_05:setMargins({left=3});
    obj.nomeCheck34_05:setAutoChange(false);

    obj.flowPart77 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout20);
    obj.flowPart77:setMargins({bottom=5});
    obj.flowPart77:setName("flowPart77");
    obj.flowPart77:setMinWidth(285);
    obj.flowPart77:setMaxWidth(285);
    obj.flowPart77:setHeight(25);

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.flowPart77);
    obj.checkBox24:setAlign("left");
    obj.checkBox24:setWidth(110);
    obj.checkBox24:setText("Subterfuge");
    obj.checkBox24:setField("cck_35");
    obj.checkBox24:setName("checkBox24");
    obj.checkBox24:setFontSize(14);
    obj.checkBox24:setFontColor("white");
    lfm_setPropAsString(obj.checkBox24, "fontStyle",  "bold");
    obj.checkBox24:setTextTrimming("character");
    obj.checkBox24:setFontFamily("Constantia");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart77);
    obj.edit33:setAlign("left");
    obj.edit33:setTransparent(false);
    obj.edit33:setWidth(80);
    obj.edit33:setField("enf_35");
    obj.edit33:setName("edit33");
    obj.edit33:setFontSize(14);
    obj.edit33:setFontColor("#cdcdcd");
    obj.edit33:setTextTrimming("character");
    obj.edit33:setFontFamily("Constantia");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.flowPart77);
    obj.layout36:setAlign("client");
    obj.layout36:setMargins({right=10});
    obj.layout36:setName("layout36");

    obj.nomeCheck35_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck35_01:setParent(obj.layout36);
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
    obj.nomeCheck35_02:setParent(obj.layout36);
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
    obj.nomeCheck35_03:setParent(obj.layout36);
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
    obj.nomeCheck35_04:setParent(obj.layout36);
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
    obj.nomeCheck35_05:setParent(obj.layout36);
    obj.nomeCheck35_05:setField("fldCheck35_05");
    obj.nomeCheck35_05:setName("nomeCheck35_05");
    obj.nomeCheck35_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck35_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck35_05:setHeight(25);
    obj.nomeCheck35_05:setWidth(14);
    obj.nomeCheck35_05:setAlign("right");
    obj.nomeCheck35_05:setMargins({left=3});
    obj.nomeCheck35_05:setAutoChange(false);

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Atributos Secundários");
    obj.tab2:setName("tab2");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.tab2);
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("#272727");
    obj.rectangle4:setXradius(20);
    obj.rectangle4:setYradius(20);
    obj.rectangle4:setCornerType("bevel");
    obj.rectangle4:setMargins({top=10, right=10, bottom=10, left=10});

    obj.layVerso = GUI.fromHandle(_obj_newObject("layout"));
    obj.layVerso:setParent(obj.rectangle4);
    obj.layVerso:setName("layVerso");
    obj.layVerso:setAlign("client");

    obj.flowLayout21 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.layVerso);
    obj.flowLayout21:setHeight(25);
    obj.flowLayout21:setMargins({top=20});
    obj.flowLayout21:setName("flowLayout21");
    obj.flowLayout21:setAlign("top");
    obj.flowLayout21:setOrientation("horizontal");
    obj.flowLayout21:setHorzAlign("center");
    obj.flowLayout21:setAutoHeight(true);
    obj.flowLayout21:setMaxControlsPerLine(3);

    obj.flowPart78 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout21);
    obj.flowPart78:setHeight(25);
    obj.flowPart78:setMinWidth(400);
    obj.flowPart78:setMaxWidth(1000);
    obj.flowPart78:setMargins();
    obj.flowPart78:setName("flowPart78");

    obj.flowLayout22 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.flowPart78);
    obj.flowLayout22:setAutoHeight(false);
    obj.flowLayout22:setHeight(25);
    obj.flowLayout22:setMargins();
    obj.flowLayout22:setName("flowLayout22");
    obj.flowLayout22:setAlign("top");
    obj.flowLayout22:setOrientation("horizontal");
    obj.flowLayout22:setHorzAlign("center");
    obj.flowLayout22:setMaxControlsPerLine(3);

    obj.flowPart79 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout22);
    obj.flowPart79:setHeight(25);
    obj.flowPart79:setMinWidth(0);
    obj.flowPart79:setMaxWidth(305);
    obj.flowPart79:setWidth(305);
    obj.flowPart79:setName("flowPart79");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.flowPart79);
    obj.horzLine5:setName("horzLine5");
    obj.horzLine5:setStrokeColor("#424242");
    obj.horzLine5:setMargins({top=7});
    obj.horzLine5:setAlign("top");

    obj.flowPart80 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout22);
    obj.flowPart80:setHeight(25);
    obj.flowPart80:setWidth(200);
    obj.flowPart80:setName("flowPart80");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart80);
    obj.label33:setText("M A R C A D O R E S");
    obj.label33:setName("label33");
    obj.label33:setFontSize(20);
    obj.label33:setFontColor("white");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setTextTrimming("character");
    obj.label33:setFontFamily("Constantia");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setAutoSize(true);
    obj.label33:setAlign("client");
    obj.label33:setMargins({bottom=7});

    obj.flowPart81 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.flowLayout22);
    obj.flowPart81:setHeight(25);
    obj.flowPart81:setMinWidth(0);
    obj.flowPart81:setMaxWidth(305);
    obj.flowPart81:setWidth(305);
    obj.flowPart81:setName("flowPart81");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.flowPart81);
    obj.horzLine6:setName("horzLine6");
    obj.horzLine6:setStrokeColor("#424242");
    obj.horzLine6:setMargins({top=7});
    obj.horzLine6:setAlign("top");

    obj.flowLayout23 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.layVerso);
    obj.flowLayout23:setMargins({left=20, top=10, bottom=30, right=20});
    obj.flowLayout23:setName("flowLayout23");
    obj.flowLayout23:setAlign("top");
    obj.flowLayout23:setOrientation("horizontal");
    obj.flowLayout23:setHorzAlign("center");
    obj.flowLayout23:setAutoHeight(true);
    obj.flowLayout23:setMaxControlsPerLine(3);

    obj.flowPart82 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.flowLayout23);
    obj.flowPart82:setHeight(120);
    obj.flowPart82:setMinWidth(270);
    obj.flowPart82:setMaxWidth(270);
    obj.flowPart82:setMargins({bottom=20, left=10, right=10});
    obj.flowPart82:setName("flowPart82");

    obj.flowLayout24 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.flowPart82);
    obj.flowLayout24:setMaxControlsPerLine(1);
    obj.flowLayout24:setWidth(270);
    obj.flowLayout24:setAutoHeight(true);
    obj.flowLayout24:setName("flowLayout24");

    obj.flowLayout25 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.flowLayout24);
    obj.flowLayout25:setOrientation("vertical");
    obj.flowLayout25:setWidth(270);
    obj.flowLayout25:setAutoHeight(true);
    obj.flowLayout25:setMaxColumns(1);
    obj.flowLayout25:setName("flowLayout25");

    obj.flowPart83 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.flowLayout25);
    obj.flowPart83:setHeight(15);
    obj.flowPart83:setMargins({bottom=15});
    obj.flowPart83:setName("flowPart83");
    obj.flowPart83:setMinWidth(220);
    obj.flowPart83:setMaxWidth(220);

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart83);
    obj.label34:setFontSize(13);
    obj.label34:setText("H E A L T H");
    obj.label34:setName("label34");
    obj.label34:setFontColor("white");
    obj.label34:setTextTrimming("character");
    obj.label34:setFontFamily("Constantia");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setAlign("top");
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");

    obj.flowLayout26 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout26:setParent(obj.flowLayout24);
    obj.flowLayout26:setOrientation("vertical");
    obj.flowLayout26:setWidth(270);
    obj.flowLayout26:setAutoHeight(true);
    obj.flowLayout26:setMaxColumns(1);
    obj.flowLayout26:setName("flowLayout26");

    obj.flowPart84 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.flowLayout26);
    obj.flowPart84:setMinWidth(226);
    obj.flowPart84:setMaxWidth(226);
    obj.flowPart84:setHeight(15);
    obj.flowPart84:setMargins({bottom=5, left=3});
    obj.flowPart84:setName("flowPart84");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.flowPart84);
    obj.layout37:setAlign("client");
    obj.layout37:setMargins({right=25});
    obj.layout37:setName("layout37");

    obj.nomeCheck_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_01:setParent(obj.layout37);
    obj.nomeCheck_01:setField("fldCheck_01");
    obj.nomeCheck_01:setName("nomeCheck_01");
    obj.nomeCheck_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_01:setHeight(25);
    obj.nomeCheck_01:setWidth(14);
    obj.nomeCheck_01:setAlign("right");
    obj.nomeCheck_01:setMargins({left=3});
    obj.nomeCheck_01:setAutoChange(false);

    obj.nomeCheck_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_02:setParent(obj.layout37);
    obj.nomeCheck_02:setField("fldCheck_02");
    obj.nomeCheck_02:setName("nomeCheck_02");
    obj.nomeCheck_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_02:setHeight(25);
    obj.nomeCheck_02:setWidth(14);
    obj.nomeCheck_02:setAlign("right");
    obj.nomeCheck_02:setMargins({left=3});
    obj.nomeCheck_02:setAutoChange(false);

    obj.nomeCheck_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_03:setParent(obj.layout37);
    obj.nomeCheck_03:setField("fldCheck_03");
    obj.nomeCheck_03:setName("nomeCheck_03");
    obj.nomeCheck_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_03:setHeight(25);
    obj.nomeCheck_03:setWidth(14);
    obj.nomeCheck_03:setAlign("right");
    obj.nomeCheck_03:setMargins({left=3});
    obj.nomeCheck_03:setAutoChange(false);

    obj.nomeCheck_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_04:setParent(obj.layout37);
    obj.nomeCheck_04:setField("fldCheck_04");
    obj.nomeCheck_04:setName("nomeCheck_04");
    obj.nomeCheck_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_04:setHeight(25);
    obj.nomeCheck_04:setWidth(14);
    obj.nomeCheck_04:setAlign("right");
    obj.nomeCheck_04:setMargins({left=3});
    obj.nomeCheck_04:setAutoChange(false);

    obj.nomeCheck_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_05:setParent(obj.layout37);
    obj.nomeCheck_05:setField("fldCheck_05");
    obj.nomeCheck_05:setName("nomeCheck_05");
    obj.nomeCheck_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_05:setHeight(25);
    obj.nomeCheck_05:setWidth(14);
    obj.nomeCheck_05:setAlign("right");
    obj.nomeCheck_05:setMargins({left=3});
    obj.nomeCheck_05:setAutoChange(false);

    obj.nomeCheck_06 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_06:setParent(obj.layout37);
    obj.nomeCheck_06:setField("fldCheck_06");
    obj.nomeCheck_06:setName("nomeCheck_06");
    obj.nomeCheck_06:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_06:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_06:setHeight(25);
    obj.nomeCheck_06:setWidth(14);
    obj.nomeCheck_06:setAlign("right");
    obj.nomeCheck_06:setMargins({left=3});
    obj.nomeCheck_06:setAutoChange(false);

    obj.nomeCheck_07 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_07:setParent(obj.layout37);
    obj.nomeCheck_07:setField("fldCheck_07");
    obj.nomeCheck_07:setName("nomeCheck_07");
    obj.nomeCheck_07:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_07:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_07:setHeight(25);
    obj.nomeCheck_07:setWidth(14);
    obj.nomeCheck_07:setAlign("right");
    obj.nomeCheck_07:setMargins({left=3});
    obj.nomeCheck_07:setAutoChange(false);

    obj.nomeCheck_08 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_08:setParent(obj.layout37);
    obj.nomeCheck_08:setField("fldCheck_08");
    obj.nomeCheck_08:setName("nomeCheck_08");
    obj.nomeCheck_08:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_08:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_08:setHeight(25);
    obj.nomeCheck_08:setWidth(14);
    obj.nomeCheck_08:setAlign("right");
    obj.nomeCheck_08:setMargins({left=3});
    obj.nomeCheck_08:setAutoChange(false);

    obj.nomeCheck_09 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_09:setParent(obj.layout37);
    obj.nomeCheck_09:setField("fldCheck_09");
    obj.nomeCheck_09:setName("nomeCheck_09");
    obj.nomeCheck_09:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_09:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_09:setHeight(25);
    obj.nomeCheck_09:setWidth(14);
    obj.nomeCheck_09:setAlign("right");
    obj.nomeCheck_09:setMargins({left=3});
    obj.nomeCheck_09:setAutoChange(false);

    obj.nomeCheck_10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_10:setParent(obj.layout37);
    obj.nomeCheck_10:setField("fldCheck_10");
    obj.nomeCheck_10:setName("nomeCheck_10");
    obj.nomeCheck_10:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_10:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_10:setHeight(25);
    obj.nomeCheck_10:setWidth(14);
    obj.nomeCheck_10:setAlign("right");
    obj.nomeCheck_10:setMargins({left=3});
    obj.nomeCheck_10:setAutoChange(false);

    obj.nomeCheck_11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_11:setParent(obj.layout37);
    obj.nomeCheck_11:setField("fldCheck_11");
    obj.nomeCheck_11:setName("nomeCheck_11");
    obj.nomeCheck_11:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_11:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_11:setHeight(25);
    obj.nomeCheck_11:setWidth(14);
    obj.nomeCheck_11:setAlign("right");
    obj.nomeCheck_11:setMargins({left=3});
    obj.nomeCheck_11:setAutoChange(false);

    obj.nomeCheck_12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck_12:setParent(obj.layout37);
    obj.nomeCheck_12:setField("fldCheck_12");
    obj.nomeCheck_12:setName("nomeCheck_12");
    obj.nomeCheck_12:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck_12:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck_12:setHeight(25);
    obj.nomeCheck_12:setWidth(14);
    obj.nomeCheck_12:setAlign("right");
    obj.nomeCheck_12:setMargins({left=3});
    obj.nomeCheck_12:setAutoChange(false);

    obj.flowLayout27 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout27:setParent(obj.flowLayout24);
    obj.flowLayout27:setOrientation("vertical");
    obj.flowLayout27:setWidth(270);
    obj.flowLayout27:setAutoHeight(true);
    obj.flowLayout27:setMaxColumns(12);
    obj.flowLayout27:setName("flowLayout27");

    obj.flowPart85 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.flowLayout27);
    obj.flowPart85:setMargins({bottom=5, right=2});
    obj.flowPart85:setMinWidth(15);
    obj.flowPart85:setMaxWidth(15);
    obj.flowPart85:setName("flowPart85");
    obj.flowPart85:setHeight(25);

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart85);
    obj.edit34:setTransparent(false);
    obj.edit34:setWidth(15);
    obj.edit34:setHeight(20);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setField("1_");
    obj.edit34:setName("edit34");
    obj.edit34:setFontSize(14);
    obj.edit34:setFontColor("#cdcdcd");
    obj.edit34:setTextTrimming("character");
    obj.edit34:setFontFamily("Constantia");

    obj.flowPart86 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.flowLayout27);
    obj.flowPart86:setMargins({bottom=5, right=2});
    obj.flowPart86:setMinWidth(15);
    obj.flowPart86:setMaxWidth(15);
    obj.flowPart86:setName("flowPart86");
    obj.flowPart86:setHeight(25);

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart86);
    obj.edit35:setTransparent(false);
    obj.edit35:setWidth(15);
    obj.edit35:setHeight(20);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setField("2_");
    obj.edit35:setName("edit35");
    obj.edit35:setFontSize(14);
    obj.edit35:setFontColor("#cdcdcd");
    obj.edit35:setTextTrimming("character");
    obj.edit35:setFontFamily("Constantia");

    obj.flowPart87 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.flowLayout27);
    obj.flowPart87:setMargins({bottom=5, right=2});
    obj.flowPart87:setMinWidth(15);
    obj.flowPart87:setMaxWidth(15);
    obj.flowPart87:setName("flowPart87");
    obj.flowPart87:setHeight(25);

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart87);
    obj.edit36:setTransparent(false);
    obj.edit36:setWidth(15);
    obj.edit36:setHeight(20);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setField("3_");
    obj.edit36:setName("edit36");
    obj.edit36:setFontSize(14);
    obj.edit36:setFontColor("#cdcdcd");
    obj.edit36:setTextTrimming("character");
    obj.edit36:setFontFamily("Constantia");

    obj.flowPart88 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.flowLayout27);
    obj.flowPart88:setMargins({bottom=5, right=2});
    obj.flowPart88:setMinWidth(15);
    obj.flowPart88:setMaxWidth(15);
    obj.flowPart88:setName("flowPart88");
    obj.flowPart88:setHeight(25);

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart88);
    obj.edit37:setTransparent(false);
    obj.edit37:setWidth(15);
    obj.edit37:setHeight(20);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setField("4_");
    obj.edit37:setName("edit37");
    obj.edit37:setFontSize(14);
    obj.edit37:setFontColor("#cdcdcd");
    obj.edit37:setTextTrimming("character");
    obj.edit37:setFontFamily("Constantia");

    obj.flowPart89 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.flowLayout27);
    obj.flowPart89:setMargins({bottom=5, right=2});
    obj.flowPart89:setMinWidth(15);
    obj.flowPart89:setMaxWidth(15);
    obj.flowPart89:setName("flowPart89");
    obj.flowPart89:setHeight(25);

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart89);
    obj.edit38:setTransparent(false);
    obj.edit38:setWidth(15);
    obj.edit38:setHeight(20);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setField("5_");
    obj.edit38:setName("edit38");
    obj.edit38:setFontSize(14);
    obj.edit38:setFontColor("#cdcdcd");
    obj.edit38:setTextTrimming("character");
    obj.edit38:setFontFamily("Constantia");

    obj.flowPart90 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.flowLayout27);
    obj.flowPart90:setMargins({bottom=5, right=2});
    obj.flowPart90:setMinWidth(15);
    obj.flowPart90:setMaxWidth(15);
    obj.flowPart90:setName("flowPart90");
    obj.flowPart90:setHeight(25);

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart90);
    obj.edit39:setTransparent(false);
    obj.edit39:setWidth(15);
    obj.edit39:setHeight(20);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setField("6_");
    obj.edit39:setName("edit39");
    obj.edit39:setFontSize(14);
    obj.edit39:setFontColor("#cdcdcd");
    obj.edit39:setTextTrimming("character");
    obj.edit39:setFontFamily("Constantia");

    obj.flowPart91 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.flowLayout27);
    obj.flowPart91:setMargins({bottom=5, right=2});
    obj.flowPart91:setMinWidth(15);
    obj.flowPart91:setMaxWidth(15);
    obj.flowPart91:setName("flowPart91");
    obj.flowPart91:setHeight(25);

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart91);
    obj.edit40:setTransparent(false);
    obj.edit40:setWidth(15);
    obj.edit40:setHeight(20);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setField("7_");
    obj.edit40:setName("edit40");
    obj.edit40:setFontSize(14);
    obj.edit40:setFontColor("#cdcdcd");
    obj.edit40:setTextTrimming("character");
    obj.edit40:setFontFamily("Constantia");

    obj.flowPart92 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.flowLayout27);
    obj.flowPart92:setMargins({bottom=5, right=2});
    obj.flowPart92:setMinWidth(15);
    obj.flowPart92:setMaxWidth(15);
    obj.flowPart92:setName("flowPart92");
    obj.flowPart92:setHeight(25);

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart92);
    obj.edit41:setTransparent(false);
    obj.edit41:setWidth(15);
    obj.edit41:setHeight(20);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setField("8_");
    obj.edit41:setName("edit41");
    obj.edit41:setFontSize(14);
    obj.edit41:setFontColor("#cdcdcd");
    obj.edit41:setTextTrimming("character");
    obj.edit41:setFontFamily("Constantia");

    obj.flowPart93 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.flowLayout27);
    obj.flowPart93:setMargins({bottom=5, right=2});
    obj.flowPart93:setMinWidth(15);
    obj.flowPart93:setMaxWidth(15);
    obj.flowPart93:setName("flowPart93");
    obj.flowPart93:setHeight(25);

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart93);
    obj.edit42:setTransparent(false);
    obj.edit42:setWidth(15);
    obj.edit42:setHeight(20);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setField("9_");
    obj.edit42:setName("edit42");
    obj.edit42:setFontSize(14);
    obj.edit42:setFontColor("#cdcdcd");
    obj.edit42:setTextTrimming("character");
    obj.edit42:setFontFamily("Constantia");

    obj.flowPart94 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.flowLayout27);
    obj.flowPart94:setMargins({bottom=5, right=2});
    obj.flowPart94:setMinWidth(15);
    obj.flowPart94:setMaxWidth(15);
    obj.flowPart94:setName("flowPart94");
    obj.flowPart94:setHeight(25);

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart94);
    obj.edit43:setTransparent(false);
    obj.edit43:setWidth(15);
    obj.edit43:setHeight(20);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setField("10_");
    obj.edit43:setName("edit43");
    obj.edit43:setFontSize(14);
    obj.edit43:setFontColor("#cdcdcd");
    obj.edit43:setTextTrimming("character");
    obj.edit43:setFontFamily("Constantia");

    obj.flowPart95 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.flowLayout27);
    obj.flowPart95:setMargins({bottom=5, right=2});
    obj.flowPart95:setMinWidth(15);
    obj.flowPart95:setMaxWidth(15);
    obj.flowPart95:setName("flowPart95");
    obj.flowPart95:setHeight(25);

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart95);
    obj.edit44:setTransparent(false);
    obj.edit44:setWidth(15);
    obj.edit44:setHeight(20);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setField("11_");
    obj.edit44:setName("edit44");
    obj.edit44:setFontSize(14);
    obj.edit44:setFontColor("#cdcdcd");
    obj.edit44:setTextTrimming("character");
    obj.edit44:setFontFamily("Constantia");

    obj.flowPart96 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.flowLayout27);
    obj.flowPart96:setMargins({bottom=5, right=2});
    obj.flowPart96:setMinWidth(15);
    obj.flowPart96:setMaxWidth(15);
    obj.flowPart96:setName("flowPart96");
    obj.flowPart96:setHeight(25);

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart96);
    obj.edit45:setTransparent(false);
    obj.edit45:setWidth(15);
    obj.edit45:setHeight(20);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setField("12_");
    obj.edit45:setName("edit45");
    obj.edit45:setFontSize(14);
    obj.edit45:setFontColor("#cdcdcd");
    obj.edit45:setTextTrimming("character");
    obj.edit45:setFontFamily("Constantia");

    obj.flowPart97 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.flowLayout23);
    obj.flowPart97:setHeight(120);
    obj.flowPart97:setMinWidth(270);
    obj.flowPart97:setMaxWidth(270);
    obj.flowPart97:setMargins({bottom=20, left=10, right=10});
    obj.flowPart97:setName("flowPart97");

    obj.flowLayout28 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout28:setParent(obj.flowPart97);
    obj.flowLayout28:setMaxControlsPerLine(1);
    obj.flowLayout28:setWidth(270);
    obj.flowLayout28:setAutoHeight(true);
    obj.flowLayout28:setName("flowLayout28");

    obj.flowLayout29 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout29:setParent(obj.flowLayout28);
    obj.flowLayout29:setOrientation("vertical");
    obj.flowLayout29:setAlign("top");
    obj.flowLayout29:setWidth(270);
    obj.flowLayout29:setAutoHeight(true);
    obj.flowLayout29:setMaxColumns(1);
    obj.flowLayout29:setName("flowLayout29");

    obj.flowPart98 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.flowLayout29);
    obj.flowPart98:setAlign("top");
    obj.flowPart98:setHeight(15);
    obj.flowPart98:setMargins({bottom=15});
    obj.flowPart98:setName("flowPart98");
    obj.flowPart98:setMinWidth(220);
    obj.flowPart98:setMaxWidth(220);

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart98);
    obj.label35:setFontSize(13);
    obj.label35:setText("W I L L P O W E R");
    obj.label35:setName("label35");
    obj.label35:setFontColor("white");
    obj.label35:setTextTrimming("character");
    obj.label35:setFontFamily("Constantia");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setAlign("top");
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");

    obj.flowLayout30 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout30:setParent(obj.flowLayout28);
    obj.flowLayout30:setOrientation("vertical");
    obj.flowLayout30:setAlign("top");
    obj.flowLayout30:setHorzAlign("center");
    obj.flowLayout30:setWidth(220);
    obj.flowLayout30:setAutoHeight(true);
    obj.flowLayout30:setMaxColumns(1);
    obj.flowLayout30:setName("flowLayout30");

    obj.flowPart99 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.flowLayout30);
    obj.flowPart99:setAlign("top");
    obj.flowPart99:setMinWidth(100);
    obj.flowPart99:setMaxWidth(100);
    obj.flowPart99:setHeight(25);
    obj.flowPart99:setMargins({right=20, bottom=5});
    obj.flowPart99:setName("flowPart99");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.flowPart99);
    obj.progressBar1:setColor("lightblue");
    obj.progressBar1:setField("fldatual_Willpower");
    obj.progressBar1:setMin(0);
    obj.progressBar1:setAlign("top");
    obj.progressBar1:setWidth(100);
    obj.progressBar1:setFieldMax("fldtotal_Willpower");
    obj.progressBar1:setName("progressBar1");

    obj.flowLayout31 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout31:setParent(obj.flowLayout28);
    obj.flowLayout31:setOrientation("vertical");
    obj.flowLayout31:setAlign("top");
    obj.flowLayout31:setHorzAlign("center");
    obj.flowLayout31:setWidth(270);
    obj.flowLayout31:setAutoHeight(true);
    obj.flowLayout31:setMaxControlsPerLine(1);
    obj.flowLayout31:setName("flowLayout31");

    obj.flowPart100 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.flowLayout31);
    obj.flowPart100:setHeight(25);
    obj.flowPart100:setMaxWidth(100);
    obj.flowPart100:setMinWidth(100);
    obj.flowPart100:setName("flowPart100");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart100);
    obj.label36:setAlign("left");
    obj.label36:setWidth(50);
    obj.label36:setMargins({top=5});
    obj.label36:setText("Atual: ");
    obj.label36:setName("label36");
    obj.label36:setFontSize(14);
    obj.label36:setFontColor("white");
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");
    obj.label36:setTextTrimming("character");
    obj.label36:setFontFamily("Constantia");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart100);
    obj.edit46:setAlign("left");
    obj.edit46:setType("float");
    obj.edit46:setTransparent(true);
    obj.edit46:setField("fldatual_Willpower");
    obj.edit46:setWidth(20);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");
    obj.edit46:setFontSize(14);
    obj.edit46:setFontColor("#cdcdcd");
    obj.edit46:setTextTrimming("character");
    obj.edit46:setFontFamily("Constantia");

    obj.flowPart101 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.flowLayout31);
    obj.flowPart101:setHeight(25);
    obj.flowPart101:setMaxWidth(100);
    obj.flowPart101:setMinWidth(100);
    obj.flowPart101:setName("flowPart101");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart101);
    obj.label37:setAlign("left");
    obj.label37:setWidth(50);
    obj.label37:setMargins({top=5});
    obj.label37:setText("Total: ");
    obj.label37:setName("label37");
    obj.label37:setFontSize(14);
    obj.label37:setFontColor("white");
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setTextTrimming("character");
    obj.label37:setFontFamily("Constantia");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart101);
    obj.edit47:setAlign("left");
    obj.edit47:setType("float");
    obj.edit47:setTransparent(true);
    obj.edit47:setField("fldtotal_Willpower");
    obj.edit47:setWidth(20);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");
    obj.edit47:setFontSize(14);
    obj.edit47:setFontColor("#cdcdcd");
    obj.edit47:setTextTrimming("character");
    obj.edit47:setFontFamily("Constantia");

    obj.flowPart102 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart102:setParent(obj.flowLayout23);
    obj.flowPart102:setHeight(120);
    obj.flowPart102:setMinWidth(270);
    obj.flowPart102:setMaxWidth(270);
    obj.flowPart102:setMargins({bottom=20, left=10, right=10});
    obj.flowPart102:setName("flowPart102");

    obj.flowLayout32 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout32:setParent(obj.flowPart102);
    obj.flowLayout32:setMaxControlsPerLine(1);
    obj.flowLayout32:setWidth(270);
    obj.flowLayout32:setAutoHeight(true);
    obj.flowLayout32:setName("flowLayout32");

    obj.flowLayout33 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout33:setParent(obj.flowLayout32);
    obj.flowLayout33:setOrientation("vertical");
    obj.flowLayout33:setAlign("top");
    obj.flowLayout33:setWidth(270);
    obj.flowLayout33:setAutoHeight(true);
    obj.flowLayout33:setMaxColumns(1);
    obj.flowLayout33:setName("flowLayout33");

    obj.flowPart103 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart103:setParent(obj.flowLayout33);
    obj.flowPart103:setAlign("top");
    obj.flowPart103:setHeight(15);
    obj.flowPart103:setMargins({bottom=15});
    obj.flowPart103:setName("flowPart103");
    obj.flowPart103:setMinWidth(220);
    obj.flowPart103:setMaxWidth(220);

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart103);
    obj.label38:setFontSize(13);
    obj.label38:setText("M A N A");
    obj.label38:setName("label38");
    obj.label38:setFontColor("white");
    obj.label38:setTextTrimming("character");
    obj.label38:setFontFamily("Constantia");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setAlign("top");
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");

    obj.flowLayout34 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout34:setParent(obj.flowLayout32);
    obj.flowLayout34:setOrientation("vertical");
    obj.flowLayout34:setAlign("top");
    obj.flowLayout34:setHorzAlign("center");
    obj.flowLayout34:setWidth(220);
    obj.flowLayout34:setAutoHeight(true);
    obj.flowLayout34:setMaxColumns(1);
    obj.flowLayout34:setName("flowLayout34");

    obj.flowPart104 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart104:setParent(obj.flowLayout34);
    obj.flowPart104:setAlign("top");
    obj.flowPart104:setMinWidth(100);
    obj.flowPart104:setMaxWidth(100);
    obj.flowPart104:setHeight(25);
    obj.flowPart104:setMargins({right=20, bottom=5});
    obj.flowPart104:setName("flowPart104");

    obj.progressBar2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.flowPart104);
    obj.progressBar2:setColor("skyblue");
    obj.progressBar2:setField("fldatual_Mana");
    obj.progressBar2:setMin(0);
    obj.progressBar2:setAlign("top");
    obj.progressBar2:setWidth(100);
    obj.progressBar2:setFieldMax("fldtotal_Mana");
    obj.progressBar2:setName("progressBar2");

    obj.flowLayout35 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout35:setParent(obj.flowLayout32);
    obj.flowLayout35:setOrientation("vertical");
    obj.flowLayout35:setAlign("top");
    obj.flowLayout35:setHorzAlign("center");
    obj.flowLayout35:setWidth(270);
    obj.flowLayout35:setAutoHeight(true);
    obj.flowLayout35:setMaxControlsPerLine(1);
    obj.flowLayout35:setName("flowLayout35");

    obj.flowPart105 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart105:setParent(obj.flowLayout35);
    obj.flowPart105:setHeight(25);
    obj.flowPart105:setMaxWidth(100);
    obj.flowPart105:setMinWidth(100);
    obj.flowPart105:setName("flowPart105");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart105);
    obj.label39:setAlign("left");
    obj.label39:setWidth(50);
    obj.label39:setMargins({top=5});
    obj.label39:setText("Atual: ");
    obj.label39:setName("label39");
    obj.label39:setFontSize(14);
    obj.label39:setFontColor("white");
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setTextTrimming("character");
    obj.label39:setFontFamily("Constantia");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart105);
    obj.edit48:setAlign("left");
    obj.edit48:setType("float");
    obj.edit48:setTransparent(true);
    obj.edit48:setField("fldatual_Mana");
    obj.edit48:setWidth(20);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");
    obj.edit48:setFontSize(14);
    obj.edit48:setFontColor("#cdcdcd");
    obj.edit48:setTextTrimming("character");
    obj.edit48:setFontFamily("Constantia");

    obj.flowPart106 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart106:setParent(obj.flowLayout35);
    obj.flowPart106:setHeight(25);
    obj.flowPart106:setMaxWidth(100);
    obj.flowPart106:setMinWidth(100);
    obj.flowPart106:setName("flowPart106");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart106);
    obj.label40:setAlign("left");
    obj.label40:setWidth(50);
    obj.label40:setMargins({top=5});
    obj.label40:setText("Total: ");
    obj.label40:setName("label40");
    obj.label40:setFontSize(14);
    obj.label40:setFontColor("white");
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setTextTrimming("character");
    obj.label40:setFontFamily("Constantia");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart106);
    obj.edit49:setAlign("left");
    obj.edit49:setType("float");
    obj.edit49:setTransparent(true);
    obj.edit49:setField("fldtotal_Mana");
    obj.edit49:setWidth(20);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");
    obj.edit49:setFontSize(14);
    obj.edit49:setFontColor("#cdcdcd");
    obj.edit49:setTextTrimming("character");
    obj.edit49:setFontFamily("Constantia");

    obj.flowLayout36 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout36:setParent(obj.layVerso);
    obj.flowLayout36:setHeight(25);
    obj.flowLayout36:setMargins();
    obj.flowLayout36:setName("flowLayout36");
    obj.flowLayout36:setAlign("top");
    obj.flowLayout36:setOrientation("horizontal");
    obj.flowLayout36:setHorzAlign("center");
    obj.flowLayout36:setAutoHeight(true);
    obj.flowLayout36:setMaxControlsPerLine(3);

    obj.flowPart107 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart107:setParent(obj.flowLayout36);
    obj.flowPart107:setHeight(25);
    obj.flowPart107:setMinWidth(400);
    obj.flowPart107:setMaxWidth(1000);
    obj.flowPart107:setMargins();
    obj.flowPart107:setName("flowPart107");

    obj.flowLayout37 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout37:setParent(obj.flowPart107);
    obj.flowLayout37:setAutoHeight(false);
    obj.flowLayout37:setHeight(25);
    obj.flowLayout37:setMargins();
    obj.flowLayout37:setName("flowLayout37");
    obj.flowLayout37:setAlign("top");
    obj.flowLayout37:setOrientation("horizontal");
    obj.flowLayout37:setHorzAlign("center");
    obj.flowLayout37:setMaxControlsPerLine(3);

    obj.flowPart108 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart108:setParent(obj.flowLayout37);
    obj.flowPart108:setHeight(25);
    obj.flowPart108:setMinWidth(0);
    obj.flowPart108:setMaxWidth(355);
    obj.flowPart108:setWidth(355);
    obj.flowPart108:setName("flowPart108");

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.flowPart108);
    obj.horzLine7:setName("horzLine7");
    obj.horzLine7:setStrokeColor("#424242");
    obj.horzLine7:setMargins({top=7});
    obj.horzLine7:setAlign("top");

    obj.flowPart109 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart109:setParent(obj.flowLayout37);
    obj.flowPart109:setHeight(25);
    obj.flowPart109:setWidth(110);
    obj.flowPart109:setName("flowPart109");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart109);
    obj.label41:setText("L I N H A S");
    obj.label41:setName("label41");
    obj.label41:setFontSize(20);
    obj.label41:setFontColor("white");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setTextTrimming("character");
    obj.label41:setFontFamily("Constantia");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setAutoSize(true);
    obj.label41:setAlign("client");
    obj.label41:setMargins({bottom=7});

    obj.flowPart110 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart110:setParent(obj.flowLayout37);
    obj.flowPart110:setHeight(25);
    obj.flowPart110:setMinWidth(0);
    obj.flowPart110:setMaxWidth(355);
    obj.flowPart110:setWidth(355);
    obj.flowPart110:setName("flowPart110");

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.flowPart110);
    obj.horzLine8:setName("horzLine8");
    obj.horzLine8:setStrokeColor("#424242");
    obj.horzLine8:setMargins({top=7});
    obj.horzLine8:setAlign("top");

    obj.flowLayout38 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout38:setParent(obj.layVerso);
    obj.flowLayout38:setMargins({left=20, top=25, bottom=30, right=20});
    obj.flowLayout38:setName("flowLayout38");
    obj.flowLayout38:setAlign("top");
    obj.flowLayout38:setOrientation("vertical");
    obj.flowLayout38:setHorzAlign("center");
    obj.flowLayout38:setAutoHeight(true);
    obj.flowLayout38:setMaxControlsPerLine(1);

    obj.flowPart111 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart111:setParent(obj.flowLayout38);
    obj.flowPart111:setName("flowPart111");
    obj.flowPart111:setMinWidth(220);
    obj.flowPart111:setMaxWidth(220);
    obj.flowPart111:setHeight(25);
    obj.flowPart111:setMargins({left=20, right=20, bottom=10});

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart111);
    obj.label42:setAlign("left");
    obj.label42:setWidth(35);
    obj.label42:setText("Size: ");
    obj.label42:setName("label42");
    obj.label42:setFontSize(14);
    obj.label42:setFontColor("white");
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");
    obj.label42:setTextTrimming("character");
    obj.label42:setFontFamily("Constantia");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart111);
    obj.edit50:setAlign("client");
    obj.edit50:setField("fldSize");
    obj.edit50:setName("edit50");
    obj.edit50:setFontSize(14);
    obj.edit50:setFontColor("#cdcdcd");
    obj.edit50:setTextTrimming("character");
    obj.edit50:setFontFamily("Constantia");
    obj.edit50:setTransparent(true);

    obj.flowPart112 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart112:setParent(obj.flowLayout38);
    obj.flowPart112:setName("flowPart112");
    obj.flowPart112:setMinWidth(220);
    obj.flowPart112:setMaxWidth(220);
    obj.flowPart112:setHeight(25);
    obj.flowPart112:setMargins({left=20, right=20, bottom=10});

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowPart112);
    obj.label43:setAlign("left");
    obj.label43:setWidth(50);
    obj.label43:setText("Speed: ");
    obj.label43:setName("label43");
    obj.label43:setFontSize(14);
    obj.label43:setFontColor("white");
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setTextTrimming("character");
    obj.label43:setFontFamily("Constantia");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart112);
    obj.edit51:setAlign("client");
    obj.edit51:setField("fldSpeed");
    obj.edit51:setName("edit51");
    obj.edit51:setFontSize(14);
    obj.edit51:setFontColor("#cdcdcd");
    obj.edit51:setTextTrimming("character");
    obj.edit51:setFontFamily("Constantia");
    obj.edit51:setTransparent(true);

    obj.flowPart113 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart113:setParent(obj.flowLayout38);
    obj.flowPart113:setName("flowPart113");
    obj.flowPart113:setMinWidth(220);
    obj.flowPart113:setMaxWidth(220);
    obj.flowPart113:setHeight(25);
    obj.flowPart113:setMargins({left=20, right=20, bottom=10});

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart113);
    obj.label44:setAlign("left");
    obj.label44:setWidth(65);
    obj.label44:setText("Defense: ");
    obj.label44:setName("label44");
    obj.label44:setFontSize(14);
    obj.label44:setFontColor("white");
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setTextTrimming("character");
    obj.label44:setFontFamily("Constantia");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart113);
    obj.edit52:setAlign("client");
    obj.edit52:setField("fldDefense");
    obj.edit52:setName("edit52");
    obj.edit52:setFontSize(14);
    obj.edit52:setFontColor("#cdcdcd");
    obj.edit52:setTextTrimming("character");
    obj.edit52:setFontFamily("Constantia");
    obj.edit52:setTransparent(true);

    obj.flowPart114 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart114:setParent(obj.flowLayout38);
    obj.flowPart114:setName("flowPart114");
    obj.flowPart114:setMinWidth(220);
    obj.flowPart114:setMaxWidth(220);
    obj.flowPart114:setHeight(25);
    obj.flowPart114:setMargins({left=20, right=20, bottom=10});

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart114);
    obj.label45:setAlign("left");
    obj.label45:setWidth(50);
    obj.label45:setText("Armor: ");
    obj.label45:setName("label45");
    obj.label45:setFontSize(14);
    obj.label45:setFontColor("white");
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setTextTrimming("character");
    obj.label45:setFontFamily("Constantia");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart114);
    obj.edit53:setAlign("client");
    obj.edit53:setField("fldArmor");
    obj.edit53:setName("edit53");
    obj.edit53:setFontSize(14);
    obj.edit53:setFontColor("#cdcdcd");
    obj.edit53:setTextTrimming("character");
    obj.edit53:setFontFamily("Constantia");
    obj.edit53:setTransparent(true);

    obj.flowPart115 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart115:setParent(obj.flowLayout38);
    obj.flowPart115:setName("flowPart115");
    obj.flowPart115:setMinWidth(220);
    obj.flowPart115:setMaxWidth(220);
    obj.flowPart115:setHeight(25);
    obj.flowPart115:setMargins({left=20, right=20, bottom=10});

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart115);
    obj.label46:setAlign("left");
    obj.label46:setWidth(70);
    obj.label46:setText("Initiative: ");
    obj.label46:setName("label46");
    obj.label46:setFontSize(14);
    obj.label46:setFontColor("white");
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");
    obj.label46:setTextTrimming("character");
    obj.label46:setFontFamily("Constantia");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart115);
    obj.edit54:setAlign("client");
    obj.edit54:setField("fldInitiative");
    obj.edit54:setName("edit54");
    obj.edit54:setFontSize(14);
    obj.edit54:setFontColor("#cdcdcd");
    obj.edit54:setTextTrimming("character");
    obj.edit54:setFontFamily("Constantia");
    obj.edit54:setTransparent(true);

    obj.flowPart116 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart116:setParent(obj.flowLayout38);
    obj.flowPart116:setName("flowPart116");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart116);
    obj.label47:setField(" ");
    obj.label47:setName("label47");
    obj.label47:setFontSize(14);
    obj.label47:setFontColor("white");
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setTextTrimming("character");
    obj.label47:setFontFamily("Constantia");

    obj.flowPart117 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart117:setParent(obj.flowLayout38);
    obj.flowPart117:setName("flowPart117");
    obj.flowPart117:setMinWidth(220);
    obj.flowPart117:setMaxWidth(220);
    obj.flowPart117:setHeight(25);
    obj.flowPart117:setMargins({left=20, right=20, bottom=10});

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart117);
    obj.label48:setAlign("left");
    obj.label48:setWidth(45);
    obj.label48:setText("Beats: ");
    obj.label48:setName("label48");
    obj.label48:setFontSize(14);
    obj.label48:setFontColor("white");
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");
    obj.label48:setTextTrimming("character");
    obj.label48:setFontFamily("Constantia");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart117);
    obj.edit55:setAlign("client");
    obj.edit55:setField("fldBeats");
    obj.edit55:setName("edit55");
    obj.edit55:setFontSize(14);
    obj.edit55:setFontColor("#cdcdcd");
    obj.edit55:setTextTrimming("character");
    obj.edit55:setFontFamily("Constantia");
    obj.edit55:setTransparent(true);

    obj.flowPart118 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart118:setParent(obj.flowLayout38);
    obj.flowPart118:setName("flowPart118");
    obj.flowPart118:setMinWidth(220);
    obj.flowPart118:setMaxWidth(220);
    obj.flowPart118:setHeight(25);
    obj.flowPart118:setMargins({left=20, right=20, bottom=10});

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart118);
    obj.label49:setAlign("left");
    obj.label49:setWidth(95);
    obj.label49:setText("Arcane Beats: ");
    obj.label49:setName("label49");
    obj.label49:setFontSize(14);
    obj.label49:setFontColor("white");
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");
    obj.label49:setTextTrimming("character");
    obj.label49:setFontFamily("Constantia");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart118);
    obj.edit56:setAlign("client");
    obj.edit56:setField("fldArcaneBeats");
    obj.edit56:setName("edit56");
    obj.edit56:setFontSize(14);
    obj.edit56:setFontColor("#cdcdcd");
    obj.edit56:setTextTrimming("character");
    obj.edit56:setFontFamily("Constantia");
    obj.edit56:setTransparent(true);

    obj.flowLayout39 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout39:setParent(obj.layVerso);
    obj.flowLayout39:setHeight(25);
    obj.flowLayout39:setMargins();
    obj.flowLayout39:setName("flowLayout39");
    obj.flowLayout39:setAlign("top");
    obj.flowLayout39:setOrientation("horizontal");
    obj.flowLayout39:setHorzAlign("center");
    obj.flowLayout39:setAutoHeight(true);
    obj.flowLayout39:setMaxControlsPerLine(3);

    obj.flowPart119 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart119:setParent(obj.flowLayout39);
    obj.flowPart119:setHeight(25);
    obj.flowPart119:setMinWidth(400);
    obj.flowPart119:setMaxWidth(1000);
    obj.flowPart119:setMargins();
    obj.flowPart119:setName("flowPart119");

    obj.flowLayout40 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout40:setParent(obj.flowPart119);
    obj.flowLayout40:setAutoHeight(false);
    obj.flowLayout40:setHeight(25);
    obj.flowLayout40:setMargins();
    obj.flowLayout40:setName("flowLayout40");
    obj.flowLayout40:setAlign("top");
    obj.flowLayout40:setOrientation("horizontal");
    obj.flowLayout40:setHorzAlign("center");
    obj.flowLayout40:setMaxControlsPerLine(3);

    obj.flowPart120 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart120:setParent(obj.flowLayout40);
    obj.flowPart120:setHeight(25);
    obj.flowPart120:setMinWidth(0);
    obj.flowPart120:setMaxWidth(305);
    obj.flowPart120:setWidth(305);
    obj.flowPart120:setName("flowPart120");

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.flowPart120);
    obj.horzLine9:setName("horzLine9");
    obj.horzLine9:setStrokeColor("#424242");
    obj.horzLine9:setMargins({top=7});
    obj.horzLine9:setAlign("top");

    obj.flowPart121 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart121:setParent(obj.flowLayout40);
    obj.flowPart121:setHeight(25);
    obj.flowPart121:setWidth(210);
    obj.flowPart121:setName("flowPart121");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart121);
    obj.label50:setText("D E S C R I T I V O S");
    obj.label50:setName("label50");
    obj.label50:setFontSize(20);
    obj.label50:setFontColor("white");
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setTextTrimming("character");
    obj.label50:setFontFamily("Constantia");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setAutoSize(true);
    obj.label50:setAlign("client");
    obj.label50:setMargins({bottom=7});

    obj.flowPart122 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart122:setParent(obj.flowLayout40);
    obj.flowPart122:setHeight(25);
    obj.flowPart122:setMinWidth(0);
    obj.flowPart122:setMaxWidth(305);
    obj.flowPart122:setWidth(305);
    obj.flowPart122:setName("flowPart122");

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.flowPart122);
    obj.horzLine10:setName("horzLine10");
    obj.horzLine10:setStrokeColor("#424242");
    obj.horzLine10:setMargins({top=7});
    obj.horzLine10:setAlign("top");

    obj.flowLayout41 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout41:setParent(obj.layVerso);
    obj.flowLayout41:setName("flowLayout41");
    obj.flowLayout41:setAlign("top");
    obj.flowLayout41:setOrientation("horizontal");
    obj.flowLayout41:setHorzAlign("center");
    obj.flowLayout41:setAutoHeight(true);
    obj.flowLayout41:setMaxControlsPerLine(4);
    obj.flowLayout41:setMargins({left=20, top=20, bottom=30, right=20});

    obj.flowPart123 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart123:setParent(obj.flowLayout41);
    obj.flowPart123:setHeight(120);
    obj.flowPart123:setWidth(180);
    obj.flowPart123:setMargins({bottom=20, left=0, right=20});
    obj.flowPart123:setName("flowPart123");
    obj.flowPart123:setMinWidth(180);
    obj.flowPart123:setMaxWidth(180);

    obj.flowLayout42 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout42:setParent(obj.flowPart123);
    obj.flowLayout42:setOrientation("vertical");
    obj.flowLayout42:setWidth(180);
    obj.flowLayout42:setAutoHeight(true);
    obj.flowLayout42:setMaxColumns(1);
    obj.flowLayout42:setName("flowLayout42");

    obj.flowPart124 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart124:setParent(obj.flowLayout42);
    obj.flowPart124:setHeight(15);
    obj.flowPart124:setMargins({bottom=5});
    obj.flowPart124:setName("flowPart124");
    obj.flowPart124:setMinWidth(180);
    obj.flowPart124:setMaxWidth(180);

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart124);
    obj.label51:setFontSize(12);
    obj.label51:setText("T I L T S");
    obj.label51:setName("label51");
    obj.label51:setFontColor("white");
    obj.label51:setTextTrimming("character");
    obj.label51:setFontFamily("Constantia");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setAlign("top");
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");

    obj.flowPart125 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart125:setParent(obj.flowLayout42);
    obj.flowPart125:setHeight(100);
    obj.flowPart125:setMargins({bottom=5});
    obj.flowPart125:setName("flowPart125");
    obj.flowPart125:setMinWidth(180);
    obj.flowPart125:setMaxWidth(180);

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.flowPart125);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setTransparent(false);
    obj.textEditor1:setField("texteditorT I L T S");
    obj.textEditor1:setName("textEditor1");

    obj.flowPart126 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart126:setParent(obj.flowLayout41);
    obj.flowPart126:setHeight(120);
    obj.flowPart126:setWidth(180);
    obj.flowPart126:setMargins({bottom=20, left=0, right=20});
    obj.flowPart126:setName("flowPart126");
    obj.flowPart126:setMinWidth(180);
    obj.flowPart126:setMaxWidth(180);

    obj.flowLayout43 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout43:setParent(obj.flowPart126);
    obj.flowLayout43:setOrientation("vertical");
    obj.flowLayout43:setWidth(180);
    obj.flowLayout43:setAutoHeight(true);
    obj.flowLayout43:setMaxColumns(1);
    obj.flowLayout43:setName("flowLayout43");

    obj.flowPart127 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart127:setParent(obj.flowLayout43);
    obj.flowPart127:setHeight(15);
    obj.flowPart127:setMargins({bottom=5});
    obj.flowPart127:setName("flowPart127");
    obj.flowPart127:setMinWidth(180);
    obj.flowPart127:setMaxWidth(180);

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart127);
    obj.label52:setFontSize(12);
    obj.label52:setText("C O N D I T I O N S");
    obj.label52:setName("label52");
    obj.label52:setFontColor("white");
    obj.label52:setTextTrimming("character");
    obj.label52:setFontFamily("Constantia");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setAlign("top");
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");

    obj.flowPart128 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart128:setParent(obj.flowLayout43);
    obj.flowPart128:setHeight(100);
    obj.flowPart128:setMargins({bottom=5});
    obj.flowPart128:setName("flowPart128");
    obj.flowPart128:setMinWidth(180);
    obj.flowPart128:setMaxWidth(180);

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.flowPart128);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setTransparent(false);
    obj.textEditor2:setField("texteditorC O N D I T I O N S");
    obj.textEditor2:setName("textEditor2");

    obj.flowPart129 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart129:setParent(obj.flowLayout41);
    obj.flowPart129:setHeight(120);
    obj.flowPart129:setWidth(180);
    obj.flowPart129:setMargins({bottom=20, left=0, right=20});
    obj.flowPart129:setName("flowPart129");
    obj.flowPart129:setMinWidth(180);
    obj.flowPart129:setMaxWidth(180);

    obj.flowLayout44 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout44:setParent(obj.flowPart129);
    obj.flowLayout44:setOrientation("vertical");
    obj.flowLayout44:setWidth(180);
    obj.flowLayout44:setAutoHeight(true);
    obj.flowLayout44:setMaxColumns(1);
    obj.flowLayout44:setName("flowLayout44");

    obj.flowPart130 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart130:setParent(obj.flowLayout44);
    obj.flowPart130:setHeight(15);
    obj.flowPart130:setMargins({bottom=5});
    obj.flowPart130:setName("flowPart130");
    obj.flowPart130:setMinWidth(180);
    obj.flowPart130:setMaxWidth(180);

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowPart130);
    obj.label53:setFontSize(12);
    obj.label53:setText("O B S E S S I O N S");
    obj.label53:setName("label53");
    obj.label53:setFontColor("white");
    obj.label53:setTextTrimming("character");
    obj.label53:setFontFamily("Constantia");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setAlign("top");
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");

    obj.flowPart131 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart131:setParent(obj.flowLayout44);
    obj.flowPart131:setHeight(100);
    obj.flowPart131:setMargins({bottom=5});
    obj.flowPart131:setName("flowPart131");
    obj.flowPart131:setMinWidth(180);
    obj.flowPart131:setMaxWidth(180);

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.flowPart131);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setTransparent(false);
    obj.textEditor3:setField("texteditorO B S E S S I O N S");
    obj.textEditor3:setName("textEditor3");

    obj.flowPart132 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart132:setParent(obj.flowLayout41);
    obj.flowPart132:setHeight(120);
    obj.flowPart132:setWidth(180);
    obj.flowPart132:setMargins({bottom=20, left=0, right=20});
    obj.flowPart132:setName("flowPart132");
    obj.flowPart132:setMinWidth(180);
    obj.flowPart132:setMaxWidth(180);

    obj.flowLayout45 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout45:setParent(obj.flowPart132);
    obj.flowLayout45:setOrientation("vertical");
    obj.flowLayout45:setWidth(180);
    obj.flowLayout45:setAutoHeight(true);
    obj.flowLayout45:setMaxColumns(1);
    obj.flowLayout45:setName("flowLayout45");

    obj.flowPart133 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart133:setParent(obj.flowLayout45);
    obj.flowPart133:setHeight(15);
    obj.flowPart133:setMargins({bottom=5});
    obj.flowPart133:setName("flowPart133");
    obj.flowPart133:setMinWidth(180);
    obj.flowPart133:setMaxWidth(180);

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowPart133);
    obj.label54:setFontSize(12);
    obj.label54:setText("A S P I R A T I O N S");
    obj.label54:setName("label54");
    obj.label54:setFontColor("white");
    obj.label54:setTextTrimming("character");
    obj.label54:setFontFamily("Constantia");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setAlign("top");
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");

    obj.flowPart134 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart134:setParent(obj.flowLayout45);
    obj.flowPart134:setHeight(100);
    obj.flowPart134:setMargins({bottom=5});
    obj.flowPart134:setName("flowPart134");
    obj.flowPart134:setMinWidth(180);
    obj.flowPart134:setMaxWidth(180);

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.flowPart134);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setTransparent(false);
    obj.textEditor4:setField("texteditorA S P I R A T I O N S");
    obj.textEditor4:setName("textEditor4");

    obj.flowLayout46 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout46:setParent(obj.layVerso);
    obj.flowLayout46:setHeight(25);
    obj.flowLayout46:setMargins();
    obj.flowLayout46:setName("flowLayout46");
    obj.flowLayout46:setAlign("top");
    obj.flowLayout46:setOrientation("horizontal");
    obj.flowLayout46:setHorzAlign("center");
    obj.flowLayout46:setAutoHeight(true);
    obj.flowLayout46:setMaxControlsPerLine(3);

    obj.flowPart135 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart135:setParent(obj.flowLayout46);
    obj.flowPart135:setHeight(25);
    obj.flowPart135:setMinWidth(400);
    obj.flowPart135:setMaxWidth(1000);
    obj.flowPart135:setMargins();
    obj.flowPart135:setName("flowPart135");

    obj.flowLayout47 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout47:setParent(obj.flowPart135);
    obj.flowLayout47:setAutoHeight(false);
    obj.flowLayout47:setHeight(25);
    obj.flowLayout47:setMargins();
    obj.flowLayout47:setName("flowLayout47");
    obj.flowLayout47:setAlign("top");
    obj.flowLayout47:setOrientation("horizontal");
    obj.flowLayout47:setHorzAlign("center");
    obj.flowLayout47:setMaxControlsPerLine(3);

    obj.flowPart136 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart136:setParent(obj.flowLayout47);
    obj.flowPart136:setHeight(25);
    obj.flowPart136:setMinWidth(0);
    obj.flowPart136:setMaxWidth(350);
    obj.flowPart136:setWidth(350);
    obj.flowPart136:setName("flowPart136");

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.flowPart136);
    obj.horzLine11:setName("horzLine11");
    obj.horzLine11:setStrokeColor("#424242");
    obj.horzLine11:setMargins({top=7});
    obj.horzLine11:setAlign("top");

    obj.flowPart137 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart137:setParent(obj.flowLayout47);
    obj.flowPart137:setHeight(25);
    obj.flowPart137:setWidth(120);
    obj.flowPart137:setName("flowPart137");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart137);
    obj.label55:setText("A R M A S");
    obj.label55:setName("label55");
    obj.label55:setFontSize(20);
    obj.label55:setFontColor("white");
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setTextTrimming("character");
    obj.label55:setFontFamily("Constantia");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setAutoSize(true);
    obj.label55:setAlign("client");
    obj.label55:setMargins({bottom=7});

    obj.flowPart138 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart138:setParent(obj.flowLayout47);
    obj.flowPart138:setHeight(25);
    obj.flowPart138:setMinWidth(0);
    obj.flowPart138:setMaxWidth(350);
    obj.flowPart138:setWidth(350);
    obj.flowPart138:setName("flowPart138");

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.flowPart138);
    obj.horzLine12:setName("horzLine12");
    obj.horzLine12:setStrokeColor("#424242");
    obj.horzLine12:setMargins({top=7});
    obj.horzLine12:setAlign("top");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layVerso);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(30);
    obj.layout38:setName("layout38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setAlign("right");
    obj.layout39:setWidth(25);
    obj.layout39:setMargins({right=80});
    obj.layout39:setName("layout39");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout39);
    obj.button1:setHeight(25);
    obj.button1:setText("🞦");
    obj.button1:setWidth(25);
    obj.button1:setHint("Nova Arma");
    obj.button1:setName("button1");

    obj.flowLayout48 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout48:setParent(obj.layVerso);
    obj.flowLayout48:setAlign("top");
    obj.flowLayout48:setAutoHeight(true);
    obj.flowLayout48:setMargins({left=30, top=0, bottom=30, right=20});
    obj.flowLayout48:setName("flowLayout48");
    obj.flowLayout48:setOrientation("horizontal");
    obj.flowLayout48:setHorzAlign("center");
    obj.flowLayout48:setMaxControlsPerLine(3);

    obj.rclArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmas:setParent(obj.flowLayout48);
    obj.rclArmas:setWidth(800);
    lfm_setPropAsString(obj.rclArmas, "anchors",  "top");
    obj.rclArmas:setMargins({left=20});
    obj.rclArmas:setMinQt(1);
    obj.rclArmas:setLayout("horizontalTiles");
    obj.rclArmas:setName("rclArmas");
    obj.rclArmas:setField("fldArmas");
    obj.rclArmas:setTemplateForm("armas");
    obj.rclArmas:setHeight(460);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Magias");
    obj.tab3:setName("tab3");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.tab3);
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#272727");
    obj.rectangle5:setXradius(20);
    obj.rectangle5:setYradius(20);
    obj.rectangle5:setCornerType("bevel");
    obj.rectangle5:setMargins({top=10, right=10, bottom=10, left=10});

    obj.layMagias = GUI.fromHandle(_obj_newObject("layout"));
    obj.layMagias:setParent(obj.rectangle5);
    obj.layMagias:setName("layMagias");
    obj.layMagias:setAlign("client");

    obj.flowLayout49 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout49:setParent(obj.layMagias);
    obj.flowLayout49:setHeight(25);
    obj.flowLayout49:setMargins({top=20});
    obj.flowLayout49:setName("flowLayout49");
    obj.flowLayout49:setAlign("top");
    obj.flowLayout49:setOrientation("horizontal");
    obj.flowLayout49:setHorzAlign("center");
    obj.flowLayout49:setAutoHeight(true);
    obj.flowLayout49:setMaxControlsPerLine(3);

    obj.flowPart139 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart139:setParent(obj.flowLayout49);
    obj.flowPart139:setHeight(25);
    obj.flowPart139:setMinWidth(400);
    obj.flowPart139:setMaxWidth(1000);
    obj.flowPart139:setMargins();
    obj.flowPart139:setName("flowPart139");

    obj.flowLayout50 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout50:setParent(obj.flowPart139);
    obj.flowLayout50:setAutoHeight(false);
    obj.flowLayout50:setHeight(25);
    obj.flowLayout50:setMargins();
    obj.flowLayout50:setName("flowLayout50");
    obj.flowLayout50:setAlign("top");
    obj.flowLayout50:setOrientation("horizontal");
    obj.flowLayout50:setHorzAlign("center");
    obj.flowLayout50:setMaxControlsPerLine(3);

    obj.flowPart140 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart140:setParent(obj.flowLayout50);
    obj.flowPart140:setHeight(25);
    obj.flowPart140:setMinWidth(0);
    obj.flowPart140:setMaxWidth(350);
    obj.flowPart140:setWidth(350);
    obj.flowPart140:setName("flowPart140");

    obj.horzLine13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.flowPart140);
    obj.horzLine13:setName("horzLine13");
    obj.horzLine13:setStrokeColor("#424242");
    obj.horzLine13:setMargins({top=7});
    obj.horzLine13:setAlign("top");

    obj.flowPart141 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart141:setParent(obj.flowLayout50);
    obj.flowPart141:setHeight(25);
    obj.flowPart141:setWidth(110);
    obj.flowPart141:setName("flowPart141");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowPart141);
    obj.label56:setText("S P E L L S");
    obj.label56:setName("label56");
    obj.label56:setFontSize(20);
    obj.label56:setFontColor("white");
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");
    obj.label56:setTextTrimming("character");
    obj.label56:setFontFamily("Constantia");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setAutoSize(true);
    obj.label56:setAlign("client");
    obj.label56:setMargins({bottom=7});

    obj.flowPart142 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart142:setParent(obj.flowLayout50);
    obj.flowPart142:setHeight(25);
    obj.flowPart142:setMinWidth(0);
    obj.flowPart142:setMaxWidth(350);
    obj.flowPart142:setWidth(350);
    obj.flowPart142:setName("flowPart142");

    obj.horzLine14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.flowPart142);
    obj.horzLine14:setName("horzLine14");
    obj.horzLine14:setStrokeColor("#424242");
    obj.horzLine14:setMargins({top=7});
    obj.horzLine14:setAlign("top");

    obj.flowLayout51 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout51:setParent(obj.layMagias);
    obj.flowLayout51:setMargins({left=20, top=25, bottom=30, right=20});
    obj.flowLayout51:setName("flowLayout51");
    obj.flowLayout51:setAlign("top");
    obj.flowLayout51:setOrientation("horizontal");
    obj.flowLayout51:setHorzAlign("center");
    obj.flowLayout51:setAutoHeight(true);
    obj.flowLayout51:setMaxControlsPerLine(3);

    obj.flowPart143 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart143:setParent(obj.flowLayout51);
    obj.flowPart143:setHeight(240);
    obj.flowPart143:setMinWidth(400);
    obj.flowPart143:setMaxWidth(400);
    obj.flowPart143:setMargins({bottom=10, left=10, right=10});
    obj.flowPart143:setName("flowPart143");

    obj.flowLayout52 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout52:setParent(obj.flowPart143);
    obj.flowLayout52:setOrientation("vertical");
    obj.flowLayout52:setWidth(400);
    obj.flowLayout52:setAutoHeight(true);
    obj.flowLayout52:setMaxColumns(1);
    obj.flowLayout52:setName("flowLayout52");

    obj.flowPart144 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart144:setParent(obj.flowLayout52);
    obj.flowPart144:setHeight(30);
    obj.flowPart144:setMinWidth(400);
    obj.flowPart144:setMaxWidth(400);
    obj.flowPart144:setName("flowPart144");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart144);
    obj.label57:setFontSize(13);
    obj.label57:setWidth(300);
    obj.label57:setAlign("top");
    obj.label57:setText("R O T E S");
    obj.label57:setName("label57");
    obj.label57:setFontColor("white");
    obj.label57:setTextTrimming("character");
    obj.label57:setFontFamily("Constantia");
    obj.label57:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label57, "fontStyle",  "bold");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowPart144);
    obj.button2:setHeight(25);
    obj.button2:setText("🞦");
    obj.button2:setWidth(25);
    obj.button2:setHint("Nova Magia");
    obj.button2:setName("button2");

    obj.horzLine15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.flowPart144);
    obj.horzLine15:setAlign("none");
    obj.horzLine15:setTop(27);
    obj.horzLine15:setWidth(375);
    obj.horzLine15:setName("horzLine15");
    obj.horzLine15:setStrokeColor("#424242");
    obj.horzLine15:setMargins({top=7});

    obj.flowPart145 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart145:setParent(obj.flowLayout52);
    obj.flowPart145:setMinWidth(400);
    obj.flowPart145:setMaxWidth(400);
    obj.flowPart145:setHeight(190);
    obj.flowPart145:setMargins({bottom=5});
    obj.flowPart145:setName("flowPart145");

    obj.rclrotes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclrotes:setParent(obj.flowPart145);
    obj.rclrotes:setHeight(180);
    obj.rclrotes:setAlign("top");
    obj.rclrotes:setMinQt(0);
    obj.rclrotes:setLayout("vertical");
    obj.rclrotes:setName("rclrotes");
    obj.rclrotes:setField("fldrotes");
    obj.rclrotes:setTemplateForm("spells");
    obj.rclrotes:setMargins({top=10});

    obj.flowPart146 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart146:setParent(obj.flowLayout51);
    obj.flowPart146:setHeight(240);
    obj.flowPart146:setMinWidth(400);
    obj.flowPart146:setMaxWidth(400);
    obj.flowPart146:setMargins({bottom=10, left=10, right=10});
    obj.flowPart146:setName("flowPart146");

    obj.flowLayout53 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout53:setParent(obj.flowPart146);
    obj.flowLayout53:setOrientation("vertical");
    obj.flowLayout53:setWidth(400);
    obj.flowLayout53:setAutoHeight(true);
    obj.flowLayout53:setMaxColumns(1);
    obj.flowLayout53:setName("flowLayout53");

    obj.flowPart147 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart147:setParent(obj.flowLayout53);
    obj.flowPart147:setHeight(30);
    obj.flowPart147:setMinWidth(400);
    obj.flowPart147:setMaxWidth(400);
    obj.flowPart147:setName("flowPart147");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart147);
    obj.label58:setFontSize(13);
    obj.label58:setWidth(300);
    obj.label58:setAlign("top");
    obj.label58:setText("P R A X I S");
    obj.label58:setName("label58");
    obj.label58:setFontColor("white");
    obj.label58:setTextTrimming("character");
    obj.label58:setFontFamily("Constantia");
    obj.label58:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label58, "fontStyle",  "bold");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowPart147);
    obj.button3:setHeight(25);
    obj.button3:setText("🞦");
    obj.button3:setWidth(25);
    obj.button3:setHint("Nova Magia");
    obj.button3:setName("button3");

    obj.horzLine16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.flowPart147);
    obj.horzLine16:setAlign("none");
    obj.horzLine16:setTop(27);
    obj.horzLine16:setWidth(375);
    obj.horzLine16:setName("horzLine16");
    obj.horzLine16:setStrokeColor("#424242");
    obj.horzLine16:setMargins({top=7});

    obj.flowPart148 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart148:setParent(obj.flowLayout53);
    obj.flowPart148:setMinWidth(400);
    obj.flowPart148:setMaxWidth(400);
    obj.flowPart148:setHeight(190);
    obj.flowPart148:setMargins({bottom=5});
    obj.flowPart148:setName("flowPart148");

    obj.rclpraxis = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclpraxis:setParent(obj.flowPart148);
    obj.rclpraxis:setHeight(180);
    obj.rclpraxis:setAlign("top");
    obj.rclpraxis:setMinQt(0);
    obj.rclpraxis:setLayout("vertical");
    obj.rclpraxis:setName("rclpraxis");
    obj.rclpraxis:setField("fldpraxis");
    obj.rclpraxis:setTemplateForm("spells");
    obj.rclpraxis:setMargins({top=10});

    obj.flowPart149 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart149:setParent(obj.flowLayout51);
    obj.flowPart149:setHeight(240);
    obj.flowPart149:setMinWidth(400);
    obj.flowPart149:setMaxWidth(400);
    obj.flowPart149:setMargins({bottom=10, left=10, right=10});
    obj.flowPart149:setName("flowPart149");

    obj.flowLayout54 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout54:setParent(obj.flowPart149);
    obj.flowLayout54:setOrientation("vertical");
    obj.flowLayout54:setWidth(400);
    obj.flowLayout54:setAutoHeight(true);
    obj.flowLayout54:setMaxColumns(1);
    obj.flowLayout54:setName("flowLayout54");

    obj.flowPart150 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart150:setParent(obj.flowLayout54);
    obj.flowPart150:setHeight(30);
    obj.flowPart150:setMinWidth(400);
    obj.flowPart150:setMaxWidth(400);
    obj.flowPart150:setName("flowPart150");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart150);
    obj.label59:setFontSize(13);
    obj.label59:setWidth(300);
    obj.label59:setAlign("top");
    obj.label59:setText("A C T I V E   S P E L L S");
    obj.label59:setName("label59");
    obj.label59:setFontColor("white");
    obj.label59:setTextTrimming("character");
    obj.label59:setFontFamily("Constantia");
    obj.label59:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label59, "fontStyle",  "bold");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowPart150);
    obj.button4:setHeight(25);
    obj.button4:setText("🞦");
    obj.button4:setWidth(25);
    obj.button4:setHint("Nova Magia");
    obj.button4:setName("button4");

    obj.horzLine17 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine17:setParent(obj.flowPart150);
    obj.horzLine17:setAlign("none");
    obj.horzLine17:setTop(27);
    obj.horzLine17:setWidth(375);
    obj.horzLine17:setName("horzLine17");
    obj.horzLine17:setStrokeColor("#424242");
    obj.horzLine17:setMargins({top=7});

    obj.flowPart151 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart151:setParent(obj.flowLayout54);
    obj.flowPart151:setMinWidth(400);
    obj.flowPart151:setMaxWidth(400);
    obj.flowPart151:setHeight(190);
    obj.flowPart151:setMargins({bottom=5});
    obj.flowPart151:setName("flowPart151");

    obj.rclactspells = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclactspells:setParent(obj.flowPart151);
    obj.rclactspells:setHeight(180);
    obj.rclactspells:setAlign("top");
    obj.rclactspells:setMinQt(0);
    obj.rclactspells:setLayout("vertical");
    obj.rclactspells:setName("rclactspells");
    obj.rclactspells:setField("fldactspells");
    obj.rclactspells:setTemplateForm("spells");
    obj.rclactspells:setMargins({top=10});

    obj.flowPart152 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart152:setParent(obj.flowLayout51);
    obj.flowPart152:setHeight(240);
    obj.flowPart152:setMinWidth(400);
    obj.flowPart152:setMaxWidth(400);
    obj.flowPart152:setMargins({bottom=10, left=10, right=10});
    obj.flowPart152:setName("flowPart152");

    obj.flowLayout55 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout55:setParent(obj.flowPart152);
    obj.flowLayout55:setOrientation("vertical");
    obj.flowLayout55:setWidth(400);
    obj.flowLayout55:setAutoHeight(true);
    obj.flowLayout55:setMaxColumns(1);
    obj.flowLayout55:setName("flowLayout55");

    obj.flowPart153 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart153:setParent(obj.flowLayout55);
    obj.flowPart153:setHeight(30);
    obj.flowPart153:setMinWidth(400);
    obj.flowPart153:setMaxWidth(400);
    obj.flowPart153:setName("flowPart153");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart153);
    obj.label60:setFontSize(13);
    obj.label60:setWidth(300);
    obj.label60:setAlign("top");
    obj.label60:setText("I N U R E D   S P E L L S");
    obj.label60:setName("label60");
    obj.label60:setFontColor("white");
    obj.label60:setTextTrimming("character");
    obj.label60:setFontFamily("Constantia");
    obj.label60:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.flowPart153);
    obj.button5:setHeight(25);
    obj.button5:setText("🞦");
    obj.button5:setWidth(25);
    obj.button5:setHint("Nova Magia");
    obj.button5:setName("button5");

    obj.horzLine18 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine18:setParent(obj.flowPart153);
    obj.horzLine18:setAlign("none");
    obj.horzLine18:setTop(27);
    obj.horzLine18:setWidth(375);
    obj.horzLine18:setName("horzLine18");
    obj.horzLine18:setStrokeColor("#424242");
    obj.horzLine18:setMargins({top=7});

    obj.flowPart154 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart154:setParent(obj.flowLayout55);
    obj.flowPart154:setMinWidth(400);
    obj.flowPart154:setMaxWidth(400);
    obj.flowPart154:setHeight(190);
    obj.flowPart154:setMargins({bottom=5});
    obj.flowPart154:setName("flowPart154");

    obj.rclinspells = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclinspells:setParent(obj.flowPart154);
    obj.rclinspells:setHeight(180);
    obj.rclinspells:setAlign("top");
    obj.rclinspells:setMinQt(0);
    obj.rclinspells:setLayout("vertical");
    obj.rclinspells:setName("rclinspells");
    obj.rclinspells:setField("fldinspells");
    obj.rclinspells:setTemplateForm("spells");
    obj.rclinspells:setMargins({top=10});

    obj.flowLayout56 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout56:setParent(obj.layMagias);
    obj.flowLayout56:setHeight(25);
    obj.flowLayout56:setMargins();
    obj.flowLayout56:setName("flowLayout56");
    obj.flowLayout56:setAlign("top");
    obj.flowLayout56:setOrientation("horizontal");
    obj.flowLayout56:setHorzAlign("center");
    obj.flowLayout56:setAutoHeight(true);
    obj.flowLayout56:setMaxControlsPerLine(3);

    obj.flowPart155 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart155:setParent(obj.flowLayout56);
    obj.flowPart155:setHeight(25);
    obj.flowPart155:setMinWidth(400);
    obj.flowPart155:setMaxWidth(1000);
    obj.flowPart155:setMargins();
    obj.flowPart155:setName("flowPart155");

    obj.flowLayout57 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout57:setParent(obj.flowPart155);
    obj.flowLayout57:setAutoHeight(false);
    obj.flowLayout57:setHeight(25);
    obj.flowLayout57:setMargins();
    obj.flowLayout57:setName("flowLayout57");
    obj.flowLayout57:setAlign("top");
    obj.flowLayout57:setOrientation("horizontal");
    obj.flowLayout57:setHorzAlign("center");
    obj.flowLayout57:setMaxControlsPerLine(3);

    obj.flowPart156 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart156:setParent(obj.flowLayout57);
    obj.flowPart156:setHeight(25);
    obj.flowPart156:setMinWidth(0);
    obj.flowPart156:setMaxWidth(350);
    obj.flowPart156:setWidth(350);
    obj.flowPart156:setName("flowPart156");

    obj.horzLine19 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine19:setParent(obj.flowPart156);
    obj.horzLine19:setName("horzLine19");
    obj.horzLine19:setStrokeColor("#424242");
    obj.horzLine19:setMargins({top=7});
    obj.horzLine19:setAlign("top");

    obj.flowPart157 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart157:setParent(obj.flowLayout57);
    obj.flowPart157:setHeight(25);
    obj.flowPart157:setWidth(110);
    obj.flowPart157:setName("flowPart157");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart157);
    obj.label61:setText("N I M B U S");
    obj.label61:setName("label61");
    obj.label61:setFontSize(20);
    obj.label61:setFontColor("white");
    lfm_setPropAsString(obj.label61, "fontStyle",  "bold");
    obj.label61:setTextTrimming("character");
    obj.label61:setFontFamily("Constantia");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setAutoSize(true);
    obj.label61:setAlign("client");
    obj.label61:setMargins({bottom=7});

    obj.flowPart158 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart158:setParent(obj.flowLayout57);
    obj.flowPart158:setHeight(25);
    obj.flowPart158:setMinWidth(0);
    obj.flowPart158:setMaxWidth(350);
    obj.flowPart158:setWidth(350);
    obj.flowPart158:setName("flowPart158");

    obj.horzLine20 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine20:setParent(obj.flowPart158);
    obj.horzLine20:setName("horzLine20");
    obj.horzLine20:setStrokeColor("#424242");
    obj.horzLine20:setMargins({top=7});
    obj.horzLine20:setAlign("top");

    obj.flowLayout58 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout58:setParent(obj.layMagias);
    obj.flowLayout58:setName("flowLayout58");
    obj.flowLayout58:setAlign("top");
    obj.flowLayout58:setOrientation("horizontal");
    obj.flowLayout58:setHorzAlign("center");
    obj.flowLayout58:setAutoHeight(true);
    obj.flowLayout58:setMaxControlsPerLine(4);
    obj.flowLayout58:setMargins({left=20, top=20, bottom=30, right=20});

    obj.flowPart159 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart159:setParent(obj.flowLayout58);
    obj.flowPart159:setHeight(120);
    obj.flowPart159:setWidth(180);
    obj.flowPart159:setMargins({bottom=20, left=0, right=20});
    obj.flowPart159:setName("flowPart159");
    obj.flowPart159:setMinWidth(180);
    obj.flowPart159:setMaxWidth(180);

    obj.flowLayout59 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout59:setParent(obj.flowPart159);
    obj.flowLayout59:setOrientation("vertical");
    obj.flowLayout59:setWidth(180);
    obj.flowLayout59:setAutoHeight(true);
    obj.flowLayout59:setMaxColumns(1);
    obj.flowLayout59:setName("flowLayout59");

    obj.flowPart160 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart160:setParent(obj.flowLayout59);
    obj.flowPart160:setHeight(15);
    obj.flowPart160:setMargins({bottom=5});
    obj.flowPart160:setName("flowPart160");
    obj.flowPart160:setMinWidth(180);
    obj.flowPart160:setMaxWidth(180);

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowPart160);
    obj.label62:setFontSize(12);
    obj.label62:setText("S I G N A T U R E");
    obj.label62:setName("label62");
    obj.label62:setFontColor("white");
    obj.label62:setTextTrimming("character");
    obj.label62:setFontFamily("Constantia");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setAlign("top");
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");

    obj.flowPart161 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart161:setParent(obj.flowLayout59);
    obj.flowPart161:setHeight(100);
    obj.flowPart161:setMargins({bottom=5});
    obj.flowPart161:setName("flowPart161");
    obj.flowPart161:setMinWidth(180);
    obj.flowPart161:setMaxWidth(180);

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.flowPart161);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setTransparent(false);
    obj.textEditor5:setField("texteditorS I G N A T U R E");
    obj.textEditor5:setName("textEditor5");

    obj.flowPart162 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart162:setParent(obj.flowLayout58);
    obj.flowPart162:setHeight(120);
    obj.flowPart162:setWidth(180);
    obj.flowPart162:setMargins({bottom=20, left=0, right=20});
    obj.flowPart162:setName("flowPart162");
    obj.flowPart162:setMinWidth(180);
    obj.flowPart162:setMaxWidth(180);

    obj.flowLayout60 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout60:setParent(obj.flowPart162);
    obj.flowLayout60:setOrientation("vertical");
    obj.flowLayout60:setWidth(180);
    obj.flowLayout60:setAutoHeight(true);
    obj.flowLayout60:setMaxColumns(1);
    obj.flowLayout60:setName("flowLayout60");

    obj.flowPart163 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart163:setParent(obj.flowLayout60);
    obj.flowPart163:setHeight(15);
    obj.flowPart163:setMargins({bottom=5});
    obj.flowPart163:setName("flowPart163");
    obj.flowPart163:setMinWidth(180);
    obj.flowPart163:setMaxWidth(180);

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowPart163);
    obj.label63:setFontSize(12);
    obj.label63:setText("I M M E D I A T E");
    obj.label63:setName("label63");
    obj.label63:setFontColor("white");
    obj.label63:setTextTrimming("character");
    obj.label63:setFontFamily("Constantia");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setAlign("top");
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");

    obj.flowPart164 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart164:setParent(obj.flowLayout60);
    obj.flowPart164:setHeight(100);
    obj.flowPart164:setMargins({bottom=5});
    obj.flowPart164:setName("flowPart164");
    obj.flowPart164:setMinWidth(180);
    obj.flowPart164:setMaxWidth(180);

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.flowPart164);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setTransparent(false);
    obj.textEditor6:setField("texteditorI M M E D I A T E");
    obj.textEditor6:setName("textEditor6");

    obj.flowPart165 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart165:setParent(obj.flowLayout58);
    obj.flowPart165:setHeight(120);
    obj.flowPart165:setWidth(180);
    obj.flowPart165:setMargins({bottom=20, left=0, right=20});
    obj.flowPart165:setName("flowPart165");
    obj.flowPart165:setMinWidth(180);
    obj.flowPart165:setMaxWidth(180);

    obj.flowLayout61 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout61:setParent(obj.flowPart165);
    obj.flowLayout61:setOrientation("vertical");
    obj.flowLayout61:setWidth(180);
    obj.flowLayout61:setAutoHeight(true);
    obj.flowLayout61:setMaxColumns(1);
    obj.flowLayout61:setName("flowLayout61");

    obj.flowPart166 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart166:setParent(obj.flowLayout61);
    obj.flowPart166:setHeight(15);
    obj.flowPart166:setMargins({bottom=5});
    obj.flowPart166:setName("flowPart166");
    obj.flowPart166:setMinWidth(180);
    obj.flowPart166:setMaxWidth(180);

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowPart166);
    obj.label64:setFontSize(12);
    obj.label64:setText("L O N G - T E R M");
    obj.label64:setName("label64");
    obj.label64:setFontColor("white");
    obj.label64:setTextTrimming("character");
    obj.label64:setFontFamily("Constantia");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setAlign("top");
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");

    obj.flowPart167 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart167:setParent(obj.flowLayout61);
    obj.flowPart167:setHeight(100);
    obj.flowPart167:setMargins({bottom=5});
    obj.flowPart167:setName("flowPart167");
    obj.flowPart167:setMinWidth(180);
    obj.flowPart167:setMaxWidth(180);

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.flowPart167);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setTransparent(false);
    obj.textEditor7:setField("texteditorL O N G - T E R M");
    obj.textEditor7:setName("textEditor7");

    obj.flowLayout62 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout62:setParent(obj.layMagias);
    obj.flowLayout62:setHeight(25);
    obj.flowLayout62:setMargins();
    obj.flowLayout62:setName("flowLayout62");
    obj.flowLayout62:setAlign("top");
    obj.flowLayout62:setOrientation("horizontal");
    obj.flowLayout62:setHorzAlign("center");
    obj.flowLayout62:setAutoHeight(true);
    obj.flowLayout62:setMaxControlsPerLine(3);

    obj.flowPart168 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart168:setParent(obj.flowLayout62);
    obj.flowPart168:setHeight(25);
    obj.flowPart168:setMinWidth(400);
    obj.flowPart168:setMaxWidth(1000);
    obj.flowPart168:setMargins();
    obj.flowPart168:setName("flowPart168");

    obj.flowLayout63 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout63:setParent(obj.flowPart168);
    obj.flowLayout63:setAutoHeight(false);
    obj.flowLayout63:setHeight(25);
    obj.flowLayout63:setMargins();
    obj.flowLayout63:setName("flowLayout63");
    obj.flowLayout63:setAlign("top");
    obj.flowLayout63:setOrientation("horizontal");
    obj.flowLayout63:setHorzAlign("center");
    obj.flowLayout63:setMaxControlsPerLine(3);

    obj.flowPart169 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart169:setParent(obj.flowLayout63);
    obj.flowPart169:setHeight(25);
    obj.flowPart169:setMinWidth(0);
    obj.flowPart169:setMaxWidth(300);
    obj.flowPart169:setWidth(300);
    obj.flowPart169:setName("flowPart169");

    obj.horzLine21 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine21:setParent(obj.flowPart169);
    obj.horzLine21:setName("horzLine21");
    obj.horzLine21:setStrokeColor("#424242");
    obj.horzLine21:setMargins({top=7});
    obj.horzLine21:setAlign("top");

    obj.flowPart170 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart170:setParent(obj.flowLayout63);
    obj.flowPart170:setHeight(25);
    obj.flowPart170:setWidth(210);
    obj.flowPart170:setName("flowPart170");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart170);
    obj.label65:setText("A T T A I N M E N T S");
    obj.label65:setName("label65");
    obj.label65:setFontSize(20);
    obj.label65:setFontColor("white");
    lfm_setPropAsString(obj.label65, "fontStyle",  "bold");
    obj.label65:setTextTrimming("character");
    obj.label65:setFontFamily("Constantia");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setAutoSize(true);
    obj.label65:setAlign("client");
    obj.label65:setMargins({bottom=7});

    obj.flowPart171 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart171:setParent(obj.flowLayout63);
    obj.flowPart171:setHeight(25);
    obj.flowPart171:setMinWidth(0);
    obj.flowPart171:setMaxWidth(300);
    obj.flowPart171:setWidth(300);
    obj.flowPart171:setName("flowPart171");

    obj.horzLine22 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine22:setParent(obj.flowPart171);
    obj.horzLine22:setName("horzLine22");
    obj.horzLine22:setStrokeColor("#424242");
    obj.horzLine22:setMargins({top=7});
    obj.horzLine22:setAlign("top");

    obj.flowLayout64 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout64:setParent(obj.layMagias);
    obj.flowLayout64:setMargins({left=20, top=25, bottom=30, right=20});
    obj.flowLayout64:setName("flowLayout64");
    obj.flowLayout64:setAlign("top");
    obj.flowLayout64:setOrientation("horizontal");
    obj.flowLayout64:setHorzAlign("center");
    obj.flowLayout64:setAutoHeight(true);
    obj.flowLayout64:setMaxControlsPerLine(3);

    obj.flowPart172 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart172:setParent(obj.flowLayout64);
    obj.flowPart172:setHeight(240);
    obj.flowPart172:setMinWidth(400);
    obj.flowPart172:setMaxWidth(400);
    obj.flowPart172:setMargins({bottom=10, left=10, right=10});
    obj.flowPart172:setName("flowPart172");

    obj.flowLayout65 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout65:setParent(obj.flowPart172);
    obj.flowLayout65:setOrientation("vertical");
    obj.flowLayout65:setWidth(400);
    obj.flowLayout65:setAutoHeight(true);
    obj.flowLayout65:setMaxColumns(1);
    obj.flowLayout65:setName("flowLayout65");

    obj.flowPart173 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart173:setParent(obj.flowLayout65);
    obj.flowPart173:setHeight(30);
    obj.flowPart173:setMinWidth(400);
    obj.flowPart173:setMaxWidth(400);
    obj.flowPart173:setName("flowPart173");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowPart173);
    obj.label66:setFontSize(13);
    obj.label66:setWidth(300);
    obj.label66:setAlign("top");
    obj.label66:setText("L E G A C Y");
    obj.label66:setName("label66");
    obj.label66:setFontColor("white");
    obj.label66:setTextTrimming("character");
    obj.label66:setFontFamily("Constantia");
    obj.label66:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.flowPart173);
    obj.button6:setHeight(25);
    obj.button6:setText("🞦");
    obj.button6:setWidth(25);
    obj.button6:setHint("Nova Magia");
    obj.button6:setName("button6");

    obj.horzLine23 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine23:setParent(obj.flowPart173);
    obj.horzLine23:setAlign("none");
    obj.horzLine23:setTop(27);
    obj.horzLine23:setWidth(375);
    obj.horzLine23:setName("horzLine23");
    obj.horzLine23:setStrokeColor("#424242");
    obj.horzLine23:setMargins({top=7});

    obj.flowPart174 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart174:setParent(obj.flowLayout65);
    obj.flowPart174:setMinWidth(400);
    obj.flowPart174:setMaxWidth(400);
    obj.flowPart174:setHeight(190);
    obj.flowPart174:setMargins({bottom=5});
    obj.flowPart174:setName("flowPart174");

    obj.rclLegacy = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclLegacy:setParent(obj.flowPart174);
    obj.rclLegacy:setHeight(180);
    obj.rclLegacy:setAlign("top");
    obj.rclLegacy:setMinQt(0);
    obj.rclLegacy:setLayout("vertical");
    obj.rclLegacy:setName("rclLegacy");
    obj.rclLegacy:setField("fldLegacy");
    obj.rclLegacy:setTemplateForm("spells");
    obj.rclLegacy:setMargins({top=10});

    obj.flowPart175 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart175:setParent(obj.flowLayout64);
    obj.flowPart175:setHeight(240);
    obj.flowPart175:setMinWidth(400);
    obj.flowPart175:setMaxWidth(400);
    obj.flowPart175:setMargins({bottom=10, left=10, right=10});
    obj.flowPart175:setName("flowPart175");

    obj.flowLayout66 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout66:setParent(obj.flowPart175);
    obj.flowLayout66:setOrientation("vertical");
    obj.flowLayout66:setWidth(400);
    obj.flowLayout66:setAutoHeight(true);
    obj.flowLayout66:setMaxColumns(1);
    obj.flowLayout66:setName("flowLayout66");

    obj.flowPart176 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart176:setParent(obj.flowLayout66);
    obj.flowPart176:setHeight(30);
    obj.flowPart176:setMinWidth(400);
    obj.flowPart176:setMaxWidth(400);
    obj.flowPart176:setName("flowPart176");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowPart176);
    obj.label67:setFontSize(13);
    obj.label67:setWidth(300);
    obj.label67:setAlign("top");
    obj.label67:setText("A R C A N E");
    obj.label67:setName("label67");
    obj.label67:setFontColor("white");
    obj.label67:setTextTrimming("character");
    obj.label67:setFontFamily("Constantia");
    obj.label67:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.flowPart176);
    obj.button7:setHeight(25);
    obj.button7:setText("🞦");
    obj.button7:setWidth(25);
    obj.button7:setHint("Nova Magia");
    obj.button7:setName("button7");

    obj.horzLine24 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine24:setParent(obj.flowPart176);
    obj.horzLine24:setAlign("none");
    obj.horzLine24:setTop(27);
    obj.horzLine24:setWidth(375);
    obj.horzLine24:setName("horzLine24");
    obj.horzLine24:setStrokeColor("#424242");
    obj.horzLine24:setMargins({top=7});

    obj.flowPart177 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart177:setParent(obj.flowLayout66);
    obj.flowPart177:setMinWidth(400);
    obj.flowPart177:setMaxWidth(400);
    obj.flowPart177:setHeight(190);
    obj.flowPart177:setMargins({bottom=5});
    obj.flowPart177:setName("flowPart177");

    obj.rclArcane = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArcane:setParent(obj.flowPart177);
    obj.rclArcane:setHeight(180);
    obj.rclArcane:setAlign("top");
    obj.rclArcane:setMinQt(0);
    obj.rclArcane:setLayout("vertical");
    obj.rclArcane:setName("rclArcane");
    obj.rclArcane:setField("fldArcane");
    obj.rclArcane:setTemplateForm("spells");
    obj.rclArcane:setMargins({top=10});

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Personagem");
    obj.tab4:setName("tab4");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.tab4);
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("#272727");
    obj.rectangle6:setXradius(20);
    obj.rectangle6:setYradius(20);
    obj.rectangle6:setCornerType("bevel");
    obj.rectangle6:setMargins({top=10, right=10, bottom=10, left=10});

    obj.layPersonagem = GUI.fromHandle(_obj_newObject("layout"));
    obj.layPersonagem:setParent(obj.rectangle6);
    obj.layPersonagem:setName("layPersonagem");
    obj.layPersonagem:setAlign("client");

    obj.flowLayout67 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout67:setParent(obj.layPersonagem);
    obj.flowLayout67:setMargins({left=20, top=30, bottom=5, right=20});
    obj.flowLayout67:setName("flowLayout67");
    obj.flowLayout67:setAlign("top");
    obj.flowLayout67:setOrientation("horizontal");
    obj.flowLayout67:setHorzAlign("center");
    obj.flowLayout67:setAutoHeight(true);
    obj.flowLayout67:setMaxControlsPerLine(3);

    obj.flowPart178 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart178:setParent(obj.flowLayout67);
    obj.flowPart178:setHeight(440);
    obj.flowPart178:setMinWidth(260);
    obj.flowPart178:setMaxWidth(260);
    obj.flowPart178:setMargins({bottom=0, left=5, right=5});
    obj.flowPart178:setName("flowPart178");

    obj.flowLayout68 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout68:setParent(obj.flowPart178);
    obj.flowLayout68:setOrientation("vertical");
    obj.flowLayout68:setWidth(260);
    obj.flowLayout68:setAutoHeight(true);
    obj.flowLayout68:setMaxColumns(1);
    obj.flowLayout68:setName("flowLayout68");

    obj.flowPart179 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart179:setParent(obj.flowLayout68);
    obj.flowPart179:setMinWidth(260);
    obj.flowPart179:setMaxWidth(260);
    obj.flowPart179:setMargins({bottom=5});
    obj.flowPart179:setName("flowPart179");
    obj.flowPart179:setHeight(25);

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowPart179);
    obj.label68:setText("I M A G E M");
    obj.label68:setName("label68");
    obj.label68:setFontSize(10);
    obj.label68:setFontColor("white");
    obj.label68:setTextTrimming("character");
    obj.label68:setFontFamily("Constantia");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setAlign("top");
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.flowLayout68);
    obj.layout40:setAlign("none");
    obj.layout40:setHeight(400);
    obj.layout40:setWidth(260);
    obj.layout40:setName("layout40");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout40);
    obj.image3:setAlign("none");
    obj.image3:setHeight(400);
    obj.image3:setWidth(260);
    obj.image3:setStyle("autoFit");
    obj.image3:setEditable(true);
    obj.image3:setField("fldFotoPJ");
    obj.image3:setHint("Alterar Aparência");
    obj.image3:setName("image3");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout40);
    obj.dataLink1:setField("fldFotoPJ");
    obj.dataLink1:setDefaultValue("/images/character.png");
    obj.dataLink1:setName("dataLink1");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout40);
    obj.image4:setHeight(400);
    obj.image4:setWidth(260);
    obj.image4:setURL("/images/frame.png");
    obj.image4:setStyle("proportional");
    obj.image4:setName("image4");

    obj.flowPart180 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart180:setParent(obj.flowLayout67);
    obj.flowPart180:setHeight(440);
    obj.flowPart180:setMinWidth(530);
    obj.flowPart180:setMaxWidth(530);
    obj.flowPart180:setMargins({bottom=0, left=5, right=5});
    obj.flowPart180:setName("flowPart180");

    obj.flowLayout69 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout69:setParent(obj.flowPart180);
    obj.flowLayout69:setOrientation("vertical");
    obj.flowLayout69:setWidth(530);
    obj.flowLayout69:setAutoHeight(true);
    obj.flowLayout69:setMaxColumns(1);
    obj.flowLayout69:setName("flowLayout69");

    obj.flowPart181 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart181:setParent(obj.flowLayout69);
    obj.flowPart181:setMinWidth(530);
    obj.flowPart181:setMaxWidth(530);
    obj.flowPart181:setMargins({bottom=5});
    obj.flowPart181:setName("flowPart181");
    obj.flowPart181:setHeight(25);

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart181);
    obj.label69:setText("H I S T Ó R I A");
    obj.label69:setName("label69");
    obj.label69:setFontSize(10);
    obj.label69:setFontColor("white");
    obj.label69:setTextTrimming("character");
    obj.label69:setFontFamily("Constantia");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setAlign("top");
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.flowLayout69);
    obj.rectangle7:setHeight(400);
    obj.rectangle7:setWidth(530);
    obj.rectangle7:setColor("#202020");
    obj.rectangle7:setCornerType("bevel");
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setPadding({top=10, bottom=10, left=10, right=10});
    obj.rectangle7:setName("rectangle7");

    obj.nomeBG = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeBG:setParent(obj.rectangle7);
    obj.nomeBG:setAlign("client");
    obj.nomeBG:setTransparent(true);
    obj.nomeBG:setField("fldBG");
    obj.nomeBG:setName("nomeBG");
    obj.nomeBG:setFontFamily("Constantia");
    obj.nomeBG:setFontSize(13);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle7);
    obj.dataLink2:setField("fldBG");
    obj.dataLink2:setDefaultValue("Escreva aqui.");
    obj.dataLink2:setName("dataLink2");

    obj.flowLayout70 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout70:setParent(obj.layPersonagem);
    obj.flowLayout70:setMargins({left=20, top=0, bottom=30, right=20});
    obj.flowLayout70:setName("flowLayout70");
    obj.flowLayout70:setAlign("top");
    obj.flowLayout70:setOrientation("horizontal");
    obj.flowLayout70:setHorzAlign("center");
    obj.flowLayout70:setAutoHeight(true);
    obj.flowLayout70:setMaxControlsPerLine(3);

    obj.flowPart182 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart182:setParent(obj.flowLayout70);
    obj.flowPart182:setHeight(240);
    obj.flowPart182:setMinWidth(260);
    obj.flowPart182:setMaxWidth(260);
    obj.flowPart182:setMargins({bottom=0, left=5, right=5});
    obj.flowPart182:setName("flowPart182");

    obj.flowLayout71 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout71:setParent(obj.flowPart182);
    obj.flowLayout71:setOrientation("vertical");
    obj.flowLayout71:setWidth(260);
    obj.flowLayout71:setAutoHeight(true);
    obj.flowLayout71:setMaxColumns(1);
    obj.flowLayout71:setName("flowLayout71");

    obj.flowPart183 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart183:setParent(obj.flowLayout71);
    obj.flowPart183:setMinWidth(260);
    obj.flowPart183:setMaxWidth(260);
    obj.flowPart183:setMargins({bottom=5});
    obj.flowPart183:setName("flowPart183");
    obj.flowPart183:setHeight(25);

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowPart183);
    obj.label70:setText("A P A R Ê N C I A");
    obj.label70:setName("label70");
    obj.label70:setFontSize(10);
    obj.label70:setFontColor("white");
    obj.label70:setTextTrimming("character");
    obj.label70:setFontFamily("Constantia");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setAlign("top");
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowLayout71);
    obj.rectangle8:setHeight(200);
    obj.rectangle8:setWidth(260);
    obj.rectangle8:setColor("#202020");
    obj.rectangle8:setCornerType("bevel");
    obj.rectangle8:setXradius(10);
    obj.rectangle8:setYradius(10);
    obj.rectangle8:setPadding({top=10, bottom=10, left=10, right=10});
    obj.rectangle8:setName("rectangle8");

    obj.nomeVER_Aparencia = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeVER_Aparencia:setParent(obj.rectangle8);
    obj.nomeVER_Aparencia:setAlign("client");
    obj.nomeVER_Aparencia:setTransparent(true);
    obj.nomeVER_Aparencia:setField("fldVER_Aparencia");
    obj.nomeVER_Aparencia:setName("nomeVER_Aparencia");
    obj.nomeVER_Aparencia:setFontFamily("Constantia");
    obj.nomeVER_Aparencia:setFontSize(13);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle8);
    obj.dataLink3:setField("fldVER_Aparencia");
    obj.dataLink3:setDefaultValue("Escreva aqui.");
    obj.dataLink3:setName("dataLink3");

    obj.flowLayout72 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout72:setParent(obj.flowLayout70);
    obj.flowLayout72:setMaxControlsPerLine(1);
    obj.flowLayout72:setHeight(240);
    obj.flowLayout72:setMinWidth(265);
    obj.flowLayout72:setMaxWidth(265);
    obj.flowLayout72:setMargins({right=5});
    obj.flowLayout72:setName("flowLayout72");

    obj.flowPart184 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart184:setParent(obj.flowLayout72);
    obj.flowPart184:setHeight(120);
    obj.flowPart184:setMinWidth(260);
    obj.flowPart184:setMaxWidth(260);
    obj.flowPart184:setMargins({bottom=0, left=5, right=5});
    obj.flowPart184:setName("flowPart184");

    obj.flowLayout73 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout73:setParent(obj.flowPart184);
    obj.flowLayout73:setOrientation("vertical");
    obj.flowLayout73:setWidth(260);
    obj.flowLayout73:setAutoHeight(true);
    obj.flowLayout73:setMaxColumns(1);
    obj.flowLayout73:setName("flowLayout73");

    obj.flowPart185 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart185:setParent(obj.flowLayout73);
    obj.flowPart185:setMinWidth(260);
    obj.flowPart185:setMaxWidth(260);
    obj.flowPart185:setMargins({bottom=5});
    obj.flowPart185:setName("flowPart185");
    obj.flowPart185:setHeight(25);

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowPart185);
    obj.label71:setText("O B J E T I V O S");
    obj.label71:setName("label71");
    obj.label71:setFontSize(10);
    obj.label71:setFontColor("white");
    obj.label71:setTextTrimming("character");
    obj.label71:setFontFamily("Constantia");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setAlign("top");
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.flowLayout73);
    obj.rectangle9:setHeight(80);
    obj.rectangle9:setWidth(260);
    obj.rectangle9:setColor("#202020");
    obj.rectangle9:setCornerType("bevel");
    obj.rectangle9:setXradius(10);
    obj.rectangle9:setYradius(10);
    obj.rectangle9:setPadding({top=10, bottom=10, left=10, right=10});
    obj.rectangle9:setName("rectangle9");

    obj.nomeVER_Objetivos = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeVER_Objetivos:setParent(obj.rectangle9);
    obj.nomeVER_Objetivos:setAlign("client");
    obj.nomeVER_Objetivos:setTransparent(true);
    obj.nomeVER_Objetivos:setField("fldVER_Objetivos");
    obj.nomeVER_Objetivos:setName("nomeVER_Objetivos");
    obj.nomeVER_Objetivos:setFontFamily("Constantia");
    obj.nomeVER_Objetivos:setFontSize(13);

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle9);
    obj.dataLink4:setField("fldVER_Objetivos");
    obj.dataLink4:setDefaultValue("Escreva aqui.");
    obj.dataLink4:setName("dataLink4");

    obj.flowPart186 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart186:setParent(obj.flowLayout72);
    obj.flowPart186:setHeight(120);
    obj.flowPart186:setMinWidth(260);
    obj.flowPart186:setMaxWidth(260);
    obj.flowPart186:setMargins({bottom=0, left=5, right=5});
    obj.flowPart186:setName("flowPart186");

    obj.flowLayout74 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout74:setParent(obj.flowPart186);
    obj.flowLayout74:setOrientation("vertical");
    obj.flowLayout74:setWidth(260);
    obj.flowLayout74:setAutoHeight(true);
    obj.flowLayout74:setMaxColumns(1);
    obj.flowLayout74:setName("flowLayout74");

    obj.flowPart187 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart187:setParent(obj.flowLayout74);
    obj.flowPart187:setMinWidth(260);
    obj.flowPart187:setMaxWidth(260);
    obj.flowPart187:setMargins({bottom=5});
    obj.flowPart187:setName("flowPart187");
    obj.flowPart187:setHeight(25);

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.flowPart187);
    obj.label72:setText("F E R R A M E N T A   D E D I C A D A");
    obj.label72:setName("label72");
    obj.label72:setFontSize(10);
    obj.label72:setFontColor("white");
    obj.label72:setTextTrimming("character");
    obj.label72:setFontFamily("Constantia");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setAlign("top");
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.flowLayout74);
    obj.rectangle10:setHeight(80);
    obj.rectangle10:setWidth(260);
    obj.rectangle10:setColor("#202020");
    obj.rectangle10:setCornerType("bevel");
    obj.rectangle10:setXradius(10);
    obj.rectangle10:setYradius(10);
    obj.rectangle10:setPadding({top=10, bottom=10, left=10, right=10});
    obj.rectangle10:setName("rectangle10");

    obj.nomeVER_FerramentaDedicada = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeVER_FerramentaDedicada:setParent(obj.rectangle10);
    obj.nomeVER_FerramentaDedicada:setAlign("client");
    obj.nomeVER_FerramentaDedicada:setTransparent(true);
    obj.nomeVER_FerramentaDedicada:setField("fldVER_FerramentaDedicada");
    obj.nomeVER_FerramentaDedicada:setName("nomeVER_FerramentaDedicada");
    obj.nomeVER_FerramentaDedicada:setFontFamily("Constantia");
    obj.nomeVER_FerramentaDedicada:setFontSize(13);

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle10);
    obj.dataLink5:setField("fldVER_FerramentaDedicada");
    obj.dataLink5:setDefaultValue("Escreva aqui.");
    obj.dataLink5:setName("dataLink5");

    obj.flowPart188 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart188:setParent(obj.flowLayout70);
    obj.flowPart188:setHeight(240);
    obj.flowPart188:setMinWidth(260);
    obj.flowPart188:setMaxWidth(260);
    obj.flowPart188:setMargins({bottom=0, left=5, right=5});
    obj.flowPart188:setName("flowPart188");

    obj.flowLayout75 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout75:setParent(obj.flowPart188);
    obj.flowLayout75:setOrientation("vertical");
    obj.flowLayout75:setWidth(260);
    obj.flowLayout75:setAutoHeight(true);
    obj.flowLayout75:setMaxColumns(1);
    obj.flowLayout75:setName("flowLayout75");

    obj.flowPart189 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart189:setParent(obj.flowLayout75);
    obj.flowPart189:setMinWidth(260);
    obj.flowPart189:setMaxWidth(260);
    obj.flowPart189:setMargins({bottom=5});
    obj.flowPart189:setName("flowPart189");
    obj.flowPart189:setHeight(25);

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.flowPart189);
    obj.label73:setText("P E R S O N A L I D A D E");
    obj.label73:setName("label73");
    obj.label73:setFontSize(10);
    obj.label73:setFontColor("white");
    obj.label73:setTextTrimming("character");
    obj.label73:setFontFamily("Constantia");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setAlign("top");
    lfm_setPropAsString(obj.label73, "fontStyle",  "bold");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.flowLayout75);
    obj.rectangle11:setHeight(200);
    obj.rectangle11:setWidth(260);
    obj.rectangle11:setColor("#202020");
    obj.rectangle11:setCornerType("bevel");
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setPadding({top=10, bottom=10, left=10, right=10});
    obj.rectangle11:setName("rectangle11");

    obj.nomeVER_Personalidade = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeVER_Personalidade:setParent(obj.rectangle11);
    obj.nomeVER_Personalidade:setAlign("client");
    obj.nomeVER_Personalidade:setTransparent(true);
    obj.nomeVER_Personalidade:setField("fldVER_Personalidade");
    obj.nomeVER_Personalidade:setName("nomeVER_Personalidade");
    obj.nomeVER_Personalidade:setFontFamily("Constantia");
    obj.nomeVER_Personalidade:setFontSize(13);

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle11);
    obj.dataLink6:setField("fldVER_Personalidade");
    obj.dataLink6:setDefaultValue("Escreva aqui.");
    obj.dataLink6:setName("dataLink6");

    obj.flowLayout76 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout76:setParent(obj.layPersonagem);
    obj.flowLayout76:setMaxControlsPerLine(3);
    obj.flowLayout76:setName("flowLayout76");
    obj.flowLayout76:setAlign("top");
    obj.flowLayout76:setOrientation("horizontal");
    obj.flowLayout76:setHorzAlign("center");
    obj.flowLayout76:setAutoHeight(true);
    obj.flowLayout76:setMargins({left=20, top=20, bottom=30, right=20});

    obj.flowPart190 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart190:setParent(obj.flowLayout76);
    obj.flowPart190:setHeight(600);
    obj.flowPart190:setMargins({left=5, right=5, bottom=10});
    obj.flowPart190:setMinWidth(265);
    obj.flowPart190:setMaxWidth(260);
    obj.flowPart190:setName("flowPart190");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.flowPart190);
    obj.rectangle12:setHeight(600);
    obj.rectangle12:setColor("transparent");
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setName("rectangle12");

    obj.flowLayout77 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout77:setParent(obj.rectangle12);
    obj.flowLayout77:setHeight(25);
    obj.flowLayout77:setMargins();
    obj.flowLayout77:setName("flowLayout77");
    obj.flowLayout77:setAlign("top");
    obj.flowLayout77:setOrientation("horizontal");
    obj.flowLayout77:setHorzAlign("center");
    obj.flowLayout77:setAutoHeight(true);
    obj.flowLayout77:setMaxControlsPerLine(3);

    obj.flowPart191 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart191:setParent(obj.flowLayout77);
    obj.flowPart191:setHeight(25);
    obj.flowPart191:setMinWidth(400);
    obj.flowPart191:setMaxWidth(1000);
    obj.flowPart191:setMargins();
    obj.flowPart191:setName("flowPart191");

    obj.flowLayout78 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout78:setParent(obj.flowPart191);
    obj.flowLayout78:setAutoHeight(false);
    obj.flowLayout78:setHeight(25);
    obj.flowLayout78:setMargins();
    obj.flowLayout78:setName("flowLayout78");
    obj.flowLayout78:setAlign("top");
    obj.flowLayout78:setOrientation("horizontal");
    obj.flowLayout78:setHorzAlign("center");
    obj.flowLayout78:setMaxControlsPerLine(3);

    obj.flowPart192 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart192:setParent(obj.flowLayout78);
    obj.flowPart192:setHeight(25);
    obj.flowPart192:setMinWidth(0);
    obj.flowPart192:setMaxWidth(74);
    obj.flowPart192:setWidth(74);
    obj.flowPart192:setName("flowPart192");

    obj.horzLine25 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine25:setParent(obj.flowPart192);
    obj.horzLine25:setName("horzLine25");
    obj.horzLine25:setStrokeColor("#424242");
    obj.horzLine25:setMargins({top=7});
    obj.horzLine25:setAlign("top");

    obj.flowPart193 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart193:setParent(obj.flowLayout78);
    obj.flowPart193:setHeight(25);
    obj.flowPart193:setWidth(114);
    obj.flowPart193:setName("flowPart193");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.flowPart193);
    obj.label74:setText("A R C A N A");
    obj.label74:setName("label74");
    obj.label74:setFontSize(20);
    obj.label74:setFontColor("white");
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");
    obj.label74:setTextTrimming("character");
    obj.label74:setFontFamily("Constantia");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setAutoSize(true);
    obj.label74:setAlign("client");
    obj.label74:setMargins({bottom=7});

    obj.flowPart194 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart194:setParent(obj.flowLayout78);
    obj.flowPart194:setHeight(25);
    obj.flowPart194:setMinWidth(0);
    obj.flowPart194:setMaxWidth(74);
    obj.flowPart194:setWidth(74);
    obj.flowPart194:setName("flowPart194");

    obj.horzLine26 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine26:setParent(obj.flowPart194);
    obj.horzLine26:setName("horzLine26");
    obj.horzLine26:setStrokeColor("#424242");
    obj.horzLine26:setMargins({top=7});
    obj.horzLine26:setAlign("top");

    obj.rclArcana = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArcana:setParent(obj.rectangle12);
    obj.rclArcana:setAlign("top");
    obj.rclArcana:setMinQt(3);
    obj.rclArcana:setLayout("vertical");
    obj.rclArcana:setName("rclArcana");
    obj.rclArcana:setField("fldArcana");
    obj.rclArcana:setTemplateForm("vantagens");
    obj.rclArcana:setAutoHeight(true);
    obj.rclArcana:setMargins({top=20});

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle12);
    obj.button8:setAlign("top");
    obj.button8:setHeight(25);
    obj.button8:setText("🞦");
    obj.button8:setHint("Nova Arcana");
    obj.button8:setName("button8");

    obj.flowPart195 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart195:setParent(obj.flowLayout76);
    obj.flowPart195:setHeight(600);
    obj.flowPart195:setMargins({left=5, right=5, bottom=10});
    obj.flowPart195:setMinWidth(265);
    obj.flowPart195:setMaxWidth(260);
    obj.flowPart195:setName("flowPart195");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.flowPart195);
    obj.rectangle13:setHeight(600);
    obj.rectangle13:setColor("transparent");
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setName("rectangle13");

    obj.flowLayout79 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout79:setParent(obj.rectangle13);
    obj.flowLayout79:setHeight(25);
    obj.flowLayout79:setMargins();
    obj.flowLayout79:setName("flowLayout79");
    obj.flowLayout79:setAlign("top");
    obj.flowLayout79:setOrientation("horizontal");
    obj.flowLayout79:setHorzAlign("center");
    obj.flowLayout79:setAutoHeight(true);
    obj.flowLayout79:setMaxControlsPerLine(3);

    obj.flowPart196 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart196:setParent(obj.flowLayout79);
    obj.flowPart196:setHeight(25);
    obj.flowPart196:setMinWidth(400);
    obj.flowPart196:setMaxWidth(1000);
    obj.flowPart196:setMargins();
    obj.flowPart196:setName("flowPart196");

    obj.flowLayout80 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout80:setParent(obj.flowPart196);
    obj.flowLayout80:setAutoHeight(false);
    obj.flowLayout80:setHeight(25);
    obj.flowLayout80:setMargins();
    obj.flowLayout80:setName("flowLayout80");
    obj.flowLayout80:setAlign("top");
    obj.flowLayout80:setOrientation("horizontal");
    obj.flowLayout80:setHorzAlign("center");
    obj.flowLayout80:setMaxControlsPerLine(3);

    obj.flowPart197 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart197:setParent(obj.flowLayout80);
    obj.flowPart197:setHeight(25);
    obj.flowPart197:setMinWidth(0);
    obj.flowPart197:setMaxWidth(74);
    obj.flowPart197:setWidth(74);
    obj.flowPart197:setName("flowPart197");

    obj.horzLine27 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine27:setParent(obj.flowPart197);
    obj.horzLine27:setName("horzLine27");
    obj.horzLine27:setStrokeColor("#424242");
    obj.horzLine27:setMargins({top=7});
    obj.horzLine27:setAlign("top");

    obj.flowPart198 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart198:setParent(obj.flowLayout80);
    obj.flowPart198:setHeight(25);
    obj.flowPart198:setWidth(114);
    obj.flowPart198:setName("flowPart198");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.flowPart198);
    obj.label75:setText("M E R I T S");
    obj.label75:setName("label75");
    obj.label75:setFontSize(20);
    obj.label75:setFontColor("white");
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold");
    obj.label75:setTextTrimming("character");
    obj.label75:setFontFamily("Constantia");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setAutoSize(true);
    obj.label75:setAlign("client");
    obj.label75:setMargins({bottom=7});

    obj.flowPart199 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart199:setParent(obj.flowLayout80);
    obj.flowPart199:setHeight(25);
    obj.flowPart199:setMinWidth(0);
    obj.flowPart199:setMaxWidth(74);
    obj.flowPart199:setWidth(74);
    obj.flowPart199:setName("flowPart199");

    obj.horzLine28 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine28:setParent(obj.flowPart199);
    obj.horzLine28:setName("horzLine28");
    obj.horzLine28:setStrokeColor("#424242");
    obj.horzLine28:setMargins({top=7});
    obj.horzLine28:setAlign("top");

    obj.rclMerits = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMerits:setParent(obj.rectangle13);
    obj.rclMerits:setAlign("top");
    obj.rclMerits:setMinQt(3);
    obj.rclMerits:setLayout("vertical");
    obj.rclMerits:setName("rclMerits");
    obj.rclMerits:setField("fldMerits");
    obj.rclMerits:setTemplateForm("vantagens");
    obj.rclMerits:setAutoHeight(true);
    obj.rclMerits:setMargins({top=20});

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle13);
    obj.button9:setAlign("top");
    obj.button9:setHeight(25);
    obj.button9:setText("🞦");
    obj.button9:setHint("Novo Merit");
    obj.button9:setName("button9");

    obj.flowPart200 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart200:setParent(obj.flowLayout76);
    obj.flowPart200:setHeight(620);
    obj.flowPart200:setMargins({left=5, right=5, bottom=10, top=30});
    obj.flowPart200:setMinWidth(265);
    obj.flowPart200:setMaxWidth(260);
    obj.flowPart200:setName("flowPart200");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.flowPart200);
    obj.rectangle14:setHeight(620);
    obj.rectangle14:setColor("transparent");
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setName("rectangle14");

    obj.flowLayout81 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout81:setParent(obj.rectangle14);
    obj.flowLayout81:setHeight(25);
    obj.flowLayout81:setMargins();
    obj.flowLayout81:setName("flowLayout81");
    obj.flowLayout81:setAlign("top");
    obj.flowLayout81:setOrientation("horizontal");
    obj.flowLayout81:setHorzAlign("center");
    obj.flowLayout81:setAutoHeight(true);
    obj.flowLayout81:setMaxControlsPerLine(3);

    obj.flowPart201 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart201:setParent(obj.flowLayout81);
    obj.flowPart201:setHeight(25);
    obj.flowPart201:setMinWidth(400);
    obj.flowPart201:setMaxWidth(1000);
    obj.flowPart201:setMargins();
    obj.flowPart201:setName("flowPart201");

    obj.flowLayout82 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout82:setParent(obj.flowPart201);
    obj.flowLayout82:setAutoHeight(false);
    obj.flowLayout82:setHeight(25);
    obj.flowLayout82:setMargins();
    obj.flowLayout82:setName("flowLayout82");
    obj.flowLayout82:setAlign("top");
    obj.flowLayout82:setOrientation("horizontal");
    obj.flowLayout82:setHorzAlign("center");
    obj.flowLayout82:setMaxControlsPerLine(3);

    obj.flowPart202 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart202:setParent(obj.flowLayout82);
    obj.flowPart202:setHeight(25);
    obj.flowPart202:setMinWidth(0);
    obj.flowPart202:setMaxWidth(47);
    obj.flowPart202:setWidth(47);
    obj.flowPart202:setName("flowPart202");

    obj.horzLine29 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine29:setParent(obj.flowPart202);
    obj.horzLine29:setName("horzLine29");
    obj.horzLine29:setStrokeColor("#424242");
    obj.horzLine29:setMargins({top=7});
    obj.horzLine29:setAlign("top");

    obj.flowPart203 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart203:setParent(obj.flowLayout82);
    obj.flowPart203:setHeight(25);
    obj.flowPart203:setWidth(168);
    obj.flowPart203:setName("flowPart203");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.flowPart203);
    obj.label76:setText("D E S P E R T A R");
    obj.label76:setName("label76");
    obj.label76:setFontSize(20);
    obj.label76:setFontColor("white");
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setTextTrimming("character");
    obj.label76:setFontFamily("Constantia");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setAutoSize(true);
    obj.label76:setAlign("client");
    obj.label76:setMargins({bottom=7});

    obj.flowPart204 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart204:setParent(obj.flowLayout82);
    obj.flowPart204:setHeight(25);
    obj.flowPart204:setMinWidth(0);
    obj.flowPart204:setMaxWidth(47);
    obj.flowPart204:setWidth(47);
    obj.flowPart204:setName("flowPart204");

    obj.horzLine30 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine30:setParent(obj.flowPart204);
    obj.horzLine30:setName("horzLine30");
    obj.horzLine30:setStrokeColor("#424242");
    obj.horzLine30:setMargins({top=7});
    obj.horzLine30:setAlign("top");

    obj.flowLayout83 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout83:setParent(obj.rectangle14);
    obj.flowLayout83:setAlign("top");
    obj.flowLayout83:setAutoHeight(true);
    obj.flowLayout83:setOrientation("vertical");
    obj.flowLayout83:setMargins({top=20});
    obj.flowLayout83:setName("flowLayout83");

    obj.flowPart205 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart205:setParent(obj.flowLayout83);
    obj.flowPart205:setAlign("top");
    obj.flowPart205:setHeight(50);
    obj.flowPart205:setWidth(240);
    obj.flowPart205:setMargins({bottom=5});
    obj.flowPart205:setName("flowPart205");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.flowPart205);
    obj.label77:setFontSize(10);
    obj.label77:setTextTrimming("character");
    obj.label77:setFontFamily("Constantia");
    obj.label77:setWidth(240);
    obj.label77:setHorzTextAlign("leading");
    obj.label77:setAlign("top");
    obj.label77:setText("INTERVALO DE RITUAL");
    obj.label77:setFontColor("#6f6f6f");
    obj.label77:setMargins({bottom=5});
    obj.label77:setName("label77");
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");

    obj.sanggnosisRitual = GUI.fromHandle(_obj_newObject("label"));
    obj.sanggnosisRitual:setParent(obj.flowPart205);
    obj.sanggnosisRitual:setAlign("top");
    obj.sanggnosisRitual:setField("fldsanggnosisRitual");
    obj.sanggnosisRitual:setName("sanggnosisRitual");
    obj.sanggnosisRitual:setFontSize(14);
    obj.sanggnosisRitual:setFontColor("white");
    lfm_setPropAsString(obj.sanggnosisRitual, "fontStyle",  "bold");
    obj.sanggnosisRitual:setTextTrimming("character");
    obj.sanggnosisRitual:setFontFamily("Constantia");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.flowPart205);
    obj.dataLink7:setField("fldsanggnosisRitual");
    obj.dataLink7:setDefaultValue("—");
    obj.dataLink7:setName("dataLink7");

    obj.flowPart206 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart206:setParent(obj.flowLayout83);
    obj.flowPart206:setAlign("top");
    obj.flowPart206:setHeight(50);
    obj.flowPart206:setWidth(240);
    obj.flowPart206:setMargins({bottom=5});
    obj.flowPart206:setName("flowPart206");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.flowPart206);
    obj.label78:setFontSize(10);
    obj.label78:setTextTrimming("character");
    obj.label78:setFontFamily("Constantia");
    obj.label78:setWidth(240);
    obj.label78:setHorzTextAlign("leading");
    obj.label78:setAlign("top");
    obj.label78:setText("MÁXIMO DE ATRIBUTO/HABILIDADE");
    obj.label78:setFontColor("#6f6f6f");
    obj.label78:setMargins({bottom=5});
    obj.label78:setName("label78");
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");

    obj.sanggnosisTraitMax = GUI.fromHandle(_obj_newObject("label"));
    obj.sanggnosisTraitMax:setParent(obj.flowPart206);
    obj.sanggnosisTraitMax:setAlign("top");
    obj.sanggnosisTraitMax:setField("fldsanggnosisTraitMax");
    obj.sanggnosisTraitMax:setName("sanggnosisTraitMax");
    obj.sanggnosisTraitMax:setFontSize(14);
    obj.sanggnosisTraitMax:setFontColor("white");
    lfm_setPropAsString(obj.sanggnosisTraitMax, "fontStyle",  "bold");
    obj.sanggnosisTraitMax:setTextTrimming("character");
    obj.sanggnosisTraitMax:setFontFamily("Constantia");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowPart206);
    obj.dataLink8:setField("fldsanggnosisTraitMax");
    obj.dataLink8:setDefaultValue("—");
    obj.dataLink8:setName("dataLink8");

    obj.flowPart207 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart207:setParent(obj.flowLayout83);
    obj.flowPart207:setAlign("top");
    obj.flowPart207:setHeight(50);
    obj.flowPart207:setWidth(240);
    obj.flowPart207:setMargins({bottom=5});
    obj.flowPart207:setName("flowPart207");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.flowPart207);
    obj.label79:setFontSize(10);
    obj.label79:setTextTrimming("character");
    obj.label79:setFontFamily("Constantia");
    obj.label79:setWidth(240);
    obj.label79:setHorzTextAlign("leading");
    obj.label79:setAlign("top");
    obj.label79:setText("YANTRAS");
    obj.label79:setFontColor("#6f6f6f");
    obj.label79:setMargins({bottom=5});
    obj.label79:setName("label79");
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");

    obj.sanggnosisYantra = GUI.fromHandle(_obj_newObject("label"));
    obj.sanggnosisYantra:setParent(obj.flowPart207);
    obj.sanggnosisYantra:setAlign("top");
    obj.sanggnosisYantra:setField("fldsanggnosisYantra");
    obj.sanggnosisYantra:setName("sanggnosisYantra");
    obj.sanggnosisYantra:setFontSize(14);
    obj.sanggnosisYantra:setFontColor("white");
    lfm_setPropAsString(obj.sanggnosisYantra, "fontStyle",  "bold");
    obj.sanggnosisYantra:setTextTrimming("character");
    obj.sanggnosisYantra:setFontFamily("Constantia");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.flowPart207);
    obj.dataLink9:setField("fldsanggnosisYantra");
    obj.dataLink9:setDefaultValue("—");
    obj.dataLink9:setName("dataLink9");

    obj.flowPart208 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart208:setParent(obj.flowLayout83);
    obj.flowPart208:setAlign("top");
    obj.flowPart208:setHeight(50);
    obj.flowPart208:setWidth(240);
    obj.flowPart208:setMargins({bottom=5});
    obj.flowPart208:setName("flowPart208");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.flowPart208);
    obj.label80:setFontSize(10);
    obj.label80:setTextTrimming("character");
    obj.label80:setFontFamily("Constantia");
    obj.label80:setWidth(240);
    obj.label80:setHorzTextAlign("leading");
    obj.label80:setAlign("top");
    obj.label80:setText("PARADOXO");
    obj.label80:setFontColor("#6f6f6f");
    obj.label80:setMargins({bottom=5});
    obj.label80:setName("label80");
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");

    obj.sanggnosisParadox = GUI.fromHandle(_obj_newObject("label"));
    obj.sanggnosisParadox:setParent(obj.flowPart208);
    obj.sanggnosisParadox:setAlign("top");
    obj.sanggnosisParadox:setField("fldsanggnosisParadox");
    obj.sanggnosisParadox:setName("sanggnosisParadox");
    obj.sanggnosisParadox:setFontSize(14);
    obj.sanggnosisParadox:setFontColor("white");
    lfm_setPropAsString(obj.sanggnosisParadox, "fontStyle",  "bold");
    obj.sanggnosisParadox:setTextTrimming("character");
    obj.sanggnosisParadox:setFontFamily("Constantia");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.flowPart208);
    obj.dataLink10:setField("fldsanggnosisParadox");
    obj.dataLink10:setDefaultValue("—");
    obj.dataLink10:setName("dataLink10");

    obj.flowPart209 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart209:setParent(obj.flowLayout83);
    obj.flowPart209:setAlign("top");
    obj.flowPart209:setHeight(50);
    obj.flowPart209:setWidth(240);
    obj.flowPart209:setMargins({bottom=5});
    obj.flowPart209:setName("flowPart209");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.flowPart209);
    obj.label81:setFontSize(10);
    obj.label81:setTextTrimming("character");
    obj.label81:setFontFamily("Constantia");
    obj.label81:setWidth(240);
    obj.label81:setHorzTextAlign("leading");
    obj.label81:setAlign("top");
    obj.label81:setText("MAGIAS COMBINADAS");
    obj.label81:setFontColor("#6f6f6f");
    obj.label81:setMargins({bottom=5});
    obj.label81:setName("label81");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");

    obj.sanggnosisCS = GUI.fromHandle(_obj_newObject("label"));
    obj.sanggnosisCS:setParent(obj.flowPart209);
    obj.sanggnosisCS:setAlign("top");
    obj.sanggnosisCS:setField("fldsanggnosisCS");
    obj.sanggnosisCS:setName("sanggnosisCS");
    obj.sanggnosisCS:setFontSize(14);
    obj.sanggnosisCS:setFontColor("white");
    lfm_setPropAsString(obj.sanggnosisCS, "fontStyle",  "bold");
    obj.sanggnosisCS:setTextTrimming("character");
    obj.sanggnosisCS:setFontFamily("Constantia");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.flowPart209);
    obj.dataLink11:setField("fldsanggnosisCS");
    obj.dataLink11:setDefaultValue("—");
    obj.dataLink11:setName("dataLink11");

    obj.flowPart210 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart210:setParent(obj.flowLayout83);
    obj.flowPart210:setAlign("top");
    obj.flowPart210:setHeight(50);
    obj.flowPart210:setWidth(240);
    obj.flowPart210:setMargins({bottom=5});
    obj.flowPart210:setName("flowPart210");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.flowPart210);
    obj.label82:setFontSize(10);
    obj.label82:setTextTrimming("character");
    obj.label82:setFontFamily("Constantia");
    obj.label82:setWidth(240);
    obj.label82:setHorzTextAlign("leading");
    obj.label82:setAlign("top");
    obj.label82:setText("OBSESSÕES");
    obj.label82:setFontColor("#6f6f6f");
    obj.label82:setMargins({bottom=5});
    obj.label82:setName("label82");
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");

    obj.sanggnosisObsessions = GUI.fromHandle(_obj_newObject("label"));
    obj.sanggnosisObsessions:setParent(obj.flowPart210);
    obj.sanggnosisObsessions:setAlign("top");
    obj.sanggnosisObsessions:setField("fldsanggnosisObsessions");
    obj.sanggnosisObsessions:setName("sanggnosisObsessions");
    obj.sanggnosisObsessions:setFontSize(14);
    obj.sanggnosisObsessions:setFontColor("white");
    lfm_setPropAsString(obj.sanggnosisObsessions, "fontStyle",  "bold");
    obj.sanggnosisObsessions:setTextTrimming("character");
    obj.sanggnosisObsessions:setFontFamily("Constantia");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.flowPart210);
    obj.dataLink12:setField("fldsanggnosisObsessions");
    obj.dataLink12:setDefaultValue("—");
    obj.dataLink12:setName("dataLink12");

    obj.flowPart211 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart211:setParent(obj.flowLayout83);
    obj.flowPart211:setAlign("top");
    obj.flowPart211:setHeight(50);
    obj.flowPart211:setWidth(240);
    obj.flowPart211:setMargins({bottom=5});
    obj.flowPart211:setName("flowPart211");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowPart211);
    obj.label83:setFontSize(10);
    obj.label83:setTextTrimming("character");
    obj.label83:setFontFamily("Constantia");
    obj.label83:setWidth(240);
    obj.label83:setHorzTextAlign("leading");
    obj.label83:setAlign("top");
    obj.label83:setText("MANA/POR TURNO");
    obj.label83:setFontColor("#6f6f6f");
    obj.label83:setMargins({bottom=5});
    obj.label83:setName("label83");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");

    obj.sanggnosisMPR = GUI.fromHandle(_obj_newObject("label"));
    obj.sanggnosisMPR:setParent(obj.flowPart211);
    obj.sanggnosisMPR:setAlign("top");
    obj.sanggnosisMPR:setField("fldsanggnosisMPR");
    obj.sanggnosisMPR:setName("sanggnosisMPR");
    obj.sanggnosisMPR:setFontSize(14);
    obj.sanggnosisMPR:setFontColor("white");
    lfm_setPropAsString(obj.sanggnosisMPR, "fontStyle",  "bold");
    obj.sanggnosisMPR:setTextTrimming("character");
    obj.sanggnosisMPR:setFontFamily("Constantia");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.flowPart211);
    obj.dataLink13:setField("fldsanggnosisMPR");
    obj.dataLink13:setDefaultValue("—");
    obj.dataLink13:setName("dataLink13");

    obj.flowPart212 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart212:setParent(obj.flowLayout83);
    obj.flowPart212:setAlign("top");
    obj.flowPart212:setHeight(50);
    obj.flowPart212:setWidth(240);
    obj.flowPart212:setMargins({bottom=5});
    obj.flowPart212:setName("flowPart212");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.flowPart212);
    obj.label84:setFontSize(10);
    obj.label84:setTextTrimming("character");
    obj.label84:setFontFamily("Constantia");
    obj.label84:setWidth(240);
    obj.label84:setHorzTextAlign("leading");
    obj.label84:setAlign("top");
    obj.label84:setText("NÍVEL MÁXIMO DE ARCANUM (MAIOR/OUTROS)");
    obj.label84:setFontColor("#6f6f6f");
    obj.label84:setMargins({bottom=5});
    obj.label84:setName("label84");
    lfm_setPropAsString(obj.label84, "fontStyle",  "bold");

    obj.sanggnosisArcana = GUI.fromHandle(_obj_newObject("label"));
    obj.sanggnosisArcana:setParent(obj.flowPart212);
    obj.sanggnosisArcana:setAlign("top");
    obj.sanggnosisArcana:setField("fldsanggnosisArcana");
    obj.sanggnosisArcana:setName("sanggnosisArcana");
    obj.sanggnosisArcana:setFontSize(14);
    obj.sanggnosisArcana:setFontColor("white");
    lfm_setPropAsString(obj.sanggnosisArcana, "fontStyle",  "bold");
    obj.sanggnosisArcana:setTextTrimming("character");
    obj.sanggnosisArcana:setFontFamily("Constantia");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.flowPart212);
    obj.dataLink14:setField("fldsanggnosisArcana");
    obj.dataLink14:setDefaultValue("—");
    obj.dataLink14:setName("dataLink14");

    obj.flowPart213 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart213:setParent(obj.flowLayout83);
    obj.flowPart213:setAlign("top");
    obj.flowPart213:setHeight(50);
    obj.flowPart213:setWidth(240);
    obj.flowPart213:setMargins({bottom=5});
    obj.flowPart213:setName("flowPart213");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowPart213);
    obj.label85:setFontSize(10);
    obj.label85:setTextTrimming("character");
    obj.label85:setFontFamily("Constantia");
    obj.label85:setWidth(240);
    obj.label85:setHorzTextAlign("leading");
    obj.label85:setAlign("top");
    obj.label85:setText("PATTERN SCOURING");
    obj.label85:setFontColor("#6f6f6f");
    obj.label85:setMargins({bottom=5});
    obj.label85:setName("label85");
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");

    obj.sanggnosisScour = GUI.fromHandle(_obj_newObject("label"));
    obj.sanggnosisScour:setParent(obj.flowPart213);
    obj.sanggnosisScour:setAlign("top");
    obj.sanggnosisScour:setField("fldsanggnosisScour");
    obj.sanggnosisScour:setName("sanggnosisScour");
    obj.sanggnosisScour:setFontSize(14);
    obj.sanggnosisScour:setFontColor("white");
    lfm_setPropAsString(obj.sanggnosisScour, "fontStyle",  "bold");
    obj.sanggnosisScour:setTextTrimming("character");
    obj.sanggnosisScour:setFontFamily("Constantia");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.flowPart213);
    obj.dataLink15:setField("fldsanggnosisScour");
    obj.dataLink15:setDefaultValue("—");
    obj.dataLink15:setName("dataLink15");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle14);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(50);
    obj.layout41:setMargins({top=20});
    obj.layout41:setName("layout41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout42);
    obj.label86:setText("G N O S I S");
    obj.label86:setMargins({left=5});
    obj.label86:setName("label86");
    obj.label86:setFontSize(10);
    obj.label86:setFontColor("white");
    obj.label86:setTextTrimming("character");
    obj.label86:setFontFamily("Constantia");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setAlign("top");
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout41);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setAlign("left");
    obj.layout44:setMargins({left=48});
    obj.layout44:setHeight(25);
    obj.layout44:setWidth(195);
    obj.layout44:setName("layout44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout44);
    obj.layout45:setAlign("client");
    obj.layout45:setMargins({right=25});
    obj.layout45:setName("layout45");

    obj.nomeChecknomeVerso_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknomeVerso_01:setParent(obj.layout45);
    obj.nomeChecknomeVerso_01:setField("fldCheck100_01");
    obj.nomeChecknomeVerso_01:setName("nomeChecknomeVerso_01");
    obj.nomeChecknomeVerso_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknomeVerso_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknomeVerso_01:setHeight(25);
    obj.nomeChecknomeVerso_01:setWidth(14);
    obj.nomeChecknomeVerso_01:setAlign("right");
    obj.nomeChecknomeVerso_01:setMargins({left=3});
    obj.nomeChecknomeVerso_01:setAutoChange(false);

    obj.nomeChecknomeVerso_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknomeVerso_02:setParent(obj.layout45);
    obj.nomeChecknomeVerso_02:setField("fldCheck100_02");
    obj.nomeChecknomeVerso_02:setName("nomeChecknomeVerso_02");
    obj.nomeChecknomeVerso_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknomeVerso_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknomeVerso_02:setHeight(25);
    obj.nomeChecknomeVerso_02:setWidth(14);
    obj.nomeChecknomeVerso_02:setAlign("right");
    obj.nomeChecknomeVerso_02:setMargins({left=3});
    obj.nomeChecknomeVerso_02:setAutoChange(false);

    obj.nomeChecknomeVerso_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknomeVerso_03:setParent(obj.layout45);
    obj.nomeChecknomeVerso_03:setField("fldCheck100_03");
    obj.nomeChecknomeVerso_03:setName("nomeChecknomeVerso_03");
    obj.nomeChecknomeVerso_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknomeVerso_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknomeVerso_03:setHeight(25);
    obj.nomeChecknomeVerso_03:setWidth(14);
    obj.nomeChecknomeVerso_03:setAlign("right");
    obj.nomeChecknomeVerso_03:setMargins({left=3});
    obj.nomeChecknomeVerso_03:setAutoChange(false);

    obj.nomeChecknomeVerso_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknomeVerso_04:setParent(obj.layout45);
    obj.nomeChecknomeVerso_04:setField("fldCheck100_04");
    obj.nomeChecknomeVerso_04:setName("nomeChecknomeVerso_04");
    obj.nomeChecknomeVerso_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknomeVerso_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknomeVerso_04:setHeight(25);
    obj.nomeChecknomeVerso_04:setWidth(14);
    obj.nomeChecknomeVerso_04:setAlign("right");
    obj.nomeChecknomeVerso_04:setMargins({left=3});
    obj.nomeChecknomeVerso_04:setAutoChange(false);

    obj.nomeChecknomeVerso_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknomeVerso_05:setParent(obj.layout45);
    obj.nomeChecknomeVerso_05:setField("fldCheck100_05");
    obj.nomeChecknomeVerso_05:setName("nomeChecknomeVerso_05");
    obj.nomeChecknomeVerso_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknomeVerso_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknomeVerso_05:setHeight(25);
    obj.nomeChecknomeVerso_05:setWidth(14);
    obj.nomeChecknomeVerso_05:setAlign("right");
    obj.nomeChecknomeVerso_05:setMargins({left=3});
    obj.nomeChecknomeVerso_05:setAutoChange(false);

    obj.nomeChecknomeVerso_06 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknomeVerso_06:setParent(obj.layout45);
    obj.nomeChecknomeVerso_06:setField("fldCheck100_06");
    obj.nomeChecknomeVerso_06:setName("nomeChecknomeVerso_06");
    obj.nomeChecknomeVerso_06:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknomeVerso_06:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknomeVerso_06:setHeight(25);
    obj.nomeChecknomeVerso_06:setWidth(14);
    obj.nomeChecknomeVerso_06:setAlign("right");
    obj.nomeChecknomeVerso_06:setMargins({left=3});
    obj.nomeChecknomeVerso_06:setAutoChange(false);

    obj.nomeChecknomeVerso_07 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknomeVerso_07:setParent(obj.layout45);
    obj.nomeChecknomeVerso_07:setField("fldCheck100_07");
    obj.nomeChecknomeVerso_07:setName("nomeChecknomeVerso_07");
    obj.nomeChecknomeVerso_07:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknomeVerso_07:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknomeVerso_07:setHeight(25);
    obj.nomeChecknomeVerso_07:setWidth(14);
    obj.nomeChecknomeVerso_07:setAlign("right");
    obj.nomeChecknomeVerso_07:setMargins({left=3});
    obj.nomeChecknomeVerso_07:setAutoChange(false);

    obj.nomeChecknomeVerso_08 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknomeVerso_08:setParent(obj.layout45);
    obj.nomeChecknomeVerso_08:setField("fldCheck100_08");
    obj.nomeChecknomeVerso_08:setName("nomeChecknomeVerso_08");
    obj.nomeChecknomeVerso_08:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknomeVerso_08:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknomeVerso_08:setHeight(25);
    obj.nomeChecknomeVerso_08:setWidth(14);
    obj.nomeChecknomeVerso_08:setAlign("right");
    obj.nomeChecknomeVerso_08:setMargins({left=3});
    obj.nomeChecknomeVerso_08:setAutoChange(false);

    obj.nomeChecknomeVerso_09 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknomeVerso_09:setParent(obj.layout45);
    obj.nomeChecknomeVerso_09:setField("fldCheck100_09");
    obj.nomeChecknomeVerso_09:setName("nomeChecknomeVerso_09");
    obj.nomeChecknomeVerso_09:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknomeVerso_09:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknomeVerso_09:setHeight(25);
    obj.nomeChecknomeVerso_09:setWidth(14);
    obj.nomeChecknomeVerso_09:setAlign("right");
    obj.nomeChecknomeVerso_09:setMargins({left=3});
    obj.nomeChecknomeVerso_09:setAutoChange(false);

    obj.nomeChecknomeVerso_10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeChecknomeVerso_10:setParent(obj.layout45);
    obj.nomeChecknomeVerso_10:setField("fldCheck100_10");
    obj.nomeChecknomeVerso_10:setName("nomeChecknomeVerso_10");
    obj.nomeChecknomeVerso_10:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeChecknomeVerso_10:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeChecknomeVerso_10:setHeight(25);
    obj.nomeChecknomeVerso_10:setWidth(14);
    obj.nomeChecknomeVerso_10:setAlign("right");
    obj.nomeChecknomeVerso_10:setMargins({left=3});
    obj.nomeChecknomeVerso_10:setAutoChange(false);

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout44);
    obj.dataLink16:setFields({'fldCheck100_01', 'fldCheck100_02', 
																		'fldCheck100_03', 'fldCheck100_04',
																		'fldCheck100_05', 'fldCheck100_06',
																		'fldCheck100_07', 'fldCheck100_08',
																		'fldCheck100_09', 'fldCheck100_10',});
    obj.dataLink16:setName("dataLink16");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.tab5);
    obj.rectangle15:setName("rectangle15");
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("#272727");
    obj.rectangle15:setXradius(20);
    obj.rectangle15:setYradius(20);
    obj.rectangle15:setCornerType("bevel");
    obj.rectangle15:setMargins({top=10, right=10, bottom=10, left=10});

    obj.layNote = GUI.fromHandle(_obj_newObject("layout"));
    obj.layNote:setParent(obj.rectangle15);
    obj.layNote:setName("layNote");
    obj.layNote:setAlign("client");

    obj.flowLayout84 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout84:setParent(obj.layNote);
    obj.flowLayout84:setHeight(30);
    obj.flowLayout84:setMargins({top=20});
    obj.flowLayout84:setName("flowLayout84");
    obj.flowLayout84:setAlign("top");
    obj.flowLayout84:setOrientation("horizontal");
    obj.flowLayout84:setHorzAlign("center");
    obj.flowLayout84:setAutoHeight(true);
    obj.flowLayout84:setMaxControlsPerLine(3);

    obj.flowPart214 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart214:setParent(obj.flowLayout84);
    obj.flowPart214:setHeight(30);
    obj.flowPart214:setMinWidth(400);
    obj.flowPart214:setMaxWidth(1000);
    obj.flowPart214:setMargins();
    obj.flowPart214:setName("flowPart214");

    obj.flowLayout85 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout85:setParent(obj.flowPart214);
    obj.flowLayout85:setAutoHeight(false);
    obj.flowLayout85:setHeight(25);
    obj.flowLayout85:setMargins();
    obj.flowLayout85:setName("flowLayout85");
    obj.flowLayout85:setAlign("top");
    obj.flowLayout85:setOrientation("horizontal");
    obj.flowLayout85:setHorzAlign("center");
    obj.flowLayout85:setMaxControlsPerLine(3);

    obj.flowPart215 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart215:setParent(obj.flowLayout85);
    obj.flowPart215:setHeight(30);
    obj.flowPart215:setMinWidth(0);
    obj.flowPart215:setMaxWidth(325);
    obj.flowPart215:setWidth(325);
    obj.flowPart215:setName("flowPart215");

    obj.horzLine31 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine31:setParent(obj.flowPart215);
    obj.horzLine31:setName("horzLine31");
    obj.horzLine31:setStrokeColor("#424242");
    obj.horzLine31:setMargins({top=7});
    obj.horzLine31:setAlign("top");

    obj.flowPart216 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart216:setParent(obj.flowLayout85);
    obj.flowPart216:setHeight(30);
    obj.flowPart216:setWidth(170);
    obj.flowPart216:setName("flowPart216");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.flowPart216);
    obj.label87:setText("A N O T A Ç Õ E S");
    obj.label87:setName("label87");
    obj.label87:setFontSize(20);
    obj.label87:setFontColor("white");
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");
    obj.label87:setTextTrimming("character");
    obj.label87:setFontFamily("Constantia");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setAutoSize(true);
    obj.label87:setAlign("client");
    obj.label87:setMargins({bottom=7});

    obj.flowPart217 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart217:setParent(obj.flowLayout85);
    obj.flowPart217:setHeight(30);
    obj.flowPart217:setMinWidth(0);
    obj.flowPart217:setMaxWidth(325);
    obj.flowPart217:setWidth(325);
    obj.flowPart217:setName("flowPart217");

    obj.horzLine32 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine32:setParent(obj.flowPart217);
    obj.horzLine32:setName("horzLine32");
    obj.horzLine32:setStrokeColor("#424242");
    obj.horzLine32:setMargins({top=7});
    obj.horzLine32:setAlign("top");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layNote);
    obj.richEdit1:setField("Notes");
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setMargins({top=10, bottom=40, right=40, left=40});
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#272727");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj._e_event0 = obj.nomeChecknome100_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_01 = not sheet.fldCheck100_01;
            				
            				if(sheet.fldCheck100_02) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false; 
            					sheet.fldCheck100_05 = false; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event1 = obj.nomeChecknome100_02:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_02 = not sheet.fldCheck100_02;
            				
            				if(sheet.fldCheck100_02) then 
            					sheet.fldCheck100_01 = true; 
            				else 
            					sheet.fldCheck100_01 = false;
            				end;
            				
            				if(sheet.fldCheck100_03) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false; 
            					sheet.fldCheck100_05 = false; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event2 = obj.nomeChecknome100_03:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_03 = not sheet.fldCheck100_03;
            				
            				if(sheet.fldCheck100_03) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            				end;
            				
            				if(sheet.fldCheck100_04) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = false; 
            					sheet.fldCheck100_05 = false; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event3 = obj.nomeChecknome100_04:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_04 = not sheet.fldCheck100_04;
            				
            				if(sheet.fldCheck100_04) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            				end;
            				
            				if(sheet.fldCheck100_05) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = false; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event4 = obj.nomeChecknome100_05:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_05 = not sheet.fldCheck100_05;
            				
            				if(sheet.fldCheck100_05) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false;
            				end;
            				
            				if(sheet.fldCheck100_06) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event5 = obj.nomeChecknome100_06:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_06 = not sheet.fldCheck100_06;
            				
            				if(sheet.fldCheck100_06) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true;
            					sheet.fldCheck100_05 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false;
            					sheet.fldCheck100_05 = false;
            				end;
            				
            				if(sheet.fldCheck100_07) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event6 = obj.nomeChecknome100_07:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_07 = not sheet.fldCheck100_07;
            				
            				if(sheet.fldCheck100_07) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true;
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false;
            					sheet.fldCheck100_05 = false;
            					sheet.fldCheck100_06 = false; 
            				end;
            				
            				if(sheet.fldCheck100_08) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = true; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event7 = obj.nomeChecknome100_08:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_08 = not sheet.fldCheck100_08;
            				
            				if(sheet.fldCheck100_08) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true;
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false;
            					sheet.fldCheck100_05 = false;
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false;
            				end;
            				
            				if(sheet.fldCheck100_09) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = true; 
            					sheet.fldCheck100_08 = true; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event8 = obj.nomeChecknome100_09:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_09 = not sheet.fldCheck100_09;
            				
            				if(sheet.fldCheck100_09) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true;
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = true; 
            					sheet.fldCheck100_08 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false;
            					sheet.fldCheck100_05 = false;
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false;
            					sheet.fldCheck100_08 = false; 
            				end;
            				
            				if(sheet.fldCheck100_10) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = true; 
            					sheet.fldCheck100_08 = true; 
            					sheet.fldCheck100_09 = true;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event9 = obj.nomeChecknome100_10:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_10 = not sheet.fldCheck100_10;
            				
            				if(sheet.fldCheck100_10) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true;
            					sheet.fldCheck100_07 = true;
            					sheet.fldCheck100_08 = true;
            					sheet.fldCheck100_09 = true;    
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event10 = obj.nomeChecknome101_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck101_01 = not sheet.fldCheck101_01;
            				
            				if(sheet.fldCheck101_02) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = false; 
            					sheet.fldCheck101_03 = false; 
            					sheet.fldCheck101_04 = false; 
            					sheet.fldCheck101_05 = false; 
            					sheet.fldCheck101_06 = false; 
            					sheet.fldCheck101_07 = false; 
            					sheet.fldCheck101_08 = false; 
            					sheet.fldCheck101_09 = false;
            					sheet.fldCheck101_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event11 = obj.nomeChecknome101_02:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck101_02 = not sheet.fldCheck101_02;
            				
            				if(sheet.fldCheck101_02) then 
            					sheet.fldCheck101_01 = true; 
            				else 
            					sheet.fldCheck101_01 = false;
            				end;
            				
            				if(sheet.fldCheck101_03) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = false; 
            					sheet.fldCheck101_04 = false; 
            					sheet.fldCheck101_05 = false; 
            					sheet.fldCheck101_06 = false; 
            					sheet.fldCheck101_07 = false; 
            					sheet.fldCheck101_08 = false; 
            					sheet.fldCheck101_09 = false;
            					sheet.fldCheck101_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event12 = obj.nomeChecknome101_03:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck101_03 = not sheet.fldCheck101_03;
            				
            				if(sheet.fldCheck101_03) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            				else 
            					sheet.fldCheck101_01 = false; 
            					sheet.fldCheck101_02 = false; 
            				end;
            				
            				if(sheet.fldCheck101_04) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = false; 
            					sheet.fldCheck101_05 = false; 
            					sheet.fldCheck101_06 = false; 
            					sheet.fldCheck101_07 = false; 
            					sheet.fldCheck101_08 = false; 
            					sheet.fldCheck101_09 = false;
            					sheet.fldCheck101_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event13 = obj.nomeChecknome101_04:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck101_04 = not sheet.fldCheck101_04;
            				
            				if(sheet.fldCheck101_04) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            				else 
            					sheet.fldCheck101_01 = false; 
            					sheet.fldCheck101_02 = false; 
            					sheet.fldCheck101_03 = false; 
            				end;
            				
            				if(sheet.fldCheck101_05) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true; 
            					sheet.fldCheck101_05 = false; 
            					sheet.fldCheck101_06 = false; 
            					sheet.fldCheck101_07 = false; 
            					sheet.fldCheck101_08 = false; 
            					sheet.fldCheck101_09 = false;
            					sheet.fldCheck101_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event14 = obj.nomeChecknome101_05:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck101_05 = not sheet.fldCheck101_05;
            				
            				if(sheet.fldCheck101_05) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true; 
            				else 
            					sheet.fldCheck101_01 = false; 
            					sheet.fldCheck101_02 = false; 
            					sheet.fldCheck101_03 = false; 
            					sheet.fldCheck101_04 = false;
            				end;
            				
            				if(sheet.fldCheck101_06) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true; 
            					sheet.fldCheck101_05 = true; 
            					sheet.fldCheck101_06 = false; 
            					sheet.fldCheck101_07 = false; 
            					sheet.fldCheck101_08 = false; 
            					sheet.fldCheck101_09 = false;
            					sheet.fldCheck101_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event15 = obj.nomeChecknome101_06:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck101_06 = not sheet.fldCheck101_06;
            				
            				if(sheet.fldCheck101_06) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true;
            					sheet.fldCheck101_05 = true; 
            				else 
            					sheet.fldCheck101_01 = false; 
            					sheet.fldCheck101_02 = false; 
            					sheet.fldCheck101_03 = false; 
            					sheet.fldCheck101_04 = false;
            					sheet.fldCheck101_05 = false;
            				end;
            				
            				if(sheet.fldCheck101_07) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true; 
            					sheet.fldCheck101_05 = true; 
            					sheet.fldCheck101_06 = true; 
            					sheet.fldCheck101_07 = false; 
            					sheet.fldCheck101_08 = false; 
            					sheet.fldCheck101_09 = false;
            					sheet.fldCheck101_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event16 = obj.nomeChecknome101_07:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck101_07 = not sheet.fldCheck101_07;
            				
            				if(sheet.fldCheck101_07) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true;
            					sheet.fldCheck101_05 = true; 
            					sheet.fldCheck101_06 = true; 
            				else 
            					sheet.fldCheck101_01 = false; 
            					sheet.fldCheck101_02 = false; 
            					sheet.fldCheck101_03 = false; 
            					sheet.fldCheck101_04 = false;
            					sheet.fldCheck101_05 = false;
            					sheet.fldCheck101_06 = false; 
            				end;
            				
            				if(sheet.fldCheck101_08) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true; 
            					sheet.fldCheck101_05 = true; 
            					sheet.fldCheck101_06 = true; 
            					sheet.fldCheck101_07 = true; 
            					sheet.fldCheck101_08 = false; 
            					sheet.fldCheck101_09 = false;
            					sheet.fldCheck101_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event17 = obj.nomeChecknome101_08:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck101_08 = not sheet.fldCheck101_08;
            				
            				if(sheet.fldCheck101_08) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true;
            					sheet.fldCheck101_05 = true; 
            					sheet.fldCheck101_06 = true; 
            					sheet.fldCheck101_07 = true; 
            				else 
            					sheet.fldCheck101_01 = false; 
            					sheet.fldCheck101_02 = false; 
            					sheet.fldCheck101_03 = false; 
            					sheet.fldCheck101_04 = false;
            					sheet.fldCheck101_05 = false;
            					sheet.fldCheck101_06 = false; 
            					sheet.fldCheck101_07 = false;
            				end;
            				
            				if(sheet.fldCheck101_09) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true; 
            					sheet.fldCheck101_05 = true; 
            					sheet.fldCheck101_06 = true; 
            					sheet.fldCheck101_07 = true; 
            					sheet.fldCheck101_08 = true; 
            					sheet.fldCheck101_09 = false;
            					sheet.fldCheck101_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event18 = obj.nomeChecknome101_09:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck101_09 = not sheet.fldCheck101_09;
            				
            				if(sheet.fldCheck101_09) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true;
            					sheet.fldCheck101_05 = true; 
            					sheet.fldCheck101_06 = true; 
            					sheet.fldCheck101_07 = true; 
            					sheet.fldCheck101_08 = true; 
            				else 
            					sheet.fldCheck101_01 = false; 
            					sheet.fldCheck101_02 = false; 
            					sheet.fldCheck101_03 = false; 
            					sheet.fldCheck101_04 = false;
            					sheet.fldCheck101_05 = false;
            					sheet.fldCheck101_06 = false; 
            					sheet.fldCheck101_07 = false;
            					sheet.fldCheck101_08 = false; 
            				end;
            				
            				if(sheet.fldCheck101_10) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true; 
            					sheet.fldCheck101_05 = true; 
            					sheet.fldCheck101_06 = true; 
            					sheet.fldCheck101_07 = true; 
            					sheet.fldCheck101_08 = true; 
            					sheet.fldCheck101_09 = true;
            					sheet.fldCheck101_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event19 = obj.nomeChecknome101_10:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck101_10 = not sheet.fldCheck101_10;
            				
            				if(sheet.fldCheck101_10) then 
            					sheet.fldCheck101_01 = true; 
            					sheet.fldCheck101_02 = true; 
            					sheet.fldCheck101_03 = true; 
            					sheet.fldCheck101_04 = true; 
            					sheet.fldCheck101_05 = true; 
            					sheet.fldCheck101_06 = true;
            					sheet.fldCheck101_07 = true;
            					sheet.fldCheck101_08 = true;
            					sheet.fldCheck101_09 = true;    
            				else 
            					sheet.fldCheck101_01 = false; 
            					sheet.fldCheck101_02 = false; 
            					sheet.fldCheck101_03 = false; 
            					sheet.fldCheck101_04 = false; 
            					sheet.fldCheck101_06 = false; 
            					sheet.fldCheck101_07 = false; 
            					sheet.fldCheck101_08 = false; 
            					sheet.fldCheck101_09 = false;
            					sheet.fldCheck101_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event20 = obj.nomeCheck07_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck07_01 = not sheet.fldCheck07_01;
            				
            				if(sheet.fldCheck07_02) then 
            					sheet.fldCheck07_01 = true; 
            					sheet.fldCheck07_02 = false; 
            					sheet.fldCheck07_03 = false; 
            					sheet.fldCheck07_04 = false; 
            					sheet.fldCheck07_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event21 = obj.nomeCheck07_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event22 = obj.nomeCheck07_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event23 = obj.nomeCheck07_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event24 = obj.nomeCheck07_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event25 = obj.nomeCheck08_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck08_01 = not sheet.fldCheck08_01;
            				
            				if(sheet.fldCheck08_02) then 
            					sheet.fldCheck08_01 = true; 
            					sheet.fldCheck08_02 = false; 
            					sheet.fldCheck08_03 = false; 
            					sheet.fldCheck08_04 = false; 
            					sheet.fldCheck08_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event26 = obj.nomeCheck08_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event27 = obj.nomeCheck08_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event28 = obj.nomeCheck08_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event29 = obj.nomeCheck08_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event30 = obj.nomeCheck09_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck09_01 = not sheet.fldCheck09_01;
            				
            				if(sheet.fldCheck09_02) then 
            					sheet.fldCheck09_01 = true; 
            					sheet.fldCheck09_02 = false; 
            					sheet.fldCheck09_03 = false; 
            					sheet.fldCheck09_04 = false; 
            					sheet.fldCheck09_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event31 = obj.nomeCheck09_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event32 = obj.nomeCheck09_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event33 = obj.nomeCheck09_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event34 = obj.nomeCheck09_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event35 = obj.nomeCheck01_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck01_01 = not sheet.fldCheck01_01;
            				
            				if(sheet.fldCheck01_02) then 
            					sheet.fldCheck01_01 = true; 
            					sheet.fldCheck01_02 = false; 
            					sheet.fldCheck01_03 = false; 
            					sheet.fldCheck01_04 = false; 
            					sheet.fldCheck01_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event36 = obj.nomeCheck01_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event37 = obj.nomeCheck01_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event38 = obj.nomeCheck01_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event39 = obj.nomeCheck01_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event40 = obj.nomeCheck02_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck02_01 = not sheet.fldCheck02_01;
            				
            				if(sheet.fldCheck02_02) then 
            					sheet.fldCheck02_01 = true; 
            					sheet.fldCheck02_02 = false; 
            					sheet.fldCheck02_03 = false; 
            					sheet.fldCheck02_04 = false; 
            					sheet.fldCheck02_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event41 = obj.nomeCheck02_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event42 = obj.nomeCheck02_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event43 = obj.nomeCheck02_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event44 = obj.nomeCheck02_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event45 = obj.nomeCheck03_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck03_01 = not sheet.fldCheck03_01;
            				
            				if(sheet.fldCheck03_02) then 
            					sheet.fldCheck03_01 = true; 
            					sheet.fldCheck03_02 = false; 
            					sheet.fldCheck03_03 = false; 
            					sheet.fldCheck03_04 = false; 
            					sheet.fldCheck03_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event46 = obj.nomeCheck03_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event47 = obj.nomeCheck03_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event48 = obj.nomeCheck03_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event49 = obj.nomeCheck03_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event50 = obj.nomeCheck04_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck04_01 = not sheet.fldCheck04_01;
            				
            				if(sheet.fldCheck04_02) then 
            					sheet.fldCheck04_01 = true; 
            					sheet.fldCheck04_02 = false; 
            					sheet.fldCheck04_03 = false; 
            					sheet.fldCheck04_04 = false; 
            					sheet.fldCheck04_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event51 = obj.nomeCheck04_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event52 = obj.nomeCheck04_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event53 = obj.nomeCheck04_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event54 = obj.nomeCheck04_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event55 = obj.nomeCheck05_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck05_01 = not sheet.fldCheck05_01;
            				
            				if(sheet.fldCheck05_02) then 
            					sheet.fldCheck05_01 = true; 
            					sheet.fldCheck05_02 = false; 
            					sheet.fldCheck05_03 = false; 
            					sheet.fldCheck05_04 = false; 
            					sheet.fldCheck05_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event56 = obj.nomeCheck05_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event57 = obj.nomeCheck05_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event58 = obj.nomeCheck05_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event59 = obj.nomeCheck05_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event60 = obj.nomeCheck06_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck06_01 = not sheet.fldCheck06_01;
            				
            				if(sheet.fldCheck06_02) then 
            					sheet.fldCheck06_01 = true; 
            					sheet.fldCheck06_02 = false; 
            					sheet.fldCheck06_03 = false; 
            					sheet.fldCheck06_04 = false; 
            					sheet.fldCheck06_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event61 = obj.nomeCheck06_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event62 = obj.nomeCheck06_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event63 = obj.nomeCheck06_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event64 = obj.nomeCheck06_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event65 = obj.nomeCheck10_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck10_01 = not sheet.fldCheck10_01;
            				
            				if(sheet.fldCheck10_02) then 
            					sheet.fldCheck10_01 = true; 
            					sheet.fldCheck10_02 = false; 
            					sheet.fldCheck10_03 = false; 
            					sheet.fldCheck10_04 = false; 
            					sheet.fldCheck10_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event66 = obj.nomeCheck10_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event67 = obj.nomeCheck10_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event68 = obj.nomeCheck10_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event69 = obj.nomeCheck10_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event70 = obj.nomeCheck11_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck11_01 = not sheet.fldCheck11_01;
            				
            				if(sheet.fldCheck11_02) then 
            					sheet.fldCheck11_01 = true; 
            					sheet.fldCheck11_02 = false; 
            					sheet.fldCheck11_03 = false; 
            					sheet.fldCheck11_04 = false; 
            					sheet.fldCheck11_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event71 = obj.nomeCheck11_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event72 = obj.nomeCheck11_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event73 = obj.nomeCheck11_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event74 = obj.nomeCheck11_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event75 = obj.nomeCheck12_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck12_01 = not sheet.fldCheck12_01;
            				
            				if(sheet.fldCheck12_02) then 
            					sheet.fldCheck12_01 = true; 
            					sheet.fldCheck12_02 = false; 
            					sheet.fldCheck12_03 = false; 
            					sheet.fldCheck12_04 = false; 
            					sheet.fldCheck12_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event76 = obj.nomeCheck12_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event77 = obj.nomeCheck12_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event78 = obj.nomeCheck12_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event79 = obj.nomeCheck12_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event80 = obj.nomeCheck13_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck13_01 = not sheet.fldCheck13_01;
            				
            				if(sheet.fldCheck13_02) then 
            					sheet.fldCheck13_01 = true; 
            					sheet.fldCheck13_02 = false; 
            					sheet.fldCheck13_03 = false; 
            					sheet.fldCheck13_04 = false; 
            					sheet.fldCheck13_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event81 = obj.nomeCheck13_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event82 = obj.nomeCheck13_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event83 = obj.nomeCheck13_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event84 = obj.nomeCheck13_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event85 = obj.nomeCheck14_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck14_01 = not sheet.fldCheck14_01;
            				
            				if(sheet.fldCheck14_02) then 
            					sheet.fldCheck14_01 = true; 
            					sheet.fldCheck14_02 = false; 
            					sheet.fldCheck14_03 = false; 
            					sheet.fldCheck14_04 = false; 
            					sheet.fldCheck14_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event86 = obj.nomeCheck14_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event87 = obj.nomeCheck14_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event88 = obj.nomeCheck14_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event89 = obj.nomeCheck14_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event90 = obj.nomeCheck15_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck15_01 = not sheet.fldCheck15_01;
            				
            				if(sheet.fldCheck15_02) then 
            					sheet.fldCheck15_01 = true; 
            					sheet.fldCheck15_02 = false; 
            					sheet.fldCheck15_03 = false; 
            					sheet.fldCheck15_04 = false; 
            					sheet.fldCheck15_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event91 = obj.nomeCheck15_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event92 = obj.nomeCheck15_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event93 = obj.nomeCheck15_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event94 = obj.nomeCheck15_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event95 = obj.nomeCheck16_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck16_01 = not sheet.fldCheck16_01;
            				
            				if(sheet.fldCheck16_02) then 
            					sheet.fldCheck16_01 = true; 
            					sheet.fldCheck16_02 = false; 
            					sheet.fldCheck16_03 = false; 
            					sheet.fldCheck16_04 = false; 
            					sheet.fldCheck16_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event96 = obj.nomeCheck16_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event97 = obj.nomeCheck16_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event98 = obj.nomeCheck16_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event99 = obj.nomeCheck16_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event100 = obj.nomeCheck17_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck17_01 = not sheet.fldCheck17_01;
            				
            				if(sheet.fldCheck17_02) then 
            					sheet.fldCheck17_01 = true; 
            					sheet.fldCheck17_02 = false; 
            					sheet.fldCheck17_03 = false; 
            					sheet.fldCheck17_04 = false; 
            					sheet.fldCheck17_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event101 = obj.nomeCheck17_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event102 = obj.nomeCheck17_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event103 = obj.nomeCheck17_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event104 = obj.nomeCheck17_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event105 = obj.nomeCheck19_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck19_01 = not sheet.fldCheck19_01;
            				
            				if(sheet.fldCheck19_02) then 
            					sheet.fldCheck19_01 = true; 
            					sheet.fldCheck19_02 = false; 
            					sheet.fldCheck19_03 = false; 
            					sheet.fldCheck19_04 = false; 
            					sheet.fldCheck19_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event106 = obj.nomeCheck19_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event107 = obj.nomeCheck19_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event108 = obj.nomeCheck19_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event109 = obj.nomeCheck19_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event110 = obj.nomeCheck20_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck20_01 = not sheet.fldCheck20_01;
            				
            				if(sheet.fldCheck20_02) then 
            					sheet.fldCheck20_01 = true; 
            					sheet.fldCheck20_02 = false; 
            					sheet.fldCheck20_03 = false; 
            					sheet.fldCheck20_04 = false; 
            					sheet.fldCheck20_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event111 = obj.nomeCheck20_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event112 = obj.nomeCheck20_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event113 = obj.nomeCheck20_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event114 = obj.nomeCheck20_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event115 = obj.nomeCheck21_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck21_01 = not sheet.fldCheck21_01;
            				
            				if(sheet.fldCheck21_02) then 
            					sheet.fldCheck21_01 = true; 
            					sheet.fldCheck21_02 = false; 
            					sheet.fldCheck21_03 = false; 
            					sheet.fldCheck21_04 = false; 
            					sheet.fldCheck21_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event116 = obj.nomeCheck21_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event117 = obj.nomeCheck21_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event118 = obj.nomeCheck21_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event119 = obj.nomeCheck21_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event120 = obj.nomeCheck22_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck22_01 = not sheet.fldCheck22_01;
            				
            				if(sheet.fldCheck22_02) then 
            					sheet.fldCheck22_01 = true; 
            					sheet.fldCheck22_02 = false; 
            					sheet.fldCheck22_03 = false; 
            					sheet.fldCheck22_04 = false; 
            					sheet.fldCheck22_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event121 = obj.nomeCheck22_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event122 = obj.nomeCheck22_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event123 = obj.nomeCheck22_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event124 = obj.nomeCheck22_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event125 = obj.nomeCheck23_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck23_01 = not sheet.fldCheck23_01;
            				
            				if(sheet.fldCheck23_02) then 
            					sheet.fldCheck23_01 = true; 
            					sheet.fldCheck23_02 = false; 
            					sheet.fldCheck23_03 = false; 
            					sheet.fldCheck23_04 = false; 
            					sheet.fldCheck23_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event126 = obj.nomeCheck23_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event127 = obj.nomeCheck23_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event128 = obj.nomeCheck23_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event129 = obj.nomeCheck23_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event130 = obj.nomeCheck24_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck24_01 = not sheet.fldCheck24_01;
            				
            				if(sheet.fldCheck24_02) then 
            					sheet.fldCheck24_01 = true; 
            					sheet.fldCheck24_02 = false; 
            					sheet.fldCheck24_03 = false; 
            					sheet.fldCheck24_04 = false; 
            					sheet.fldCheck24_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event131 = obj.nomeCheck24_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event132 = obj.nomeCheck24_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event133 = obj.nomeCheck24_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event134 = obj.nomeCheck24_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event135 = obj.nomeCheck25_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck25_01 = not sheet.fldCheck25_01;
            				
            				if(sheet.fldCheck25_02) then 
            					sheet.fldCheck25_01 = true; 
            					sheet.fldCheck25_02 = false; 
            					sheet.fldCheck25_03 = false; 
            					sheet.fldCheck25_04 = false; 
            					sheet.fldCheck25_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event136 = obj.nomeCheck25_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event137 = obj.nomeCheck25_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event138 = obj.nomeCheck25_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event139 = obj.nomeCheck25_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event140 = obj.nomeCheck26_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck26_01 = not sheet.fldCheck26_01;
            				
            				if(sheet.fldCheck26_02) then 
            					sheet.fldCheck26_01 = true; 
            					sheet.fldCheck26_02 = false; 
            					sheet.fldCheck26_03 = false; 
            					sheet.fldCheck26_04 = false; 
            					sheet.fldCheck26_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event141 = obj.nomeCheck26_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event142 = obj.nomeCheck26_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event143 = obj.nomeCheck26_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event144 = obj.nomeCheck26_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event145 = obj.nomeCheck28_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck28_01 = not sheet.fldCheck28_01;
            				
            				if(sheet.fldCheck28_02) then 
            					sheet.fldCheck28_01 = true; 
            					sheet.fldCheck28_02 = false; 
            					sheet.fldCheck28_03 = false; 
            					sheet.fldCheck28_04 = false; 
            					sheet.fldCheck28_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event146 = obj.nomeCheck28_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event147 = obj.nomeCheck28_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event148 = obj.nomeCheck28_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event149 = obj.nomeCheck28_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event150 = obj.nomeCheck29_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck29_01 = not sheet.fldCheck29_01;
            				
            				if(sheet.fldCheck29_02) then 
            					sheet.fldCheck29_01 = true; 
            					sheet.fldCheck29_02 = false; 
            					sheet.fldCheck29_03 = false; 
            					sheet.fldCheck29_04 = false; 
            					sheet.fldCheck29_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event151 = obj.nomeCheck29_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event152 = obj.nomeCheck29_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event153 = obj.nomeCheck29_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event154 = obj.nomeCheck29_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event155 = obj.nomeCheck30_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck30_01 = not sheet.fldCheck30_01;
            				
            				if(sheet.fldCheck30_02) then 
            					sheet.fldCheck30_01 = true; 
            					sheet.fldCheck30_02 = false; 
            					sheet.fldCheck30_03 = false; 
            					sheet.fldCheck30_04 = false; 
            					sheet.fldCheck30_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event156 = obj.nomeCheck30_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event157 = obj.nomeCheck30_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event158 = obj.nomeCheck30_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event159 = obj.nomeCheck30_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event160 = obj.nomeCheck31_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck31_01 = not sheet.fldCheck31_01;
            				
            				if(sheet.fldCheck31_02) then 
            					sheet.fldCheck31_01 = true; 
            					sheet.fldCheck31_02 = false; 
            					sheet.fldCheck31_03 = false; 
            					sheet.fldCheck31_04 = false; 
            					sheet.fldCheck31_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event161 = obj.nomeCheck31_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event162 = obj.nomeCheck31_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event163 = obj.nomeCheck31_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event164 = obj.nomeCheck31_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event165 = obj.nomeCheck32_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck32_01 = not sheet.fldCheck32_01;
            				
            				if(sheet.fldCheck32_02) then 
            					sheet.fldCheck32_01 = true; 
            					sheet.fldCheck32_02 = false; 
            					sheet.fldCheck32_03 = false; 
            					sheet.fldCheck32_04 = false; 
            					sheet.fldCheck32_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event166 = obj.nomeCheck32_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event167 = obj.nomeCheck32_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event168 = obj.nomeCheck32_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event169 = obj.nomeCheck32_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event170 = obj.nomeCheck33_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck33_01 = not sheet.fldCheck33_01;
            				
            				if(sheet.fldCheck33_02) then 
            					sheet.fldCheck33_01 = true; 
            					sheet.fldCheck33_02 = false; 
            					sheet.fldCheck33_03 = false; 
            					sheet.fldCheck33_04 = false; 
            					sheet.fldCheck33_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event171 = obj.nomeCheck33_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event172 = obj.nomeCheck33_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event173 = obj.nomeCheck33_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event174 = obj.nomeCheck33_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event175 = obj.nomeCheck34_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck34_01 = not sheet.fldCheck34_01;
            				
            				if(sheet.fldCheck34_02) then 
            					sheet.fldCheck34_01 = true; 
            					sheet.fldCheck34_02 = false; 
            					sheet.fldCheck34_03 = false; 
            					sheet.fldCheck34_04 = false; 
            					sheet.fldCheck34_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event176 = obj.nomeCheck34_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event177 = obj.nomeCheck34_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event178 = obj.nomeCheck34_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event179 = obj.nomeCheck34_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event180 = obj.nomeCheck35_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck35_01 = not sheet.fldCheck35_01;
            				
            				if(sheet.fldCheck35_02) then 
            					sheet.fldCheck35_01 = true; 
            					sheet.fldCheck35_02 = false; 
            					sheet.fldCheck35_03 = false; 
            					sheet.fldCheck35_04 = false; 
            					sheet.fldCheck35_05 = false; 
            				end;
            			
        end, obj);

    obj._e_event181 = obj.nomeCheck35_02:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event182 = obj.nomeCheck35_03:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event183 = obj.nomeCheck35_04:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event184 = obj.nomeCheck35_05:addEventListener("onClick",
        function (_, event)
            
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

    obj._e_event185 = obj.nomeCheck_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_01 = not sheet.fldCheck_01;
            				
            				if(sheet.fldCheck_02) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = false; 
            					sheet.fldCheck_03 = false; 
            					sheet.fldCheck_04 = false; 
            					sheet.fldCheck_05 = false; 
            					sheet.fldCheck_06 = false; 
            					sheet.fldCheck_07 = false; 
            					sheet.fldCheck_08 = false; 
            					sheet.fldCheck_09 = false;
            					sheet.fldCheck_10 = false; 
            					sheet.fldCheck_11 = false; 
            					sheet.fldCheck_12 = false;  
            				end;
            			
        end, obj);

    obj._e_event186 = obj.nomeCheck_02:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_02 = not sheet.fldCheck_02;
            				
            				if(sheet.fldCheck_02) then 
            					sheet.fldCheck_01 = true; 
            				else 
            					sheet.fldCheck_01 = false;
            				end;
            				
            				if(sheet.fldCheck_03) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = false; 
            					sheet.fldCheck_04 = false; 
            					sheet.fldCheck_05 = false; 
            					sheet.fldCheck_06 = false; 
            					sheet.fldCheck_07 = false; 
            					sheet.fldCheck_08 = false; 
            					sheet.fldCheck_09 = false;
            					sheet.fldCheck_10 = false;  
            					sheet.fldCheck_11 = false; 
            					sheet.fldCheck_12 = false; 
            				end;
            			
        end, obj);

    obj._e_event187 = obj.nomeCheck_03:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_03 = not sheet.fldCheck_03;
            				
            				if(sheet.fldCheck_03) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            				else 
            					sheet.fldCheck_01 = false; 
            					sheet.fldCheck_02 = false; 
            				end;
            				
            				if(sheet.fldCheck_04) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = false; 
            					sheet.fldCheck_05 = false; 
            					sheet.fldCheck_06 = false; 
            					sheet.fldCheck_07 = false; 
            					sheet.fldCheck_08 = false; 
            					sheet.fldCheck_09 = false;
            					sheet.fldCheck_10 = false;  
            					sheet.fldCheck_11 = false; 
            					sheet.fldCheck_12 = false; 
            				end;
            			
        end, obj);

    obj._e_event188 = obj.nomeCheck_04:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_04 = not sheet.fldCheck_04;
            				
            				if(sheet.fldCheck_04) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            				else 
            					sheet.fldCheck_01 = false; 
            					sheet.fldCheck_02 = false; 
            					sheet.fldCheck_03 = false; 
            				end;
            				
            				if(sheet.fldCheck_05) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true; 
            					sheet.fldCheck_05 = false; 
            					sheet.fldCheck_06 = false; 
            					sheet.fldCheck_07 = false; 
            					sheet.fldCheck_08 = false; 
            					sheet.fldCheck_09 = false;
            					sheet.fldCheck_10 = false;  
            					sheet.fldCheck_11 = false; 
            					sheet.fldCheck_12 = false; 
            				end;
            			
        end, obj);

    obj._e_event189 = obj.nomeCheck_05:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_05 = not sheet.fldCheck_05;
            				
            				if(sheet.fldCheck_05) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true; 
            				else 
            					sheet.fldCheck_01 = false; 
            					sheet.fldCheck_02 = false; 
            					sheet.fldCheck_03 = false; 
            					sheet.fldCheck_04 = false;
            				end;
            				
            				if(sheet.fldCheck_06) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true; 
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = false; 
            					sheet.fldCheck_07 = false; 
            					sheet.fldCheck_08 = false; 
            					sheet.fldCheck_09 = false;
            					sheet.fldCheck_10 = false;  
            					sheet.fldCheck_11 = false; 
            					sheet.fldCheck_12 = false; 
            				end;
            			
        end, obj);

    obj._e_event190 = obj.nomeCheck_06:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_06 = not sheet.fldCheck_06;
            				
            				if(sheet.fldCheck_06) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true;
            					sheet.fldCheck_05 = true; 
            				else 
            					sheet.fldCheck_01 = false; 
            					sheet.fldCheck_02 = false; 
            					sheet.fldCheck_03 = false; 
            					sheet.fldCheck_04 = false;
            					sheet.fldCheck_05 = false;
            				end;
            				
            				if(sheet.fldCheck_07) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true; 
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true; 
            					sheet.fldCheck_07 = false; 
            					sheet.fldCheck_08 = false; 
            					sheet.fldCheck_09 = false;
            					sheet.fldCheck_10 = false;  
            					sheet.fldCheck_11 = false; 
            					sheet.fldCheck_12 = false; 
            				end;
            			
        end, obj);

    obj._e_event191 = obj.nomeCheck_07:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_07 = not sheet.fldCheck_07;
            				
            				if(sheet.fldCheck_07) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true;
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true; 
            				else 
            					sheet.fldCheck_01 = false; 
            					sheet.fldCheck_02 = false; 
            					sheet.fldCheck_03 = false; 
            					sheet.fldCheck_04 = false;
            					sheet.fldCheck_05 = false;
            					sheet.fldCheck_06 = false; 
            				end;
            				
            				if(sheet.fldCheck_08) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true; 
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true; 
            					sheet.fldCheck_07 = true; 
            					sheet.fldCheck_08 = false; 
            					sheet.fldCheck_09 = false;
            					sheet.fldCheck_10 = false;  
            					sheet.fldCheck_11 = false; 
            					sheet.fldCheck_12 = false; 
            				end;
            			
        end, obj);

    obj._e_event192 = obj.nomeCheck_08:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_08 = not sheet.fldCheck_08;
            				
            				if(sheet.fldCheck_08) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true;
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true; 
            					sheet.fldCheck_07 = true; 
            				else 
            					sheet.fldCheck_01 = false; 
            					sheet.fldCheck_02 = false; 
            					sheet.fldCheck_03 = false; 
            					sheet.fldCheck_04 = false;
            					sheet.fldCheck_05 = false;
            					sheet.fldCheck_06 = false; 
            					sheet.fldCheck_07 = false;
            				end;
            				
            				if(sheet.fldCheck_09) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true; 
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true; 
            					sheet.fldCheck_07 = true; 
            					sheet.fldCheck_08 = true; 
            					sheet.fldCheck_09 = false;
            					sheet.fldCheck_10 = false;  
            					sheet.fldCheck_11 = false; 
            					sheet.fldCheck_12 = false; 
            				end;
            			
        end, obj);

    obj._e_event193 = obj.nomeCheck_09:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_09 = not sheet.fldCheck_09;
            				
            				if(sheet.fldCheck_09) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true;
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true; 
            					sheet.fldCheck_07 = true; 
            					sheet.fldCheck_08 = true; 
            				else 
            					sheet.fldCheck_01 = false; 
            					sheet.fldCheck_02 = false; 
            					sheet.fldCheck_03 = false; 
            					sheet.fldCheck_04 = false;
            					sheet.fldCheck_05 = false;
            					sheet.fldCheck_06 = false; 
            					sheet.fldCheck_07 = false;
            					sheet.fldCheck_08 = false; 
            				end;
            				
            				if(sheet.fldCheck_10) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true; 
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true; 
            					sheet.fldCheck_07 = true; 
            					sheet.fldCheck_08 = true; 
            					sheet.fldCheck_09 = true;
            					sheet.fldCheck_10 = false;  
            					sheet.fldCheck_11 = false; 
            					sheet.fldCheck_12 = false; 
            				end;
            			
        end, obj);

    obj._e_event194 = obj.nomeCheck_10:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_10 = not sheet.fldCheck_10;
            				
            				if(sheet.fldCheck_10) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true;
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true; 
            					sheet.fldCheck_07 = true; 
            					sheet.fldCheck_08 = true; 
            					sheet.fldCheck_09 = true;
            				else 
            					sheet.fldCheck_01 = false; 
            					sheet.fldCheck_02 = false; 
            					sheet.fldCheck_03 = false; 
            					sheet.fldCheck_04 = false;
            					sheet.fldCheck_05 = false;
            					sheet.fldCheck_06 = false; 
            					sheet.fldCheck_07 = false;
            					sheet.fldCheck_08 = false; 
            					sheet.fldCheck_09 = false;
            				end;
            				
            				if(sheet.fldCheck_11) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true; 
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true; 
            					sheet.fldCheck_07 = true; 
            					sheet.fldCheck_08 = true; 
            					sheet.fldCheck_09 = true;
            					sheet.fldCheck_10 = true;  
            					sheet.fldCheck_11 = false; 
            					sheet.fldCheck_12 = false; 
            				end;
            			
        end, obj);

    obj._e_event195 = obj.nomeCheck_11:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_11 = not sheet.fldCheck_11;
            				
            				if(sheet.fldCheck_11) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true;
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true; 
            					sheet.fldCheck_07 = true; 
            					sheet.fldCheck_08 = true; 
            					sheet.fldCheck_09 = true;
            					sheet.fldCheck_10 = true;  
            				else 
            					sheet.fldCheck_01 = false; 
            					sheet.fldCheck_02 = false; 
            					sheet.fldCheck_03 = false; 
            					sheet.fldCheck_04 = false;
            					sheet.fldCheck_05 = false;
            					sheet.fldCheck_06 = false; 
            					sheet.fldCheck_07 = false;
            					sheet.fldCheck_08 = false; 
            					sheet.fldCheck_09 = false;
            					sheet.fldCheck_10 = false;
            				end;
            				
            				if(sheet.fldCheck_12) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true; 
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true; 
            					sheet.fldCheck_07 = true; 
            					sheet.fldCheck_08 = true; 
            					sheet.fldCheck_09 = true;
            					sheet.fldCheck_10 = true;  
            					sheet.fldCheck_11 = true; 
            					sheet.fldCheck_12 = false; 
            				end;
            			
        end, obj);

    obj._e_event196 = obj.nomeCheck_12:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck_12 = not sheet.fldCheck_12;
            				
            				if(sheet.fldCheck_12) then 
            					sheet.fldCheck_01 = true; 
            					sheet.fldCheck_02 = true; 
            					sheet.fldCheck_03 = true; 
            					sheet.fldCheck_04 = true; 
            					sheet.fldCheck_05 = true; 
            					sheet.fldCheck_06 = true;
            					sheet.fldCheck_07 = true;
            					sheet.fldCheck_08 = true;
            					sheet.fldCheck_09 = true;   
            					sheet.fldCheck_10 = true;  
            					sheet.fldCheck_11 = true;  
            				else 
            					sheet.fldCheck_01 = false; 
            					sheet.fldCheck_02 = false; 
            					sheet.fldCheck_03 = false; 
            					sheet.fldCheck_04 = false; 
            					sheet.fldCheck_06 = false; 
            					sheet.fldCheck_07 = false; 
            					sheet.fldCheck_08 = false; 
            					sheet.fldCheck_09 = false;
            					sheet.fldCheck_10 = false; 
            					sheet.fldCheck_11 = false; 
            					sheet.fldCheck_12 = false;  
            				end;
            			
        end, obj);

    obj._e_event197 = obj.button1:addEventListener("onClick",
        function (_, event)
            self.rclArmas:append();
        end, obj);

    obj._e_event198 = obj.rclArmas:addEventListener("onSelect",
        function (_)
            self.rclArmas:sort();
        end, obj);

    obj._e_event199 = obj.rclArmas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldDis_Disc00, nodeB.fldDis_Disc00);
        end, obj);

    obj._e_event200 = obj.button2:addEventListener("onClick",
        function (_, event)
            self.rclrotes:append();
        end, obj);

    obj._e_event201 = obj.rclrotes:addEventListener("onItemRemoved",
        function (_, node, form)
            self.layMagias:needRepaint();
        end, obj);

    obj._e_event202 = obj.rclrotes:addEventListener("onSelect",
        function (_)
            self.rclrotes:sort();
        end, obj);

    obj._e_event203 = obj.rclrotes:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldrotes, nodeB.fldrotes);
        end, obj);

    obj._e_event204 = obj.button3:addEventListener("onClick",
        function (_, event)
            self.rclpraxis:append();
        end, obj);

    obj._e_event205 = obj.rclpraxis:addEventListener("onItemRemoved",
        function (_, node, form)
            self.layMagias:needRepaint();
        end, obj);

    obj._e_event206 = obj.rclpraxis:addEventListener("onSelect",
        function (_)
            self.rclpraxis:sort();
        end, obj);

    obj._e_event207 = obj.rclpraxis:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldpraxis, nodeB.fldpraxis);
        end, obj);

    obj._e_event208 = obj.button4:addEventListener("onClick",
        function (_, event)
            self.rclactspells:append();
        end, obj);

    obj._e_event209 = obj.rclactspells:addEventListener("onItemRemoved",
        function (_, node, form)
            self.layMagias:needRepaint();
        end, obj);

    obj._e_event210 = obj.rclactspells:addEventListener("onSelect",
        function (_)
            self.rclactspells:sort();
        end, obj);

    obj._e_event211 = obj.rclactspells:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldactspells, nodeB.fldactspells);
        end, obj);

    obj._e_event212 = obj.button5:addEventListener("onClick",
        function (_, event)
            self.rclinspells:append();
        end, obj);

    obj._e_event213 = obj.rclinspells:addEventListener("onItemRemoved",
        function (_, node, form)
            self.layMagias:needRepaint();
        end, obj);

    obj._e_event214 = obj.rclinspells:addEventListener("onSelect",
        function (_)
            self.rclinspells:sort();
        end, obj);

    obj._e_event215 = obj.rclinspells:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldinspells, nodeB.fldinspells);
        end, obj);

    obj._e_event216 = obj.button6:addEventListener("onClick",
        function (_, event)
            self.rclLegacy:append();
        end, obj);

    obj._e_event217 = obj.rclLegacy:addEventListener("onItemRemoved",
        function (_, node, form)
            self.layMagias:needRepaint();
        end, obj);

    obj._e_event218 = obj.rclLegacy:addEventListener("onSelect",
        function (_)
            self.rclLegacy:sort();
        end, obj);

    obj._e_event219 = obj.rclLegacy:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldLegacy, nodeB.fldLegacy);
        end, obj);

    obj._e_event220 = obj.button7:addEventListener("onClick",
        function (_, event)
            self.rclArcane:append();
        end, obj);

    obj._e_event221 = obj.rclArcane:addEventListener("onItemRemoved",
        function (_, node, form)
            self.layMagias:needRepaint();
        end, obj);

    obj._e_event222 = obj.rclArcane:addEventListener("onSelect",
        function (_)
            self.rclArcane:sort();
        end, obj);

    obj._e_event223 = obj.rclArcane:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldArcane, nodeB.fldArcane);
        end, obj);

    obj._e_event224 = obj.rclArcana:addEventListener("onItemRemoved",
        function (_, node, form)
            self.layPersonagem:needRepaint();
        end, obj);

    obj._e_event225 = obj.rclArcana:addEventListener("onSelect",
        function (_)
            self.rclArcana:sort();
        end, obj);

    obj._e_event226 = obj.rclArcana:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldArcana, nodeB.fldArcana);
        end, obj);

    obj._e_event227 = obj.button8:addEventListener("onClick",
        function (_, event)
            self.rclArcana:append();
        end, obj);

    obj._e_event228 = obj.rclMerits:addEventListener("onItemRemoved",
        function (_, node, form)
            self.layPersonagem:needRepaint();
        end, obj);

    obj._e_event229 = obj.rclMerits:addEventListener("onSelect",
        function (_)
            self.rclMerits:sort();
        end, obj);

    obj._e_event230 = obj.rclMerits:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldMerits, nodeB.fldMerits);
        end, obj);

    obj._e_event231 = obj.button9:addEventListener("onClick",
        function (_, event)
            self.rclMerits:append();
        end, obj);

    obj._e_event232 = obj.nomeChecknomeVerso_01:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_01 = not sheet.fldCheck100_01;
            				
            				if(sheet.fldCheck100_02) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false; 
            					sheet.fldCheck100_05 = false; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event233 = obj.nomeChecknomeVerso_02:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_02 = not sheet.fldCheck100_02;
            				
            				if(sheet.fldCheck100_02) then 
            					sheet.fldCheck100_01 = true; 
            				else 
            					sheet.fldCheck100_01 = false;
            				end;
            				
            				if(sheet.fldCheck100_03) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false; 
            					sheet.fldCheck100_05 = false; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event234 = obj.nomeChecknomeVerso_03:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_03 = not sheet.fldCheck100_03;
            				
            				if(sheet.fldCheck100_03) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            				end;
            				
            				if(sheet.fldCheck100_04) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = false; 
            					sheet.fldCheck100_05 = false; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event235 = obj.nomeChecknomeVerso_04:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_04 = not sheet.fldCheck100_04;
            				
            				if(sheet.fldCheck100_04) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            				end;
            				
            				if(sheet.fldCheck100_05) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = false; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event236 = obj.nomeChecknomeVerso_05:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_05 = not sheet.fldCheck100_05;
            				
            				if(sheet.fldCheck100_05) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false;
            				end;
            				
            				if(sheet.fldCheck100_06) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event237 = obj.nomeChecknomeVerso_06:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_06 = not sheet.fldCheck100_06;
            				
            				if(sheet.fldCheck100_06) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true;
            					sheet.fldCheck100_05 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false;
            					sheet.fldCheck100_05 = false;
            				end;
            				
            				if(sheet.fldCheck100_07) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event238 = obj.nomeChecknomeVerso_07:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_07 = not sheet.fldCheck100_07;
            				
            				if(sheet.fldCheck100_07) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true;
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false;
            					sheet.fldCheck100_05 = false;
            					sheet.fldCheck100_06 = false; 
            				end;
            				
            				if(sheet.fldCheck100_08) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = true; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event239 = obj.nomeChecknomeVerso_08:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_08 = not sheet.fldCheck100_08;
            				
            				if(sheet.fldCheck100_08) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true;
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false;
            					sheet.fldCheck100_05 = false;
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false;
            				end;
            				
            				if(sheet.fldCheck100_09) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = true; 
            					sheet.fldCheck100_08 = true; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event240 = obj.nomeChecknomeVerso_09:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_09 = not sheet.fldCheck100_09;
            				
            				if(sheet.fldCheck100_09) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true;
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = true; 
            					sheet.fldCheck100_08 = true; 
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false;
            					sheet.fldCheck100_05 = false;
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false;
            					sheet.fldCheck100_08 = false; 
            				end;
            				
            				if(sheet.fldCheck100_10) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true; 
            					sheet.fldCheck100_07 = true; 
            					sheet.fldCheck100_08 = true; 
            					sheet.fldCheck100_09 = true;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event241 = obj.nomeChecknomeVerso_10:addEventListener("onClick",
        function (_, event)
            
            				sheet.fldCheck100_10 = not sheet.fldCheck100_10;
            				
            				if(sheet.fldCheck100_10) then 
            					sheet.fldCheck100_01 = true; 
            					sheet.fldCheck100_02 = true; 
            					sheet.fldCheck100_03 = true; 
            					sheet.fldCheck100_04 = true; 
            					sheet.fldCheck100_05 = true; 
            					sheet.fldCheck100_06 = true;
            					sheet.fldCheck100_07 = true;
            					sheet.fldCheck100_08 = true;
            					sheet.fldCheck100_09 = true;    
            				else 
            					sheet.fldCheck100_01 = false; 
            					sheet.fldCheck100_02 = false; 
            					sheet.fldCheck100_03 = false; 
            					sheet.fldCheck100_04 = false; 
            					sheet.fldCheck100_06 = false; 
            					sheet.fldCheck100_07 = false; 
            					sheet.fldCheck100_08 = false; 
            					sheet.fldCheck100_09 = false;
            					sheet.fldCheck100_10 = false;  
            				end;
            			
        end, obj);

    obj._e_event242 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet==nil) then return; end;
            																CalcSangue();
        end, obj);

    function obj:_releaseEvents()
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

        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.nomeCheck35_02 ~= nil then self.nomeCheck35_02:destroy(); self.nomeCheck35_02 = nil; end;
        if self.nomeCheck21_05 ~= nil then self.nomeCheck21_05:destroy(); self.nomeCheck21_05 = nil; end;
        if self.nomeChecknome101_10 ~= nil then self.nomeChecknome101_10:destroy(); self.nomeChecknome101_10 = nil; end;
        if self.nomeCheck02_01 ~= nil then self.nomeCheck02_01:destroy(); self.nomeCheck02_01 = nil; end;
        if self.flowPart116 ~= nil then self.flowPart116:destroy(); self.flowPart116 = nil; end;
        if self.rclArmas ~= nil then self.rclArmas:destroy(); self.rclArmas = nil; end;
        if self.sanggnosisCS ~= nil then self.sanggnosisCS:destroy(); self.sanggnosisCS = nil; end;
        if self.nomeCheck28_04 ~= nil then self.nomeCheck28_04:destroy(); self.nomeCheck28_04 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.nomeCheck13_02 ~= nil then self.nomeCheck13_02:destroy(); self.nomeCheck13_02 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.flowPart150 ~= nil then self.flowPart150:destroy(); self.flowPart150 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.nomeCheck05_03 ~= nil then self.nomeCheck05_03:destroy(); self.nomeCheck05_03 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.nomeCheck17_03 ~= nil then self.nomeCheck17_03:destroy(); self.nomeCheck17_03 = nil; end;
        if self.nomeCheck33_05 ~= nil then self.nomeCheck33_05:destroy(); self.nomeCheck33_05 = nil; end;
        if self.flowPart103 ~= nil then self.flowPart103:destroy(); self.flowPart103 = nil; end;
        if self.flowPart133 ~= nil then self.flowPart133:destroy(); self.flowPart133 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.horzLine23 ~= nil then self.horzLine23:destroy(); self.horzLine23 = nil; end;
        if self.flowLayout69 ~= nil then self.flowLayout69:destroy(); self.flowLayout69 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart202 ~= nil then self.flowPart202:destroy(); self.flowPart202 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.nomeChecknomeVerso_05 ~= nil then self.nomeChecknomeVerso_05:destroy(); self.nomeChecknomeVerso_05 = nil; end;
        if self.nomeCheck03_01 ~= nil then self.nomeCheck03_01:destroy(); self.nomeCheck03_01 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.flowPart179 ~= nil then self.flowPart179:destroy(); self.flowPart179 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.nomeCheck10_03 ~= nil then self.nomeCheck10_03:destroy(); self.nomeCheck10_03 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart208 ~= nil then self.flowPart208:destroy(); self.flowPart208 = nil; end;
        if self.flowPart193 ~= nil then self.flowPart193:destroy(); self.flowPart193 = nil; end;
        if self.flowLayout67 ~= nil then self.flowLayout67:destroy(); self.flowLayout67 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.nomeCheck01_04 ~= nil then self.nomeCheck01_04:destroy(); self.nomeCheck01_04 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.nomeCheck16_02 ~= nil then self.nomeCheck16_02:destroy(); self.nomeCheck16_02 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.nomeCheck08_05 ~= nil then self.nomeCheck08_05:destroy(); self.nomeCheck08_05 = nil; end;
        if self.sanggnosisScour ~= nil then self.sanggnosisScour:destroy(); self.sanggnosisScour = nil; end;
        if self.flowLayout52 ~= nil then self.flowLayout52:destroy(); self.flowLayout52 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.nomeCheck34_05 ~= nil then self.nomeCheck34_05:destroy(); self.nomeCheck34_05 = nil; end;
        if self.flowPart124 ~= nil then self.flowPart124:destroy(); self.flowPart124 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.nomeCheck04_03 ~= nil then self.nomeCheck04_03:destroy(); self.nomeCheck04_03 = nil; end;
        if self.nomeCheck24_01 ~= nil then self.nomeCheck24_01:destroy(); self.nomeCheck24_01 = nil; end;
        if self.flowPart162 ~= nil then self.flowPart162:destroy(); self.flowPart162 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.nomeChecknome100_03 ~= nil then self.nomeChecknome100_03:destroy(); self.nomeChecknome100_03 = nil; end;
        if self.nomeCheck19_02 ~= nil then self.nomeCheck19_02:destroy(); self.nomeCheck19_02 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.nomeCheck30_02 ~= nil then self.nomeCheck30_02:destroy(); self.nomeCheck30_02 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.flowPart147 ~= nil then self.flowPart147:destroy(); self.flowPart147 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.flowPart168 ~= nil then self.flowPart168:destroy(); self.flowPart168 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.flowLayout75 ~= nil then self.flowLayout75:destroy(); self.flowLayout75 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.flowLayout84 ~= nil then self.flowLayout84:destroy(); self.flowLayout84 = nil; end;
        if self.nomeCheck25_01 ~= nil then self.nomeCheck25_01:destroy(); self.nomeCheck25_01 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.nomeCheck06_05 ~= nil then self.nomeCheck06_05:destroy(); self.nomeCheck06_05 = nil; end;
        if self.nomeCheck22_03 ~= nil then self.nomeCheck22_03:destroy(); self.nomeCheck22_03 = nil; end;
        if self.flowLayout33 ~= nil then self.flowLayout33:destroy(); self.flowLayout33 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.flowPart149 ~= nil then self.flowPart149:destroy(); self.flowPart149 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.nomeCheck32_03 ~= nil then self.nomeCheck32_03:destroy(); self.nomeCheck32_03 = nil; end;
        if self.flowPart119 ~= nil then self.flowPart119:destroy(); self.flowPart119 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.nomeCheck09_02 ~= nil then self.nomeCheck09_02:destroy(); self.nomeCheck09_02 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.flowLayout39 ~= nil then self.flowLayout39:destroy(); self.flowLayout39 = nil; end;
        if self.nomeCheck02_04 ~= nil then self.nomeCheck02_04:destroy(); self.nomeCheck02_04 = nil; end;
        if self.flowPart113 ~= nil then self.flowPart113:destroy(); self.flowPart113 = nil; end;
        if self.flowPart186 ~= nil then self.flowPart186:destroy(); self.flowPart186 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.nomeCheck13_05 ~= nil then self.nomeCheck13_05:destroy(); self.nomeCheck13_05 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.flowPart155 ~= nil then self.flowPart155:destroy(); self.flowPart155 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLayout47 ~= nil then self.flowLayout47:destroy(); self.flowLayout47 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.horzLine24 ~= nil then self.horzLine24:destroy(); self.horzLine24 = nil; end;
        if self.nomeCheck03_02 ~= nil then self.nomeCheck03_02:destroy(); self.nomeCheck03_02 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.rclpraxis ~= nil then self.rclpraxis:destroy(); self.rclpraxis = nil; end;
        if self.nomeCheck31_02 ~= nil then self.nomeCheck31_02:destroy(); self.nomeCheck31_02 = nil; end;
        if self.flowPart215 ~= nil then self.flowPart215:destroy(); self.flowPart215 = nil; end;
        if self.nomeCheck17_04 ~= nil then self.nomeCheck17_04:destroy(); self.nomeCheck17_04 = nil; end;
        if self.nomeCheck33_02 ~= nil then self.nomeCheck33_02:destroy(); self.nomeCheck33_02 = nil; end;
        if self.flowPart108 ~= nil then self.flowPart108:destroy(); self.flowPart108 = nil; end;
        if self.flowLayout62 ~= nil then self.flowLayout62:destroy(); self.flowLayout62 = nil; end;
        if self.flowPart190 ~= nil then self.flowPart190:destroy(); self.flowPart190 = nil; end;
        if self.flowPart205 ~= nil then self.flowPart205:destroy(); self.flowPart205 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.flowPart170 ~= nil then self.flowPart170:destroy(); self.flowPart170 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.nomeChecknome101_05 ~= nil then self.nomeChecknome101_05:destroy(); self.nomeChecknome101_05 = nil; end;
        if self.nomeVER_Personalidade ~= nil then self.nomeVER_Personalidade:destroy(); self.nomeVER_Personalidade = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.nomeCheck20_03 ~= nil then self.nomeCheck20_03:destroy(); self.nomeCheck20_03 = nil; end;
        if self.nomeCheck01_03 ~= nil then self.nomeCheck01_03:destroy(); self.nomeCheck01_03 = nil; end;
        if self.flowPart127 ~= nil then self.flowPart127:destroy(); self.flowPart127 = nil; end;
        if self.nomeCheck16_05 ~= nil then self.nomeCheck16_05:destroy(); self.nomeCheck16_05 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.nomeCheck08_02 ~= nil then self.nomeCheck08_02:destroy(); self.nomeCheck08_02 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.flowLayout59 ~= nil then self.flowLayout59:destroy(); self.flowLayout59 = nil; end;
        if self.flowPart165 ~= nil then self.flowPart165:destroy(); self.flowPart165 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.nomeChecknome100_06 ~= nil then self.nomeChecknome100_06:destroy(); self.nomeChecknome100_06 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.nomeCheck19_01 ~= nil then self.nomeCheck19_01:destroy(); self.nomeCheck19_01 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.sanggnosisArcana ~= nil then self.sanggnosisArcana:destroy(); self.sanggnosisArcana = nil; end;
        if self.nomeCheck_09 ~= nil then self.nomeCheck_09:destroy(); self.nomeCheck_09 = nil; end;
        if self.nomeChecknome100_08 ~= nil then self.nomeChecknome100_08:destroy(); self.nomeChecknome100_08 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.nomeCheck07_03 ~= nil then self.nomeCheck07_03:destroy(); self.nomeCheck07_03 = nil; end;
        if self.nomeCheck23_05 ~= nil then self.nomeCheck23_05:destroy(); self.nomeCheck23_05 = nil; end;
        if self.flowLayout76 ~= nil then self.flowLayout76:destroy(); self.flowLayout76 = nil; end;
        if self.layVerso ~= nil then self.layVerso:destroy(); self.layVerso = nil; end;
        if self.sanggnosisRitual ~= nil then self.sanggnosisRitual:destroy(); self.sanggnosisRitual = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.nomeCheck25_02 ~= nil then self.nomeCheck25_02:destroy(); self.nomeCheck25_02 = nil; end;
        if self.flowLayout26 ~= nil then self.flowLayout26:destroy(); self.flowLayout26 = nil; end;
        if self.flowLayout34 ~= nil then self.flowLayout34:destroy(); self.flowLayout34 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.rclinspells ~= nil then self.rclinspells:destroy(); self.rclinspells = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.nomeCheck_03 ~= nil then self.nomeCheck_03:destroy(); self.nomeCheck_03 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.nomeCheck29_05 ~= nil then self.nomeCheck29_05:destroy(); self.nomeCheck29_05 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.nomeCheck12_01 ~= nil then self.nomeCheck12_01:destroy(); self.nomeCheck12_01 = nil; end;
        if self.flowPart110 ~= nil then self.flowPart110:destroy(); self.flowPart110 = nil; end;
        if self.flowLayout48 ~= nil then self.flowLayout48:destroy(); self.flowLayout48 = nil; end;
        if self.flowPart185 ~= nil then self.flowPart185:destroy(); self.flowPart185 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.nomeCheck14_04 ~= nil then self.nomeCheck14_04:destroy(); self.nomeCheck14_04 = nil; end;
        if self.nomeCheck21_01 ~= nil then self.nomeCheck21_01:destroy(); self.nomeCheck21_01 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.flowLayout42 ~= nil then self.flowLayout42:destroy(); self.flowLayout42 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.flowPart139 ~= nil then self.flowPart139:destroy(); self.flowPart139 = nil; end;
        if self.horzLine29 ~= nil then self.horzLine29:destroy(); self.horzLine29 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.nomeCheck10_05 ~= nil then self.nomeCheck10_05:destroy(); self.nomeCheck10_05 = nil; end;
        if self.nomeCheck31_05 ~= nil then self.nomeCheck31_05:destroy(); self.nomeCheck31_05 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.nomeCheck33_01 ~= nil then self.nomeCheck33_01:destroy(); self.nomeCheck33_01 = nil; end;
        if self.flowPart137 ~= nil then self.flowPart137:destroy(); self.flowPart137 = nil; end;
        if self.flowPart107 ~= nil then self.flowPart107:destroy(); self.flowPart107 = nil; end;
        if self.flowPart206 ~= nil then self.flowPart206:destroy(); self.flowPart206 = nil; end;
        if self.flowPart210 ~= nil then self.flowPart210:destroy(); self.flowPart210 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.flowPart175 ~= nil then self.flowPart175:destroy(); self.flowPart175 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.nomeChecknome100_10 ~= nil then self.nomeChecknome100_10:destroy(); self.nomeChecknome100_10 = nil; end;
        if self.flowPart197 ~= nil then self.flowPart197:destroy(); self.flowPart197 = nil; end;
        if self.nomeCheck34_03 ~= nil then self.nomeCheck34_03:destroy(); self.nomeCheck34_03 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart122 ~= nil then self.flowPart122:destroy(); self.flowPart122 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.horzLine32 ~= nil then self.horzLine32:destroy(); self.horzLine32 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.nomeCheck08_01 ~= nil then self.nomeCheck08_01:destroy(); self.nomeCheck08_01 = nil; end;
        if self.flowLayout56 ~= nil then self.flowLayout56:destroy(); self.flowLayout56 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.nomeChecknome100_05 ~= nil then self.nomeChecknome100_05:destroy(); self.nomeChecknome100_05 = nil; end;
        if self.nomeCheck19_04 ~= nil then self.nomeCheck19_04:destroy(); self.nomeCheck19_04 = nil; end;
        if self.horzLine17 ~= nil then self.horzLine17:destroy(); self.horzLine17 = nil; end;
        if self.nomeCheck26_02 ~= nil then self.nomeCheck26_02:destroy(); self.nomeCheck26_02 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.flowPart128 ~= nil then self.flowPart128:destroy(); self.flowPart128 = nil; end;
        if self.nomeCheck24_05 ~= nil then self.nomeCheck24_05:destroy(); self.nomeCheck24_05 = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.flowLayout73 ~= nil then self.flowLayout73:destroy(); self.flowLayout73 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.horzLine19 ~= nil then self.horzLine19:destroy(); self.horzLine19 = nil; end;
        if self.nomeCheck15_04 ~= nil then self.nomeCheck15_04:destroy(); self.nomeCheck15_04 = nil; end;
        if self.rclLegacy ~= nil then self.rclLegacy:destroy(); self.rclLegacy = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.flowLayout29 ~= nil then self.flowLayout29:destroy(); self.flowLayout29 = nil; end;
        if self.flowPart143 ~= nil then self.flowPart143:destroy(); self.flowPart143 = nil; end;
        if self.nomeCheck06_03 ~= nil then self.nomeCheck06_03:destroy(); self.nomeCheck06_03 = nil; end;
        if self.nomeCheck22_05 ~= nil then self.nomeCheck22_05:destroy(); self.nomeCheck22_05 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.nomeCheck32_05 ~= nil then self.nomeCheck32_05:destroy(); self.nomeCheck32_05 = nil; end;
        if self.nomeCheck_06 ~= nil then self.nomeCheck_06:destroy(); self.nomeCheck_06 = nil; end;
        if self.nomeCheck_10 ~= nil then self.nomeCheck_10:destroy(); self.nomeCheck_10 = nil; end;
        if self.flowLayout79 ~= nil then self.flowLayout79:destroy(); self.flowLayout79 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.nomeCheck09_04 ~= nil then self.nomeCheck09_04:destroy(); self.nomeCheck09_04 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowLayout80 ~= nil then self.flowLayout80:destroy(); self.flowLayout80 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.nomeCheck25_05 ~= nil then self.nomeCheck25_05:destroy(); self.nomeCheck25_05 = nil; end;
        if self.nomeCheck12_02 ~= nil then self.nomeCheck12_02:destroy(); self.nomeCheck12_02 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.flowPart180 ~= nil then self.flowPart180:destroy(); self.flowPart180 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.nomeCheck14_01 ~= nil then self.nomeCheck14_01:destroy(); self.nomeCheck14_01 = nil; end;
        if self.nomeCheck35_01 ~= nil then self.nomeCheck35_01:destroy(); self.nomeCheck35_01 = nil; end;
        if self.nomeCheck21_02 ~= nil then self.nomeCheck21_02:destroy(); self.nomeCheck21_02 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.flowPart117 ~= nil then self.flowPart117:destroy(); self.flowPart117 = nil; end;
        if self.flowLayout41 ~= nil then self.flowLayout41:destroy(); self.flowLayout41 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.nomeCheck28_03 ~= nil then self.nomeCheck28_03:destroy(); self.nomeCheck28_03 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.nomeCheck13_01 ~= nil then self.nomeCheck13_01:destroy(); self.nomeCheck13_01 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.flowPart151 ~= nil then self.flowPart151:destroy(); self.flowPart151 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.nomeCheck05_04 ~= nil then self.nomeCheck05_04:destroy(); self.nomeCheck05_04 = nil; end;
        if self.flowPart213 ~= nil then self.flowPart213:destroy(); self.flowPart213 = nil; end;
        if self.nomeCheck17_02 ~= nil then self.nomeCheck17_02:destroy(); self.nomeCheck17_02 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.nomeCheck33_04 ~= nil then self.nomeCheck33_04:destroy(); self.nomeCheck33_04 = nil; end;
        if self.flowPart102 ~= nil then self.flowPart102:destroy(); self.flowPart102 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.flowPart130 ~= nil then self.flowPart130:destroy(); self.flowPart130 = nil; end;
        if self.horzLine20 ~= nil then self.horzLine20:destroy(); self.horzLine20 = nil; end;
        if self.flowLayout68 ~= nil then self.flowLayout68:destroy(); self.flowLayout68 = nil; end;
        if self.flowPart203 ~= nil then self.flowPart203:destroy(); self.flowPart203 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.nomeChecknomeVerso_04 ~= nil then self.nomeChecknomeVerso_04:destroy(); self.nomeChecknomeVerso_04 = nil; end;
        if self.flowPart176 ~= nil then self.flowPart176:destroy(); self.flowPart176 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.flowPart209 ~= nil then self.flowPart209:destroy(); self.flowPart209 = nil; end;
        if self.flowPart194 ~= nil then self.flowPart194:destroy(); self.flowPart194 = nil; end;
        if self.flowLayout66 ~= nil then self.flowLayout66:destroy(); self.flowLayout66 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.nomeCheck01_05 ~= nil then self.nomeCheck01_05:destroy(); self.nomeCheck01_05 = nil; end;
        if self.nomeCheck16_03 ~= nil then self.nomeCheck16_03:destroy(); self.nomeCheck16_03 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.nomeChecknome101_01 ~= nil then self.nomeChecknome101_01:destroy(); self.nomeChecknome101_01 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.sanggnosisParadox ~= nil then self.sanggnosisParadox:destroy(); self.sanggnosisParadox = nil; end;
        if self.nomeCheck08_04 ~= nil then self.nomeCheck08_04:destroy(); self.nomeCheck08_04 = nil; end;
        if self.flowLayout53 ~= nil then self.flowLayout53:destroy(); self.flowLayout53 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.nomeCheck26_01 ~= nil then self.nomeCheck26_01:destroy(); self.nomeCheck26_01 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.nomeCheck04_02 ~= nil then self.nomeCheck04_02:destroy(); self.nomeCheck04_02 = nil; end;
        if self.flowPart161 ~= nil then self.flowPart161:destroy(); self.flowPart161 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.nomeChecknome100_02 ~= nil then self.nomeChecknome100_02:destroy(); self.nomeChecknome100_02 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.nomeCheck15_03 ~= nil then self.nomeCheck15_03:destroy(); self.nomeCheck15_03 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.nomeCheck30_03 ~= nil then self.nomeCheck30_03:destroy(); self.nomeCheck30_03 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.flowPart146 ~= nil then self.flowPart146:destroy(); self.flowPart146 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.nomeCheck_05 ~= nil then self.nomeCheck_05:destroy(); self.nomeCheck_05 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.nomeCheck23_01 ~= nil then self.nomeCheck23_01:destroy(); self.nomeCheck23_01 = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.flowLayout30 ~= nil then self.flowLayout30:destroy(); self.flowLayout30 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.layFrente ~= nil then self.layFrente:destroy(); self.layFrente = nil; end;
        if self.nomeCheck06_04 ~= nil then self.nomeCheck06_04:destroy(); self.nomeCheck06_04 = nil; end;
        if self.nomeCheck22_02 ~= nil then self.nomeCheck22_02:destroy(); self.nomeCheck22_02 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.flowPart148 ~= nil then self.flowPart148:destroy(); self.flowPart148 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.nomeCheck09_03 ~= nil then self.nomeCheck09_03:destroy(); self.nomeCheck09_03 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.nomeCheck29_01 ~= nil then self.nomeCheck29_01:destroy(); self.nomeCheck29_01 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.layNote ~= nil then self.layNote:destroy(); self.layNote = nil; end;
        if self.nomeCheck02_03 ~= nil then self.nomeCheck02_03:destroy(); self.nomeCheck02_03 = nil; end;
        if self.flowPart114 ~= nil then self.flowPart114:destroy(); self.flowPart114 = nil; end;
        if self.flowPart156 ~= nil then self.flowPart156:destroy(); self.flowPart156 = nil; end;
        if self.nomeCheck13_04 ~= nil then self.nomeCheck13_04:destroy(); self.nomeCheck13_04 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.nomeChecknomeVerso_09 ~= nil then self.nomeChecknomeVerso_09:destroy(); self.nomeChecknomeVerso_09 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.flowLayout46 ~= nil then self.flowLayout46:destroy(); self.flowLayout46 = nil; end;
        if self.nomeCheck05_01 ~= nil then self.nomeCheck05_01:destroy(); self.nomeCheck05_01 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.horzLine25 ~= nil then self.horzLine25:destroy(); self.horzLine25 = nil; end;
        if self.nomeChecknomeVerso_03 ~= nil then self.nomeChecknomeVerso_03:destroy(); self.nomeChecknomeVerso_03 = nil; end;
        if self.nomeCheck03_03 ~= nil then self.nomeCheck03_03:destroy(); self.nomeCheck03_03 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.nomeCheck10_01 ~= nil then self.nomeCheck10_01:destroy(); self.nomeCheck10_01 = nil; end;
        if self.nomeCheck31_01 ~= nil then self.nomeCheck31_01:destroy(); self.nomeCheck31_01 = nil; end;
        if self.flowPart214 ~= nil then self.flowPart214:destroy(); self.flowPart214 = nil; end;
        if self.flowPart191 ~= nil then self.flowPart191:destroy(); self.flowPart191 = nil; end;
        if self.flowLayout61 ~= nil then self.flowLayout61:destroy(); self.flowLayout61 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.flowPart171 ~= nil then self.flowPart171:destroy(); self.flowPart171 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.nomeChecknome101_06 ~= nil then self.nomeChecknome101_06:destroy(); self.nomeChecknome101_06 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.flowLayout50 ~= nil then self.flowLayout50:destroy(); self.flowLayout50 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.nomeCheck20_02 ~= nil then self.nomeCheck20_02:destroy(); self.nomeCheck20_02 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.flowPart126 ~= nil then self.flowPart126:destroy(); self.flowPart126 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.nomeCheck04_01 ~= nil then self.nomeCheck04_01:destroy(); self.nomeCheck04_01 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.nomeCheck24_03 ~= nil then self.nomeCheck24_03:destroy(); self.nomeCheck24_03 = nil; end;
        if self.flowPart164 ~= nil then self.flowPart164:destroy(); self.flowPart164 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.nomeChecknome100_01 ~= nil then self.nomeChecknome100_01:destroy(); self.nomeChecknome100_01 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.nomeCheck30_04 ~= nil then self.nomeCheck30_04:destroy(); self.nomeCheck30_04 = nil; end;
        if self.flowPart145 ~= nil then self.flowPart145:destroy(); self.flowPart145 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.nomeCheck_08 ~= nil then self.nomeCheck_08:destroy(); self.nomeCheck_08 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.flowLayout77 ~= nil then self.flowLayout77:destroy(); self.flowLayout77 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.nomeCheck25_03 ~= nil then self.nomeCheck25_03:destroy(); self.nomeCheck25_03 = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.flowLayout35 ~= nil then self.flowLayout35:destroy(); self.flowLayout35 = nil; end;
        if self.nomeCheck22_01 ~= nil then self.nomeCheck22_01:destroy(); self.nomeCheck22_01 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.nomeCheck32_01 ~= nil then self.nomeCheck32_01:destroy(); self.nomeCheck32_01 = nil; end;
        if self.nomeCheck_02 ~= nil then self.nomeCheck_02:destroy(); self.nomeCheck_02 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.nomeCheck29_02 ~= nil then self.nomeCheck29_02:destroy(); self.nomeCheck29_02 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.nomeCheck11_03 ~= nil then self.nomeCheck11_03:destroy(); self.nomeCheck11_03 = nil; end;
        if self.flowPart111 ~= nil then self.flowPart111:destroy(); self.flowPart111 = nil; end;
        if self.flowPart184 ~= nil then self.flowPart184:destroy(); self.flowPart184 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.nomeCheck14_05 ~= nil then self.nomeCheck14_05:destroy(); self.nomeCheck14_05 = nil; end;
        if self.nomeCheck35_05 ~= nil then self.nomeCheck35_05:destroy(); self.nomeCheck35_05 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.flowLayout45 ~= nil then self.flowLayout45:destroy(); self.flowLayout45 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.horzLine26 ~= nil then self.horzLine26:destroy(); self.horzLine26 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.nomeChecknomeVerso_10 ~= nil then self.nomeChecknomeVerso_10:destroy(); self.nomeChecknomeVerso_10 = nil; end;
        if self.nomeCheck03_04 ~= nil then self.nomeCheck03_04:destroy(); self.nomeCheck03_04 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.nomeCheck31_04 ~= nil then self.nomeCheck31_04:destroy(); self.nomeCheck31_04 = nil; end;
        if self.flowPart217 ~= nil then self.flowPart217:destroy(); self.flowPart217 = nil; end;
        if self.flowPart207 ~= nil then self.flowPart207:destroy(); self.flowPart207 = nil; end;
        if self.flowPart134 ~= nil then self.flowPart134:destroy(); self.flowPart134 = nil; end;
        if self.flowPart106 ~= nil then self.flowPart106:destroy(); self.flowPart106 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.flowPart172 ~= nil then self.flowPart172:destroy(); self.flowPart172 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.flowPart198 ~= nil then self.flowPart198:destroy(); self.flowPart198 = nil; end;
        if self.nomeCheck20_05 ~= nil then self.nomeCheck20_05:destroy(); self.nomeCheck20_05 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.nomeCheck01_01 ~= nil then self.nomeCheck01_01:destroy(); self.nomeCheck01_01 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.flowPart121 ~= nil then self.flowPart121:destroy(); self.flowPart121 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.horzLine31 ~= nil then self.horzLine31:destroy(); self.horzLine31 = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.flowLayout57 ~= nil then self.flowLayout57:destroy(); self.flowLayout57 = nil; end;
        if self.flowPart167 ~= nil then self.flowPart167:destroy(); self.flowPart167 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.nomeChecknome100_04 ~= nil then self.nomeChecknome100_04:destroy(); self.nomeChecknome100_04 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.nomeCheck26_05 ~= nil then self.nomeCheck26_05:destroy(); self.nomeCheck26_05 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.nomeCheck24_04 ~= nil then self.nomeCheck24_04:destroy(); self.nomeCheck24_04 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.flowLayout70 ~= nil then self.flowLayout70:destroy(); self.flowLayout70 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.horzLine18 ~= nil then self.horzLine18:destroy(); self.horzLine18 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.flowLayout28 ~= nil then self.flowLayout28:destroy(); self.flowLayout28 = nil; end;
        if self.flowLayout36 ~= nil then self.flowLayout36:destroy(); self.flowLayout36 = nil; end;
        if self.nomeCheck06_02 ~= nil then self.nomeCheck06_02:destroy(); self.nomeCheck06_02 = nil; end;
        if self.nomeCheck22_04 ~= nil then self.nomeCheck22_04:destroy(); self.nomeCheck22_04 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart142 ~= nil then self.flowPart142:destroy(); self.flowPart142 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.nomeCheck_01 ~= nil then self.nomeCheck_01:destroy(); self.nomeCheck_01 = nil; end;
        if self.nomeCheck_11 ~= nil then self.nomeCheck_11:destroy(); self.nomeCheck_11 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.flowPart189 ~= nil then self.flowPart189:destroy(); self.flowPart189 = nil; end;
        if self.nomeCheck09_05 ~= nil then self.nomeCheck09_05:destroy(); self.nomeCheck09_05 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.sanggnosisTraitMax ~= nil then self.sanggnosisTraitMax:destroy(); self.sanggnosisTraitMax = nil; end;
        if self.flowLayout83 ~= nil then self.flowLayout83:destroy(); self.flowLayout83 = nil; end;
        if self.rclArcane ~= nil then self.rclArcane:destroy(); self.rclArcane = nil; end;
        if self.nomeCheck12_03 ~= nil then self.nomeCheck12_03:destroy(); self.nomeCheck12_03 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.flowPart183 ~= nil then self.flowPart183:destroy(); self.flowPart183 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.flowPart158 ~= nil then self.flowPart158:destroy(); self.flowPart158 = nil; end;
        if self.nomeCheck14_02 ~= nil then self.nomeCheck14_02:destroy(); self.nomeCheck14_02 = nil; end;
        if self.nomeCheck21_03 ~= nil then self.nomeCheck21_03:destroy(); self.nomeCheck21_03 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.flowLayout40 ~= nil then self.flowLayout40:destroy(); self.flowLayout40 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.nomeCheck28_02 ~= nil then self.nomeCheck28_02:destroy(); self.nomeCheck28_02 = nil; end;
        if self.flowPart152 ~= nil then self.flowPart152:destroy(); self.flowPart152 = nil; end;
        if self.frmTemplates ~= nil then self.frmTemplates:destroy(); self.frmTemplates = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.nomeCheck05_05 ~= nil then self.nomeCheck05_05:destroy(); self.nomeCheck05_05 = nil; end;
        if self.flowPart212 ~= nil then self.flowPart212:destroy(); self.flowPart212 = nil; end;
        if self.nomeCheck17_01 ~= nil then self.nomeCheck17_01:destroy(); self.nomeCheck17_01 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flowPart105 ~= nil then self.flowPart105:destroy(); self.flowPart105 = nil; end;
        if self.flowPart131 ~= nil then self.flowPart131:destroy(); self.flowPart131 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.horzLine21 ~= nil then self.horzLine21:destroy(); self.horzLine21 = nil; end;
        if self.flowPart200 ~= nil then self.flowPart200:destroy(); self.flowPart200 = nil; end;
        if self.nomeChecknomeVerso_07 ~= nil then self.nomeChecknomeVerso_07:destroy(); self.nomeChecknomeVerso_07 = nil; end;
        if self.flowPart177 ~= nil then self.flowPart177:destroy(); self.flowPart177 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.nomeChecknome101_08 ~= nil then self.nomeChecknome101_08:destroy(); self.nomeChecknome101_08 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.flowPart195 ~= nil then self.flowPart195:destroy(); self.flowPart195 = nil; end;
        if self.flowLayout65 ~= nil then self.flowLayout65:destroy(); self.flowLayout65 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.nomeChecknome101_02 ~= nil then self.nomeChecknome101_02:destroy(); self.nomeChecknome101_02 = nil; end;
        if self.flowLayout54 ~= nil then self.flowLayout54:destroy(); self.flowLayout54 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.nomeCheck04_05 ~= nil then self.nomeCheck04_05:destroy(); self.nomeCheck04_05 = nil; end;
        if self.flowPart160 ~= nil then self.flowPart160:destroy(); self.flowPart160 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.nomeCheck15_02 ~= nil then self.nomeCheck15_02:destroy(); self.nomeCheck15_02 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.flowPart141 ~= nil then self.flowPart141:destroy(); self.flowPart141 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.nomeCheck_04 ~= nil then self.nomeCheck_04:destroy(); self.nomeCheck_04 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.nomeCheck07_04 ~= nil then self.nomeCheck07_04:destroy(); self.nomeCheck07_04 = nil; end;
        if self.nomeCheck23_02 ~= nil then self.nomeCheck23_02:destroy(); self.nomeCheck23_02 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.flowLayout31 ~= nil then self.flowLayout31:destroy(); self.flowLayout31 = nil; end;
        if self.nomeCheck11_05 ~= nil then self.nomeCheck11_05:destroy(); self.nomeCheck11_05 = nil; end;
        if self.nomeCheck12_04 ~= nil then self.nomeCheck12_04:destroy(); self.nomeCheck12_04 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.nomeCheck35_03 ~= nil then self.nomeCheck35_03:destroy(); self.nomeCheck35_03 = nil; end;
        if self.nomeCheck21_04 ~= nil then self.nomeCheck21_04:destroy(); self.nomeCheck21_04 = nil; end;
        if self.nomeCheck02_02 ~= nil then self.nomeCheck02_02:destroy(); self.nomeCheck02_02 = nil; end;
        if self.flowPart115 ~= nil then self.flowPart115:destroy(); self.flowPart115 = nil; end;
        if self.nomeCheck28_05 ~= nil then self.nomeCheck28_05:destroy(); self.nomeCheck28_05 = nil; end;
        if self.flowPart157 ~= nil then self.flowPart157:destroy(); self.flowPart157 = nil; end;
        if self.nomeCheck13_03 ~= nil then self.nomeCheck13_03:destroy(); self.nomeCheck13_03 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.nomeChecknomeVerso_08 ~= nil then self.nomeChecknomeVerso_08:destroy(); self.nomeChecknomeVerso_08 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.nomeCheck05_02 ~= nil then self.nomeCheck05_02:destroy(); self.nomeCheck05_02 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.flowPart132 ~= nil then self.flowPart132:destroy(); self.flowPart132 = nil; end;
        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.horzLine22 ~= nil then self.horzLine22:destroy(); self.horzLine22 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.nomeChecknomeVerso_02 ~= nil then self.nomeChecknomeVerso_02:destroy(); self.nomeChecknomeVerso_02 = nil; end;
        if self.flowPart178 ~= nil then self.flowPart178:destroy(); self.flowPart178 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.nomeCheck10_02 ~= nil then self.nomeCheck10_02:destroy(); self.nomeCheck10_02 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.flowPart192 ~= nil then self.flowPart192:destroy(); self.flowPart192 = nil; end;
        if self.flowLayout60 ~= nil then self.flowLayout60:destroy(); self.flowLayout60 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.nomeChecknome101_07 ~= nil then self.nomeChecknome101_07:destroy(); self.nomeChecknome101_07 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.flowLayout51 ~= nil then self.flowLayout51:destroy(); self.flowLayout51 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.nomeCheck20_01 ~= nil then self.nomeCheck20_01:destroy(); self.nomeCheck20_01 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.nomeCheck34_04 ~= nil then self.nomeCheck34_04:destroy(); self.nomeCheck34_04 = nil; end;
        if self.flowPart125 ~= nil then self.flowPart125:destroy(); self.flowPart125 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.nomeCheck24_02 ~= nil then self.nomeCheck24_02:destroy(); self.nomeCheck24_02 = nil; end;
        if self.flowPart163 ~= nil then self.flowPart163:destroy(); self.flowPart163 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.nomeCheck19_03 ~= nil then self.nomeCheck19_03:destroy(); self.nomeCheck19_03 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.nomeCheck15_01 ~= nil then self.nomeCheck15_01:destroy(); self.nomeCheck15_01 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.nomeCheck30_05 ~= nil then self.nomeCheck30_05:destroy(); self.nomeCheck30_05 = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.flowPart144 ~= nil then self.flowPart144:destroy(); self.flowPart144 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.flowPart169 ~= nil then self.flowPart169:destroy(); self.flowPart169 = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.sanggnosisYantra ~= nil then self.sanggnosisYantra:destroy(); self.sanggnosisYantra = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.flowLayout74 ~= nil then self.flowLayout74:destroy(); self.flowLayout74 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.nomeCheck07_01 ~= nil then self.nomeCheck07_01:destroy(); self.nomeCheck07_01 = nil; end;
        if self.flowLayout85 ~= nil then self.flowLayout85:destroy(); self.flowLayout85 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.flowLayout32 ~= nil then self.flowLayout32:destroy(); self.flowLayout32 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.nomeCheck32_02 ~= nil then self.nomeCheck32_02:destroy(); self.nomeCheck32_02 = nil; end;
        if self.flowPart118 ~= nil then self.flowPart118:destroy(); self.flowPart118 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.nomeCheck09_01 ~= nil then self.nomeCheck09_01:destroy(); self.nomeCheck09_01 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.nomeCheck29_03 ~= nil then self.nomeCheck29_03:destroy(); self.nomeCheck29_03 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.flowLayout38 ~= nil then self.flowLayout38:destroy(); self.flowLayout38 = nil; end;
        if self.nomeCheck11_02 ~= nil then self.nomeCheck11_02:destroy(); self.nomeCheck11_02 = nil; end;
        if self.rclArcana ~= nil then self.rclArcana:destroy(); self.rclArcana = nil; end;
        if self.nomeCheck02_05 ~= nil then self.nomeCheck02_05:destroy(); self.nomeCheck02_05 = nil; end;
        if self.flowPart112 ~= nil then self.flowPart112:destroy(); self.flowPart112 = nil; end;
        if self.flowPart187 ~= nil then self.flowPart187:destroy(); self.flowPart187 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.flowPart154 ~= nil then self.flowPart154:destroy(); self.flowPart154 = nil; end;
        if self.nomeCheck35_04 ~= nil then self.nomeCheck35_04:destroy(); self.nomeCheck35_04 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.flowLayout44 ~= nil then self.flowLayout44:destroy(); self.flowLayout44 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.sanggnosisMPR ~= nil then self.sanggnosisMPR:destroy(); self.sanggnosisMPR = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.horzLine27 ~= nil then self.horzLine27:destroy(); self.horzLine27 = nil; end;
        if self.nomeChecknomeVerso_01 ~= nil then self.nomeChecknomeVerso_01:destroy(); self.nomeChecknomeVerso_01 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layPersonagem ~= nil then self.layPersonagem:destroy(); self.layPersonagem = nil; end;
        if self.nomeCheck03_05 ~= nil then self.nomeCheck03_05:destroy(); self.nomeCheck03_05 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.nomeCheck31_03 ~= nil then self.nomeCheck31_03:destroy(); self.nomeCheck31_03 = nil; end;
        if self.flowPart216 ~= nil then self.flowPart216:destroy(); self.flowPart216 = nil; end;
        if self.nomeCheck17_05 ~= nil then self.nomeCheck17_05:destroy(); self.nomeCheck17_05 = nil; end;
        if self.nomeCheck33_03 ~= nil then self.nomeCheck33_03:destroy(); self.nomeCheck33_03 = nil; end;
        if self.flowPart109 ~= nil then self.flowPart109:destroy(); self.flowPart109 = nil; end;
        if self.flowPart135 ~= nil then self.flowPart135:destroy(); self.flowPart135 = nil; end;
        if self.flowLayout63 ~= nil then self.flowLayout63:destroy(); self.flowLayout63 = nil; end;
        if self.flowPart204 ~= nil then self.flowPart204:destroy(); self.flowPart204 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.flowPart173 ~= nil then self.flowPart173:destroy(); self.flowPart173 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.nomeChecknome101_04 ~= nil then self.nomeChecknome101_04:destroy(); self.nomeChecknome101_04 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.flowPart199 ~= nil then self.flowPart199:destroy(); self.flowPart199 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.nomeCheck20_04 ~= nil then self.nomeCheck20_04:destroy(); self.nomeCheck20_04 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.nomeCheck34_01 ~= nil then self.nomeCheck34_01:destroy(); self.nomeCheck34_01 = nil; end;
        if self.nomeCheck01_02 ~= nil then self.nomeCheck01_02:destroy(); self.nomeCheck01_02 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowPart120 ~= nil then self.flowPart120:destroy(); self.flowPart120 = nil; end;
        if self.nomeCheck16_04 ~= nil then self.nomeCheck16_04:destroy(); self.nomeCheck16_04 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.horzLine30 ~= nil then self.horzLine30:destroy(); self.horzLine30 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.nomeCheck08_03 ~= nil then self.nomeCheck08_03:destroy(); self.nomeCheck08_03 = nil; end;
        if self.flowLayout58 ~= nil then self.flowLayout58:destroy(); self.flowLayout58 = nil; end;
        if self.flowPart166 ~= nil then self.flowPart166:destroy(); self.flowPart166 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.nomeChecknome100_07 ~= nil then self.nomeChecknome100_07:destroy(); self.nomeChecknome100_07 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.nomeCheck26_04 ~= nil then self.nomeCheck26_04:destroy(); self.nomeCheck26_04 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowLayout71 ~= nil then self.flowLayout71:destroy(); self.flowLayout71 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.nomeChecknome100_09 ~= nil then self.nomeChecknome100_09:destroy(); self.nomeChecknome100_09 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.nomeCheck07_02 ~= nil then self.nomeCheck07_02:destroy(); self.nomeCheck07_02 = nil; end;
        if self.nomeCheck23_04 ~= nil then self.nomeCheck23_04:destroy(); self.nomeCheck23_04 = nil; end;
        if self.nomeBG ~= nil then self.nomeBG:destroy(); self.nomeBG = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.flowLayout27 ~= nil then self.flowLayout27:destroy(); self.flowLayout27 = nil; end;
        if self.flowLayout37 ~= nil then self.flowLayout37:destroy(); self.flowLayout37 = nil; end;
        if self.nomeCheck06_01 ~= nil then self.nomeCheck06_01:destroy(); self.nomeCheck06_01 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.nomeCheck_12 ~= nil then self.nomeCheck_12:destroy(); self.nomeCheck_12 = nil; end;
        if self.flowPart188 ~= nil then self.flowPart188:destroy(); self.flowPart188 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.nomeCheck29_04 ~= nil then self.nomeCheck29_04:destroy(); self.nomeCheck29_04 = nil; end;
        if self.flowLayout82 ~= nil then self.flowLayout82:destroy(); self.flowLayout82 = nil; end;
        if self.nomeCheck11_01 ~= nil then self.nomeCheck11_01:destroy(); self.nomeCheck11_01 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.flowLayout49 ~= nil then self.flowLayout49:destroy(); self.flowLayout49 = nil; end;
        if self.rclactspells ~= nil then self.rclactspells:destroy(); self.rclactspells = nil; end;
        if self.flowPart182 ~= nil then self.flowPart182:destroy(); self.flowPart182 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.flowPart159 ~= nil then self.flowPart159:destroy(); self.flowPart159 = nil; end;
        if self.nomeCheck14_03 ~= nil then self.nomeCheck14_03:destroy(); self.nomeCheck14_03 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.flowLayout43 ~= nil then self.flowLayout43:destroy(); self.flowLayout43 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.flowPart138 ~= nil then self.flowPart138:destroy(); self.flowPart138 = nil; end;
        if self.nomeCheck28_01 ~= nil then self.nomeCheck28_01:destroy(); self.nomeCheck28_01 = nil; end;
        if self.flowPart153 ~= nil then self.flowPart153:destroy(); self.flowPart153 = nil; end;
        if self.horzLine28 ~= nil then self.horzLine28:destroy(); self.horzLine28 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.nomeCheck10_04 ~= nil then self.nomeCheck10_04:destroy(); self.nomeCheck10_04 = nil; end;
        if self.flowPart211 ~= nil then self.flowPart211:destroy(); self.flowPart211 = nil; end;
        if self.flowPart201 ~= nil then self.flowPart201:destroy(); self.flowPart201 = nil; end;
        if self.flowPart136 ~= nil then self.flowPart136:destroy(); self.flowPart136 = nil; end;
        if self.flowPart104 ~= nil then self.flowPart104:destroy(); self.flowPart104 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.sanggnosisObsessions ~= nil then self.sanggnosisObsessions:destroy(); self.sanggnosisObsessions = nil; end;
        if self.nomeChecknomeVerso_06 ~= nil then self.nomeChecknomeVerso_06:destroy(); self.nomeChecknomeVerso_06 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.flowPart174 ~= nil then self.flowPart174:destroy(); self.flowPart174 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.nomeChecknome101_09 ~= nil then self.nomeChecknome101_09:destroy(); self.nomeChecknome101_09 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowPart196 ~= nil then self.flowPart196:destroy(); self.flowPart196 = nil; end;
        if self.flowLayout64 ~= nil then self.flowLayout64:destroy(); self.flowLayout64 = nil; end;
        if self.nomeCheck34_02 ~= nil then self.nomeCheck34_02:destroy(); self.nomeCheck34_02 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.flowPart123 ~= nil then self.flowPart123:destroy(); self.flowPart123 = nil; end;
        if self.nomeCheck16_01 ~= nil then self.nomeCheck16_01:destroy(); self.nomeCheck16_01 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.nomeChecknome101_03 ~= nil then self.nomeChecknome101_03:destroy(); self.nomeChecknome101_03 = nil; end;
        if self.rclrotes ~= nil then self.rclrotes:destroy(); self.rclrotes = nil; end;
        if self.layMagias ~= nil then self.layMagias:destroy(); self.layMagias = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.flowLayout55 ~= nil then self.flowLayout55:destroy(); self.flowLayout55 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.nomeCheck19_05 ~= nil then self.nomeCheck19_05:destroy(); self.nomeCheck19_05 = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.nomeCheck26_03 ~= nil then self.nomeCheck26_03:destroy(); self.nomeCheck26_03 = nil; end;
        if self.flowPart129 ~= nil then self.flowPart129:destroy(); self.flowPart129 = nil; end;
        if self.rclMerits ~= nil then self.rclMerits:destroy(); self.rclMerits = nil; end;
        if self.nomeCheck04_04 ~= nil then self.nomeCheck04_04:destroy(); self.nomeCheck04_04 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.flowLayout72 ~= nil then self.flowLayout72:destroy(); self.flowLayout72 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.nomeCheck15_05 ~= nil then self.nomeCheck15_05:destroy(); self.nomeCheck15_05 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.nomeCheck30_01 ~= nil then self.nomeCheck30_01:destroy(); self.nomeCheck30_01 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.flowPart140 ~= nil then self.flowPart140:destroy(); self.flowPart140 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.nomeCheck32_04 ~= nil then self.nomeCheck32_04:destroy(); self.nomeCheck32_04 = nil; end;
        if self.nomeCheck_07 ~= nil then self.nomeCheck_07:destroy(); self.nomeCheck_07 = nil; end;
        if self.flowLayout78 ~= nil then self.flowLayout78:destroy(); self.flowLayout78 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.nomeCheck07_05 ~= nil then self.nomeCheck07_05:destroy(); self.nomeCheck07_05 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.nomeCheck23_03 ~= nil then self.nomeCheck23_03:destroy(); self.nomeCheck23_03 = nil; end;
        if self.nomeVER_FerramentaDedicada ~= nil then self.nomeVER_FerramentaDedicada:destroy(); self.nomeVER_FerramentaDedicada = nil; end;
        if self.flowLayout81 ~= nil then self.flowLayout81:destroy(); self.flowLayout81 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.nomeCheck25_04 ~= nil then self.nomeCheck25_04:destroy(); self.nomeCheck25_04 = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.nomeVER_Aparencia ~= nil then self.nomeVER_Aparencia:destroy(); self.nomeVER_Aparencia = nil; end;
        if self.nomeCheck11_04 ~= nil then self.nomeCheck11_04:destroy(); self.nomeCheck11_04 = nil; end;
        if self.nomeVER_Objetivos ~= nil then self.nomeVER_Objetivos:destroy(); self.nomeVER_Objetivos = nil; end;
        if self.nomeCheck12_05 ~= nil then self.nomeCheck12_05:destroy(); self.nomeCheck12_05 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.flowPart181 ~= nil then self.flowPart181:destroy(); self.flowPart181 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMtA2e()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMtA2e();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMtA2e = {
    newEditor = newfrmMtA2e, 
    new = newfrmMtA2e, 
    name = "frmMtA2e", 
    dataType = "Gatan.MageTheAwakening2e", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Mage the Awakening 2e", 
    description=""};

frmMtA2e = _frmMtA2e;
Firecast.registrarForm(_frmMtA2e);
Firecast.registrarDataType(_frmMtA2e);

return _frmMtA2e;
